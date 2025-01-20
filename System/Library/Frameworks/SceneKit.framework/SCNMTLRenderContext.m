@interface SCNMTLRenderContext
+ (uint64_t)registerBindings;
- (BOOL)collectsCompilationErrors;
- (BOOL)forceAsyncShaderCompilation;
- (BOOL)showsAuthoringEnvironment;
- (__n128)setScreenTransform:(uint64_t)a1;
- (const)createVolatileMeshElementOfType:(int)a3 primitiveCount:(uint64_t)a4 bytesPerIndex:;
- (double)beginRenderPass:(uint64_t)a3 renderEncoder:(uint64_t)a4 parameters:;
- (double)contentScaleFactor;
- (double)processRendererElements:(unsigned int)a3 count:(uint64_t)a4 engineIterationContext:;
- (double)renderTime;
- (double)screenTransform;
- (double)stopProcessingRendererElements:(uint64_t)a1;
- (float)_zFarForSkyboxRenderingProjectionMatrix:(const C3DMatrix4x4 *)a3 defaultZFar:;
- (float)setPreferredFramesPerSecond:(uint64_t)a1;
- (id).cxx_construct;
- (id)_newMTLBufferFromPoolWithLength:(unint64_t)a3;
- (id)commandBufferStatusMonitor;
- (id)resourceManagerMonitor;
- (id)setCommandBufferStatusMonitor:(id *)result;
- (id)setResourceManagerMonitor:(id *)result;
- (uint64_t)_allowGPUBackgroundExecution;
- (uint64_t)_clusterInfo;
- (uint64_t)_drawFullScreenTexture:(unsigned int)a3 over:;
- (uint64_t)_drawMeshElement:(uint64_t)a3 instanceCount:;
- (uint64_t)_drawPatchForMeshElement:(uint64_t)a3 instanceCount:;
- (uint64_t)_reflectionProbeArrayTexture;
- (uint64_t)_setMeshBuffers:(uint64_t)result;
- (uint64_t)_setReflectionProbeArrayTexture:(uint64_t)result;
- (uint64_t)_setSceneBufferAtVertexIndex:(uint64_t)a3 fragmentIndex:;
- (uint64_t)authoring_drawDeformersForNode:(uint64_t)a3 authoringEnvironment:;
- (uint64_t)clientCommandBuffer;
- (uint64_t)clientRenderCommandEncoder;
- (uint64_t)clientRenderPassDescriptor;
- (uint64_t)commandQueue;
- (uint64_t)compilationErrors;
- (uint64_t)cubeArrayTypeIfSupported;
- (uint64_t)currentCommandBuffer;
- (uint64_t)currentRenderCommandEncoder;
- (uint64_t)currentRenderPassDescriptor;
- (uint64_t)device;
- (uint64_t)disableLinearRendering;
- (uint64_t)drawFullScreenQuadForPass:(uint64_t)result;
- (uint64_t)drawWireframeOverlayForElements:(unsigned int)a3 range:(int)a4 store:(uint64_t)a5 passInstance:(unsigned __int8 *)a6;
- (uint64_t)enableARMode;
- (uint64_t)endFrameWaitingUntilCompleted:(void *)a3 status:(void *)a4 error:;
- (uint64_t)engineContext;
- (uint64_t)features;
- (uint64_t)frameConstantBufferPool;
- (uint64_t)frameTexturePool;
- (uint64_t)generatedTexturePath;
- (uint64_t)getCurrentPassHash;
- (uint64_t)getCurrentPassMaterial;
- (uint64_t)layerTarget;
- (uint64_t)mapVolatileMesh:(uint64_t)a3 verticesCount:;
- (uint64_t)popDebugGroup;
- (uint64_t)profile;
- (uint64_t)pushDebugGroup:(uint64_t)result;
- (uint64_t)radianceTextureForEffectSlot:(void *)a1;
- (uint64_t)renderEncoder;
- (uint64_t)renderSKSceneWithRenderer:(uint64_t)result overlay:(void *)a2 atTime:(unsigned int)a3;
- (uint64_t)resourceBlitEncoder;
- (uint64_t)resourceComputeEncoder;
- (uint64_t)resourceManager;
- (uint64_t)resourceQueue;
- (uint64_t)reverseZ;
- (uint64_t)sampleCount;
- (uint64_t)setContentScaleFactor:(uint64_t)result;
- (uint64_t)setCurrentPassHash:(uint64_t)result;
- (uint64_t)setCurrentPassMaterial:(uint64_t)result;
- (uint64_t)setDebugOptions:(uint64_t)result;
- (uint64_t)setEnableARMode:(uint64_t)result;
- (uint64_t)setForceAsyncShaderCompilation:(uint64_t)result;
- (uint64_t)setSampleCount:(uint64_t)result;
- (uint64_t)setShouldDelegateARCompositing:(uint64_t)result;
- (uint64_t)setShouldPresentAfterMinimumDuration:(uint64_t)result;
- (uint64_t)setShowsAuthoringEnvironment:(uint64_t)result;
- (uint64_t)shouldDelegateARCompositing;
- (uint64_t)textureForEffectSlot:(uint64_t)result;
- (uint64_t)textureTarget;
- (uint64_t)unmapVolatileMeshElement:(uint64_t)result;
- (uint64_t)wantsWideGamut;
- (void)_SCNSceneRendererMainPassCustomPostProcessSupportDrawSceneBackgroundUsingEncoder:(uint64_t)a3 commandBuffer:(uint64_t)a4 renderPassDescriptor:;
- (void)_clearUnusedBindingPoints;
- (void)_createResourceCommandBufferIfNeeded;
- (void)_drawPBRTextures;
- (void)_drawShadowMaps;
- (void)_executeDrawCommand:(id *)a3;
- (void)_finalRenderTexture;
- (void)_logLightingInformation;
- (void)_prepareMaterialTextures:(__C3DMaterial *)a3;
- (void)_recycleMTLBufferToPool:(id)a3;
- (void)_reduceStatsOfConstantBuffer:(id)a3;
- (void)_updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:(C3DMatrix4x4 *)a3;
- (void)addCommandBufferCompletedHandler:(uint64_t)a1;
- (void)addCommandBufferScheduledHandler:(uint64_t)a1;
- (void)addDrawablePresentedHandler:(uint64_t)a1;
- (void)authoring_drawPrimitives:(uint64_t)a3 vertexCount:(uint64_t)a4 instanceCount:(uint64_t)a5 vertexBuffers:(uint64_t)a6 offsets:(uint64_t)a7 range:(unint64_t)a8 vertexDescriptor:(void *)a9 withProgram:(uint64_t)a10 uniforms:(const void *)a11 uniformsLength:(size_t)a12 rasterizerStates:(uint64_t)a13 blendStates:(uint64_t)a14;
- (void)authoring_renderMesh:(uint64_t)a3 meshElement:(uint64_t)a4 withProgram:(const void *)a5 uniforms:(size_t)a6 uniformsLength:(uint64_t)a7 rasterizerStates:(uint64_t)a8 blendStates:(uint64_t)a9 texture:(char)a10 depthBias:;
- (void)beginFrame:(uint64_t)a1;
- (void)dealloc;
- (void)discardPendingCommandBufferCompletedHandlers;
- (void)discardPendingCommandBufferScheduledHandlers;
- (void)discardPendingDrawablePresentedHandlers;
- (void)drawRenderElement:(uint64_t)a3 withPass:;
- (void)endFrameSceneSpecifics;
- (void)endRenderPass;
- (void)initWithDevice:(uint64_t)a3 engineContext:;
- (void)irradianceTextureForEffectSlot:(void *)result;
- (void)renderBackground:(uint64_t)a3 engineContext:(uint64_t)a4 passInstance:;
- (void)renderVideoBackground:(__n128 *)a3 engineContext:(uint64_t)a4 slot:;
- (void)resetVolatileMeshElements;
- (void)resetVolatileMeshes;
- (void)resourceCommandBuffer;
- (void)setClientCommandBuffer:(void *)a1;
- (void)setClientCommandQueue:(void *)a1;
- (void)setClientRenderCommandEncoder:(void *)a1;
- (void)setClientRenderPassDescriptor:(void *)a1;
- (void)setCollectsCompilationErrors:(uint64_t)a1;
- (void)setDisableLinearRendering:(uint64_t)a1;
- (void)setGeneratedTexturePath:(void *)a1;
- (void)setIsOpaque:(uint64_t)a1;
- (void)setRasterizerStates:(uint64_t)a1;
- (void)setReverseZ:(uint64_t)a1;
- (void)setWantsWideGamut:(uint64_t)a1;
- (void)startProcessingRendererElementsWithEngineIterationContext:(uint64_t)a1;
- (void)unmapVolatileMesh:(uint64_t)a3 modifiedVerticesCount:;
- (void)writeBytes:(const void *)a3 length:(unint64_t)a4;
@end

@implementation SCNMTLRenderContext

- (uint64_t)_setMeshBuffers:(uint64_t)result
{
  v8[14] = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v3 = result;
    memset(v7, 0, sizeof(v7));
    unint64_t v4 = [(id)-[SCNMTLMesh buffers](a2) count];
    if (v4 >= 0xE) {
      unint64_t v5 = 14;
    }
    else {
      unint64_t v5 = v4;
    }
    objc_msgSend((id)-[SCNMTLMesh buffers](a2), "getObjects:range:", v8, 0, v5);
    if (-[SCNMTLMesh volatileBuffer](a2))
    {
      *((void *)v7 + v5) = -[SCNMTLMesh volatileOffset](a2);
      v8[v5++] = -[SCNMTLMesh volatileBuffer](a2);
    }
    uint64_t v6 = *(void *)(v3 + 248);
    if (v5 == 1) {
      return SCNMTLRenderCommandEncoder::setVertexBuffer(v6, v8[0], *(uint64_t *)&v7[0], 18);
    }
    else {
      return SCNMTLRenderCommandEncoder::setVertexBuffers(v6, (uint64_t)v8, (uint64_t)v7, 18, v5);
    }
  }
  return result;
}

+ (uint64_t)registerBindings
{
  self;
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"modelTransform" withBlock:&__block_literal_global_40];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"inverseModelTransform" withBlock:&__block_literal_global_133];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"modelViewTransform" withBlock:&__block_literal_global_138];
  if (C3DStandardShadersUseFunctionConstants()) {
    +[SCNMTLShaderBindingsGenerator registerSemantic:@"lightIndices" withBlock:&__block_literal_global_143];
  }
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"inverseModelViewTransform" withBlock:&__block_literal_global_150];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"normalTransform" withBlock:&__block_literal_global_156];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"modelViewProjectionTransform" withBlock:&__block_literal_global_162];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"lastFrameModelTransform" withBlock:&__block_literal_global_168];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"motionBlurIntensity" withBlock:&__block_literal_global_173];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"inverseModelViewProjectionTransform" withBlock:&__block_literal_global_178];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"boundingBox" withBlock:&__block_literal_global_183];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"worldBoundingBox" withBlock:&__block_literal_global_188];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"nodeOpacity" withBlock:&__block_literal_global_193];
  +[SCNMTLShaderBindingsGenerator registerSemantic:@"shCoefficients" withBlock:&__block_literal_global_198_0];
  +[SCNMTLShaderBindingsGenerator registerShadableArgumentBindingBlockForBuffers:&__block_literal_global_203 textures:&__block_literal_global_206 samplers:&__block_literal_global_212];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"scn_lights" frequency:0 needsRenderResource:1 block:&__block_literal_global_218];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"scn_lights_count" frequency:0 needsRenderResource:1 block:&__block_literal_global_224_0];
  if (C3DStandardShadersUseFunctionConstants()) {
    +[SCNMTLShaderBindingsGenerator registerArgument:@"scn_shCoefficients" frequency:1 block:&__block_literal_global_230];
  }
  +[SCNMTLShaderBindingsGenerator registerArgument:@"scn_commonprofile" frequency:2 needsRenderResource:1 block:&__block_literal_global_203];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"scn_pointSize" frequency:2 block:&__block_literal_global_240];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"u_clusterTexture" frequency:0 block:&__block_literal_global_246];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"u_lightIndicesTexture" frequency:0 block:&__block_literal_global_252];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"u_areaLightBakedDataTexture" frequency:0 block:&__block_literal_global_258];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"u_shadowKernel" frequency:0 block:&__block_literal_global_264];
  char v41 = 0;
  char v0 = C3DEnumIterator<C3DEffectProperty,(signed char)0,(signed char)15>::end();
  if (v0)
  {
    char v1 = v0;
    char v2 = 0;
    do
    {
      if (v2 != 8)
      {
        uint64_t v3 = [NSString stringWithFormat:@"u_%@Texture", __stringForProperty()];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_275;
        v39[3] = &unk_264006D08;
        char v40 = v2;
        v39[4] = &__block_literal_global_268;
        +[SCNMTLShaderBindingsGenerator registerArgument:v3 frequency:2 block:v39];
      }
      ++v2;
    }
    while (v2 != v1);
  }
  if (C3DStandardShadersUseFunctionConstants())
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_2_279;
    v38[3] = &unk_264006D30;
    v38[4] = &__block_literal_global_268;
    +[SCNMTLShaderBindingsGenerator registerArgument:@"u_reflectiveCubeTexture" frequency:2 block:v38];
  }
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"u_shadowTexture%d", i);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_3_283;
    v37[3] = &__block_descriptor_40_e55_v24__0__SCNMTLResourceBinding_8__SCNMTLRenderContext_16l;
    v37[4] = i;
    +[SCNMTLShaderBindingsGenerator registerArgument:v5 frequency:1 block:v37];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_4_285;
    v36[3] = &__block_descriptor_40_e55_v24__0__SCNMTLResourceBinding_8__SCNMTLRenderContext_16l;
    v36[4] = i;
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", objc_msgSend(NSString, "stringWithFormat:", @"u_goboTexture%d", i), 1, v36);
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", objc_msgSend(NSString, "stringWithFormat:", @"u_iesTexture%d", i), 1, v36);
    +[SCNMTLShaderBindingsGenerator registerArgument:frequency:block:](SCNMTLShaderBindingsGenerator, "registerArgument:frequency:block:", objc_msgSend(NSString, "stringWithFormat:", @"u_iesCubeTexture%d", i), 1, v36);
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"color%d", i);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_301;
    v35[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v35[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v6 withBlock:v35];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"position%d", i);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_2_306;
    v34[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v34[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v7 withBlock:v34];
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"direction%d", i);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_3_310;
    v33[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v33[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v8 withBlock:v33];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"right%d", i);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_4_314;
    v32[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v32[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v9 withBlock:v32];
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"up%d", i);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_5_318;
    v31[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v31[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v10 withBlock:v31];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"iesMatrix%d", i);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_6_322;
    v30[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v30[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v11 withBlock:v30];
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"attenuation%d", i);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_7_326;
    v29[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v29[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v12 withBlock:v29];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"spotAttenuation%d", i);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_8_330;
    v28[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v28[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v13 withBlock:v28];
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"shadowMatrix%d", i);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_9_334;
    v27[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v27[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v14 withBlock:v27];
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"shadowRadius%d", i);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_339;
    v26[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v26[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v15 withBlock:v26];
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"shadowColor%d", i);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_2_343;
    v25[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v25[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v16 withBlock:v25];
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"goboMatrix%d", i);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_3_347;
    v24[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v24[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v17 withBlock:v24];
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"projectorColor%d", i);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_4_351;
    v23[3] = &__block_descriptor_40_e42_v36__0_v8I16__SCNMTLRenderContext_20I28I32l;
    v23[4] = i;
    +[SCNMTLShaderBindingsGenerator registerSemantic:v18 withBlock:v23];
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"u_areaPolygonPositions%d", i);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_5_355;
    v22[3] = &__block_descriptor_40_e55_v24__0__SCNMTLResourceBinding_8__SCNMTLRenderContext_16l;
    v22[4] = i;
    +[SCNMTLShaderBindingsGenerator registerArgument:v19 frequency:1 block:v22];
  }
  +[SCNMTLShaderBindingsGenerator registerArgument:@"u_specularDFGDiffuseHammonTexture" frequency:0 block:&__block_literal_global_362];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"u_radianceTexture" frequency:0 block:&__block_literal_global_368];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"u_irradianceTexture" frequency:0 block:&__block_literal_global_374];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"u_reflectionProbeTexture" frequency:0 block:&__block_literal_global_380];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"u_ssaoTexture" frequency:0 block:&__block_literal_global_386];
  v20 = _Block_copy(&__block_literal_global_395);
  +[SCNMTLShaderBindingsGenerator registerArgument:@"scn_bezier_curve_data" frequency:1 needsRenderResource:0 block:v20];
  +[SCNMTLShaderBindingsGenerator registerArgument:@"scn_bezier_curve_controlPoints" frequency:1 needsRenderResource:0 block:v20];
  _Block_release(v20);
  return +[SCNMTLShaderBindingsGenerator registerUserBlockTrampoline:&__block_literal_global_408];
}

- (void)setWantsWideGamut:(uint64_t)a1
{
  if (a1)
  {
    char v2 = *(unsigned char *)(a1 + 152);
    if (((((v2 & 1) == 0) ^ a2) & 1) == 0)
    {
      *(unsigned char *)(a1 + 152) = v2 & 0xFE | a2;
      Scene = (const void *)C3DEngineContextGetScene(*(void *)(a1 + 144));
      uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
      C3DNotificationCenterPostNotification(SharedInstance, @"kC3DNotificationEngineContextInvalidatePasses", Scene, 0, 1u);
    }
  }
}

- (void)setIsOpaque:(uint64_t)a1
{
  if (a1)
  {
    char v2 = *(unsigned char *)(a1 + 152);
    if (((((v2 & 2) == 0) ^ a2) & 1) == 0)
    {
      if (a2) {
        char v3 = 2;
      }
      else {
        char v3 = 0;
      }
      *(unsigned char *)(a1 + 152) = v2 & 0xFD | v3;
      Scene = (const void *)C3DEngineContextGetScene(*(void *)(a1 + 144));
      uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
      C3DNotificationCenterPostNotification(SharedInstance, @"kC3DNotificationEngineContextInvalidatePasses", Scene, 0, 1u);
    }
  }
}

- (void)setDisableLinearRendering:(uint64_t)a1
{
  if (a1)
  {
    char v2 = *(unsigned char *)(a1 + 152);
    if (((((v2 & 4) == 0) ^ a2) & 1) == 0)
    {
      if (a2) {
        char v3 = 4;
      }
      else {
        char v3 = 0;
      }
      *(unsigned char *)(a1 + 152) = v2 & 0xFB | v3;
      Scene = (const void *)C3DEngineContextGetScene(*(void *)(a1 + 144));
      uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
      C3DNotificationCenterPostNotification(SharedInstance, @"kC3DNotificationEngineContextInvalidatePasses", Scene, 0, 1u);
    }
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend(*(id *)(a3 + 112), "specularDFGDiffuseHammonTextureWithRenderContext:");
  uint64_t v6 = *(void *)(a3 + 248);
  __int16 v7 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v7 != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(v6, v5, (char)v7);
  }
  if ((~v7 & 0xFF00) != 0)
  {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v6, v5, (uint64_t)v7 >> 8);
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_265(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t EffectSlot = C3DEffectCommonProfileGetEffectSlot(*(void *)(a4 + 15240), a2, 0);
  if (EffectSlot)
  {
    __int16 v7 = (void *)[*(id *)(a4 + 112) renderResourceForEffectSlot:EffectSlot withEngineContext:*(void *)(a4 + 144) didFallbackToDefaultTexture:0];
    id v31 = v7;
    uint64_t TextureSampler = C3DEffectSlotGetTextureSampler(EffectSlot);
    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t TextureSampler = 0;
  }
  __int16 v7 = (void *)[*(id *)(a4 + 112) defaultTexture];
  id v31 = v7;
  if (!v7)
  {
    uint64_t v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      C3DRendererContextApplyTextureSampler_cold_2(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  id Weak = objc_loadWeak((id *)(a4 + 15472));
  if (Weak) {
    [Weak renderContext:a4, a3, objc_msgSend(NSString, "stringWithFormat:", @"Unable to find texture for binding %@ and effect slot %@", a3, EffectSlot) didFallbackToDefaultTextureForSource message];
  }
LABEL_10:
  if (!TextureSampler) {
    uint64_t TextureSampler = C3DTextureSamplerGetDefault();
  }
  uint64_t v18 = *(char *)(a3 + 11);
  uint64_t v19 = *(char *)(a3 + 12);
  if ([v7 pixelFormat] == 520 || objc_msgSend(v7, "pixelFormat") == 500)
  {
    v20 = -[SCNMTLResourceManager renderResourceForSampler:](*(void *)(a4 + 112), TextureSampler);
    v21 = *(void **)(*(void *)(a4 + 248) + 3392);
    if (*(unsigned __int8 *)(a3 + 9) != 255)
    {
      v22 = scn_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __39__SCNMTLRenderContext_registerBindings__block_invoke_6_265_cold_1();
      }
    }
    if (*(unsigned __int8 *)(a3 + 10) != 255)
    {
      SCNMTLEnsureIOSurfaceBackingBufferValidity(*(__IOSurface **)(a4 + 240), &v31, 1u);
      [v21 setFragmentTexture:v31 atTextureIndex:*(char *)(a3 + 10) samplerState:v20 atSamplerIndex:v19];
    }
  }
  else
  {
    uint64_t v23 = *(void *)(a4 + 248);
    __int16 v24 = *(_WORD *)(a3 + 9);
    if ((_BYTE)v24 != 0xFF) {
      SCNMTLRenderCommandEncoder::setVertexTexture(*(void *)(a4 + 248), v7, (char)v24);
    }
    if ((~v24 & 0xFF00) != 0) {
      SCNMTLRenderCommandEncoder::setFragmentTexture(v23, v7, (uint64_t)v24 >> 8);
    }
    if (v19 != -1 || v18 != -1)
    {
      v26 = -[SCNMTLResourceManager renderResourceForSampler:](*(void *)(a4 + 112), TextureSampler);
      v27 = v26;
      uint64_t v28 = *(void *)(a4 + 248);
      if (v18 != -1)
      {
        uint64_t v29 = v28 + 8 * v18;
        if (*(void **)(v29 + 1600) != v26)
        {
          *(void *)(v29 + 1600) = v26;
          [*(id *)(v28 + 3392) setVertexSamplerState:v26 atIndex:v18];
        }
      }
      if (v19 != -1)
      {
        uint64_t v30 = v28 + 8 * v19;
        if (*(void **)(v30 + 3248) != v27)
        {
          *(void *)(v30 + 3248) = v27;
          [*(id *)(v28 + 3392) setFragmentSamplerState:v27 atIndex:v19];
        }
      }
    }
  }
}

- (void)_prepareMaterialTextures:(__C3DMaterial *)a3
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile((uint64_t)a3);
  if (CommonProfile)
  {
    uint64_t v5 = CommonProfile;
    int LightingModel = C3DEffectCommonProfileGetLightingModel(CommonProfile);
    if (LightingModel == 5) {
      [(SCNMTLResourceManager *)self->_resourceManager specularDFGDiffuseHammonTextureWithRenderContext:self];
    }
    char v7 = C3DEnumIterator<C3DEffectProperty,(signed char)0,(signed char)15>::end();
    if (v7)
    {
      char v8 = v7;
      char v9 = 0;
      do
      {
        if (C3DEffectCommonProfileIsEffectPropertyEnabledForLightingModel(LightingModel, v9))
        {
          uint64_t EffectSlot = C3DEffectCommonProfileGetEffectSlot(v5, v9, 0);
          if (self)
          {
            if (EffectSlot) {
              [(SCNMTLResourceManager *)self->_resourceManager renderResourceForEffectSlot:EffectSlot withEngineContext:self->_engineContext didFallbackToDefaultTexture:0];
            }
          }
        }
        ++v9;
      }
      while (v9 != v8);
    }
  }
}

- (uint64_t)resourceBlitEncoder
{
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 256)) {
    [(id)a1 _createResourceCommandBufferIfNeeded];
  }
  if (*(void *)(a1 + 1936)) {
    SCNMTLComputeCommandEncoder::endEncoding((SCNMTLComputeCommandEncoder *)(a1 + 280));
  }
  uint64_t v2 = a1 + 264;
  if (!*(void *)(a1 + 264)) {
    SCNMTLBlitCommandEncoder::beginEncoding((void *)(a1 + 264), *(void **)(a1 + 256), 0);
  }
  return v2;
}

- (double)processRendererElements:(unsigned int)a3 count:(uint64_t)a4 engineIterationContext:
{
  *(void *)&v43[5] = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v4 = (unsigned __int8 **)a4;
    unint64_t v8 = *(void *)(a4 + 8);
    C3DEngineContextGetFXContext(v8);
    uint64_t v9 = (uint64_t)v4[2];
    uint64_t v41 = *((void *)*v4 + 6);
    uint64_t WarmUpAbortHandler = C3DEngineContextGetWarmUpAbortHandler(v8);
    uint64_t ProgramHashCodeStore = C3DEngineContextGetProgramHashCodeStore(v8);
    uint64_t v11 = *(void *)(a1 + 15544);
    if ((v11 & 2) != 0)
    {
      uint64_t v12 = *(void *)(a1 + 248);
      if (!*(unsigned char *)(v12 + 74) && *(void *)(v12 + 24) != 1)
      {
        *(void *)(v12 + 24) = 1;
        *(unsigned char *)(v12 + 42) = 1;
      }
      *(unsigned char *)(v12 + 74) = 1;
    }
    -[SCNMTLRenderContext startProcessingRendererElementsWithEngineIterationContext:](a1, (uint64_t)v4);
    int MaxDrawingCommand = C3DEngineContextGetMaxDrawingCommand(v8);
    DynamicBatchingSystem = (void *)C3DSceneGetDynamicBatchingSystem(*(void *)(v9 + 4808));
    if (a3)
    {
      v36 = v4;
      unint64_t v37 = a2;
      uint64_t v39 = 0;
      uint64_t v14 = 0;
      char v34 = v11;
      unsigned int v35 = a3;
      uint64_t v15 = a3;
      uint64_t v16 = (unsigned int *)a2;
      while (1)
      {
        unsigned int v17 = *v16++;
        unint64_t v8 = v8 & 0xFFFFFFFF00000000 | v17;
        uint64_t Element = C3DRendererElementStoreGetElement(v41, v8);
        uint64_t v19 = *(void *)(a1 + 2256);
        if (v19) {
          uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)v19 + 80))(v19);
        }
        else {
          uint64_t v20 = 0;
        }
        Pass = (void *)C3DFXPassInstanceGetPass(v9);
        ProgramHashCodeForRenderuint64_t Element = C3DProgramHashCodeStoreGetProgramHashCodeForRenderElement(ProgramHashCodeStore, (unsigned __int16 *)Element, Pass, v20);
        uint64_t v23 = ProgramHashCodeForRenderElement;
        if (!v14) {
          goto LABEL_24;
        }
        if (*(void *)(v14 + 16) != *(void *)(Element + 16) || *(void *)(v14 + 24) != *(void *)(Element + 24)) {
          break;
        }
        BOOL v24 = v39 == ProgramHashCodeForRenderElement && *(void *)(v14 + 48) == *(void *)(Element + 48);
        if (!v24
          || *(void *)(v14 + 56) != *(void *)(Element + 56)
          || !C3DDynamicBatchingSystemCurrentBatchAppend(DynamicBatchingSystem, *(void *)(Element + 8)))
        {
          break;
        }
        uint64_t Element = v14;
LABEL_37:
        if (!--v15)
        {
LABEL_38:
          unint64_t v4 = v36;
          a2 = v37;
          a3 = v35;
          LOBYTE(v11) = v34;
          if (Element)
          {
            _processRendererElement((SCNMTLRenderContext *)a1, (__C3DRendererElement *)Element, (__C3DFXPassInstance *)v9);
            C3DDynamicBatchingSystemCurrentBatchReset((uint64_t)DynamicBatchingSystem);
          }
          goto LABEL_40;
        }
      }
      _processRendererElement((SCNMTLRenderContext *)a1, (__C3DRendererElement *)v14, (__C3DFXPassInstance *)v9);
      C3DDynamicBatchingSystemCurrentBatchReset((uint64_t)DynamicBatchingSystem);
      uint64_t v39 = 0;
LABEL_24:
      if (!MaxDrawingCommand
        && v23
        && C3DProgramHashCodeUseDynamicBatching(v23)
        && (uint64_t v25 = *(void *)(Element + 16)) != 0
        && C3DGeometryIsDynamicBatchingEnabled(v25))
      {
        if ((C3DProgramHashCodeUseDynamicBatching(v23) & 1) == 0)
        {
          v26 = scn_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[SCNMTLRenderContext processRendererElements:count:engineIterationContext:](v42, v43, v26);
          }
        }
        C3DDynamicBatchingSystemCurrentBatchAppend(DynamicBatchingSystem, *(void *)(Element + 8));
        uint64_t v39 = v23;
        if (!WarmUpAbortHandler) {
          goto LABEL_36;
        }
      }
      else
      {
        _processRendererElement((SCNMTLRenderContext *)a1, (__C3DRendererElement *)Element, (__C3DFXPassInstance *)v9);
        uint64_t Element = 0;
        if (!WarmUpAbortHandler)
        {
LABEL_36:
          ++*(_DWORD *)(*(void *)(a1 + 16) + 12);
          uint64_t v14 = Element;
          goto LABEL_37;
        }
      }
      if ((*(uint64_t (**)(uint64_t))(WarmUpAbortHandler + 16))(WarmUpAbortHandler)) {
        goto LABEL_38;
      }
      goto LABEL_36;
    }
LABEL_40:
    RenderGraph = (C3D::RenderGraph *)C3DEngineContextGetRenderGraph(*(void *)(a1 + 144));
    uint64_t v28 = *(void *)(a1 + 2256);
    if (v28) {
      uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 64))(v28);
    }
    else {
      uint64_t v29 = 0;
    }
    int isMainPass = C3D::RenderGraph::isMainPass(RenderGraph, v29);
    int v31 = isMainPass;
    if ((*(unsigned char *)(a1 + 15544) & 4) != 0 && isMainPass) {
      [(SCNMTLRenderContext *)a1 drawWireframeOverlayForElements:0 range:a3 store:v41 passInstance:v4[2]];
    }
    if ((v11 & 2) != 0)
    {
      uint64_t v32 = *(void *)(a1 + 248);
      *(unsigned char *)(v32 + 74) = 0;
      if (*(void *)(v32 + 24))
      {
        *(void *)(v32 + 24) = 0;
        *(unsigned char *)(v32 + 42) = 1;
      }
    }
    return -[SCNMTLRenderContext stopProcessingRendererElements:](a1, v31);
  }
  return result;
}

- (uint64_t)reverseZ
{
  if (result) {
    return (*(unsigned __int8 *)(result + 152) >> 6) & 1;
  }
  return result;
}

- (uint64_t)getCurrentPassMaterial
{
  if (result) {
    return *(void *)(result + 15464);
  }
  return result;
}

- (uint64_t)getCurrentPassHash
{
  if (result) {
    return *(void *)(result + 15456);
  }
  return result;
}

- (void)drawRenderElement:(uint64_t)a3 withPass:
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  if (!*(void *)(a1 + 144))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLRenderContext drawRenderElement:withPass:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  uint64_t Node = C3DRendererElementGetNode(a2);
  uint64_t Geometry = C3DRendererElementGetGeometry(a2);
  uint64_t Mesh = C3DRendererElementGetMesh(a2);
  Meshuint64_t Element = C3DRendererElementGetMeshElement(a2);
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  uint64_t v56 = 0;
  if (a3)
  {
    int DrawInstruction = C3DFXPassGetDrawInstruction(a3);
    uint64_t v19 = (void *)a3;
    if (DrawInstruction == 2)
    {
      uint64_t v19 = (void *)a3;
      if ((*(unsigned char *)(Node + 221) & 0x10) != 0) {
        uint64_t v19 = *(void **)(a1 + 2248);
      }
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  C3DEnginePipelineGetRenderComponentsForRenderPass(a2, v19, *(void *)(a1 + 144), &v58, &v56, &v57, 0);
  int IsOpaque = C3DRendererElementIsOpaque(a2);
  uint64_t v21 = v56;
  if (!IsOpaque || !v56)
  {
    if (IsOpaque)
    {
      LODWORD(v50) = 0;
      char v22 = 1;
      goto LABEL_25;
    }
    goto LABEL_16;
  }
  if ((C3DProgramHashCodeIsOpaque(v56) & 1) == 0)
  {
LABEL_16:
    if (Node)
    {
      C3DNodeGetWorldAlpha(Node);
      if (v23 <= 0.0) {
        return;
      }
    }
    if (!v56)
    {
      uint64_t v50 = 0;
      char v53 = 0;
      goto LABEL_30;
    }
    uint64_t CommonProfile = C3DMaterialGetCommonProfile(v58);
    if (CommonProfile)
    {
      uint64_t v25 = (float *)CommonProfile;
      int TransparencyMode = C3DEffectCommonProfileGetTransparencyMode(CommonProfile);
      LODWORD(v50) = TransparencyMode;
      if (C3DProgramHashCodeHasShaderModifiers(v56))
      {
        char v22 = 0;
      }
      else
      {
        float ConstantAlpha = C3DEffectCommonProfileGetConstantAlpha(v25);
        char v22 = 0;
        if (TransparencyMode != 1 && ConstantAlpha <= 0.0) {
          return;
        }
      }
    }
    else
    {
      char v22 = 0;
      LODWORD(v50) = 0;
    }
    goto LABEL_24;
  }
  LODWORD(v50) = 0;
  char v22 = 1;
LABEL_24:
  uint64_t v21 = v56;
LABEL_25:
  char v53 = v22;
  if (v21)
  {
    BYTE4(v50) = C3DProgramHashCodeHasConstantAlpha(v21);
    if (v56)
    {
      char v52 = C3DProgramHashCodeNeedTangents(v56);
      if (!a3) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else
  {
    BYTE4(v50) = 0;
  }
LABEL_30:
  char v52 = 0;
  if (!a3) {
    goto LABEL_32;
  }
LABEL_31:
  uint64_t RasterizerStates = C3DFXPassGetRasterizerStates(a3);
  if (RasterizerStates)
  {
LABEL_33:
    -[SCNMTLRenderContext setRasterizerStates:](a1, RasterizerStates);
    int v28 = 0;
    goto LABEL_35;
  }
LABEL_32:
  uint64_t RasterizerStates = C3DRendererElementGetRaterizerStates(a2);
  if (RasterizerStates) {
    goto LABEL_33;
  }
  int v28 = 1;
LABEL_35:
  uint64_t v29 = a2 + 68;
  unsigned int v30 = *(unsigned __int16 *)(a2 + 72);
  v51 = MeshElement;
  uint64_t v31 = Node;
  BOOL v32 = (v30 & 0x40) != 0 && *(unsigned char *)(a1 + 2264) != 0;
  uint64_t v34 = v57;
  uint64_t v33 = v58;
  int v35 = (v30 >> 14) & 1;
  int v36 = (v30 >> 11) & 7;
  uint64_t v37 = *(void *)(a2 + 56);
  if ((v53 & 1) != 0 || *(unsigned char *)(*(void *)(a1 + 2224) + 4769)) {
    goto LABEL_40;
  }
  if (v50 == 2)
  {
    v75[0] = v57;
    v75[1] = v58;
    v75[2] = Geometry;
    v75[3] = v31;
    v75[4] = Mesh;
    v75[5] = v51;
    v75[6] = v37;
    v75[7] = a3;
    v75[8] = v29;
    char v76 = v53;
    char v77 = BYTE4(v50);
    char v78 = v52;
    BOOL v79 = v32;
    char v80 = 1;
    char v81 = (v30 >> 11) & 7;
    __int16 v82 = 0;
    LOBYTE(v50) = v32;
    uint64_t v49 = v29;
    char v47 = v81;
    [(id)a1 _executeDrawCommand:v75];
    v67[0] = v34;
    v67[1] = v33;
    v67[2] = Geometry;
    v67[3] = v31;
    v67[4] = Mesh;
    v67[5] = v51;
    v67[6] = v37;
    v67[7] = a3;
    v67[8] = v49;
    char v68 = v53;
    char v69 = BYTE4(v50);
    char v70 = v52;
    char v71 = v50;
    char v72 = 0;
    char v73 = v47;
    __int16 v74 = 0;
    v38 = v67;
    goto LABEL_41;
  }
  if (v50 != 3)
  {
LABEL_40:
    v59[0] = v57;
    v59[1] = v58;
    v59[2] = Geometry;
    v59[3] = v31;
    v59[4] = Mesh;
    v59[5] = v51;
    v59[6] = v37;
    v59[7] = a3;
    v59[8] = v29;
    char v60 = v53;
    char v61 = BYTE4(v50);
    char v62 = v52;
    BOOL v63 = v32;
    BOOL v64 = (v30 & 0x4000) != 0;
    char v65 = (v30 >> 11) & 7;
    __int16 v66 = 0;
    v38 = v59;
LABEL_41:
    [(id)a1 _executeDrawCommand:v38];
    return;
  }
  LODWORD(v44) = v28;
  uint64_t v39 = *(void *)(a1 + 248);
  if (!*(unsigned char *)(v39 + 73) && *(void *)(v39 + 16) != 1)
  {
    *(void *)(v39 + 16) = 1;
    *(unsigned char *)(v39 + 41) = 1;
  }
  v91[0] = v34;
  v91[1] = v33;
  v91[2] = Geometry;
  v91[3] = v31;
  v91[4] = Mesh;
  v91[5] = v51;
  v91[6] = v37;
  v91[7] = a3;
  uint64_t v48 = v29;
  v91[8] = v29;
  char v92 = v53;
  char v93 = BYTE4(v50);
  char v94 = v52;
  LOBYTE(v50) = v32;
  BOOL v95 = v32;
  char v96 = v35;
  HIDWORD(v44) = v36;
  char v97 = v36;
  __int16 v98 = 0;
  objc_msgSend((id)a1, "_executeDrawCommand:", v91, v44);
  uint64_t v40 = *(void *)(a1 + 248);
  if (!*(unsigned char *)(v40 + 73) && *(void *)(v40 + 16) != 2)
  {
    *(void *)(v40 + 16) = 2;
    *(unsigned char *)(v40 + 41) = 1;
  }
  v83[0] = v34;
  v83[1] = v33;
  v83[2] = Geometry;
  v83[3] = v31;
  v83[4] = Mesh;
  v83[5] = v51;
  v83[6] = v37;
  v83[7] = a3;
  v83[8] = v48;
  char v84 = v53;
  char v85 = BYTE4(v50);
  char v86 = v52;
  char v87 = v50;
  char v88 = v35;
  char v89 = v46;
  __int16 v90 = 0;
  [(id)a1 _executeDrawCommand:v83];
  if ((v45 & 1) == 0)
  {
    memset(v54, 0, sizeof(v54));
    int v55 = 0;
    C3DRasterizerStatesGetDesc(RasterizerStates, (uint64_t)v54);
    uint64_t v41 = *(void *)(a1 + 248);
    uint64_t v42 = C3DCullModeToMTLCullMode(v54[0]);
    if (!*(unsigned char *)(v41 + 73) && *(void *)(v41 + 16) != v42)
    {
      *(void *)(v41 + 16) = v42;
      *(unsigned char *)(v41 + 41) = 1;
    }
  }
}

- (void)setRasterizerStates:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = a2;
    if (!a2) {
      uint64_t v2 = C3DRasterizerStatesDefault();
    }
    if (*(void *)(a1 + 15168) != v2)
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      int v28 = 0;
      uint64_t v27 = 0;
      C3DRasterizerStatesGetDesc(v2, (uint64_t)&v25);
      uint64_t v4 = *(void *)(a1 + 15168);
      if (!v4)
      {
        LOBYTE(v7) = -1;
        int v5 = v25;
        goto LABEL_31;
      }
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      int v24 = 0;
      uint64_t v23 = 0;
      C3DRasterizerStatesGetDesc(v4, (uint64_t)&v21);
      int v5 = v25;
      if (HIDWORD(v21) == HIDWORD(v25)) {
        int v6 = v21 != v25;
      }
      else {
        int v6 = (v21 != v25) | 2;
      }
      if (v22 == v26) {
        int v7 = v6;
      }
      else {
        int v7 = v6 | 4;
      }
      if ((_BYTE)v26)
      {
        if (BYTE2(v22) != BYTE2(v26) || v22 == 0) {
          v7 |= 8u;
        }
        if ((_BYTE)v22 && BYTE1(v22) == BYTE1(v26))
        {
LABEL_25:
          if (BYTE3(v26) | BYTE3(v22))
          {
            LOBYTE(v7) = v7 | 0x20;
          }
          else if (!v7)
          {
            uint64_t v9 = scn_default_log();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
              C3DRendererContextSetRasterizerStates_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
            }
LABEL_40:
            *(void *)(a1 + 15168) = v2;
            return;
          }
          if ((v7 & 1) == 0)
          {
LABEL_34:
            if ((v7 & 2) != 0)
            {
              uint64_t v19 = *(void *)(a1 + 248);
              uint64_t v20 = C3DFillModeToMTLFillMode(HIDWORD(v25));
              if (!*(unsigned char *)(v19 + 74) && *(void *)(v19 + 24) != v20)
              {
                *(void *)(v19 + 24) = v20;
                *(unsigned char *)(v19 + 42) = 1;
              }
            }
            if ((v7 & 0x3C) != 0) {
              objc_msgSend(*(id *)(*(void *)(a1 + 248) + 3392), "setDepthStencilState:", -[SCNMTLResourceManager renderResourceForRasterizerState:reverseZ:](*(void *)(a1 + 112), v2, (*(unsigned __int8 *)(a1 + 152) >> 6) & 1));
            }
            goto LABEL_40;
          }
LABEL_31:
          uint64_t v17 = *(void *)(a1 + 248);
          uint64_t v18 = C3DCullModeToMTLCullMode(v5);
          if (!*(unsigned char *)(v17 + 73) && *(void *)(v17 + 16) != v18)
          {
            *(void *)(v17 + 16) = v18;
            *(unsigned char *)(v17 + 41) = 1;
          }
          goto LABEL_34;
        }
      }
      else
      {
        if ((_BYTE)v22) {
          goto LABEL_25;
        }
        v7 |= 8u;
      }
      v7 |= 0x10u;
      goto LABEL_25;
    }
  }
}

- (uint64_t)profile
{
  if (result) {
    return *(unsigned int *)(result + 132);
  }
  return result;
}

- (uint64_t)_drawMeshElement:(uint64_t)a3 instanceCount:
{
  if (result)
  {
    int v5 = (void *)result;
    ++*(_DWORD *)(*(void *)(result + 16) + 8);
    if (!a2)
    {
      int v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        C3DRendererContextCreateBufferObjectForMeshElement_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    if (-[SCNMTLMesh buffers](a2))
    {
      uint64_t v14 = v5[31];
      uint64_t v15 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](a2);
      uint64_t v16 = -[SCNMTLMesh elements](a2);
      uint64_t v17 = [(id)-[SCNMTLMeshElement indexBuffer](a2) buffer];
      uint64_t v18 = -[SCNMTLMeshElement effectiveIndexOffset](a2);
      uint64_t v19 = [(id)-[SCNMTLMeshElement indexBuffer](a2) offset];
      uint64_t v20 = v19 + v18 + -[SCNMTLResourceManager libraryManager](a2);
      uint64_t v21 = -[SCNMTLMesh buffers](a2);
      uint64_t v22 = -[SCNMTLMesh volatileOffset](a2);
      SCNMTLRenderCommandEncoder::_bindPendingTextures((SCNMTLRenderCommandEncoder *)v14);
      SCNMTLRenderCommandEncoder::applyChangedStates((SCNMTLRenderCommandEncoder *)v14);
      [*(id *)(v14 + 3392) drawIndexedPrimitives:v15 indexType:v16 indexBuffer:v17 indexBufferOffset:v20 indirectBuffer:v21 indirectBufferOffset:v22];
    }
    else
    {
      uint64_t v23 = -[SCNMTLMeshElement indexBuffer](a2);
      int v24 = (SCNMTLRenderCommandEncoder *)v5[31];
      MTLPrimitiveType v25 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](a2);
      if (v23)
      {
        uint64_t v26 = -[SCNMTLMesh volatileBuffer](a2);
        uint64_t v27 = -[SCNMTLMesh elements](a2);
        uint64_t v28 = [(id)-[SCNMTLMeshElement indexBuffer](a2) buffer];
        uint64_t v29 = -[SCNMTLMeshElement effectiveIndexOffset](a2);
        uint64_t v30 = [(id)-[SCNMTLMeshElement indexBuffer](a2) offset];
        uint64_t v31 = -[SCNMTLResourceManager libraryManager](a2);
        SCNMTLRenderCommandEncoder::drawIndexedPrimitives((uint64_t)v24, v25, v26, v27, v28, v30 + v29 + v31, a3, 0);
      }
      else
      {
        uint64_t v32 = -[SCNMTLMeshElement effectiveIndexOffset](a2);
        uint64_t v33 = -[SCNMTLMesh volatileBuffer](a2);
        SCNMTLRenderCommandEncoder::drawPrimitives(v24, v25, v32, v33, a3, 0);
      }
    }
    int v34 = -[SCNMTLMeshElement effectivePrimitiveCount](a2);
    int v35 = (_DWORD *)v5[2];
    v35[1] += v34 * a3;
    double result = v5[1898];
    if (result)
    {
      double result = -[SCNMTLMesh verticesCount](result);
      int v36 = result * a3;
      int v35 = (_DWORD *)v5[2];
    }
    else
    {
      int v36 = 0;
    }
    *v35 += v36;
  }
  return result;
}

- (void)_executeDrawCommand:(id *)a3
{
  uint64_t v489 = *MEMORY[0x263EF8340];
  var0 = a3->var0;
  var1 = a3->var1;
  var2 = a3->var2;
  var3 = a3->var3;
  var4 = a3->var4;
  var5 = a3->var5;
  v385.i64[0] = (uint64_t)a3->var7;
  var8 = a3->var8;
  v377 = (char *)var1;
  v378 = var8;
  v384.i32[0] = a3->var9;
  v369 = (int8x8_t *)a3;
  LODWORD(v373) = a3->var10;
  if (var2 && C3DGeometryGetWantsHardwareTessellation(var2) && (self->_features & 0x10) != 0)
  {
    v383.i32[0] = (v369[9].i8[5] & 7) != 0;
    uint64_t v11 = 1;
    if (var0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v11 = 0;
    v383.i32[0] = 0;
    if (var0) {
      goto LABEL_10;
    }
  }
  if ((-[SCNMTLRenderContext _executeDrawCommand:]::done & 1) == 0)
  {
    -[SCNMTLRenderContext _executeDrawCommand:]::done = 1;
    uint64_t v12 = scn_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLRenderContext _executeDrawCommand:]0();
    }
  }
  var0 = [(SCNMTLResourceManager *)self->_resourceManager defaultProgramUsingTessellation:v11];
LABEL_10:
  v376 = var3;
  if (var2 && (C3DEntityGetShaderModifiers((uint64_t)var2) || C3DGeometryGetOverrideMaterial((uint64_t)var2))) {
    v374 = var2;
  }
  else {
    v374 = 0;
  }
  uint64_t v13 = var0;
  CFTypeID v14 = CFGetTypeID(var0);
  BOOL v18 = v14 == C3DFXMetalProgramGetTypeID();
  uint64_t v15 = v13;
  if (!v18) {
    uint64_t v15 = [(SCNMTLResourceManager *)self->_resourceManager defaultProgramUsingTessellation:v11];
  }
  v381 = &self->_anon_3848[120];
  program = self->_cache.program;
  self->_cache.program = v15;
  mesh = self->_cache.mesh;
  v368 = v15;
  v370 = program;
  BOOL v18 = mesh == var4 && program == v15;
  char v19 = !v18;
  if (var2) {
    LODWORD(p_resourceManagerMonitor) = C3DGeometryGetEffectiveDataKindForRendering(var2);
  }
  else {
    LODWORD(p_resourceManagerMonitor) = 1;
  }
  v367 = (__C3DMesh **)(v381 + 648);
  int v366 = v11;
  if (v376)
  {
    C3DNodeGetMorpher((uint64_t)v376);
    uint64_t Skinner = C3DNodeGetSkinner((uint64_t)v376);
    BOOL v21 = Skinner != 0;
    uint64_t v375 = Skinner;
    if (Skinner) {
      int EffectiveCalculationMode = C3DSkinnerGetEffectiveCalculationMode(Skinner, var2);
    }
    else {
      int EffectiveCalculationMode = -1;
    }
    DeformerStacuint64_t k = (__C3DDeformerStack *)C3DNodeGetDeformerStack((uint64_t)v376);
    if (self->_cache.deformerStack == DeformerStack) {
      char v25 = v19;
    }
    else {
      char v25 = 1;
    }
    self->_cache.deformerStacuint64_t k = DeformerStack;
    if (DeformerStack)
    {
      uint64_t v26 = DeformerStack;
      if (C3DDeformerStackWantsGPU((uint64_t)DeformerStack))
      {
        if (v369[9].i8[2]) {
          unsigned __int8 v27 = 1;
        }
        else {
          unsigned __int8 v27 = C3DGeometryNeedsTexTangent((uint64_t)var2, 0);
        }
        id v62 = [(SCNMTLResourceManager *)self->_resourceManager renderResourceForDeformerStack:v26 node:v376 dataKind:p_resourceManagerMonitor];
        if (-[SCNMTLDeformerStack computeDeformedMeshReliesOnTransforms]((BOOL)v62) || v381[888])
        {
          BOOL v414 = 0;
          C3DDynamicBatchingSystemGetCurrentBatchNodes((uint64_t)self->_processingContext.dynamicBatchingSystem, &v414);
          if (v414 >= 2)
          {
            BOOL v63 = scn_default_log();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
              -[SCNMTLRenderContext _executeDrawCommand:].cold.9(v63, v64, v65, v66, v67, v68, v69, v70);
            }
          }
          WorldTransformPtr = (float32x4_t *)C3DTransformTreeGetWorldTransformPtr(self->_processingContext.transformTree, *((_DWORD *)v376 + 22));
          float32x4_t v72 = *WorldTransformPtr;
          float32x4_t v73 = WorldTransformPtr[1];
          float32x4_t v74 = WorldTransformPtr[2];
          float32x4_t v75 = WorldTransformPtr[3];
          *(float32x4_t *)&self->_nodeUniforms.instanceuint64_t Node = *WorldTransformPtr;
          *(float32x4_t *)&self->_nodeUniforms.probeCacheIndex = v73;
          *(float32x4_t *)&self->_anon_31b8[8] = v74;
          *(float32x4_t *)&self->_anon_31b8[24] = v75;
          if (v375)
          {
            *(double *)v72.i64 = C3DSkinnerAdjustTransformIfUsesNodeTransformCalculationMode(v375, EffectiveCalculationMode, v72, v73, v74, v75);
            *(float32x4_t *)&self->_nodeUniforms.instanceuint64_t Node = v72;
            *(float32x4_t *)&self->_nodeUniforms.probeCacheIndex = v73;
            *(float32x4_t *)&self->_anon_31b8[8] = v74;
            *(float32x4_t *)&self->_anon_31b8[24] = v75;
          }
          uint64_t eyeCount = self->_renderPassParameters.eyeCount;
          *(_DWORD *)&self->_anon_31b8[1328] = 2;
          if (eyeCount)
          {
            uint64_t v77 = 0;
            char v78 = &self->_anon_8f0[4];
            do
            {
              uint64_t v79 = 0;
              char v80 = (float32x4_t *)&v78[704 * v77];
              float32x4_t v81 = *v80;
              float32x4_t v82 = v80[1];
              float32x4_t v83 = v80[2];
              float32x4_t v84 = v80[3];
              long long v481 = (__int128)v72;
              long long v482 = (__int128)v73;
              long long v483 = (__int128)v74;
              long long v484 = (__int128)v75;
              do
              {
                *(long long *)((char *)&v461 + v79) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(long long *)((char *)&v481 + v79))), v82, *(float32x2_t *)((char *)&v481 + v79), 1), v83, *(float32x4_t *)((char *)&v481 + v79), 2), v84, *(float32x4_t *)((char *)&v481 + v79), 3);
                v79 += 16;
              }
              while (v79 != 64);
              long long v85 = v462;
              long long v86 = v463;
              long long v87 = v464;
              char v88 = &self->_anon_31b8[64 * v77 + 488];
              *(_OWORD *)char v88 = v461;
              *((_OWORD *)v88 + 1) = v85;
              *((_OWORD *)v88 + 2) = v86;
              *((_OWORD *)v88 + 3) = v87;
              ++v77;
            }
            while (v77 != eyeCount);
            int v89 = *(_DWORD *)&self->_anon_31b8[1328];
            if ((v89 & 4) == 0)
            {
              uint64_t v90 = 0;
              *(_DWORD *)&self->_anon_31b8[1328] = v89 | 4;
              do
              {
                uint64_t v91 = 0;
                char v92 = (float32x4_t *)&v78[704 * v90];
                float32x4_t v93 = v92[12];
                float32x4_t v94 = v92[13];
                float32x4_t v95 = v92[14];
                float32x4_t v96 = v92[15];
                long long v481 = (__int128)v72;
                long long v482 = (__int128)v73;
                long long v483 = (__int128)v74;
                long long v484 = (__int128)v75;
                do
                {
                  *(long long *)((char *)&v461 + v91) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v93, COERCE_FLOAT(*(long long *)((char *)&v481 + v91))), v94, *(float32x2_t *)((char *)&v481 + v91), 1), v95, *(float32x4_t *)((char *)&v481 + v91), 2), v96, *(float32x4_t *)((char *)&v481 + v91), 3);
                  v91 += 16;
                }
                while (v91 != 64);
                long long v97 = v462;
                long long v98 = v463;
                long long v99 = v464;
                v100 = &self->_anon_31b8[64 * v90 + 872];
                *(_OWORD *)v100 = v461;
                *((_OWORD *)v100 + 1) = v97;
                *((_OWORD *)v100 + 2) = v98;
                *((_OWORD *)v100 + 3) = v99;
                ++v90;
              }
              while (v90 != eyeCount);
            }
          }
          else
          {
            *(_DWORD *)&self->_anon_31b8[1328] = 6;
          }
          long long v101 = *(_OWORD *)&self->_anon_31b8[504];
          long long v481 = *(_OWORD *)&self->_anon_31b8[488];
          long long v482 = v101;
          long long v102 = *(_OWORD *)&self->_anon_31b8[536];
          long long v483 = *(_OWORD *)&self->_anon_31b8[520];
          long long v484 = v102;
          long long v103 = *(_OWORD *)&self->_anon_31b8[888];
          long long v485 = *(_OWORD *)&self->_anon_31b8[872];
          long long v486 = v103;
          long long v104 = *(_OWORD *)&self->_anon_31b8[920];
          long long v487 = *(_OWORD *)&self->_anon_31b8[904];
          long long v488 = v104;
          long long v105 = *(_OWORD *)&self->_anon_8f0[132];
          long long v106 = *(_OWORD *)&self->_anon_8f0[148];
          long long v107 = *(_OWORD *)&self->_anon_8f0[164];
          long long v472 = *(_OWORD *)&self->_anon_8f0[180];
          long long v471 = v107;
          long long v470 = v106;
          long long v469 = v105;
          long long v464 = v484;
          long long v463 = v483;
          long long v462 = v482;
          long long v461 = v481;
          long long v468 = v488;
          long long v467 = v487;
          long long v466 = v486;
          long long v465 = v485;
        }
        if (-[SCNMTLDeformerStack computeDeformedMeshReliesOnFrustum]((BOOL)v62))
        {
          uint64_t v108 = 0;
          *(void *)&long long v481 = *(void *)self->_renderSize;
          long long v109 = *(_OWORD *)&self->_anon_31b8[872];
          long long v110 = *(_OWORD *)&self->_anon_31b8[888];
          long long v111 = *(_OWORD *)&self->_anon_31b8[904];
          long long v112 = *(_OWORD *)&self->_anon_31b8[920];
          do
          {
            uint64_t v113 = 0;
            v114 = (float *)((unint64_t)&v387 & 0xFFFFFFFFFFFFFFF3 | (4 * (v108 & 3)));
            long long v386 = v109;
            float v115 = *(float *)((unint64_t)&v386 & 0xFFFFFFFFFFFFFFF3 | (4 * (v108 & 3)));
            long long v387 = v110;
            float v116 = *((float *)&v110 + 3) - *v114;
            float v117 = *((float *)&v110 + 3) + *v114;
            long long v388 = v111;
            float v118 = *(float *)((unint64_t)&v388 & 0xFFFFFFFFFFFFFFF3 | (4 * (v108 & 3)));
            long long v389 = v112;
            float v119 = *(float *)((unint64_t)&v389 & 0xFFFFFFFFFFFFFFF3 | (4 * (v108 & 3)));
            float v120 = *((float *)&v111 + 3) - v118;
            float v121 = *((float *)&v111 + 3) + v118;
            char v122 = 1;
            do
            {
              int v123 = v122 & 1;
              if (v122) {
                float v124 = v115;
              }
              else {
                float v124 = -v115;
              }
              v125 = (float32x4_t *)(&v481 + (v113 | (2 * v108)));
              float32x4_t v126 = v125[1];
              v126.f32[0] = *((float *)&v109 + 3) + v124;
              if (v122) {
                float v127 = v117;
              }
              else {
                float v127 = v116;
              }
              v126.f32[1] = v127;
              if (v122) {
                float v128 = v121;
              }
              else {
                float v128 = v120;
              }
              v126.f32[2] = v128;
              float32x4_t v129 = vmulq_f32(v126, v126);
              float32x4_t v130 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v129.f32, 1);
              if (v122) {
                float v131 = v119;
              }
              else {
                float v131 = -v119;
              }
              v126.f32[3] = *((float *)&v112 + 3) + v131;
              v125[1] = vmulq_n_f32(v126, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v129, 2), vaddq_f32(v129, v130)).f32[0]));
              uint64_t v113 = 1;
              char v122 = 0;
            }
            while (v123);
            ++v108;
          }
          while (v108 != 3);
        }
        double v132 = CACurrentMediaTime();
        BOOL v414 = 0;
        v460[8] = v469;
        v460[9] = v470;
        v460[10] = v471;
        v460[11] = v472;
        v460[4] = v465;
        v460[5] = v466;
        v460[6] = v467;
        v460[7] = v468;
        v460[0] = v461;
        v460[1] = v462;
        v460[2] = v463;
        v460[3] = v464;
        v459[4] = v485;
        v459[5] = v486;
        v459[6] = v487;
        v459[0] = v481;
        v459[1] = v482;
        v459[3] = v484;
        v459[2] = v483;
        uint64_t v28 = (SCNMTLMesh *)-[SCNMTLDeformerStack computeDeformedMeshForContext:programHashCodeRequirements:transforms:frustumInfo:status:]((uint64_t)v62, (uint64_t)self, v27, v460, v459, &v414);
        self->__engineStats->mrphTime = CACurrentMediaTime() - v132 + self->__engineStats->mrphTime;
        if (v381[888])
        {
          uint64_t AuthoringEnvironment = C3DEngineContextGetAuthoringEnvironment((uint64_t)self->_engineContext, 0);
          v458[8] = v469;
          v458[9] = v470;
          v458[10] = v471;
          v458[11] = v472;
          v458[4] = v465;
          v458[5] = v466;
          v458[6] = v467;
          v458[7] = v468;
          v458[0] = v461;
          v458[1] = v462;
          v458[2] = v463;
          v458[3] = v464;
          -[SCNMTLDeformerStack updateDataForAuthoringEnvironment:transforms:context:](v62, AuthoringEnvironment, v458, (uint64_t)self);
        }
        BOOL v23 = v414;
        if ((v25 & 1) == 0)
        {
          HIDWORD(v364) = 0;
          LODWORD(v11) = v366;
          if (v366)
          {
LABEL_56:
            if (!v23) {
              goto LABEL_120;
            }
            uint64_t v30 = self->_renderPassParameters.eyeCount;
            int v31 = *(_DWORD *)&self->_anon_31b8[1328];
            if ((v31 & 2) == 0)
            {
              *(_DWORD *)&self->_anon_31b8[1328] = v31 | 2;
              if (!v30)
              {
                if ((v31 & 4) == 0) {
                  *(_DWORD *)&self->_anon_31b8[1328] = v31 | 6;
                }
                goto LABEL_119;
              }
              uint64_t v32 = 0;
              long long v33 = *(_OWORD *)&self->_nodeUniforms.instanceNode;
              long long v34 = *(_OWORD *)&self->_nodeUniforms.probeCacheIndex;
              long long v35 = *(_OWORD *)&self->_anon_31b8[8];
              long long v36 = *(_OWORD *)&self->_anon_31b8[24];
              do
              {
                uint64_t v37 = 0;
                v38 = &self->_anon_8f0[704 * v32 + 4];
                float32x4_t v39 = *(float32x4_t *)v38;
                float32x4_t v40 = *((float32x4_t *)v38 + 1);
                float32x4_t v41 = *((float32x4_t *)v38 + 2);
                float32x4_t v42 = *((float32x4_t *)v38 + 3);
                long long v481 = v33;
                long long v482 = v34;
                long long v483 = v35;
                long long v484 = v36;
                do
                {
                  *(long long *)((char *)&v461 + v37) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v39, COERCE_FLOAT(*(long long *)((char *)&v481 + v37))), v40, *(float32x2_t *)((char *)&v481 + v37), 1), v41, *(float32x4_t *)((char *)&v481 + v37), 2), v42, *(float32x4_t *)((char *)&v481 + v37), 3);
                  v37 += 16;
                }
                while (v37 != 64);
                long long v43 = v462;
                long long v44 = v463;
                long long v45 = v464;
                char v46 = &self->_anon_31b8[64 * v32 + 488];
                *(_OWORD *)char v46 = v461;
                *((_OWORD *)v46 + 1) = v43;
                *((_OWORD *)v46 + 2) = v44;
                *((_OWORD *)v46 + 3) = v45;
                ++v32;
              }
              while (v32 != v30);
              int v31 = *(_DWORD *)&self->_anon_31b8[1328];
            }
            if ((v31 & 4) == 0)
            {
              *(_DWORD *)&self->_anon_31b8[1328] = v31 | 4;
              if (v30)
              {
                uint64_t v47 = 0;
                long long v48 = *(_OWORD *)&self->_nodeUniforms.instanceNode;
                long long v49 = *(_OWORD *)&self->_nodeUniforms.probeCacheIndex;
                long long v50 = *(_OWORD *)&self->_anon_31b8[8];
                long long v51 = *(_OWORD *)&self->_anon_31b8[24];
                do
                {
                  uint64_t v52 = 0;
                  char v53 = &self->_anon_8f0[704 * v47 + 4];
                  float32x4_t v54 = *((float32x4_t *)v53 + 12);
                  float32x4_t v55 = *((float32x4_t *)v53 + 13);
                  float32x4_t v56 = *((float32x4_t *)v53 + 14);
                  float32x4_t v57 = *((float32x4_t *)v53 + 15);
                  long long v481 = v48;
                  long long v482 = v49;
                  long long v483 = v50;
                  long long v484 = v51;
                  do
                  {
                    *(long long *)((char *)&v461 + v52) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v54, COERCE_FLOAT(*(long long *)((char *)&v481 + v52))), v55, *(float32x2_t *)((char *)&v481 + v52), 1), v56, *(float32x4_t *)((char *)&v481 + v52), 2), v57, *(float32x4_t *)((char *)&v481 + v52), 3);
                    v52 += 16;
                  }
                  while (v52 != 64);
                  long long v58 = v462;
                  long long v59 = v463;
                  long long v60 = v464;
                  char v61 = &self->_anon_31b8[64 * v47 + 872];
                  *(_OWORD *)char v61 = v461;
                  *((_OWORD *)v61 + 1) = v58;
                  *((_OWORD *)v61 + 2) = v59;
                  *((_OWORD *)v61 + 3) = v60;
                  ++v47;
                }
                while (v47 != v30);
              }
            }
LABEL_119:
            LOBYTE(v23) = 1;
            goto LABEL_120;
          }
LABEL_115:
          v382.i32[0] = 0;
          v365 = 0;
          BOOL v134 = v381[760] == 0;
          v381[760] = 0;
          if (!v28) {
            goto LABEL_133;
          }
          goto LABEL_124;
        }
        LODWORD(v11) = v366;
        if (v28)
        {
          *v367 = var4;
          uint64_t v29 = v28;
          goto LABEL_55;
        }
LABEL_44:
        if (v369[9].i8[2] && (v11 & v383.i32[0] & 1) == 0) {
          C3DMeshCreateTangentsIfNeeded((uint64_t)var4, (int)p_resourceManagerMonitor);
        }
        *v367 = var4;
        if (var4) {
          uint64_t v28 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:]((uint64_t)self->_resourceManager, (uint64_t)var4, (int)p_resourceManagerMonitor);
        }
        else {
          uint64_t v28 = 0;
        }
        uint64_t v29 = 0;
LABEL_55:
        self->_cache.metaluint64_t Mesh = v28;
        HIDWORD(v364) = 1;
        uint64_t v28 = v29;
        if (v11) {
          goto LABEL_56;
        }
        goto LABEL_115;
      }
    }
    if (v25)
    {
      BOOL v23 = 0;
      goto LABEL_44;
    }
    HIDWORD(v364) = 0;
    uint64_t v28 = 0;
    LOBYTE(v23) = 0;
    if ((v11 & 1) == 0) {
      goto LABEL_115;
    }
  }
  else
  {
    if (self->_cache.deformerStack) {
      char v22 = 1;
    }
    else {
      char v22 = v19;
    }
    self->_cache.deformerStacuint64_t k = 0;
    if (v22)
    {
      uint64_t v375 = 0;
      BOOL v21 = 0;
      BOOL v23 = 0;
      int EffectiveCalculationMode = -1;
      goto LABEL_44;
    }
    HIDWORD(v364) = 0;
    uint64_t v375 = 0;
    BOOL v21 = 0;
    uint64_t v28 = 0;
    LOBYTE(v23) = 0;
    int EffectiveCalculationMode = -1;
    if ((v11 & 1) == 0) {
      goto LABEL_115;
    }
  }
LABEL_120:
  geometry = (__C3DGeometry *)v28;
  v372 = (__C3DGeometry *)var4;
  v135 = var5;
  BOOL v136 = v21;
  int v137 = v11;
  long long v138 = *(_OWORD *)&self->_anon_31b8[504];
  long long v461 = *(_OWORD *)&self->_anon_31b8[488];
  long long v462 = v138;
  long long v139 = *(_OWORD *)&self->_anon_31b8[536];
  long long v463 = *(_OWORD *)&self->_anon_31b8[520];
  long long v464 = v139;
  long long v140 = *(_OWORD *)&self->_anon_31b8[888];
  long long v465 = *(_OWORD *)&self->_anon_31b8[872];
  long long v466 = v140;
  long long v141 = *(_OWORD *)&self->_anon_31b8[920];
  long long v467 = *(_OWORD *)&self->_anon_31b8[904];
  long long v468 = v141;
  long long v142 = *(_OWORD *)&self->_anon_8f0[132];
  long long v143 = *(_OWORD *)&self->_anon_8f0[148];
  long long v144 = *(_OWORD *)&self->_anon_8f0[164];
  long long v472 = *(_OWORD *)&self->_anon_8f0[180];
  long long v471 = v144;
  long long v470 = v143;
  long long v469 = v142;
  metaluint64_t Mesh = self->_cache.metalMesh;
  int64_t currentFrameIndex = self->_currentFrameIndex;
  v147 = -[SCNMTLResourceManager renderResourceForTessellatedGeometry:]((uint64_t)self->_resourceManager, (uint64_t)var2);
  v453[0] = metalMesh;
  v453[1] = self;
  v453[2] = &v461;
  int v454 = currentFrameIndex;
  BOOL v455 = v23;
  __int16 v456 = 0;
  char v457 = 0;
  [(SCNMTLTessellator *)v147 update:v453];
  metalMeshuint64_t Element = self->_cache.metalMeshElement;
  uint64_t v149 = v369[9].i8[5] & 7;
  v365 = v147;
  __int32 v150 = [(SCNMTLTessellator *)v147 pipelineStateHashForMeshElement:metalMeshElement patchType:v149];
  BOOL v134 = v381[760] == v150;
  v382.i32[0] = v150;
  v381[760] = v150;
  if (v383.i32[0])
  {
    var5 = v135;
    self->_cache.meshuint64_t Element = v135;
    self->_cache.metalMeshuint64_t Element = 0;
    char v151 = 1;
    LODWORD(v11) = v137;
    BOOL v21 = v136;
    if (!var5) {
      goto LABEL_153;
    }
    goto LABEL_150;
  }
  LODWORD(v11) = v137;
  BOOL v21 = v136;
  var5 = v135;
  uint64_t v28 = (SCNMTLMesh *)geometry;
  var4 = (__C3DMesh *)v372;
  if (geometry)
  {
LABEL_124:
    if (C3DGeometryUsesDeformerBasedDynamicMesh((uint64_t)var2))
    {
      if (var5)
      {
        v152 = scn_default_log();
        if (os_log_type_enabled(v152, OS_LOG_TYPE_FAULT)) {
          -[SCNMTLRenderContext _executeDrawCommand:].cold.8(v152, v153, v154, v155, v156, v157, v158, v159);
        }
      }
      if (C3DGeometryGetMeshElementCountForDeformerBasedDynamicMesh((uint64_t)var2) != 1)
      {
        v160 = scn_default_log();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT)) {
          -[SCNMTLRenderContext _executeDrawCommand:].cold.7(v160, v161, v162, v163, v164, v165, v166, v167);
        }
      }
      v168 = (SCNMTLMeshElement *)[(id)-[SCNMTLMesh elements]((uint64_t)v28) objectAtIndexedSubscript:0];
      char v151 = 0;
      self->_cache.meshuint64_t Element = 0;
      self->_cache.metalMeshuint64_t Element = v168;
      if (!var5) {
        goto LABEL_153;
      }
      goto LABEL_150;
    }
  }
LABEL_133:
  if (self->_cache.meshElement == var5) {
    goto LABEL_149;
  }
  char v169 = v383.i8[0];
  if (!v28) {
    char v169 = 1;
  }
  if (v169)
  {
    self->_cache.meshuint64_t Element = var5;
    if (var5)
    {
      v170 = -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)self->_resourceManager, (uint64_t)var5);
      p_metalMeshuint64_t Element = &self->_cache.metalMeshElement;
      self->_cache.metalMeshuint64_t Element = v170;
      if (v170) {
        goto LABEL_146;
      }
    }
    else
    {
      p_metalMeshuint64_t Element = &self->_cache.metalMeshElement;
      self->_cache.metalMeshuint64_t Element = 0;
    }
    v177 = scn_default_log();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_FAULT))
    {
      -[SCNMTLRenderContext _executeDrawCommand:].cold.6(v177, v178, v179, v180, v181, v182, v183, v184);
      if (!var5) {
        goto LABEL_147;
      }
    }
    else if (!var5)
    {
LABEL_147:
      uint64_t v176 = (uint64_t)*p_metalMeshElement;
      goto LABEL_148;
    }
LABEL_146:
    uint64_t PrimitiveRange = C3DMeshElementGetPrimitiveRange((uint64_t)var5);
    [(SCNMTLMeshElement *)*p_metalMeshElement setPrimitiveRange:v186];
    goto LABEL_147;
  }
  IndexOfuint64_t Element = C3DMeshGetIndexOfElement((uint64_t)var4, var5, (int)p_resourceManagerMonitor);
  if (IndexOfElement == -1) {
    goto LABEL_149;
  }
  v173 = (SCNMTLMeshElement *)[(id)-[SCNMTLMesh elements]((uint64_t)v28) objectAtIndexedSubscript:IndexOfElement];
  self->_cache.meshuint64_t Element = var5;
  self->_cache.metalMeshuint64_t Element = v173;
  if (-[SCNMTLMesh buffers]((uint64_t)v173)) {
    goto LABEL_149;
  }
  uint64_t v174 = C3DMeshElementGetPrimitiveRange((uint64_t)var5);
  [(SCNMTLMeshElement *)v173 setPrimitiveRange:v175];
  uint64_t v176 = (uint64_t)v173;
LABEL_148:
  if (!-[SCNMTLMesh volatileBuffer](v176)) {
    return;
  }
LABEL_149:
  char v151 = 0;
  if (!var5)
  {
LABEL_153:
    v187 = (__C3DMaterial *)v377;
    goto LABEL_154;
  }
LABEL_150:
  v187 = (__C3DMaterial *)v377;
  switch(C3DMeshElementGetType((uint64_t)var5))
  {
    case 0u:
    case 1u:
    case 5u:
      goto LABEL_151;
    case 2u:
      LODWORD(var5) = 2;
      break;
    case 3u:
      LODWORD(var5) = 1;
      break;
    case 4u:
      if (v151)
      {
LABEL_151:
        LODWORD(var5) = 3;
      }
      else
      {
        v276 = scn_default_log();
        if (os_log_type_enabled(v276, OS_LOG_TYPE_ERROR)) {
          -[SCNMTLRenderContext _executeDrawCommand:].cold.5();
        }
        LODWORD(var5) = 0;
      }
      break;
    default:
      LODWORD(var5) = 0;
      goto LABEL_153;
  }
LABEL_154:
  int v188 = v381[729];
  v381[729] = var5;
  v189 = v368;
  BOOL v191 = self->_cache.material != v187 || v370 != v368;
  LODWORD(v372) = v191;
  self->_cache.material = v187;
  if (v187) {
    uint64_t CommonProfile = (__C3DEffectCommonProfile *)C3DMaterialGetCommonProfile((uint64_t)v187);
  }
  else {
    uint64_t CommonProfile = 0;
  }
  self->_cache.commonProfile = CommonProfile;
  geometry = self->_cache.geometry;
  self->_cache.geometry = var2;
  uint64_t Count = C3DSourceAccessorGetCount((uint64_t)self->_processingContext.dynamicBatchingSystem);
  BOOL v194 = EffectiveCalculationMode == 3 && v21;
  int v196 = self->_cache.node != v376 || v370 != v189 || v194;
  if (Count > 1) {
    int v196 = 1;
  }
  LODWORD(v364) = v196;
  self->_cache.node = v376;
  v197 = self->_cache.metalMesh;
  if (v11) {
    unint64_t v198 = (unint64_t)-[SCNMTLMesh tessellationVertexDescriptorHash](v197);
  }
  else {
    unint64_t v198 = -[SCNMTLMesh vertexDescriptorHash]((uint64_t)v197);
  }
  unint64_t v199 = v198;
  unint64_t vertexDescriptorHash = self->_cache.vertexDescriptorHash;
  self->_cache.unint64_t vertexDescriptorHash = v198;
  float v201 = 1.0;
  if (v376 && !v384.i32[0])
  {
    C3DNodeGetWorldAlpha((uint64_t)v376);
    float v201 = v202;
  }
  float32x4_t v452 = 0uLL;
  if (v385.i64[0])
  {
    BlendStates = (__C3DBlendStates *)C3DFXPassGetBlendStates(v385.i64[0]);
    if (!v187) {
      goto LABEL_186;
    }
  }
  else
  {
    BlendStates = 0;
    if (!v187) {
      goto LABEL_186;
    }
  }
  if (!BlendStates) {
    BlendStates = (__C3DBlendStates *)C3DMaterialGetBlendStates((uint64_t)v187, v384.i32[0] != 0, v373 != 0, (*((unsigned __int8 *)self + 152) >> 3) & 1, v452.f32, v201);
  }
LABEL_186:
  if (BlendStates
    && C3DBlendStatesNeedsConstantColor((uint64_t)BlendStates)
    && (renderEncoder = self->_renderEncoder,
        float32x4_t v207 = v452,
        uint32x4_t v208 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&renderEncoder->var10, v452)),
        (vmaxvq_u32(v208) & 0x80000000) != 0))
  {
    *(float32x4_t *)&renderEncoder->var10 = v452;
    v208.i32[0] = v207.i32[1];
    LODWORD(v205) = v207.i32[3];
    LODWORD(v204) = v207.i32[2];
    [(id)renderEncoder->var24[1] setBlendColorRed:*(double *)v207.i64 green:*(double *)v208.i64 blue:v204 alpha:v205];
    if (v187) {
      goto LABEL_190;
    }
  }
  else if (v187)
  {
LABEL_190:
    int v209 = C3DMaterialGetColorBufferWriteMask((uint64_t)v187);
    goto LABEL_193;
  }
  int v209 = 15;
LABEL_193:
  v210 = v368;
  if (v369[9].i8[4]) {
    int v211 = 0;
  }
  else {
    int v211 = v209;
  }
  int v212 = v381[728];
  v381[728] = v211;
  v213 = self->_cache.blendStates;
  self->_cache.blendStates = BlendStates;
  if (v370 == v210
    && vertexDescriptorHash == v199
    && v213 == BlendStates
    && v212 == v211
    && v134
    && v188 == var5)
  {
    goto LABEL_222;
  }
  if (v11) {
    id v214 = [(SCNMTLTessellator *)v365 newPipelineStateConfiguratorForMeshElement:self->_cache.metalMeshElement patchType:v369[9].i8[5] & 7 device:self->_device];
  }
  else {
    id v214 = 0;
  }
  int IsWarmUp = C3DEngineContextIsWarmUp((uint64_t)self->_engineContext);
  int v216 = IsWarmUp;
  if (*((char *)self + 152) < 0) {
    char v217 = 2;
  }
  else {
    char v217 = IsWarmUp;
  }
  if (self->_renderPassParameters.multiVertexOutputStreamGenerator == 2) {
    char v218 = 2;
  }
  else {
    char v218 = 1;
  }
  v219 = self->_cache.metalMesh;
  if (v382.i32[0])
  {
    uint64_t v220 = (uint64_t)-[SCNMTLMesh tessellationVertexDescriptorHash](v219);
    uint64_t v221 = (uint64_t)-[SCNMTLMesh tessellationVertexDescriptor](&self->_cache.metalMesh->super.isa);
  }
  else
  {
    uint64_t v220 = -[SCNMTLMesh vertexDescriptorHash]((uint64_t)v219);
    uint64_t v221 = -[SCNMTLResourceManager commandQueue]((uint64_t)self->_cache.metalMesh);
  }
  unsigned __int8 v222 = self->_renderPassParameters.eyeCount;
  unsigned __int8 renderMode = self->_renderPassParameters.renderMode;
  if (v381[896]) {
    errors = self->_compilationIssues.errors;
  }
  else {
    errors = 0;
  }
  resourceManager = self->_resourceManager;
  v435[0] = v368;
  v435[1] = v377;
  v435[2] = v374;
  v435[3] = v385.i64[0];
  v435[4] = v385.i64[0];
  v435[5] = BlendStates;
  v435[6] = v376;
  char v436 = v211;
  char v437 = (char)var5;
  unsigned __int8 v438 = v222;
  char v439 = v218;
  int v440 = 0;
  uint64_t v441 = v221;
  uint64_t v442 = v220;
  unsigned __int8 v443 = renderMode;
  char v444 = v217;
  int v445 = 0;
  __int16 v446 = 0;
  v447 = errors;
  __int8 v448 = v382.i8[0];
  memset(v449, 0, sizeof(v449));
  v450 = v214;
  uint64_t v451 = 0;
  renderPipeline = -[SCNMTLResourceManager renderResourceForProgramDesc:renderPassDescriptor:](resourceManager, "renderResourceForProgramDesc:renderPassDescriptor:", v435, self->_currentRenderPassDescriptor, v364);
  self->_cache.renderPipeline = renderPipeline;
  if (v214)
  {
    _Block_release(v214);
    renderPipeline = self->_cache.renderPipeline;
  }
  if ([(SCNMTLRenderPipeline *)renderPipeline state])
  {
    v227 = [(SCNMTLRenderPipeline *)self->_cache.renderPipeline state];
    v228 = self->_renderEncoder;
    if ((MTLRenderPipelineState *)v228->var23 != v227)
    {
      v228->var23 = (SCNMTLBufferPool *)v227;
      [(id)v228->var24[1] setRenderPipelineState:v227];
    }
LABEL_222:
    uint64_t v434 = 1;
    v229 = self->_cache.renderPipeline;
    if (!v229 || ![(SCNMTLRenderPipeline *)v229 state]) {
      return;
    }
    long long v432 = 0u;
    long long v433 = 0u;
    long long v430 = 0u;
    long long v431 = 0u;
    v230 = [(SCNMTLRenderPipeline *)self->_cache.renderPipeline frameBufferBindings];
    uint64_t v231 = [(NSArray *)v230 countByEnumeratingWithState:&v430 objects:v480 count:16];
    if (v231)
    {
      uint64_t v232 = v231;
      uint64_t v233 = *(void *)v431;
      do
      {
        for (uint64_t i = 0; i != v232; ++i)
        {
          if (*(void *)v431 != v233) {
            objc_enumerationMutation(v230);
          }
          v235 = *(void **)(*((void *)&v430 + 1) + 8 * i);
          uint64_t v236 = objc_msgSend(v235, "bindBlock", v364);
          (*(void (**)(uint64_t, void *, SCNMTLRenderContext *))(v236 + 16))(v236, v235, self);
        }
        uint64_t v232 = [(NSArray *)v230 countByEnumeratingWithState:&v430 objects:v480 count:16];
      }
      while (v232);
    }
    if ([(SCNMTLRenderPipeline *)self->_cache.renderPipeline passBufferBindings])
    {
      uint64_t Storage = C3DFXPassGetStorage(v385.i64[0]);
      long long v426 = 0u;
      long long v427 = 0u;
      long long v428 = 0u;
      long long v429 = 0u;
      v382.i64[0] = (uint64_t)[(SCNMTLRenderPipeline *)self->_cache.renderPipeline passBufferBindings];
      v385.i64[0] = [(id)v382.i64[0] countByEnumeratingWithState:&v426 objects:v479 count:16];
      if (v385.i64[0])
      {
        v384.i64[0] = *(void *)v427;
        p_resourceManagerMonitor = &self->_resourceManagerMonitor;
        v373 = (uint64_t *)&v478;
        do
        {
          uint64_t v238 = 0;
          do
          {
            if (*(void *)v427 != v384.i64[0]) {
              objc_enumerationMutation((id)v382.i64[0]);
            }
            uint64_t v239 = *(void *)(*((void *)&v426 + 1) + 8 * v238);
            if ([(id)v239 type])
            {
              if ([(id)v239 type] != 2) {
                goto LABEL_286;
              }
              id Weak = objc_loadWeak((id *)p_resourceManagerMonitor);
              v241 = Weak;
              uint64_t v242 = *(void *)(v239 + 56);
              if (*(_DWORD *)(v242 + 16) == 1)
              {
                uint64_t RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext);
                uint64_t TextureSampler = *(void **)(v242 + 64);
                if (!TextureSampler) {
                  uint64_t TextureSampler = *(void **)(v242 + 56);
                }
                id TextureNamed = C3D::Pass::inputTextureNamed((C3D::Pass *)self->_processingContext.renderGraphPass, (const char *)[TextureSampler UTF8String]);
                if (!TextureNamed)
                {
                  id TextureNamed = (id)C3DRenderGraphGetTextureNamed(RenderGraph, [TextureSampler UTF8String]);
                  if (!TextureNamed)
                  {
                    if (v241)
                    {
                      uint64_t v246 = [NSString stringWithFormat:@"No registered texture for binding %@ and symbol \"%@\" in pass or render graph.\nPass: %s (%p)\nRender graph: %p", v239, TextureSampler, (**(uint64_t (***)(void *))self->_processingContext.renderGraphPass)(self->_processingContext.renderGraphPass), self->_processingContext.renderGraphPass, RenderGraph];
                      goto LABEL_278;
                    }
LABEL_281:
                    id TextureNamed = [(SCNMTLResourceManager *)self->_resourceManager defaultTexture];
                  }
                }
LABEL_282:
                v271 = self->_renderEncoder;
                __int16 v272 = *(_WORD *)(v239 + 9);
                if ((_BYTE)v272 != 0xFF) {
                  SCNMTLRenderCommandEncoder::setVertexTexture((uint64_t)self->_renderEncoder, TextureNamed, (char)v272);
                }
                if ((~v272 & 0xFF00) != 0) {
                  SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v271, TextureNamed, (uint64_t)v272 >> 8);
                }
                goto LABEL_286;
              }
              if (Storage)
              {
                uint64_t v253 = *(void *)(v242 + 88);
                uint64_t v254 = *(void *)(Storage + v253);
                if (v254)
                {
                  uint64_t TextureSampler = (void *)C3DFXSamplerGetTextureSampler(*(void *)(Storage + v253));
                  id TextureNamed = (id)C3DFXSamplerGetTexture(v254);
                  if (TextureNamed
                    || (uint64_t Image = C3DFXSamplerGetImage(v254)) != 0
                    && (id TextureNamed = [(SCNMTLResourceManager *)self->_resourceManager renderResourceForImage:Image sampler:TextureSampler options:0 engineContext:self->_engineContext didFallbackToDefaultTexture:0]) != 0)
                  {
                    if (*(unsigned __int8 *)(v239 + 12) != 255 || *(unsigned __int8 *)(v239 + 11) != 255)
                    {
                      v255 = -[SCNMTLResourceManager renderResourceForSampler:]((uint64_t)self->_resourceManager, (uint64_t)TextureSampler);
                      v256 = v255;
                      v257 = self->_renderEncoder;
                      __int16 v258 = *(_WORD *)(v239 + 9);
                      if (*(unsigned char *)(v239 + 9) != 0xFF)
                      {
                        v259 = &v257->var0 + 8 * (char)v258;
                        if (*((void **)v259 + 200) != v255)
                        {
                          *((void *)v259 + 200) = v255;
                          [(id)v257->var24[1] setVertexSamplerState:v255 atIndex:(char)v258];
                        }
                      }
                      if ((~v258 & 0xFF00) != 0)
                      {
                        v260 = &v257->var0 + 8 * ((uint64_t)v258 >> 8);
                        if (*((void **)v260 + 406) != v256)
                        {
                          *((void *)v260 + 406) = v256;
                          objc_msgSend((id)v257->var24[1], "setFragmentSamplerState:atIndex:", v256);
                        }
                      }
                    }
                    goto LABEL_282;
                  }
                  if (!v241) {
                    goto LABEL_281;
                  }
                  v269 = NSString;
                  uint64_t Texture = C3DFXSamplerGetTexture(v254);
                  uint64_t v246 = [v269 stringWithFormat:@"No texture or image provided for binding %@ by sampler %@.\nTexture: %@\nImage: %@", v239, TextureSampler, Texture, C3DFXSamplerGetImage(v254)];
LABEL_278:
                  uint64_t v267 = v246;
                  goto LABEL_279;
                }
                if (!Weak) {
                  goto LABEL_281;
                }
                uint64_t v266 = [NSString stringWithFormat:@"No sampler found for binding %@ and input %@", v239, v242];
              }
              else
              {
                v265 = scn_default_log();
                if (os_log_type_enabled(v265, OS_LOG_TYPE_ERROR))
                {
                  -[SCNMTLRenderContext _executeDrawCommand:].cold.4(v477, (void *)v239, v373, v265);
                  if (!v241) {
                    goto LABEL_281;
                  }
                }
                else if (!v241)
                {
                  goto LABEL_281;
                }
                uint64_t v266 = [NSString stringWithFormat:@"No pass storage for binding %@", v239, v363];
              }
              uint64_t v267 = v266;
              uint64_t TextureSampler = (void *)v239;
LABEL_279:
              id TextureNamed = [(SCNMTLResourceManager *)self->_resourceManager defaultTexture];
              [v241 renderContext:self didFallbackToDefaultTextureForSource:TextureSampler message:v267];
              goto LABEL_282;
            }
            size_t v247 = [(id)v239 bufferSize];
            v383.i64[0] = (uint64_t)&v364;
            double v249 = MEMORY[0x270FA5388](v247);
            v250 = (char *)&v364 - v248;
            if (Storage)
            {
              if (objc_msgSend((id)v239, "inputsCount", v249) >= 1)
              {
                uint64_t v251 = 0;
                uint64_t v252 = 0;
                do
                {
                  memcpy(&v250[*(unsigned int *)(*(void *)(v239 + 48) + v251 + 8)], (const void *)(Storage + *(void *)(*(void *)(*(void *)(v239 + 48) + v251) + 88)), *(unsigned int *)(*(void *)(v239 + 48) + v251 + 12));
                  ++v252;
                  v251 += 16;
                }
                while (v252 < [(id)v239 inputsCount]);
              }
            }
            else
            {
              bzero((char *)&v364 - v248, v247);
            }
            __int16 v261 = *(_WORD *)(v239 + 9);
            v262 = self->_renderEncoder;
            long long v461 = 0uLL;
            *(void *)&long long v462 = 0;
            SCNMTLBufferPool::allocateAndCopy((SCNMTLBufferPool *)v262->var25[0], v250, v247, (void **)&v461);
            uint64_t v263 = *((void *)&v461 + 1);
            uint64_t v264 = v462;
            if ((_BYTE)v261 != 0xFF) {
              SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)v262, *((uint64_t *)&v461 + 1), v462, (char)v261);
            }
            if ((~v261 & 0xFF00) != 0) {
              SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v262, v263, v264, (uint64_t)v261 >> 8);
            }
LABEL_286:
            ++v238;
          }
          while (v238 != v385.i64[0]);
          v385.i64[0] = [(id)v382.i64[0] countByEnumeratingWithState:&v426 objects:v479 count:16];
        }
        while (v385.i64[0]);
      }
    }
    char v273 = (char)v372;
    if (geometry != v374) {
      char v273 = 1;
    }
    if ((v273 & 1) != 0 || v370 != v368)
    {
      v274 = self->_cache.material
           ? -[SCNMTLResourceManager renderResourceForMaterial:geometry:renderPipeline:engineContext:]((uint64_t)self->_resourceManager, v377, v374, self->_cache.renderPipeline, (uint64_t)self->_engineContext): 0;
      self->_cache.metalShadable = v274;
      long long v422 = 0u;
      long long v423 = 0u;
      long long v424 = 0u;
      long long v425 = 0u;
      v277 = [(SCNMTLRenderPipeline *)self->_cache.renderPipeline shadableBufferBindings];
      uint64_t v278 = [(NSArray *)v277 countByEnumeratingWithState:&v422 objects:v476 count:16];
      if (v278)
      {
        uint64_t v279 = v278;
        uint64_t v280 = *(void *)v423;
        do
        {
          for (uint64_t j = 0; j != v279; ++j)
          {
            if (*(void *)v423 != v280) {
              objc_enumerationMutation(v277);
            }
            v282 = *(void **)(*((void *)&v422 + 1) + 8 * j);
            uint64_t v283 = [v282 bindBlock];
            if (v283) {
              (*(void (**)(uint64_t, void *, SCNMTLRenderContext *))(v283 + 16))(v283, v282, self);
            }
          }
          uint64_t v279 = [(NSArray *)v277 countByEnumeratingWithState:&v422 objects:v476 count:16];
        }
        while (v279);
      }
    }
    uint64_t v284 = v375;
    if (v369[9].i8[3])
    {
      if ((*((unsigned char *)self + 152) & 0x20) != 0)
      {
        self->_lighting.currentLightingSet = ($70A9FA8AEE5A0967CD526EFEAE98D222)vadd_s8(v369[6], (int8x8_t)-1);
      }
      else
      {
        passInstance = self->_processingContext.passInstance;
        v490.columns[3] = (simd_float4)*((_OWORD *)passInstance + 201);
        v490.columns[2] = (simd_float4)*((_OWORD *)passInstance + 200);
        v490.columns[1] = (simd_float4)*((_OWORD *)passInstance + 199);
        p_resourceManagerMonitor = (SCNMTLRenderContextResourceManagerMonitor **)passInstance;
        v490.columns[0] = (simd_float4)*((_OWORD *)passInstance + 198);
        simd_float4x4 v491 = __invert_f4(v490);
        simd_float4 v384 = v491.columns[1];
        simd_float4 v385 = v491.columns[0];
        simd_float4 v382 = v491.columns[3];
        simd_float4 v383 = v491.columns[2];
        uint64_t v286 = (uint64_t)&v369[6];
        v287 = self->_cache.renderPipeline;
        unint64_t v288 = *(void *)&v369[6] ^ (unint64_t)v287 ^ self->_renderPassParameters.eyeCount ^ (unint64_t)self->_renderPassParameters.renderMode;
        unint64_t v421 = v288;
        if (self->_lighting.currentLightingHashKey != v288)
        {
          self->_lighting.currentLightingHashKey = v288;
          v373 = [(SCNMTLRenderPipeline *)v287 lightBufferBindings];
          if (v373)
          {
            C3DLightingSystemGetLightingSetDesc((uint64_t)self->_processingContext.lightingSystem, v286, (unint64_t *)&self->_lighting.currentLightingDesc);
            *(void *)&long long v461 = &v421;
            v377 = std::__hash_table<std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,SCNMTLLightSetData>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_lighting.frameLightingSetDatas, &v421, (uint64_t)&std::piecewise_construct, (void **)&v461);
            if (*((void *)v377 + 3))
            {
              long long v412 = 0u;
              long long v413 = 0u;
              long long v410 = 0u;
              long long v411 = 0u;
              uint64_t v289 = [v373 countByEnumeratingWithState:&v410 objects:v474 count:16];
              if (v289)
              {
                uint64_t v290 = v289;
                uint64_t v291 = *(void *)v411;
                do
                {
                  for (uint64_t k = 0; k != v290; ++k)
                  {
                    if (*(void *)v411 != v291) {
                      objc_enumerationMutation(v373);
                    }
                    v293 = self->_renderEncoder;
                    uint64_t v294 = *((void *)v377 + 3);
                    uint64_t v295 = *((void *)v377 + 4);
                    int v296 = *(unsigned __int16 *)(*(void *)(*((void *)&v410 + 1) + 8 * k) + 9);
                    if (*(unsigned char *)(*(void *)(*((void *)&v410 + 1) + 8 * k) + 9) != 0xFF) {
                      SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, *((void *)v377 + 3), *((void *)v377 + 4), (char)v296);
                    }
                    if ((~v296 & 0xFF00) != 0) {
                      SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v293, v294, v295, (uint64_t)(__int16)v296 >> 8);
                    }
                  }
                  uint64_t v290 = [v373 countByEnumeratingWithState:&v410 objects:v474 count:16];
                }
                while (v290);
              }
            }
            else
            {
              long long v419 = 0u;
              long long v420 = 0u;
              long long v417 = 0u;
              long long v418 = 0u;
              v372 = (__C3DGeometry *)[v373 countByEnumeratingWithState:&v417 objects:v475 count:16];
              if (v372)
              {
                geometry = *(__C3DGeometry **)v418;
                do
                {
                  v297 = 0;
                  do
                  {
                    if (*(__C3DGeometry **)v418 != geometry) {
                      objc_enumerationMutation(v373);
                    }
                    v374 = v297;
                    uint64_t v298 = *(void *)(*((void *)&v417 + 1) + 8 * (void)v297);
                    if ([(id)v298 semanticsCount] >= 1)
                    {
                      uint64_t v299 = [(id)v298 bufferSize] * self->_renderPassParameters.eyeCount;
                      v300 = v377;
                      *((void *)v377 + 5) = v299;
                      uint64_t v415 = 0;
                      BOOL v414 = 0;
                      uint64_t v416 = 0;
                      SCNMTLBufferPool::allocate((SCNMTLBufferPool *)self->_frameConstantBufferPool, v299, &v414);
                      uint64_t v301 = v416;
                      *((void *)v300 + 3) = v415;
                      *((void *)v300 + 4) = v301;
                      if (self->_renderPassParameters.eyeCount)
                      {
                        unint64_t v302 = 0;
                        do
                        {
                          uint64_t v303 = 0;
                          v304 = (float32x4_t *)&p_resourceManagerMonitor[8 * v302];
                          float32x4_t v305 = v304[198];
                          float32x4_t v306 = v304[199];
                          float32x4_t v307 = v304[200];
                          float32x4_t v308 = v304[201];
                          long long v481 = (__int128)v385;
                          long long v482 = (__int128)v384;
                          long long v483 = (__int128)v383;
                          long long v484 = (__int128)v382;
                          do
                          {
                            *(long long *)((char *)&v461 + v303) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v305, COERCE_FLOAT(*(long long *)((char *)&v481 + v303))), v306, *(float32x2_t *)((char *)&v481 + v303), 1), v307, *(float32x4_t *)((char *)&v481 + v303), 2), v308, *(float32x4_t *)((char *)&v481 + v303), 3);
                            v303 += 16;
                          }
                          while (v303 != 64);
                          uint64_t v309 = 0;
                          long long v310 = v462;
                          long long v311 = v463;
                          long long v312 = v464;
                          *(_OWORD *)&self->_lighting.needLightingSpaceTransformation = v461;
                          *(_OWORD *)&self->_anon_3848[8] = v310;
                          *(_OWORD *)&self->_anon_3848[24] = v311;
                          *(_OWORD *)&self->_anon_3848[40] = v312;
                          long long v481 = (__int128)v385;
                          long long v482 = (__int128)v384;
                          long long v483 = (__int128)v383;
                          long long v484 = (__int128)v382;
                          do
                          {
                            *(long long *)((char *)&v461 + v309) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v305, COERCE_FLOAT(*(long long *)((char *)&v481 + v309))), v306, *(float32x2_t *)((char *)&v481 + v309), 1), v307, *(float32x4_t *)((char *)&v481 + v309), 2), v308, *(float32x4_t *)((char *)&v481 + v309), 3);
                            v309 += 16;
                          }
                          while (v309 != 64);
                          long long v313 = v462;
                          long long v314 = v463;
                          long long v315 = v464;
                          *(_OWORD *)&self->_anon_3848[56] = v461;
                          *(_OWORD *)&self->_anon_3848[72] = v313;
                          *(_OWORD *)&self->_anon_3848[88] = v314;
                          *(_OWORD *)&self->_anon_3848[104] = v315;
                          unsigned __int8 *v381 = 1;
                          if ([(id)v298 semanticsCount] >= 1)
                          {
                            uint64_t v316 = 0;
                            uint64_t v317 = 0;
                            do
                            {
                              (*(void (**)(void))(*(void *)(*(void *)(v298 + 48) + v316) + 16))();
                              ++v317;
                              v316 += 16;
                            }
                            while (v317 < [(id)v298 semanticsCount]);
                          }
                          uint64_t v318 = [(id)v298 bufferSize];
                          v414 += v318;
                          ++v302;
                        }
                        while (v302 < self->_renderPassParameters.eyeCount);
                      }
                    }
                    v319 = self->_renderEncoder;
                    uint64_t v320 = *((void *)v377 + 3);
                    uint64_t v321 = *((void *)v377 + 4);
                    __int16 v322 = *(_WORD *)(v298 + 9);
                    if ((_BYTE)v322 != 0xFF) {
                      SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, *((void *)v377 + 3), *((void *)v377 + 4), (char)v322);
                    }
                    if ((~v322 & 0xFF00) != 0) {
                      SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v319, v320, v321, (uint64_t)v322 >> 8);
                    }
                    v297 = (__C3DGeometry *)((char *)&v374->var0.var0.var0 + 1);
                  }
                  while ((__C3DGeometry *)((char *)&v374->var0.var0.var0 + 1) != v372);
                  v372 = (__C3DGeometry *)[v373 countByEnumeratingWithState:&v417 objects:v475 count:16];
                }
                while (v372);
              }
            }
          }
        }
        uint64_t v284 = v375;
      }
    }
    if (v364)
    {
      if ((*((unsigned char *)self + 152) & 0x20) != 0) {
        *(void *)&self->_anon_31b8[1336] = v378;
      }
      long long v408 = 0u;
      long long v409 = 0u;
      long long v406 = 0u;
      long long v407 = 0u;
      v385.i64[0] = (uint64_t)[(SCNMTLRenderPipeline *)self->_cache.renderPipeline nodeBufferBindings];
      uint64_t v323 = [(id)v385.i64[0] countByEnumeratingWithState:&v406 objects:v473 count:16];
      if (v323)
      {
        uint64_t v324 = v323;
        uint64_t v325 = *(void *)v407;
        v382.i64[0] = (uint64_t)&v481 + 4;
        p_resourceManagerMonitor = (SCNMTLRenderContextResourceManagerMonitor **)((char *)&v414 + 1);
        v383.i64[0] = v325;
        do
        {
          uint64_t v326 = 0;
          v384.i64[0] = v324;
          do
          {
            if (*(void *)v407 != v325) {
              objc_enumerationMutation((id)v385.i64[0]);
            }
            uint64_t v327 = *(void *)(*((void *)&v406 + 1) + 8 * v326);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([(id)v327 semanticsCount] < 1)
              {
                v341 = scn_default_log();
                if (os_log_type_enabled(v341, OS_LOG_TYPE_ERROR)) {
                  [(SCNMTLRenderContext *)(uint8_t *)&v414 _executeDrawCommand:v341];
                }
              }
              else
              {
                uint64_t v328 = [(id)v327 bufferSize];
                uint64_t v329 = self->_renderPassParameters.eyeCount;
                v396[0] = MEMORY[0x263EF8330];
                v396[1] = 3221225472;
                v397 = __43__SCNMTLRenderContext__executeDrawCommand___block_invoke;
                v398 = &unk_264006C80;
                uint64_t v401 = v284;
                v402 = v378;
                int v404 = EffectiveCalculationMode;
                int v405 = v329;
                uint64_t v403 = v328;
                v399 = self;
                uint64_t v400 = v327;
                uint64_t CurrentBatchNodes = C3DDynamicBatchingSystemGetCurrentBatchNodes((uint64_t)self->_processingContext.dynamicBatchingSystem, &v434);
                size_t v331 = v328 * v329;
                if (v434 < 2)
                {
                  double v342 = MEMORY[0x270FA5388](CurrentBatchNodes);
                  ((void (*)(void *, __C3DNode *, char *, double))v397)(v396, v376, (char *)&v364 - ((v331 + 15) & 0xFFFFFFFFFFFFFFF0), v342);
                  int v343 = *(unsigned __int16 *)(v327 + 9);
                  v344 = self->_renderEncoder;
                  long long v461 = 0uLL;
                  *(void *)&long long v462 = 0;
                  SCNMTLBufferPool::allocateAndCopy((SCNMTLBufferPool *)v344->var25[0], (char *)&v364 - ((v331 + 15) & 0xFFFFFFFFFFFFFFF0), v331, (void **)&v461);
                  uint64_t v345 = *((void *)&v461 + 1);
                  uint64_t v346 = v462;
                  if ((_BYTE)v343 != 0xFF) {
                    SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)v344, *((uint64_t *)&v461 + 1), v462, (char)v343);
                  }
                  if ((~v343 & 0xFF00) != 0) {
                    SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v344, v345, v346, (uint64_t)(__int16)v343 >> 8);
                  }
                  uint64_t v284 = v375;
                }
                else
                {
                  uint64_t v332 = CurrentBatchNodes;
                  long long v461 = 0uLL;
                  *(void *)&long long v462 = 0;
                  SCNMTLBufferPool::allocate((SCNMTLBufferPool *)self->_frameConstantBufferPool, v434 * v331, &v461);
                  if (v434 >= 1)
                  {
                    uint64_t v333 = 0;
                    uint64_t v334 = v461;
                    do
                    {
                      ((void (*)(void *, void, uint64_t))v397)(v396, *(void *)(v332 + 8 * v333), v334);
                      v334 += v331;
                      ++v333;
                    }
                    while (v333 < v434);
                  }
                  v335 = self->_renderEncoder;
                  uint64_t v336 = *((void *)&v461 + 1);
                  uint64_t v337 = v462;
                  int v338 = *(unsigned __int16 *)(v327 + 9);
                  if (*(unsigned char *)(v327 + 9) != 0xFF) {
                    SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, *((uint64_t *)&v461 + 1), v462, (char)v338);
                  }
                  if ((~v338 & 0xFF00) != 0) {
                    SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v335, v336, v337, (uint64_t)(__int16)v338 >> 8);
                  }
                }
                uint64_t v325 = v383.i64[0];
                uint64_t v324 = v384.i64[0];
              }
            }
            else
            {
              if (![(id)v327 bindBlock])
              {
                v339 = scn_default_log();
                if (os_log_type_enabled(v339, OS_LOG_TYPE_FAULT)) {
                  [(SCNMTLRenderContext *)(uint8_t *)&v481 _executeDrawCommand:v339];
                }
              }
              uint64_t v340 = [(id)v327 bindBlock];
              (*(void (**)(uint64_t, uint64_t, SCNMTLRenderContext *))(v340 + 16))(v340, v327, self);
            }
            ++v326;
          }
          while (v326 != v324);
          uint64_t v324 = [(id)v385.i64[0] countByEnumeratingWithState:&v406 objects:v473 count:16];
        }
        while (v324);
      }
    }
    if (v370 != v368)
    {
      v347 = self->_renderEncoder;
      buffer = self->_sceneUniforms.buffer;
      unint64_t offset = self->_sceneUniforms.offset;
      $E8FEF9D34A3DFDCB69CDC2374B44012F sceneBuffer = self->_cache.renderPipeline->_sceneBuffer;
      if (sceneBuffer.vertexIndex != -1) {
        SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, (uint64_t)self->_sceneUniforms.buffer, self->_sceneUniforms.offset, sceneBuffer.vertexIndex);
      }
      if ((~*(_WORD *)&sceneBuffer & 0xFF00) != 0) {
        SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)v347, (uint64_t)buffer, offset, (uint64_t)*(__int16 *)&sceneBuffer >> 8);
      }
    }
    uint64_t v351 = v434;
    if (v376 && v434 <= 1)
    {
      int32x4_t v352 = *(int32x4_t *)&self->_nodeUniforms.probeCacheIndex;
      int32x4_t v353 = *(int32x4_t *)&self->_anon_31b8[8];
      float32x4_t v354 = vmulq_f32(*(float32x4_t *)&self->_nodeUniforms.instanceNode, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v353, (int8x16_t)v353, 0xCuLL), (int8x16_t)v353, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v352, v352), (int8x16_t)v352, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v353, v353), (int8x16_t)v353, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v352, (int8x16_t)v352, 0xCuLL), (int8x16_t)v352, 8uLL)));
      unint64_t v355 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v354, 2), vaddq_f32(v354, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v354.f32, 1))).f32[0] > 0.0;
      v356 = self->_renderEncoder;
      int v357 = v366;
      int v358 = HIDWORD(v364);
      if (v356->var0) {
        unint64_t v355 = *((void *)&xmmword_20B5CD570 + v355);
      }
      if (v356->var1 == v355) {
        goto LABEL_402;
      }
    }
    else
    {
      v356 = self->_renderEncoder;
      unint64_t v355 = !v356->var0;
      int v357 = v366;
      int v358 = HIDWORD(v364);
      if (v356->var1 == v355)
      {
LABEL_402:
        if (v358)
        {
          -[SCNMTLRenderContext _setMeshBuffers:]((uint64_t)self, (uint64_t)self->_cache.metalMesh);
          uint64_t v351 = v434;
        }
        if (v351 <= 1) {
          uint64_t v351 = -[SCNMTLResourceManager stats]((uint64_t)self->_cache.metalMeshElement);
        }
        if (v357)
        {
          if (v351 <= 1) {
            int v359 = 1;
          }
          else {
            int v359 = v351;
          }
          char v360 = v369[9].i8[5] & 7;
          v361 = self->_renderEncoder;
          simd_float4 v362 = *(simd_float4 *)v367;
          simd_float4 v384 = *(simd_float4 *)(v381 + 664);
          simd_float4 v385 = v362;
          SCNMTLRenderCommandEncoder::_bindPendingTextures(v361);
          SCNMTLRenderCommandEncoder::applyChangedStates(v361);
          v390[0] = v385;
          v390[1] = v384;
          int v391 = v359;
          int v392 = 0;
          v393 = self;
          char v394 = v360;
          v395[0] = 0;
          *(_DWORD *)((char *)v395 + 3) = 0;
          [(SCNMTLTessellator *)v365 draw:v390];
        }
        else
        {
          -[SCNMTLRenderContext _drawMeshElement:instanceCount:]((uint64_t)self, (uint64_t)self->_cache.metalMeshElement, v351);
        }
        return;
      }
    }
    v356->var1 = v355;
    v356->var5 = 1;
    goto LABEL_402;
  }
  self->_cache.renderPipeline = 0;
  self->_cache.program = 0;
  if (v216)
  {
    if (v377) {
      -[SCNMTLRenderContext _prepareMaterialTextures:](self, "_prepareMaterialTextures:");
    }
  }
  else if ((-[SCNMTLRenderContext _executeDrawCommand:]::done & 1) == 0)
  {
    -[SCNMTLRenderContext _executeDrawCommand:]::done = 1;
    v275 = scn_default_log();
    if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLRenderContext _executeDrawCommand:]();
    }
  }
}

uint64_t __43__SCNMTLRenderContext__executeDrawCommand___block_invoke(uint64_t result, float32x4_t *a2)
{
  uint64_t v2 = result;
  *(void *)(*(void *)(result + 32) + 14048) = a2;
  if (a2)
  {
    WorldTransformPtr = (_OWORD *)C3DTransformTreeGetWorldTransformPtr(*(__C3DTransformTree **)(*(void *)(result + 32) + 2272), a2[5].i32[2]);
    long long v5 = WorldTransformPtr[1];
    long long v6 = WorldTransformPtr[2];
    long long v7 = WorldTransformPtr[3];
    uint64_t v8 = *(_OWORD **)(v2 + 32);
    v8[794] = *WorldTransformPtr;
    v8[795] = v5;
    v8[796] = v6;
    v8[797] = v7;
    uint64_t v9 = *(void *)(v2 + 48);
    if (v9)
    {
      *(double *)&long long v10 = C3DSkinnerAdjustTransformIfUsesNodeTransformCalculationMode(v9, *(_DWORD *)(v2 + 72), *(float32x4_t *)(*(void *)(v2 + 32) + 12704), *(float32x4_t *)(*(void *)(v2 + 32) + 12720), *(float32x4_t *)(*(void *)(v2 + 32) + 12736), *(float32x4_t *)(*(void *)(v2 + 32) + 12752));
      uint64_t v11 = *(_OWORD **)(v2 + 32);
      v11[794] = v10;
      v11[795] = v12;
      v11[796] = v13;
      v11[797] = v14;
    }
    double result = (uint64_t)C3DNodeGetLastFrameWorldMatrix(a2);
    long long v15 = *(_OWORD *)(result + 16);
    long long v16 = *(_OWORD *)(result + 32);
    long long v17 = *(_OWORD *)(result + 48);
    BOOL v18 = *(_OWORD **)(v2 + 32);
    v18[798] = *(_OWORD *)result;
    v18[799] = v15;
    v18[800] = v16;
    v18[801] = v17;
  }
  else
  {
    long long v19 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    long long v20 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
    long long v21 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
    char v22 = *(_OWORD **)(result + 32);
    v22[794] = *MEMORY[0x263EF89A8];
    v22[795] = v19;
    v22[796] = v20;
    v22[797] = v21;
    BOOL v23 = *(_OWORD **)(result + 32);
    v23[801] = v23[797];
    v23[800] = v23[796];
    v23[799] = v23[795];
    v23[798] = v23[794];
  }
  *(_DWORD *)(*(void *)(v2 + 32) + 14056) = 0;
  *(void *)(*(void *)(v2 + 32) + 14064) = *(void *)(v2 + 56);
  if (*(_DWORD *)(v2 + 76))
  {
    unint64_t v24 = 0;
    do
    {
      double result = [*(id *)(v2 + 40) semanticsCount];
      if (result >= 1)
      {
        uint64_t v25 = 0;
        for (uint64_t i = 0; i < result; ++i)
        {
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(v2 + 40) + 48) + v25) + 16))();
          double result = [*(id *)(v2 + 40) semanticsCount];
          v25 += 16;
        }
      }
      ++v24;
    }
    while (v24 < *(unsigned int *)(v2 + 76));
  }
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  int v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 2) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 2;
    if (a6)
    {
      uint64_t v7 = 0;
      long long v8 = *(_OWORD *)(a4 + 12704);
      long long v9 = *(_OWORD *)(a4 + 12720);
      long long v10 = *(_OWORD *)(a4 + 12736);
      long long v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        uint64_t v12 = 0;
        long long v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        float32x4_t v14 = *v13;
        float32x4_t v15 = v13[1];
        float32x4_t v16 = v13[2];
        float32x4_t v17 = v13[3];
        v26[0] = v8;
        v26[1] = v9;
        v26[2] = v10;
        v26[3] = v11;
        do
        {
          v27[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v26[v12])), v15, *(float32x2_t *)&v26[v12], 1), v16, (float32x4_t)v26[v12], 2), v17, (float32x4_t)v26[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        long long v18 = v27[1];
        long long v19 = v27[2];
        long long v20 = v27[3];
        long long v21 = (_OWORD *)(a4 + 13216 + (v7 << 6));
        _OWORD *v21 = v27[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
  }
  uint64_t v22 = a4 + ((unint64_t)a5 << 6);
  __n128 result = *(__n128 *)(v22 + 13216);
  long long v24 = *(_OWORD *)(v22 + 13232);
  long long v25 = *(_OWORD *)(v22 + 13264);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v22 + 13248);
  *(_OWORD *)(a2 + 48) = v25;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v24;
  return result;
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_275(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 40) == 1) {
    C3DEffectCommonProfileIsUsingAmbientOcclusion(*(void *)(a3 + 15240));
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(char *)(a2 + 9);
  uint64_t v6 = *(char *)(a2 + 10);
  uint64_t v7 = (void *)[*(id *)(a3 + 15232) bufferAtIndices:*(unsigned __int16 *)(a2 + 9)];
  if ([v7 buffer])
  {
    long long v8 = *(void **)(a2 + 16);
    if (v8)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*(void *)(a3 + 248) + 3392) useResource:*(void *)(*((void *)&v26 + 1) + 8 * i) usage:4];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v33 count:16];
        }
        while (v10);
      }
    }
    uint64_t v13 = *(void *)(a3 + 248);
    uint64_t v14 = [v7 buffer];
    uint64_t v15 = [v7 offset];
    __int16 v16 = *(_WORD *)(a2 + 9);
    if ((_BYTE)v16 != 0xFF) {
      SCNMTLRenderCommandEncoder::setVertexBuffer(v13, v14, v15, (char)v16);
    }
    if ((~v16 & 0xFF00) != 0)
    {
      uint64_t v17 = (uint64_t)v16 >> 8;
      uint64_t v18 = v13;
      uint64_t v19 = v14;
      uint64_t v20 = v15;
LABEL_14:
      SCNMTLRenderCommandEncoder::setFragmentBuffer(v18, v19, v20, v17);
    }
  }
  else if (v5 != -1 && (uint64_t v21 = *(void *)(a3 + 248), !*(void *)(v21 + 16 * v5 + 80)) {
         || v6 != -1 && (uint64_t v21 = *(void *)(a3 + 248), !*(void *)(v21 + 16 * v6 + 1728)))
  }
  {
    uint64_t v22 = objc_msgSend((id)objc_msgSend((id)a2, "argument"), "bufferDataSize");
    __int16 v23 = *(_WORD *)(a2 + 9);
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    SCNMTLBufferPool::allocate(*(SCNMTLBufferPool **)(v21 + 3400), v22, &v30);
    bzero(v30, v22);
    uint64_t v24 = v31;
    uint64_t v25 = v32;
    if ((_BYTE)v23 != 0xFF) {
      SCNMTLRenderCommandEncoder::setVertexBuffer(v21, v31, v32, (char)v23);
    }
    if ((~v23 & 0xFF00) != 0)
    {
      uint64_t v17 = (uint64_t)v23 >> 8;
      uint64_t v18 = v21;
      uint64_t v19 = v24;
      uint64_t v20 = v25;
      goto LABEL_14;
    }
  }
}

- (uint64_t)device
{
  if (result) {
    return *(void *)(result + 120);
  }
  return result;
}

- (void)irradianceTextureForEffectSlot:(void *)result
{
  if (result)
  {
    char v3 = result;
    uint64_t PrecomputedLightingEnvironment = C3DEffectSlotGetPrecomputedLightingEnvironment(a2);
    uint64_t v5 = (void *)v3[14];
    if (PrecomputedLightingEnvironment)
    {
      return objc_msgSend(v5, "irradianceTextureForPrecomputedLightingEnvironment:");
    }
    else
    {
      __n128 result = (void *)[v5 renderResourceForEffectSlot:a2 withEngineContext:v3[18] didFallbackToDefaultTexture:0];
      if (result)
      {
        uint64_t v6 = result;
        if ([result textureType] == 5)
        {
          uint64_t LightProbesSystem = v3[279];
          if (LightProbesSystem) {
            uint64_t LightProbesSystem = C3DLightingSystemGetLightProbesSystem(LightProbesSystem);
          }
          long long v8 = (void *)v3[14];
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 3221225472;
          v9[2] = __54__SCNMTLRenderContext_irradianceTextureForEffectSlot___block_invoke;
          v9[3] = &__block_descriptor_40_e21_v16__0___MTLBuffer__8l;
          v9[4] = LightProbesSystem;
          return (void *)[v8 irradianceTextureForEnvironmentTexture:v6 renderContext:v3 applySH:v9];
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)radianceTextureForEffectSlot:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t PrecomputedLightingEnvironment = C3DEffectSlotGetPrecomputedLightingEnvironment(a2);
  uint64_t v5 = (void *)a1[14];
  if (PrecomputedLightingEnvironment)
  {
    return objc_msgSend(v5, "radianceTextureForPrecomputedLightingEnvironment:");
  }
  uint64_t v7 = (void *)[v5 renderResourceForEffectSlot:a2 withEngineContext:a1[18] didFallbackToDefaultTexture:0];
  if (!v7) {
    return 0;
  }
  long long v8 = v7;
  if ([v7 textureType] != 5) {
    return 0;
  }
  uint64_t v9 = (void *)a1[14];
  uint64_t v10 = a1[18];
  uint64_t v11 = -[SCNMTLRenderContext resourceCommandBuffer](a1);

  return [v9 radianceTextureForEnvironmentTexture:v8 engineContext:v10 commandBuffer:v11];
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_2_366(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Scene = C3DEngineContextGetScene(*(void *)(a3 + 144));
  LightingEnvironmentuint64_t EffectSlot = C3DSceneGetLightingEnvironmentEffectSlot(Scene, 0);
  if (!LightingEnvironmentEffectSlot
    || (uint64_t v7 = LightingEnvironmentEffectSlot, !C3DEffectSlotHasImageOrTexture(LightingEnvironmentEffectSlot))
    && !C3DEffectSlotHasPrecomputedLightingEnvironment(v7)
    || (long long v8 = (void *)-[SCNMTLRenderContext radianceTextureForEffectSlot:]((void *)a3, v7)) == 0)
  {
    if (!C3DEngineContextGetAllowsDefaultLightingEnvironmentFallback(*(void *)(a3 + 144))
      || (long long v8 = (void *)[*(id *)(a3 + 112) defaultLightingEnvironmentRadianceTexture]) == 0)
    {
      long long v8 = (void *)[*(id *)(a3 + 112) defaultCubeTexture];
    }
  }
  uint64_t v9 = *(void *)(a3 + 248);
  __int16 v10 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v10 != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(v9, v8, (char)v10);
  }
  if ((~v10 & 0xFF00) != 0)
  {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v9, v8, (uint64_t)v10 >> 8);
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_3_372(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Scene = C3DEngineContextGetScene(*(void *)(a3 + 144));
  LightingEnvironmentuint64_t EffectSlot = C3DSceneGetLightingEnvironmentEffectSlot(Scene, 0);
  if (!LightingEnvironmentEffectSlot
    || (uint64_t v7 = LightingEnvironmentEffectSlot, !C3DEffectSlotHasImageOrTexture(LightingEnvironmentEffectSlot))
    && !C3DEffectSlotHasPrecomputedLightingEnvironment(v7)
    || (long long v8 = -[SCNMTLRenderContext irradianceTextureForEffectSlot:]((void *)a3, v7)) == 0)
  {
    if (!C3DEngineContextGetAllowsDefaultLightingEnvironmentFallback(*(void *)(a3 + 144))
      || (long long v8 = (void *)[*(id *)(a3 + 112) defaultLightingEnvironmentIrradianceTexture]) == 0)
    {
      long long v8 = (void *)[*(id *)(a3 + 112) defaultCubeTexture];
    }
  }
  uint64_t v9 = *(void *)(a3 + 248);
  __int16 v10 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v10 != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(v9, v8, (char)v10);
  }
  if ((~v10 & 0xFF00) != 0)
  {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v9, v8, (uint64_t)v10 >> 8);
  }
}

- (uint64_t)resourceComputeEncoder
{
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 256)) {
    [(id)a1 _createResourceCommandBufferIfNeeded];
  }
  if (*(void *)(a1 + 264)) {
    SCNMTLBlitCommandEncoder::endEncoding((SCNMTLBlitCommandEncoder *)(a1 + 264));
  }
  uint64_t v2 = a1 + 280;
  if (!*(void *)(a1 + 1936)) {
    SCNMTLComputeCommandEncoder::beginEncoding((void *)(a1 + 280), *(void **)(a1 + 256), *(_DWORD *)(a1 + 136), @"ResourceComputeEncoder", *(void *)(a1 + 2088));
  }
  return v2;
}

- (uint64_t)compilationErrors
{
  if (result) {
    return *(void *)(result + 15432);
  }
  return result;
}

- (BOOL)collectsCompilationErrors
{
  if (result) {
    return *(unsigned char *)(result + 15424) != 0;
  }
  return result;
}

- (void)beginFrame:(uint64_t)a1
{
  if (a1)
  {
    ++*(void *)(a1 + 8);
    *(_OWORD *)(a1 + 15440) = 0u;
    [*(id *)(a1 + 112) reloadPipelinesIfNeeded];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 168), 0xFFFFFFFFFFFFFFFFLL);
    atomic_fetch_add((atomic_uint *volatile)(a1 + 176), 1u);

    *(void *)(a1 + 184) = 0;
    *(void *)(a1 + 192) = 0;
    *(unsigned char *)(a1 + 213) = 0;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v5 = a2;
    if (isKindOfClass)
    {
      *(void *)(a1 + 192) = v5;
      *(unsigned char *)(a1 + 213) = [v5 presentsWithTransaction];
    }
    else
    {
      *(void *)(a1 + 184) = v5;
    }
    uint64_t v6 = *(SCNMTLBufferPool **)(a1 + 8 * (*(void *)(a1 + 8) % 3) + 2064);
    *(void *)(a1 + 2088) = v6;
    SCNMTLBufferPool::reset(v6);
    uint64_t v7 = *(SCNMTLBufferPool **)(a1 + 8 * (*(void *)(a1 + 8) % 3) + 2000);
    *(void *)(a1 + 2024) = v7;
    SCNMTLBufferPool::reset(v7);
    SCNMTLTexturePool::reset(*(SCNMTLTexturePool **)(a1 + 2096));
    long long v8 = *(void **)(a1 + 15536);
    if (!v8)
    {
      os_variant_has_internal_diagnostics();
      long long v8 = (void *)[(id)-[SCNMTLRenderContext commandQueue](a1) commandBuffer];
    }
    *(void *)(a1 + 240) = v8;
    if (*(unsigned char *)(a1 + 15424))
    {
      [*(id *)(a1 + 15432) removeAllObjects];
      long long v8 = *(void **)(a1 + 240);
    }
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3052000000;
    v11[3] = __Block_byref_object_copy__3;
    uint64_t v9 = *(void *)(a1 + 168);
    v11[4] = __Block_byref_object_dispose__3;
    v11[5] = v9;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __34__SCNMTLRenderContext_beginFrame___block_invoke;
    v10[3] = &unk_264006BC0;
    v10[4] = a1;
    v10[5] = v11;
    [v8 addCompletedHandler:v10];
    _Block_object_dispose(v11, 8);
  }
}

- (void)_createResourceCommandBufferIfNeeded
{
  if (!self->_resourceCommandBuffer)
  {
    os_variant_has_internal_diagnostics();
    char v3 = (MTLCommandBuffer *)[(id)-[SCNMTLRenderContext commandQueue]((uint64_t)self) commandBuffer];
    self->_resourceCommandBuffer = v3;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __59__SCNMTLRenderContext__createResourceCommandBufferIfNeeded__block_invoke;
    v4[3] = &unk_264006BE8;
    v4[4] = self;
    [(MTLCommandBuffer *)v3 addCompletedHandler:v4];
    [(MTLCommandBuffer *)self->_resourceCommandBuffer enqueue];
  }
}

- (uint64_t)commandQueue
{
  if (!a1) {
    return 0;
  }
  if (*(void *)(a1 + 15536)) {
    return [*(id *)(a1 + 15536) commandQueue];
  }
  uint64_t v2 = *(void *)(a1 + 15560);
  if (v2) {
    return v2;
  }
  uint64_t v2 = *(void *)(a1 + 160);
  if (v2) {
    return v2;
  }
  return -[SCNMTLResourceManager commandQueue](*(void *)(a1 + 112));
}

- (double)stopProcessingRendererElements:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      if (*(unsigned char *)(a1 + 2264))
      {
        uint64_t AuthoringEnvironment = C3DEngineContextGetAuthoringEnvironment(*(void *)(a1 + 144), 0);
        if (AuthoringEnvironment)
        {
          if (C3DAuthoringEnvironmentShouldDisplayLightInfluences(AuthoringEnvironment)
            && !*(void *)(*(void *)(a1 + 2224) + 4760))
          {
            SCNMTLClusterSystem::displayInfoDebug(a1 + 14544);
          }
        }
      }
      uint64_t v4 = *(void *)(a1 + 15544);
      if ((v4 & 0x10) != 0)
      {
        [(id)a1 _drawPBRTextures];
        uint64_t v4 = *(void *)(a1 + 15544);
      }
      if ((v4 & 8) != 0) {
        [(id)a1 _drawShadowMaps];
      }
    }
    *(void *)(a1 + 2272) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 2256) = 0u;
    *(_OWORD *)(a1 + 2240) = 0u;
    *(_OWORD *)(a1 + 2224) = 0u;
  }
  return result;
}

- (uint64_t)frameTexturePool
{
  if (result) {
    return *(void *)(result + 2096);
  }
  return result;
}

- (uint64_t)frameConstantBufferPool
{
  if (result) {
    return *(void *)(result + 2088);
  }
  return result;
}

- (uint64_t)setSampleCount:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    double result = SCNMTLDeviceSupportedSampleCountForSampleCount(*(void **)(result + 120), a2);
    *(void *)(v2 + 96) = result;
  }
  return result;
}

- (uint64_t)features
{
  if (result) {
    return *(unsigned int *)(result + 136);
  }
  return result;
}

- (void)initWithDevice:(uint64_t)a3 engineContext:
{
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    __int16 v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLRenderContext initWithDevice:engineContext:]();
    }
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)SCNMTLRenderContext;
  id v5 = objc_msgSendSuper2(&v13, sel_init);
  uint64_t v6 = v5;
  if (v5)
  {
    v5[15] = a2;
    if (C3DUseOneCommandQueuePerDevice()) {
      goto LABEL_7;
    }
    uint64_t v7 = (void *)[a2 newCommandQueue];
    v6[20] = v7;
    if (v7)
    {
      [v7 setLabel:@"com.apple.SceneKit"];
LABEL_7:
      *((unsigned char *)v6 + 128) = MTLValidationEnabled();
      v6[1944] = 0x3FF0000000000000;
      v6[3] = 0x3FF0000000000000;
      *(SCNMatrix4 *)(v6 + 4) = SCNMatrix4Identity;
      *((unsigned char *)v6 + 104) = 0;
      *((_DWORD *)v6 + 33) = 0;
      v6[18] = a3;
      if (C3DStandardShadersUseFunctionConstants()) {
        char v8 = 32;
      }
      else {
        char v8 = 0;
      }
      *((unsigned char *)v6 + 152) = v6[19] & 0xDF | v8;
      if (C3DReverseZIsSupported()) {
        char v9 = 64;
      }
      else {
        char v9 = 0;
      }
      *((unsigned char *)v6 + 152) = v6[19] & 0xBF | v9;
      *((_DWORD *)v6 + 34) |= 3u;
      if (SCNMTLDeviceSupportsDepthResolve((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 4u;
      }
      if (SCNMTLDeviceSupportsStencilResolve((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x4000u;
      }
      if (SCNMTLDeviceSupportsNonUniformThreadgroupSize((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x40u;
      }
      if (SCNMTLDeviceSupportsDepth24UnormStencil8()) {
        *((_DWORD *)v6 + 34) |= 8u;
      }
      if (SCNMTLDeviceSupportsLayeredRendering((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x20u;
      }
      if (SCNMTLDeviceSupportsMultipleViewports((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x80u;
      }
      if (SCNMTLDeviceSupportsVertexAmplification((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x2000u;
      }
      if (SCNMTLDeviceSupportsTessellation((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x10u;
      }
      if (SCNMTLDeviceSupportsCubeMapTextureArrays((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x100u;
      }
      if (SCNMTLDeviceSupportsCubeMapWrite((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x200u;
      }
      if (SCNMTLDeviceSupportsBaseInstance((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x400u;
      }
      if (SCNMTLDeviceSupportsProgrammableBlending((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x800u;
      }
      if (SCNMTLDeviceSupportsDepthClipMode((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x1000u;
      }
      if (SCNMTLDeviceSupportsTextureSwizzle((void *)v6[15])) {
        *((_DWORD *)v6 + 34) |= 0x8000u;
      }
      v6[14] = +[SCNMTLResourceManager resourceManagerForDevice:]((uint64_t)SCNMTLResourceManager, (uint64_t)a2);
      v6[275] = dispatch_queue_create("com.apple.scenekit.resourceCPUQueue", 0);
      v6[276] = dispatch_group_create();
      v6[2] = malloc_type_calloc(0x358uLL, 1uLL, 0x203849E4uLL);
      v6[21] = dispatch_semaphore_create(3);
      *((_WORD *)v6 + 999) = -1;
      operator new();
    }
    uint64_t v12 = scn_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLRenderContext initWithDevice:engineContext:]();
    }
    return 0;
  }
  return v6;
}

- (uint64_t)resourceManager
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

- (uint64_t)endFrameWaitingUntilCompleted:(void *)a3 status:(void *)a4 error:
{
  if (result)
  {
    uint64_t v7 = result;
    if (*(void *)(result + 256))
    {
      if (*(void *)(result + 264)) {
        SCNMTLBlitCommandEncoder::endEncoding((SCNMTLBlitCommandEncoder *)(result + 264));
      }
      if (*(void *)(v7 + 1936)) {
        SCNMTLComputeCommandEncoder::endEncoding((SCNMTLComputeCommandEncoder *)(v7 + 280));
      }
      [*(id *)(v7 + 256) commit];
      *(void *)(v7 + 256) = 0;
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 15488));
    uint64_t v8 = *(void *)(v7 + 15496);
    if (v8)
    {
      char v9 = *(void **)(v7 + 240);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke;
      v20[3] = &unk_264006BE8;
      v20[4] = v8;
      [v9 addScheduledHandler:v20];

      *(void *)(v7 + 15496) = 0;
    }
    uint64_t v10 = *(void *)(v7 + 15504);
    if (v10)
    {
      uint64_t v11 = *(void **)(v7 + 240);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke_2;
      v19[3] = &unk_264006BE8;
      v19[4] = v10;
      [v11 addCompletedHandler:v19];

      *(void *)(v7 + 15504) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 15488));
    if (*(void *)(v7 + 200))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v7 + 15488));
      uint64_t v13 = *(void *)(v7 + 15512);
      if (v13)
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke_3;
        v18[3] = &unk_264006C10;
        v18[4] = v13;
        [*(id *)(v7 + 200) addPresentedHandler:v18];

        *(void *)(v7 + 15512) = 0;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 15488));
      if (*(unsigned char *)(v7 + 213))
      {
        [MEMORY[0x263F158F8] begin];
        if (!pthread_main_np()) {
          [MEMORY[0x263F158F8] activateBackground:1];
        }
      }
      if (*(unsigned char *)(v7 + 212) && [*(id *)(v7 + 192) maximumDrawableCount] == 3) {
        [*(id *)(v7 + 240) presentDrawable:*(void *)(v7 + 200) afterMinimumDuration:*(float *)(v7 + 208)];
      }
      else {
        [*(id *)(v7 + 240) presentDrawable:*(void *)(v7 + 200)];
      }
      if (*(unsigned char *)(v7 + 213)) {
        [MEMORY[0x263F158F8] commit];
      }

      *(void *)(v7 + 200) = 0;
    }
    uint64_t v14 = *(void **)(v7 + 15536);
    if (v14)
    {
      if (a2)
      {
        [v14 waitUntilCompleted];
        if (a3) {
          *a3 = [*(id *)(v7 + 15536) status];
        }
        if (a4) {
          *a4 = 0;
        }
      }
      objc_setProperty_nonatomic((id)v7, v12, 0, 15536);
    }
    else
    {
      dispatch_group_wait(*(dispatch_group_t *)(v7 + 2208), 0xFFFFFFFFFFFFFFFFLL);
      [*(id *)(v7 + 240) commit];
      if (a2)
      {
        [*(id *)(v7 + 240) waitUntilCompleted];
        if (a3) {
          *a3 = [*(id *)(v7 + 240) status];
        }
        if (a4) {
          *a4 = [*(id *)(v7 + 240) error];
        }
      }
    }
    objc_setProperty_nonatomic((id)v7, v15, 0, 15528);
    objc_setProperty_nonatomic((id)v7, v16, 0, 15520);
    objc_setProperty_nonatomic((id)v7, v17, 0, 15560);
    *(void *)(v7 + 240) = 0;
    *(void *)(v7 + 15152) = 0;

    *(void *)(v7 + 184) = 0;
    *(void *)(v7 + 192) = 0;

    *(void *)(v7 + 200) = 0;
    return objc_msgSend(+[SCNSourceRendererRegistry sharedRegistry](SCNSourceRendererRegistry, "sharedRegistry"), "endFrameForEngineContext:", *(void *)(v7 + 144));
  }
  return result;
}

- (uint64_t)setShouldPresentAfterMinimumDuration:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 212) = a2;
  }
  return result;
}

- (float)setPreferredFramesPerSecond:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      a2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "maximumFramesPerSecond");
      if (!a2)
      {
        char v3 = scn_default_log();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          -[SCNMTLRenderContext setPreferredFramesPerSecond:]();
        }
        a2 = 120;
      }
    }
    float result = 1.0 / (float)a2;
    *(float *)(a1 + 208) = result;
  }
  return result;
}

- (uint64_t)clientRenderPassDescriptor
{
  if (result) {
    return *(void *)(result + 15520);
  }
  return result;
}

- (uint64_t)shouldDelegateARCompositing
{
  if (result) {
    return (*(unsigned __int8 *)(result + 152) >> 4) & 1;
  }
  return result;
}

- (uint64_t)clientRenderCommandEncoder
{
  if (result) {
    return *(void *)(result + 15528);
  }
  return result;
}

- (uint64_t)currentCommandBuffer
{
  if (result) {
    return *(void *)(result + 240);
  }
  return result;
}

- (uint64_t)setCurrentPassMaterial:(uint64_t)result
{
  if (result) {
    *(void *)(result + 15464) = a2;
  }
  return result;
}

- (uint64_t)setCurrentPassHash:(uint64_t)result
{
  if (result) {
    *(void *)(result + 15456) = a2;
  }
  return result;
}

- (void)endRenderPass
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 248);
    uint64_t v3 = *(void *)(v2 + 3392);
    if (v3 == *(void *)(a1 + 15528))
    {
      bzero(*(void **)(a1 + 248), 0xD70uLL);
    }
    else
    {
      uint64_t v4 = *(void *)(v2 + 3384);
      uint64_t v5 = *(void *)(v2 + 3400);
      bzero(*(void **)(a1 + 248), 0xD70uLL);
      *(void *)(v2 + 3384) = v4;
      *(void *)(v2 + 3392) = v3;
      *(void *)(v2 + 3400) = v5;
      *(_WORD *)(v2 + 40) = 257;
      *(unsigned char *)(v2 + 42) = 1;
      *(_OWORD *)(v2 + 8) = 0u;
      *(_OWORD *)(v2 + 24) = 0u;
    }
    *(_DWORD *)(v2 + 64) = 1;
    *(unsigned char *)(v2 + 72) = 1;
    *(void *)(a1 + 248) = 0;
    *(void *)(a1 + 216) = *(void *)(a1 + 224);
  }
}

- (id)commandBufferStatusMonitor
{
  if (result) {
    return (id *)objc_loadWeak(result + 1935);
  }
  return result;
}

- (uint64_t)clientCommandBuffer
{
  if (result) {
    return *(void *)(result + 15536);
  }
  return result;
}

- (double)beginRenderPass:(uint64_t)a3 renderEncoder:(uint64_t)a4 parameters:
{
  if (a1)
  {
    *(void *)(a1 + 248) = a3;
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
    if (!v7) {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "depthAttachment"), "texture");
    }
    *(float *)(a1 + 232) = (float)(unint64_t)[v7 width];
    *(float *)(a1 + 236) = (float)(unint64_t)[v7 height];
    double result = 0.0;
    *(_OWORD *)(a1 + 15168) = 0u;
    *(_OWORD *)(a1 + 15184) = 0u;
    *(_OWORD *)(a1 + 15200) = 0u;
    *(_OWORD *)(a1 + 15216) = 0u;
    *(_OWORD *)(a1 + 15232) = 0u;
    *(_OWORD *)(a1 + 15248) = 0u;
    *(_OWORD *)(a1 + 15264) = 0u;
    *(_OWORD *)(a1 + 15280) = 0u;
    *(void *)(a1 + 15296) = 0;
    uint64_t v9 = *(void *)(a1 + 216);
    *(void *)(a1 + 216) = a2;
    *(void *)(a1 + 224) = v9;
    *(_WORD *)(a1 + 1996) = WORD2(a4);
    *(_DWORD *)(a1 + 1992) = a4;
  }
  return result;
}

- (uint64_t)_setReflectionProbeArrayTexture:(uint64_t)result
{
  if (result) {
    *(void *)(result + 15152) = a2;
  }
  return result;
}

- (void)_finalRenderTexture
{
  if (result)
  {
    char v1 = result;
    if (result[24])
    {
      uint64_t v2 = (void *)result[25];
      if (!v2)
      {
        double v3 = CACurrentMediaTime();
        id v4 = objc_alloc_init(MEMORY[0x263F086B0]);
        C3DEngineContextGetFrameIndex(v1[18]);
        uint64_t v5 = -3;
        do
        {
          kdebug_trace();
          double v6 = CACurrentMediaTime();
          uint64_t v7 = (void *)[(id)v1[24] nextDrawable];
          *(CFTimeInterval *)(v1[2] + 176) = CACurrentMediaTime() - v6 + *(double *)(v1[2] + 176);
          kdebug_trace();
          if (v7) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v5 == 0;
          }
          ++v5;
        }
        while (!v8);
        if (!v7)
        {
          uint64_t v9 = scn_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v10 = 0;
            _os_log_impl(&dword_20B249000, v9, OS_LOG_TYPE_DEFAULT, "Warning: Failed getting a valid drawable. Skipping this frame.", v10, 2u);
          }
        }
        *(CFTimeInterval *)(v1[2] + 192) = CACurrentMediaTime() - v3 + *(double *)(v1[2] + 192);
        v1[25] = v7;

        uint64_t v2 = (void *)v1[25];
      }
      return (void *)[v2 texture];
    }
    else
    {
      return (void *)result[23];
    }
  }
  return result;
}

- (id).cxx_construct
{
  self->_resourceBlitEncoder._encoder = 0;
  self->_resourceBlitEncoder._commandBuffer = 0;
  self->_resourceComputeEncoder._encoder = 0;
  self->_resourceComputeEncoder._bufferPool = 0;
  uint64_t v3 = -4224;
  do
  {
    id v4 = (_OWORD *)((char *)self + v3);
    v4[449] = 0uLL;
    v4[448] = 0uLL;
    v4[447] = 0uLL;
    v4[446] = 0uLL;
    v4[407] = 0uLL;
    v4[408] = 0uLL;
    v4[409] = 0uLL;
    v4[410] = 0uLL;
    v4[411] = 0uLL;
    v4[412] = 0uLL;
    v4[413] = 0uLL;
    v4[414] = 0uLL;
    v4[415] = 0uLL;
    v4[416] = 0uLL;
    v4[417] = 0uLL;
    v4[418] = 0uLL;
    v4[419] = 0uLL;
    v4[420] = 0uLL;
    v4[421] = 0uLL;
    v4[422] = 0uLL;
    v4[423] = 0uLL;
    v4[424] = 0uLL;
    v4[425] = 0uLL;
    v4[426] = 0uLL;
    v4[427] = 0uLL;
    v4[428] = 0uLL;
    v4[429] = 0uLL;
    v4[430] = 0uLL;
    v4[443] = 0uLL;
    v4[442] = 0uLL;
    v4[441] = 0uLL;
    v4[440] = 0uLL;
    v4[439] = 0uLL;
    v4[438] = 0uLL;
    v4[437] = 0uLL;
    v4[436] = 0uLL;
    v3 += 704;
  }
  while (v3);
  bzero(&self->_nodeUniforms, 0x540uLL);
  self->_lighting.frameLightingSetDatas.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_lighting.frameLightingSetDatas.__table_.__p1_.__value_.__next_ = 0u;
  self->_lighting.frameLightingSetDatas.__table_.__p3_.__value_ = 1.0;
  SCNMTLClusterSystem::SCNMTLClusterSystem((SCNMTLClusterSystem *)&self->_anon_3848[136]);
  return self;
}

- (uint64_t)sampleCount
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (uint64_t)disableLinearRendering
{
  if (result) {
    return (*(unsigned __int8 *)(result + 152) >> 2) & 1;
  }
  return result;
}

- (uint64_t)textureTarget
{
  if (result) {
    return *(void *)(result + 184);
  }
  return result;
}

- (uint64_t)enableARMode
{
  if (result) {
    return (*(unsigned __int8 *)(result + 152) >> 3) & 1;
  }
  return result;
}

- (BOOL)showsAuthoringEnvironment
{
  if (result) {
    return *(unsigned char *)(result + 15416) != 0;
  }
  return result;
}

- (double)contentScaleFactor
{
  if (a1) {
    return *(double *)(a1 + 15552);
  }
  else {
    return 0.0;
  }
}

intptr_t __34__SCNMTLRenderContext_beginFrame___block_invoke(uint64_t a1, void *a2)
{
  [a2 GPUEndTime];
  double v5 = v4;
  [a2 GPUStartTime];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 16) + 200) = v5 - v6;
  if ([a2 status] != 4)
  {
    [*(id *)(*(void *)(a1 + 32) + 112) commandBufferDidCompleteWithError:a2];
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __34__SCNMTLRenderContext_beginFrame___block_invoke_cold_1(a2);
    }
    [objc_loadWeak((id *)(*(void *)(a1 + 32) + 15480)) renderContext:*(void *)(a1 + 32) commandBufferDidCompleteWithError:a2];
  }
  intptr_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 176), 0xFFFFFFFF);
  return result;
}

uint64_t __59__SCNMTLRenderContext__createResourceCommandBufferIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 status];
  if (result != 4)
  {
    [*(id *)(*(void *)(a1 + 32) + 112) commandBufferDidCompleteWithError:a2];
    double v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__SCNMTLRenderContext__createResourceCommandBufferIfNeeded__block_invoke_cold_1(a2);
    }
    return [objc_loadWeak((id *)(*(void *)(a1 + 32) + 15480)) renderContext:*(void *)(a1 + 32) commandBufferDidCompleteWithError:a2];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandBufferStatusMonitor);
  objc_destroyWeak((id *)&self->_resourceManagerMonitor);
  SCNMTLClusterSystem::~SCNMTLClusterSystem((SCNMTLClusterSystem *)&self->_anon_3848[136]);

  std::__hash_table<std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,SCNMTLLightSetData>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,SCNMTLLightSetData>>>::~__hash_table((uint64_t)&self->_lighting.frameLightingSetDatas);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Deallocating render context with 1 outstanding command buffer scheduling handler", v2, v3, v4, v5, v6);
}

- (void)startProcessingRendererElementsWithEngineIterationContext:(uint64_t)a1
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 2224) = v4;
  if (!v4)
  {
    uint64_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      -[SCNMTLRenderContext startProcessingRendererElementsWithEngineIterationContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      uint64_t v2 = a2;
    }
  }
  uint64_t Scene = (__n128 *)C3DEngineContextGetScene(*(void *)(v2 + 8));
  if (*(void *)(v2 + 8) != *(void *)(a1 + 144))
  {
    uint64_t v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLRenderContext startProcessingRendererElementsWithEngineIterationContext:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  *(void *)(a1 + 2232) = C3DSceneGetLightingSystem((uint64_t)Scene);
  *(void *)(a1 + 2272) = C3DSceneGetTransformTree((uint64_t)Scene);
  *(void *)(a1 + 2240) = C3DSceneGetDynamicBatchingSystem((uint64_t)Scene);
  *(void *)(a1 + 2248) = C3DFXPassInstanceGetPass(*(void *)(a1 + 2224));
  *(void *)(a1 + 2256) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 2264) = *(unsigned char *)(a2 + 40);
  uint64_t AmbientLighting = C3DLightingSystemGetAmbientLighting(*(void *)(a1 + 2232));
  uint64_t v23 = *(void *)(a1 + 144);
  *(void *)(a1 + 2680) = v24;
  *(void *)(a1 + 2672) = AmbientLighting;
  unint64_t EyeMatrix4x4 = C3DEngineContextGetEyeMatrix4x4(v23, 0, 0);
  long long v96 = *(_OWORD *)(EyeMatrix4x4 + 48);
  float32x4_t v97 = *(float32x4_t *)(EyeMatrix4x4 + 32);
  float PointOfViewScale = C3DEngineContextGetPointOfViewScale(*(void *)(a1 + 144));
  *(_OWORD *)(a1 + 2688) = *(_OWORD *)C3DSceneGetFogColor((uint64_t)Scene);
  if (v97.f32[3] == 0.0 && (C3DIsRunningInXcode() & 1) != 0) {
    long long v27 = xmmword_20B5CB520;
  }
  else {
    *(__n64 *)&long long v27 = C3DSceneComputeFogParameters((uint64_t)Scene, PointOfViewScale);
  }
  *(_OWORD *)(a1 + 2704) = v27;
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)(a1 + 2720) = vdiv_f32(_D1, *(float32x2_t *)(a1 + 232));
  LightingEnvironmentuint64_t EffectSlot = C3DSceneGetLightingEnvironmentEffectSlot((uint64_t)Scene, 0);
  uint64_t v34 = LightingEnvironmentEffectSlot;
  float Intensity = 1.0;
  if (LightingEnvironmentEffectSlot
    && (C3DEffectSlotHasImageOrTexture(LightingEnvironmentEffectSlot)
     || C3DEffectSlotHasPrecomputedLightingEnvironment(v34)))
  {
    float Intensity = C3DEffectSlotGetIntensity(v34);
  }
  *(float *)(a1 + 2748) = Intensity;
  if (*(double *)(a1 + 2192) == 0.0) {
    *(double *)(a1 + 2192) = C3DEngineContextGetSystemTime(*(void *)(a1 + 144));
  }
  float v36 = C3DEngineContextGetSystemTime(*(void *)(a1 + 144)) - *(double *)(a1 + 2192);
  *(float *)(a1 + 2728) = v36;
  *(__float2 *)(a1 + 2732) = __sincosf_stret(v36);
  unsigned int v37 = 214013 * *(_DWORD *)(a1 + 2280) + 2531011;
  *(_DWORD *)(a1 + 2280) = v37;
  *(float *)(a1 + 2740) = (float)HIWORD(v37) * 0.000015259;
  v40.i32[1] = v97.i32[1];
  double v38 = v97.f32[2];
  double v39 = *((float *)&v96 + 2);
  v40.f32[0] = *((float *)&v96 + 2) / v97.f32[2];
  if (v97.f32[3] == 0.0)
  {
    double v41 = (v39 + -1.0) / v38;
    double v42 = (v39 + 1.0) / v38;
    *(float *)&double v42 = v42;
    double v43 = -(1.0 - v39) / v38;
    if (*((float *)&v96 + 2) < -1.0) {
      *(double *)&float32x2_t v40 = v42;
    }
    else {
      double v43 = v41;
    }
  }
  else
  {
    double v44 = v39 / (v38 + 1.0);
    *(float *)&double v39 = v39 / (v38 + -1.0);
    double v43 = v44;
    if (*((float *)&v96 + 2) < -2.0) {
      *(double *)&float32x2_t v40 = v39;
    }
  }
  *(float *)&double v43 = v43;
  *(int8x8_t *)(a1 + 2880) = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v40, *(float32x2_t *)&v43), 0), (int8x8_t)vrev64_s32((int32x2_t)__PAIR64__(LODWORD(v43), v40.u32[0])), (int8x8_t)__PAIR64__(LODWORD(v43), v40.u32[0]));
  if (*(unsigned char *)(a1 + 2264))
  {
    SCNMTLClusterSystem::compute(a1 + 14544);
    memcpy((void *)(a1 + 14736), __src, 0x1A0uLL);
    *(_OWORD *)(a1 + 2976) = *(_OWORD *)(a1 + 14800);
  }
  long long v45 = (char *)(a1 + 2288);
  if (!*(unsigned char *)(a1 + 1994))
  {
    unsigned int v46 = 1;
    goto LABEL_30;
  }
  unsigned int v46 = *(unsigned __int8 *)(a1 + 1993);
  if (*(unsigned char *)(a1 + 1993))
  {
LABEL_30:
    uint64_t v48 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    float32x4_t v98 = _Q0;
    uint64_t v50 = a1;
    uint64_t v47 = v46;
    while (1)
    {
      uint64_t v51 = *(unsigned __int8 *)(a1 + 1992);
      if (v48) {
        memcpy((void *)(v50 + 2288), v45, 0x2C0uLL);
      }
      uint64_t v52 = v48 + v51;
      char v53 = (_OWORD *)(v4 + ((v48 + v51) << 6));
      __src[0] = v53[198];
      __src[1] = v53[199];
      __src[2] = v53[200];
      __src[3] = v53[201];
      long long v54 = v53[199];
      long long v55 = v53[200];
      long long v56 = v53[201];
      *(_OWORD *)(v50 + 2288) = v53[198];
      *(_OWORD *)(v50 + 2304) = v54;
      *(_OWORD *)(v50 + 2320) = v55;
      *(_OWORD *)(v50 + 2336) = v56;
      long long v57 = v53[175];
      long long v58 = v53[176];
      long long v59 = v53[177];
      *(_OWORD *)(v50 + 2352) = v53[174];
      *(_OWORD *)(v50 + 2368) = v57;
      *(_OWORD *)(v50 + 2384) = v58;
      *(_OWORD *)(v50 + 2400) = v59;
      long long v104 = __src[0];
      long long v105 = __src[1];
      long long v106 = __src[2];
      long long v107 = __src[3];
      C3DSceneComputeViewToCubemapMatrix(Scene, (uint64_t)&v104);
      long long v60 = v105;
      long long v61 = v106;
      long long v62 = v107;
      *(_OWORD *)(v50 + 2544) = v104;
      *(_OWORD *)(v50 + 2560) = v60;
      *(_OWORD *)(v50 + 2576) = v61;
      *(_OWORD *)(v50 + 2592) = v62;
      long long v63 = v53[223];
      long long v64 = v53[224];
      long long v65 = v53[225];
      *(_OWORD *)(v50 + 2416) = v53[222];
      *(_OWORD *)(v50 + 2432) = v63;
      *(_OWORD *)(v50 + 2448) = v64;
      *(_OWORD *)(v50 + 2464) = v65;
      long long v66 = v53[247];
      long long v67 = v53[248];
      long long v68 = v53[249];
      *(_OWORD *)(v50 + 2480) = v53[246];
      *(_OWORD *)(v50 + 2496) = v66;
      *(_OWORD *)(v50 + 2512) = v67;
      *(_OWORD *)(v50 + 2528) = v68;
      float32x4_t v69 = *(float32x4_t *)(v50 + 2288);
      float32x4_t v70 = *(float32x4_t *)(v50 + 2304);
      float32x4_t v71 = *(float32x4_t *)(v50 + 2320);
      long long v72 = *(_OWORD *)(v50 + 2336);
      int32x4_t v73 = (int32x4_t)vmulq_f32(v69, v69);
      int32x4_t v74 = (int32x4_t)vmulq_f32(v70, v70);
      int32x4_t v75 = (int32x4_t)vmulq_f32(v71, v71);
      int32x4_t v76 = vzip2q_s32(v73, v75);
      float32x4_t v77 = (float32x4_t)vzip1q_s32(vzip1q_s32(v73, v75), v74);
      float32x4_t v78 = (float32x4_t)vtrn2q_s32(v73, v74);
      v78.i32[2] = v75.i32[1];
      float32x4_t v79 = vdivq_f32(v98, vaddq_f32((float32x4_t)vzip1q_s32(v76, vdupq_laneq_s32(v74, 2)), vaddq_f32(v77, v78)));
      *(float32x4_t *)(v50 + 2912) = vmulq_n_f32(v69, v79.f32[0]);
      *(float32x4_t *)(v50 + 2928) = vmulq_lane_f32(v70, *(float32x2_t *)v79.f32, 1);
      *(float32x4_t *)(v50 + 2944) = vmulq_laneq_f32(v71, v79, 2);
      *(_OWORD *)(v50 + 2960) = v72;
      PointOfView = C3DEngineContextGetPointOfView(*(void *)(a2 + 8));
      if (!PointOfView) {
        break;
      }
      CFDictionaryRef Camera = C3DNodeGetCamera((uint64_t)PointOfView);
      int IsTemporalAntialiasingEnabled = C3DEngineContextIsTemporalAntialiasingEnabled(*(void *)(a1 + 144));
      if (!Camera) {
        goto LABEL_38;
      }
      BOOL v83 = C3DCameraGetMotionBlurIntensity((uint64_t)Camera) > 0.0;
      if (v83) {
        goto LABEL_40;
      }
LABEL_39:
      if (IsTemporalAntialiasingEnabled)
      {
LABEL_40:
        float32x4_t v84 = (_OWORD *)(v4 + (v52 << 6));
        long long v85 = v84[271];
        long long v86 = v84[272];
        long long v87 = v84[273];
        *(_OWORD *)(v50 + 2608) = v84[270];
        *(_OWORD *)(v50 + 2624) = v85;
        *(_OWORD *)(v50 + 2640) = v86;
        *(_OWORD *)(v50 + 2656) = v87;
        float v88 = 0.5;
        if (v83) {
          float v88 = C3DCameraGetMotionBlurIntensity((uint64_t)Camera) * 0.5;
        }
        *(float *)(v50 + 2744) = v88;
      }
      int v89 = (simd_float4x4 *)&v45[704 * v52];
      *(simd_float4x4 *)(v50 + 2752) = __invert_f4(v89[2]);
      *(simd_float4x4 *)(v50 + 2816) = __invert_f4(v89[3]);
      __n128 ViewportAtIndex = C3DEngineContextGetViewportAtIndex(*(void *)(a1 + 144), v48);
      *(int8x16_t *)(v50 + 2896) = vextq_s8((int8x16_t)ViewportAtIndex, (int8x16_t)ViewportAtIndex, 8uLL);
      ++v48;
      v50 += 704;
      if (v47 == v48) {
        goto LABEL_44;
      }
    }
    int IsTemporalAntialiasingEnabled = C3DEngineContextIsTemporalAntialiasingEnabled(*(void *)(a1 + 144));
    CFDictionaryRef Camera = 0;
LABEL_38:
    BOOL v83 = 0;
    goto LABEL_39;
  }
  LODWORD(v47) = 0;
LABEL_44:
  long long v104 = 0uLL;
  *(void *)&long long v105 = 0;
  SCNMTLBufferPool::allocateAndCopy(*(SCNMTLBufferPool **)(a1 + 2088), v45, (704 * v47), (void **)&v104);
  uint64_t v91 = v105;
  *(void *)(a1 + 6512) = *((void *)&v104 + 1);
  *(void *)(a1 + 6520) = v91;
  if ((*(unsigned char *)(a1 + 152) & 0x20) != 0)
  {
    ActiveNonAmbientLightuint64_t Count = C3DLightingSystemGetActiveNonAmbientLightCount(*(void *)(a1 + 2232));
    if (ActiveNonAmbientLightCount)
    {
      uint64_t v93 = 208 * ActiveNonAmbientLightCount;
      *(void *)(a1 + 6544) = v93;
      uint64_t v101 = 0;
      uint64_t v102 = 0;
      uint64_t v103 = 0;
      SCNMTLBufferPool::allocate(*(SCNMTLBufferPool **)(a1 + 2088), v93, &v101);
      uint64_t v94 = v101;
      *(void *)(a1 + 6528) = v102;
      *(void *)(a1 + 6536) = v103;
      *(void *)&__src[0] = 0;
      *((void *)&__src[0] + 1) = __src;
      *(void *)&__src[1] = 0x2020000000;
      DWORD2(__src[1]) = 0;
      uint64_t v95 = *(void *)(a1 + 2232);
      v100[0] = MEMORY[0x263EF8330];
      v100[1] = 3221225472;
      v100[2] = __81__SCNMTLRenderContext_startProcessingRendererElementsWithEngineIterationContext___block_invoke;
      v100[3] = &unk_264006C58;
      v100[4] = a1;
      v100[5] = __src;
      v100[6] = v94;
      C3DLightingSystemApplyActiveNonAmbientLights(v95, (uint64_t)v100);
      _Block_object_dispose(__src, 8);
    }
    else
    {
      *(void *)(a1 + 6544) = 0;
      *(_OWORD *)(a1 + 6528) = 0u;
    }
  }
}

- (void)_reduceStatsOfConstantBuffer:(id)a3
{
  self->__engineStats->cboMemory -= [a3 length];
}

- (void)setGeneratedTexturePath:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 15568);
  }
}

- (void)setClientCommandBuffer:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 15536);
  }
}

- (void)setClientRenderPassDescriptor:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 15520);
  }
}

- (void)setClientRenderCommandEncoder:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 15528);
  }
}

- (void)setClientCommandQueue:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 15560);
  }
}

- (uint64_t)engineContext
{
  if (result) {
    return *(void *)(result + 144);
  }
  return result;
}

- (__n128)setScreenTransform:(uint64_t)a1
{
  if (a1)
  {
    __n128 result = *(__n128 *)a2;
    long long v3 = *(_OWORD *)(a2 + 16);
    long long v4 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 80) = v4;
    *(__n128 *)(a1 + 32) = result;
    *(_OWORD *)(a1 + 48) = v3;
  }
  return result;
}

- (double)screenTransform
{
  if (a1)
  {
    long long v2 = a1[3];
    *a2 = a1[2];
    a2[1] = v2;
    long long v3 = a1[4];
    long long v4 = a1[5];
    a2[2] = v3;
    a2[3] = v4;
  }
  else
  {
    *(void *)&long long v3 = 0;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return *(double *)&v3;
}

- (uint64_t)wantsWideGamut
{
  if (result) {
    return *(unsigned char *)(result + 152) & 1;
  }
  return result;
}

- (uint64_t)setEnableARMode:(uint64_t)result
{
  if (result)
  {
    char v2 = *(unsigned char *)(result + 152);
    if (((((v2 & 8) == 0) ^ a2) & 1) == 0)
    {
      if (a2) {
        char v3 = 8;
      }
      else {
        char v3 = 0;
      }
      *(unsigned char *)(result + 152) = v2 & 0xF7 | v3;
    }
  }
  return result;
}

- (uint64_t)setShouldDelegateARCompositing:(uint64_t)result
{
  if (result)
  {
    char v2 = *(unsigned char *)(result + 152);
    if (((((v2 & 0x10) == 0) ^ a2) & 1) == 0)
    {
      if (a2) {
        char v3 = 16;
      }
      else {
        char v3 = 0;
      }
      *(unsigned char *)(result + 152) = v2 & 0xEF | v3;
    }
  }
  return result;
}

- (void)setReverseZ:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      if (C3DReverseZIsSupported()) {
        int v3 = 64;
      }
      else {
        int v3 = 0;
      }
    }
    else
    {
      int v3 = 0;
    }
    *(unsigned char *)(a1 + 152) = *(unsigned char *)(a1 + 152) & 0xBF | v3;
    C3DEngineContextSetCoordinatesSystemOptions(*(void *)(a1 + 144), 8, v3 != 0);
    uint64_t v4 = *(void *)(a1 + 112);
    -[SCNMTLResourceManager resetRasterizerStates](v4);
  }
}

- (void)_clearUnusedBindingPoints
{
  renderPipeline = self->_cache.renderPipeline;
  if (renderPipeline)
  {
    [self->_renderEncoder->var24[1] pushDebugGroup:@"Clear binding points"];
    __int16 v4 = 0;
    for (uint64_t i = 0; i != 31; ++i)
    {
      renderEncoder = self->_renderEncoder;
      if ((renderPipeline->_buffersUsageMask[0] & (1 << i)) != 0) {
        __int16 v7 = 255;
      }
      else {
        __int16 v7 = i;
      }
      if ((renderPipeline->_buffersUsageMask[1] & (1 << i)) != 0) {
        __int16 v8 = -256;
      }
      else {
        __int16 v8 = v4;
      }
      if ((_BYTE)v7 != 0xFF) {
        SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)self->_renderEncoder, 0, 0, (char)v7);
      }
      if ((~((unsigned __int16)v8 | (unsigned __int16)v7) & 0xFF00) != 0) {
        SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)renderEncoder, 0, 0, (uint64_t)(__int16)(v8 | v7) >> 8);
      }
      v4 += 256;
    }
    __int16 v9 = 0;
    for (uint64_t j = 0; j != 31; ++j)
    {
      uint64_t v11 = self->_renderEncoder;
      if ((renderPipeline->_texturesUsageMask[0] & (1 << j)) != 0) {
        __int16 v12 = 255;
      }
      else {
        __int16 v12 = j;
      }
      if ((renderPipeline->_texturesUsageMask[1] & (1 << j)) != 0) {
        __int16 v13 = -256;
      }
      else {
        __int16 v13 = v9;
      }
      if ((_BYTE)v12 != 0xFF)
      {
        uint64_t v14 = &v11->var0 + 8 * (char)v12;
        if (*((void *)v14 + 72))
        {
          *((void *)v14 + 72) = 0;
          v11->var25[((unint64_t)(char)v12 >> 6) + 1] |= 1 << v12;
        }
      }
      __int16 v15 = v13 | v12;
      if ((~v15 & 0xFF00) != 0)
      {
        unint64_t v16 = (uint64_t)v15 >> 8;
        uint64_t v17 = &v11->var0 + 8 * v16;
        if (*((void *)v17 + 278))
        {
          *((void *)v17 + 278) = 0;
          *(&v11[1].var1 + (v16 >> 6)) |= 1 << SHIBYTE(v15);
        }
      }
      v9 += 256;
    }
    uint64_t v18 = (void *)self->_renderEncoder->var24[1];
    [v18 popDebugGroup];
  }
}

- (uint64_t)resourceQueue
{
  if (result) {
    return *(void *)(result + 2200);
  }
  return result;
}

- (void)endFrameSceneSpecifics
{
  if (result)
  {
    uint64_t v1 = result;
    [result resetVolatileMeshes];
    return (void *)[v1 resetVolatileMeshElements];
  }
  return result;
}

uint64_t __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  else
  {
    __int16 v8 = (uint64_t (*)(void *))v3[2];
    return v8(v3);
  }
  return result;
}

uint64_t __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  else
  {
    __int16 v8 = (uint64_t (*)(void *))v3[2];
    return v8(v3);
  }
  return result;
}

uint64_t __66__SCNMTLRenderContext_endFrameWaitingUntilCompleted_status_error___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v3 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v7++) + 16))();
        }
        while (v5 != v7);
        uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  else
  {
    __int16 v8 = (uint64_t (*)(void *))v3[2];
    return v8(v3);
  }
  return result;
}

- (uint64_t)layerTarget
{
  if (result) {
    return *(void *)(result + 192);
  }
  return result;
}

- (uint64_t)_reflectionProbeArrayTexture
{
  if (result) {
    return *(void *)(result + 15152);
  }
  return result;
}

- (uint64_t)_clusterInfo
{
  if (a1) {
    return a1 + 14736;
  }
  else {
    return 0;
  }
}

- (void)resourceCommandBuffer
{
  if (result)
  {
    uint64_t v1 = result;
    if (!result[32]) {
      [result _createResourceCommandBufferIfNeeded];
    }
    if (v1[242]) {
      SCNMTLComputeCommandEncoder::endEncoding((SCNMTLComputeCommandEncoder *)(v1 + 35));
    }
    if (v1[33]) {
      SCNMTLBlitCommandEncoder::endEncoding((SCNMTLBlitCommandEncoder *)(v1 + 33));
    }
    return (void *)v1[32];
  }
  return result;
}

- (uint64_t)textureForEffectSlot:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 112) renderResourceForEffectSlot:a2 withEngineContext:*(void *)(result + 144) didFallbackToDefaultTexture:0];
  }
  return result;
}

double __54__SCNMTLRenderContext_irradianceTextureForEffectSlot___block_invoke(uint64_t a1, void *a2, double result)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [a2 contents];
    uint64_t v6 = [a2 length];
    *(void *)&uint64_t result = C3DLightProbesSetGlobalSH3(v3, v5, v6, v7).n128_u64[0];
  }
  return result;
}

- (void)_logLightingInformation
{
  if ((*((unsigned char *)self + 152) & 0x20) == 0)
  {
    NSLog(&cfstr_LightingsetUpl.isa, a2, self->_lighting.frameLightingSetDatas.__table_.__p2_.__value_);
    next = self->_lighting.frameLightingSetDatas.__table_.__p1_.__value_.__next_;
    if (next)
    {
      LODWORD(v4) = 0;
      do
      {
        uint64_t v4 = (v4 + next[10]);
        next = *(_DWORD **)next;
      }
      while (next);
    }
    else
    {
      uint64_t v4 = 0;
    }
    NSLog(&cfstr_LightingsetUpl_0.isa, v4);
  }
}

- (uint64_t)pushDebugGroup:(uint64_t)result
{
  if (result) {
    return [*(id *)(*(void *)(result + 248) + 3392) pushDebugGroup:a2];
  }
  return result;
}

- (uint64_t)popDebugGroup
{
  if (result) {
    return [*(id *)(*(void *)(result + 248) + 3392) popDebugGroup];
  }
  return result;
}

- (uint64_t)_setSceneBufferAtVertexIndex:(uint64_t)a3 fragmentIndex:
{
  if (result)
  {
    uint64_t v4 = result;
    if (a2 != -1) {
      uint64_t result = (uint64_t *)SCNMTLRenderCommandEncoder::setVertexBuffer(result[31], result[814], result[815], a2);
    }
    if (a3 != -1)
    {
      uint64_t v5 = v4[31];
      uint64_t v6 = v4[814];
      uint64_t v7 = v4[815];
      return (uint64_t *)SCNMTLRenderCommandEncoder::setFragmentBuffer(v5, v6, v7, a3);
    }
  }
  return result;
}

- (uint64_t)_drawPatchForMeshElement:(uint64_t)a3 instanceCount:
{
  if (result)
  {
    uint64_t v5 = (void *)result;
    if (-[SCNMTLMesh elements](a2) != 1)
    {
      if (-[SCNMTLMesh elements](a2))
      {
        uint64_t v6 = scn_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:](v6, v7, v8, v9, v10, v11, v12, v13);
        }
      }
    }
    if (-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](a2) != 3)
    {
      uint64_t v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    ++*(_DWORD *)(v5[2] + 8);
    uint64_t v22 = v5[31];
    uint64_t v23 = -[SCNMTLMeshElement primitiveCount](a2);
    uint64_t v24 = [(id)-[SCNMTLMeshElement indexBuffer](a2) buffer];
    uint64_t v25 = [(id)-[SCNMTLMeshElement indexBuffer](a2) offset];
    uint64_t v26 = -[SCNMTLResourceManager libraryManager](a2) + v25;
    SCNMTLRenderCommandEncoder::_bindPendingTextures((SCNMTLRenderCommandEncoder *)v22);
    SCNMTLRenderCommandEncoder::applyChangedStates((SCNMTLRenderCommandEncoder *)v22);
    [*(id *)(v22 + 3392) drawIndexedPatches:3 patchStart:0 patchCount:v23 patchIndexBuffer:0 patchIndexBufferOffset:0 controlPointIndexBuffer:v24 controlPointIndexBufferOffset:v26 instanceCount:*(unsigned int *)(v22 + 64) * a3 baseInstance:0];
    int v27 = -[SCNMTLMeshElement primitiveCount](a2);
    long long v28 = (_DWORD *)v5[2];
    v28[1] += v27 * a3;
    uint64_t result = v5[1898];
    if (result)
    {
      uint64_t result = -[SCNMTLMesh verticesCount](result);
      int v29 = result * a3;
      long long v28 = (_DWORD *)v5[2];
    }
    else
    {
      int v29 = 0;
    }
    *v28 += v29;
  }
  return result;
}

- (void)_updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:(C3DMatrix4x4 *)a3
{
  if (a3->components[11] == 0.0)
  {
    char CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions((uint64_t)self->_engineContext);
    v10.i32[0] = LODWORD(a3->components[10]);
    float v6 = a3->components[11];
    double v7 = v10.f32[0];
    float v8 = a3->components[14];
    double v9 = v8;
    v10.f32[0] = v8 / v10.f32[0];
    double v11 = v8 / (v7 + 1.0);
    double v12 = v8 / (v7 + -1.0);
    *(float *)&double v12 = v12;
    if (v8 >= -2.0) {
      double v12 = *(double *)&v10;
    }
    BOOL v13 = v8 < -1.0;
    double v14 = (v9 + -1.0) / v7;
    double v15 = (v9 + 1.0) / v7;
    *(float *)&double v15 = v15;
    double v16 = -(1.0 - v9) / v7;
    if (v13) {
      *(double *)&float32x2_t v10 = v15;
    }
    else {
      double v16 = v14;
    }
    BOOL v17 = v6 == 0.0;
    if (v6 == 0.0) {
      double v18 = v16;
    }
    else {
      double v18 = v11;
    }
    if (!v17) {
      *(double *)&float32x2_t v10 = v12;
    }
    *(float *)&double v18 = v18;
    int8x8_t v33 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_f32(v10, *(float32x2_t *)&v18), 0), (int8x8_t)vrev64_s32((int32x2_t)__PAIR64__(LODWORD(v18), v10.u32[0])), (int8x8_t)__PAIR64__(LODWORD(v18), v10.u32[0]));
    __n128 Viewport = C3DEngineContextGetViewport((__n128 *)self->_engineContext);
    if (Viewport.n128_f32[3] == 0.0) {
      float v20 = 1.0;
    }
    else {
      float v20 = Viewport.n128_f32[2] / Viewport.n128_f32[3];
    }
    double v21 = *(float *)v33.i32;
    if (*(float *)&v33.i32[1] > *(float *)v33.i32) {
      double v22 = *(float *)&v33.i32[1];
    }
    else {
      double v22 = *(float *)v33.i32 + 1.0;
    }
    double v23 = __tanpi(0.166666667);
    if (v23 == 0.0) {
      double v24 = 1.0;
    }
    else {
      double v24 = 1.0 / v23;
    }
    float v25 = v24;
    long long v26 = LODWORD(v25);
    *(float *)&unsigned int v27 = v22 / (v21 - v22);
    *(void *)&long long v28 = 0;
    *((void *)&v28 + 1) = __PAIR64__(-1.0, v27);
    LODWORD(v31) = 0;
    *((void *)&v31 + 1) = 0;
    *(float *)&unsigned int v29 = v22 * v21 / (v21 - v22);
    *(void *)&long long v30 = 0;
    *((void *)&v30 + 1) = v29;
    *((float *)&v31 + 1) = v20 * v25;
    if ((CoordinatesSystemOptions & 8) != 0)
    {
      uint64_t v32 = 0;
      v34[0] = LODWORD(v25);
      v34[1] = v31;
      v34[2] = v28;
      v34[3] = v30;
      do
      {
        v35[v32] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_20B5CB820, COERCE_FLOAT(v34[v32])), (float32x4_t)xmmword_20B5CB7D0, *(float32x2_t *)&v34[v32], 1), (float32x4_t)xmmword_20B5CB810, (float32x4_t)v34[v32], 2), (float32x4_t)xmmword_20B5CBCA0, (float32x4_t)v34[v32], 3);
        ++v32;
      }
      while (v32 != 4);
      long long v26 = v35[0];
      long long v31 = v35[1];
      long long v28 = v35[2];
      long long v30 = v35[3];
    }
    *(_OWORD *)a3->components = v26;
    *(_OWORD *)&a3->components[4] = v31;
    *(_OWORD *)&a3->components[8] = v28;
    *(_OWORD *)&a3->components[12] = v30;
  }
}

- (float)_zFarForSkyboxRenderingProjectionMatrix:(const C3DMatrix4x4 *)a3 defaultZFar:
{
  if (result <= 0.0) {
    return 1.0;
  }
  return result;
}

- (void)renderBackground:(uint64_t)a3 engineContext:(uint64_t)a4 passInstance:
{
  uint64_t v120 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  id v118 = 0;
  uint64_t ImageProxy = C3DEffectSlotGetImageProxy(a2);
  uint64_t Player = C3DAnimationNodeGetPlayer(a3);
  TextureProxy = (const void *)Player;
  if (Player && C3DTextureGetIOSurface(Player) != ImageProxy)
  {
    C3DEngineContextSetBackgroundTextureProxy(a3, 0);
    TextureProxy = 0;
  }
  if (!ImageProxy)
  {
    Metaluint64_t Texture = (void *)[*(id *)(a1 + 112) renderResourceForEffectSlot:a2 withEngineContext:*(void *)(a1 + 144) didFallbackToDefaultTexture:0];
    goto LABEL_13;
  }
  uint64_t TextureSampler = C3DEffectSlotGetTextureSampler(a2);
  if (TextureSampler)
  {
    if (!TextureProxy)
    {
LABEL_11:
      TextureProxy = (const void *)C3DImageProxyCreateTextureProxy(ImageProxy, TextureSampler, a3);
      C3DEngineContextSetBackgroundTextureProxy(a3, TextureProxy);
      CFRelease(TextureProxy);
      if (!TextureProxy) {
        return;
      }
    }
  }
  else
  {
    uint64_t TextureSampler = C3DTextureSamplerGetDefault();
    if (!TextureProxy) {
      goto LABEL_11;
    }
  }
  Metaluint64_t Texture = (void *)C3DTextureProxyGetMetalTexture((uint64_t)TextureProxy, a3, TextureSampler, (uint64_t)&v85);
LABEL_13:
  BOOL v13 = MetalTexture;
  id v118 = MetalTexture;
  if (MetalTexture)
  {
    uint64_t Scene = (__n128 *)C3DEngineContextGetScene(a3);
    uint64_t v83 = a4;
    if ([v13 textureType] == 5)
    {
      EnvironmentCubeuint64_t Mesh = C3DEngineContextGetEnvironmentCubeMesh(a3);
      uint64_t v16 = *(void *)(a1 + 8 * *(unsigned __int8 *)(a1 + 1994) + 2144);
      uint64_t Matrix4x4 = C3DEngineContextGetMatrix4x4(a3, 1);
      if (C3DKeyframeControllerHasInterpolationModesPerKey(a2))
      {
        uint64_t ImageTransform = C3DEffectSlotGetImageTransform(a2);
        C3DMatrix4x4Mult(ImageTransform, (float32x4_t *)Matrix4x4, &v85);
      }
      else
      {
        float32x4_t v23 = *(float32x4_t *)Matrix4x4;
        __n128 v24 = *(__n128 *)(Matrix4x4 + 32);
        __n128 v86 = *(__n128 *)(Matrix4x4 + 16);
        __n128 v87 = v24;
        float32x4_t v85 = v23;
      }
      long long v88 = xmmword_20B5CB530;
      float v25 = (float32x4_t *)C3DEngineContextGetMatrix4x4(*(void *)(a1 + 144), 0);
      float32x4_t v26 = v25[2];
      float32x4_t v28 = *v25;
      float32x4_t v27 = v25[1];
      long long v113 = (__int128)v25[3];
      float32x4_t v112 = v26;
      float32x4_t v110 = v28;
      float32x4_t v111 = v27;
      [(id)a1 _updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:&v110];
      C3DMatrix4x4Mult((uint64_t)&v85, &v110, &v114);
    }
    else
    {
      EnvironmentCubeuint64_t Mesh = C3DEngineContextGetQuadMesh(a3);
      uint64_t v16 = *(void *)(a1 + 8 * *(unsigned __int8 *)(a1 + 1994) + 2120);
      if (C3DKeyframeControllerHasInterpolationModesPerKey(a2))
      {
        uint64_t v19 = (__n128 *)C3DEffectSlotGetImageTransform(a2);
        long long v20 = (__int128)v19[3];
        __n128 v22 = *v19;
        __n128 v21 = v19[1];
        __n128 v116 = v19[2];
        long long v117 = v20;
        __n128 v114 = v22;
        __n128 v115 = v21;
      }
      else
      {
        C3DMatrix4x4MakeIdentity((uint64_t)&v114);
      }
    }
    [*(id *)(*(void *)(a1 + 248) + 3392) pushDebugGroup:@"SceneKit - Draw scene background"];
    uint64_t v29 = EnvironmentCubeMesh;
    long long v30 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(void *)(a1 + 112), EnvironmentCubeMesh, 1);
    *(void *)((char *)v119 + 7) = 0;
    *(void *)&v119[0] = 0;
    uint64_t v31 = -[SCNMTLResourceManager commandQueue]((uint64_t)v30);
    float32x4_t v81 = v30;
    uint64_t v32 = -[SCNMTLMesh vertexDescriptorHash]((uint64_t)v30);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 216), "colorAttachments"), "objectAtIndexedSubscript:", 0), "clearColor");
    double v34 = v33;
    if ((C3DEffectSlotIsOpaque(a2) & 1) != 0 || v34 == 0.0) {
      uint64_t v35 = C3DBlendStatesDefaultReplace();
    }
    else {
      uint64_t v35 = C3DBlendStatesDefaultOver();
    }
    char v36 = *(unsigned char *)(a1 + 1993);
    char v37 = *(unsigned char *)(a1 + 1994);
    if (*(unsigned char *)(a1 + 1995) == 2) {
      char v38 = 2;
    }
    else {
      char v38 = 1;
    }
    *(void *)((char *)&v119[1] + 7) = 0;
    *(void *)((char *)v119 + 15) = 0;
    double v39 = *(void **)(a1 + 112);
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v96 = v16;
    uint64_t v99 = v35;
    uint64_t v100 = 0;
    __int16 v101 = 783;
    char v102 = v36;
    char v103 = v38;
    int v104 = 0;
    uint64_t v105 = v31;
    uint64_t v106 = v32;
    char v107 = v37;
    *(_OWORD *)&v108[15] = *(_OWORD *)((char *)v119 + 15);
    *(_OWORD *)uint64_t v108 = v119[0];
    uint64_t v109 = 0;
    float32x2_t v40 = objc_msgSend(v39, "renderResourceForProgramDesc:renderPassDescriptor:", &v96, *(void *)(a1 + 216), v81);
    uint64_t v41 = *(void *)(a1 + 248);
    uint64_t v42 = [v40 state];
    if (*(void *)(v41 + 3376) != v42)
    {
      *(void *)(v41 + 3376) = v42;
      [*(id *)(v41 + 3392) setRenderPipelineState:v42];
    }
    -[SCNMTLRenderContext setRasterizerStates:](a1, *(void *)(a1 + 2184));
    float Intensity = 1.0;
    if ((C3DWasLinkedBeforeMajorOSYear2020() & 1) == 0) {
      float Intensity = C3DEffectSlotGetIntensity(a2);
    }
    float v95 = Intensity;
    SCNMTLRenderCommandEncoder::setFragmentBytes(*(SCNMTLRenderCommandEncoder **)(a1 + 248), &v95, 4uLL, 0);
    uint64_t Default = C3DEffectSlotGetTextureSampler(a2);
    if (!Default) {
      uint64_t Default = C3DTextureSamplerGetDefault();
    }
    long long v45 = -[SCNMTLResourceManager renderResourceForSampler:](*(void *)(a1 + 112), Default);
    if ([v13 pixelFormat] == 520 || objc_msgSend(v13, "pixelFormat") == 500)
    {
      unsigned int v46 = *(void **)(*(void *)(a1 + 248) + 3392);
      SCNMTLEnsureIOSurfaceBackingBufferValidity(*(__IOSurface **)(a1 + 240), &v118, 1u);
      [v46 setFragmentTexture:v118 atTextureIndex:0 samplerState:v45 atSamplerIndex:0];
    }
    else
    {
      SCNMTLRenderCommandEncoder::setFragmentTexture(*(void *)(a1 + 248), v13, 0);
      uint64_t v80 = *(void *)(a1 + 248);
      if (*(void **)(v80 + 3248) != v45)
      {
        *(void *)(v80 + 3248) = v45;
        [*(id *)(v80 + 3392) setFragmentSamplerState:v45 atIndex:0];
      }
    }
    if (*(unsigned char *)(a1 + 1994))
    {
      if (!v83)
      {
        uint64_t v47 = scn_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
          -[SCNMTLRenderContext renderBackground:engineContext:passInstance:](v47, v48, v49, v50, v51, v52, v53, v54);
        }
      }
      if (*(unsigned char *)(a1 + 1993))
      {
        unint64_t v55 = 0;
        long long v56 = (float32x4_t *)(v83 + 3168);
        long long v57 = (__n128 *)&v85;
        do
        {
          if (C3DKeyframeControllerHasInterpolationModesPerKey(a2))
          {
            uint64_t v58 = C3DEffectSlotGetImageTransform(a2);
            C3DMatrix4x4Mult(v58, v56, &v110);
          }
          else
          {
            float32x4_t v59 = v56[1];
            float32x4_t v110 = *v56;
            float32x4_t v111 = v59;
            float32x4_t v112 = v56[2];
          }
          long long v113 = xmmword_20B5CB530;
          float32x4_t v60 = v56[25];
          v84[0] = v56[24];
          v84[1] = v60;
          float32x4_t v61 = v56[27];
          v84[2] = v56[26];
          v84[3] = v61;
          [(id)a1 _updateProjectionMatrixForOrthographicSkyboxRenderingIfNeeded:v84];
          C3DMatrix4x4Mult((uint64_t)&v110, v84, &v114);
          __n128 v62 = v115;
          __n128 v63 = v116;
          long long v64 = v117;
          *long long v57 = v114;
          v57[1] = v62;
          v57[2] = v63;
          v57[3] = (__n128)v64;
          v57[24] = C3DSceneComputeWorldToCubemapMatrix(Scene);
          v57[25] = v65;
          v57[26] = v66;
          v57[27] = v67;
          ++v55;
          v56 += 4;
          v57 += 4;
        }
        while (v55 < *(unsigned __int8 *)(a1 + 1993));
      }
      uint64_t v68 = C3DEngineContextGetMatrix4x4(*(void *)(a1 + 144), 0);
      double v69 = *(double *)(v83 + 4832);
      *(float *)&double v69 = v69;
      [(id)a1 _zFarForSkyboxRenderingProjectionMatrix:v68 defaultZFar:v69];
      int v94 = v70;
      float32x4_t v71 = *(SCNMTLRenderCommandEncoder **)(a1 + 248);
      size_t v72 = 784;
    }
    else
    {
      float32x4_t v85 = (float32x4_t)v114;
      __n128 v86 = v115;
      __n128 v87 = v116;
      long long v88 = v117;
      __n128 v89 = C3DSceneComputeWorldToCubemapMatrix(Scene);
      long long v90 = v73;
      long long v91 = v74;
      long long v92 = v75;
      uint64_t v76 = C3DEngineContextGetMatrix4x4(*(void *)(a1 + 144), 0);
      double v77 = *(double *)(v83 + 4832);
      *(float *)&double v77 = v77;
      [(id)a1 _zFarForSkyboxRenderingProjectionMatrix:v76 defaultZFar:v77];
      int v93 = v78;
      float32x4_t v71 = *(SCNMTLRenderCommandEncoder **)(a1 + 248);
      size_t v72 = 144;
    }
    SCNMTLRenderCommandEncoder::setVertexBytes(v71, &v85, v72, 0);
    if (*(void *)(a1 + 15176) != v29)
    {
      *(void *)(a1 + 15176) = v29;
      -[SCNMTLRenderContext _setMeshBuffers:](a1, v82);
    }
    if ([v118 textureType] == 5)
    {
      uint64_t v79 = [(id)-[SCNMTLMesh elements](v82) objectAtIndexedSubscript:0];
      -[SCNMTLRenderContext _drawMeshElement:instanceCount:](a1, v79, 1);
    }
    else
    {
      SCNMTLRenderCommandEncoder::drawFullScreenTriangle(*(SCNMTLRenderCommandEncoder **)(a1 + 248));
    }
    [*(id *)(*(void *)(a1 + 248) + 3392) popDebugGroup];
  }
}

- (void)renderVideoBackground:(__n128 *)a3 engineContext:(uint64_t)a4 slot:
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  if (!result) {
    return result;
  }
  uint64_t v7 = (uint64_t)result;
  [*(id *)(result[31] + 3392) pushDebugGroup:@"SceneKit - Draw video background"];
  int SourceType = C3DImageProxyGetSourceType((uint64_t)a2);
  uint64_t Player = C3DAnimationNodeGetPlayer((uint64_t)a3);
  if (!Player) {
    goto LABEL_5;
  }
  TextureProxy = (const void *)Player;
  if ((__C3DImageProxy *)C3DTextureGetIOSurface(Player) != a2)
  {
    C3DEngineContextSetBackgroundTextureProxy((uint64_t)a3, 0);
LABEL_5:
    uint64_t Default = C3DTextureSamplerGetDefault();
    TextureProxy = (const void *)C3DImageProxyCreateTextureProxy((uint64_t)a2, Default, (uint64_t)a3);
    C3DEngineContextSetBackgroundTextureProxy((uint64_t)a3, TextureProxy);
    CFRelease(TextureProxy);
    goto LABEL_7;
  }
  uint64_t Default = C3DTextureSamplerGetDefault();
LABEL_7:
  float result = (void *)C3DTextureProxyGetMetalTexture((uint64_t)TextureProxy, (uint64_t)a3, Default, (uint64_t)v64);
  id v63 = result;
  if (result)
  {
    double v12 = result;
    uint64_t v41 = a4;
    Quaduint64_t Mesh = C3DEngineContextGetQuadMesh((uint64_t)a3);
    C3DMatrix4x4MakeIdentity((uint64_t)v62);
    uint64_t v43 = QuadMesh;
    double v14 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(void *)(v7 + 112), QuadMesh, 1);
    *(void *)&v65[7] = 0;
    *(void *)__n128 v65 = 0;
    PointOfView = C3DEngineContextGetPointOfView(*(void *)(v7 + 144));
    if (PointOfView) {
      PointOfView = C3DNodeGetCamera((uint64_t)PointOfView);
    }
    if ((*(unsigned char *)(v7 + 152) & 8) != 0
      && *(unsigned char *)(v7 + 1996)
      && PointOfView
      && C3DCameraGetARGrainTexture((uint64_t)PointOfView))
    {
      uint64_t v16 = 2176;
    }
    else
    {
      uint64_t v16 = 2168;
    }
    uint64_t v17 = *(void *)(v7 + v16);
    uint64_t v18 = -[SCNMTLResourceManager commandQueue]((uint64_t)v14);
    uint64_t v19 = -[SCNMTLMesh vertexDescriptorHash]((uint64_t)v14);
    char v20 = *(unsigned char *)(v7 + 1993);
    char v21 = *(unsigned char *)(v7 + 1994);
    if (*(unsigned char *)(v7 + 1995) == 2) {
      char v22 = 2;
    }
    else {
      char v22 = 1;
    }
    *(void *)&v65[15] = 0;
    uint64_t v66 = 0;
    float32x4_t v23 = *(void **)(v7 + 112);
    uint64_t v49 = v17;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    __int16 v53 = 783;
    char v54 = v20;
    char v55 = v22;
    int v56 = 0;
    uint64_t v57 = v18;
    uint64_t v58 = v19;
    char v59 = v21;
    *(_OWORD *)&v60[15] = 0u;
    *(_OWORD *)float32x4_t v60 = *(_OWORD *)v65;
    uint64_t v61 = 0;
    __n128 v24 = objc_msgSend(v23, "renderResourceForProgramDesc:renderPassDescriptor:", &v49, *(void *)(v7 + 216), v41);
    uint64_t v25 = *(void *)(v7 + 248);
    uint64_t v26 = [v24 state];
    if (*(void *)(v25 + 3376) != v26)
    {
      *(void *)(v25 + 3376) = v26;
      [*(id *)(v25 + 3392) setRenderPipelineState:v26];
    }
    -[SCNMTLRenderContext setRasterizerStates:](v7, *(void *)(v7 + 2184));
    float32x4_t v27 = -[SCNMTLResourceManager renderResourceForSampler:](*(void *)(v7 + 112), Default);
    if ([v12 pixelFormat] == 520 || objc_msgSend(v12, "pixelFormat") == 500)
    {
      float32x4_t v28 = *(void **)(*(void *)(v7 + 248) + 3392);
      SCNMTLEnsureIOSurfaceBackingBufferValidity(*(__IOSurface **)(v7 + 240), &v63, 1u);
      [v28 setFragmentTexture:v63 atTextureIndex:0 samplerState:v27 atSamplerIndex:0];
      uint64_t v29 = v43;
    }
    else
    {
      SCNMTLRenderCommandEncoder::setFragmentTexture(*(void *)(v7 + 248), v12, 0);
      uint64_t v31 = *(void *)(v7 + 248);
      uint64_t v29 = v43;
      if (*(void **)(v31 + 3248) != v27)
      {
        *(void *)(v31 + 3248) = v27;
        [*(id *)(v31 + 3392) setFragmentSamplerState:v27 atIndex:0];
      }
    }
    switch(SourceType)
    {
      case 0:
        long long v30 = scn_default_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[SCNMTLRenderContext renderVideoBackground:engineContext:slot:]();
        }
        break;
      case 1:
        __asm { FMOV            V1.2S, #1.0 }
        unint64_t v45 = 0x3F80000000000000;
        uint64_t v46 = _D1;
        uint64_t v47 = 0;
        uint64_t v48 = 1065353216;
        break;
      case 2:
        __textureCoordinatesForCaptureDeviceImageProxy(a2, a3);
        goto LABEL_31;
      case 3:
LABEL_31:
        unint64_t v45 = __textureCoordinatesForCaptureDeviceImageProxy(a2, a3).n128_u64[0];
        uint64_t v46 = v37;
        uint64_t v47 = v38;
        uint64_t v48 = v39;
        break;
      default:
        break;
    }
    SCNMTLRenderCommandEncoder::setVertexBytes(*(SCNMTLRenderCommandEncoder **)(v7 + 248), &v45, 0x20uLL, 0);
    float Intensity = 1.0;
    if ((C3DWasLinkedBeforeMajorOSYear2020() & 1) == 0) {
      float Intensity = C3DEffectSlotGetIntensity(v42);
    }
    float v44 = Intensity;
    SCNMTLRenderCommandEncoder::setFragmentBytes(*(SCNMTLRenderCommandEncoder **)(v7 + 248), &v44, 4uLL, 0);
    if (*(void *)(v7 + 15176) != v29)
    {
      *(void *)(v7 + 15176) = v29;
      -[SCNMTLRenderContext _setMeshBuffers:](v7, (uint64_t)v14);
    }
    SCNMTLRenderCommandEncoder::drawFullScreenQuad(*(SCNMTLRenderCommandEncoder **)(v7 + 248));
    return (void *)[*(id *)(*(void *)(v7 + 248) + 3392) popDebugGroup];
  }
  return result;
}

- (void)authoring_renderMesh:(uint64_t)a3 meshElement:(uint64_t)a4 withProgram:(const void *)a5 uniforms:(size_t)a6 uniformsLength:(uint64_t)a7 rasterizerStates:(uint64_t)a8 blendStates:(uint64_t)a9 texture:(char)a10 depthBias:
{
  if (a1)
  {
    if (*(void *)(a1 + 216))
    {
      uint64_t v16 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(void *)(a1 + 112), a2, 1);
      if (C3DMeshIsVolatile(a2))
      {
        if (!-[SCNMTLMesh volatileBuffer]((uint64_t)v16))
        {
          uint64_t v17 = scn_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
            -[SCNMTLRenderContext authoring_renderMesh:meshElement:withProgram:uniforms:uniformsLength:rasterizerStates:blendStates:texture:depthBias:](v17, v18, v19, v20, v21, v22, v23, v24);
          }
        }
      }
      uint64_t v25 = -[SCNMTLResourceManager renderResourceForMeshElement:](*(void *)(a1 + 112), a3);
      uint64_t PrimitiveRange = C3DMeshElementGetPrimitiveRange(a3);
      [(SCNMTLMeshElement *)v25 setPrimitiveRange:v27];
      if (*(unsigned char *)(a1 + 1995) == 2) {
        char v28 = 2;
      }
      else {
        char v28 = 1;
      }
      char v29 = *(unsigned char *)(a1 + 1993);
      uint64_t v30 = -[SCNMTLResourceManager commandQueue]((uint64_t)v16);
      uint64_t v31 = -[SCNMTLMesh vertexDescriptorHash]((uint64_t)v16);
      char v32 = *(unsigned char *)(a1 + 1994);
      double v33 = *(void **)(a1 + 112);
      uint64_t v42 = a4;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v45 = a8;
      uint64_t v46 = 0;
      __int16 v47 = 15;
      char v48 = v29;
      char v49 = v28;
      int v50 = 0;
      uint64_t v51 = v30;
      uint64_t v52 = v31;
      char v53 = v32;
      long long v54 = 0u;
      memset(v55, 0, sizeof(v55));
      double v34 = (void *)[v33 renderResourceForProgramDesc:&v42 renderPassDescriptor:*(void *)(a1 + 216)];
      uint64_t v35 = *(void *)(a1 + 248);
      uint64_t v36 = [v34 state];
      if (*(void *)(v35 + 3376) != v36)
      {
        *(void *)(v35 + 3376) = v36;
        [*(id *)(v35 + 3392) setRenderPipelineState:v36];
      }
      *(void *)(a1 + 15296) = 0;
      -[SCNMTLRenderContext setRasterizerStates:](a1, a7);
      if (a5) {
        SCNMTLRenderCommandEncoder::setVertexBytes(*(SCNMTLRenderCommandEncoder **)(a1 + 248), a5, a6, 1);
      }
      if (a10)
      {
        LODWORD(v37) = -2.0;
        LODWORD(v38) = -2.0;
        [*(id *)(*(void *)(a1 + 248) + 3392) setDepthBias:v37 slopeScale:v38 clamp:0.0];
      }
      if (a9) {
        SCNMTLRenderCommandEncoder::setFragmentTexture(*(void *)(a1 + 248), (void *)[*(id *)(a1 + 112) renderResourceForImage:a9 sampler:0 options:0 engineContext:*(void *)(a1 + 144) didFallbackToDefaultTexture:0], 0);
      }
      if (*(void *)(a1 + 15176) != a2)
      {
        *(void *)(a1 + 15176) = a2;
        -[SCNMTLRenderContext _setMeshBuffers:](a1, (uint64_t)v16);
      }
      -[SCNMTLRenderContext _drawMeshElement:instanceCount:](a1, (uint64_t)v25, 1);
      if (a10) {
        [*(id *)(*(void *)(a1 + 248) + 3392) setDepthBias:0.0 slopeScale:0.0 clamp:0.0];
      }
    }
    else if ((-[SCNMTLRenderContext authoring_renderMesh:meshElement:withProgram:uniforms:uniformsLength:rasterizerStates:blendStates:texture:depthBias:]::done & 1) == 0)
    {
      -[SCNMTLRenderContext authoring_renderMesh:meshElement:withProgram:uniforms:uniformsLength:rasterizerStates:blendStates:texture:depthBias:]::done = 1;
      uint64_t v39 = scn_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLRenderContext authoring_renderMesh:meshElement:withProgram:uniforms:uniformsLength:rasterizerStates:blendStates:texture:depthBias:]();
      }
    }
  }
}

- (void)authoring_drawPrimitives:(uint64_t)a3 vertexCount:(uint64_t)a4 instanceCount:(uint64_t)a5 vertexBuffers:(uint64_t)a6 offsets:(uint64_t)a7 range:(unint64_t)a8 vertexDescriptor:(void *)a9 withProgram:(uint64_t)a10 uniforms:(const void *)a11 uniformsLength:(size_t)a12 rasterizerStates:(uint64_t)a13 blendStates:(uint64_t)a14
{
  if (a1)
  {
    if (*(void *)(a1 + 216))
    {
      *(void *)(a1 + 15176) = 0;
      if (*(unsigned char *)(a1 + 1995) == 2) {
        char v17 = 2;
      }
      else {
        char v17 = 1;
      }
      int v44 = 0;
      __int16 v45 = 0;
      char v18 = *(unsigned char *)(a1 + 1993);
      uint64_t v19 = [a9 hash];
      char v20 = *(unsigned char *)(a1 + 1994);
      uint64_t v21 = *(void **)(a1 + 112);
      uint64_t v31 = a10;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v34 = a14;
      uint64_t v35 = 0;
      __int16 v36 = 15;
      char v37 = v18;
      char v38 = v17;
      int v39 = 0;
      float32x2_t v40 = a9;
      uint64_t v41 = v19;
      char v42 = v20;
      char v43 = 0;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v22 = (void *)[v21 renderResourceForProgramDesc:&v31 renderPassDescriptor:*(void *)(a1 + 216)];
      uint64_t v23 = *(void *)(a1 + 248);
      uint64_t v24 = [v22 state];
      if (*(void *)(v23 + 3376) != v24)
      {
        *(void *)(v23 + 3376) = v24;
        [*(id *)(v23 + 3392) setRenderPipelineState:v24];
      }
      -[SCNMTLRenderContext setRasterizerStates:](a1, a13);
      if (a11) {
        SCNMTLRenderCommandEncoder::setVertexBytes(*(SCNMTLRenderCommandEncoder **)(a1 + 248), a11, a12, 1);
      }
      SCNMTLRenderCommandEncoder::setVertexBuffers(*(void *)(a1 + 248), a5, a6, a7, a8);
      SCNMTLRenderCommandEncoder::drawPrimitives(*(SCNMTLRenderCommandEncoder **)(a1 + 248), a2, 0, a3, a4, 0);
    }
    else if ((-[SCNMTLRenderContext authoring_drawPrimitives:vertexCount:instanceCount:vertexBuffers:offsets:range:vertexDescriptor:withProgram:uniforms:uniformsLength:rasterizerStates:blendStates:]::done & 1) == 0)
    {
      -[SCNMTLRenderContext authoring_drawPrimitives:vertexCount:instanceCount:vertexBuffers:offsets:range:vertexDescriptor:withProgram:uniforms:uniformsLength:rasterizerStates:blendStates:]::done = 1;
      uint64_t v25 = scn_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLRenderContext authoring_drawPrimitives:vertexCount:instanceCount:vertexBuffers:offsets:range:vertexDescriptor:withProgram:uniforms:uniformsLength:rasterizerStates:blendStates:]();
      }
    }
  }
}

- (uint64_t)authoring_drawDeformersForNode:(uint64_t)a3 authoringEnvironment:
{
  if (result)
  {
    if (a2)
    {
      uint64_t v5 = result;
      float result = C3DNodeGetDeformerStack(a2);
      if (result)
      {
        uint64_t v6 = result;
        float result = C3DDeformerStackWantsGPU(result);
        if (result)
        {
          Baseuint64_t Geometry = (__C3DGeometry *)C3DDeformerStackGetBaseGeometry(v6);
          if (BaseGeometry) {
            BOOL EffectiveDataKindForRendering = C3DGeometryGetEffectiveDataKindForRendering(BaseGeometry);
          }
          else {
            BOOL EffectiveDataKindForRendering = 1;
          }
          double v9 = (void *)[*(id *)(v5 + 112) renderResourceForDeformerStack:v6 node:a2 dataKind:EffectiveDataKindForRendering];
          return (uint64_t)-[SCNMTLDeformerStack drawAuthoringEnvironment:context:](v9, a3, v5);
        }
      }
    }
  }
  return result;
}

- (uint64_t)drawWireframeOverlayForElements:(unsigned int)a3 range:(int)a4 store:(uint64_t)a5 passInstance:(unsigned __int8 *)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (result)
  {
    float32x2_t v10 = (uint64_t *)result;
    [*(id *)(*(void *)(result + 248) + 3392) pushDebugGroup:@"SceneKit - Draw wireframe"];
    LODWORD(v11) = -1138501878;
    LODWORD(v12) = -1194215657;
    LODWORD(v13) = -10.0;
    [*(id *)(v10[31] + 3392) setDepthBias:v13 slopeScale:v11 clamp:v12];
    unsigned int v15 = a3 + a4;
    if (a3 < a3 + a4)
    {
      uint64_t v16 = (unsigned int *)(a2 + 4 * a3);
      *(void *)&long long v14 = 257;
      long long v34 = v14;
      unint64_t v17 = v15 - (unint64_t)a3;
      do
      {
        unsigned int v18 = *v16++;
        a2 = a2 & 0xFFFFFFFF00000000 | v18;
        uint64_t Element = (unsigned __int16 *)C3DRendererElementStoreGetElement(a5, a2);
        uint64_t Node = C3DRendererElementGetNode((uint64_t)Element);
        uint64_t Geometry = C3DRendererElementGetGeometry((uint64_t)Element);
        uint64_t Mesh = C3DRendererElementGetMesh((uint64_t)Element);
        Meshuint64_t Element = C3DRendererElementGetMeshElement((uint64_t)Element);
        if (MeshElement)
        {
          uint64_t v24 = MeshElement;
          uint64_t v25 = v10[282];
          if (v25) {
            uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 80))(v25);
          }
          else {
            uint64_t v26 = 0;
          }
          uint64_t v27 = -[SCNMTLResourceManager wireframeResourceForRendererElement:engineContext:passInstance:hashPass:](v10[14], Element, v10[18], a6, v26);
          if (v27)
          {
            uint64_t v37 = Mesh;
            uint64_t material = (uint64_t)v27->material;
            uint64_t v36 = Node;
            char v29 = v16;
            uint64_t v30 = a5;
            program = v27->program;
            uint64_t MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat(material);
            -[SCNMTLRenderContext setRasterizerStates:]((uint64_t)v10, MTLVertexFormat);
            int v33 = (Element[36] >> 11) & 7;
            v38[0] = program;
            v38[1] = material;
            a5 = v30;
            uint64_t v16 = v29;
            v38[2] = Geometry;
            v38[3] = v36;
            v38[4] = v37;
            void v38[5] = v24;
            memset(&v38[6], 0, 24);
            int v39 = v34;
            char v40 = 0;
            char v41 = v33;
            __int16 v42 = 0;
            [v10 _executeDrawCommand:v38];
          }
        }
        --v17;
      }
      while (v17);
    }
    objc_msgSend(*(id *)(v10[31] + 3392), "setDepthBias:slopeScale:clamp:", 0.0, 0.0, 0.0, v34);
    return [*(id *)(v10[31] + 3392) popDebugGroup];
  }
  return result;
}

float __81__SCNMTLRenderContext_startProcessingRendererElementsWithEngineIterationContext___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1[4] + 8 * *(unsigned int *)(*(void *)(a1[5] + 8) + 24) + 6552) = *(void *)(a3 + 400);
  uint64_t v6 = *(void *)(a3 + 416);
  if (!v6) {
    uint64_t v6 = *(void *)(a3 + 400);
  }
  *(void *)(a1[4] + 8 * *(unsigned int *)(*(void *)(a1[5] + 8) + 24) + 8600) = v6;
  uint64_t v7 = *(void *)(a3 + 424);
  if (v7 || (uint64_t v7 = *(void *)(a3 + 408)) != 0) {
    *(void *)(a1[4] + 8 * *(unsigned int *)(*(void *)(a1[5] + 8) + 24) + 10648) = -[SCNMTLResourceManager renderResourceForSampler:](*(void *)(a1[4] + 112), v7);
  }
  CFDictionaryRef Light = C3DNodeGetLight(a2);
  uint64_t v9 = a1[6];
  uint64_t v10 = *(void *)(a1[5] + 8);
  unsigned int v11 = *(_DWORD *)(v10 + 24);
  *(_DWORD *)(v10 + 24) = v11 + 1;
  uint64_t v12 = v9 + 208 * v11;
  float32x4_t v13 = *(float32x4_t *)a3;
  *(_OWORD *)uint64_t v12 = *(_OWORD *)a3;
  v13.i32[3] = *(_DWORD *)(a3 + 396);
  *(float32x4_t *)uint64_t v12 = v13;
  __int32 Type = C3DLightGetType((uint64_t)Light);
  v15.i32[0] = 1;
  v16.i32[0] = Type;
  *(float32x4_t *)(v12 + 16) = vmulq_f32(*(float32x4_t *)a3, (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v16, v15), 0), (int8x16_t)vdupq_n_s32(0x40490FDBu), (int8x16_t)vdupq_n_s32(0x447A0000u)));
  *(_OWORD *)(v12 + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v12 + 64) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v12 + 96) = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v12 + 112) = *(_OWORD *)(a3 + 96);
  long long v17 = *(_OWORD *)(a3 + 144);
  long long v18 = *(_OWORD *)(a3 + 160);
  long long v19 = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(v12 + 144) = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(v12 + 160) = v17;
  *(_OWORD *)(v12 + 176) = v18;
  *(_OWORD *)(v12 + 192) = v19;
  float result = *(float *)(a3 + 116);
  *(float *)(v12 + 128) = result;
  return result;
}

- (uint64_t)setShowsAuthoringEnvironment:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 15416) = a2;
  }
  return result;
}

- (BOOL)forceAsyncShaderCompilation
{
  if (result) {
    return *(char *)(result + 152) < 0;
  }
  return result;
}

- (uint64_t)setForceAsyncShaderCompilation:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 0x80;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 152) = v2 & 0x80 | *(unsigned char *)(result + 152) & 0x7F;
  }
  return result;
}

- (void)setCollectsCompilationErrors:(uint64_t)a1
{
  if (a1)
  {
    *(unsigned char *)(a1 + 15424) = a2;
    id v3 = *(id *)(a1 + 15432);
    if (a2)
    {
      if (!v3)
      {
        id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        *(void *)(a1 + 15432) = v3;
      }
      [v3 removeAllObjects];
    }
    else
    {

      *(void *)(a1 + 15432) = 0;
    }
  }
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result = *(__n128 *)(a4 + 12704);
  long long v5 = *(_OWORD *)(a4 + 12720);
  long long v6 = *(_OWORD *)(a4 + 12752);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a4 + 12736);
  *(_OWORD *)(a2 + 48) = v6;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_2(uint64_t a1, simd_float4x4 *a2, uint64_t a3, uint64_t a4)
{
  *a2 = __invert_f4(*(simd_float4x4 *)(a4 + 12704));
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  if (a3 != 8)
  {
    long long v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __39__SCNMTLRenderContext_registerBindings__block_invoke_4_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  *a2 = *(void *)(a4 + 14080);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_148(uint64_t a1, simd_float4x4 *a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  int v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 2) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 2;
    if (a6)
    {
      uint64_t v7 = 0;
      long long v8 = *(_OWORD *)(a4 + 12704);
      long long v9 = *(_OWORD *)(a4 + 12720);
      long long v10 = *(_OWORD *)(a4 + 12736);
      long long v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        uint64_t v12 = 0;
        uint64_t v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        float32x4_t v14 = *v13;
        float32x4_t v15 = v13[1];
        float32x4_t v16 = v13[2];
        float32x4_t v17 = v13[3];
        v22[0] = v8;
        v22[1] = v9;
        v22[2] = v10;
        v22[3] = v11;
        do
        {
          v23[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v22[v12])), v15, *(float32x2_t *)&v22[v12], 1), v16, (float32x4_t)v22[v12], 2), v17, (float32x4_t)v22[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        long long v18 = v23[1];
        long long v19 = v23[2];
        long long v20 = v23[3];
        uint64_t v21 = (_OWORD *)(a4 + 13216 + (v7 << 6));
        _OWORD *v21 = v23[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
  }
  *a2 = __invert_f4(*(simd_float4x4 *)(a4 + ((unint64_t)a5 << 6) + 13216));
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_2_154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6)
{
  int v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 1) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 1;
    if ((v6 & 2) == 0)
    {
      *(_DWORD *)(a4 + 14056) = v6 | 3;
      if (!a6) {
        goto LABEL_11;
      }
      uint64_t v7 = 0;
      long long v8 = *(_OWORD *)(a4 + 12704);
      long long v9 = *(_OWORD *)(a4 + 12720);
      long long v10 = *(_OWORD *)(a4 + 12736);
      long long v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        uint64_t v12 = 0;
        uint64_t v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        float32x4_t v14 = *v13;
        float32x4_t v15 = v13[1];
        float32x4_t v16 = v13[2];
        float32x4_t v17 = v13[3];
        v44[0] = v8;
        v44[1] = v9;
        v44[2] = v10;
        v44[3] = v11;
        do
        {
          v45[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v44[v12])), v15, *(float32x2_t *)&v44[v12], 1), v16, (float32x4_t)v44[v12], 2), v17, (float32x4_t)v44[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        long long v18 = v45[1];
        long long v19 = v45[2];
        long long v20 = v45[3];
        uint64_t v21 = (_OWORD *)(a4 + 13216 + (v7 << 6));
        _OWORD *v21 = v45[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
    if (a6)
    {
      uint64_t v22 = a4 + 12832;
      uint64_t v23 = a6;
      __asm { FMOV            V0.4S, #1.0 }
      do
      {
        float32x4_t v29 = *(float32x4_t *)(v22 + 384);
        float32x4_t v30 = *(float32x4_t *)(v22 + 400);
        float32x4_t v31 = *(float32x4_t *)(v22 + 416);
        long long v32 = *(_OWORD *)(v22 + 432);
        int32x4_t v33 = (int32x4_t)vmulq_f32(v29, v29);
        int32x4_t v34 = (int32x4_t)vmulq_f32(v30, v30);
        int32x4_t v35 = (int32x4_t)vmulq_f32(v31, v31);
        int32x4_t v36 = vzip2q_s32(v33, v35);
        float32x4_t v37 = (float32x4_t)vzip1q_s32(vzip1q_s32(v33, v35), v34);
        float32x4_t v38 = (float32x4_t)vtrn2q_s32(v33, v34);
        v38.i32[2] = v35.i32[1];
        float32x4_t v39 = vdivq_f32(_Q0, vaddq_f32((float32x4_t)vzip1q_s32(v36, vdupq_laneq_s32(v34, 2)), vaddq_f32(v37, v38)));
        *(float32x4_t *)uint64_t v22 = vmulq_n_f32(v29, v39.f32[0]);
        *(float32x4_t *)(v22 + 16) = vmulq_lane_f32(v30, *(float32x2_t *)v39.f32, 1);
        *(float32x4_t *)(v22 + 32) = vmulq_laneq_f32(v31, v39, 2);
        *(_OWORD *)(v22 + 48) = v32;
        v22 += 64;
        --v23;
      }
      while (v23);
    }
  }
LABEL_11:
  uint64_t v40 = a4 + ((unint64_t)a5 << 6);
  __n128 result = *(__n128 *)(v40 + 12832);
  long long v42 = *(_OWORD *)(v40 + 12848);
  long long v43 = *(_OWORD *)(v40 + 12880);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v40 + 12864);
  *(_OWORD *)(a2 + 48) = v43;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v42;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_3_160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  int v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 4) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 4;
    if (a6)
    {
      uint64_t v7 = 0;
      long long v8 = *(_OWORD *)(a4 + 12704);
      long long v9 = *(_OWORD *)(a4 + 12720);
      long long v10 = *(_OWORD *)(a4 + 12736);
      long long v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        uint64_t v12 = 0;
        uint64_t v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        float32x4_t v14 = v13[12];
        float32x4_t v15 = v13[13];
        float32x4_t v16 = v13[14];
        float32x4_t v17 = v13[15];
        v26[0] = v8;
        v26[1] = v9;
        v26[2] = v10;
        v26[3] = v11;
        do
        {
          v27[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v26[v12])), v15, *(float32x2_t *)&v26[v12], 1), v16, (float32x4_t)v26[v12], 2), v17, (float32x4_t)v26[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        long long v18 = v27[1];
        long long v19 = v27[2];
        long long v20 = v27[3];
        uint64_t v21 = (_OWORD *)(a4 + 13600 + (v7 << 6));
        _OWORD *v21 = v27[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
  }
  uint64_t v22 = a4 + ((unint64_t)a5 << 6);
  __n128 result = *(__n128 *)(v22 + 13600);
  long long v24 = *(_OWORD *)(v22 + 13616);
  long long v25 = *(_OWORD *)(v22 + 13648);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v22 + 13632);
  *(_OWORD *)(a2 + 48) = v25;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v24;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_4_166(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result = *(__n128 *)(a4 + 12768);
  long long v5 = *(_OWORD *)(a4 + 12784);
  long long v6 = *(_OWORD *)(a4 + 12816);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a4 + 12800);
  *(_OWORD *)(a2 + 48) = v6;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

float __39__SCNMTLRenderContext_registerBindings__block_invoke_5(uint64_t a1, float *a2, uint64_t a3, uint64_t a4)
{
  float result = *(float *)(a4 + 2744);
  *a2 = result;
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6(uint64_t a1, simd_float4x4 *a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  int v6 = *(_DWORD *)(a4 + 14056);
  if ((v6 & 4) == 0)
  {
    *(_DWORD *)(a4 + 14056) = v6 | 4;
    if (a6)
    {
      uint64_t v7 = 0;
      long long v8 = *(_OWORD *)(a4 + 12704);
      long long v9 = *(_OWORD *)(a4 + 12720);
      long long v10 = *(_OWORD *)(a4 + 12736);
      long long v11 = *(_OWORD *)(a4 + 12752);
      do
      {
        uint64_t v12 = 0;
        uint64_t v13 = (float32x4_t *)(a4 + 2288 + 704 * v7);
        float32x4_t v14 = v13[12];
        float32x4_t v15 = v13[13];
        float32x4_t v16 = v13[14];
        float32x4_t v17 = v13[15];
        v22[0] = v8;
        v22[1] = v9;
        v22[2] = v10;
        v22[3] = v11;
        do
        {
          v23[v12] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v22[v12])), v15, *(float32x2_t *)&v22[v12], 1), v16, (float32x4_t)v22[v12], 2), v17, (float32x4_t)v22[v12], 3);
          ++v12;
        }
        while (v12 != 4);
        long long v18 = v23[1];
        long long v19 = v23[2];
        long long v20 = v23[3];
        uint64_t v21 = (_OWORD *)(a4 + 13600 + (v7 << 6));
        _OWORD *v21 = v23[0];
        v21[1] = v18;
        v21[2] = v19;
        v21[3] = v20;
        ++v7;
      }
      while (v7 != a6);
    }
  }
  *a2 = __invert_f4(*(simd_float4x4 *)(a4 + ((unint64_t)a5 << 6) + 13600));
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  C3DNodeGetLocalBoundingBox(a4[878].i64[0], &v8);
  float32x4_t v6 = vaddq_f32(v8, v9);
  a4[874] = vsubq_f32(v8, v9);
  a4[875] = v6;
  __n128 result = (__n128)a4[875];
  *(float32x4_t *)a2 = a4[874];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, float32x4_t *a4)
{
  C3DNodeGetLocalBoundingBox(a4[878].i64[0], &v12);
  float32x4_t v6 = a4[794];
  float32x4_t v7 = a4[795];
  float32x4_t v8 = a4[796];
  float32x4_t v9 = vaddq_f32(a4[797], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v7, *(float32x2_t *)v12.f32, 1), v6, v12.f32[0]), v8, v12, 2));
  float32x4_t v10 = vaddq_f32(vaddq_f32(vabsq_f32(vmulq_n_f32(v6, v13.f32[0])), vabsq_f32(vmulq_lane_f32(v7, *(float32x2_t *)v13.f32, 1))), vabsq_f32(vmulq_laneq_f32(v8, v13, 2)));
  a4[876] = vsubq_f32(v9, v10);
  a4[877] = vaddq_f32(v9, v10);
  __n128 result = (__n128)a4[877];
  *(float32x4_t *)a2 = a4[876];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_9(uint64_t a1, float *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 + 14048);
  if (v5) {
    C3DNodeGetWorldAlpha(v5);
  }
  else {
    float v6 = 1.0;
  }
  *a2 = v6;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_10(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t LightProbesSystem = (void *)C3DLightingSystemGetLightProbesSystem(*(void *)(a4 + 2232));
  uint64_t SphericalHarmonicsOrder = C3DLightProbesSystemGetSphericalHarmonicsOrder((uint64_t)LightProbesSystem);
  if (SphericalHarmonicsOrder == 3)
  {
    if (C3DNodeGetMovability(*(void *)(a4 + 14048))
      || !C3DNodeGetLocalBoundingBox(*(void *)(a4 + 14048), &v34))
    {
      C3DLightProbesQuerySH3(LightProbesSystem, *(unsigned int **)(a4 + 14064), &v36, *(int32x4_t *)(a4 + 12752));
    }
    else
    {
      float32x4_t v19 = *(float32x4_t *)(a4 + 12704);
      float32x4_t v20 = *(float32x4_t *)(a4 + 12720);
      float32x4_t v21 = *(float32x4_t *)(a4 + 12736);
      int32x4_t v22 = (int32x4_t)vaddq_f32(*(float32x4_t *)(a4 + 12752), vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v20, *(float32x2_t *)v34.f32, 1), v19, v34.f32[0]), v21, v34, 2));
      v22.i32[3] = 1.0;
      float32x4_t v23 = (float32x4_t)v35;
      v23.i32[1] = v35.i32[0];
      v23.i32[2] = v35.i32[0];
      C3DLightProbesQueryBoxSH3(LightProbesSystem, *(unsigned int **)(a4 + 14064), &v36, v22, vaddq_f32(vaddq_f32(vabsq_f32(vmulq_f32(v19, v23)), vabsq_f32(vmulq_f32((float32x4_t)vuzp2q_s32(vdupq_lane_s32(*(int32x2_t *)v35.i8, 1), v35), v20))), vabsq_f32(vmulq_f32((float32x4_t)vzip2q_s32(vtrn1q_s32(v35, v35), v35), v21))));
    }
    if (a3 != 112)
    {
      long long v24 = scn_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        __39__SCNMTLRenderContext_registerBindings__block_invoke_10_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }
    long long v32 = v41;
    *(_OWORD *)(a2 + 64) = v40;
    *(_OWORD *)(a2 + 80) = v32;
    *(_OWORD *)(a2 + 96) = v42;
    long long v33 = v37;
    *(float32x4_t *)a2 = v36;
    *(_OWORD *)(a2 + 16) = v33;
    __n128 result = v39;
    *(_OWORD *)(a2 + 32) = v38;
    *(__n128 *)(a2 + 48) = result;
  }
  else if (SphericalHarmonicsOrder == 2)
  {
    C3DLightProbesQuerySH2((uint64_t)LightProbesSystem, *(unsigned int **)(a4 + 14064), &v36, *(int32x4_t *)(a4 + 12752));
    if (a3 != 48)
    {
      float32x4_t v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        __39__SCNMTLRenderContext_registerBindings__block_invoke_10_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    long long v18 = v37;
    *(float32x4_t *)a2 = v36;
    *(_OWORD *)(a2 + 16) = v18;
    result.n128_u64[0] = v38;
    *(_OWORD *)(a2 + 32) = v38;
  }
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_2_204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)[*(id *)(a3 + 15232) textureAtIndices:*(unsigned __int16 *)(a2 + 9)];
  if (!v5)
  {
    uint64_t v5 = (void *)[*(id *)(a3 + 112) defaultTexture];
    id Weak = objc_loadWeak((id *)(a3 + 15472));
    if (Weak) {
      [Weak renderContext:a3, a2, objc_msgSend(NSString, "stringWithFormat:", @"Unable to find texture for binding %@ and shadable %@", a2, *(void *)(a3 + 15232)) didFallbackToDefaultTextureForSource message];
    }
  }
  uint64_t v7 = *(void *)(a3 + 248);
  __int16 v8 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v8 != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(*(void *)(a3 + 248), v5, (char)v8);
  }
  if ((~v8 & 0xFF00) != 0) {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v7, v5, (uint64_t)v8 >> 8);
  }
  uint64_t v9 = *(unsigned __int8 *)(a2 + 11);
  uint64_t v10 = *(unsigned __int8 *)(a2 + 12);
  if (v10 != 255 || v9 != 255)
  {
    uint64_t v11 = [*(id *)(a3 + 15232) samplerAtIndices:v9 | (v10 << 8)];
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)(a3 + 248);
    if (v9 != 255)
    {
      uint64_t v14 = v13 + 8 * (char)v9;
      if (*(void *)(v14 + 1600) != v11)
      {
        *(void *)(v14 + 1600) = v11;
        [*(id *)(v13 + 3392) setVertexSamplerState:v11 atIndex:(char)v9];
      }
    }
    if (v10 != 255)
    {
      uint64_t v15 = v13 + 8 * (char)v10;
      if (*(void *)(v15 + 3248) != v12)
      {
        *(void *)(v15 + 3248) = v12;
        uint64_t v16 = *(void **)(v13 + 3392);
        [v16 setFragmentSamplerState:v12 atIndex:(char)v10];
      }
    }
  }
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_3_210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a3 + 15232) samplerAtIndices:*(unsigned __int16 *)(a2 + 9)];
  uint64_t v6 = result;
  uint64_t v7 = *(void *)(a3 + 248);
  __int16 v8 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v8 != 0xFF)
  {
    uint64_t v9 = v7 + 8 * (char)v8;
    if (*(void *)(v9 + 1600) != result)
    {
      *(void *)(v9 + 1600) = result;
      uint64_t result = [*(id *)(v7 + 3392) setVertexSamplerState:result atIndex:(char)v8];
    }
  }
  if ((~v8 & 0xFF00) != 0)
  {
    uint64_t v10 = v7 + 8 * ((uint64_t)v8 >> 8);
    if (*(void *)(v10 + 3248) != v6)
    {
      *(void *)(v10 + 3248) = v6;
      uint64_t v11 = *(void **)(v7 + 3392);
      return objc_msgSend(v11, "setFragmentSamplerState:atIndex:", v6);
    }
  }
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4_216(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = a3[31];
  uint64_t v4 = a3[1857];
  uint64_t v5 = a3[1858];
  __int16 v6 = *(_WORD *)(a2 + 9);
  if (*(unsigned char *)(a2 + 9) != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexBuffer(a3[31], a3[1857], a3[1858], (char)v6);
  }
  if ((~v6 & 0xFF00) != 0)
  {
    SCNMTLRenderCommandEncoder::setFragmentBuffer(v3, v4, v5, (uint64_t)v6 >> 8);
  }
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_5_222(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v8 = *(_DWORD *)(a3 + 14872);
  __int16 v3 = *(_WORD *)(a2 + 9);
  uint64_t v4 = *(void *)(a3 + 248);
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t result = (uint64_t)SCNMTLBufferPool::allocateAndCopy(*(SCNMTLBufferPool **)(v4 + 3400), &v8, 4uLL, &v9);
  uint64_t v6 = v10;
  uint64_t v7 = v11;
  if ((_BYTE)v3 != 0xFF) {
    uint64_t result = SCNMTLRenderCommandEncoder::setVertexBuffer(v4, v10, v11, (char)v3);
  }
  if ((~v3 & 0xFF00) != 0) {
    return SCNMTLRenderCommandEncoder::setFragmentBuffer(v4, v6, v7, (uint64_t)v3 >> 8);
  }
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t LightProbesSystem = (void *)C3DLightingSystemGetLightProbesSystem(*(void *)(a3 + 2232));
  if (C3DLightProbesSystemGetSphericalHarmonicsOrder((uint64_t)LightProbesSystem) != 3)
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __39__SCNMTLRenderContext_registerBindings__block_invoke_6_228_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  long long v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  SCNMTLBufferPool::allocate(*(SCNMTLBufferPool **)(a3 + 2088), 112, &v18);
  C3DLightProbesQuerySH3(LightProbesSystem, *(unsigned int **)(a3 + 14064), v18, *(int32x4_t *)(a3 + 12752));
  uint64_t v14 = *(void *)(a3 + 248);
  uint64_t v16 = v19;
  uint64_t v15 = v20;
  __int16 v17 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v17 != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexBuffer(v14, v19, v20, (char)v17);
  }
  if ((~v17 & 0xFF00) != 0) {
    SCNMTLRenderCommandEncoder::setFragmentBuffer(v14, v16, v15, (uint64_t)v17 >> 8);
  }
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { FMOV            V0.4S, #1.0 }
  long long v22 = _Q0;
  uint64_t v10 = *(void *)(a3 + 15192);
  if (v10)
  {
    float v11 = *(float *)(a3 + 2900) * *(float *)(a3 + 2436);
    *(float *)&unsigned int v18 = C3DMeshElementGetPointSize(v10) * v11;
    float MinimumPointScreenRadius = C3DMeshElementGetMinimumPointScreenRadius(*(void *)(a3 + 15192));
    DWORD2(v22) = C3DMeshElementGetMaximumPointScreenRadius(*(void *)(a3 + 15192));
    *(void *)&long long v22 = __PAIR64__(LODWORD(MinimumPointScreenRadius), v18);
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t result = (uint64_t)SCNMTLBufferPool::allocateAndCopy(*(SCNMTLBufferPool **)(a3 + 2088), &v22, 0x10uLL, &v19);
  uint64_t v13 = *(void *)(a3 + 248);
  uint64_t v15 = v20;
  uint64_t v14 = v21;
  __int16 v16 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v16 != 0xFF) {
    uint64_t result = SCNMTLRenderCommandEncoder::setVertexBuffer(v13, v20, v21, (char)v16);
  }
  if ((~v16 & 0xFF00) != 0) {
    return SCNMTLRenderCommandEncoder::setFragmentBuffer(v13, v15, v14, (uint64_t)v16 >> 8);
  }
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_2_244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 248);
  uint64_t v4 = *(void **)(a3 + 14760);
  __int16 v5 = *(_WORD *)(a2 + 9);
  if (*(unsigned char *)(a2 + 9) != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(v3, v4, (char)v5);
  }
  if ((~v5 & 0xFF00) != 0)
  {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v3, v4, (uint64_t)v5 >> 8);
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_3_250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 248);
  uint64_t v4 = *(void **)(a3 + 14768);
  __int16 v5 = *(_WORD *)(a2 + 9);
  if (*(unsigned char *)(a2 + 9) != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(v3, v4, (char)v5);
  }
  if ((~v5 & 0xFF00) != 0)
  {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v3, v4, (uint64_t)v5 >> 8);
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4_256(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = (void *)[*(id *)(a3 + 112) areaLightPrecomputedDataTexture];
  uint64_t v6 = *(void *)(a3 + 248);
  __int16 v7 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v7 != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(v6, v5, (char)v7);
  }
  if ((~v7 & 0xFF00) != 0)
  {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v6, v5, (uint64_t)v7 >> 8);
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_5_262(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a3 + 2216);
  if (!v5)
  {
    if ((*(unsigned char *)(a3 + 152) & 0x40) != 0) {
      float v6 = 1.0;
    }
    else {
      float v6 = -1.0;
    }
    C3DSetupHaltonFilterKernelConic(v9, 32, 1.0, 1.0, v6);
    uint64_t v5 = [*(id *)(a3 + 120) newBufferWithBytes:v9 length:512 options:0];
    *(void *)(a3 + 2216) = v5;
  }
  uint64_t v7 = *(void *)(a3 + 248);
  __int16 v8 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v8 != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexBuffer(v7, v5, 0, (char)v8);
  }
  if ((~v8 & 0xFF00) != 0) {
    SCNMTLRenderCommandEncoder::setFragmentBuffer(v7, v5, 0, (uint64_t)v8 >> 8);
  }
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_2_279(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_3_283(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(a3 + 152) & 0x20) != 0)
  {
    uint64_t v4 = a3 + 8 * *(unsigned __int8 *)(a3 + v3 + 14080);
    uint64_t v5 = 6552;
  }
  else
  {
    uint64_t v4 = a3 + 8 * v3;
    uint64_t v5 = 14880;
  }
  float v6 = *(void **)(v4 + v5);
  if (v6)
  {
    uint64_t v7 = *(void *)(a3 + 248);
    __int16 v8 = *(_WORD *)(a2 + 9);
    if (*(unsigned char *)(a2 + 9) != 0xFF) {
      SCNMTLRenderCommandEncoder::setVertexTexture(v7, v6, (char)v8);
    }
    if ((~v8 & 0xFF00) != 0)
    {
      SCNMTLRenderCommandEncoder::setFragmentTexture(v7, v6, (uint64_t)v8 >> 8);
    }
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4_285(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(a3 + 152) & 0x20) != 0)
  {
    uint64_t v9 = a3 + 8 * *(unsigned __int8 *)(a3 + v5 + 14080);
    uint64_t v7 = *(void **)(v9 + 8600);
    __int16 v8 = *(void **)(v9 + 10648);
  }
  else
  {
    uint64_t v6 = a3 + 8 * v5;
    uint64_t v7 = *(void **)(v6 + 14944);
    if (v7)
    {
      __int16 v8 = *(void **)(v6 + 15008);
      goto LABEL_9;
    }
    uint64_t v7 = (void *)[*(id *)(a3 + 112) defaultTexture];
    uint64_t v25 = *(void *)(a3 + 112);
    uint64_t Default = C3DTextureSamplerGetDefault();
    __int16 v8 = -[SCNMTLResourceManager renderResourceForSampler:](v25, Default);
    id Weak = objc_loadWeak((id *)(a3 + 15472));
    if (Weak) {
      [Weak renderContext:a3, a2, objc_msgSend(NSString, "stringWithFormat:", @"Unable to find IES or gobo texture for binding %@", a2) didFallbackToDefaultTextureForSource message];
    }
  }
  if (!v7)
  {
    uint64_t v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      C3DRendererContextApplyTextureSampler_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    uint64_t v7 = 0;
  }
LABEL_9:
  uint64_t v18 = *(void *)(a3 + 248);
  __int16 v19 = *(_WORD *)(a2 + 9);
  if (*(unsigned char *)(a2 + 9) != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(*(void *)(a3 + 248), v7, (char)v19);
  }
  if ((~v19 & 0xFF00) != 0) {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v18, v7, (uint64_t)v19 >> 8);
  }
  int v20 = *(unsigned __int8 *)(a2 + 11);
  uint64_t v21 = *(char *)(a2 + 12);
  if (v21 != -1 || v20 != 255)
  {
    uint64_t v22 = *(void *)(a3 + 248);
    if ((char)v20 != -1)
    {
      uint64_t v23 = v22 + 8 * (char)v20;
      if (*(void **)(v23 + 1600) != v8)
      {
        *(void *)(v23 + 1600) = v8;
        objc_msgSend(*(id *)(v22 + 3392), "setVertexSamplerState:atIndex:", v8);
      }
    }
    if (v21 != -1)
    {
      uint64_t v24 = v22 + 8 * v21;
      if (*(void **)(v24 + 3248) != v8)
      {
        *(void *)(v24 + 3248) = v8;
        [*(id *)(v22 + 3392) setFragmentSamplerState:v8 atIndex:v21];
      }
    }
  }
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_301(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(__n128 **)(a4 + 8 * *(void *)(a1 + 32) + 14336);
  __n128 result = *v4;
  *a2 = *v4;
  return result;
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_2_306(uint64_t result, float32x4_t *a2, uint64_t a3, float32x4_t *a4)
{
  if (a4[908].i8[0])
  {
    float32x4_t v4 = *(float32x4_t *)(a4[896].i64[*(void *)(result + 32)] + 16);
    float32x4_t v5 = vaddq_f32(a4[903], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a4[900], v4.f32[0]), a4[901], *(float32x2_t *)v4.f32, 1), a4[902], v4, 2));
  }
  else
  {
    float32x4_t v5 = *(float32x4_t *)(a4[896].i64[*(void *)(result + 32)] + 16);
  }
  *a2 = v5;
  return result;
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_3_310(uint64_t result, float32x4_t *a2, uint64_t a3, float32x4_t *a4)
{
  if (a4[908].i8[0])
  {
    float32x4_t v4 = *(float32x4_t *)(a4[896].i64[*(void *)(result + 32)] + 32);
    float32x4_t v5 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a4[900], v4.f32[0]), a4[901], *(float32x2_t *)v4.f32, 1), a4[902], v4, 2), (float32x4_t)0, a4[903]);
  }
  else
  {
    float32x4_t v5 = *(float32x4_t *)(a4[896].i64[*(void *)(result + 32)] + 32);
  }
  *a2 = v5;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_4_314(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result = *(__n128 *)(*(void *)(a4 + 8 * *(void *)(a1 + 32) + 14336) + 64);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_5_318(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result = *(__n128 *)(*(void *)(a4 + 8 * *(void *)(a1 + 32) + 14336) + 48);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_6_322(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 8 * *(void *)(a1 + 32) + 14336);
  __n128 result = *(__n128 *)(v4 + 128);
  long long v6 = *(_OWORD *)(v4 + 144);
  long long v7 = *(_OWORD *)(v4 + 160);
  long long v8 = *(_OWORD *)(v4 + 176);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v7;
  *(_OWORD *)(a2 + 48) = v8;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_7_326(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result = *(__n128 *)(*(void *)(a4 + 8 * *(void *)(a1 + 32) + 14336) + 80);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_8_330(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result = *(__n128 *)(*(void *)(a4 + 8 * *(void *)(a1 + 32) + 14336) + 96);
  *a2 = result;
  return result;
}

void *__39__SCNMTLRenderContext_registerBindings__block_invoke_9_334(uint64_t a1, void *a2, unsigned int a3, simd_float4x4 *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  size_t v7 = a3;
  if (a3 >= 0x101)
  {
    long long v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __39__SCNMTLRenderContext_registerBindings__block_invoke_9_334_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  if (a4[227].columns[0].i8[0])
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v17 = (float32x4_t *)(a4[224].columns[0].i64[*(void *)(a1 + 32)] + (i << 6));
      float32x4_t v27 = v17[8];
      float32x4_t v28 = v17[9];
      float32x4_t v25 = v17[11];
      float32x4_t v26 = v17[10];
      simd_float4x4 v33 = __invert_f4(a4[225]);
      uint64_t v18 = 0;
      simd_float4x4 v29 = v33;
      do
      {
        v30[v18] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)&v29.columns[v18])), v28, *(float32x2_t *)v29.columns[v18].f32, 1), v26, (float32x4_t)v29.columns[v18], 2), v25, (float32x4_t)v29.columns[v18], 3);
        ++v18;
      }
      while (v18 != 4);
      long long v19 = v30[1];
      long long v20 = v30[2];
      long long v21 = v30[3];
      uint64_t v22 = &v31[64 * i];
      _OWORD *v22 = v30[0];
      v22[1] = v19;
      v22[2] = v20;
      v22[3] = v21;
    }
    uint64_t v23 = v31;
  }
  else
  {
    uint64_t v23 = (unsigned char *)(a4[224].columns[0].i64[*(void *)(a1 + 32)] + 128);
  }
  return memcpy(a2, v23, v7);
}

float __39__SCNMTLRenderContext_registerBindings__block_invoke_339(uint64_t a1, float *a2, uint64_t a3, uint64_t a4)
{
  float result = *(float *)(*(void *)(a4 + 8 * *(void *)(a1 + 32) + 14336) + 116);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_2_343(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result = *(__n128 *)(*(void *)(a4 + 8 * *(void *)(a1 + 32) + 14336) + 384);
  *a2 = result;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_3_347(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 8 * *(void *)(a1 + 32) + 14336);
  __n128 result = *(__n128 *)(v4 + 128);
  long long v6 = *(_OWORD *)(v4 + 144);
  long long v7 = *(_OWORD *)(v4 + 160);
  long long v8 = *(_OWORD *)(v4 + 176);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v7;
  *(_OWORD *)(a2 + 48) = v8;
  return result;
}

__n128 __39__SCNMTLRenderContext_registerBindings__block_invoke_4_351(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4)
{
  __n128 result = *(__n128 *)(*(void *)(a4 + 8 * *(void *)(a1 + 32) + 14336) + 384);
  *a2 = result;
  return result;
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_5_355(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3[1884];
  uint64_t v6 = a3[1885];
  uint64_t v7 = a3[*(void *)(a1 + 32) + 1886];
  if (!v5)
  {
    long long v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __39__SCNMTLRenderContext_registerBindings__block_invoke_5_355_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  uint64_t v16 = a3[31];
  __int16 v17 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v17 != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexBuffer(v16, v5, v7 + v6, (char)v17);
  }
  if ((~v17 & 0xFF00) != 0) {
    SCNMTLRenderCommandEncoder::setFragmentBuffer(v16, v5, v7 + v6, (uint64_t)v17 >> 8);
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4_378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a3 + 15152);
  uint64_t v4 = *(void *)(a3 + 248);
  __int16 v5 = *(_WORD *)(a2 + 9);
  if (*(unsigned char *)(a2 + 9) != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(v4, v3, (char)v5);
  }
  if ((~v5 & 0xFF00) != 0)
  {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v4, v3, (uint64_t)v5 >> 8);
  }
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_5_384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  TextureWithName = (void *)C3DEngineContextGetTextureWithName(*(void *)(a3 + 144), @"SSAO-Final");
  if (!TextureWithName)
  {
    TextureWithName = (void *)[*(id *)(a3 + 112) defaultTexture];
    id Weak = objc_loadWeak((id *)(a3 + 15472));
    if (Weak) {
      [Weak renderContext:a3, a2, objc_msgSend(NSString, "stringWithFormat:", @"Unable to find \"SSAO-Final\" texture in render graph for binding %@", a2) didFallbackToDefaultTextureForSource message];
    }
  }
  uint64_t v7 = *(void *)(a3 + 248);
  __int16 v8 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v8 != 0xFF) {
    SCNMTLRenderCommandEncoder::setVertexTexture(v7, TextureWithName, (char)v8);
  }
  if ((~v8 & 0xFF00) != 0)
  {
    SCNMTLRenderCommandEncoder::setFragmentTexture(v7, TextureWithName, (uint64_t)v8 >> 8);
  }
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_6_393(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 15264);
  uint64_t v6 = *(__C3DGeometry **)(a3 + 15224);
  uint64_t v7 = *(void *)(a3 + 15272);
  if (!v5 && (__int16 v8 = scn_default_log(), os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)))
  {
    C3DGeometryTrackNode_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  uint64_t v16 = scn_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    C3DGeometryGetName_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
  }
LABEL_6:
  if (!v7)
  {
    uint64_t v24 = scn_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      __39__SCNMTLRenderContext_registerBindings__block_invoke_6_393_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  uint64_t v32 = [*(id *)(a3 + 112) renderResourceForDeformerStack:v7 node:v5 dataKind:C3DGeometryGetEffectiveDataKindForRendering(v6)];
  uint64_t result = -[SCNMTLDeformerStack bufferForCommonProfileArgumentNamed:](v32, [(id)a2 name]);
  uint64_t v34 = result;
  uint64_t v35 = *(void *)(a3 + 248);
  __int16 v36 = *(_WORD *)(a2 + 9);
  if ((_BYTE)v36 != 0xFF) {
    uint64_t result = SCNMTLRenderCommandEncoder::setVertexBuffer(v35, result, 0, (char)v36);
  }
  if ((~v36 & 0xFF00) != 0) {
    return SCNMTLRenderCommandEncoder::setFragmentBuffer(v35, v34, 0, (uint64_t)v36 >> 8);
  }
  return result;
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_405(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = [a2 frequency];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__SCNMTLRenderContext_registerBindings__block_invoke_2_409;
  v9[3] = &unk_264006DB8;
  v9[4] = a2;
  return [a4 addResourceBindingsForArgument:a3 frequency:v7 needsRenderResource:0 block:v9];
}

uint64_t __39__SCNMTLRenderContext_registerBindings__block_invoke_2_409(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)(a3 + 1998) = *(_WORD *)(a2 + 9);
  uint64_t v5 = *(id **)(a3 + 15264);
  if (v5) {
    C3DEntityGetObjCWrapper(v5);
  }
  uint64_t v6 = *(id **)(a3 + 15216);
  if (v6) {
    C3DEntityGetObjCWrapper(v6);
  }
  C3DEngineContextGetUserInfo(*(void *)(a3 + 144));
  uint64_t v7 = *(uint64_t (**)(void))([*(id *)(a1 + 32) block] + 16);

  return v7();
}

- (uint64_t)mapVolatileMesh:(uint64_t)a3 verticesCount:
{
  if (!a1) {
    return 0;
  }
  if ((C3DMeshIsVolatile(a2) & 1) == 0)
  {
    uint64_t v17 = scn_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      C3DRendererContextMapVolatileMesh_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    return 0;
  }
  uint64_t v6 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(void *)(a1 + 112), a2, 1);
  if (!-[SCNMTLMesh volatileStride]((uint64_t)v6))
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLRenderContext mapVolatileMesh:verticesCount:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SCNMTLMesh volatileBuffer]((uint64_t)v6);
  uint64_t v15 = -[SCNMTLMesh volatileStride]((uint64_t)v6) * a3;
  uint64_t v27 = 0;
  id newValue = 0;
  uint64_t v29 = 0;
  SCNMTLBufferPool::allocate(*(SCNMTLBufferPool **)(a1 + 2024), v15, &v27);
  -[SCNMTLMesh setVolatileSize:]((uint64_t)v6, v15);
  -[SCNMTLMesh setVolatileBuffer:](v6, (char *)newValue);
  -[SCNMTLMesh setVolatileOffset:]((uint64_t)v6, v29);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __53__SCNMTLRenderContext_mapVolatileMesh_verticesCount___block_invoke;
  v26[3] = &__block_descriptor_48_e201_v32__0____C3DMeshSource____C3DGenericSource____C3DEntity____CFRuntimeBase_QAQ__v____CFString_____CFString_____CFDictionary_____C3DScene_q_____C3DSourceAccessor________CFData__v_v_qb1b1b1_SCC_8c16q20C28l;
  _OWORD v26[4] = a3;
  void v26[5] = v27;
  uint64_t v16 = 1;
  C3DMeshApplySources(a2, 1, (uint64_t)v26);
  [*(id *)(a1 + 2032) addObject:v6];
  return v16;
}

void __53__SCNMTLRenderContext_mapVolatileMesh_verticesCount___block_invoke(uint64_t a1, uint64_t a2)
{
  if (C3DMeshSourceIsVolatile(a2))
  {
    uint64_t Accessor = C3DMeshSourceGetAccessor(a2);
    C3DSourceAccessorSetCount(Accessor, *(void *)(a1 + 32));
    uint64_t v5 = *(void *)(a1 + 40) + C3DSourceAccessorGetOffset(Accessor);
    C3DMeshSourceSetVolatileData(a2, v5);
  }
}

- (void)unmapVolatileMesh:(uint64_t)a3 modifiedVerticesCount:
{
  if (a1)
  {
    if (C3DMeshIsVolatile(a2))
    {
      uint64_t v6 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(void *)(a1 + 112), a2, 1);
      -[SCNMTLRenderContext sampleCount]((uint64_t)v6);
      if ((a3 & 0x8000000000000000) == 0) {
        -[SCNMTLMesh volatileStride]((uint64_t)v6);
      }
      uint64_t v7 = -[SCNMTLMesh volatileBuffer]((uint64_t)v6);
      -[SCNMTLMesh volatileOffset]((uint64_t)v6);
      if (!v7)
      {
        uint64_t v8 = scn_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          -[SCNMTLRenderContext unmapVolatileMesh:modifiedVerticesCount:](v8, v9, v10, v11, v12, v13, v14, v15);
        }
      }
      C3DMeshApplySources(a2, 1, (uint64_t)&__block_literal_global_416);
    }
    else
    {
      uint64_t v16 = scn_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        C3DRendererContextMapVolatileMesh_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
}

void __63__SCNMTLRenderContext_unmapVolatileMesh_modifiedVerticesCount___block_invoke(uint64_t a1, uint64_t a2)
{
  if (C3DMeshSourceIsVolatile(a2))
  {
    C3DMeshSourceSetVolatileData(a2, 0);
  }
}

- (void)resetVolatileMeshes
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  volatileMeshes = self->_volatileMeshes;
  uint64_t v4 = [(NSMutableArray *)volatileMeshes countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(volatileMeshes);
        }
        -[SCNMTLMesh setVolatileBuffer:](*(void **)(*((void *)&v8 + 1) + 8 * i), 0);
      }
      uint64_t v5 = [(NSMutableArray *)volatileMeshes countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_volatileMeshes removeAllObjects];
}

- (id)_newMTLBufferFromPoolWithLength:(unint64_t)a3
{
  uint64_t v5 = (SCNMTLBuffer *)[(NSMutableArray *)self->_bufferPool lastObject];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = v5;
    [(NSMutableArray *)self->_bufferPool removeLastObject];
  }
  else
  {
    uint64_t v6 = objc_alloc_init(SCNMTLBuffer);
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  SCNMTLBufferPool::allocate((SCNMTLBufferPool *)self->_frameVolatileBufferPool, a3, &v9);
  [(SCNMTLBuffer *)v6 setBuffer:v10];
  [(SCNMTLBuffer *)v6 setOffset:v11];
  if (![(SCNMTLBuffer *)v6 buffer])
  {

    return 0;
  }
  return v6;
}

- (void)_recycleMTLBufferToPool:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLRenderContext _recycleMTLBufferToPool:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  [(NSMutableArray *)self->_bufferPool addObject:a3];
  [a3 setUsedCount:0];
  [a3 setBuffer:0];
  [a3 setOffset:0];
  [a3 setDataSource:0];
}

- (const)createVolatileMeshElementOfType:(int)a3 primitiveCount:(uint64_t)a4 bytesPerIndex:
{
  if (!a1) {
    return 0;
  }
  if ([*(id *)(a1 + 2056) count])
  {
    Volatile = (const void *)[*(id *)(a1 + 2056) lastObject];
    [*(id *)(a1 + 2048) addObject:Volatile];
    [*(id *)(a1 + 2056) removeLastObject];
    if (!Volatile)
    {
LABEL_6:
      uint64_t v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        C3DMeshElementCreate_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else
  {
    Volatile = (const void *)C3DMeshElementCreateVolatile();
    [*(id *)(a1 + 2048) addObject:Volatile];
    CFRelease(Volatile);
    if (!Volatile) {
      goto LABEL_6;
    }
  }
  C3DMeshElementSetType((uint64_t)Volatile, a2);
  C3DMeshElementSetPrimitives((uint64_t)Volatile, a3, 0, a4);
  uint64_t v17 = -[SCNMTLResourceManager renderResourceForMeshElement:](*(void *)(a1 + 112), (uint64_t)Volatile);
  if (-[SCNMTLMeshElement indexBuffer]((uint64_t)v17))
  {
    uint64_t v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLRenderContext createVolatileMeshElementOfType:primitiveCount:bytesPerIndex:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  -[SCNMTLMeshElement setupWithElement:](v17, (uint64_t)Volatile);
  uint64_t v26 = (char *)[(id)a1 _newMTLBufferFromPoolWithLength:-[SCNMTLResourceManager commandQueue]((uint64_t)v17) * a4];
  -[SCNMTLMeshElement setIndexBuffer:](v17, v26);

  uint64_t v27 = objc_msgSend((id)objc_msgSend(v26, "buffer"), "contents");
  uint64_t v28 = [v26 offset];
  uint64_t v29 = -[SCNMTLResourceManager libraryManager]((uint64_t)v17);
  C3DMeshElementSetVolatileDataPtr((uint64_t)Volatile, v27 + v28 + v29);
  return Volatile;
}

- (uint64_t)unmapVolatileMeshElement:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = -[SCNMTLResourceManager renderResourceForMeshElement:](*(void *)(result + 112), a2);
    [(id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v3) buffer];
    [(id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v3) offset];
    C3DMeshElementGetBytesPerIndex(a2);
    return -[SCNMTLResourceManager commandQueue]((uint64_t)v3);
  }
  return result;
}

- (void)resetVolatileMeshElements
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  usedVolatileMeshElements = self->_usedVolatileMeshElements;
  uint64_t v4 = [(NSMutableArray *)usedVolatileMeshElements countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(usedVolatileMeshElements);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)self->_resourceManager, v8);
        -[SCNMTLRenderContext _recycleMTLBufferToPool:](self, "_recycleMTLBufferToPool:", -[SCNMTLMeshElement indexBuffer]((uint64_t)v9));
        -[SCNMTLMeshElement setIndexBuffer:](v9, 0);
        -[SCNMTLMeshElement setSharedIndexBufferOffset:]((uint64_t)v9, 0);
        C3DMeshElementSetVolatileDataPtr(v8, 0);
      }
      uint64_t v5 = [(NSMutableArray *)usedVolatileMeshElements countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_freeVolatileMeshElements addObjectsFromArray:self->_usedVolatileMeshElements];
  [(NSMutableArray *)self->_usedVolatileMeshElements removeAllObjects];
}

- (uint64_t)drawFullScreenQuadForPass:(uint64_t)result
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v3 = (uint64_t *)result;
    if (!*(void *)(result + 144))
    {
      uint64_t v4 = scn_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLRenderContext drawRenderElement:withPass:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
    Quaduint64_t Mesh = C3DEngineContextGetQuadMesh(v3[18]);
    v13[0] = C3DFXPassGetProgram(a2);
    v13[1] = C3DFXPassGetMaterial(a2);
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = QuadMesh;
    v13[5] = C3DMeshGetElementAtIndex(QuadMesh, 0, 1);
    v13[6] = 0;
    v13[7] = a2;
    v13[8] = 0;
    __int16 v14 = 257;
    int v15 = 0;
    __int16 v16 = 0;
    return [v3 _executeDrawCommand:v13];
  }
  return result;
}

- (uint64_t)currentRenderCommandEncoder
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 248);
    if (v1) {
      return *(void *)(v1 + 3392);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)currentRenderPassDescriptor
{
  if (result) {
    return *(void *)(C3DEngineContextGetRenderGraph(*(void *)(result + 144)) + 152);
  }
  return result;
}

- (void)_drawPBRTextures
{
  char v2 = self;
  if (self) {
    self = *(SCNMTLRenderContext **)(C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext) + 152);
  }
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[SCNMTLRenderContext colorAttachments](self, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture"), "pixelFormat");
  if (v2) {
    uint64_t v4 = *(void **)(C3DEngineContextGetRenderGraph((uint64_t)v2->_engineContext) + 152);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture"), "sampleCount");
  if (v3)
  {
    if (v2->_debug.pixelFormat != v3 || v2->_debug.sampleCount != v5)
    {
      v2->_debug.pixelFormat = v3;
      v2->_debug.sampleuint64_t Count = v5;
      uint64_t v6 = [(id)-[SCNMTLResourceManager libraryManager]((uint64_t)v2->_resourceManager) frameworkLibrary];
      memset(&__src[20], 0, 40);
      memset(&__src[14], 0, 88);
      memset(&__src[8], 0, 88);
      memset(__src, 0, 120);
      *((void *)&__src[7] + 1) = v6;
      *((void *)&__src[13] + 1) = C3DBlendStatesDefaultOver();
      *((void *)&__src[19] + 1) = @"quad_vertex";
      *(void *)&__src[20] = @"quad_display_cube_equirectangular";
      uint64_t RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)v2->_engineContext);
      SCNMTLRenderPipelineApplyRenderPassDescriptor((uint64_t)&__src[8], *(void **)(RenderGraph + 152));

      resourceManager = v2->_resourceManager;
      memcpy(__dst, __src, sizeof(__dst));
      v2->_debug.displayCubemapPipeline = (SCNMTLRenderPipeline *)[(SCNMTLResourceManager *)resourceManager newRenderPipelineStateWithDesc:__dst];
      *((void *)&__src[13] + 1) = C3DBlendStatesDefaultReplace();
      *(void *)&__src[20] = @"quad_display_texture2D";

      uint64_t v9 = v2->_resourceManager;
      memcpy(v60, __src, sizeof(v60));
      v2->_debug.displayTexture2DPipeline = (SCNMTLRenderPipeline *)[(SCNMTLResourceManager *)v9 newRenderPipelineStateWithDesc:v60];
    }
    renderEncoder = v2->_renderEncoder;
    if (!BYTE1(renderEncoder->var14[1].var0) && renderEncoder->var2)
    {
      renderEncoder->var2 = 0;
      renderEncoder->var6 = 1;
    }
    [(id)renderEncoder->var24[1] setDepthStencilState:-[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled]((uint64_t)v2->_resourceManager)];
    uint64_t Scene = C3DEngineContextGetScene((uint64_t)v2->_engineContext);
    long long v12 = *(void **)&v2->_anon_3848[744];
    if (v12)
    {
      unint64_t v13 = [v12 arrayLength];
      uint64_t v14 = [*(id *)&v2->_anon_3848[744] mipmapLevelCount];
      uint64_t v15 = [*(id *)&v2->_anon_3848[744] pixelFormat];
      __n128 Viewport = C3DEngineContextGetViewport((__n128 *)v2->_engineContext);
      unint64_t v17 = Viewport.n128_u64[1];
      float v18 = Viewport.n128_f32[2] / Viewport.n128_f32[3];
      float v19 = 1.0 / (float)v13;
      float v20 = 4.0 / Viewport.n128_f32[3];
      float v21 = (float)(v19 + (float)((float)(4.0 / Viewport.n128_f32[3]) * -2.0)) * 2.5;
      float v59 = v19 + (float)((float)(4.0 / Viewport.n128_f32[3]) * -2.0);
      unint64_t v55 = Viewport.n128_u64[0];
      if ((float)(Viewport.n128_f32[2] / Viewport.n128_f32[3]) <= 1.0) {
        float v22 = v18 * v21;
      }
      else {
        float v22 = v21 / v18;
      }
      float v58 = v22;
      BOOL IsCube = SCNMTLTextureTypeIsCube(objc_msgSend(*(id *)&v2->_anon_3848[744], "textureType", v55));
      uint64_t v31 = v2->_renderEncoder;
      if (IsCube)
      {
        uint64_t v32 = [(SCNMTLRenderPipeline *)v2->_debug.displayCubemapPipeline state];
        if (v31->var23 != (SCNMTLBufferPool *)v32)
        {
          v31->var23 = (SCNMTLBufferPool *)v32;
          [(id)v31->var24[1] setRenderPipelineState:v32];
        }
        if (v13)
        {
          uint64_t v34 = 0;
          float v35 = (float)-*((float *)&v56 + 1) / *((float *)&v17 + 1);
          *(float *)&long long v33 = *(float *)&v56 / *(float *)&v17;
          long long v57 = v33;
          do
          {
            SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, (id)objc_msgSend(*(id *)&v2->_anon_3848[744], "newTextureViewWithPixelFormat:textureType:levels:slices:", v15, 5, 0, v14, v34, 6, v57), 0);
            LODWORD(v36) = v57;
            *((float *)&v36 + 1) = v20 + v35;
            *((void *)&v36 + 1) = __PAIR64__(LODWORD(v59), LODWORD(v58));
            __src[0] = v36;
            SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
            long long v37 = v2->_renderEncoder;
            SCNMTLRenderCommandEncoder::_bindPendingTextures(v37);
            SCNMTLRenderCommandEncoder::applyChangedStates(v37);
            [(id)v37->var24[1] drawPrimitives:4 vertexStart:0 vertexCount:4];
            float v35 = v19 + v35;
            v34 += 6;
            --v13;
          }
          while (v13);
        }
      }
      else
      {
        uint64_t v38 = [(SCNMTLRenderPipeline *)v2->_debug.displayTexture2DPipeline state];
        if (v31->var23 != (SCNMTLBufferPool *)v38)
        {
          v31->var23 = (SCNMTLBufferPool *)v38;
          [(id)v31->var24[1] setRenderPipelineState:v38];
        }
        if (v13)
        {
          uint64_t v39 = 0;
          float v40 = 0.0;
          do
          {
            SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, (id)objc_msgSend(*(id *)&v2->_anon_3848[744], "newTextureViewWithPixelFormat:textureType:levels:slices:", v15, 2, 0, v14, v39, 1), 0);
            LODWORD(v41) = 0;
            *((float *)&v41 + 1) = v20 + v40;
            *((void *)&v41 + 1) = __PAIR64__(LODWORD(v59), LODWORD(v58));
            __src[0] = v41;
            SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
            long long v42 = v2->_renderEncoder;
            SCNMTLRenderCommandEncoder::_bindPendingTextures(v42);
            SCNMTLRenderCommandEncoder::applyChangedStates(v42);
            [(id)v42->var24[1] drawPrimitives:4 vertexStart:0 vertexCount:4];
            ++v39;
            float v40 = v19 + v40;
          }
          while (v13 != v39);
        }
      }
    }
    else
    {
      LightingEnvironmentuint64_t EffectSlot = C3DSceneGetLightingEnvironmentEffectSlot(Scene, 0);
      if (LightingEnvironmentEffectSlot)
      {
        uint64_t v24 = LightingEnvironmentEffectSlot;
        if (C3DEffectSlotHasImageOrTexture(LightingEnvironmentEffectSlot)
          || C3DEffectSlotHasPrecomputedLightingEnvironment(v24))
        {
          uint64_t v25 = -[SCNMTLRenderContext radianceTextureForEffectSlot:](v2, v24);
          if (v25)
          {
            uint64_t v26 = (void *)v25;
            uint64_t v27 = v2->_renderEncoder;
            uint64_t v28 = [(SCNMTLRenderPipeline *)v2->_debug.displayCubemapPipeline state];
            if (v27->var23 != (SCNMTLBufferPool *)v28)
            {
              v27->var23 = (SCNMTLBufferPool *)v28;
              [(id)v27->var24[1] setRenderPipelineState:v28];
            }
            SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v26, 0);
            __src[0] = xmmword_20B5CD540;
            SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
            uint64_t v29 = v2->_renderEncoder;
            SCNMTLRenderCommandEncoder::_bindPendingTextures(v29);
            SCNMTLRenderCommandEncoder::applyChangedStates(v29);
            [(id)v29->var24[1] drawPrimitives:4 vertexStart:0 vertexCount:4];
          }
        }
      }
    }
    uint64_t v43 = C3DSceneGetLightingEnvironmentEffectSlot(Scene, 0);
    if (v43)
    {
      uint64_t v44 = v43;
      if (C3DEffectSlotHasImageOrTexture(v43) || C3DEffectSlotHasPrecomputedLightingEnvironment(v44))
      {
        __int16 v45 = -[SCNMTLRenderContext irradianceTextureForEffectSlot:](v2, v44);
        if (v45)
        {
          long long v46 = v45;
          long long v47 = v2->_renderEncoder;
          uint64_t v48 = [(SCNMTLRenderPipeline *)v2->_debug.displayCubemapPipeline state];
          if (v47->var23 != (SCNMTLBufferPool *)v48)
          {
            v47->var23 = (SCNMTLBufferPool *)v48;
            [(id)v47->var24[1] setRenderPipelineState:v48];
          }
          SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v46, 0);
          __src[0] = xmmword_20B5CD550;
          SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
          char v49 = v2->_renderEncoder;
          SCNMTLRenderCommandEncoder::_bindPendingTextures(v49);
          SCNMTLRenderCommandEncoder::applyChangedStates(v49);
          [(id)v49->var24[1] drawPrimitives:4 vertexStart:0 vertexCount:4];
        }
      }
    }
    uint64_t v50 = [(SCNMTLResourceManager *)v2->_resourceManager specularDFGDiffuseHammonTextureWithRenderContext:v2];
    if (v50)
    {
      uint64_t v51 = (void *)v50;
      uint64_t v52 = v2->_renderEncoder;
      uint64_t v53 = [(SCNMTLRenderPipeline *)v2->_debug.displayTexture2DPipeline state];
      if (v52->var23 != (SCNMTLBufferPool *)v53)
      {
        v52->var23 = (SCNMTLBufferPool *)v53;
        [(id)v52->var24[1] setRenderPipelineState:v53];
      }
      SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v51, 0);
      __src[0] = xmmword_20B5CD560;
      SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
      long long v54 = v2->_renderEncoder;
      SCNMTLRenderCommandEncoder::_bindPendingTextures(v54);
      SCNMTLRenderCommandEncoder::applyChangedStates(v54);
      [(id)v54->var24[1] drawPrimitives:4 vertexStart:0 vertexCount:4];
    }
  }
}

- (void)_drawShadowMaps
{
  char v2 = self;
  if (self) {
    self = *(SCNMTLRenderContext **)(C3DEngineContextGetRenderGraph((uint64_t)self->_engineContext) + 152);
  }
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)-[SCNMTLRenderContext colorAttachments](self, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [v3 pixelFormat];
    uint64_t v6 = [v4 sampleCount];
    if (v2->_debug.pixelFormat != v5 || v2->_debug.sampleCount != v6)
    {
      v2->_debug.pixelFormat = v5;
      v2->_debug.sampleuint64_t Count = v6;
      uint64_t v7 = [(id)-[SCNMTLResourceManager libraryManager]((uint64_t)v2->_resourceManager) frameworkLibrary];
      memset(&__src[21], 0, 24);
      *((void *)&__src[20] + 1) = 0;
      memset(&__src[8], 0, 184);
      memset(__src, 0, 120);
      *((void *)&__src[7] + 1) = v7;
      *((void *)&__src[19] + 1) = @"quad_vertex";
      *(void *)&__src[20] = @"quad_display_depth2D";
      uint64_t RenderGraph = C3DEngineContextGetRenderGraph((uint64_t)v2->_engineContext);
      SCNMTLRenderPipelineApplyRenderPassDescriptor((uint64_t)&__src[8], *(void **)(RenderGraph + 152));

      resourceManager = v2->_resourceManager;
      memcpy(__dst, __src, sizeof(__dst));
      v2->_debug.displayDepth2DPipeline = (SCNMTLRenderPipeline *)[(SCNMTLResourceManager *)resourceManager newRenderPipelineStateWithDesc:__dst];
      *(void *)&__src[20] = @"quad_display_depth_cube";

      uint64_t v10 = v2->_resourceManager;
      memcpy(v32, __src, sizeof(v32));
      v2->_debug.displayDepthCubePipeline = (SCNMTLRenderPipeline *)[(SCNMTLResourceManager *)v10 newRenderPipelineStateWithDesc:v32];
    }
    renderEncoder = v2->_renderEncoder;
    if (!BYTE1(renderEncoder->var14[1].var0) && renderEncoder->var2)
    {
      renderEncoder->var2 = 0;
      renderEncoder->var6 = 1;
    }
    [(id)renderEncoder->var24[1] setDepthStencilState:-[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled]((uint64_t)v2->_resourceManager)];
    float v12 = (float)(unint64_t)[v4 height];
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    float v15 = (float)(v12 / (float)(unint64_t)[v4 width]) * 0.125;
    float v16 = v15 + 0.01;
    float v31 = v15;
    while (1)
    {
      unint64_t v17 = *(void **)&v2->_anon_3848[8 * v13 + 472];
      if (v17) {
        break;
      }
LABEL_20:
      if (++v13 == 8) {
        return;
      }
    }
    if ([*(id *)&v2->_anon_3848[8 * v13 + 472] textureType] == 5)
    {
      float v18 = v2->_renderEncoder;
      displayDepthCubePipeline = v2->_debug.displayDepthCubePipeline;
    }
    else
    {
      if ([v17 textureType] != 2)
      {
        if ([v17 textureType] == 3)
        {
          uint64_t v23 = v2->_renderEncoder;
          uint64_t v24 = [(SCNMTLRenderPipeline *)v2->_debug.displayDepth2DPipeline state];
          if (v23->var23 != (SCNMTLBufferPool *)v24)
          {
            v23->var23 = (SCNMTLBufferPool *)v24;
            [(id)v23->var24[1] setRenderPipelineState:v24];
          }
          if ([v17 arrayLength])
          {
            unint64_t v26 = 0;
            *(float *)&long long v25 = (float)((float)v14 * -0.135) + 0.865;
            long long v30 = v25;
            do
            {
              uint64_t v27 = objc_msgSend(v17, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v17, "pixelFormat", v30), 2, 0, objc_msgSend(v17, "mipmapLevelCount"), v26, 1);
              SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v27, 0);
              *(float *)&long long v28 = (float)((float)v26 * v16) + 0.01;
              DWORD1(v28) = v30;
              *((void *)&v28 + 1) = LODWORD(v31) | 0x3E00000000000000;
              __src[0] = v28;
              SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
              uint64_t v29 = v2->_renderEncoder;
              SCNMTLRenderCommandEncoder::_bindPendingTextures(v29);
              SCNMTLRenderCommandEncoder::applyChangedStates(v29);
              [(id)v29->var24[1] drawPrimitives:4 vertexStart:0 vertexCount:4];

              ++v26;
            }
            while (v26 < [v17 arrayLength]);
          }
        }
        goto LABEL_19;
      }
      float v18 = v2->_renderEncoder;
      displayDepthCubePipeline = v2->_debug.displayDepth2DPipeline;
    }
    uint64_t v20 = [(SCNMTLRenderPipeline *)displayDepthCubePipeline state];
    if (v18->var23 != (SCNMTLBufferPool *)v20)
    {
      v18->var23 = (SCNMTLBufferPool *)v20;
      [(id)v18->var24[1] setRenderPipelineState:v20];
    }
    SCNMTLRenderCommandEncoder::setFragmentTexture((uint64_t)v2->_renderEncoder, v17, 0);
    LODWORD(v21) = 1008981770;
    *((float *)&v21 + 1) = (float)((float)v14 * -0.135) + 0.865;
    *((void *)&v21 + 1) = __PAIR64__(0.125, LODWORD(v31));
    __src[0] = v21;
    SCNMTLRenderCommandEncoder::setVertexBytes(v2->_renderEncoder, __src, 0x10uLL, 0);
    float v22 = v2->_renderEncoder;
    SCNMTLRenderCommandEncoder::_bindPendingTextures(v22);
    SCNMTLRenderCommandEncoder::applyChangedStates(v22);
    [(id)v22->var24[1] drawPrimitives:4 vertexStart:0 vertexCount:4];
LABEL_19:
    ++v14;
    goto LABEL_20;
  }
}

- (uint64_t)_drawFullScreenTexture:(unsigned int)a3 over:
{
  if (result)
  {
    uint64_t v5 = (uint64_t *)result;
    uint64_t v6 = *(void **)(C3DEngineContextGetRenderGraph(*(void *)(result + 144)) + 152);
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "depthAttachment"), "texture"), "pixelFormat");
    uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "stencilAttachment"), "texture"), "pixelFormat");
    uint64_t v9 = 0;
    unint64_t v10 = 0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v8 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v8 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v8 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (v8 ^ v7)))) >> 47));
    do
    {
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", v9);
      uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "texture"), "pixelFormat");
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v11, "texture"), "sampleCount");
      unint64_t v14 = 0x9DDFEA08EB382D69
          * (v10 ^ ((0x9DDFEA08EB382D69 * (v12 ^ v10)) >> 47) ^ (0x9DDFEA08EB382D69 * (v12 ^ v10)));
      unint64_t v15 = 0x9DDFEA08EB382D69 * (v14 ^ (v14 >> 47));
      ++v9;
      unint64_t v10 = 0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v15 ^ ((0x9DDFEA08EB382D69 * (v15 ^ v13)) >> 47) ^ (0x9DDFEA08EB382D69 * (v15 ^ v13)))) ^ ((0x9DDFEA08EB382D69 * (v15 ^ ((0x9DDFEA08EB382D69 * (v15 ^ v13)) >> 47) ^ (0x9DDFEA08EB382D69 * (v15 ^ v13)))) >> 47));
    }
    while (v9 != 8);
    float v16 = v5 + 1913;
    uint64_t v17 = a3;
    float v18 = (unint64_t *)&v5[2 * a3 + 1913];
    if (*v18 != v10)
    {
      *float v18 = v10;
      uint64_t v19 = [(id)-[SCNMTLResourceManager libraryManager](v5[14]) frameworkLibrary];
      memset(&__src[16], 0, 232);
      memset(__src, 0, 120);
      __src[15] = v19;
      if (a3)
      {
        uint64_t v20 = @"scn_draw_fullscreen_fragment_sk";
        uint64_t v21 = C3DBlendStatesDefaultOver();
      }
      else
      {
        uint64_t v21 = 0;
        uint64_t v20 = @"scn_draw_fullscreen_gamma_fragment";
      }
      __src[27] = v21;
      __src[39] = @"scn_draw_fullscreen_triangle_vertex";
      __src[40] = v20;
      uint64_t RenderGraph = C3DEngineContextGetRenderGraph(v5[18]);
      SCNMTLRenderPipelineApplyRenderPassDescriptor((uint64_t)&__src[16], *(void **)(RenderGraph + 152));
      uint64_t v23 = &v16[2 * v17];

      uint64_t v24 = (void *)v5[14];
      memcpy(__dst, __src, sizeof(__dst));
      v23[1] = [v24 newRenderPipelineStateWithDesc:__dst];
    }
    uint64_t v25 = v5[31];
    if (!*(unsigned char *)(v25 + 73) && *(void *)(v25 + 16))
    {
      *(void *)(v25 + 16) = 0;
      *(unsigned char *)(v25 + 41) = 1;
    }
    [*(id *)(v25 + 3392) setDepthStencilState:-[SCNMTLResourceManager depthAndStencilStateWithReadWriteDepthDisabled](v5[14])];
    uint64_t v26 = v5[31];
    uint64_t v27 = [(id)v16[2 * v17 + 1] state];
    if (*(void *)(v26 + 3376) != v27)
    {
      *(void *)(v26 + 3376) = v27;
      [*(id *)(v26 + 3392) setRenderPipelineState:v27];
    }
    SCNMTLRenderCommandEncoder::setFragmentTexture(v5[31], a2, 0);
    return SCNMTLRenderCommandEncoder::drawFullScreenTriangle((SCNMTLRenderCommandEncoder *)v5[31]);
  }
  return result;
}

- (double)renderTime
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 2728);
  return result;
}

- (uint64_t)renderSKSceneWithRenderer:(uint64_t)result overlay:(void *)a2 atTime:(unsigned int)a3
{
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  objc_msgSend(a2, "updateAtTime:");
  uint64_t v6 = *(void **)(v5 + 216);
  if (C3DLinearRenderingIsEnabled())
  {
    uint64_t v7 = (void *)[(id)-[SCNMTLRenderContext commandQueue](v5) commandBuffer];
    uint64_t v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "resolveTexture");
    if (!v8)
    {
      double result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "colorAttachments"), "objectAtIndexedSubscript:", 0), "texture");
      uint64_t v8 = (void *)result;
      if (!result) {
        return result;
      }
    }
    uint64_t v9 = [v8 width];
    uint64_t v10 = [v8 height];
    uint64_t v11 = [v8 pixelFormat];
    uint64_t v12 = SCNMTLPixelFormatNonSRGBVariant(v11);
    if (v11 == 555) {
      uint64_t v13 = 552;
    }
    else {
      uint64_t v13 = v12;
    }
    unint64_t v14 = 0x263F12000;
    if (a3)
    {
      unint64_t v15 = (id *)(v5 + 15352);
      id v16 = *(id *)(v5 + 15352);
      if (!v16) {
        goto LABEL_24;
      }
      uint64_t v17 = [v16 width];
      id v16 = *v15;
      if (v17 != v9) {
        goto LABEL_24;
      }
      uint64_t v18 = [v16 height];
      id v16 = *v15;
      if (v18 != v10) {
        goto LABEL_24;
      }
    }
    else
    {
      unint64_t v15 = (id *)(v5 + 15344);
      id v16 = *(id *)(v5 + 15344);
      if (!v16) {
        goto LABEL_24;
      }
      uint64_t v22 = [v16 width];
      uint64_t v23 = [v8 width];
      id v16 = *v15;
      if (v22 != v23)
      {
        unint64_t v14 = 0x263F12000uLL;
        goto LABEL_24;
      }
      uint64_t v24 = [v16 height];
      uint64_t v25 = [v8 height];
      id v16 = *v15;
      BOOL v26 = v24 == v25;
      unint64_t v14 = 0x263F12000;
      if (!v26) {
        goto LABEL_24;
      }
    }
    if ([v16 pixelFormat] == v13) {
      goto LABEL_25;
    }
    id v16 = *v15;
LABEL_24:

    uint64_t v27 = (void *)[*(id *)(v14 + 2640) texture2DDescriptorWithPixelFormat:v13 width:v9 height:v10 mipmapped:0];
    [v27 setStorageMode:2];
    [v27 setUsage:21];
    *unint64_t v15 = (id)[*(id *)(v5 + 120) newTextureWithDescriptor:v27];
LABEL_25:
    id v28 = *v15;
    uint64_t v29 = [*v15 width];
    if (v29 == [*(id *)(v5 + 15360) width]
      && (uint64_t v30 = [v28 height], v30 == objc_msgSend(*(id *)(v5 + 15360), "height")))
    {
      uint64_t v31 = *(void *)(v5 + 15360);
    }
    else
    {
      uint64_t v32 = (void *)[*(id *)(v14 + 2640) texture2DDescriptorWithPixelFormat:260 width:v9 height:v10 mipmapped:0];
      [v32 setStorageMode:2];
      [v32 setUsage:4];

      uint64_t v31 = [*(id *)(v5 + 120) newTextureWithDescriptor:v32];
      *(void *)(v5 + 15360) = v31;
    }
    long long v33 = (void *)[MEMORY[0x263F129A0] renderPassDescriptor];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setTexture:", v28);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setLoadAction:", 2);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v33, "colorAttachments"), "objectAtIndexedSubscript:", 0), "setStoreAction:", 1);
    objc_msgSend((id)objc_msgSend(v33, "depthAttachment"), "setTexture:", v31);
    char CoordinatesSystemOptions = C3DEngineContextGetCoordinatesSystemOptions(*(void *)(v5 + 144));
    float v35 = (void *)[v33 depthAttachment];
    double v36 = 1.0;
    if ((CoordinatesSystemOptions & 8) != 0) {
      double v36 = 0.0;
    }
    [v35 setClearDepth:v36];
    objc_msgSend((id)objc_msgSend(v33, "depthAttachment"), "setLoadAction:", 2);
    objc_msgSend((id)objc_msgSend(v33, "depthAttachment"), "setStoreAction:", 0);
    objc_msgSend((id)objc_msgSend(v33, "stencilAttachment"), "setTexture:", v31);
    objc_msgSend((id)objc_msgSend(v33, "stencilAttachment"), "setLoadAction:", 2);
    objc_msgSend((id)objc_msgSend(v33, "stencilAttachment"), "setStoreAction:", 0);
    long long v37 = (void *)[v7 renderCommandEncoderWithDescriptor:v33];
    [a2 renderWithEncoder:v37 pass:v33 commandQueue:-[SCNMTLRenderContext commandQueue](v5)];
    [v37 endEncoding];
    [v7 commit];
    return -[SCNMTLRenderContext _drawFullScreenTexture:over:](v5, v28, a3);
  }
  [*(id *)(*(void *)(v5 + 248) + 3392) pushDebugGroup:@"SpriteKit - NonLinear Encoding"];
  [a2 renderWithEncoder:*(void *)(*(void *)(v5 + 248) + 3392) pass:v6 commandQueue:-[SCNMTLRenderContext commandQueue](v5)];
  uint64_t v19 = *(void *)(v5 + 248);
  uint64_t v20 = *(void *)(v19 + 3400);
  long long v38 = *(_OWORD *)(v19 + 3384);
  bzero((void *)v19, 0xD70uLL);
  *(_DWORD *)(v19 + 64) = 1;
  *(unsigned char *)(v19 + 72) = 1;
  *(_OWORD *)(v19 + 3384) = v38;
  *(void *)(v19 + 3400) = v20;
  *(_WORD *)(v19 + 40) = 257;
  *(unsigned char *)(v19 + 42) = 1;
  *(_OWORD *)(v19 + 8) = 0u;
  *(_OWORD *)(v19 + 24) = 0u;
  uint64_t v21 = *(void **)(*(void *)(v5 + 248) + 3392);

  return [v21 popDebugGroup];
}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  renderEncoder = self->_renderEncoder;
  $E8FEF9D34A3DFDCB69CDC2374B44012F currentStreamBufferIndices = self->_currentStreamBufferIndices;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  SCNMTLBufferPool::allocateAndCopy((SCNMTLBufferPool *)renderEncoder->var25[0], a3, a4, &v8);
  uint64_t v6 = v9;
  uint64_t v7 = v10;
  if (currentStreamBufferIndices.vertexIndex != -1) {
    SCNMTLRenderCommandEncoder::setVertexBuffer((uint64_t)renderEncoder, v9, v10, currentStreamBufferIndices.vertexIndex);
  }
  if ((~*(_WORD *)&currentStreamBufferIndices & 0xFF00) != 0) {
    SCNMTLRenderCommandEncoder::setFragmentBuffer((uint64_t)renderEncoder, v6, v7, (uint64_t)*(__int16 *)&currentStreamBufferIndices >> 8);
  }
}

- (uint64_t)cubeArrayTypeIfSupported
{
  if (result)
  {
    if (*(unsigned char *)(result + 137)) {
      return 6;
    }
    else {
      return 3;
    }
  }
  return result;
}

- (void)addCommandBufferScheduledHandler:(uint64_t)a1
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));
    uint64_t v5 = [a2 copy];
    uint64_t v6 = (void *)v5;
    if (*(void *)(a1 + 15496))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v8 = *(void **)(a1 + 15496);
      if (isKindOfClass)
      {
        [*(id *)(a1 + 15496) addObject:v6];
      }
      else
      {
        v9[0] = *(void *)(a1 + 15496);
        v9[1] = v6;
        *(void *)(a1 + 15496) = [objc_alloc(MEMORY[0x263EFF980]) initWithObjects:v9 count:2];
      }
    }
    else
    {
      *(void *)(a1 + 15496) = v5;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)addCommandBufferCompletedHandler:(uint64_t)a1
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));
    uint64_t v5 = [a2 copy];
    uint64_t v6 = (void *)v5;
    if (*(void *)(a1 + 15504))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v8 = *(void **)(a1 + 15504);
      if (isKindOfClass)
      {
        [*(id *)(a1 + 15504) addObject:v6];
      }
      else
      {
        v9[0] = *(void *)(a1 + 15504);
        v9[1] = v6;
        *(void *)(a1 + 15504) = [objc_alloc(MEMORY[0x263EFF980]) initWithObjects:v9 count:2];
      }
    }
    else
    {
      *(void *)(a1 + 15504) = v5;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)addDrawablePresentedHandler:(uint64_t)a1
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));
    uint64_t v5 = [a2 copy];
    uint64_t v6 = (void *)v5;
    if (*(void *)(a1 + 15512))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v8 = *(void **)(a1 + 15512);
      if (isKindOfClass)
      {
        [*(id *)(a1 + 15512) addObject:v6];
      }
      else
      {
        v9[0] = *(void *)(a1 + 15512);
        v9[1] = v6;
        *(void *)(a1 + 15512) = [objc_alloc(MEMORY[0x263EFF980]) initWithObjects:v9 count:2];
      }
    }
    else
    {
      *(void *)(a1 + 15512) = v5;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)discardPendingCommandBufferScheduledHandlers
{
  if (a1)
  {
    char v2 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));

    *(void *)(a1 + 15496) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (void)discardPendingCommandBufferCompletedHandlers
{
  if (a1)
  {
    char v2 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));

    *(void *)(a1 + 15504) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (void)discardPendingDrawablePresentedHandlers
{
  if (a1)
  {
    char v2 = (os_unfair_lock_s *)(a1 + 15488);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 15488));

    *(void *)(a1 + 15512) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (uint64_t)_allowGPUBackgroundExecution
{
  if (result && !result[1942] && !result[1945])
  {
    uint64_t v1 = (void *)result[20];
    if (v1)
    {
      char v2 = (void *)result[20];
    }
    else
    {
      char v2 = (void *)-[SCNMTLResourceManager commandQueue](result[14]);
      uint64_t v1 = v2;
    }
    double result = (uint64_t *)[v2 getBackgroundGPUPriority];
    if (result == (uint64_t *)3)
    {
      return (uint64_t *)[v1 setBackgroundGPUPriority:2];
    }
  }
  return result;
}

- (void)_SCNSceneRendererMainPassCustomPostProcessSupportDrawSceneBackgroundUsingEncoder:(uint64_t)a3 commandBuffer:(uint64_t)a4 renderPassDescriptor:
{
  if (a1)
  {
    uint64_t Scene = C3DEngineContextGetScene(a1[18]);
    Backgrounduint64_t EffectSlot = C3DSceneGetBackgroundEffectSlot(Scene, 0);
    if (BackgroundEffectSlot)
    {
      uint64_t v10 = BackgroundEffectSlot;
      uint64_t v11 = a1[31];
      if (*(void *)(v11 + 3392) == a2)
      {
        uint64_t v17 = a1[18];
        C3DEngineContextRenderBackgroundMap(v17, v10, 0);
      }
      else
      {
        uint64_t v12 = a1[27];
        a1[31] = (uint64_t)v19;
        a1[27] = a4;
        SCNMTLRenderCommandEncoder::useCommandEncoder(v19, a3, a2, a1[261]);
        uint64_t v13 = a1[31];
        uint64_t v14 = *(void *)(v13 + 3400);
        long long v18 = *(_OWORD *)(v13 + 3384);
        bzero((void *)v13, 0xD70uLL);
        *(_DWORD *)(v13 + 64) = 1;
        *(unsigned char *)(v13 + 72) = 1;
        *(_OWORD *)(v13 + 3384) = v18;
        *(void *)(v13 + 3400) = v14;
        *(_WORD *)(v13 + 40) = 257;
        *(unsigned char *)(v13 + 42) = 1;
        *(_OWORD *)(v13 + 8) = 0u;
        *(_OWORD *)(v13 + 24) = 0u;
        uint64_t v15 = a1[31];
        uint64_t v16 = *(unsigned char *)v15 == 0;
        if (*(void *)(v15 + 8) != v16)
        {
          *(void *)(v15 + 8) = v16;
          *(unsigned char *)(v15 + 40) = 1;
        }
        C3DEngineContextRenderBackgroundMap(a1[18], v10, 0);
        a1[31] = v11;
        a1[27] = v12;
      }
    }
  }
}

- (uint64_t)setDebugOptions:(uint64_t)result
{
  if (result) {
    *(void *)(result + 15544) = a2;
  }
  return result;
}

- (uint64_t)setContentScaleFactor:(uint64_t)result
{
  if (result) {
    *(double *)(result + 15552) = a2;
  }
  return result;
}

- (uint64_t)renderEncoder
{
  if (result) {
    return *(void *)(result + 248);
  }
  return result;
}

- (id)resourceManagerMonitor
{
  if (result) {
    return (id *)objc_loadWeak(result + 1934);
  }
  return result;
}

- (id)setResourceManagerMonitor:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 1934, a2);
  }
  return result;
}

- (id)setCommandBufferStatusMonitor:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 1935, a2);
  }
  return result;
}

- (uint64_t)generatedTexturePath
{
  if (result) {
    return *(void *)(result + 15568);
  }
  return result;
}

- (void)initWithDevice:engineContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SCNMTLRenderContext initWithDevice : device should not be nil", v2, v3, v4, v5, v6);
}

- (void)initWithDevice:engineContext:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SCNMTLRenderContext initWithDevice : cannot create a command queue. Bailing out.", v2, v3, v4, v5, v6);
}

- (void)setPreferredFramesPerSecond:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: setPreferredFramesPerSecond - no screen", v2, v3, v4, v5, v6);
}

void __34__SCNMTLRenderContext_beginFrame___block_invoke_cold_1(void *a1)
{
  [a1 status];
  [a1 error];
  [a1 logs];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0(&dword_20B249000, v2, v3, "Error: Main command buffer execution failed with status %d, error: %@\n%@", v4, v5, v6, v7, v8);
}

void __59__SCNMTLRenderContext__createResourceCommandBufferIfNeeded__block_invoke_cold_1(void *a1)
{
  [a1 status];
  [a1 error];
  [a1 logs];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_0(&dword_20B249000, v2, v3, "Error: Resource command buffer execution failed with status %d, error: %@\n%@", v4, v5, v6, v7, v8);
}

- (void)_drawPatchForMeshElement:(uint64_t)a3 instanceCount:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_drawPatchForMeshElement:(uint64_t)a3 instanceCount:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)renderBackground:(uint64_t)a3 engineContext:(uint64_t)a4 passInstance:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)renderVideoBackground:engineContext:slot:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Cannot render video background with an unspecified source type.", v2, v3, v4, v5, v6);
}

- (void)authoring_renderMesh:meshElement:withProgram:uniforms:uniformsLength:rasterizerStates:blendStates:texture:depthBias:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Can't render mesh without a valid pass descriptor", v2, v3, v4, v5, v6);
}

- (void)authoring_renderMesh:(uint64_t)a3 meshElement:(uint64_t)a4 withProgram:(uint64_t)a5 uniforms:(uint64_t)a6 uniformsLength:(uint64_t)a7 rasterizerStates:(uint64_t)a8 blendStates:texture:depthBias:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authoring_drawPrimitives:vertexCount:instanceCount:vertexBuffers:offsets:range:vertexDescriptor:withProgram:uniforms:uniformsLength:rasterizerStates:blendStates:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Can't draw primitives without a valid pass descriptor", v2, v3, v4, v5, v6);
}

- (void)processRendererElements:(uint8_t *)a1 count:(void *)a2 engineIterationContext:(NSObject *)a3 .cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "!programHashCode || C3DProgramHashCodeUseDynamicBatching(programHashCode)";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. shader does not support batching!", a1);
}

- (void)startProcessingRendererElementsWithEngineIterationContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startProcessingRendererElementsWithEngineIterationContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_executeDrawCommand:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _executeProgram - no pipeline state", v2, v3, v4, v5, v6);
}

- (void)_executeDrawCommand:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: binding is broken : neither block or semantic", buf, 2u);
}

- (void)_executeDrawCommand:(NSObject *)a3 .cold.3(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "resourceBinding.bindBlock";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

- (void)_executeDrawCommand:(uint64_t *)a3 .cold.4(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7 = [a2 name];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_20B249000, a4, OS_LOG_TYPE_ERROR, "Error: pass has no storage for input %@", a1, 0xCu);
}

- (void)_executeDrawCommand:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Internal consistency error", v2, v3, v4, v5, v6);
}

- (void)_executeDrawCommand:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_executeDrawCommand:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_executeDrawCommand:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_executeDrawCommand:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_executeDrawCommand:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: can not render without programs, using default", v2, v3, v4, v5, v6);
}

- (void)drawRenderElement:(uint64_t)a3 withPass:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_4_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_10_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_228_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_265_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Not supported", v2, v3, v4, v5, v6);
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_9_334_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_5_355_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__SCNMTLRenderContext_registerBindings__block_invoke_6_393_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)mapVolatileMesh:(uint64_t)a3 verticesCount:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unmapVolatileMesh:(uint64_t)a3 modifiedVerticesCount:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_recycleMTLBufferToPool:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createVolatileMeshElementOfType:(uint64_t)a3 primitiveCount:(uint64_t)a4 bytesPerIndex:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end