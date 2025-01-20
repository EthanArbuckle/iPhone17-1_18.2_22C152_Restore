@interface DYMTLCommonDebugFunctionPlayer
+ (id)harvestableTexture:(id)a3;
+ (id)thumbnailTexture:(unint64_t)a3;
- (AttachmentInfo)_attachmentInfoForCommandEncoderID:(SEL)a3;
- (BOOL)_isFunctionCommandEncoderCreation;
- (BOOL)_isReceiverTypeCommandEncoderRelated;
- (BOOL)isBlitSamplingSupported;
- (BOOL)isCounterAvailable:(id)a3;
- (BOOL)setupProfilingForListAtIndex:(unint64_t)a3;
- (BOOL)shouldExecuteGraphicsFunction;
- (BOOL)shouldIgnoreCaptureFile;
- (BOOL)targetFunctionNeedsSeparatedPostVertexDump;
- (DYMTLCommonDebugFunctionPlayer)initWithCaptureStore:(id)a3;
- (DYMTLPostVertexDump)postVertexDump;
- (DYMTLShaderDebuggerTraceGenerator)shaderDebuggerTraceGenerator;
- (NSMutableArray)counterListsPerPass;
- (NSMutableArray)frameCounters;
- (NSString)statPixels;
- (NSString)statVertices;
- (id).cxx_construct;
- (id)_generateDummyPipeline:(id)a3;
- (id)_generateThumbnailAndResourceInfoForRequestedTextures:(id)a3 resolution:(id *)a4 commandBuffer:(id)a5;
- (id)_texture2DFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7;
- (id)collectPixelDrawStats:(id)a3 originalEncoderId:(unint64_t)a4 originalEncoder:(id)a5 originalPipeline:(id)a6 atX:(unint64_t)a7 y:(unint64_t)a8 draw:(id)a9;
- (id)collectPixelDrawStatsTotal:(id)a3 originalPipeline:(id)a4 atX:(unint64_t)a5 y:(unint64_t)a6 draw:(id)a7;
- (id)counterInfo:(id)a3;
- (id)dependencyGraphThumbnailCache;
- (id)derivedCounterData;
- (id)generatePerPrimitiveHistory:(unint64_t)a3 commandQueue:(id)a4 currentEncoderId:(unint64_t)a5 originalEncoder:(id)a6 originalPipeline:(id)a7 atX:(unint64_t)a8 y:(unint64_t)a9;
- (id)generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 total:(unint64_t)a6 commandQueue:(id)a7 currentEncoderId:(unint64_t)a8 originalEncoder:(id)a9 originalPipeline:(id)a10 atX:(unint64_t)a11 y:(unint64_t)a12;
- (id)pixelHistoryCache;
- (id)replayerLayerForDrawableId:(unint64_t)a3;
- (id)setupCounterConfigurationAndGetFrameProfilerCounters;
- (id)thumbnailCache;
- (int64_t)wireframeRenderMode;
- (unint64_t)_executeIndirectCommandBufferUpToSubIndex:(unint64_t)a3 outBuffer:(id *)a4 outDataPointer:(const char *)a5;
- (unint64_t)getStatLocations;
- (unsigned)currentEncoderIndex;
- (void)_addRenderPassDescriptorToEncoderMapFromArgumentPointer:(void *)a3 forEncoder:(unint64_t)a4;
- (void)_addRenderPassDescriptorToEncoderMapFromRenderPassDescriptor:(DYMTLRenderPassDescriptor *)a3 forEncoder:(unint64_t)a4;
- (void)_createBatchIdFilterMapping:(BOOL)a3 withCommandEncoder:(id)a4;
- (void)_endEncodingForAllRemainingEncoders:(void *)a3;
- (void)_executeGraphicsFunction;
- (void)_extractTileMemoryWithRenderPassDescriptor:(DYMTLRenderPassDescriptor *)a3 renderEncoderID:(unint64_t)a4 isDrawCall:(BOOL)a5;
- (void)_forceAttachmentLoadActionToLoad:(id)a3;
- (void)_forceAttachmentStoreActionToStore:(id)a3;
- (void)_modifyDescriptorForLayering:(id)a3 withBuffer:(id)a4;
- (void)_modifyDescriptorForStore:(id)a3;
- (void)_setupEncodersForBatchIdFiltering;
- (void)_splitBlitEncoder;
- (void)_splitCommandEncoders;
- (void)_splitComputeEncoder;
- (void)_splitRenderEncoders;
- (void)_superExecutePlatformFunction;
- (void)_swizzleAttachmentTextureForLoad:(id)a3 withBuffer:(id)a4;
- (void)_trackObjects;
- (void)_updateMemorylessTextures:(id)a3;
- (void)_updateRemainingCommandsForEncoder;
- (void)allowOverlap:(BOOL)a3 withPState:(unsigned int)a4;
- (void)commitEncodersAndCommandBuffers;
- (void)enableConsistentState:(BOOL)a3;
- (void)enableStatsSampling:(BOOL)a3;
- (void)encodeStoreActionForParallelRenderCommandEncoder:(id)a3 withDescriptor:(id)a4;
- (void)encodeStoreActionForRenderCommandEncoder:(id)a3 withDescriptor:(id)a4;
- (void)encoderMap;
- (void)executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4 subCommandIndex:(unsigned int)a5;
- (void)executeGraphicsFunction;
- (void)executePlatformFunction;
- (void)extractCommandBufferTranslationData;
- (void)extractComputeIndirectArgumentBuffers:(void *)a3;
- (void)extractIndirectArgumentBuffers;
- (void)extractRenderIndirectArgumentBuffers:(void *)a3;
- (void)prepareForCaptureExecution;
- (void)presentDrawable;
- (void)resetFunctionPlayerData;
- (void)resetPixelHistoryCache;
- (void)sampleEncoderCounters;
- (void)sampleSplitEncoderCounters;
- (void)setConsistentStateTo:(unsigned int)a3;
- (void)setCounterListsPerPass:(id)a3;
- (void)setCurrentEncoderIndex:(unsigned int)a3;
- (void)setDevice:(id)a3;
- (void)setFrameCounters:(id)a3;
- (void)setShouldIgnoreCaptureFile:(BOOL)a3;
- (void)setStatLocations:(unint64_t)a3;
- (void)setStatPixels:(id)a3;
- (void)setStatVertices:(id)a3;
- (void)setWireframeRenderMode:(int64_t)a3;
- (void)setupAllStatLocationsWithBlitOption:(BOOL)a3;
- (void)setupBatchFilterForEncoders:(id)a3;
- (void)setupFrameTimeProfiling;
- (void)setupProfileInfo:(id)a3;
- (void)setupProfilingForCounterLists;
- (void)stopFrameProfiling;
- (void)updateReplayerLayer:(unint64_t)a3 withOriginalLayer:(unint64_t)a4;
- (void)waitForCommmandBuffersCompletion;
@end

@implementation DYMTLCommonDebugFunctionPlayer

- (void)setDevice:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  [(DYMTLFunctionPlayer *)&v19 setDevice:v4];
  v5 = [(DYMTLFunctionPlayer *)self device];
  self->_supportsTessellation = [v5 supportsFeatureSet:7];

  v6 = [[DYMTLDebugWireframeRenderer alloc] initWithDebugFunctionPlayer:self];
  wireframeRenderer = self->_wireframeRenderer;
  self->_wireframeRenderer = v6;

  v8 = [[DYMTLPostVertexDump alloc] initWithDebugFunctionPlayer:self];
  postVertexDump = self->_postVertexDump;
  self->_postVertexDump = v8;

  v10 = [[DYMTLShaderDebuggerTraceGenerator alloc] initWithDebugFunctionPlayer:self];
  shaderDebuggerTraceGenerator = self->_shaderDebuggerTraceGenerator;
  self->_shaderDebuggerTraceGenerator = v10;

  v12 = [DYMTLTextureRenderer alloc];
  v13 = [(DYMTLFunctionPlayer *)self device];
  v14 = [(DYMTLTextureRenderer *)v12 initWithDevice:v13];
  textureRenderer = self->_textureRenderer;
  self->_textureRenderer = v14;

  v16 = [[DYMTLPixelHistoryDrawStatsSupport alloc] initWithDebugFunctionPlayer:self];
  pixelHistoryDrawStatsRenderer = self->_pixelHistoryDrawStatsRenderer;
  self->_pixelHistoryDrawStatsRenderer = v16;

  v18 = [v4 name];
  self->_isAGXDevice = [v18 compare:@"Unknown Unknown"] == 0;
}

- (DYMTLCommonDebugFunctionPlayer)initWithCaptureStore:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  v5 = [(DYMTLFunctionPlayer *)&v12 initWithCaptureStore:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    thumbnailDictionary = v5->_thumbnailDictionary;
    v5->_thumbnailDictionary = (NSMutableDictionary *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dependencyGraphThumbnails = v5->_dependencyGraphThumbnails;
    v5->_dependencyGraphThumbnails = v8;

    [(DYMTLCommonDebugFunctionPlayer *)v5 resetPixelHistoryCache];
    if (-[DYMTLCommonDebugFunctionPlayer initWithCaptureStore:]::onceToken != -1) {
      dispatch_once(&-[DYMTLCommonDebugFunctionPlayer initWithCaptureStore:]::onceToken, &__block_literal_global_1);
    }
    v10 = v5;
  }

  return v5;
}

void __55__DYMTLCommonDebugFunctionPlayer_initWithCaptureStore___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sMemorylessTexturesAndReplacements;
  sMemorylessTexturesAndReplacements = v0;

  uint64_t v2 = objc_opt_new();
  v3 = (void *)sThumbnailTextures;
  sThumbnailTextures = v2;
}

- (void)encoderMap
{
  return &self->_encoderMap;
}

- (id)thumbnailCache
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = [(DYMTLFunctionPlayer *)self device];
  unint64_t v4 = [(DYMTLFunctionPlayer *)self keyForOriginalObject:v3];

  v9[0] = *MEMORY[0x263F3FEB8];
  v5 = [NSNumber numberWithUnsignedLongLong:v4];
  v10[0] = v5;
  v9[1] = *MEMORY[0x263F3FEC8];
  uint64_t v6 = [NSDictionary dictionaryWithDictionary:self->_thumbnailDictionary];
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)dependencyGraphThumbnailCache
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = [(DYMTLFunctionPlayer *)self device];
  unint64_t v4 = [(DYMTLFunctionPlayer *)self keyForOriginalObject:v3];

  v9[0] = *MEMORY[0x263F3FEB8];
  v5 = [NSNumber numberWithUnsignedLongLong:v4];
  v10[0] = v5;
  v9[1] = *MEMORY[0x263F3FEC8];
  uint64_t v6 = [NSDictionary dictionaryWithDictionary:self->_dependencyGraphThumbnails];
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (void)resetPixelHistoryCache
{
  v3 = (NSMutableDictionary *)objc_opt_new();
  pixelHistory = self->_pixelHistory;
  self->_pixelHistory = v3;

  v5 = objc_opt_new();
  [(NSMutableDictionary *)self->_pixelHistory setObject:v5 forKeyedSubscript:*MEMORY[0x263F3FDD8]];

  uint64_t v6 = objc_opt_new();
  [(NSMutableDictionary *)self->_pixelHistory setObject:v6 forKeyedSubscript:*MEMORY[0x263F3FE38]];

  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_pixelHistoryInverseObjectMap.__table_.__bucket_list_.__ptr_.__value_);
  v7 = (NSMutableDictionary *)objc_opt_new();
  pixelHistoryEncoderStateTrackings = self->_pixelHistoryEncoderStateTrackings;
  self->_pixelHistoryEncoderStateTrackings = v7;
}

- (id)pixelHistoryCache
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = [(DYMTLFunctionPlayer *)self device];
  unint64_t v4 = [(DYMTLFunctionPlayer *)self keyForOriginalObject:v3 inverseObjectMap:&self->_pixelHistoryInverseObjectMap];

  v9[0] = *MEMORY[0x263F3FEB8];
  v5 = [NSNumber numberWithUnsignedLongLong:v4];
  v10[0] = v5;
  v9[1] = *MEMORY[0x263F3FEC8];
  uint64_t v6 = [NSDictionary dictionaryWithDictionary:self->_pixelHistory];
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)_generateThumbnailAndResourceInfoForRequestedTextures:(id)a3 resolution:(id *)a4 commandBuffer:(id)a5
{
  id v7 = a3;
  id v55 = a5;
  id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = (void *)MEMORY[0x263F53640];
  v9 = [(DYMTLFunctionPlayer *)self device];
  v54 = [v8 forDevice:v9];

  unint64_t v10 = 0;
  uint64_t v62 = *MEMORY[0x263F3FAF0];
  uint64_t v59 = *MEMORY[0x263F3FB00];
  uint64_t v58 = *MEMORY[0x263F3FAF8];
  uint64_t v57 = *MEMORY[0x263F3FAE8];
  uint64_t v56 = *MEMORY[0x263F3FAE0];
  uint64_t v49 = *MEMORY[0x263F3FB10];
  uint64_t v48 = *MEMORY[0x263F3FC30];
  id v61 = v7;
  v52 = self;
  while (v10 < objc_msgSend(v7, "count", v48))
  {
    v11 = [v7 objectAtIndexedSubscript:v10];
    objc_super v12 = [v11 objectForKeyedSubscript:v62];
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 unsignedLongLongValue];
      v15 = [v11 objectForKeyedSubscript:v59];
      uint64_t v16 = [v15 unsignedLongLongValue];

      v17 = [v11 objectForKeyedSubscript:v58];
      uint64_t v18 = [v17 unsignedLongLongValue];

      objc_super v19 = [v11 objectForKeyedSubscript:v57];
      uint64_t v20 = [v19 unsignedLongLongValue];

      v64 = [v11 objectForKeyedSubscript:v56];
      v21 = [(DYMTLFunctionPlayer *)self objectForKey:v14];
      if (v21)
      {
        v22 = (void *)sMemorylessTexturesAndReplacements;
        v23 = [NSNumber numberWithUnsignedLong:v21];
        v24 = [v22 objectForKeyedSubscript:v23];

        v60 = v24;
        if (v24)
        {
          id v25 = v24;

          v21 = v25;
        }
        unint64_t v26 = [v21 textureType];
        if (v26 > 9)
        {
          v27 = v21;
        }
        else
        {
          if (((1 << v26) & 0x2EF) != 0) {
            [v54 textureFromTexture:v21 slice:v16 level:v18 depthPlane:v20 commandBuffer:v55];
          }
          else {
          v27 = [v54 resolveMultisampleTexture:v21 slice:v16 level:v18 depthPlane:v20 commandBuffer:v55];
          }

          if (v64
            && [v64 unsignedLongLongValue] == 9
            && [v27 pixelFormat] == 260)
          {
            uint64_t v28 = [v54 stencilTextureFromTexture:v27 commandBuffer:v55];

            v27 = (void *)v28;
          }
          if (v27)
          {
            if (objc_opt_respondsToSelector())
            {
              int v29 = [v27 isSparse];
              long long v65 = *(_OWORD *)&a4->var0;
              unint64_t var2 = a4->var2;
              if (v29) {
                sparseTextureFence = v52->_sparseTextureFence;
              }
              else {
                sparseTextureFence = 0;
              }
            }
            else
            {
              sparseTextureFence = 0;
              long long v65 = *(_OWORD *)&a4->var0;
              unint64_t var2 = a4->var2;
            }
            uint64_t v31 = [v54 generateThumbnailFromTexture:v27 commandBuffer:v55 resolution:&v65 withFence:sparseTextureFence];
            v32 = (void *)v31;
            if (v31)
            {
              v53 = (void *)v31;
              id v63 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              uint64_t v33 = [v27 pixelFormat];
              uint64_t v34 = 10;
              if (v33 != 1) {
                uint64_t v34 = v33;
              }
              if (v33 == 261) {
                uint64_t v35 = 253;
              }
              else {
                uint64_t v35 = v34;
              }
              v36 = [NSNumber numberWithUnsignedLongLong:v14];
              [v63 setObject:v36 forKeyedSubscript:v62];

              v37 = [NSNumber numberWithUnsignedLong:v53];
              [v63 setObject:v37 forKeyedSubscript:v49];

              v38 = [NSNumber numberWithUnsignedInteger:v35];
              [v63 setObject:v38 forKeyedSubscript:v48];

              if (v64)
              {
                [v63 setObject:v64 forKeyedSubscript:v56];
                v39 = [NSNumber numberWithUnsignedLongLong:v16];
                [v63 setObject:v39 forKeyedSubscript:v59];

                v40 = [NSNumber numberWithUnsignedLongLong:v18];
                [v63 setObject:v40 forKeyedSubscript:v58];

                v41 = [NSNumber numberWithUnsignedLongLong:v20];
                [v63 setObject:v41 forKeyedSubscript:v57];
              }
              [v50 addObject:v63];
              v42 = (void *)sThumbnailTextures;
              v43 = [NSNumber numberWithUnsignedLong:v53];
              [v42 objectForKey:v43];

              uint64_t v44 = sThumbnailTextures;
              v45 = [NSNumber numberWithUnsignedLong:v53];
              v46 = (void *)v44;
              v32 = v53;
              [v46 setObject:v53 forKey:v45];
            }
          }
        }

        self = v52;
      }
    }
    ++v10;
    id v7 = v61;
  }

  return v50;
}

- (void)executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4 subCommandIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  if ([(DYMTLCommonDebugFunctionPlayer *)self shouldIgnoreCaptureFile]
    && [(DYFunctionPlayer *)self mainExecutionMode])
  {
    *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8]) = (Class)&a3[a4];
    *(_DWORD *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F990]) += a4;
    *(_DWORD *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F988]) += a4;
  }
  else
  {
    v9 = &a3[a4 - 1];
    if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)v9->var0) & 1) != 0
      || (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)v9->var0) & 1) != 0
      || GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)v9->var0))
    {
      self->_targetCommandEncoderId = a3[a4 - 1].var4.var0;
    }
    v10.receiver = self;
    v10.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
    [(DYFunctionPlayer *)&v10 executeFunctions:a3 count:a4 subCommandIndex:v5];
  }
}

- (void)_splitBlitEncoder
{
  unint64_t v10 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8]) + 48, 0);
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v10);
  if (v3)
  {
    unint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v3 + 3);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(DYMTLFunctionPlayer *)self objectForKey:v10];
      if ([v6 conformsToProtocol:&unk_27010E0B8])
      {
        if (self->_nRemainingCommandsForCurrentEncoder)
        {
          id v7 = [(DYMTLFunctionPlayer *)self objectForKey:v5[2]];
          v8 = (void *)MEMORY[0x253362620]();
          [v6 endEncoding];
          v9 = [v7 blitCommandEncoder];
          [(DYMTLFunctionPlayer *)self setObject:v9 forKey:v10];
        }
      }
    }
  }
}

- (void)_splitComputeEncoder
{
  unint64_t v14 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8]) + 48, 0);
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v14);
  if (v3)
  {
    unint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v3 + 3);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(DYMTLFunctionPlayer *)self objectForKey:v14];
      if ([v6 conformsToProtocol:&unk_27010D688]
        && self->_nRemainingCommandsForCurrentEncoder)
      {
        id v7 = [(DYMTLFunctionPlayer *)self objectForKey:v5[2]];
        v8 = (void *)MEMORY[0x253362620]();
        [v6 endEncoding];
        v9 = DYMTLNewStatefulComputeCommandEncoder(v7, 0);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __54__DYMTLCommonDebugFunctionPlayer__splitComputeEncoder__block_invoke;
        v13[3] = &unk_265339250;
        v13[4] = self;
        [v6 applyToEncoder:v9 rawBytesBlock:v13];
        if (self->_bSetStageInRegion)
        {
          long long v10 = *(_OWORD *)&self->_stageInRegion.origin.z;
          v12[0] = *(_OWORD *)&self->_stageInRegion.origin.x;
          v12[1] = v10;
          v12[2] = *(_OWORD *)&self->_stageInRegion.size.height;
          [v9 setStageInRegion:v12];
        }
        else if (self->_stageInIndirectBufferId)
        {
          v11 = -[DYMTLFunctionPlayer objectForKey:](self, "objectForKey:");
          [v9 setStageInRegionWithIndirectBuffer:v11 indirectBufferOffset:self->_stageInIndirectBufferOffset];
        }
        [(DYMTLFunctionPlayer *)self setObject:v9 forKey:v14];
      }
    }
  }
}

uint64_t __54__DYMTLCommonDebugFunctionPlayer__splitComputeEncoder__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = +[DYMTLFunctionPlayer computeBytesKeyAtIndex:](DYMTLFunctionPlayer, "computeBytesKeyAtIndex:");
  return [v1 computeBytesForKey:v2];
}

- (void)_splitRenderEncoders
{
  unint64_t v29 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8]) + 48, 0);
  v3 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v29);
  if (v3)
  {
    unint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v3 + 3);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(DYMTLFunctionPlayer *)self objectForKey:v29];
      if ([v6 conformsToProtocol:&unk_27010CFE8]
        && self->_nRemainingCommandsForCurrentEncoder)
      {
        id v7 = [(DYMTLFunctionPlayer *)self objectForKey:v5[2]];
        v8 = [v6 descriptor];
        for (uint64_t i = 0; i != 8; ++i)
        {
          long long v10 = [v8 colorAttachments];
          v11 = [v10 objectAtIndexedSubscript:i];
          [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v11];

          objc_super v12 = [v8 colorAttachments];
          v13 = [v12 objectAtIndexedSubscript:i];
          [v13 setResolveTexture:0];

          unint64_t v14 = [v8 colorAttachments];
          v15 = [v14 objectAtIndexedSubscript:i];
          [v15 setLoadAction:1];

          uint64_t v16 = [v8 colorAttachments];
          v17 = [v16 objectAtIndexedSubscript:i];
          [v17 setStoreAction:1];
        }
        uint64_t v18 = [v8 depthAttachment];
        [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v18];

        objc_super v19 = [v8 depthAttachment];
        [v19 setResolveTexture:0];

        uint64_t v20 = [v8 depthAttachment];
        [v20 setLoadAction:1];

        v21 = [v8 depthAttachment];
        [v21 setStoreAction:1];

        v22 = [v8 stencilAttachment];
        [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v22];

        v23 = [v8 stencilAttachment];
        [v23 setResolveTexture:0];

        v24 = [v8 stencilAttachment];
        [v24 setLoadAction:1];

        id v25 = [v8 stencilAttachment];
        [v25 setStoreAction:1];

        unint64_t v26 = (void *)MEMORY[0x253362620]();
        [v6 endEncoding];
        v27 = DYMTLNewStatefulRenderCommandEncoder(v7, v8);
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __54__DYMTLCommonDebugFunctionPlayer__splitRenderEncoders__block_invoke;
        v28[3] = &unk_265338F78;
        v28[4] = self;
        [v6 applyAllStateToEncoder:v27 rawBytesBlock:v28];
        [(DYMTLFunctionPlayer *)self setObject:v27 forKey:v29];
      }
    }
  }
}

uint64_t __54__DYMTLCommonDebugFunctionPlayer__splitRenderEncoders__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2)
  {
    id v7 = *(void **)(a1 + 32);
    v8 = +[DYMTLFunctionPlayer tileBytesKeyAtIndex:a4];
    return [v7 tileBytesForKey:v8];
  }
  else if (a2 == 1)
  {
    v9 = *(void **)(a1 + 32);
    long long v10 = +[DYMTLFunctionPlayer fragmentBytesKeyAtIndex:a4];
    return [v9 fragmentBytesForKey:v10];
  }
  else if (a2)
  {
    return 0;
  }
  else
  {
    unint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
    return [v4 vertexBytesForKey:v5];
  }
}

- (void)_createBatchIdFilterMapping:(BOOL)a3 withCommandEncoder:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      LODWORD(v26) = 0;
      int v27 = 0;
      [v6 commandBatchIdRangeMin:&v26 max:&v27];
      p_currentEncoderBatchInfo = &self->_currentEncoderBatchInfo;
      end = (char *)p_currentEncoderBatchInfo->__end_;
      value = (char *)p_currentEncoderBatchInfo->__end_cap_.__value_;
      if (end >= value)
      {
        uint64_t v15 = (end - (char *)p_currentEncoderBatchInfo->__begin_) >> 3;
        unint64_t v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 61) {
          std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v17 = value - (char *)p_currentEncoderBatchInfo->__begin_;
        if (v17 >> 2 > v16) {
          unint64_t v16 = v17 >> 2;
        }
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v16;
        }
        objc_super v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&p_currentEncoderBatchInfo->__end_cap_, v18);
        uint64_t v20 = &v19[8 * v15];
        v22 = &v19[8 * v21];
        *(_DWORD *)uint64_t v20 = v26;
        *((_DWORD *)v20 + 1) = v27;
        long long v10 = v20 + 8;
        begin = (char *)p_currentEncoderBatchInfo->__begin_;
        v23 = (char *)p_currentEncoderBatchInfo->__end_;
        if (v23 != p_currentEncoderBatchInfo->__begin_)
        {
          do
          {
            uint64_t v25 = *((void *)v23 - 1);
            v23 -= 8;
            *((void *)v20 - 1) = v25;
            v20 -= 8;
          }
          while (v23 != begin);
          v23 = (char *)p_currentEncoderBatchInfo->__begin_;
        }
        p_currentEncoderBatchInfo->__begin_ = v20;
        p_currentEncoderBatchInfo->__end_ = v10;
        p_currentEncoderBatchInfo->__end_cap_.__value_ = v22;
        if (v23) {
          operator delete(v23);
        }
      }
      else
      {
        *(_DWORD *)end = v26;
        *((_DWORD *)end + 1) = v27;
        long long v10 = end + 8;
      }
      p_currentEncoderBatchInfo->__end_ = v10;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    unsigned int v11 = [v6 commandBatchIdOffset];
    objc_super v12 = (int32x2_t *)self->_currentEncoderBatchInfo.__begin_;
    v13 = (int32x2_t *)self->_currentEncoderBatchInfo.__end_;
    if (v12 != v13)
    {
      int32x2_t v14 = vdup_n_s32(v11);
      do
      {
        int32x2_t *v12 = vsub_s32(*v12, v14);
        ++v12;
      }
      while (v12 != v13);
    }
    unint64_t v26 = self->_currentBatchEncoderIndex - 1;
    std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>>>::__emplace_unique_key_args<unsigned long,unsigned long,std::vector<std::pair<unsigned int,unsigned int>>&>((uint64_t)&self->_encoderIndexToBatchInfo, (uint64_t *)&v26, &v26, (uint64_t **)&self->_currentEncoderBatchInfo);
    self->_currentEncoderBatchInfo.__end_ = self->_currentEncoderBatchInfo.__begin_;
  }
}

- (void)_splitCommandEncoders
{
  uint64_t v3 = (int)*MEMORY[0x263F3F9A8];
  if ((GPUTools::MTL::IsFuncEnumSampledBlitCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                                    + v3)) & 1) != 0
    || GPUTools::MTL::IsFuncEnumSampledBlitCallAGX((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa + v3)))
  {
    --self->_nRemainingCommandsForCurrentEncoder;
    [(DYMTLCommonDebugFunctionPlayer *)self _splitBlitEncoder];
  }
}

- (BOOL)shouldExecuteGraphicsFunction
{
  return 1;
}

- (void)_setupEncodersForBatchIdFiltering
{
  id v3 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
  uint64_t v4 = (int)*MEMORY[0x263F3F9A8];
  int v5 = **(_DWORD **)((char *)&self->super.super.super.super.isa + v4);
  if ((v5 + 16354) < 4 || v5 == -16014)
  {
    id v11 = v3;
    if ([v3 playbackMode] == 5)
    {
      unint64_t currentBatchEncoderIndex = self->_currentBatchEncoderIndex;
      BOOL v8 = currentBatchEncoderIndex >= [(NSArray *)self->_batchInfos count];
      id v3 = v11;
      if (v8) {
        goto LABEL_15;
      }
      v9 = [(NSArray *)self->_batchInfos objectAtIndexedSubscript:self->_currentBatchEncoderIndex];
      self->_currentEncoderBatchIndex = [v9 unsignedIntValue];

      if (self->_currentEncoderBatchIndex != -1)
      {
        long long v10 = [(DYMTLFunctionPlayer *)self objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v4) + 24, 0)];
        std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderIndexToBatchInfo.__table_.__bucket_list_.__ptr_.__value_, &self->_currentBatchEncoderIndex);
      }
    }
    else if ([v11 playbackMode] == 12)
    {
      id v3 = v11;
      if (self->_currentBatchEncoderIndex)
      {
LABEL_14:
        ++self->_currentBatchEncoderIndex;
        goto LABEL_15;
      }
      std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::pair<unsigned int,unsigned int>>>>>::clear((uint64_t)&self->_encoderIndexToBatchInfo);
    }
    id v3 = v11;
    goto LABEL_14;
  }
LABEL_15:
}

- (void)executeGraphicsFunction
{
  uint64_t v2 = self;
  uint64_t v569 = *MEMORY[0x263EF8340];
  v488 = (void *)MEMORY[0x253362620](self, a2);
  v490 = v2;
  id v489 = *(id *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
  switch([v489 playbackMode])
  {
    case 0u:
      if (v2->_wireframeRenderMode == 1 || v2->_targetFunctionNeedsSeparatedPostVertexDump)
      {
        if ([(DYFunctionPlayer *)v2 mainExecutionMode])
        {
          int v50 = *(_DWORD *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x263F3F988]);
          BOOL v9 = v50 == [v489 targetFunctionIndex] - 1;
          uint64_t v2 = v490;
          if (v9)
          {
            uint64_t v51 = (int)*MEMORY[0x263F3F9A8];
            uint64_t v2 = v490;
            if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                       + v51)) & 1) != 0
              || (uint64_t v2 = v490,
                  (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v51)) & 1) != 0)
              || (uint64_t v2 = v490,
                  GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v51))))
            {
              *(void *)&long long __p = 0;
              *(void *)&long long __p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v2->super.super.super.super.isa + v51) + 48, 0);
              v52 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v2->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
              if (v52)
              {
                unint64_t v562 = 0;
                v53 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
                if (!v53
                  || (unint64_t v562 = v53[3],
                      (v52 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v562)) != 0))
                {
                  uint64_t v55 = v52[5];
                  v54 = v52 + 5;
                  if (v490->_targetCommandEncoderId != v55) {
                    [(id)sMemorylessTexturesAndReplacements removeAllObjects];
                  }
                  uint64_t v56 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_commandEncoderDescriptorMap.__table_.__bucket_list_.__ptr_.__value_, v54);
                  if (v56)
                  {
                    uint64_t v57 = v56 + 3;
                    BOOL v58 = (unint64_t)(v56[185] + 1) > 1
                       || (unint64_t)(v56[186] - 1) < 0xFFFFFFFFFFFFFFFELL;
                  }
                  else
                  {
                    uint64_t v57 = 0;
                    BOOL v58 = 0;
                  }
                  unint64_t v557 = 0;
                  if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v51)))
                  {
                    id v518 = 0;
                    -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v490, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", [v489 targetSubCommandIndex], &v518, &v557);
                    id v325 = v518;
                    v326 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
                    v327 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
                    objc_msgSend(v327, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v326, v557, objc_msgSend(v489, "targetSubCommandIndex"), v325);

                    v328 = v490;
                  }
                  else
                  {
                    v328 = v490;
                    v517.receiver = v490;
                    v517.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    id v325 = 0;
                    [(DYMTLFunctionPlayer *)&v517 executeGraphicsFunction];
                  }
                  [(DYMTLCommonDebugFunctionPlayer *)v328 extractIndirectArgumentBuffers];
                  [(DYMTLCommonDebugFunctionPlayer *)v328 extractCommandBufferTranslationData];
                  if (v58) {
                    [(DYMTLCommonDebugFunctionPlayer *)v328 _extractTileMemoryWithRenderPassDescriptor:v57 renderEncoderID:(void)__p isDrawCall:GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v328->super.super.super.super.isa+ v51))];
                  }
                  v328->_targetFunctionNeedsSeparatedPostVertexDump = 0;
                }
              }
              goto LABEL_331;
            }
          }
        }
      }
      if ([(DYFunctionPlayer *)v2 mainExecutionMode])
      {
        int v77 = *(_DWORD *)((char *)&v490->super.super.super.super.isa + (int)*MEMORY[0x263F3F988]);
        if (v77 == [v489 targetFunctionIndex] - 1)
        {
          uint64_t v78 = (int)*MEMORY[0x263F3F9A8];
          if (GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v78)))
          {
            unint64_t v79 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v78) + 48, 0);
            *(void *)&long long __p = 0;
            id v516 = 0;
            -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v490, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", [v489 targetSubCommandIndex], &v516, &__p);
            id v80 = v516;
            v81 = [(DYMTLFunctionPlayer *)v490 objectForKey:v79];
            v82 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
            objc_msgSend(v82, "executeIndirectComputeCommand:withData:atIndex:forIndirectCommandBuffer:", v81, (void)__p, objc_msgSend(v489, "targetSubCommandIndex"), v80);

            [(DYMTLCommonDebugFunctionPlayer *)v490 extractIndirectArgumentBuffers];
            [(DYMTLCommonDebugFunctionPlayer *)v490 extractCommandBufferTranslationData];

            goto LABEL_331;
          }
        }
      }
      [(DYMTLCommonDebugFunctionPlayer *)v490 _executeGraphicsFunction];
      if ([(DYMTLCommonDebugFunctionPlayer *)v490 shouldExecuteGraphicsFunction]) {
        goto LABEL_120;
      }
      goto LABEL_331;
    case 1u:
    case 2u:
    case 3u:
    case 5u:
    case 0xBu:
    case 0xCu:
      if (([v489 playbackMode] == 5
         || [v489 playbackMode] == 11
         || [v489 playbackMode] == 12)
        && (GPUTools::MTL::IsFuncEnumSampleCall((GPUTools::MTL *)**(unsigned int **)((char *)&v2->super.super.super.super.isa
                                                                                   + (int)*MEMORY[0x263F3F9A8])) & 1) != 0)
      {
        goto LABEL_331;
      }
      if (!v2->_isAGXDevice
        || [v489 playbackMode] != 5
        && [v489 playbackMode] != 2
        && [v489 playbackMode] != 5
        && [v489 playbackMode] != 12)
      {
        goto LABEL_15;
      }
      uint64_t v3 = [(DYMTLFunctionPlayer *)v2 objectMap];
      uint64_t v4 = (int)*MEMORY[0x263F3F9A8];
      int v5 = *(int **)((char *)&v490->super.super.super.super.isa + v4);
      int v6 = *v5;
      if (*v5 == -16351)
      {
        if ([v489 playbackMode] == 2) {
          goto LABEL_335;
        }
        [(DYFunctionPlayer *)v490 processArguments];
        v93 = [(DYMTLFunctionPlayer *)v490 objectForKey:(*(void **)((char *)&v490->super.super.super.super.isa + v4))[2]];
        v94 = GPUTools::MTL::MakeMTLRenderPassDescriptor(**(void **)((char *)&v490->super.super.super._executePlatform + (int)*MEMORY[0x263F3F970]), (uint64_t)[(DYMTLFunctionPlayer *)v490 objectMap]);
        uint64_t v95 = DYMTLNewStatefulRenderCommandEncoder(v93, v94);
        unint64_t v562 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v4) + 24, 0);
        *(void *)&long long __p = &v562;
        v96 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(v3, &v562, (uint64_t)&std::piecewise_construct, (void **)&__p);
        v97 = (void *)v96[3];
        v96[3] = v95;
      }
      else if (v6 == -16286)
      {
        uint64_t v90 = [(DYMTLFunctionPlayer *)v490 objectForKey:*((void *)v5 + 2)];
        unint64_t v562 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v4) + 24, 0);
        *(void *)&long long __p = &v562;
        v91 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(v3, &v562, (uint64_t)&std::piecewise_construct, (void **)&__p);
        v92 = (void *)v91[3];
        v91[3] = v90;
      }
      else if (v6 != -16246 {
             || !std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)v5 + 2))
      }
      {
LABEL_15:
        uint64_t v7 = (int)*MEMORY[0x263F3F9A8];
        int v8 = **(_DWORD **)((char *)&v490->super.super.super.super.isa + v7);
        if ((v8 + 7158) < 3)
        {
          long long v10 = [(DYMTLCommonFunctionPlayer *)v490 layerManager];
          id v11 = [(DYMTLCommonDebugFunctionPlayer *)v490 replayerLayerForDrawableId:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v7) + 48, 0)];
          [v10 prepareLayerForPresent:v11];
        }
        else
        {
          BOOL v9 = (v8 + 16359) < 2 || v8 == -16133;
          if (!v9)
          {
            if (v490->_isAGXDevice)
            {
              if ([v489 playbackMode] == 12)
              {
                uint64_t v98 = *(uint64_t *)((char *)&v490->super.super.super.super.isa + v7);
                uint64_t v99 = *(void *)(v98 + 16);
                v100 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)(v98 + 16));
                if (v100) {
                  uint64_t v99 = v100[3];
                }
                v101 = [(DYMTLFunctionPlayer *)v490 objectForKey:v99];
                v102 = DYMTLGetOriginalObject(v101);

                v544.receiver = v490;
                v544.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                [(DYMTLFunctionPlayer *)&v544 executeGraphicsFunction];
                uint64_t v103 = GPUTools::MTL::IsFuncEnumGPUCommandCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                                  + v7));
                if ((v103 & 1) != 0
                  || GPUTools::MTL::IsFuncEnumEndEncoding((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v7)))
                {
                  [(DYMTLCommonDebugFunctionPlayer *)v490 _createBatchIdFilterMapping:v103 withCommandEncoder:v102];
                }
LABEL_468:

                goto LABEL_469;
              }
              if ([v489 playbackMode] == 5 && v490->_batchInfos)
              {
                v149 = [(DYMTLFunctionPlayer *)v490 objectForKey:(*(void **)((char *)&v490->super.super.super.super.isa + v7))[2]];
                v102 = v149;
                currentEncoderBatchuint64_t Index = v490->_currentEncoderBatchIndex;
                if (currentEncoderBatchIndex == -1
                  || (v490->_currentEncoderBatchuint64_t Index = currentEncoderBatchIndex - 1, currentEncoderBatchIndex))
                {
                  int v151 = 0;
                }
                else
                {
                  if (v149)
                  {
                    [v149 viewports];
                    int v151 = 1;
                    goto LABEL_212;
                  }
                  int v151 = 1;
                }
                long long __p = 0uLL;
                unint64_t v560 = 0;
LABEL_212:
                v152 = [v102 renderPipelineState];
                if (v151)
                {
                  v153 = [(DYMTLCommonDebugFunctionPlayer *)v490 _generateDummyPipeline:v152];
                  if (v153)
                  {
                    [v102 setRenderPipelineState:v153];
                    if (GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v7)))
                    {
                      int64x2_t v542 = vdupq_n_s64(1uLL);
                      uint64_t v543 = 1;
                      [v102 dispatchThreadsPerTile:&v542];
                    }
                    else
                    {
                      [v102 drawPrimitives:3 vertexStart:0 vertexCount:0 instanceCount:1];
                    }
                    [v102 setRenderPipelineState:v152];
                  }
                }
                else
                {
                  v153 = 0;
                }
                v541.receiver = v490;
                v541.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                [(DYMTLFunctionPlayer *)&v541 executeGraphicsFunction];
                if (v153) {
                  int v381 = v151;
                }
                else {
                  int v381 = 0;
                }
                if (v381 == 1)
                {
                  [v102 setRenderPipelineState:v153];
                  if (GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v7)))
                  {
                    int64x2_t v539 = vdupq_n_s64(1uLL);
                    uint64_t v540 = 1;
                    [v102 dispatchThreadsPerTile:&v539];
                  }
                  else
                  {
                    [v102 drawPrimitives:3 vertexStart:0 vertexCount:0 instanceCount:1];
                  }
                  [v102 setRenderPipelineState:v152];
                }

                if ((void)__p)
                {
                  *((void *)&__p + 1) = __p;
                  operator delete((void *)__p);
                }
                goto LABEL_468;
              }
              v538.receiver = v490;
              v538.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
              [(DYMTLFunctionPlayer *)&v538 executeGraphicsFunction];
              if (GPUTools::MTL::IsFuncEnumCreateCommandBuffer((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v7)))
              {
                v215 = [(DYMTLFunctionPlayer *)v490 objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v7) + 24, 0)];
                v102 = DYMTLGetOriginalObject(v215);

                if (v102 && (objc_opt_respondsToSelector() & 1) != 0) {
                  [v102 setDisableDeferredEndEncoding:1];
                }
                goto LABEL_468;
              }
            }
            else
            {
              v537.receiver = v490;
              v537.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
              [(DYMTLFunctionPlayer *)&v537 executeGraphicsFunction];
            }
LABEL_469:
            [(DYMTLCommonDebugFunctionPlayer *)v490 _trackObjects];
LABEL_96:
            if (v490->_isAGXDevice)
            {
              if ([v489 playbackMode] == 3)
              {
                v72 = *(int **)((char *)&v490->super.super.super.super.isa + v7);
                int v73 = *v72;
                if ((*v72 + 16343) < 2 || v73 == -12544 || v73 == -15701)
                {
                  v76 = [(DYMTLFunctionPlayer *)v490 objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v72 + 6), 0)];
                  if (v76)
                  {
                    v535[0] = MEMORY[0x263EF8330];
                    v535[1] = 3221225472;
                    v535[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_3;
                    v535[3] = &unk_2653392A0;
                    id v536 = v489;
                    [v76 addCompletedHandler:v535];
                  }
                }
              }
              else if ([v489 playbackMode] == 5 && v490->_batchInfos {
                     || [v489 playbackMode] == 12)
              }
              {
                [(DYMTLCommonDebugFunctionPlayer *)v490 _setupEncodersForBatchIdFiltering];
              }
            }
            goto LABEL_335;
          }
          long long v10 = [(DYMTLCommonFunctionPlayer *)v490 layerManager];
          id v11 = [(DYMTLCommonDebugFunctionPlayer *)v490 replayerLayerForDrawableId:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v7) + 72, 0)];
          [v10 prepareLayerForPresent:v11];
        }

        goto LABEL_96;
      }
      if ([v489 playbackMode] == 5 && v490->_batchInfos
        || [v489 playbackMode] == 12)
      {
        [(DYMTLCommonDebugFunctionPlayer *)v490 _setupEncodersForBatchIdFiltering];
      }
      [(DYMTLCommonDebugFunctionPlayer *)v490 _trackObjects];
      goto LABEL_335;
    case 4u:
      if ([(DYFunctionPlayer *)v2 mainExecutionMode]
        && (int v27 = *(_DWORD *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x263F3F988]),
            v27 == [v489 targetFunctionIndex] - 1)
        && ((uint64_t v28 = (int)*MEMORY[0x263F3F9A8],
             (GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                   + v28)) & 1) != 0)
         || (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                                 + v28)) & 1) != 0
         || GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                               + v28))))
      {
        *(void *)&long long __p = 0;
        *(void *)&long long __p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v28) + 48, 0);
        unint64_t v29 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
        v30 = v29;
        if (v29)
        {
          uint64_t v31 = v29[4];
          unint64_t v562 = 0;
          p_encoderToParallelEncoderMap = &v490->_encoderToParallelEncoderMap;
          uint64_t v33 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
          if (!v33
            || (unint64_t v562 = v33[3],
                (v30 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v562)) != 0))
          {
            unint64_t v557 = 0;
            if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v28)))
            {
              id v534 = 0;
              uint64_t v34 = -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v490, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", [v489 targetSubCommandIndex], &v534, &v557);
              id v485 = v534;
              if (v34) {
                uint64_t v31 = v34;
              }
            }
            else
            {
              id v485 = 0;
            }
            v221 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_commandEncoderDescriptorMap.__table_.__bucket_list_.__ptr_.__value_, v30 + 5);
            v222 = v221;
            if (v221) {
              v223 = v221 + 3;
            }
            else {
              v223 = 0;
            }
            if (v490->_wireframeRenderMode == 2)
            {
              uint64_t v224 = 2;
            }
            else
            {
              uint64_t v224 = [(DYMTLDebugWireframeRenderer *)v490->_wireframeRenderer prepareWireframeTextureWithCommandBufferId:v30[3] commandEncoderId:(void)__p parallelEncoderId:v562 pipelineId:v31 renderPassDescriptor:v223];
              v490->_wireframeRenderMode = v224;
            }
            if (v222) {
              BOOL v225 = (unint64_t)(v222[185] + 1) > 1
            }
                  || (unint64_t)(v222[186] - 1) < 0xFFFFFFFFFFFFFFFELL;
            else {
              BOOL v225 = 0;
            }
            switch(v224)
            {
              case 0:
                if (v485)
                {
                  v309 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
                  v310 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
                  objc_msgSend(v309, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v310, v557, objc_msgSend(v489, "targetSubCommandIndex"), v485);

                  p_isa = (id *)&v490->super.super.super.super.isa;
                }
                else
                {
                  p_isa = (id *)&v490->super.super.super.super.isa;
                  v533.receiver = v490;
                  v533.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                  [(DYMTLFunctionPlayer *)&v533 executeGraphicsFunction];
                }
                [p_isa extractIndirectArgumentBuffers];
                [p_isa extractCommandBufferTranslationData];
                if (v225) {
                  [p_isa _extractTileMemoryWithRenderPassDescriptor:v223 renderEncoderID:(void)__p isDrawCall:GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)p_isa + v28))];
                }
                if ([p_isa[492] createAndSetPostVertexDumpPipelineState:v30[3] commandEncoderId:(void)__p pipelineId:v31])
                {
                  if (v485)
                  {
                    v329 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
                    v330 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
                    objc_msgSend(v329, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v330, v557, objc_msgSend(v489, "targetSubCommandIndex"), v485);

                    p_isa = (id *)&v490->super.super.super.super.isa;
                  }
                  else
                  {
                    p_isa = (id *)&v490->super.super.super.super.isa;
                    v532.receiver = v490;
                    v532.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    [(DYMTLFunctionPlayer *)&v532 executeGraphicsFunction];
                  }
                }
                if ([p_isa[256] createWireframeRenderCommandEncoder:v223])
                {
                  if (v485)
                  {
                    v383 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
                    v384 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
                    objc_msgSend(v383, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v384, v557, objc_msgSend(v489, "targetSubCommandIndex"), v485);
                  }
                  else
                  {
                    v531.receiver = v490;
                    v531.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    [(DYMTLFunctionPlayer *)&v531 executeGraphicsFunction];
                  }
                  if (v562)
                  {
                    *((unsigned char *)v30 + 48) = 1;
                    std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_encoderToParallelEncoderMap, (unint64_t *)&__p);
                    v490->_lastEncoderID = 0;
                    unint64_t v562 = 0;
                  }
                  p_isa = (id *)&v490->super.super.super.super.isa;
                  if ([(DYMTLDebugWireframeRenderer *)v490->_wireframeRenderer createSolidRenderCommandEncoder:v223 commandBufferId:v30[3] commandEncoderId:(void)__p parallelEncoderId:0])
                  {
                    if (v485)
                    {
                      v385 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
                      v386 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
                      objc_msgSend(v385, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v386, v557, objc_msgSend(v489, "targetSubCommandIndex"), v485);

                      p_isa = (id *)&v490->super.super.super.super.isa;
                    }
                    else
                    {
                      p_isa = (id *)&v490->super.super.super.super.isa;
                      v530.receiver = v490;
                      v530.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                      [(DYMTLFunctionPlayer *)&v530 executeGraphicsFunction];
                    }
                    [p_isa[256] createOutlineTexture];
                  }
                }
                v403 = [p_isa[256] wireframeTexture];
                [p_isa setObject:v403 forKey:*MEMORY[0x263F53658]];

                v404 = [(DYMTLDebugWireframeRenderer *)v490->_wireframeRenderer outlineTexture];
                [(DYMTLFunctionPlayer *)v490 setObject:v404 forKey:*MEMORY[0x263F53648]];

                v332 = [(DYMTLDebugWireframeRenderer *)v490->_wireframeRenderer solidTexture];
                [(DYMTLFunctionPlayer *)v490 setObject:v332 forKey:*MEMORY[0x263F53650]];
                goto LABEL_525;
              case 1:
                if (v562)
                {
                  *((unsigned char *)v30 + 48) = 1;
                  std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_encoderToParallelEncoderMap, (unint64_t *)&__p);
                  v490->_lastEncoderID = 0;
                }
                if (v485)
                {
                  v312 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
                  v313 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
                  objc_msgSend(v312, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v313, v557, objc_msgSend(v489, "targetSubCommandIndex"), v485);

                  v314 = v490;
                }
                else
                {
                  v314 = v490;
                  v529.receiver = v490;
                  v529.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                  [(DYMTLFunctionPlayer *)&v529 executeGraphicsFunction];
                }
                if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v314->super.super.super.super.isa
                                                                                           + v28)) & 1) != 0)
                  char v331 = 1;
                else {
                  char v331 = GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v28));
                }
                v490->_targetFunctionNeedsSeparatedPostVertexDump = v331;
                v332 = [(DYMTLDebugWireframeRenderer *)v490->_wireframeRenderer wireframeTexture];
                [(DYMTLFunctionPlayer *)v490 setObject:v332 forKey:*MEMORY[0x263F53658]];
                goto LABEL_525;
              case 2:
                v315 = (id *)&v490->super.super.super.super.isa;
                if ([(DYMTLDebugWireframeRenderer *)v490->_wireframeRenderer createSolidRenderCommandEncoder:v223 commandBufferId:v30[3] commandEncoderId:(void)__p parallelEncoderId:v562])
                {
                  if (v562)
                  {
                    *((unsigned char *)v30 + 48) = 1;
                    std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_encoderToParallelEncoderMap, (unint64_t *)&__p);
                    v490->_lastEncoderID = 0;
                  }
                  if (v485)
                  {
                    v316 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
                    v317 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
                    objc_msgSend(v316, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v317, v557, objc_msgSend(v489, "targetSubCommandIndex"), v485);

                    v315 = (id *)&v490->super.super.super.super.isa;
                  }
                  else
                  {
                    v315 = (id *)&v490->super.super.super.super.isa;
                    v528.receiver = v490;
                    v528.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    [(DYMTLFunctionPlayer *)&v528 executeGraphicsFunction];
                  }
                  [v315[256] createOutlineTexture];
                }
                v382 = [v315[256] outlineTexture];
                [v315 setObject:v382 forKey:*MEMORY[0x263F53648]];

                v332 = [(DYMTLDebugWireframeRenderer *)v490->_wireframeRenderer solidTexture];
                [(DYMTLFunctionPlayer *)v490 setObject:v332 forKey:*MEMORY[0x263F53650]];
LABEL_525:

                goto LABEL_526;
              case 3:
                if (!GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v28))) {
                  goto LABEL_501;
                }
                v484 = [(DYMTLFunctionPlayer *)v490 objectForKey:v31];
                v318 = DYMTLGetAssociatedObject(v484, 2u);
                v481 = v318;
                if (v318)
                {
                  long long v526 = 0u;
                  long long v527 = 0u;
                  long long v524 = 0u;
                  long long v525 = 0u;
                  v319 = [v318 vertexBindings];
                  uint64_t v320 = [v319 countByEnumeratingWithState:&v524 objects:v567 count:16];
                  if (!v320) {
                    goto LABEL_403;
                  }
                  uint64_t v321 = *(void *)v525;
                  while (1)
                  {
                    for (uint64_t i = 0; i != v320; ++i)
                    {
                      if (*(void *)v525 != v321) {
                        objc_enumerationMutation(v319);
                      }
                      v323 = *(void **)(*((void *)&v524 + 1) + 8 * i);
                      if ([v323 access] == 1 && (objc_msgSend(v323, "type") | 2) == 2)
                      {
                        char v324 = 1;
                        goto LABEL_471;
                      }
                    }
                    uint64_t v320 = [v319 countByEnumeratingWithState:&v524 objects:v567 count:16];
                    if (!v320)
                    {
LABEL_403:
                      char v324 = 0;
LABEL_471:

                      goto LABEL_476;
                    }
                  }
                }
                char v324 = 0;
LABEL_476:
                v490->_targetFunctionNeedsSeparatedPostVertexDump = 0;
                if (![(DYMTLPostVertexDump *)v490->_postVertexDump createAndSetPostVertexDumpPipelineState:v30[3] commandEncoderId:(void)__p pipelineId:v31])goto LABEL_500; {
                v523.receiver = v490;
                }
                v523.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                [(DYMTLFunctionPlayer *)&v523 executeGraphicsFunction];
                if (v324)
                {
                  v490->_targetFunctionNeedsSeparatedPostVertexDump = 1;
                }
                else
                {
                  v390 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
                  [v390 setRenderPipelineState:v484];

LABEL_500:
LABEL_501:
                  if (v485)
                  {
                    v391 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
                    v392 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
                    objc_msgSend(v391, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v392, v557, objc_msgSend(v489, "targetSubCommandIndex"), v485);
                  }
                  else
                  {
                    v522.receiver = v490;
                    v522.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
                    [(DYMTLFunctionPlayer *)&v522 executeGraphicsFunction];
                  }
                  [(DYMTLCommonDebugFunctionPlayer *)v490 extractIndirectArgumentBuffers];
                  [(DYMTLCommonDebugFunctionPlayer *)v490 extractCommandBufferTranslationData];
                  if (v225) {
                    [(DYMTLCommonDebugFunctionPlayer *)v490 _extractTileMemoryWithRenderPassDescriptor:v223 renderEncoderID:(void)__p isDrawCall:GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa+ v28))];
                  }
                }
                [(DYMTLFunctionPlayer *)v490 setObject:0 forKey:*MEMORY[0x263F53658]];
                [(DYMTLFunctionPlayer *)v490 setObject:0 forKey:*MEMORY[0x263F53648]];
                [(DYMTLFunctionPlayer *)v490 setObject:0 forKey:*MEMORY[0x263F53650]];
LABEL_526:

                break;
              default:
                goto LABEL_526;
            }
          }
        }
      }
      else if ([(DYFunctionPlayer *)v490 mainExecutionMode] {
             && (int v83 = *(_DWORD *)((char *)&v490->super.super.super.super.isa + (int)*MEMORY[0x263F3F988]),
      }
                 v83 == [v489 targetFunctionIndex] - 1)
             && (uint64_t v84 = (int)*MEMORY[0x263F3F9A8],
                 GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v84))))
      {
        unint64_t v85 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v84) + 48, 0);
        *(void *)&long long __p = 0;
        id v521 = 0;
        -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v490, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", [v489 targetSubCommandIndex], &v521, &__p);
        id v86 = v521;
        v87 = [(DYMTLFunctionPlayer *)v490 objectForKey:v85];
        v88 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
        objc_msgSend(v88, "executeIndirectComputeCommand:withData:atIndex:forIndirectCommandBuffer:", v87, (void)__p, objc_msgSend(v489, "targetSubCommandIndex"), v86);

        [(DYMTLCommonDebugFunctionPlayer *)v490 extractIndirectArgumentBuffers];
        [(DYMTLCommonDebugFunctionPlayer *)v490 extractCommandBufferTranslationData];
      }
      else
      {
        [(DYMTLCommonDebugFunctionPlayer *)v490 _executeGraphicsFunction];
        if ([(DYFunctionPlayer *)v490 mainExecutionMode])
        {
          int v89 = *(_DWORD *)((char *)&v490->super.super.super.super.isa + (int)*MEMORY[0x263F3F988]);
          if (v89 == [v489 targetFunctionIndex] - 1)
          {
            if (GPUTools::MTL::IsFuncEnumComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8])))
            {
              [(DYMTLCommonDebugFunctionPlayer *)v490 extractIndirectArgumentBuffers];
              [(DYMTLCommonDebugFunctionPlayer *)v490 extractCommandBufferTranslationData];
            }
          }
        }
        BOOL v12 = [(DYMTLCommonDebugFunctionPlayer *)v490 shouldExecuteGraphicsFunction];
LABEL_126:
        if (v12) {
LABEL_120:
        }
          [(DYMTLCommonDebugFunctionPlayer *)v490 _trackObjects];
      }
      goto LABEL_331;
    case 6u:
      if (![(DYFunctionPlayer *)v2 mainExecutionMode]) {
        goto LABEL_118;
      }
      int v59 = *(_DWORD *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x263F3F988]);
      if (v59 != [v489 targetFunctionIndex] - 1) {
        goto LABEL_118;
      }
      uint64_t v60 = (int)*MEMORY[0x263F3F9A8];
      if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                 + v60)) & 1) == 0
        && !GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v60)))
      {
        goto LABEL_118;
      }
      *(void *)&long long __p = 0;
      *(void *)&long long __p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v60) + 48, 0);
      id v61 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
      uint64_t v62 = v61;
      if (v61)
      {
        uint64_t v63 = v61[4];
        unint64_t v562 = 0;
        v64 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
        if (!v64
          || (unint64_t v562 = v64[3],
              (uint64_t v62 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v562)) != 0))
        {
          unint64_t v557 = 0;
          if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v60)))
          {
            id v520 = 0;
            uint64_t v65 = -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v490, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", [v489 targetSubCommandIndex], &v520, &v557);
            id v66 = v520;
            if (v65) {
              uint64_t v63 = v65;
            }
          }
          else
          {
            id v66 = 0;
          }
          [(DYMTLPostVertexDump *)v490->_postVertexDump createAndSetPostVertexDumpPipelineState:v62[3] commandEncoderId:(void)__p pipelineId:v63];
          if (v66)
          {
            v226 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
            v227 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
            objc_msgSend(v226, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v227, v557, objc_msgSend(v489, "targetSubCommandIndex"), v66);
          }
          else
          {
            v519.receiver = v490;
            v519.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
            [(DYMTLFunctionPlayer *)&v519 executeGraphicsFunction];
          }
          v490->_targetFunctionNeedsSeparatedPostVertexDump = 0;
        }
      }
      goto LABEL_331;
    case 7u:
      uint64_t v21 = (void *)MEMORY[0x253362620]();
      [(DYMTLCommonDebugFunctionPlayer *)v2 _executeGraphicsFunction];
      [(DYMTLCommonDebugFunctionPlayer *)v2 _trackObjects];
      uint64_t v22 = (int)*MEMORY[0x263F3F9A8];
      if (!GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                               + v22)))
        goto LABEL_330;
      unint64_t v562 = 0;
      unint64_t v562 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v22) + 48, 0);
      v23 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v562);
      if (!v23) {
        goto LABEL_330;
      }
      v24 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v23 + 3);
      if (!v24) {
        goto LABEL_330;
      }
      unint64_t v557 = 0;
      uint64_t v25 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v562);
      if (v25)
      {
        unint64_t v557 = v25[3];
        std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v557);
        unint64_t v26 = [(DYMTLFunctionPlayer *)v490 objectForKey:v557];
      }
      else
      {
        unint64_t v26 = 0;
      }
      v156 = [(DYMTLFunctionPlayer *)v490 objectForKey:v562];
      v467 = v26;
      v453 = v156;
      v451 = v21;
      if (![v156 conformsToProtocol:&unk_27010CFE8]) {
        goto LABEL_329;
      }
      v446 = [(DYMTLFunctionPlayer *)v490 objectForKey:v24[3]];
      uint64_t v157 = v24[2];
      v471 = [(DYMTLFunctionPlayer *)v490 objectForKey:v157];
      v487 = [v156 descriptor];
      if (v26)
      {
        uint64_t v158 = DYMTLGetAssociatedObject(v26, 0);

        v487 = (void *)v158;
      }
      [v446 commandBuffer];
      v160 = uint64_t v159 = 0;
      do
      {
        v161 = [v487 colorAttachments];
        v162 = [v161 objectAtIndexedSubscript:v159];
        [(DYMTLCommonDebugFunctionPlayer *)v490 _updateMemorylessTextures:v162];

        v163 = [v487 colorAttachments];
        v164 = [v163 objectAtIndexedSubscript:v159];
        [v164 setResolveTexture:0];

        v165 = [v487 colorAttachments];
        v166 = [v165 objectAtIndexedSubscript:v159];
        [v166 setLoadAction:1];

        v167 = [v487 colorAttachments];
        v168 = [v167 objectAtIndexedSubscript:v159];
        BOOL v169 = [v168 storeAction] == 4;

        if (!v169)
        {
          v170 = [v487 colorAttachments];
          v171 = [v170 objectAtIndexedSubscript:v159];
          [v171 setStoreAction:1];
        }
        ++v159;
      }
      while (v159 != 8);
      v172 = [v487 depthAttachment];
      [(DYMTLCommonDebugFunctionPlayer *)v490 _updateMemorylessTextures:v172];

      v173 = [v487 depthAttachment];
      [v173 setResolveTexture:0];

      v174 = [v487 depthAttachment];
      [v174 setLoadAction:1];

      v175 = [v487 depthAttachment];
      BOOL v176 = [v175 storeAction] == 4;

      if (!v176)
      {
        v177 = [v487 depthAttachment];
        [v177 setStoreAction:1];
      }
      v178 = [v487 stencilAttachment];
      [(DYMTLCommonDebugFunctionPlayer *)v490 _updateMemorylessTextures:v178];

      v179 = [v487 stencilAttachment];
      [v179 setResolveTexture:0];

      v180 = [v487 stencilAttachment];
      [v180 setLoadAction:1];

      v181 = [v487 stencilAttachment];
      BOOL v182 = [v181 storeAction] == 4;

      if (!v182)
      {
        v183 = [v487 stencilAttachment];
        [v183 setStoreAction:1];
      }
      v184 = [v487 stencilAttachment];
      [v184 setStencilResolveFilter:0];

      if (v26)
      {
        v185 = DYMTLNewStatefulParallelRenderCommandEncoder(v160, v487);
        v186 = DYMTLNewStatefulRenderCommandEncoder(v185);
        [(DYMTLCommonDebugFunctionPlayer *)v490 encodeStoreActionForParallelRenderCommandEncoder:v185 withDescriptor:v487];
      }
      else
      {
        v186 = DYMTLNewStatefulRenderCommandEncoder(v160, v487);
        [(DYMTLCommonDebugFunctionPlayer *)v490 encodeStoreActionForRenderCommandEncoder:v186 withDescriptor:v487];
        v185 = 0;
      }
      v556[0] = MEMORY[0x263EF8330];
      v556[1] = 3221225472;
      v556[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke;
      v556[3] = &unk_265338F78;
      v556[4] = v490;
      [v453 applyAllStateToEncoder:v186 rawBytesBlock:v556];
      [(DYMTLFunctionPlayer *)v490 setObject:v160 forKey:v157];
      [(DYMTLFunctionPlayer *)v490 setObject:v186 forKey:v562];
      if (v26) {
        [(DYMTLFunctionPlayer *)v490 setObject:v185 forKey:v557];
      }

      [v453 endEncoding];
      if (v26) {
        [v26 endEncoding];
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_303;
      }
      v228 = [v489 playbackOptions];
      if (v228 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v229 = v228;
        v230 = [v229 objectForKeyedSubscript:*MEMORY[0x263F3FED0]];
        GPUTraceResourceResolutionDecode(v230, (uint64_t)&__p);
        uint64_t v460 = *((void *)&__p + 1);
        uint64_t v463 = __p;
        uint64_t v458 = v560;

        contexta = [v229 objectForKeyedSubscript:*MEMORY[0x263F3FEF0]];

        if (contexta) {
          goto LABEL_307;
        }
      }
      else
      {

LABEL_303:
        uint64_t v463 = 512;
        uint64_t v460 = 128;
        uint64_t v458 = 32;
      }
      v231 = objc_opt_new();
      uint64_t v232 = 0;
      do
      {
        v233 = objc_msgSend(NSString, "stringWithFormat:", @"Color.%u", v232);
        [v231 addObject:v233];

        uint64_t v232 = (v232 + 1);
      }
      while (v232 != 8);
      [v231 addObject:@"Depth."];
      [v231 addObject:@"Stencil."];
      [v231 addObject:@"First"];
      contexta = [MEMORY[0x263EFF8C0] arrayWithArray:v231];

LABEL_307:
      char v457 = [contexta containsObject:@"All"];
      long long v554 = 0u;
      long long v555 = 0u;
      long long v552 = 0u;
      long long v553 = 0u;
      id obja = contexta;
      uint64_t v234 = [obja countByEnumeratingWithState:&v552 objects:v568 count:16];
      if (v234)
      {
        v235 = 0;
        v236 = 0;
        uint64_t v480 = *(void *)v553;
        uint64_t v483 = v234;
        while (1)
        {
          for (uint64_t j = 0; j != v483; ++j)
          {
            if (*(void *)v553 != v480) {
              objc_enumerationMutation(obja);
            }
            v238 = *(void **)(*((void *)&v552 + 1) + 8 * j);
            if ([v238 hasPrefix:@"Color."])
            {
              id v239 = v238;
              uint64_t v240 = [@"Color." length];
              v241 = objc_msgSend(v239, "substringWithRange:", v240, objc_msgSend(v239, "length") - v240);
              unsigned int v242 = [v241 integerValue];

              if ((v242 & 0xFFFFFFF8) != 0) {
                continue;
              }
              v243 = [v487 colorAttachments];
              v244 = [v243 objectAtIndexedSubscript:v242];

              v245 = [v244 texture];
              int v246 = 1;
            }
            else if ([v238 isEqualToString:@"Depth."])
            {
              v244 = [v487 depthAttachment];

              v245 = [v244 texture];
              int v246 = 2;
            }
            else
            {
              if (![v238 isEqualToString:@"Stencil."]) {
                continue;
              }
              v244 = [v487 stencilAttachment];

              v245 = [v244 texture];
              int v246 = 4;
            }
            v235 = v244;

            if (v245 && v244)
            {
              v247 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&v490->super.super.super.super.isa + (int)*MEMORY[0x263F3F988])];
              v248 = (void *)MEMORY[0x263F53640];
              v249 = [(DYMTLFunctionPlayer *)v490 device];
              v250 = [v248 forDevice:v249];

              uint64_t v549 = v463;
              uint64_t v550 = v460;
              uint64_t v551 = v458;
              [v244 level];
              [v244 slice];
              [v244 depthPlane];
              v545[0] = MEMORY[0x263EF8330];
              v545[1] = 3221225472;
              v545[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_2;
              v545[3] = &unk_265339278;
              v545[4] = v490;
              id v251 = v247;
              id v546 = v251;
              id v547 = v245;
              v548 = v238;
              LODWORD(v432) = v246;
              id v252 = v547;
              objc_msgSend(v250, "resizeTexture:resolution:level:slice:depthPlane:inBuffer:withType:completion:", v432, v545);

              unint64_t v26 = v467;
              v235 = v244;
              v236 = v252;

              if ((v457 & 1) == 0) {
                goto LABEL_328;
              }
            }
            else
            {
              v236 = v245;
            }
          }
          uint64_t v483 = [obja countByEnumeratingWithState:&v552 objects:v568 count:16];
          if (!v483) {
            goto LABEL_328;
          }
        }
      }
      v235 = 0;
      v236 = 0;
LABEL_328:

      [v471 commit];
      v156 = v453;
LABEL_329:

      uint64_t v21 = v451;
LABEL_330:
      goto LABEL_331;
    case 8u:
      if (![(DYFunctionPlayer *)v2 mainExecutionMode]
        || (int v67 = *(_DWORD *)((char *)&v2->super.super.super.super.isa + (int)*MEMORY[0x263F3F988]),
            v67 != [v489 targetFunctionIndex] - 1))
      {
LABEL_118:
        [(DYMTLCommonDebugFunctionPlayer *)v490 _executeGraphicsFunction];
        BOOL v12 = [(DYMTLCommonDebugFunctionPlayer *)v490 shouldExecuteGraphicsFunction];
        goto LABEL_126;
      }
      *(void *)&long long __p = 0;
      uint64_t v68 = (int)*MEMORY[0x263F3F9A8];
      *(void *)&long long __p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v68) + 48, 0);
      if (!std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p))goto LABEL_331; {
      v69 = [(DYFunctionPlayer *)v490 engine];
      }
      v70 = [v69 playbackOptions];

      unint64_t v562 = 0;
      if (GPUTools::MTL::IsFuncEnumIndirectExecuteCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v68)))
      {
        id v515 = 0;
        -[DYMTLCommonDebugFunctionPlayer _executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:](v490, "_executeIndirectCommandBufferUpToSubIndex:outBuffer:outDataPointer:", [v489 targetSubCommandIndex], &v515, &v562);
        id v71 = v515;
      }
      else
      {
        id v71 = 0;
      }
      [(DYMTLShaderDebuggerTraceGenerator *)v490->_shaderDebuggerTraceGenerator prepareCommandEncoderForInstrumentedCall:(void)__p generationOptions:v70];
      if (!v71)
      {
        [(DYMTLCommonDebugFunctionPlayer *)v490 _executeGraphicsFunction];
        goto LABEL_283;
      }
      if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v68)))
      {
        v154 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
        v155 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
        objc_msgSend(v155, "executeIndirectRenderCommand:withData:atIndex:forIndirectCommandBuffer:", v154, v562, objc_msgSend(v489, "targetSubCommandIndex"), v71);
      }
      else
      {
        if (!GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v68))) {
          goto LABEL_283;
        }
        v154 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
        v155 = [(DYMTLFunctionPlayer *)v490 indirectCommandManager];
        objc_msgSend(v155, "executeIndirectComputeCommand:withData:atIndex:forIndirectCommandBuffer:", v154, v562, objc_msgSend(v489, "targetSubCommandIndex"), v71);
      }

LABEL_283:
      if ([(DYMTLCommonDebugFunctionPlayer *)v490 shouldExecuteGraphicsFunction]) {
        [(DYMTLCommonDebugFunctionPlayer *)v490 _trackObjects];
      }

      goto LABEL_331;
    case 9u:
      [(DYMTLCommonDebugFunctionPlayer *)v2 _splitCommandEncoders];
      [(DYMTLCommonDebugFunctionPlayer *)v2 _executeGraphicsFunction];
      BOOL v12 = [(DYMTLCommonDebugFunctionPlayer *)v2 shouldExecuteGraphicsFunction];
      goto LABEL_126;
    case 0xAu:
      uint64_t v13 = (int)*MEMORY[0x263F3F9A8];
      int32x2_t v14 = *(int **)((char *)&v2->super.super.super.super.isa + v13);
      int v15 = *v14;
      if (*v14 <= -16163)
      {
        switch(v15)
        {
          case -16351:
            [(DYFunctionPlayer *)v2 processArguments];
            v2->_parallelEncoderCommandBufferID = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v2->super.super.super.super.isa + v13) + 48, 0);
            v187 = (char *)v2 + (int)*MEMORY[0x263F3F970];
            uint64_t v188 = GPUTools::MTL::MakeMTLRenderPassDescriptor(**((void **)v187 + 1), (uint64_t)[(DYMTLFunctionPlayer *)v2 objectMap]);
            dependencyGraphParallelDescriptor = v2->_dependencyGraphParallelDescriptor;
            v2->_dependencyGraphParallelDescriptor = (MTLRenderPassDescriptor *)v188;

            GPUTools::MTL::Utils::MakeDYMTLRenderPassDescriptor(**((GPUTools::MTL::Utils ***)v187 + 1), &v2->_dependencyGraphDYMTLParallelDescriptor, v190);
            goto LABEL_335;
          case -16286:
            for (uint64_t k = 0; k != 8; ++k)
            {
              v192 = [(MTLRenderPassDescriptor *)v490->_dependencyGraphParallelDescriptor colorAttachments];
              v193 = [v192 objectAtIndexedSubscript:k];
              [(DYMTLCommonDebugFunctionPlayer *)v490 _updateMemorylessTextures:v193];

              v194 = [(MTLRenderPassDescriptor *)v490->_dependencyGraphParallelDescriptor colorAttachments];
              v195 = [v194 objectAtIndexedSubscript:k];
              v196 = [v195 resolveTexture];

              v197 = [(MTLRenderPassDescriptor *)v490->_dependencyGraphParallelDescriptor colorAttachments];
              v198 = [v197 objectAtIndexedSubscript:k];
              if (v196) {
                [v198 setStoreAction:3];
              }
              else {
                [v198 setStoreAction:1];
              }
            }
            v199 = [(MTLRenderPassDescriptor *)v490->_dependencyGraphParallelDescriptor depthAttachment];
            [(DYMTLCommonDebugFunctionPlayer *)v490 _updateMemorylessTextures:v199];

            v200 = [(MTLRenderPassDescriptor *)v490->_dependencyGraphParallelDescriptor depthAttachment];
            v201 = [v200 resolveTexture];

            v202 = [(MTLRenderPassDescriptor *)v490->_dependencyGraphParallelDescriptor depthAttachment];
            if (v201) {
              [v202 setStoreAction:3];
            }
            else {
              [v202 setStoreAction:1];
            }

            v254 = [(MTLRenderPassDescriptor *)v490->_dependencyGraphParallelDescriptor stencilAttachment];
            [(DYMTLCommonDebugFunctionPlayer *)v490 _updateMemorylessTextures:v254];

            v255 = [(MTLRenderPassDescriptor *)v490->_dependencyGraphParallelDescriptor stencilAttachment];
            v256 = [v255 resolveTexture];

            v257 = [(MTLRenderPassDescriptor *)v490->_dependencyGraphParallelDescriptor stencilAttachment];
            if (v256) {
              [v257 setStoreAction:3];
            }
            else {
              [v257 setStoreAction:1];
            }

            v258 = [(DYMTLFunctionPlayer *)v490 objectForKey:v490->_parallelEncoderCommandBufferID];
            v259 = [v258 renderCommandEncoderWithDescriptor:v490->_dependencyGraphParallelDescriptor];
            unint64_t v562 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v13) + 24, 0);
            [(DYMTLFunctionPlayer *)v490 setObject:v259 forKey:v562];
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&v490->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v562);
            long long __p = v490->_parallelEncoderCommandBufferID;
            unint64_t v560 = v562;
            char v561 = 0;
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)&v490->_encoderMap, &v562, &v562, &__p);
            [(DYMTLCommonDebugFunctionPlayer *)v490 _addRenderPassDescriptorToEncoderMapFromRenderPassDescriptor:&v490->_dependencyGraphDYMTLParallelDescriptor forEncoder:v562];
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&v490->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v562);

            goto LABEL_335;
          case -16285:
            currentParallelDescriptor = v2->_currentParallelDescriptor;
            v2->_currentParallelDescriptor = 0;

            v2->_currentParallelId = 0;
            v2->_parallelEncoderCommandBufferID = 0;
            v137 = v2->_dependencyGraphParallelDescriptor;
            v2->_dependencyGraphParallelDescriptor = 0;

            goto LABEL_335;
        }
      }
      else
      {
        if ((v15 + 16162) <= 0xA && ((1 << (v15 + 34)) & 0x73F) != 0) {
          goto LABEL_335;
        }
        if (v15 == -15789)
        {
          if (!v2->_sparseTextureFence)
          {
            uint64_t v17 = [(DYMTLFunctionPlayer *)v2 device];
            uint64_t v18 = [v17 newFence];
            sparseTextureFence = v490->_sparseTextureFence;
            v490->_sparseTextureFence = (MTLFence *)v18;

            int32x2_t v14 = *(int **)((char *)&v490->super.super.super.super.isa + v13);
          }
          uint64_t v20 = [(DYMTLFunctionPlayer *)v490 objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v14 + 12), 0)];
          [v20 updateFence:v490->_sparseTextureFence];
        }
      }
      [(DYMTLCommonDebugFunctionPlayer *)v490 _executeGraphicsFunction];
      [(DYMTLCommonDebugFunctionPlayer *)v490 _trackObjects];
      v138 = *(unsigned int **)((char *)&v490->super.super.super.super.isa + v13);
      v139 = (GPUTools::MTL *)*v138;
      if (v139 == -16376 || v139 == -15789 || v139 == -16246)
      {
        *(void *)&long long __p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v138 + 12), 0);
        v142 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
        v143 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v142 + 3);
        v144 = [(DYMTLFunctionPlayer *)v490 objectForKey:v143[3]];
        uint64_t v145 = v143[2];
        v146 = [(DYMTLFunctionPlayer *)v490 objectForKey:v145];
        [v146 commit];
        [v146 waitUntilCompleted];
        v147 = [v144 commandBuffer];

        [(DYMTLFunctionPlayer *)v490 setObject:v147 forKey:v145];
        v138 = *(unsigned int **)((char *)&v490->super.super.super.super.isa + v13);
        v139 = (GPUTools::MTL *)*v138;
      }
      if (v139 == -16361)
      {
        v148 = [(DYMTLFunctionPlayer *)v490 objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v138 + 12), 0)];
        [v148 waitUntilCompleted];
      }
      else if (GPUTools::MTL::IsFuncEnumEndEncoding(v139))
      {
        if (objc_opt_respondsToSelector())
        {
          v203 = [v489 playbackOptions];
          if (v203 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v204 = v203;
            v205 = [v204 objectForKeyedSubscript:*MEMORY[0x263F3FEF8]];
            char v206 = [v205 BOOLValue];

            v207 = [v204 objectForKeyedSubscript:*MEMORY[0x263F3FB08]];
            uint64_t v208 = *MEMORY[0x263F3FED0];
            v209 = [v204 objectForKeyedSubscript:*MEMORY[0x263F3FED0]];
            BOOL v210 = v209 == 0;

            if (v210)
            {
              uint64_t v214 = 16;
              uint64_t v212 = 256;
              uint64_t v213 = 128;
            }
            else
            {
              v211 = [v204 objectForKeyedSubscript:v208];
              GPUTraceResourceResolutionDecode(v211, (uint64_t)&__p);
              uint64_t v212 = *((void *)&__p + 1);
              uint64_t v213 = __p;
              uint64_t v214 = v560;
            }
          }
          else
          {
            v207 = 0;
            char v206 = 0;
            uint64_t v214 = 16;
            uint64_t v212 = 256;
            uint64_t v213 = 128;
          }
        }
        else
        {
          v207 = 0;
          char v206 = 0;
          uint64_t v214 = 16;
          uint64_t v212 = 256;
          uint64_t v213 = 128;
        }
        v393 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&v490->super.super.super.super.isa + (int)*MEMORY[0x263F3F988])];
        v394 = [v207 objectForKey:v393];
        if (v394) {
          char v395 = v206;
        }
        else {
          char v395 = 0;
        }
        if (v395)
        {
          *(void *)&long long __p = 0;
          *(void *)&long long __p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v490->super.super.super.super.isa + v13) + 48, 0);
          v396 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
          if (v396)
          {
            v397 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v396 + 3);
            if (v397)
            {
              unint64_t v562 = 0;
              v398 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
              if (v398)
              {
                unint64_t v562 = v398[3];
                std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v562);
                v399 = [(DYMTLFunctionPlayer *)v490 objectForKey:v562];
              }
              else
              {
                v399 = 0;
              }
              v400 = [(DYMTLFunctionPlayer *)v490 objectForKey:v397[2]];
              v401 = (void *)MEMORY[0x253362620]();
              v558[0] = v213;
              v558[1] = v212;
              v558[2] = v214;
              v402 = [(DYMTLCommonDebugFunctionPlayer *)v490 _generateThumbnailAndResourceInfoForRequestedTextures:v394 resolution:v558 commandBuffer:v400];
              [(NSMutableDictionary *)v490->_dependencyGraphThumbnails setObject:v402 forKey:v393];
            }
          }
        }
      }
      goto LABEL_331;
    case 0xDu:
      uint64_t v35 = (void *)MEMORY[0x253362620]();
      uint64_t v450 = (int)*MEMORY[0x263F3F9A8];
      unsigned int v36 = **(_DWORD **)((char *)&v2->super.super.super.super.isa + v450) + 16162;
      if (v36 < 0xB && ((0x73Fu >> v36) & 1) != 0)
      {
        int v49 = 1;
        goto LABEL_221;
      }
      context = v35;
      [(DYMTLCommonDebugFunctionPlayer *)v2 _executeGraphicsFunction];
      [(DYMTLCommonDebugFunctionPlayer *)v2 _trackObjects];
      *(void *)&long long __p = 0;
      *(void *)&long long __p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&v2->super.super.super.super.isa + v450) + 48, 0);
      v37 = *(Class *)((char *)&v2->super.super.super.super.isa + v450);
      if (*v37 == -16353) {
        *(void *)&long long __p = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v37 + 6), 0);
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_148;
      }
      v38 = [v489 playbackOptions];
      if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v39 = v38;
        v40 = [v39 objectForKeyedSubscript:*MEMORY[0x263F3FE78]];
        uint64_t v41 = [v40 unsignedLongLongValue];

        v42 = [v39 objectForKeyedSubscript:*MEMORY[0x263F3FE68]];
        uint64_t v479 = [v42 unsignedLongLongValue];

        v43 = [v39 objectForKeyedSubscript:*MEMORY[0x263F3FE70]];
        obuint64_t j = (id)[v43 unsignedLongLongValue];

        uint64_t v44 = [v39 objectForKeyedSubscript:*MEMORY[0x263F3FE60]];
        BOOL v459 = [v44 unsignedLongLongValue] != 0;

        v45 = [v39 objectForKeyedSubscript:*MEMORY[0x263F3FE58]];
        BOOL v462 = [v45 unsignedLongLongValue] != 0;

        v46 = [v39 objectForKeyedSubscript:*MEMORY[0x263F3FE50]];
        uint64_t v47 = [v46 unsignedLongLongValue];

        v482 = [v39 objectForKeyedSubscript:*MEMORY[0x263F3FE80]];

        uint64_t v48 = __p;
        if (v41 && (void)__p != v41)
        {
          int v49 = 2;
          goto LABEL_220;
        }
        BOOL v104 = v47 != 0;
      }
      else
      {

LABEL_148:
        BOOL v104 = 0;
        BOOL v462 = 0;
        BOOL v459 = 0;
        uint64_t v479 = 0;
        v482 = 0;
        obuint64_t j = 0;
        uint64_t v48 = __p;
      }
      pixelHistoryEncoderStateTrackings = v490->_pixelHistoryEncoderStateTrackings;
      v106 = [NSNumber numberWithUnsignedLongLong:v48];
      v107 = [(NSMutableDictionary *)pixelHistoryEncoderStateTrackings objectForKeyedSubscript:v106];

      if (v107)
      {
        v466 = v107;
        uint64_t v108 = [v107 encoderFunctionIndex];
        v109 = [(NSMutableDictionary *)v490->_pixelHistory objectForKeyedSubscript:*MEMORY[0x263F3FDD8]];
        v110 = [NSNumber numberWithUnsignedInt:v108];
        v452 = [v109 objectForKeyedSubscript:v110];

        v111 = (GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v450);
        if (v111 != -16353)
        {
          if (!v452)
          {
            v452 = 0;
LABEL_217:
            int v49 = 2;
            v456 = v466;
            goto LABEL_218;
          }
          if ((GPUTools::MTL::IsFuncEnumDrawCall(v111) & 1) == 0)
          {
            if (!v462) {
              goto LABEL_217;
            }
            int v112 = **(_DWORD **)((char *)&v490->super.super.super.super.isa + v450);
            if (!IsFuncEnumPixelHistoryInterestingRenderPassStateItems(v112) && v112 != -16246) {
              goto LABEL_217;
            }
          }
        }
      }
      else
      {
        if (**(_DWORD **)((char *)&v490->super.super.super.super.isa + v450) != -16353)
        {
          int v49 = 2;
          v456 = 0;

          goto LABEL_219;
        }
        v466 = 0;
        v452 = 0;
      }
      v113 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&__p);
      if (!v113) {
        goto LABEL_217;
      }
      v444 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_commandEncoderDescriptorMap.__table_.__bucket_list_.__ptr_.__value_, v113 + 5);
      if (!v444) {
        goto LABEL_217;
      }
      v114 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v490->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v113 + 3);
      if (!v114) {
        goto LABEL_217;
      }
      BOOL v436 = v104;
      v445 = [(DYMTLFunctionPlayer *)v490 objectForKey:(void)__p];
      v443 = [(DYMTLFunctionPlayer *)v490 objectForKey:v114[3]];
      uint64_t v437 = v114[2];
      -[DYMTLFunctionPlayer objectForKey:](v490, "objectForKey:");
      id v454 = (id)objc_claimAutoreleasedReturnValue();
      v486 = [v445 descriptor];
      unint64_t v434 = v113[4];
      v440 = -[DYMTLFunctionPlayer objectForKey:](v490, "objectForKey:");
      if (**(_DWORD **)((char *)&v490->super.super.super.super.isa + v450) == -16353)
      {
        v470 = objc_opt_new();
        uint64_t v115 = 0;
        do
        {
          v116 = objc_msgSend(NSString, "stringWithFormat:", @"Color.%u", v115);
          [v470 addObject:v116];

          uint64_t v115 = (v115 + 1);
        }
        while (v115 != 8);
        [v470 addObject:@"Depth."];
        [v470 addObject:@"Stencil."];
        id v474 = (id)objc_opt_new();
        long long v513 = 0u;
        long long v514 = 0u;
        long long v511 = 0u;
        long long v512 = 0u;
        id v117 = v470;
        uint64_t v118 = [v117 countByEnumeratingWithState:&v511 objects:v566 count:16];
        if (v118)
        {
          uint64_t v119 = *(void *)v512;
          do
          {
            for (uint64_t m = 0; m != v118; ++m)
            {
              if (*(void *)v512 != v119) {
                objc_enumerationMutation(v117);
              }
              v121 = *(void **)(*((void *)&v511 + 1) + 8 * m);
              if (![v121 hasPrefix:@"Color."])
              {
                if ([v121 isEqualToString:@"Depth."])
                {
                  v124 = [v486 depthAttachment];
                  v125 = [v124 texture];
                  v126 = @"Depth";
                  if (!v125) {
                    goto LABEL_185;
                  }
                }
                else
                {
                  if (![v121 isEqualToString:@"Stencil."])
                  {
LABEL_184:
                    v125 = 0;
                    v124 = 0;
                    v126 = 0;
                    goto LABEL_185;
                  }
                  v124 = [v486 stencilAttachment];
                  v125 = [v124 texture];
                  v126 = @"Stencil";
                  if (!v125) {
                    goto LABEL_185;
                  }
                }
LABEL_179:
                if (v124)
                {
                  uint64_t v127 = [(DYMTLFunctionPlayer *)v490 keyForOriginalObject:v125 inverseObjectMap:&v490->_pixelHistoryInverseObjectMap];
                  if (!v482
                    || (uint64_t v128 = v127, ![v482 count])
                    || ([NSNumber numberWithUnsignedLongLong:v128],
                        v129 = objc_claimAutoreleasedReturnValue(),
                        char v130 = [v482 containsObject:v129],
                        v129,
                        (v130 & 1) != 0))
                  {
                    [v474 setObject:v124 forKeyedSubscript:v126];
                  }
                }
                goto LABEL_185;
              }
              uint64_t Index = GPUThumbnailOptionsColorGetIndex((NSString *)v121);
              if (Index >= 8) {
                goto LABEL_184;
              }
              v123 = [v486 colorAttachments];
              v124 = [v123 objectAtIndexedSubscript:Index];

              v125 = [v124 texture];
              objc_msgSend(NSString, "stringWithFormat:", @"Color %i", Index);
              v126 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (v125) {
                goto LABEL_179;
              }
LABEL_185:
            }
            uint64_t v118 = [v117 countByEnumeratingWithState:&v511 objects:v566 count:16];
          }
          while (v118);
        }

        v131 = objc_opt_new();
        v132 = v490->_pixelHistoryEncoderStateTrackings;
        v133 = [NSNumber numberWithUnsignedLongLong:(void)__p];
        [(NSMutableDictionary *)v132 setObject:v131 forKeyedSubscript:v133];

        [v131 setEncoderFunctionIndex:*(unsigned int *)((char *)&v490->super.super.super.super.isa + (int)*MEMORY[0x263F3F988])];
        [v131 setFilteredGenerationOptions:v474];
        v134 = objc_opt_new();
        [v131 setEncoderStateFunctionIndexes:v134];

        v135 = v131;
      }
      else
      {
        v135 = v466;
      }
      v456 = v135;
      v442 = [v135 filteredGenerationOptions];
      uint64_t v216 = [v442 count];
      BOOL v217 = v462;
      if (!v452) {
        BOOL v217 = 0;
      }
      if (v217)
      {
        int v218 = **(_DWORD **)((char *)&v490->super.super.super.super.isa + v450);
        if (IsFuncEnumPixelHistoryInterestingRenderPassStateItems(v218))
        {
          uint64_t v219 = objc_opt_new();
          uint64_t v220 = **(unsigned int **)((char *)&v490->super.super.super.super.isa + v450);
          switch(v220)
          {
            case 0xFFFFC072:
              uint64_t v220 = 4294951219;
              break;
            case 0xFFFFC077:
              uint64_t v220 = 4294951220;
              break;
            case 0xFFFFC083:
              uint64_t v220 = 4294951077;
              break;
          }
          v441 = (void *)v219;
          v333 = [v456 encoderStateFunctionIndexes];
          v334 = [NSNumber numberWithUnsignedInt:v220];
          v439 = [v333 objectForKeyedSubscript:v334];

          if (v439)
          {
            v335 = v441;
            unint64_t v336 = [v439 unsignedLongValue];
            unsigned int v337 = [v456 lastInterestingFunctionIndex];
            uint64_t v338 = *MEMORY[0x263F3FDB0];
            if (v336 <= v337)
            {
LABEL_434:
              v340 = [v452 objectForKeyedSubscript:v338];
              uint64_t v341 = (int)*MEMORY[0x263F3F988];
              v342 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&v490->super.super.super.super.isa + v341)];
              [v340 setObject:v335 forKeyedSubscript:v342];

              uint64_t v343 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&v490->super.super.super.super.isa + v341)];
              v447 = [v456 encoderStateFunctionIndexes];
              v344 = [NSNumber numberWithUnsignedInt:v220];
              [v447 setObject:v343 forKeyedSubscript:v344];
              v435 = (void *)v343;
LABEL_572:

              v262 = v441;
LABEL_573:

              goto LABEL_574;
            }
            v339 = [v452 objectForKeyedSubscript:*MEMORY[0x263F3FDB0]];
            [v339 removeObjectForKey:v439];
          }
          else
          {
            uint64_t v338 = *MEMORY[0x263F3FDB0];
          }
          v335 = v441;
          goto LABEL_434;
        }
        if (v218 == -16246)
        {
          long long v509 = 0u;
          long long v510 = 0u;
          long long v507 = 0u;
          long long v508 = 0u;
          v260 = [v456 encoderStateFunctionIndexes];
          v261 = [v260 allKeys];

          v262 = v261;
          uint64_t v263 = [v261 countByEnumeratingWithState:&v507 objects:v565 count:16];
          if (v263)
          {
            uint64_t v264 = *(void *)v508;
            uint64_t v265 = *MEMORY[0x263F3FDB0];
            do
            {
              for (uint64_t n = 0; n != v263; ++n)
              {
                if (*(void *)v508 != v264) {
                  objc_enumerationMutation(v261);
                }
                uint64_t v267 = *(void *)(*((void *)&v507 + 1) + 8 * n);
                v268 = [v456 encoderStateFunctionIndexes];
                v269 = [v268 objectForKeyedSubscript:v267];

                unint64_t v270 = [v269 unsignedLongValue];
                if (v270 > [v456 lastInterestingFunctionIndex])
                {
                  v271 = [v452 objectForKeyedSubscript:v265];
                  [v271 removeObjectForKey:v269];
                }
              }
              v262 = v261;
              uint64_t v263 = [v261 countByEnumeratingWithState:&v507 objects:v565 count:16];
            }
            while (v263);
          }
          goto LABEL_573;
        }
      }
      if (v216)
      {
        if (**(_DWORD **)((char *)&v490->super.super.super.super.isa + v450) == -16353)
        {
          v272 = objc_opt_new();

          v273 = [(NSMutableDictionary *)v490->_pixelHistory objectForKeyedSubscript:*MEMORY[0x263F3FDD8]];
          v274 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&v490->super.super.super.super.isa + (int)*MEMORY[0x263F3F988])];
          [v273 setObject:v272 forKeyedSubscript:v274];

          v275 = objc_opt_new();
          [v272 setObject:v275 forKeyedSubscript:*MEMORY[0x263F3FDB0]];

          v276 = objc_opt_new();
          uint64_t v472 = *MEMORY[0x263F3FDC0];
          objc_msgSend(v272, "setObject:forKeyedSubscript:", v276);

          v277 = objc_opt_new();
          uint64_t v468 = *MEMORY[0x263F3FDD0];
          objc_msgSend(v272, "setObject:forKeyedSubscript:", v277);

          v278 = objc_opt_new();
          uint64_t v464 = *MEMORY[0x263F3FDC8];
          objc_msgSend(v272, "setObject:forKeyedSubscript:", v278);

          long long v505 = 0u;
          long long v506 = 0u;
          long long v503 = 0u;
          long long v504 = 0u;
          id v475 = v442;
          uint64_t v279 = [v475 countByEnumeratingWithState:&v503 objects:v564 count:16];
          if (v279)
          {
            uint64_t v280 = *(void *)v504;
            do
            {
              for (iuint64_t i = 0; ii != v279; ++ii)
              {
                if (*(void *)v504 != v280) {
                  objc_enumerationMutation(v475);
                }
                uint64_t v282 = *(void *)(*((void *)&v503 + 1) + 8 * ii);
                v283 = [v475 objectForKeyedSubscript:v282];
                v284 = [v283 texture];
                uint64_t v285 = [(DYMTLFunctionPlayer *)v490 keyForOriginalObject:v284 inverseObjectMap:&v490->_pixelHistoryInverseObjectMap];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
                v287 = @"Color";
                if ((isKindOfClass & 1) == 0)
                {
                  objc_opt_class();
                  char v288 = objc_opt_isKindOfClass();
                  v287 = @"Depth";
                  if ((v288 & 1) == 0)
                  {
                    objc_opt_class();
                    char v289 = objc_opt_isKindOfClass();
                    v287 = @"Stencil";
                    if ((v289 & 1) == 0) {
                      v287 = 0;
                    }
                  }
                }
                v290 = [NSString stringWithFormat:@"%@.%llu", v287, v285];
                v291 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v283, "loadAction"));
                v292 = [v272 objectForKeyedSubscript:v472];
                [v292 setObject:v291 forKeyedSubscript:v290];

                v293 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v283, "storeAction"));
                v294 = [v272 objectForKeyedSubscript:v468];
                [v294 setObject:v293 forKeyedSubscript:v290];

                v295 = [v272 objectForKeyedSubscript:v464];
                [v295 setObject:v282 forKeyedSubscript:v290];
              }
              uint64_t v279 = [v475 countByEnumeratingWithState:&v503 objects:v564 count:16];
            }
            while (v279);
          }

          v452 = v272;
        }
        v296 = [v443 commandBuffer];
        uint64_t v438 = (int)*MEMORY[0x263F3F988];
        v297 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.dt.gputrace-replayer.pixel-history-contd-after-%u", *(unsigned int *)((char *)&v490->super.super.super.super.isa + v438));
        v441 = v296;
        [v296 setLabel:v297];

        for (juint64_t j = 0; jj != 8; ++jj)
        {
          v299 = [v486 colorAttachments];
          v300 = [v299 objectAtIndexedSubscript:jj];

          [(DYMTLCommonDebugFunctionPlayer *)v490 _updateMemorylessTextures:v300];
          [v300 setResolveTexture:0];
          [v300 setLoadAction:1];
          if ([v300 storeAction] != 4) {
            [v300 setStoreAction:1];
          }
        }
        v301 = [v486 depthAttachment];
        [(DYMTLCommonDebugFunctionPlayer *)v490 _updateMemorylessTextures:v301];
        [v301 setResolveTexture:0];
        [v301 setLoadAction:1];
        if ([v301 storeAction] != 4) {
          [v301 setStoreAction:1];
        }

        v302 = [v486 stencilAttachment];
        [(DYMTLCommonDebugFunctionPlayer *)v490 _updateMemorylessTextures:v302];
        [v302 setResolveTexture:0];
        [v302 setLoadAction:1];
        if ([v302 storeAction] != 4) {
          [v302 setStoreAction:1];
        }

        uint64_t v303 = DYMTLNewStatefulRenderCommandEncoder(v296, v486);
        [(DYMTLCommonDebugFunctionPlayer *)v490 encodeStoreActionForRenderCommandEncoder:v303 withDescriptor:v486];
        v502[0] = MEMORY[0x263EF8330];
        v502[1] = 3221225472;
        v502[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_4;
        v502[3] = &unk_265338F78;
        v502[4] = v490;
        [v445 applyAllStateToEncoder:v303 rawBytesBlock:v502];
        [v445 endEncoding];
        [v454 commit];
        [v454 waitUntilCompleted];
        v304 = (void *)MEMORY[0x263F53640];
        v305 = [(DYMTLFunctionPlayer *)v490 device];
        v439 = (void *)v303;
        v435 = [v304 forDevice:v305];

        v447 = objc_opt_new();
        v473 = objc_opt_new();
        objc_msgSend(v447, "setObject:forKeyedSubscript:");
        v307 = (GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa + v450);
        if (v307 != -16353 && GPUTools::MTL::IsFuncEnumDrawCall(v307))
        {
          if ([(DYMTLDebugWireframeRenderer *)v490->_wireframeRenderer currentRenderPipelineHasBufferOrTextureReadWrite:(void)__p])
          {
            v308 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE48]];
            [v447 setObject:v308 forKeyedSubscript:*MEMORY[0x263F3FDE0]];
          }
          else
          {
            v345 = [v443 commandBuffer];

            v346 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.dt.gputrace-replayer.pixel-history-total-draws-%u", *(unsigned int *)((char *)&v490->super.super.super.super.isa + v438));
            [v345 setLabel:v346];

            [(DYMTLPixelHistoryDrawStatsSupport *)v490->_pixelHistoryDrawStatsRenderer prepareWithCommandEncoderId:(void)__p parallelEncoderId:0 pipelineId:v434 renderPassDescriptor:v444 + 3];
            v501[0] = MEMORY[0x263EF8330];
            v501[1] = 3221225472;
            v501[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_5;
            v501[3] = &unk_2653392C8;
            v501[4] = v490;
            v347 = [(DYMTLCommonDebugFunctionPlayer *)v490 collectPixelDrawStatsTotal:v345 originalPipeline:v440 atX:v479 y:obj draw:v501];
            [v345 commit];
            [v345 waitUntilCompleted];
            [v447 addEntriesFromDictionary:v347];

            id v454 = v345;
          }
        }
        if (**(_DWORD **)((char *)&v490->super.super.super.super.isa + v450) != -16353)
        {
          v348 = [v447 objectForKeyedSubscript:*MEMORY[0x263F3FDE0]];
          BOOL v349 = [v348 longLongValue] == 0;

          v306 = v441;
          v350 = (void *)v303;
          v344 = v473;
          if (v459 && v349) {
            goto LABEL_571;
          }
        }
        int v465 = *((unsigned __int8 *)v444 + 1616);
        objc_msgSend(v443, "commandBuffer", v306);
        id v476 = (id)objc_claimAutoreleasedReturnValue();

        v351 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.dt.gputrace-replayer.pixel-history-blits-n-additional-stats-%u", *(unsigned int *)((char *)&v490->super.super.super.super.isa + v438));
        [v476 setLabel:v351];

        v469 = [(NSMutableDictionary *)v490->_pixelHistory objectForKeyedSubscript:*MEMORY[0x263F3FE38]];
        long long v499 = 0u;
        long long v500 = 0u;
        long long v497 = 0u;
        long long v498 = 0u;
        v352 = [v442 allValues];
        id v455 = v352;
        uint64_t v353 = [v352 countByEnumeratingWithState:&v497 objects:v563 count:16];
        if (v353)
        {
          uint64_t v461 = *(void *)v498;
          do
          {
            for (kuint64_t k = 0; kk != v353; ++kk)
            {
              if (*(void *)v498 != v461) {
                objc_enumerationMutation(v455);
              }
              v355 = *(void **)(*((void *)&v497 + 1) + 8 * kk);
              v356 = [v355 texture];
              uint64_t v357 = [(DYMTLFunctionPlayer *)v490 keyForOriginalObject:v356 inverseObjectMap:&v490->_pixelHistoryInverseObjectMap];
              v358 = (void *)MEMORY[0x263F53638];
              uint64_t v359 = [v355 level];
              uint64_t v360 = [v355 slice];
              uint64_t v361 = [v355 depthPlane];
              v492[0] = MEMORY[0x263EF8330];
              v492[1] = 3221225472;
              v492[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_6;
              v492[3] = &unk_2653392F0;
              id v493 = v469;
              uint64_t v496 = v357;
              id v362 = v356;
              id v494 = v362;
              id v495 = v473;
              LOBYTE(v433) = v465 != 0;
              [v358 pixelValueFromTexture:v362 level:v359 slice:v360 depthPlane:v361 atX:v479 y:obj inCommandBuffer:v476 overHarvestForDepthStencil:v433 completion:v492];
            }
            v352 = v455;
            uint64_t v353 = [v455 countByEnumeratingWithState:&v497 objects:v563 count:16];
          }
          while (v353);
        }

        uint64_t v363 = *MEMORY[0x263F3FDE0];
        v364 = [v447 objectForKeyedSubscript:*MEMORY[0x263F3FDE0]];
        BOOL v365 = [v364 longLongValue] > 0;

        if (v365)
        {
          v491[0] = MEMORY[0x263EF8330];
          v491[1] = 3221225472;
          v491[2] = __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_7;
          v491[3] = &unk_2653392C8;
          v491[4] = v490;
          v366 = v476;
          v367 = [(DYMTLCommonDebugFunctionPlayer *)v490 collectPixelDrawStats:v476 originalEncoderId:(void)__p originalEncoder:v445 originalPipeline:v440 atX:v479 y:obj draw:v491];
        }
        else
        {
          v367 = 0;
          v366 = v476;
        }
        [v366 commit];
        [v366 waitUntilCompleted];
        if (!v367)
        {
          if (GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                                  + v450)))
          {
            [v447 setObject:&unk_2700FA038 forKeyedSubscript:*MEMORY[0x263F3FDA8]];
            [v447 setObject:&unk_2700FA038 forKeyedSubscript:*MEMORY[0x263F3FDB8]];
            [v447 setObject:&unk_2700FA038 forKeyedSubscript:*MEMORY[0x263F3FE18]];
          }
          goto LABEL_558;
        }
        [v447 addEntriesFromDictionary:v367];
        v368 = [v447 objectForKeyedSubscript:*MEMORY[0x263F3FDF8]];
        uint64_t v369 = [v368 longLongValue];

        v370 = [v447 objectForKeyedSubscript:*MEMORY[0x263F3FE08]];
        uint64_t v371 = [v370 longLongValue];

        v372 = [v447 objectForKeyedSubscript:*MEMORY[0x263F3FDE8]];
        uint64_t v373 = [v372 longLongValue];

        v374 = [v447 objectForKeyedSubscript:*MEMORY[0x263F3FE00]];
        uint64_t v375 = [v374 longLongValue];

        v376 = [NSNumber numberWithLongLong:v375];
        [v447 setObject:v376 forKeyedSubscript:*MEMORY[0x263F3FDA8]];

        v377 = [v445 depthStencilState];
        v378 = v377;
        if (!v377
          || (DYMTLGetAssociatedObject(v377, 0),
              id v379 = (id)objc_claimAutoreleasedReturnValue(),
              v379,
              !v379))
        {
          [v447 setObject:&unk_2700FA020 forKeyedSubscript:*MEMORY[0x263F3FDB8]];
          [v447 setObject:&unk_2700FA020 forKeyedSubscript:*MEMORY[0x263F3FE18]];
LABEL_557:

          v366 = v476;
LABEL_558:
          v417 = [v486 stencilAttachment];
          uint64_t v418 = [v417 texture];
          v419 = [v486 depthAttachment];
          uint64_t v420 = [v419 texture];
          if (v418 | v420)
          {
            uint64_t v421 = [v443 commandBuffer];

            v366 = (void *)v421;
            v422 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.dt.gputrace-replayer.pixel-history-save-depth-stencil-%u", *(unsigned int *)((char *)&v490->super.super.super.super.isa + v438));
            [v366 setLabel:v422];

            if (v418)
            {
              LOBYTE(v433) = v465 != 0;
              uint64_t v423 = objc_msgSend(MEMORY[0x263F53638], "pixelValueFromTexture:level:slice:depthPlane:atX:y:inCommandBuffer:overHarvestForDepthStencil:", v418, objc_msgSend(v417, "level"), objc_msgSend(v417, "slice"), objc_msgSend(v417, "depthPlane"), v479, obj, v366, v433);
              pixelHistoryPixelPreviousStencil = v490->_pixelHistoryPixelPreviousStencil;
              v490->_pixelHistoryPixelPreviousStencil = (MTLBuffer *)v423;
            }
            if (v420)
            {
              if (v418 == v420)
              {
                v425 = v490->_pixelHistoryPixelPreviousStencil;
              }
              else
              {
                LOBYTE(v433) = v465 != 0;
                objc_msgSend(MEMORY[0x263F53638], "pixelValueFromTexture:level:slice:depthPlane:atX:y:inCommandBuffer:overHarvestForDepthStencil:", v420, objc_msgSend(v419, "level"), objc_msgSend(v419, "slice"), objc_msgSend(v419, "depthPlane"), v479, obj, v366, v433);
                v425 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
              }
              pixelHistoryPixelPreviousDepth = v490->_pixelHistoryPixelPreviousDepth;
              v490->_pixelHistoryPixelPreviousDepth = v425;
            }
            [v366 commit];
            [v366 waitUntilCompleted];
          }

          [v456 setLastInterestingFunctionIndex:*(unsigned int *)((char *)&v490->super.super.super.super.isa + v438)];
          v427 = [v452 objectForKeyedSubscript:*MEMORY[0x263F3FDB0]];
          v428 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&v490->super.super.super.super.isa + v438)];
          [v427 setObject:v447 forKeyedSubscript:v428];

          if (v436)
          {
            v429 = [v447 objectForKeyedSubscript:v363];
            uint64_t v430 = [v429 longLongValue];

            if (v430 >= 1)
            {
              v431 = [(DYMTLCommonDebugFunctionPlayer *)v490 generatePerPrimitiveHistory:v430 commandQueue:v443 currentEncoderId:(void)__p originalEncoder:v445 originalPipeline:v440 atX:v479 y:obj];
              [v447 setObject:v431 forKeyedSubscript:*MEMORY[0x263F3FE10]];
            }
          }

          v344 = v473;
          id v454 = v366;
          v306 = v441;
          v350 = v439;
LABEL_571:
          [(DYMTLFunctionPlayer *)v490 setObject:v306 forKey:v437];
          [(DYMTLFunctionPlayer *)v490 setObject:v350 forKey:(void)__p];
          goto LABEL_572;
        }
        if ([v379 isDepthWriteEnabled])
        {
          v380 = [NSNumber numberWithLongLong:v375];
          [v447 setObject:v380 forKeyedSubscript:*MEMORY[0x263F3FDB8]];
        }
        else
        {
          [v447 setObject:&unk_2700FA020 forKeyedSubscript:*MEMORY[0x263F3FDB8]];
        }
        uint64_t v387 = *MEMORY[0x263F3FE48];
        if ((v369 | v371) < 0) {
          uint64_t v388 = v387;
        }
        else {
          uint64_t v388 = v371 < v369;
        }
        if ((v371 | v373) < 0) {
          uint64_t v389 = v387;
        }
        else {
          uint64_t v389 = v373 < v371;
        }
        if (v375 < 0)
        {
          if (v375 == *MEMORY[0x263F3FE40])
          {
            uint64_t v375 = 1;
          }
          else if (v375 == v387)
          {
            uint64_t v375 = 0xFFFFFFFFLL;
          }
          else
          {
            uint64_t v375 = 0;
          }
        }
        v405 = [v379 frontFaceStencil];
        if ([v405 stencilFailureOperation])
        {
        }
        else
        {
          v406 = [v379 backFaceStencil];
          BOOL v407 = [v406 stencilFailureOperation] == 0;

          if (v407) {
            uint64_t v388 = 0;
          }
        }
        v408 = [v379 frontFaceStencil];
        if ([v408 depthFailureOperation])
        {
        }
        else
        {
          v409 = [v379 backFaceStencil];
          BOOL v410 = [v409 depthFailureOperation] == 0;

          if (v410) {
            goto LABEL_545;
          }
        }
        if (v388)
        {
          if ((int)v389 > 0 && (int)v388 < 0) {
            uint64_t v388 = 1;
          }
          else {
            uint64_t v388 = v388;
          }
        }
        else
        {
          uint64_t v388 = v389;
        }
LABEL_545:
        v412 = [v379 frontFaceStencil];
        if ([v412 depthStencilPassOperation])
        {
        }
        else
        {
          v413 = [v379 backFaceStencil];
          BOOL v414 = [v413 depthStencilPassOperation] == 0;

          if (v414)
          {
LABEL_556:
            v416 = [NSNumber numberWithInt:v388];
            [v447 setObject:v416 forKeyedSubscript:*MEMORY[0x263F3FE18]];

            goto LABEL_557;
          }
        }
        if (v388)
        {
          if ((int)v375 > 0 && (int)v388 < 0) {
            uint64_t v388 = 1;
          }
          else {
            uint64_t v388 = v388;
          }
        }
        else
        {
          uint64_t v388 = v375;
        }
        goto LABEL_556;
      }
LABEL_574:

      int v49 = 0;
LABEL_218:

LABEL_219:
LABEL_220:

      uint64_t v35 = context;
LABEL_221:
      if ((v49 | 2) == 2)
      {
LABEL_331:
        uint64_t v253 = (int)*MEMORY[0x263F3F9A8];
        if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                   + v253)) & 1) != 0
          || (GPUTools::MTL::IsFuncEnumComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                      + v253)) & 1) != 0
          || GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&v490->super.super.super.super.isa
                                                                                                + v253)))
        {
          objc_msgSend(v489, "setExecutedDrawCallCount:", objc_msgSend(v489, "executedDrawCallCount") + 1);
        }
      }
LABEL_335:

      return;
    default:
      [(DYMTLCommonDebugFunctionPlayer *)v2 _executeGraphicsFunction];
      if (![(DYMTLCommonDebugFunctionPlayer *)v2 shouldExecuteGraphicsFunction]) {
        goto LABEL_331;
      }
      goto LABEL_120;
  }
}

uint64_t __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    int v8 = +[DYMTLFunctionPlayer tileBytesKeyAtIndex:a4];
    return [v7 tileBytesForKey:v8];
  }
  else if (a2 == 1)
  {
    BOOL v9 = *(void **)(a1 + 32);
    long long v10 = +[DYMTLFunctionPlayer fragmentBytesKeyAtIndex:a4];
    return [v9 fragmentBytesForKey:v10];
  }
  else if (a2)
  {
    return 0;
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    int v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
    return [v4 vertexBytesForKey:v5];
  }
}

void __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_2(uint64_t a1, void *a2)
{
  v17[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 4176) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v4) {
    uint64_t v4 = objc_opt_new();
  }
  int v5 = [NSNumber numberWithUnsignedLong:v3];
  uint64_t v6 = *MEMORY[0x263F3FEC8];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F3FEC8]];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "pixelFormat"));
  uint64_t v8 = *MEMORY[0x263F3FC30];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x263F3FC30]];

  uint64_t v9 = *MEMORY[0x263F3FED8];
  long long v10 = [v4 objectForKeyedSubscript:*MEMORY[0x263F3FED8]];
  if (!v10) {
    long long v10 = objc_opt_new();
  }
  v16[0] = v6;
  id v11 = [NSNumber numberWithUnsignedLong:v3];
  v16[1] = v8;
  v17[0] = v11;
  BOOL v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "pixelFormat"));
  v17[1] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v10 setObject:v13 forKeyedSubscript:*(void *)(a1 + 56)];

  [v4 setObject:v10 forKeyedSubscript:v9];
  [*(id *)(*(void *)(a1 + 32) + 4176) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
  int32x2_t v14 = (void *)sThumbnailTextures;
  int v15 = [NSNumber numberWithUnsignedLong:v3];
  [v14 setObject:v3 forKey:v15];
}

void __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    [v7 GPUStartTime];
    double v5 = v4;
    [v7 GPUEndTime];
    [v3 addCommandBufferDurationStart:v5 andEnd:v6];
  }
}

uint64_t __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 == 2)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = +[DYMTLFunctionPlayer tileBytesKeyAtIndex:a4];
    return [v7 tileBytesForKey:v8];
  }
  else if (a2 == 1)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    long long v10 = +[DYMTLFunctionPlayer fragmentBytesKeyAtIndex:a4];
    return [v9 fragmentBytesForKey:v10];
  }
  else if (a2)
  {
    return 0;
  }
  else
  {
    double v4 = *(void **)(a1 + 32);
    double v5 = +[DYMTLFunctionPlayer vertexBytesKeyAtIndex:a4];
    return [v4 vertexBytesForKey:v5];
  }
}

id __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_5(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  return objc_msgSendSuper2(&v2, sel_executeGraphicsFunction);
}

void __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_6(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = *(void **)(a1 + 32);
  double v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  double v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = *MEMORY[0x263F3FE30];
  }
  else
  {
    double v5 = objc_opt_new();
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    [v7 setObject:v5 forKeyedSubscript:v8];

    uint64_t v9 = objc_opt_new();
    uint64_t v6 = *MEMORY[0x263F3FE30];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x263F3FE30]];
    long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "pixelFormat"));
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F3FC30]];

    id v11 = [*(id *)(a1 + 40) label];
    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x263F3FE20]];
  }
  BOOL v12 = [v5 objectForKeyedSubscript:v6];
  [v12 addObject:v17];
  uint64_t v13 = [v12 indexOfObject:v17];
  int32x2_t v14 = [NSNumber numberWithUnsignedInteger:v13];
  int v15 = *(void **)(a1 + 48);
  unint64_t v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  [v15 setObject:v14 forKeyedSubscript:v16];
}

id __57__DYMTLCommonDebugFunctionPlayer_executeGraphicsFunction__block_invoke_7(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  return objc_msgSendSuper2(&v2, sel_executeGraphicsFunction);
}

- (id)collectPixelDrawStatsTotal:(id)a3 originalPipeline:(id)a4 atX:(unint64_t)a5 y:(unint64_t)a6 draw:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  int32x2_t v14 = (void (**)(void))a7;
  int v15 = objc_opt_new();
  if ([(DYMTLPixelHistoryDrawStatsSupport *)self->_pixelHistoryDrawStatsRenderer createNumTotalRenderCommandEncoderInCommandBuffer:v12 originalPipeline:v13])
  {
    v14[2](v14);
    pixelHistoryDrawStatsRenderer = self->_pixelHistoryDrawStatsRenderer;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __89__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStatsTotal_originalPipeline_atX_y_draw___block_invoke;
    v19[3] = &unk_265339318;
    id v20 = v15;
    [(DYMTLPixelHistoryDrawStatsSupport *)pixelHistoryDrawStatsRenderer collectPixelHistoryStencilDrawStatsAtX:a5 y:a6 completion:v19];
  }
  else
  {
    id v17 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE48]];
    [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x263F3FDE0]];
  }
  return v15;
}

void __89__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStatsTotal_originalPipeline_atX_y_draw___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithUnsignedLongLong:a2];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

- (id)collectPixelDrawStats:(id)a3 originalEncoderId:(unint64_t)a4 originalEncoder:(id)a5 originalPipeline:(id)a6 atX:(unint64_t)a7 y:(unint64_t)a8 draw:(id)a9
{
  id v68 = a3;
  id v15 = a5;
  id v65 = a6;
  uint64_t v60 = v15;
  id v61 = (void (**)(void))a9;
  id v67 = (id)objc_opt_new();
  uint64_t v16 = [v15 descriptor];
  id v17 = (void *)MEMORY[0x263F53640];
  id v66 = (void *)v16;
  uint64_t v18 = [(DYMTLFunctionPlayer *)self device];
  int v59 = [v17 forDevice:v18];

  if ([(DYMTLPixelHistoryDrawStatsSupport *)self->_pixelHistoryDrawStatsRenderer createNumFragmentPassesRenderCommandEncoderInCommandBuffer:v68 originalRenderPassDescriptor:v66 originalPipeline:v65])
  {
    objc_super v19 = [(DYMTLFunctionPlayer *)self objectForKey:a4];
    v90[0] = 0;
    v90[1] = 0;
    v90[2] = [v19 width];
    v90[3] = [v19 height];
    [v19 setScissorRect:v90];
    v61[2]();
    pixelHistoryDrawStatsRenderer = self->_pixelHistoryDrawStatsRenderer;
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke;
    v88[3] = &unk_265339318;
    id v89 = v67;
    [(DYMTLPixelHistoryDrawStatsSupport *)pixelHistoryDrawStatsRenderer collectPixelHistoryStencilDrawStatsAtX:a7 y:a8 completion:v88];
  }
  else
  {
    uint64_t v21 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE48]];
    [v67 setObject:v21 forKeyedSubscript:*MEMORY[0x263F3FDF0]];
  }
  if ([(DYMTLPixelHistoryDrawStatsSupport *)self->_pixelHistoryDrawStatsRenderer createNumFragmentPassesRenderCommandEncoderInCommandBuffer:v68 originalRenderPassDescriptor:v66 originalPipeline:v65])
  {
    v61[2]();
    uint64_t v22 = self->_pixelHistoryDrawStatsRenderer;
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_2;
    v86[3] = &unk_265339318;
    id v87 = v67;
    [(DYMTLPixelHistoryDrawStatsSupport *)v22 collectPixelHistoryStencilDrawStatsAtX:a7 y:a8 completion:v86];
    v23 = v87;
  }
  else
  {
    v23 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE48]];
    [v67 setObject:v23 forKeyedSubscript:*MEMORY[0x263F3FDF8]];
  }

  v24 = [v60 depthStencilState];
  BOOL v58 = v24;
  if (v24)
  {
    uint64_t v63 = DYMTLGetAssociatedObject(v24, 0);
  }
  else
  {
    uint64_t v63 = 0;
  }
  v64 = [v66 stencilAttachment];
  uint64_t v62 = [v66 depthAttachment];
  uint64_t v25 = [v64 texture];
  if (v25)
  {
    unint64_t v26 = [v63 frontFaceStencil];
    if ([v26 stencilCompareFunction] == 7)
    {
      int v27 = [v63 backFaceStencil];
      BOOL v28 = [v27 stencilCompareFunction] == 7;
    }
    else
    {
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 1;
  }

  unint64_t v29 = [v62 texture];
  if (v29) {
    BOOL v30 = [v63 depthCompareFunction] == 7;
  }
  else {
    BOOL v30 = 1;
  }

  uint64_t v31 = [(DYMTLFunctionPlayer *)self device];
  if ([v31 supportsFamily:3002])
  {
  }
  else
  {
    v32 = [(DYMTLFunctionPlayer *)self device];
    int v33 = [v32 supportsFamily:3003];

    if (!v33)
    {
      uint64_t v34 = 1;
      if (v28) {
        goto LABEL_23;
      }
LABEL_28:
      if (v30)
      {
        v45 = (void *)MEMORY[0x263F53638];
        v46 = [(DYMTLPixelHistoryDrawStatsSupport *)self->_pixelHistoryDrawStatsRenderer mockStencilTexture];
        objc_msgSend(v45, "pixelValueToTexture:buffer:level:slice:depthPlane:atX:y:inCommandBuffer:", v46, self->_pixelHistoryPixelPreviousStencil, objc_msgSend(v64, "level"), objc_msgSend(v64, "slice"), objc_msgSend(v64, "depthPlane"), a7, a8, v68);

        uint64_t v47 = self->_pixelHistoryDrawStatsRenderer;
        uint64_t v48 = [(DYMTLPixelHistoryDrawStatsSupport *)v47 mockStencilTexture];
        BOOL v49 = [(DYMTLPixelHistoryDrawStatsSupport *)v47 createNumVisibleRenderCommandEncoderInCommandBuffer:v68 originalRenderPassDescriptor:v66 originalPipeline:v65 depthStencilDescriptor:v63 mockStencilTexture:v48 visibilityResultMode:v34 atX:a7 y:a8];

        if (v49)
        {
          v61[2]();
          int v50 = self->_pixelHistoryDrawStatsRenderer;
          v76[0] = MEMORY[0x263EF8330];
          v76[1] = 3221225472;
          v76[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_6;
          v76[3] = &unk_265339340;
          uint64_t v78 = v34;
          id v77 = v67;
          [(DYMTLPixelHistoryDrawStatsSupport *)v50 collectPixelHistoryVisibilityDrawStatsAtCompletion:v76];
          uint64_t v51 = v77;
        }
        else
        {
          uint64_t v51 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE48]];
          [v67 setObject:v51 forKeyedSubscript:*MEMORY[0x263F3FE08]];
        }
        unsigned int v36 = v60;
        v37 = v66;
        v54 = v58;

        v74[0] = MEMORY[0x263EF8330];
        v74[1] = 3221225472;
        v74[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_7;
        v74[3] = &unk_2653392A0;
        id v75 = v67;
        [v68 addCompletedHandler:v74];
        uint64_t v35 = v75;
        goto LABEL_40;
      }
      uint64_t v35 = [(DYMTLPixelHistoryDrawStatsSupport *)self->_pixelHistoryDrawStatsRenderer mockStencilTexture];
      objc_msgSend(MEMORY[0x263F53638], "pixelValueToTexture:buffer:level:slice:depthPlane:atX:y:inCommandBuffer:", v35, self->_pixelHistoryPixelPreviousStencil, objc_msgSend(v64, "level"), objc_msgSend(v64, "slice"), objc_msgSend(v64, "depthPlane"), a7, a8, v68);
      if ([(DYMTLPixelHistoryDrawStatsSupport *)self->_pixelHistoryDrawStatsRenderer createNumVisibleRenderCommandEncoderInCommandBuffer:v68 originalRenderPassDescriptor:v66 originalPipeline:v65 depthStencilDescriptor:v63 mockDepthStencilTexture:v35 visibilityResultMode:v34 atX:a7 y:a8])
      {
        v61[2]();
        v52 = self->_pixelHistoryDrawStatsRenderer;
        v71[0] = MEMORY[0x263EF8330];
        v71[1] = 3221225472;
        v71[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_8;
        v71[3] = &unk_265339340;
        uint64_t v73 = v34;
        id v72 = v67;
        [(DYMTLPixelHistoryDrawStatsSupport *)v52 collectPixelHistoryVisibilityDrawStatsAtCompletion:v71];
        v53 = v72;
      }
      else
      {
        v53 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE48]];
        [v67 setObject:v53 forKeyedSubscript:*MEMORY[0x263F3FE00]];
      }
      v37 = v66;

      v69[0] = MEMORY[0x263EF8330];
      v69[1] = 3221225472;
      v69[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_9;
      v69[3] = &unk_2653392A0;
      id v70 = v67;
      [v68 addCompletedHandler:v69];

      unsigned int v36 = v60;
      goto LABEL_35;
    }
  }
  uint64_t v34 = 2;
  if (!v28) {
    goto LABEL_28;
  }
LABEL_23:
  if (!v30)
  {
    v38 = (void *)MEMORY[0x263F53638];
    id v39 = [(DYMTLPixelHistoryDrawStatsSupport *)self->_pixelHistoryDrawStatsRenderer mockDepthTexture];
    objc_msgSend(v38, "pixelValueToTexture:buffer:level:slice:depthPlane:atX:y:inCommandBuffer:", v39, self->_pixelHistoryPixelPreviousDepth, objc_msgSend(v62, "level"), objc_msgSend(v62, "slice"), objc_msgSend(v62, "depthPlane"), a7, a8, v68);

    v40 = self->_pixelHistoryDrawStatsRenderer;
    uint64_t v41 = [(DYMTLPixelHistoryDrawStatsSupport *)v40 mockDepthTexture];
    BOOL v42 = [(DYMTLPixelHistoryDrawStatsSupport *)v40 createNumVisibleRenderCommandEncoderInCommandBuffer:v68 originalRenderPassDescriptor:v66 originalPipeline:v65 depthStencilDescriptor:v63 mockDepthTexture:v41 visibilityResultMode:v34 atX:a7 y:a8];

    if (v42)
    {
      v61[2]();
      v43 = self->_pixelHistoryDrawStatsRenderer;
      v81[0] = MEMORY[0x263EF8330];
      v81[1] = 3221225472;
      v81[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_4;
      v81[3] = &unk_265339340;
      uint64_t v83 = v34;
      id v82 = v67;
      [(DYMTLPixelHistoryDrawStatsSupport *)v43 collectPixelHistoryVisibilityDrawStatsAtCompletion:v81];
      uint64_t v44 = v82;
    }
    else
    {
      uint64_t v55 = *MEMORY[0x263F3FE48];
      uint64_t v56 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE48]];
      [v67 setObject:v56 forKeyedSubscript:*MEMORY[0x263F3FDE8]];

      uint64_t v44 = [NSNumber numberWithLongLong:v55];
      [v67 setObject:v44 forKeyedSubscript:*MEMORY[0x263F3FE00]];
    }
    unsigned int v36 = v60;
    v37 = v66;
    v54 = v58;

    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_5;
    v79[3] = &unk_2653392A0;
    id v80 = v67;
    [v68 addCompletedHandler:v79];
    uint64_t v35 = v80;
    goto LABEL_40;
  }
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_3;
  v84[3] = &unk_2653392A0;
  id v85 = v67;
  [v68 addCompletedHandler:v84];
  uint64_t v35 = v85;
  unsigned int v36 = v60;
  v37 = v66;
LABEL_35:
  v54 = v58;
LABEL_40:

  return v67;
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithUnsignedLongLong:a2];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [NSNumber numberWithUnsignedLongLong:a2];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F3FDF8]];
  uint64_t v3 = *MEMORY[0x263F3FE08];
  id v4 = (id)v2;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (!a2 || *(void *)(a1 + 40) == 2)
  {
    id v7 = [NSNumber numberWithUnsignedLongLong:a2];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

    id v6 = [NSNumber numberWithUnsignedLongLong:a2];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  else
  {
    uint64_t v4 = *MEMORY[0x263F3FE40];
    id v5 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE40]];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

    id v6 = [NSNumber numberWithLongLong:v4];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F3FDF8]];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (!a2 || *(void *)(a1 + 40) == 2)
  {
    id v3 = [NSNumber numberWithUnsignedLongLong:a2];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  else
  {
    id v3 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE40]];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263F3FE08];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F3FE08]];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v2];
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_8(uint64_t a1, uint64_t a2)
{
  if (!a2 || *(void *)(a1 + 40) == 2)
  {
    id v3 = [NSNumber numberWithUnsignedLongLong:a2];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  else
  {
    id v3 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE40]];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
}

void __118__DYMTLCommonDebugFunctionPlayer_collectPixelDrawStats_originalEncoderId_originalEncoder_originalPipeline_atX_y_draw___block_invoke_9(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F3FE00]];
  uint64_t v2 = *MEMORY[0x263F3FDF8];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F3FDF8]];
  int v4 = [v6 isEqualToNumber:v3];

  if (v4)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v2];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

    [*(id *)(a1 + 32) objectForKeyedSubscript:v2];
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263F3FE48];
    id v9 = [NSNumber numberWithLongLong:*MEMORY[0x263F3FE48]];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");

    [NSNumber numberWithLongLong:v5];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
}

- (id)generatePerPrimitiveHistory:(unint64_t)a3 commandQueue:(id)a4 currentEncoderId:(unint64_t)a5 originalEncoder:(id)a6 originalPipeline:(id)a7 atX:(unint64_t)a8 y:(unint64_t)a9
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = v17;
  uint64_t v19 = *(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8]);
  if (*(_DWORD *)v19 == -16250)
  {
    id v20 = [(DYMTLCommonDebugFunctionPlayer *)self generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:**(void **)(v19 + 72) vertexStart:**(void **)(v19 + 96) vertexCount:**(void **)(v19 + 120) total:a3 commandQueue:v15 currentEncoderId:a5 originalEncoder:v16 originalPipeline:v17 atX:a8 y:a9];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:(unint64_t)a3 vertexStart:(unint64_t)a4 vertexCount:(unint64_t)a5 total:(unint64_t)a6 commandQueue:(id)a7 currentEncoderId:(unint64_t)a8 originalEncoder:(id)a9 originalPipeline:(id)a10 atX:(unint64_t)a11 y:(unint64_t)a12
{
  uint64_t v18 = a9;
  v45[1] = *MEMORY[0x263EF8340];
  id v39 = a7;
  id v38 = a9;
  id v40 = a10;
  if (!a6)
  {
    uint64_t v18 = objc_opt_new();
    goto LABEL_24;
  }
  if (a3 != 3) {
    goto LABEL_24;
  }
  if (a5 == 3)
  {
    uint64_t v19 = (void *)MEMORY[0x263EFF9A0];
    v45[0] = *MEMORY[0x263F3FDE0];
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
    v37 = [v19 dictionaryWithObjects:&unk_2700FA068 forKeys:v20];

    uint64_t v21 = NSDictionary;
    uint64_t v44 = v37;
    uint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    unsigned int v36 = [NSNumber numberWithUnsignedInteger:a4];
    v43 = v36;
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    uint64_t v18 = [v21 dictionaryWithObjects:v35 forKeys:v22];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
    v37 = [v39 commandBuffer];
    unint64_t v23 = (unint64_t)(double)(a5 / 6);
    uint64_t v24 = 3 * v23;
    if (v23)
    {
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __200__DYMTLCommonDebugFunctionPlayer_generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount_vertexStart_vertexCount_total_commandQueue_currentEncoderId_originalEncoder_originalPipeline_atX_y___block_invoke;
      v42[3] = &unk_265339368;
      v42[4] = self;
      v42[5] = a8;
      v42[6] = 3;
      v42[7] = a4;
      v42[8] = 3 * v23;
      uint64_t v35 = [(DYMTLCommonDebugFunctionPlayer *)self collectPixelDrawStatsTotal:v37 originalPipeline:v40 atX:a11 y:a12 draw:v42];
    }
    else
    {
      uint64_t v35 = 0;
    }
    unint64_t v33 = a5 - v24;
    unint64_t v34 = v24 + a4;
    if (a5 == v24)
    {
      unsigned int v36 = 0;
      uint64_t v25 = v37;
    }
    else
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __200__DYMTLCommonDebugFunctionPlayer_generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount_vertexStart_vertexCount_total_commandQueue_currentEncoderId_originalEncoder_originalPipeline_atX_y___block_invoke_2;
      v41[3] = &unk_265339368;
      v41[4] = self;
      v41[5] = a8;
      v41[6] = 3;
      v41[7] = v24 + a4;
      v41[8] = a5 - v24;
      uint64_t v25 = v37;
      unsigned int v36 = [(DYMTLCommonDebugFunctionPlayer *)self collectPixelDrawStatsTotal:v37 originalPipeline:v40 atX:a11 y:a12 draw:v41];
    }
    [v25 commit];
    [v25 waitUntilCompleted];
    unint64_t v26 = (void *)MEMORY[0x263F3FDE0];
    if (v35)
    {
      int v27 = [v35 objectForKeyedSubscript:*MEMORY[0x263F3FDE0]];
      uint64_t v28 = [v27 longLongValue];
    }
    else
    {
      uint64_t v28 = 0;
    }
    if (v36)
    {
      unint64_t v29 = [v36 objectForKeyedSubscript:*v26];
      uint64_t v30 = [v29 longLongValue];
    }
    else
    {
      uint64_t v30 = 0;
    }
    if (v28 >= 1)
    {
      uint64_t v31 = [(DYMTLCommonDebugFunctionPlayer *)self generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:3 vertexStart:a4 vertexCount:v24 total:v28 commandQueue:v39 currentEncoderId:a8 originalEncoder:v38 originalPipeline:v40 atX:a11 y:a12];
      [v18 addEntriesFromDictionary:v31];
    }
    if (v30 < 1) {
      goto LABEL_23;
    }
    uint64_t v22 = [(DYMTLCommonDebugFunctionPlayer *)self generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount:3 vertexStart:v34 vertexCount:v33 total:v30 commandQueue:v39 currentEncoderId:a8 originalEncoder:v38 originalPipeline:v40 atX:a11 y:a12];
    [v18 addEntriesFromDictionary:v22];
  }

LABEL_23:
LABEL_24:

  return v18;
}

void __200__DYMTLCommonDebugFunctionPlayer_generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount_vertexStart_vertexCount_total_commandQueue_currentEncoderId_originalEncoder_originalPipeline_atX_y___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  [v2 drawPrimitives:*(void *)(a1 + 48) vertexStart:*(void *)(a1 + 56) vertexCount:*(void *)(a1 + 64)];
}

void __200__DYMTLCommonDebugFunctionPlayer_generatePerPrimitiveHistory_drawPrimitives_vertexStart_vertexCount_vertexStart_vertexCount_total_commandQueue_currentEncoderId_originalEncoder_originalPipeline_atX_y___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  [v2 drawPrimitives:*(void *)(a1 + 48) vertexStart:*(void *)(a1 + 56) vertexCount:*(void *)(a1 + 64)];
}

- (void)extractIndirectArgumentBuffers
{
  v6[0] = 0;
  v6[1] = 0;
  uint64_t v5 = v6;
  uint64_t v3 = (int)*MEMORY[0x263F3F9A8];
  if ((GPUTools::MTL::IsFuncEnumDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                             + v3)) & 1) != 0
    || (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                                            + v3)) & 1) != 0
    || GPUTools::MTL::IsFuncEnumTileCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                                          + v3)))
  {
    [(DYMTLCommonDebugFunctionPlayer *)self extractRenderIndirectArgumentBuffers:&v5];
  }
  else if ((GPUTools::MTL::IsFuncEnumComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa {
                                                                                     + v3)) & 1) != 0
  }
         || GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa + v3)))
  {
    [(DYMTLCommonDebugFunctionPlayer *)self extractComputeIndirectArgumentBuffers:&v5];
  }
  int v4 = [(DYMTLFunctionPlayer *)self indirectArgumentManager];
  [v4 notifyReplayerTargetIndirectArgumentBuffers:&v5];

  std::__tree<std::__value_type<objc_object  {objcproto9MTLBuffer}*,std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>>,std::__map_value_compare<objc_object  {objcproto9MTLBuffer}*,std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>,std::less<objc_object  {objcproto9MTLBuffer}*>,true>,std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}><std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>>>::destroy((uint64_t)&v5, v6[0]);
}

- (void)extractCommandBufferTranslationData
{
  id v2 = [(DYMTLFunctionPlayer *)self indirectCommandManager];
  [v2 updateReplayerTranslationBuffer];
}

- (void)extractRenderIndirectArgumentBuffers:(void *)a3
{
  v55[0] = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8]) + 48, 0);
  v52[0] = v55;
  id v5 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)[(DYMTLFunctionPlayer *)self objectMap], v55, (uint64_t)&std::piecewise_construct, v52)[3];
  id v6 = [v5 renderPipelineState];
  id v7 = DYMTLGetAssociatedObject(v6, 2u);
  if (v7)
  {
    uint64_t v30 = DYMTLGetNullableAssociatedObject(v6, 0);
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = (void *)0x4812000000;
    v52[3] = __Block_byref_object_copy__4;
    v52[4] = __Block_byref_object_dispose__4;
    v52[5] = "";
    v54[0] = 0;
    v54[1] = 0;
    v53 = v54;
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke;
    v51[3] = &unk_265338FC8;
    v51[4] = v52;
    [v5 enumerateVertexBuffersUsingBlock:v51];
    id v8 = [v7 vertexBindings];
    id v9 = [v8 firstObject];
    if (v9)
    {
      long long v10 = [v8 firstObject];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_21:
        goto LABEL_22;
      }
      id v11 = [v8 firstObject];
      id v12 = [v11 dataTypeDescription];
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
      {
LABEL_22:

        _Block_object_dispose(v52, 8);
        std::__tree<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>>>::destroy((uint64_t)&v53, v54[0]);

        goto LABEL_23;
      }
    }
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_2;
    v47[3] = &unk_265339390;
    BOOL v49 = v52;
    int v50 = a3;
    id v14 = v30;
    id v48 = v14;
    [v8 enumerateObjectsUsingBlock:v47];
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x4812000000;
    v44[3] = __Block_byref_object_copy__4;
    v44[4] = __Block_byref_object_dispose__4;
    v44[5] = "";
    v46[0] = 0;
    v46[1] = 0;
    v45 = v46;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_3;
    v43[3] = &unk_265338FC8;
    v43[4] = v44;
    [v5 enumerateFragmentBuffersUsingBlock:v43];
    uint64_t v28 = a3;
    unint64_t v29 = [v7 fragmentBindings];
    id v15 = [v29 firstObject];
    if (v15)
    {
      id v16 = [v29 firstObject];
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

LABEL_19:
        goto LABEL_20;
      }
      id v17 = [v29 firstObject];
      uint64_t v18 = [v17 dataTypeDescription];
      char v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) == 0)
      {
LABEL_20:

        _Block_object_dispose(v44, 8);
        std::__tree<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>>>::destroy((uint64_t)&v45, v46[0]);
        id v9 = v48;
        goto LABEL_21;
      }
    }
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_4;
    v39[3] = &unk_265339390;
    uint64_t v41 = v44;
    BOOL v42 = v28;
    id v40 = v14;
    [v29 enumerateObjectsUsingBlock:v39];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_18:
      id v15 = v40;
      goto LABEL_19;
    }
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x4812000000;
    v36[3] = __Block_byref_object_copy__4;
    v36[4] = __Block_byref_object_dispose__4;
    v36[5] = "";
    v38[0] = 0;
    v38[1] = 0;
    v37 = v38;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_5;
    v35[3] = &unk_265338FC8;
    v35[4] = v36;
    [v5 enumerateTileBuffersUsingBlock:v35];
    int v27 = DYMTLGetNullableAssociatedObject(v6, 1u);
    id v20 = [v7 tileBindings];
    uint64_t v21 = [v20 firstObject];
    if (!v21) {
      goto LABEL_12;
    }
    uint64_t v22 = [v20 firstObject];
    if (objc_opt_respondsToSelector())
    {
      unint64_t v23 = [v20 firstObject];
      uint64_t v24 = [v23 dataTypeDescription];
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
LABEL_12:
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_6;
        v31[3] = &unk_265339390;
        unint64_t v33 = v36;
        unint64_t v34 = v28;
        id v26 = v27;
        id v32 = v26;
        [v20 enumerateObjectsUsingBlock:v31];

LABEL_17:
        _Block_object_dispose(v36, 8);
        std::__tree<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>>>::destroy((uint64_t)&v37, v38[0]);
        goto LABEL_18;
      }
    }
    else
    {
    }
    goto LABEL_17;
  }
LABEL_23:
}

id *__71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v4 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  unint64_t v7 = a3;
  id v8 = &v7;
  id v5 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v4, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8);
  return DYMTLBoundBufferInfo::operator=((id *)v5 + 5, a2);
}

void __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 type] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v4 = [v3 dataTypeDescription];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v3 dataTypeDescription];
      int v6 = [v5 elementIsArgumentBuffer];

      if (v6)
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        unint64_t v8 = [v3 index];
        id v11 = *(void **)(v7 + 56);
        long long v10 = (void *)(v7 + 56);
        id v9 = v11;
        if (!v11) {
          goto LABEL_16;
        }
        id v12 = v10;
        do
        {
          unint64_t v13 = v9[4];
          BOOL v14 = v13 >= v8;
          if (v13 >= v8) {
            id v15 = v9;
          }
          else {
            id v15 = v9 + 1;
          }
          if (v14) {
            id v12 = v9;
          }
          id v9 = (void *)*v15;
        }
        while (*v15);
        if (v12 == v10 || v8 < v12[4]) {
LABEL_16:
        }
          id v12 = v10;
        if (v12 != (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56))
        {
          id v16 = (void *)v12[5];
          if (v16)
          {
            if (!v12[6])
            {
              id v25 = v16;
              id v17 = *(uint64_t ***)(a1 + 48);
              uint64_t v22 = &v25;
              uint64_t v18 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v17, (unint64_t *)&v25, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
              if (v12[5] && !v12[6]) {
                char v19 = (uint64_t *)v12[7];
              }
              else {
                char v19 = 0;
              }
              id v20 = [*(id *)(a1 + 32) vertexFunction];
              id v21 = v3;
              uint64_t v22 = (id *)v19;
              id v23 = v20;
              id v24 = v21;
              std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>::push_back[abi:ne180100](v18 + 5, (uint64_t)&v22);
            }
          }
        }
      }
    }
    else
    {
    }
  }
}

id *__71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v4 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  unint64_t v7 = a3;
  unint64_t v8 = &v7;
  id v5 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v4, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8);
  return DYMTLBoundBufferInfo::operator=((id *)v5 + 5, a2);
}

void __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 type] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v4 = [v3 dataTypeDescription];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v3 dataTypeDescription];
      int v6 = [v5 elementIsArgumentBuffer];

      if (v6)
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        unint64_t v8 = [v3 index];
        id v11 = *(void **)(v7 + 56);
        long long v10 = (void *)(v7 + 56);
        id v9 = v11;
        if (!v11) {
          goto LABEL_16;
        }
        id v12 = v10;
        do
        {
          unint64_t v13 = v9[4];
          BOOL v14 = v13 >= v8;
          if (v13 >= v8) {
            id v15 = v9;
          }
          else {
            id v15 = v9 + 1;
          }
          if (v14) {
            id v12 = v9;
          }
          id v9 = (void *)*v15;
        }
        while (*v15);
        if (v12 == v10 || v8 < v12[4]) {
LABEL_16:
        }
          id v12 = v10;
        if (v12 != (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56))
        {
          id v16 = (void *)v12[5];
          if (v16)
          {
            if (!v12[6])
            {
              id v25 = v16;
              id v17 = *(uint64_t ***)(a1 + 48);
              uint64_t v22 = &v25;
              uint64_t v18 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v17, (unint64_t *)&v25, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
              if (v12[5] && !v12[6]) {
                char v19 = (uint64_t *)v12[7];
              }
              else {
                char v19 = 0;
              }
              id v20 = [*(id *)(a1 + 32) fragmentFunction];
              id v21 = v3;
              uint64_t v22 = (id *)v19;
              id v23 = v20;
              id v24 = v21;
              std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>::push_back[abi:ne180100](v18 + 5, (uint64_t)&v22);
            }
          }
        }
      }
    }
    else
    {
    }
  }
}

id *__71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_5(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v4 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  unint64_t v7 = a3;
  unint64_t v8 = &v7;
  id v5 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v4, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8);
  return DYMTLBoundBufferInfo::operator=((id *)v5 + 5, a2);
}

void __71__DYMTLCommonDebugFunctionPlayer_extractRenderIndirectArgumentBuffers___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 type] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v4 = [v3 dataTypeDescription];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v3 dataTypeDescription];
      int v6 = [v5 elementIsArgumentBuffer];

      if (v6)
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        unint64_t v8 = [v3 index];
        id v11 = *(void **)(v7 + 56);
        long long v10 = (void *)(v7 + 56);
        id v9 = v11;
        if (!v11) {
          goto LABEL_16;
        }
        id v12 = v10;
        do
        {
          unint64_t v13 = v9[4];
          BOOL v14 = v13 >= v8;
          if (v13 >= v8) {
            id v15 = v9;
          }
          else {
            id v15 = v9 + 1;
          }
          if (v14) {
            id v12 = v9;
          }
          id v9 = (void *)*v15;
        }
        while (*v15);
        if (v12 == v10 || v8 < v12[4]) {
LABEL_16:
        }
          id v12 = v10;
        if (v12 != (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56))
        {
          id v16 = (void *)v12[5];
          if (v16)
          {
            if (!v12[6])
            {
              id v25 = v16;
              id v17 = *(uint64_t ***)(a1 + 48);
              uint64_t v22 = &v25;
              uint64_t v18 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v17, (unint64_t *)&v25, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
              if (v12[5] && !v12[6]) {
                char v19 = (uint64_t *)v12[7];
              }
              else {
                char v19 = 0;
              }
              id v20 = [*(id *)(a1 + 32) tileFunction];
              id v21 = v3;
              uint64_t v22 = (id *)v19;
              id v23 = v20;
              id v24 = v21;
              std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>::push_back[abi:ne180100](v18 + 5, (uint64_t)&v22);
            }
          }
        }
      }
    }
    else
    {
    }
  }
}

- (void)extractComputeIndirectArgumentBuffers:(void *)a3
{
  unint64_t v23 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8]) + 48, 0);
  v20[0] = &v23;
  id v5 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)[(DYMTLFunctionPlayer *)self objectMap], &v23, (uint64_t)&std::piecewise_construct, v20)[3];
  int v6 = [v5 computePipelineState];
  unint64_t v13 = DYMTLGetAssociatedObject(v6, 2u);
  BOOL v14 = DYMTLGetAssociatedObject(v6, 0);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = (void *)0x4812000000;
  v20[3] = __Block_byref_object_copy__4;
  v20[4] = __Block_byref_object_dispose__4;
  v20[5] = "";
  v22[0] = 0;
  v22[1] = 0;
  id v21 = v22;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__DYMTLCommonDebugFunctionPlayer_extractComputeIndirectArgumentBuffers___block_invoke;
  v19[3] = &unk_265338FC8;
  void v19[4] = v20;
  [v5 enumerateBuffersUsingBlock:v19];
  uint64_t v7 = [v13 arguments];
  unint64_t v8 = [v7 firstObject];
  if (!v8) {
    goto LABEL_4;
  }
  id v9 = objc_msgSend(v7, "firstObject", v13);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_6;
  }
  long long v10 = [v7 firstObject];
  id v11 = [v10 dataTypeDescription];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
LABEL_4:
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__DYMTLCommonDebugFunctionPlayer_extractComputeIndirectArgumentBuffers___block_invoke_2;
    v15[3] = &unk_265339390;
    id v17 = v20;
    uint64_t v18 = a3;
    id v16 = v14;
    [v7 enumerateObjectsUsingBlock:v15];
    unint64_t v8 = v16;
LABEL_6:
  }
  _Block_object_dispose(v20, 8);
  std::__tree<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,DYMTLBoundBufferInfo>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,DYMTLBoundBufferInfo>>>::destroy((uint64_t)&v21, v22[0]);
}

id *__72__DYMTLCommonDebugFunctionPlayer_extractComputeIndirectArgumentBuffers___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v4 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  unint64_t v7 = a3;
  unint64_t v8 = &v7;
  id v5 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v4, &v7, (uint64_t)&std::piecewise_construct, (uint64_t **)&v8);
  return DYMTLBoundBufferInfo::operator=((id *)v5 + 5, a2);
}

void __72__DYMTLCommonDebugFunctionPlayer_extractComputeIndirectArgumentBuffers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 type] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v4 = [v3 dataTypeDescription];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v3 dataTypeDescription];
      int v6 = [v5 elementIsArgumentBuffer];

      if (v6)
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        unint64_t v8 = [v3 index];
        id v11 = *(void **)(v7 + 56);
        long long v10 = (void *)(v7 + 56);
        id v9 = v11;
        if (!v11) {
          goto LABEL_16;
        }
        char v12 = v10;
        do
        {
          unint64_t v13 = v9[4];
          BOOL v14 = v13 >= v8;
          if (v13 >= v8) {
            id v15 = v9;
          }
          else {
            id v15 = v9 + 1;
          }
          if (v14) {
            char v12 = v9;
          }
          id v9 = (void *)*v15;
        }
        while (*v15);
        if (v12 == v10 || v8 < v12[4]) {
LABEL_16:
        }
          char v12 = v10;
        if (v12 != (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56))
        {
          id v16 = (void *)v12[5];
          if (v16)
          {
            if (!v12[6])
            {
              id v25 = v16;
              id v17 = *(uint64_t ***)(a1 + 48);
              uint64_t v22 = &v25;
              uint64_t v18 = std::__tree<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<DYMTLOriginalProcessBuffer>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v17, (unint64_t *)&v25, (uint64_t)&std::piecewise_construct, (uint64_t **)&v22);
              if (v12[5] && !v12[6]) {
                char v19 = (uint64_t *)v12[7];
              }
              else {
                char v19 = 0;
              }
              id v20 = [*(id *)(a1 + 32) computeFunction];
              id v21 = v3;
              uint64_t v22 = (id *)v19;
              id v23 = v20;
              id v24 = v21;
              std::vector<std::tuple<unsigned long long,objc_object  {objcproto11MTLFunction}* {__strong},MTLArgument * {__strong}>>::push_back[abi:ne180100](v18 + 5, (uint64_t)&v22);
            }
          }
        }
      }
    }
    else
    {
    }
  }
}

- (void)_extractTileMemoryWithRenderPassDescriptor:(DYMTLRenderPassDescriptor *)a3 renderEncoderID:(unint64_t)a4 isDrawCall:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x4812000000;
  unint64_t v33 = __Block_byref_object_copy__503;
  unint64_t v34 = __Block_byref_object_dispose__504;
  uint64_t v35 = "";
  memset(v36, 0, sizeof(v36));
  unint64_t v8 = [(DYMTLFunctionPlayer *)self objectForKey:a4];
  id v9 = [v8 renderPipelineState];
  unint64_t tileWidth = a3->tileWidth;
  unint64_t tileHeight = a3->tileHeight;
  uint64_t v12 = [v8 width];
  uint64_t v13 = [v8 height];
  BOOL v14 = [DYMTLTileMemoryExtractor alloc];
  id v15 = [(DYMTLFunctionPlayer *)self device];
  v29[0] = tileWidth;
  v29[1] = tileHeight;
  v29[2] = 1;
  v28[0] = v12;
  v28[1] = v13;
  v28[2] = 0;
  id v16 = [(DYMTLTileMemoryExtractor *)v14 initWithRenderEncoder:v8 metalDevice:v15 tileSize:v29 texSize:v28];
  tileMemoryExtractor = self->_tileMemoryExtractor;
  self->_tileMemoryExtractor = v16;

  uint64_t v18 = DYMTLGetAssociatedObject(v9, 2u);
  [(DYMTLTileMemoryExtractor *)self->_tileMemoryExtractor processReflection:v18 isDrawCall:v5];
  if ([(DYMTLTileMemoryExtractor *)self->_tileMemoryExtractor getImageBlockStatus]) {
    [(DYMTLTileMemoryExtractor *)self->_tileMemoryExtractor harvestImageBlockData:&v37];
  }
  if ([(DYMTLTileMemoryExtractor *)self->_tileMemoryExtractor getThreadgroupStatus])
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __104__DYMTLCommonDebugFunctionPlayer__extractTileMemoryWithRenderPassDescriptor_renderEncoderID_isDrawCall___block_invoke;
    v27[3] = &unk_2653393B8;
    v27[4] = self;
    v27[5] = &v30;
    [v8 enumerateThreadgroupMemoryUsingBlock:v27];
  }
  uint64_t v19 = v37;
  if (v38 != v37)
  {
    unint64_t v20 = 0;
    uint64_t v21 = *MEMORY[0x263F3FC80];
    unsigned int v22 = 1;
    do
    {
      [(DYMTLFunctionPlayer *)self setObject:*(void *)(v19 + 8 * v20) forKey:v21 + v20];
      unint64_t v20 = v22;
      uint64_t v19 = v37;
      ++v22;
    }
    while (v20 < (v38 - v37) >> 3);
  }
  id v23 = v31[6];
  if (v31[7] != v23)
  {
    unint64_t v24 = 0;
    uint64_t v25 = *MEMORY[0x263F3FC88];
    unsigned int v26 = 1;
    do
    {
      [(DYMTLFunctionPlayer *)self setObject:v23[v24] forKey:v25 + v24];
      unint64_t v24 = v26;
      id v23 = v31[6];
      ++v26;
    }
    while (v24 < v31[7] - v23);
  }

  _Block_object_dispose(&v30, 8);
  id v40 = (void **)v36;
  std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::__destroy_vector::operator()[abi:ne180100](&v40);
  uint64_t v30 = (void **)&v37;
  std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::__destroy_vector::operator()[abi:ne180100](&v30);
}

void __104__DYMTLCommonDebugFunctionPlayer__extractTileMemoryWithRenderPassDescriptor_renderEncoderID_isDrawCall___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 3952) harvestThreadgroupAtIndex:a3 size:*a2];
  if (v4)
  {
    std::vector<objc_object  {objcproto11MTLResource}* {__strong}>::push_back[abi:ne180100]((char **)(*(void *)(*(void *)(a1 + 40) + 8) + 48), &v4);
  }
}

- (void)_superExecutePlatformFunction
{
  if ((**(_DWORD **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8]) + 7167) >= 2)
  {
    v2.receiver = self;
    v2.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
    [(DYMTLCommonFunctionPlayer *)&v2 executePlatformFunction];
  }
}

- (void)executePlatformFunction
{
  id v3 = (void *)MEMORY[0x253362620](self, a2);
  uint64_t v4 = (int)*MEMORY[0x263F3F9A8];
  if (**(_DWORD **)((char *)&self->super.super.super.super.isa + v4) != -7161)
  {
    id v5 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
    unsigned int v6 = [v5 playbackMode];
    BOOL v7 = v6 > 0xC || ((1 << v6) & 0x182E) == 0;
    if (v7 || (**(_DWORD **)((char *)&self->super.super.super.super.isa + v4) + 7158) > 2)
    {
      [(DYMTLCommonDebugFunctionPlayer *)self _superExecutePlatformFunction];
    }
    else
    {
      unint64_t v8 = [(DYMTLCommonFunctionPlayer *)self layerManager];
      id v9 = [(DYMTLCommonDebugFunctionPlayer *)self replayerLayerForDrawableId:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v4) + 48, 0)];
      [v8 prepareLayerForPresent:v9];
    }
    unint64_t v10 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v4) + 48, 0);
    id v11 = *(Class *)((char *)&self->super.super.super.super.isa + v4);
    if (*v11 == -7167)
    {
      unint64_t v18 = v10;
      unint64_t v19 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v11 + 6), 0);
      unint64_t v24 = v19;
      unint64_t v20 = [(DYMTLFunctionPlayer *)self objectForKey:v18];
      uint64_t v21 = v20;
      if (v20)
      {
        unsigned int v22 = [v20 texture];
        DYMTLAddDrawableTextureDescriptor(v22);
        [(DYMTLFunctionPlayer *)self setObject:v22 forKey:v19];
        uint64_t v25 = &v24;
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_textureToDrawableMap, &v24, (uint64_t)&std::piecewise_construct, &v25)[3] = v18;
      }
    }
    else if (*v11 == -7166)
    {
      unint64_t v12 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v11 + 12), 0);
      unint64_t v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v4) + 24, 0);
      uint64_t v13 = [(DYMTLCommonDebugFunctionPlayer *)self replayerLayerForDrawableId:v24];
      unint64_t v23 = v12;
      [(DYMTLCommonDebugFunctionPlayer *)self updateReplayerLayer:v24 withOriginalLayer:v12];
      BOOL v14 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->super._drawableRenderabilityStatusMap.__table_.__bucket_list_.__ptr_.__value_, &v24);
      if (!v14
        || !*((unsigned char *)v14 + 24)
        || ([(DYMTLFunctionPlayer *)self objectForKey:v24],
            (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        do
        {
          uint64_t v15 = [v13 nextDrawable];
          uint64_t v25 = &v24;
          *((unsigned char *)std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->super._drawableRenderabilityStatusMap, &v24, (uint64_t)&std::piecewise_construct, &v25)+ 24) = 1;
        }
        while (!v15);
      }
      [(DYMTLFunctionPlayer *)self setObject:v15 forKey:v24];
      uint64_t v25 = &v24;
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_drawableIdToLayerIdMap, &v24, (uint64_t)&std::piecewise_construct, &v25)[3] = v23;
      uint64_t v25 = &v24;
      id v16 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong}>,std::__unordered_map_hasher<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,objc_object  {objcproto15CAMetalDrawable}* {__strong},std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto15CAMetalDrawable}* {__strong}>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::piecewise_construct_t const&<>>((uint64_t)&self->super._drawableMap, &v24, (uint64_t)&std::piecewise_construct, &v25);
      id v17 = (void *)v16[3];
      v16[3] = v15;
    }
    if ([v5 playbackMode] <= 1) {
      [(DYMTLCommonDebugFunctionPlayer *)self _trackObjects];
    }
  }
}

- (void)resetFunctionPlayerData
{
  self->_unint64_t currentBatchEncoderIndex = 0;
}

- (void)enableConsistentState:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  uint64_t v4 = [(DYMTLFunctionPlayer *)&v7 commandQueue];
  id v5 = v4;
  if (v4)
  {
    if (v3) {
      uint64_t v6 = [v4 getStatOptions] | 0x80000000;
    }
    else {
      uint64_t v6 = [v4 getStatOptions] & 0x7FFFFFFF;
    }
    [v5 setStatOptions:v6];
  }
}

- (void)allowOverlap:(BOOL)a3 withPState:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  objc_super v7 = [(DYMTLFunctionPlayer *)&v10 commandQueue];
  unint64_t v8 = v7;
  if (v7)
  {
    [v7 setGPUPriority:v5 ^ 1];
    [v8 setStatEnabled:v5];
    if (v4) {
      [(DYMTLCommonDebugFunctionPlayer *)self setConsistentStateTo:v4];
    }
    if (v5) {
      uint64_t v9 = 2952790016;
    }
    else {
      uint64_t v9 = 0x10000000;
    }
    [v8 setStatOptions:v9];
  }
}

- (void)setConsistentStateTo:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(DYMTLFunctionPlayer *)self device];
  DYMTLGetOriginalObject(v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector()) {
    [v5 setConsistentGPUPerfStateTo:v3];
  }
}

- (void)prepareForCaptureExecution
{
  v4.receiver = self;
  v4.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  [(DYFunctionPlayer *)&v4 prepareForCaptureExecution];
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::clear(&self->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_);
  self->_lastEncoderID = 0;
  self->_disableWireframe = 0;
  [(DYMTLCommonDebugFunctionPlayer *)self resetFunctionPlayerData];
  uint64_t v3 = [(DYMTLCommonFunctionPlayer *)self layerManager];
  [v3 resetLayersVisibility];
  std::__hash_table<std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,NSData * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,NSData * {__strong}>>>::clear((uint64_t)&self->super._drawableMap);
}

- (void)_endEncodingForAllRemainingEncoders:(void *)a3
{
  uint64_t v3 = (uint64_t *)*((void *)a3 + 2);
  if (v3)
  {
    objc_super v4 = self;
    id v5 = &protocolRef_MTLSamplerState;
    while (*((unsigned char *)v3 + 48))
    {
LABEL_42:
      uint64_t v3 = (uint64_t *)*v3;
      if (!v3) {
        return;
      }
    }
    uint64_t v37 = [(DYMTLFunctionPlayer *)v4 objectForKey:v3[2]];
    if ([v37 conformsToProtocol:v5[2]])
    {
      if (objc_msgSend((id)objc_msgSend(v37, "performSelector:", sel_parent), "conformsToProtocol:", &unk_27010E6D8))
      {
        uint64_t v6 = DYMTLGetAssociatedObject(v37, 0);
        for (uint64_t i = 0; i != 8; ++i)
        {
          unint64_t v8 = [v6 colorAttachments];
          uint64_t v9 = [v8 objectAtIndexedSubscript:i];
          objc_super v10 = [v9 texture];
          if (v10)
          {
            id v11 = [v6 colorAttachments];
            unint64_t v12 = [v11 objectAtIndexedSubscript:i];
            uint64_t v13 = [v12 storeAction];

            if (v13 == 4 && (objc_opt_respondsToSelector() & 1) != 0) {
              [v37 setColorStoreAction:1 atIndex:i];
            }
          }
          else
          {
          }
        }
        [v6 depthAttachment];
        objc_super v4 = self;
        BOOL v14 = v5 = &protocolRef_MTLSamplerState;
        uint64_t v15 = [v14 texture];
        if (v15)
        {
          id v16 = [v6 depthAttachment];
          uint64_t v17 = [v16 storeAction];

          if (v17 == 4 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v37 setDepthStoreAction:1];
          }
        }
        else
        {
        }
        unint64_t v29 = [v6 stencilAttachment];
        unint64_t v33 = [v29 texture];
        if (v33)
        {
          unint64_t v34 = [v6 stencilAttachment];
          uint64_t v35 = [v34 storeAction];

          if (v35 != 4 || (objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_33;
        }
        goto LABEL_39;
      }
    }
    else if ([v37 conformsToProtocol:&unk_27010E828])
    {
      uint64_t v6 = DYMTLGetAssociatedObject(v37, 0);
      for (uint64_t j = 0; j != 8; ++j)
      {
        unint64_t v19 = [v6 colorAttachments];
        unint64_t v20 = [v19 objectAtIndexedSubscript:j];
        uint64_t v21 = [v20 texture];
        if (v21)
        {
          unsigned int v22 = [v6 colorAttachments];
          unint64_t v23 = [v22 objectAtIndexedSubscript:j];
          uint64_t v24 = [v23 storeAction];

          if (v24 == 4 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v37 setColorStoreAction:1 atIndex:j];
          }
        }
        else
        {
        }
      }
      [v6 depthAttachment];
      objc_super v4 = self;
      uint64_t v25 = v5 = &protocolRef_MTLSamplerState;
      unsigned int v26 = [v25 texture];
      if (v26)
      {
        int v27 = [v6 depthAttachment];
        uint64_t v28 = [v27 storeAction];

        if (v28 == 4 && (objc_opt_respondsToSelector() & 1) != 0) {
          [v37 setDepthStoreAction:1];
        }
      }
      else
      {
      }
      unint64_t v29 = [v6 stencilAttachment];
      uint64_t v30 = [v29 texture];
      if (v30)
      {
        uint64_t v31 = [v6 stencilAttachment];
        uint64_t v32 = [v31 storeAction];

        if (v32 != 4 || (objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_40;
        }
LABEL_33:
        [v37 setStencilStoreAction:1];
LABEL_40:

        goto LABEL_41;
      }
LABEL_39:

      goto LABEL_40;
    }
LABEL_41:
    [v37 endEncoding];
    *((unsigned char *)v3 + 48) = 1;

    goto LABEL_42;
  }
}

- (void)commitEncodersAndCommandBuffers
{
  [(DYMTLCommonDebugFunctionPlayer *)self _endEncodingForAllRemainingEncoders:&self->_encoderMap];
  [(DYMTLCommonDebugFunctionPlayer *)self _endEncodingForAllRemainingEncoders:&self->_parallelEncoderMap];
  currentParallelDescriptor = self->_currentParallelDescriptor;
  self->_currentParallelDescriptor = 0;

  self->_currentParallelId = 0;
  for (uint64_t i = self->_commandBufferMap.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    if (!*((unsigned char *)i + 32))
    {
      id v5 = [(DYMTLFunctionPlayer *)self objectForKey:i[2]];
      [v5 commit];
      *((unsigned char *)i + 32) = 1;
    }
  }
}

- (void)waitForCommmandBuffersCompletion
{
  for (uint64_t i = self->_commandQueueSet.__table_.__p1_.__value_.__next_; i; uint64_t i = (void *)*i)
  {
    objc_super v4 = [(DYMTLFunctionPlayer *)self objectForKey:i[2]];
    [v4 finish];
  }
}

- (id)_texture2DFromTexture:(id)a3 level:(unint64_t)a4 slice:(unint64_t)a5 depthPlane:(unint64_t)a6 commandBuffer:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  BOOL v14 = objc_opt_new();
  [v14 setTextureType:2];
  objc_msgSend(v14, "setPixelFormat:", objc_msgSend(v12, "pixelFormat"));
  unint64_t v15 = [v12 width];
  if (v15 >> a4 <= 1) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15 >> a4;
  }
  [v14 setWidth:v16];
  unint64_t v17 = [v12 height];
  if (v17 >> a4 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v17 >> a4;
  }
  [v14 setHeight:v18];
  if (!self->_isAGXDevice) {
    [v14 setResourceOptions:32];
  }
  if ([v12 isFramebufferOnly])
  {
    id v19 = v12;
  }
  else
  {
    unint64_t v20 = [(DYMTLFunctionPlayer *)self device];
    DYMTLNewTexture(v20, v14);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    if ([v12 textureType] == 4 || objc_msgSend(v12, "textureType") == 8)
    {
      uint64_t v21 = [MEMORY[0x263F12998] renderPassDescriptor];
      unsigned int v22 = [v21 colorAttachments];
      unint64_t v23 = [v22 objectAtIndexedSubscript:0];

      [v23 setTexture:v12];
      [v23 setLevel:a4];
      [v23 setSlice:a5];
      [v23 setDepthPlane:a6];
      [v23 setResolveTexture:v19];
      [v23 setLoadAction:1];
      [v23 setStoreAction:2];
      uint64_t v24 = DYMTLNewStatefulRenderCommandEncoder(v13, v21);
      [v24 endEncoding];
    }
    else
    {
      uint64_t v21 = [v13 blitCommandEncoder];
      v28[0] = 0;
      v28[1] = 0;
      v28[2] = a6;
      v27[0] = [v19 width];
      v27[1] = [v19 height];
      v27[2] = 1;
      memset(v26, 0, sizeof(v26));
      [v21 copyFromTexture:v12 sourceSlice:a5 sourceLevel:a4 sourceOrigin:v28 sourceSize:v27 toTexture:v19 destinationSlice:0 destinationLevel:0 destinationOrigin:v26];
      [v21 endEncoding];
    }
  }
  return v19;
}

- (void)presentDrawable
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  p_lastEncoderID = &self->_lastEncoderID;
  if (self->_lastEncoderID)
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v72, 1, 1);
    objc_super v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, p_lastEncoderID);
    if (!v4) {
      goto LABEL_45;
    }
    id v5 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderToParallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, v4 + 5);
    if (v5)
    {
      objc_super v4 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, v5 + 3);
      if (!v4) {
        goto LABEL_45;
      }
    }
    if (!v4[5]) {
      goto LABEL_45;
    }
    -[DYMTLCommonDebugFunctionPlayer _attachmentInfoForCommandEncoderID:](self, "_attachmentInfoForCommandEncoderID:");
    if (!v68) {
      goto LABEL_45;
    }
    uint64_t v6 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, v4 + 3);
    if (!v6) {
      goto LABEL_45;
    }
    id v66 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
    objc_super v7 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_textureToDrawableMap.__table_.__bucket_list_.__ptr_.__value_, &v68);
    unint64_t v67 = 0;
    if (v7)
    {
      unint64_t v67 = v7[3];
      unint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_drawableIdToLayerIdMap.__table_.__bucket_list_.__ptr_.__value_, &v67);
      unint64_t v9 = v67;
      if (v8)
      {
        objc_super v10 = [(DYMTLFunctionPlayer *)self objectForKey:v67];
        id v11 = [v10 texture];

        uint64_t v12 = v8[3];
        unint64_t v9 = v67;
        goto LABEL_13;
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    id v11 = 0;
    uint64_t v12 = -1;
LABEL_13:
    id v13 = [(DYMTLCommonDebugFunctionPlayer *)self replayerLayerForDrawableId:v9];
    if (v12 == -1)
    {
      BOOL v14 = [(DYMTLFunctionPlayer *)self objectForKey:v68];

      if (!v14)
      {
        id v11 = 0;
        unint64_t v29 = 0;
        uint64_t v28 = 0;
LABEL_44:

LABEL_45:
        GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v72);
        return;
      }
      unint64_t v15 = [v14 width];
      if (v15 >> v69 <= 1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = v15 >> v69;
      }
      unint64_t v17 = [v14 height];
      if (v17 >> v69 <= 1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = v17 >> v69;
      }
      id v19 = objc_opt_class();
      unint64_t v20 = [(DYMTLCommonFunctionPlayer *)self layerManager];
      [v20 boundsForCurrentInterfaceOrientation];
      [v19 shrinkSourceSize:(double)v16 toDestSize:(double)v18];
      double v22 = v21;
      double v24 = v23;

      objc_msgSend(v13, "setBounds:", 0.0, 0.0, v22, v24);
      objc_msgSend(v13, "setDrawableSize:", (double)(unint64_t)objc_msgSend(v14, "width"), (double)(unint64_t)objc_msgSend(v14, "height"));
      uint64_t v25 = [(DYMTLFunctionPlayer *)self device];
      [v13 setDevice:v25];

      [v13 setPixelFormat:80];
      unsigned int v26 = [(DYMTLCommonFunctionPlayer *)self layerManager];
      [v26 defaultContentsScale];
      objc_msgSend(v13, "setContentsScale:");

      id v11 = v14;
    }
    context = (void *)MEMORY[0x253362620]();
    do
    {
      int v27 = [v13 nextDrawable];
      uint64_t v28 = v27;
    }
    while (!v27);
    unint64_t v29 = [v27 texture];
    if (v29 && v11)
    {
      uint64_t v62 = [(DYMTLFunctionPlayer *)self objectForKey:v6[3]];
      id v65 = [v62 commandBuffer];
      uint64_t v63 = [MEMORY[0x263F12998] renderPassDescriptor];
      uint64_t v30 = [v63 colorAttachments];
      uint64_t v31 = [v30 objectAtIndexedSubscript:0];

      [v31 setTexture:v29];
      [v31 setLoadAction:2];
      [v31 setStoreAction:1];
      objc_msgSend(v31, "setClearColor:", 0.0, 0.0, 0.0, 1.0);
      if (!v67)
      {
        id v32 = v11;
        unint64_t v33 = v32;
        if (([v32 pixelFormat] & 0xFFFFFFFFFFFFFFFELL) == 0x226)
        {
          unint64_t v34 = objc_msgSend(MEMORY[0x263F12A58], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v29, "pixelFormat"), objc_msgSend(v29, "width"), objc_msgSend(v29, "height"), 0);
          uint64_t v35 = [v62 device];
          unint64_t v33 = DYMTLNewTexture(v35, v34);
        }
        if ([v33 storageMode] == 3)
        {
          unsigned int v36 = (void *)sMemorylessTexturesAndReplacements;
          uint64_t v37 = [NSNumber numberWithUnsignedLong:v33];
          uint64_t v38 = [v36 objectForKeyedSubscript:v37];

          if (v38) {
            uint64_t v39 = v38;
          }
          else {
            uint64_t v39 = v33;
          }
          id v40 = v39;

          unint64_t v33 = v40;
        }
        uint64_t v41 = [(DYMTLCommonDebugFunctionPlayer *)self _texture2DFromTexture:v33 level:v69 slice:v70 depthPlane:v71 commandBuffer:v65];

        id v11 = (void *)v41;
      }
      BOOL v42 = DYMTLNewStatefulRenderCommandEncoder(v65, v63);
      [(DYMTLTextureRenderer *)self->_textureRenderer renderTexture:v11 withEncoder:v42 enableBlending:0 layerIndex:0];
      if ([v66 enableWireframePresent])
      {
        if (!self->_disableWireframe)
        {
          v43 = [(DYMTLDebugWireframeRenderer *)self->_wireframeRenderer wireframeTexture];
          BOOL v44 = v43 == 0;

          if (!v44)
          {
            int v61 = [v66 wireframeLineColor];
            int v60 = [v66 wireframeLineColor];
            __int16 v45 = [v66 wireframeLineColor];
            unsigned __int8 v46 = [v66 wireframeLineColor];
            *(float *)&double v47 = (float)(v61 & 0xFF000000) / 4278200000.0;
            *(float *)&double v48 = (float)(v60 & 0xFF0000) / 16712000.0;
            *(float *)&double v49 = (float)(v45 & 0xFF00) / 65280.0;
            *(float *)&double v50 = (float)v46 / 255.0;
            [(DYMTLTextureRenderer *)self->_textureRenderer setBlendColorRed:v47 green:v48 blue:v49 alpha:v50];
            textureRenderer = self->_textureRenderer;
            v52 = [(DYMTLDebugWireframeRenderer *)self->_wireframeRenderer wireframeTexture];
            [(DYMTLTextureRenderer *)textureRenderer renderTexture:v52 withEncoder:v42 enableBlending:1 layerIndex:0];
          }
        }
      }
      if ([v66 enableOutlinePresent])
      {
        v53 = [(DYMTLDebugWireframeRenderer *)self->_wireframeRenderer outlineTexture];
        BOOL v54 = v53 == 0;

        if (!v54)
        {
          LODWORD(v55) = 1.0;
          LODWORD(v56) = 1.0;
          [(DYMTLTextureRenderer *)self->_textureRenderer setBlendColorRed:v55 green:0.0 blue:0.0 alpha:v56];
          uint64_t v57 = self->_textureRenderer;
          BOOL v58 = [(DYMTLDebugWireframeRenderer *)self->_wireframeRenderer outlineTexture];
          [(DYMTLTextureRenderer *)v57 renderTexture:v58 withEncoder:v42 enableBlending:1 layerIndex:0];
        }
      }
      [v42 endEncoding];
      [v65 commit];
      [v65 waitUntilCompleted];
      int v59 = [(DYMTLCommonFunctionPlayer *)self layerManager];
      [v59 prepareLayerForPresent:v13];
      [v28 present];
    }
    goto LABEL_44;
  }
}

- (id)replayerLayerForDrawableId:(unint64_t)a3
{
  unint64_t v21 = a3;
  p_metalLayers = &self->_metalLayers;
  id v5 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_metalLayers.__table_.__bucket_list_.__ptr_.__value_, &v21);
  if (v5)
  {
    id v6 = (id)v5[3];
  }
  else
  {
    uint64_t v7 = (int)*MEMORY[0x263F3F9A0];
    if ([*(id *)((char *)&self->super.super.super.super.isa + v7) conformsToProtocol:&unk_27010E888])
    {
      id v8 = *(id *)((char *)&self->super.super.super.super.isa + v7);
      objc_msgSend(v8, "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:", v21, 0, 0, 0.0, 0.0, 1.0, 1.0, 1.0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6) {
        BOOL v9 = v21 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9)
      {
        [v8 boundsForCurrentInterfaceOrientation];
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        [v8 defaultContentsScale];
        objc_msgSend(v8, "updateLayer:contentRect:contentsScale:properties:", v6, 0, v11, v13, v15, v17, v18);
        [v6 setFramebufferOnly:0];
        double v22 = &v21;
        id v19 = (id *)std::__hash_table<std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)p_metalLayers, &v21, (uint64_t)&std::piecewise_construct, &v22);
        objc_storeStrong(v19 + 3, v6);
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (void)updateReplayerLayer:(unint64_t)a3 withOriginalLayer:(unint64_t)a4
{
  void v19[5] = *(void **)MEMORY[0x263EF8340];
  unint64_t v18 = a3;
  id v5 = [(DYMTLCommonFunctionPlayer *)self layerForID:a4];
  v19[0] = &v18;
  id v6 = (id)std::__hash_table<std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CAMetalLayer * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_metalLayers, &v18, (uint64_t)&std::piecewise_construct, v19)[3];
  GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v19, 1, 1);
  [v5 bounds];
  objc_msgSend(v6, "setBounds:");
  [v5 position];
  objc_msgSend(v6, "setPosition:");
  [v5 anchorPoint];
  objc_msgSend(v6, "setAnchorPoint:");
  [v5 anchorPointZ];
  objc_msgSend(v6, "setAnchorPointZ:");
  if (v5)
  {
    [v5 transform];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
  }
  v9[4] = v14;
  v9[5] = v15;
  v9[6] = v16;
  v9[7] = v17;
  v9[0] = v10;
  v9[1] = v11;
  void v9[2] = v12;
  v9[3] = v13;
  [v6 setTransform:v9];
  objc_msgSend(v6, "setPixelFormat:", objc_msgSend(v5, "pixelFormat"));
  uint64_t v7 = [v5 device];
  if (v7) {
    [v5 device];
  }
  else {
  id v8 = [(DYMTLFunctionPlayer *)self device];
  }
  [v6 setDevice:v8];

  [v5 contentsScale];
  objc_msgSend(v6, "setContentsScale:");
  [v6 setFramebufferOnly:0];
  [v5 drawableSize];
  objc_msgSend(v6, "setDrawableSize:");
  GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v19);
}

+ (id)thumbnailTexture:(unint64_t)a3
{
  objc_super v4 = (void *)sThumbnailTextures;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = (void *)sThumbnailTextures;
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [v7 removeObjectForKey:v8];

  return v6;
}

+ (id)harvestableTexture:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)sMemorylessTexturesAndReplacements;
  id v5 = [NSNumber numberWithUnsignedLong:v3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = v3;
  if (v6)
  {
    id v8 = (void *)sMemorylessTexturesAndReplacements;
    BOOL v9 = [NSNumber numberWithUnsignedLong:v3];
    uint64_t v7 = [v8 objectForKeyedSubscript:v9];
  }
  return v7;
}

- (void)encodeStoreActionForRenderCommandEncoder:(id)a3 withDescriptor:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  id v6 = [v5 depthAttachment];
  uint64_t v7 = [v6 storeAction];

  if (v7 == 4) {
    [v14 setDepthStoreAction:1];
  }
  id v8 = [v5 stencilAttachment];
  uint64_t v9 = [v8 storeAction];

  if (v9 == 4) {
    [v14 setStencilStoreAction:1];
  }
  for (uint64_t i = 0; i != 8; ++i)
  {
    long long v11 = [v5 colorAttachments];
    long long v12 = [v11 objectAtIndexedSubscript:i];
    uint64_t v13 = [v12 storeAction];

    if (v13 == 4) {
      [v14 setColorStoreAction:1 atIndex:i];
    }
  }
}

- (void)encodeStoreActionForParallelRenderCommandEncoder:(id)a3 withDescriptor:(id)a4
{
  id v24 = a3;
  id v5 = a4;
  id v6 = [v5 depthAttachment];
  uint64_t v7 = [v6 storeAction];

  if (v7 == 4)
  {
    id v8 = [v5 depthAttachment];
    uint64_t v9 = [v8 resolveTexture];
    if (v9) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 1;
    }
    [v24 setDepthStoreAction:v10];
  }
  long long v11 = [v5 stencilAttachment];
  uint64_t v12 = [v11 storeAction];

  if (v12 == 4)
  {
    uint64_t v13 = [v5 stencilAttachment];
    id v14 = [v13 resolveTexture];
    if (v14) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 1;
    }
    [v24 setStencilStoreAction:v15];
  }
  for (uint64_t i = 0; i != 8; ++i)
  {
    long long v17 = [v5 colorAttachments];
    unint64_t v18 = [v17 objectAtIndexedSubscript:i];
    uint64_t v19 = [v18 storeAction];

    if (v19 == 4)
    {
      unint64_t v20 = [v5 colorAttachments];
      unint64_t v21 = [v20 objectAtIndexedSubscript:i];
      double v22 = [v21 resolveTexture];
      if (v22) {
        uint64_t v23 = 3;
      }
      else {
        uint64_t v23 = 1;
      }
      [v24 setColorStoreAction:v23 atIndex:i];
    }
  }
}

- (void)_executeGraphicsFunction
{
  uint64_t v3 = (int)*MEMORY[0x263F3F9A8];
  objc_super v4 = *(int **)((char *)&self->super.super.super.super.isa + v3);
  int v5 = *v4;
  if (*v4 > -16163)
  {
    switch(v5)
    {
      case -16162:
      case -16154:
        goto LABEL_3;
      case -16161:
      case -16153:
        goto LABEL_53;
      case -16160:
      case -16152:
        goto LABEL_60;
      case -16159:
        unint64_t v39 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 12), 0);
        id v40 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_persistantEncoder2ParallelMap.__table_.__bucket_list_.__ptr_.__value_, &self->_targetCommandEncoderId);
        if (self->_currentParallelDescriptor) {
          BOOL v41 = v40 == 0;
        }
        else {
          BOOL v41 = 1;
        }
        if (!v41 && v40[3] == v39) {
          return;
        }
LABEL_3:
        unint64_t v6 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0);
        unint64_t v7 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 96, 0);
        id v8 = [(DYMTLFunctionPlayer *)self objectForKey:v6];
        uint64_t v9 = [v8 descriptor];
        uint64_t v10 = [v9 colorAttachments];
        long long v11 = [v10 objectAtIndexedSubscript:v7];
        uint64_t v12 = [v11 storeAction];

        if (v12 == 4)
        {
          v69.receiver = self;
          v69.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
          [(DYMTLFunctionPlayer *)&v69 executeGraphicsFunction];
        }
        goto LABEL_40;
      case -16158:
        unint64_t v42 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 12), 0);
        v43 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_persistantEncoder2ParallelMap.__table_.__bucket_list_.__ptr_.__value_, &self->_targetCommandEncoderId);
        if (self->_currentParallelDescriptor) {
          BOOL v44 = v43 == 0;
        }
        else {
          BOOL v44 = 1;
        }
        if (!v44 && v43[3] == v42) {
          return;
        }
LABEL_53:
        id v8 = [(DYMTLFunctionPlayer *)self objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0)];
        uint64_t v9 = [v8 descriptor];
        __int16 v45 = [v9 depthAttachment];
        uint64_t v46 = [v45 storeAction];

        if (v46 == 4)
        {
          v68.receiver = self;
          v68.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
          [(DYMTLFunctionPlayer *)&v68 executeGraphicsFunction];
        }
        goto LABEL_40;
      case -16157:
        unint64_t v47 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 12), 0);
        double v48 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_persistantEncoder2ParallelMap.__table_.__bucket_list_.__ptr_.__value_, &self->_targetCommandEncoderId);
        if (self->_currentParallelDescriptor) {
          BOOL v49 = v48 == 0;
        }
        else {
          BOOL v49 = 1;
        }
        if (!v49 && v48[3] == v47) {
          return;
        }
LABEL_60:
        id v8 = [(DYMTLFunctionPlayer *)self objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0)];
        uint64_t v9 = [v8 descriptor];
        double v50 = [v9 stencilAttachment];
        uint64_t v51 = [v50 storeAction];

        if (v51 == 4)
        {
          v67.receiver = self;
          v67.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
          [(DYMTLFunctionPlayer *)&v67 executeGraphicsFunction];
        }
        goto LABEL_40;
      case -16156:
      case -16155:
        goto LABEL_66;
      default:
        if ((v5 + 7158) < 3)
        {
          unint64_t v64 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 12), 0);
          id v8 = [(DYMTLCommonFunctionPlayer *)self layerManager];
          uint64_t v9 = [(DYMTLCommonDebugFunctionPlayer *)self replayerLayerForDrawableId:v64];
          [v8 prepareLayerForPresent:v9];
          v62.receiver = self;
          v62.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
          [(DYMTLFunctionPlayer *)&v62 executeGraphicsFunction];
          id v72 = &v64;
          uint64_t v13 = std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->super._drawableRenderabilityStatusMap, &v64, (uint64_t)&std::piecewise_construct, &v72);
          goto LABEL_39;
        }
        if (v5 == -16133) {
          goto LABEL_38;
        }
        goto LABEL_66;
    }
  }
  if (v5 > -16287)
  {
    switch(v5)
    {
      case -16286:
        v71.receiver = self;
        v71.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        [(DYMTLFunctionPlayer *)&v71 executeGraphicsFunction];
        id v72 = (unint64_t *)GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 24, 0);
        p_currentParallelId = (uint64_t *)&self->_currentParallelId;
        if (self->_currentParallelId)
        {
          p_persistantEncoder2ParallelMap = &self->_persistantEncoder2ParallelMap;
          std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_persistantEncoder2ParallelMap, (unint64_t *)&v72);
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned long long &>((uint64_t)p_persistantEncoder2ParallelMap, (unint64_t *)&v72, &v72, p_currentParallelId);
        }
        break;
      case -16285:
        currentParallelDescriptor = self->_currentParallelDescriptor;
        self->_currentParallelDescriptor = 0;

        self->_currentParallelId = 0;
        v70.receiver = self;
        v70.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        [(DYMTLFunctionPlayer *)&v70 executeGraphicsFunction];
        break;
      case -16195:
LABEL_15:
        [(DYFunctionPlayer *)self processArguments];
        self->_isTileRenderPassDescriptor = 0;
        GPUTools::MTL::MakeMTLRenderPassDescriptor(**(void **)((char *)&self->super.super.super._executePlatform + (int)*MEMORY[0x263F3F970]), (uint64_t)[(DYMTLFunctionPlayer *)self objectMap]);
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v14 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 24, 0);
        unint64_t v15 = v14;
        unint64_t targetCommandEncoderId = self->_targetCommandEncoderId;
        if (targetCommandEncoderId) {
          BOOL v17 = v14 == targetCommandEncoderId;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17) {
          [(DYMTLCommonDebugFunctionPlayer *)self _modifyDescriptorForStore:obj];
        }
        unint64_t v18 = [(DYMTLFunctionPlayer *)self objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0)];
        [(DYMTLCommonDebugFunctionPlayer *)self _modifyDescriptorForLayering:obj withBuffer:v18];
        if (**(_DWORD **)((char *)&self->super.super.super.super.isa + v3) == -16353)
        {
          id v19 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
          if ([v19 playbackMode] == 10
            || [v19 playbackMode] == 13)
          {
            for (uint64_t i = 0; i != 8; ++i)
            {
              unint64_t v21 = objc_msgSend(obj, "colorAttachments", obj);
              double v22 = [v21 objectAtIndexedSubscript:i];
              [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v22];

              uint64_t v23 = [obj colorAttachments];
              id v24 = [v23 objectAtIndexedSubscript:i];
              uint64_t v25 = [v24 resolveTexture];

              unsigned int v26 = [obj colorAttachments];
              int v27 = [v26 objectAtIndexedSubscript:i];
              if (v25) {
                [v27 setStoreAction:3];
              }
              else {
                [v27 setStoreAction:1];
              }
            }
            uint64_t v28 = [obj depthAttachment];
            [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v28];

            unint64_t v29 = [obj depthAttachment];
            uint64_t v30 = [v29 resolveTexture];

            uint64_t v31 = [obj depthAttachment];
            if (v30) {
              [v31 setStoreAction:3];
            }
            else {
              [v31 setStoreAction:1];
            }

            double v55 = [obj stencilAttachment];
            [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v55];

            double v56 = [obj stencilAttachment];
            uint64_t v57 = [v56 resolveTexture];

            BOOL v58 = [obj stencilAttachment];
            if (v57) {
              [v58 setStoreAction:3];
            }
            else {
              [v58 setStoreAction:1];
            }
          }
          int v59 = DYMTLNewStatefulRenderCommandEncoder(v18, obj);
          [(DYMTLFunctionPlayer *)self setObject:v59 forKey:v15];
          [(DYMTLCommonDebugFunctionPlayer *)self encodeStoreActionForRenderCommandEncoder:v59 withDescriptor:obj];
        }
        else
        {
          p_currentParallelDescriptor = &self->_currentParallelDescriptor;
          objc_storeStrong((id *)&self->_currentParallelDescriptor, obj);
          self->_currentParallelId = v15;
          unint64_t v33 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_persistantEncoder2ParallelMap.__table_.__bucket_list_.__ptr_.__value_, &self->_targetCommandEncoderId);
          if (v33 && v33[3] == v15)
          {
            for (uint64_t j = 0; j != 8; ++j)
            {
              uint64_t v35 = [(MTLRenderPassDescriptor *)*p_currentParallelDescriptor colorAttachments];
              unsigned int v36 = [v35 objectAtIndexedSubscript:j];
              [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v36];
            }
            uint64_t v37 = [(MTLRenderPassDescriptor *)*p_currentParallelDescriptor depthAttachment];
            [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v37];

            uint64_t v38 = [(MTLRenderPassDescriptor *)*p_currentParallelDescriptor stencilAttachment];
            [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v38];

            [(DYMTLCommonDebugFunctionPlayer *)self _modifyDescriptorForStore:*p_currentParallelDescriptor];
          }
          DYMTLNewStatefulParallelRenderCommandEncoder(v18, obj);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          [(DYMTLFunctionPlayer *)self setObject:v19 forKey:v15];
          [(DYMTLCommonDebugFunctionPlayer *)self encodeStoreActionForParallelRenderCommandEncoder:v19 withDescriptor:obj];
        }

        break;
      default:
LABEL_66:
        v61.receiver = self;
        v61.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        [(DYMTLFunctionPlayer *)&v61 executeGraphicsFunction];
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case -16359:
      case -16358:
LABEL_38:
        unint64_t v64 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v4 + 18), 0);
        id v8 = [(DYMTLCommonFunctionPlayer *)self layerManager];
        uint64_t v9 = [(DYMTLCommonDebugFunctionPlayer *)self replayerLayerForDrawableId:v64];
        [v8 prepareLayerForPresent:v9];
        v63.receiver = self;
        v63.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        [(DYMTLFunctionPlayer *)&v63 executeGraphicsFunction];
        id v72 = &v64;
        uint64_t v13 = std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->super._drawableRenderabilityStatusMap, &v64, (uint64_t)&std::piecewise_construct, &v72);
LABEL_39:
        *((unsigned char *)v13 + 24) = 0;
LABEL_40:

        break;
      case -16354:
        if ([*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]) playbackMode] == 9)-[DYMTLCommonDebugFunctionPlayer _updateRemainingCommandsForEncoder](self, "_updateRemainingCommandsForEncoder"); {
        v65.receiver = self;
        }
        v65.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        [(DYMTLFunctionPlayer *)&v65 executeGraphicsFunction];
        break;
      case -16353:
      case -16351:
        goto LABEL_15;
      case -16352:
        v66.receiver = self;
        v66.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
        [(DYMTLFunctionPlayer *)&v66 executeGraphicsFunction];
        self->_bSetStageInRegiouint64_t n = 0;
        self->_stageInIndirectBufferId = 0;
        break;
      default:
        goto LABEL_66;
    }
  }
}

- (AttachmentInfo)_attachmentInfoForCommandEncoderID:(SEL)a3
{
  unint64_t v15 = a4;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x5012000000;
  uint64_t v10 = __Block_byref_object_copy__625;
  long long v11 = __Block_byref_object_dispose__626;
  uint64_t v12 = "";
  long long v13 = 0u;
  long long v14 = 0u;
  if (std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandEncoderDescriptorMap.__table_.__bucket_list_.__ptr_.__value_, &v15))
  {
    GPUTools::MTL::Utils::EnumerateValidAttachmentsForType();
  }
  long long v5 = *((_OWORD *)v8 + 4);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v8 + 3);
  *(_OWORD *)&retstr->unint64_t var2 = v5;
  _Block_object_dispose(&v7, 8);
  return result;
}

uint64_t __69__DYMTLCommonDebugFunctionPlayer__attachmentInfoForCommandEncoderID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  *a5 = 1;
  if ((a2[9] & 0xFFFFFFFELL) == 2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t result = a1 + 32;
    uint64_t v7 = a2[5];
    *(void *)(*(void *)(v6 + 8) + 48) = a2[4];
    *(void *)(*(void *)(*(void *)result + 8) + 56) = v7;
    *(void *)(*(void *)(*(void *)result + 8) + 64) = a2[6];
    id v8 = a2 + 7;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t result = a1 + 32;
    uint64_t v10 = a2[1];
    *(void *)(*(void *)(v9 + 8) + 48) = *a2;
    *(void *)(*(void *)(*(void *)result + 8) + 56) = v10;
    *(void *)(*(void *)(*(void *)result + 8) + 64) = a2[2];
    id v8 = a2 + 3;
  }
  *(void *)(*(void *)(*(void *)result + 8) + 72) = *v8;
  return result;
}

- (void)_addRenderPassDescriptorToEncoderMapFromRenderPassDescriptor:(DYMTLRenderPassDescriptor *)a3 forEncoder:(unint64_t)a4
{
  unint64_t v6 = a4;
  uint64_t v7 = &v6;
  long long v5 = std::__hash_table<std::__hash_value_type<unsigned long long,GPUTools::MTL::Utils::DYMTLRenderPassDescriptor>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,GPUTools::MTL::Utils::DYMTLRenderPassDescriptor>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,GPUTools::MTL::Utils::DYMTLRenderPassDescriptor>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,GPUTools::MTL::Utils::DYMTLRenderPassDescriptor>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_commandEncoderDescriptorMap, (uint64_t *)&v6, (uint64_t)&std::piecewise_construct, &v7);
  memcpy(v5 + 3, a3, 0x63BuLL);
}

- (void)_addRenderPassDescriptorToEncoderMapFromArgumentPointer:(void *)a3 forEncoder:(unint64_t)a4
{
  uint64_t v9 = 0;
  uint64_t v6 = 16;
  do
  {
    uint64_t v7 = &v8[v6];
    *((_OWORD *)v7 + 2) = 0uLL;
    *((_OWORD *)v7 + 3) = 0uLL;
    *(_OWORD *)uint64_t v7 = 0uLL;
    *((_OWORD *)v7 + 1) = 0uLL;
    *((void *)v7 + 8) = 0;
    *((void *)v7 + 9) = 1;
    *((_OWORD *)v7 + 5) = 0uLL;
    *((_OWORD *)v7 + 6) = 0uLL;
    *((void *)v7 + 14) = 0x3FF0000000000000;
    v6 += 144;
    *((void *)v7 + 16) = 0;
    *((void *)v7 + 17) = 0;
  }
  while (v7 + 144 != v10);
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  uint64_t v12 = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v15 = 0x3FF0000000000000;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v21 = 0;
  uint64_t v22 = 1;
  long long v24 = 0u;
  long long v23 = 0u;
  uint64_t v25 = 0x3FF0000000000000;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  GPUTools::MTL::Utils::MakeDYMTLRenderPassDescriptor(*(GPUTools::MTL::Utils **)a3, v8, (DYMTLRenderPassDescriptor *)a3);
  [(DYMTLCommonDebugFunctionPlayer *)self _addRenderPassDescriptorToEncoderMapFromRenderPassDescriptor:v8 forEncoder:a4];
}

- (void)_trackObjects
{
  uint64_t v3 = (int)*MEMORY[0x263F3F9A8];
  unint64_t v25 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 48, 0);
  BOOL v4 = [(DYMTLCommonDebugFunctionPlayer *)self _isFunctionCommandEncoderCreation];
  if ([(DYMTLCommonDebugFunctionPlayer *)self _isReceiverTypeCommandEncoderRelated]|| v4)
  {
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v3);
    uint64_t v6 = v5 + 48;
    uint64_t v7 = v5 + 24;
    if (v4) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = v6;
    }
    self->_lastEncoderID = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(v8, 0);
    self->_disableWireframe = v4;
  }
  uint64_t v9 = *(int **)((char *)&self->super.super.super.super.isa + v3);
  int v10 = *v9;
  if (*v9 <= -16247)
  {
    if (v10 <= -16339)
    {
      if (v10 <= -16344)
      {
        switch(v10)
        {
          case -16363:
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
            goto LABEL_59;
          case -16362:
          case -16360:
          case -16359:
          case -16358:
          case -16357:
          case -16356:
          case -16355:
            return;
          case -16361:
            goto LABEL_30;
          case -16354:
          case -16352:
            goto LABEL_60;
          case -16353:
            goto LABEL_47;
          case -16351:
            unint64_t v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v24);
            long long v21 = v25;
            unint64_t v22 = v24;
            char v23 = 0;
            std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)&self->_parallelEncoderMap, &v24, &v24, &v21);
            [(DYMTLCommonDebugFunctionPlayer *)self _addRenderPassDescriptorToEncoderMapFromArgumentPointer:*(void **)((char *)&self->super.super.super._executePlatform + (int)*MEMORY[0x263F3F970]) forEncoder:v24];
            return;
          default:
            if (v10 == -16383) {
              goto LABEL_58;
            }
            int v12 = -16376;
            goto LABEL_42;
        }
      }
      if ((v10 + 16343) >= 2) {
        return;
      }
LABEL_53:
      unint64_t v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
      p_commandBufferMap = &self->_commandBufferMap;
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_commandBufferMap, &v24);
      *(void *)&long long v21 = v25;
      BYTE8(v21) = 0;
      std::__hash_table<std::__hash_value_type<unsigned long long,CommandBufferInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CommandBufferInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CommandBufferInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CommandBufferInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,CommandBufferInfo>((uint64_t)p_commandBufferMap, &v24, &v24, &v21);
      return;
    }
    if (v10 > -16288)
    {
      switch(v10)
      {
        case -16287:
          std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
          break;
        case -16286:
          unint64_t v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
          long long v19 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_parallelEncoderMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
          std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v24);
          long long v21 = (unint64_t)v19[3];
          unint64_t v22 = v24;
          char v23 = 0;
          std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)&self->_encoderMap, &v24, &v24, &v21);
          unint64_t v20 = v25;
          *(void *)&long long v21 = &v24;
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&self->_encoderToParallelEncoderMap, &v24, (uint64_t)&std::piecewise_construct, (void **)&v21)[3] = v20;
          break;
        case -16285:
          uint64_t v17 = 1912;
          goto LABEL_55;
        case -16280:
          goto LABEL_58;
        case -16279:
          goto LABEL_49;
        default:
          return;
      }
      return;
    }
    if ((v10 + 16316) >= 2)
    {
      if (v10 != -16338)
      {
        int v12 = -16325;
        goto LABEL_42;
      }
      goto LABEL_58;
    }
LABEL_37:
    *(void *)&long long v21 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
    std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long &>((uint64_t)&self->_commandQueueSet, (unint64_t *)&v21, &v21);
    return;
  }
  if (v10 > -15890)
  {
    if (v10 > -15790)
    {
      if (v10 <= -15351)
      {
        if (v10 == -15789) {
          goto LABEL_54;
        }
        int v11 = -15701;
      }
      else
      {
        if (v10 == -15350) {
          goto LABEL_37;
        }
        if (v10 == -15343) {
          goto LABEL_30;
        }
        int v11 = -12544;
      }
      if (v10 != v11) {
        return;
      }
      goto LABEL_53;
    }
    if (v10 <= -15871)
    {
      if (v10 != -15889)
      {
        int v12 = -15884;
LABEL_42:
        if (v10 != v12) {
          return;
        }
        goto LABEL_54;
      }
LABEL_58:
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
LABEL_59:
      self->_lastEncoderID = 0;
      return;
    }
    if (v10 != -15870)
    {
      if (v10 != -15790) {
        return;
      }
      goto LABEL_58;
    }
LABEL_60:
    unint64_t v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
    p_encoderMap = &self->_encoderMap;
    std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_encoderMap, &v24);
    unint64_t v22 = 0;
    long long v21 = v25;
    char v23 = 0;
    std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)p_encoderMap, &v24, &v24, &v21);
    return;
  }
  if (v10 > -16171)
  {
    if ((v10 + 16014) >= 2)
    {
      if (v10 == -16170) {
        goto LABEL_54;
      }
      if (v10 != -15908) {
        return;
      }
LABEL_30:
      *((unsigned char *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_commandBufferMap.__table_.__bucket_list_.__ptr_.__value_, &v25)+ 32) = 1;
      return;
    }
    goto LABEL_60;
  }
  if (v10 <= -16196)
  {
    if (v10 != -16246)
    {
      if (v10 != -16238) {
        return;
      }
      p_textureToDrawableMap = &self->_textureToDrawableMap;
      long long v14 = &v25;
LABEL_48:
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(p_textureToDrawableMap, v14);
      return;
    }
LABEL_54:
    uint64_t v17 = 1872;
LABEL_55:
    *((unsigned char *)std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>((Class *)((char *)&self->super.super.super.super.isa + v17), &v25)+ 48) = 1;
    return;
  }
  switch(v10)
  {
    case -16195:
LABEL_47:
      unint64_t v24 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v9 + 6), 0);
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__erase_unique<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v24);
      long long v21 = v25;
      unint64_t v22 = v24;
      char v23 = 0;
      std::__hash_table<std::__hash_value_type<unsigned long long,EncoderInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,EncoderInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,EncoderInfo>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,EncoderInfo>((uint64_t)&self->_encoderMap, &v24, &v24, &v21);
      [(DYMTLCommonDebugFunctionPlayer *)self _addRenderPassDescriptorToEncoderMapFromArgumentPointer:*(void **)((char *)&self->super.super.super._executePlatform + (int)*MEMORY[0x263F3F970]) forEncoder:v24];
      p_textureToDrawableMap = &self->_encoderToParallelEncoderMap;
      long long v14 = &v24;
      goto LABEL_48;
    case -16193:
      goto LABEL_58;
    case -16192:
LABEL_49:
      uint64_t v15 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&self->_encoderMap.__table_.__bucket_list_.__ptr_.__value_, &v25);
      void v15[4] = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v3) + 72, 0);
      break;
  }
}

- (void)_forceAttachmentLoadActionToLoad:(id)a3
{
  id v5 = a3;
  uint64_t v3 = [v5 texture];
  if (v3)
  {
    uint64_t v4 = [v5 loadAction];

    if (!v4) {
      [v5 setLoadAction:1];
    }
  }
}

- (void)_forceAttachmentStoreActionToStore:(id)a3
{
  id v7 = a3;
  uint64_t v3 = [v7 texture];
  if (v3)
  {
    if ([v7 storeAction])
    {
      uint64_t v4 = [v7 storeAction];

      if (v4 != 4) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v5 = [v7 resolveTexture];
    if (v5) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 1;
    }
    [v7 setStoreAction:v6];
  }
LABEL_10:
}

- (void)_updateMemorylessTextures:(id)a3
{
  id v20 = a3;
  uint64_t v4 = [v20 texture];
  if ([v4 storageMode] == 3)
  {
    id v5 = (void *)sMemorylessTexturesAndReplacements;
    uint64_t v6 = [NSNumber numberWithUnsignedLong:v4];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
      uint64_t v8 = DYMTLGetAssociatedObject(v4, 0);
      [v8 setStorageMode:2];
      uint64_t v9 = [(DYMTLFunctionPlayer *)self device];
      id v7 = DYMTLNewTexture(v9, v8);

      if (!v7) {
        goto LABEL_15;
      }
      int v10 = (void *)sMemorylessTexturesAndReplacements;
      int v11 = [NSNumber numberWithUnsignedLong:v4];
      [v10 setObject:v7 forKeyedSubscript:v11];
    }
    if (![v20 loadAction]) {
      [v20 setLoadAction:2];
    }
    [v20 setTexture:v7];
  }
  int v12 = [v20 resolveTexture];

  if (!v12) {
    goto LABEL_16;
  }
  uint64_t v8 = [v20 resolveTexture];
  if ([v8 storageMode] == 3)
  {
    long long v13 = (void *)sMemorylessTexturesAndReplacements;
    long long v14 = [NSNumber numberWithUnsignedLong:v8];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    if (!v15)
    {
      long long v16 = DYMTLGetAssociatedObject(v8, 0);
      [v16 setStorageMode:2];
      uint64_t v17 = [(DYMTLFunctionPlayer *)self device];
      uint64_t v15 = DYMTLNewTexture(v17, v16);

      if (!v15)
      {
LABEL_14:

        goto LABEL_15;
      }
      long long v18 = (void *)sMemorylessTexturesAndReplacements;
      long long v19 = [NSNumber numberWithUnsignedLong:v8];
      [v18 setObject:v15 forKeyedSubscript:v19];
    }
    [v20 setResolveTexture:v15];
    long long v16 = (void *)v15;
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
}

- (id)_generateDummyPipeline:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    long long v19 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = DYMTLGetAssociatedObject(v4, 2u);
  if (v6)
  {
    if (!self->_nopDrawVertexFunction)
    {
      id v7 = [(DYMTLFunctionPlayer *)self device];
      id v23 = 0;
      uint64_t v8 = objc_msgSend(v7, "newLibraryWithSource:options:error:", @"#include <metal_stdlib>\n\nusing namespace metal;\n\nstruct TransformMatrices\n{\n    float4 modelview_projection_matrix[4];\n};\n\nstruct VertexOutput\n{\n    float4 pos [[position]];\n    float4 color;\n};\n\nvertex VertexOutput defaultVertexProgram(uint vid [[ vertex_id ]])\n{\n    VertexOutput out;\n\n    out.pos   = float4(0.0, 0.0, 0.0, 1.0);\n    out.color = float4(0.0, 0.0, 0.0, 1.0);\n\n    return out;\n}\n\nfragment float4 defaultFragmentProgram(VertexOutput vo [[ stage_in ]])\n{\n    return float4(vo.color.bgr, 1.0f);\n}\n\nkernel void defaultKernel()\n{\n\n}\n\n",
                     0,
                     &v23);
      id v9 = v23;

      int v10 = (MTLFunction *)[v8 newFunctionWithName:@"defaultVertexProgram"];
      nopDrawVertexFunctiouint64_t n = self->_nopDrawVertexFunction;
      self->_nopDrawVertexFunctiouint64_t n = v10;

      int v12 = (MTLFunction *)[v8 newFunctionWithName:@"defaultFragmentProgram"];
      nopDrawFragFunctiouint64_t n = self->_nopDrawFragFunction;
      self->_nopDrawFragFunctiouint64_t n = v12;

      long long v14 = (MTLFunction *)[v8 newFunctionWithName:@"defaultKernel"];
      nopTileFunctiouint64_t n = self->_nopTileFunction;
      self->_nopTileFunctiouint64_t n = v14;
    }
    long long v16 = DYMTLGetNullableAssociatedObject(v5, 0);
    uint64_t v17 = (void *)[v16 copy];

    if (v17)
    {
      if (!self->_nopDrawVertexFunction || !self->_nopDrawFragFunction)
      {
        long long v19 = 0;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v17, "setVertexFunction:");
      [v17 setFragmentFunction:self->_nopDrawFragFunction];
      long long v18 = [(DYMTLFunctionPlayer *)self device];
      long long v19 = (void *)[v18 newRenderPipelineStateWithDescriptor:v17 error:0];
    }
    else
    {
      id v20 = DYMTLGetNullableAssociatedObject(v5, 1u);
      long long v18 = (void *)[v20 copy];

      if (v18 && self->_nopTileFunction)
      {
        objc_msgSend(v18, "setTileFunction:");
        long long v21 = [(DYMTLFunctionPlayer *)self device];
        long long v19 = (void *)[v21 newRenderPipelineStateWithTileDescriptor:v18 options:0 reflection:0 error:0];
      }
      else
      {
        long long v19 = 0;
      }
    }

    goto LABEL_17;
  }
  long long v19 = 0;
LABEL_18:

LABEL_19:
  return v19;
}

- (void)_swizzleAttachmentTextureForLoad:(id)a3 withBuffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 texture];
  id v9 = v8;
  if (v8)
  {
    int v10 = DYMTLGetAssociatedObject(v8, 0);
    [v10 setRotation:0];
    if (([v10 usage] & 1) == 0)
    {
      objc_msgSend(v10, "setUsage:", objc_msgSend(v10, "usage") | 5);
      int v11 = [(DYMTLFunctionPlayer *)self device];
      int v12 = DYMTLNewTexture(v11, v10);

      if ([v6 loadAction] == 1)
      {
        long long v13 = [v7 blitCommandEncoder];
        uint64_t v17 = [v6 slice];
        uint64_t v14 = [v6 level];
        v20[0] = 0;
        v20[1] = 0;
        v20[2] = [v6 depthPlane];
        v19[0] = [v9 width];
        v19[1] = [v9 height];
        v19[2] = 1;
        uint64_t v15 = [v6 slice];
        uint64_t v16 = [v6 level];
        v18[0] = 0;
        v18[1] = 0;
        v18[2] = [v6 depthPlane];
        [v13 copyFromTexture:v9 sourceSlice:v17 sourceLevel:v14 sourceOrigin:v20 sourceSize:v19 toTexture:v12 destinationSlice:v15 destinationLevel:v16 destinationOrigin:v18];
        [v13 endEncoding];
      }
      [v6 setTexture:v12];
      [(DYMTLFunctionPlayer *)self setObject:v12 forKey:v12];
    }
  }
}

- (void)_modifyDescriptorForLayering:(id)a3 withBuffer:(id)a4
{
  id v46 = a3;
  id v6 = a4;
  id v7 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
  if ([v7 playbackMode] != 7) {
    goto LABEL_23;
  }
  for (uint64_t i = 0; i != 8; ++i)
  {
    id v9 = [v46 colorAttachments];
    int v10 = [v9 objectAtIndexedSubscript:i];
    [(DYMTLCommonDebugFunctionPlayer *)self _forceAttachmentLoadActionToLoad:v10];

    int v11 = [v46 colorAttachments];
    int v12 = [v11 objectAtIndexedSubscript:i];
    [(DYMTLCommonDebugFunctionPlayer *)self _forceAttachmentStoreActionToStore:v12];

    long long v13 = [v46 colorAttachments];
    uint64_t v14 = [v13 objectAtIndexedSubscript:i];
    if (v14)
    {
      uint64_t v15 = [v46 colorAttachments];
      uint64_t v16 = [v15 objectAtIndexedSubscript:i];
      uint64_t v17 = [v16 texture];

      if (v17)
      {
        long long v18 = [v46 colorAttachments];
        long long v19 = [v18 objectAtIndexedSubscript:i];
        [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v19];

        id v20 = [v46 colorAttachments];
        long long v21 = [v20 objectAtIndexedSubscript:i];
        [(DYMTLCommonDebugFunctionPlayer *)self _swizzleAttachmentTextureForLoad:v21 withBuffer:v6];

        goto LABEL_8;
      }
    }
    else
    {
    }
    id v20 = [v46 colorAttachments];
    [v20 setObject:0 atIndexedSubscript:i];
LABEL_8:
  }
  unint64_t v22 = [v46 depthAttachment];
  if (v22)
  {
    id v23 = [v46 stencilAttachment];
    if (v23)
    {
      unint64_t v24 = [v46 depthAttachment];
      unint64_t v25 = [v24 texture];
      uint64_t v26 = [v46 stencilAttachment];
      uint64_t v27 = [v26 texture];

      if (v25 == v27)
      {
        uint64_t v28 = [v46 depthAttachment];
        [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v28];

        unint64_t v29 = [v46 depthAttachment];
        [(DYMTLCommonDebugFunctionPlayer *)self _swizzleAttachmentTextureForLoad:v29 withBuffer:v6];

        uint64_t v30 = [v46 depthAttachment];
        uint64_t v31 = [v30 texture];
        id v32 = [v46 stencilAttachment];
        [v32 setTexture:v31];

        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  unint64_t v33 = [v46 depthAttachment];
  [(DYMTLCommonDebugFunctionPlayer *)self _forceAttachmentLoadActionToLoad:v33];

  unint64_t v34 = [v46 depthAttachment];
  [(DYMTLCommonDebugFunctionPlayer *)self _forceAttachmentStoreActionToStore:v34];

  uint64_t v35 = [v46 depthAttachment];
  if (v35
    && ([v46 depthAttachment],
        unsigned int v36 = objc_claimAutoreleasedReturnValue(),
        [v36 texture],
        uint64_t v37 = objc_claimAutoreleasedReturnValue(),
        v37,
        v36,
        v35,
        v37))
  {
    uint64_t v38 = [v46 depthAttachment];
    [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v38];

    unint64_t v39 = [v46 depthAttachment];
    [(DYMTLCommonDebugFunctionPlayer *)self _swizzleAttachmentTextureForLoad:v39 withBuffer:v6];
  }
  else
  {
    [v46 setDepthAttachment:0];
  }
  id v40 = [v46 stencilAttachment];
  [(DYMTLCommonDebugFunctionPlayer *)self _forceAttachmentLoadActionToLoad:v40];

  BOOL v41 = [v46 stencilAttachment];
  [(DYMTLCommonDebugFunctionPlayer *)self _forceAttachmentStoreActionToStore:v41];

  unint64_t v42 = [v46 stencilAttachment];
  if (v42
    && ([v46 stencilAttachment],
        v43 = objc_claimAutoreleasedReturnValue(),
        [v43 texture],
        BOOL v44 = objc_claimAutoreleasedReturnValue(),
        v44,
        v43,
        v42,
        v44))
  {
    __int16 v45 = [v46 stencilAttachment];
    [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v45];

    uint64_t v30 = [v46 stencilAttachment];
    [(DYMTLCommonDebugFunctionPlayer *)self _swizzleAttachmentTextureForLoad:v30 withBuffer:v6];
LABEL_21:
  }
  else
  {
    [v46 setStencilAttachment:0];
  }
LABEL_23:
}

- (void)_modifyDescriptorForStore:(id)a3
{
  id v21 = a3;
  id v4 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
  if ([v4 playbackMode] == 4 || !objc_msgSend(v4, "playbackMode"))
  {
    for (uint64_t i = 0; i != 8; ++i)
    {
      id v6 = [v21 colorAttachments];
      id v7 = [v6 objectAtIndexedSubscript:i];
      [(DYMTLCommonDebugFunctionPlayer *)self _forceAttachmentStoreActionToStore:v7];

      uint64_t v8 = [v21 colorAttachments];
      id v9 = [v8 objectAtIndexedSubscript:i];
      int v10 = [v9 texture];

      int v11 = [v21 colorAttachments];
      if (v10)
      {
        int v12 = [v11 objectAtIndexedSubscript:i];
        [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v12];
      }
      else
      {
        [v11 setObject:0 atIndexedSubscript:i];
      }
    }
    long long v13 = [v21 depthAttachment];
    [(DYMTLCommonDebugFunctionPlayer *)self _forceAttachmentStoreActionToStore:v13];

    uint64_t v14 = [v21 depthAttachment];
    uint64_t v15 = [v14 texture];

    if (v15)
    {
      uint64_t v16 = [v21 depthAttachment];
      [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v16];
    }
    else
    {
      [v21 setDepthAttachment:0];
    }
    uint64_t v17 = [v21 stencilAttachment];
    [(DYMTLCommonDebugFunctionPlayer *)self _forceAttachmentStoreActionToStore:v17];

    long long v18 = [v21 stencilAttachment];
    long long v19 = [v18 texture];

    if (v19)
    {
      id v20 = [v21 stencilAttachment];
      [(DYMTLCommonDebugFunctionPlayer *)self _updateMemorylessTextures:v20];
    }
    else
    {
      [v21 setStencilAttachment:0];
    }
  }
}

- (BOOL)_isFunctionCommandEncoderCreation
{
  int v2 = **(_DWORD **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A8]);
  return (v2 + 16354) < 3 || (v2 + 16014) < 2 || v2 == -16195;
}

- (BOOL)_isReceiverTypeCommandEncoderRelated
{
  unsigned int v2 = GPUTools::MTL::GetFuncEnumReceiverType((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa
                                                                                 + (int)*MEMORY[0x263F3F9A8]))
     - 21;
  return (v2 < 0x3E) & (0x2002000000200081uLL >> v2);
}

- (BOOL)isBlitSamplingSupported
{
  v9.receiver = self;
  v9.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  unsigned int v2 = [(DYMTLFunctionPlayer *)&v9 device];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 name];
    id v5 = [v4 lowercaseString];
    char v6 = [v5 hasPrefix:@"nvidia"];

    char v7 = v6 ^ 1;
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)setupCounterConfigurationAndGetFrameProfilerCounters
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  uint64_t v3 = [(DYMTLFunctionPlayer *)&v15 commandQueue];
  if (v3)
  {
    if ([(DYMTLCommonDebugFunctionPlayer *)self isBlitSamplingSupported]) {
      uint64_t v4 = 41493;
    }
    else {
      uint64_t v4 = 33297;
    }
    [v3 setStatLocations:v4];
    [v3 availableCounters];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isEqualToString:", self->_statVertices, (void)v11))
          {

            goto LABEL_15;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    [(NSMutableArray *)self->_frameCounters removeObject:self->_statVertices];
    [(NSMutableArray *)self->_frameCounters removeObject:self->_statPixels];
LABEL_15:
    objc_super v9 = self->_frameCounters;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (void)enableStatsSampling:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  id v5 = [(DYMTLFunctionPlayer *)&v7 commandQueue];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 setStatEnabled:v3];
    if (v3)
    {
      [v6 setStatOptions:1];
      if (self->_isAGXDevice)
      {
        [v6 setStatOptions:0x10000000];
        [v6 setGPUPriority:0];
      }
    }
  }
}

- (BOOL)isCounterAvailable:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  id v5 = [(DYMTLFunctionPlayer *)&v16 commandQueue];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 availableCounters];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(v4, "isEqualToString:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)setupAllStatLocationsWithBlitOption:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  id v5 = [(DYMTLFunctionPlayer *)&v8 commandQueue];
  if (v5)
  {
    if (self->_isAGXDevice) {
      uint64_t v6 = 63;
    }
    else {
      uint64_t v6 = 33297;
    }
    if (!self->_isAGXDevice && v3)
    {
      if ([(DYMTLCommonDebugFunctionPlayer *)self isBlitSamplingSupported]) {
        uint64_t v6 = 41493;
      }
      else {
        uint64_t v6 = 33297;
      }
    }
    [v5 setStatLocations:v6];
  }
}

- (void)setupProfilingForCounterLists
{
  if (self->_isAGXDevice)
  {
    v10.receiver = self;
    v10.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
    BOOL v3 = [(DYMTLFunctionPlayer *)&v10 commandQueue];
    if (v3)
    {
      id v4 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __63__DYMTLCommonDebugFunctionPlayer_setupProfilingForCounterLists__block_invoke_2;
      v8[3] = &unk_265339408;
      id v5 = &v9;
      v8[4] = self;
      id v9 = v4;
      id v6 = v4;
      [v3 addPerfSampleHandler:v8];
LABEL_6:
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
    BOOL v3 = [(DYMTLFunctionPlayer *)&v13 commandQueue];
    if (v3)
    {
      id v7 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __63__DYMTLCommonDebugFunctionPlayer_setupProfilingForCounterLists__block_invoke;
      v11[3] = &unk_265339408;
      id v5 = &v12;
      v11[4] = self;
      id v12 = v7;
      id v6 = v7;
      [v3 addPerfSampleHandler:v11];
      goto LABEL_6;
    }
  }
}

void __63__DYMTLCommonDebugFunctionPlayer_setupProfilingForCounterLists__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v8 && a4)
  {
    id v56 = v8;
    id v54 = v7;
    id v55 = v7;
    uint64_t v60 = [v55 getListIndex];
    id v9 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 5904), "objectAtIndexedSubscript:");
    uint64_t v61 = [v9 count];

    if ([v56 length] < (unint64_t)(8 * v61))
    {
LABEL_50:

      id v8 = v56;
      goto LABEL_51;
    }
    id v58 = v56;
    uint64_t v10 = [v58 bytes];
    uint64_t v11 = v60;
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(v10 + 8 * *(unsigned int *)(v12 + 3976));
    if (*(id *)(v12 + 4056) == v55)
    {
      uint64_t v14 = 4096;
      unint64_t v15 = v61;
      if (*(void *)(v12 + 4064) == v13 && v61 == (uint64_t)(*(void *)(v12 + 4104) - *(void *)(v12 + 4096)) >> 3)
      {
LABEL_12:
        uint64_t v22 = 0;
        *(void *)(v12 + 4056) = v55;
        long long __p = 0;
        objc_super v63 = 0;
        unint64_t v64 = 0;
        uint64_t v57 = a4;
        do
        {
          uint64_t v23 = v14;
          uint64_t v24 = [v58 bytes];
          uint64_t v25 = v61;
          uint64_t v59 = v22;
          uint64_t v26 = v24 + 8 * v22 * v61;
          uint64_t v27 = *(void *)(a1 + 32);
          uint64_t v28 = *(void *)(v26 + 8 * *(unsigned int *)(v27 + 3976));
          uint64_t v29 = *(void *)(v26 + 8 * *(unsigned int *)(v27 + 3980));
          if (*(void *)(v27 + 4080) != v28 || *(void *)(v27 + 4088) != v29)
          {
            ++*(void *)(v27 + 4072);
            uint64_t v31 = (void *)(*(void *)(a1 + 32) + 4080);
            *uint64_t v31 = v28;
            v31[1] = v29;
          }
          uint64_t v14 = v23;
          if (v61)
          {
            unint64_t v32 = 0;
            do
            {
              uint64_t v33 = *(void *)(a1 + 32);
              uint64_t v34 = *(unsigned int *)(v33 + 3984);
              if (*(void *)(v26 + 8 * v34))
              {
                unint64_t v35 = *(void *)(v26 + 8 * v32);
                if ((*(void *)(*(void *)(v33 + 3912) + ((v32 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v32))
                {
                  unint64_t v36 = *(void *)(*(void *)(v33 + (int)v14) + 8 * v32);
                  BOOL v37 = v35 >= v36;
                  unint64_t v38 = v35 - v36;
                  if (v37) {
                    unint64_t v35 = v38;
                  }
                  else {
                    unint64_t v35 = 0;
                  }
                }
                unint64_t v39 = *(void *)(*(void *)(v33 + 1808) + 8 * v11) + v32;
                id v40 = v63;
                if (v63 >= v64)
                {
                  uint64_t v42 = a1;
                  v43 = (char *)__p;
                  unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * ((v63 - (unsigned char *)__p) >> 4);
                  unint64_t v45 = v44 + 1;
                  if (v44 + 1 > 0x555555555555555) {
                    std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v46 = v14;
                  if (0x5555555555555556 * ((v64 - (unsigned char *)__p) >> 4) > v45) {
                    unint64_t v45 = 0x5555555555555556 * ((v64 - (unsigned char *)__p) >> 4);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * ((v64 - (unsigned char *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
                    unint64_t v47 = 0x555555555555555;
                  }
                  else {
                    unint64_t v47 = v45;
                  }
                  if (v47)
                  {
                    double v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&v64, v47);
                    v43 = (char *)__p;
                    id v40 = v63;
                  }
                  else
                  {
                    double v48 = 0;
                  }
                  BOOL v49 = &v48[16 * ((v63 - (unsigned char *)__p) >> 4)];
                  *(void *)BOOL v49 = *(void *)(v33 + 4064);
                  *((void *)v49 + 1) = *(void *)(v33 + 4072);
                  *((void *)v49 + 2) = *(void *)(v26 + 8 * v34);
                  *((void *)v49 + 3) = v39;
                  *((void *)v49 + 4) = v35;
                  *((void *)v49 + 5) = 0;
                  if (v40 == v43)
                  {
                    uint64_t v51 = &v48[48 * v44];
                    a1 = v42;
                  }
                  else
                  {
                    double v50 = &v48[48 * v44];
                    a1 = v42;
                    do
                    {
                      uint64_t v51 = v50 - 48;
                      long long v52 = *((_OWORD *)v40 - 3);
                      long long v53 = *((_OWORD *)v40 - 1);
                      *((_OWORD *)v50 - 2) = *((_OWORD *)v40 - 2);
                      *((_OWORD *)v50 - 1) = v53;
                      *((_OWORD *)v50 - 3) = v52;
                      v40 -= 48;
                      v50 -= 48;
                    }
                    while (v40 != v43);
                  }
                  BOOL v41 = v49 + 48;
                  long long __p = v51;
                  objc_super v63 = v49 + 48;
                  unint64_t v64 = &v48[48 * v47];
                  uint64_t v11 = v60;
                  if (v43) {
                    operator delete(v43);
                  }
                  uint64_t v25 = v61;
                  uint64_t v14 = v46;
                }
                else
                {
                  *(void *)objc_super v63 = *(void *)(v33 + 4064);
                  *((void *)v40 + 1) = *(void *)(v33 + 4072);
                  *((void *)v40 + 2) = *(void *)(v26 + 8 * v34);
                  *((void *)v40 + 3) = v39;
                  *((void *)v40 + 4) = v35;
                  *((void *)v40 + 5) = 0;
                  BOOL v41 = v40 + 48;
                }
                objc_super v63 = v41;
                uint64_t v33 = *(void *)(a1 + 32);
              }
              *(void *)(*(void *)(v33 + 4096) + 8 * v32) = *(void *)(v26 + 8 * v32);
              ++v32;
            }
            while (v32 != v25);
            a4 = v57;
          }
          uint64_t v22 = v59 + 1;
        }
        while (v59 + 1 != a4);
        [*(id *)(a1 + 40) addCommandBufferFrameProfile:&__p];
        id v7 = v54;
        if (__p)
        {
          objc_super v63 = (char *)__p;
          operator delete(__p);
        }
        goto LABEL_50;
      }
    }
    else
    {
      unint64_t v15 = v61;
    }
    std::vector<unsigned long long>::resize(v12 + 4096, v15);
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(v16 + 4104) - *(void *)(v16 + 4096);
    if (v17 >= 1)
    {
      bzero(*(void **)(v16 + 4096), 8 * (((unint64_t)v17 >> 3) - ((unint64_t)v17 > 7)) + 8);
      uint64_t v16 = *(void *)(a1 + 32);
    }
    *(void *)(v16 + 4064) = v13;
    *(void *)(*(void *)(a1 + 32) + 4072) = 0;
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = [v58 bytes];
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = *(void *)(v19 + 8 * *(unsigned int *)(v20 + 3980));
    v20 += 4080;
    *(void *)uint64_t v20 = *(void *)(v18 + 4064);
    *(void *)(v20 + 8) = v21;
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v14 = 4096;
    goto LABEL_12;
  }
LABEL_51:
}

void __63__DYMTLCommonDebugFunctionPlayer_setupProfilingForCounterLists__block_invoke_2(uint64_t a1, void *a2, void *a3, unint64_t a4)
{
  id v6 = a2;
  id v72 = a3;
  id v7 = v6;
  uint64_t v75 = [v7 getListIndex];
  id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 5904), "objectAtIndexedSubscript:");
  unint64_t v76 = [v8 count];

  id v9 = *(void **)(a1 + 32);
  if ((id)v9[507] != v7 || v76 != (uint64_t)(v9[513] - v9[512]) >> 3)
  {
    std::vector<unsigned long long>::resize((uint64_t)(v9 + 512), v76);
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = (void *)v9[512];
    uint64_t v11 = v9[513] - (void)v10;
    if (v11 >= 1)
    {
      bzero(v10, 8 * (((unint64_t)v11 >> 3) - ((unint64_t)v11 > 7)) + 8);
      id v9 = *(void **)(a1 + 32);
    }
  }
  objc_super v70 = v7;
  v9[507] = v7;
  uint64_t v84 = 0;
  id v85 = 0;
  unint64_t v86 = 0;
  long long v81 = 0u;
  long long v82 = 0u;
  int v83 = 1065353216;
  unint64_t v12 = 4 * ([*(id *)(a1 + 40) playbackMode] != 9);
  uint64_t v74 = a1;
  if (v12 < a4)
  {
    do
    {
      unint64_t v73 = v12;
      uint64_t v13 = [v72 bytes] + 8 * v12 * v76;
      uint64_t v14 = *(void *)(a1 + 32);
      if (*(void *)(v13 + 8 * *(unsigned int *)(v14 + 3976)) != -1)
      {
        unint64_t v15 = std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::find<unsigned long long>(&v81, (unint64_t *)(v13 + 8 * *(unsigned int *)(v14 + 3980)));
        unint64_t v16 = v76;
        if (v15)
        {
          uint64_t v77 = v15[3];
        }
        else
        {
          uint64_t v17 = *((void *)&v82 + 1);
          long long __p = (void *)(v13 + 8 * *(unsigned int *)(*(void *)(a1 + 32) + 3980));
          uint64_t v77 = 0;
          std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)&v81, (unint64_t *)__p, (uint64_t)&std::piecewise_construct, (void **)&__p)[3] = v17;
          unint64_t v16 = v76;
        }
        uint64_t v18 = v75;
        if (v16)
        {
          for (unint64_t i = 0; i != v16; ++i)
          {
            uint64_t v20 = *(void *)(a1 + 32);
            if (*(void *)(v13 + 8 * *(unsigned int *)(v20 + 3992)) == 2)
            {
              uint64_t v21 = *(void *)(v20 + 3912);
              uint64_t v22 = *(void *)(v13 + 8 * i);
              if ((*(void *)(v21 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) >> i)) {
                v22 -= *(void *)(*(void *)(v20 + 4096) + 8 * i);
              }
              unint64_t v23 = *(unsigned int *)(v20 + 3996);
              uint64_t v24 = *(void *)(v13 + 8 * v23);
              if ((*(void *)(v21 + ((v23 >> 3) & 0x1FFFFFF8)) >> v23)) {
                v24 -= *(void *)(*(void *)(v20 + 4096) + 8 * v23);
              }
              uint64_t v25 = *(unsigned int *)(v20 + 3976);
              uint64_t v26 = *(unsigned int *)(v20 + 3988);
              unint64_t v27 = *(void *)(*(void *)(v20 + 1808) + 8 * v18) + i;
              uint64_t v28 = v85;
              if ((unint64_t)v85 >= v86)
              {
                uint64_t v30 = v84;
                unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((v85 - v84) >> 4);
                unint64_t v32 = v31 + 1;
                if (v31 + 1 > 0x555555555555555) {
                  std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
                }
                if (0x5555555555555556 * ((uint64_t)(v86 - (void)v84) >> 4) > v32) {
                  unint64_t v32 = 0x5555555555555556 * ((uint64_t)(v86 - (void)v84) >> 4);
                }
                if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v86 - (void)v84) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
                  unint64_t v33 = 0x555555555555555;
                }
                else {
                  unint64_t v33 = v32;
                }
                if (v33)
                {
                  uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&v86, v33);
                  uint64_t v30 = v84;
                  uint64_t v28 = v85;
                }
                else
                {
                  uint64_t v34 = 0;
                }
                unint64_t v35 = &v34[48 * v31];
                *(void *)unint64_t v35 = *(void *)(v13 + 8 * v25);
                *((void *)v35 + 1) = v77;
                *((void *)v35 + 2) = *(void *)(v13 + 8 * v26);
                *((void *)v35 + 3) = v27;
                *((void *)v35 + 4) = v22;
                *((void *)v35 + 5) = v24;
                if (v28 == v30)
                {
                  BOOL v37 = &v34[48 * v31];
                  a1 = v74;
                }
                else
                {
                  unint64_t v36 = &v34[48 * v31];
                  a1 = v74;
                  do
                  {
                    BOOL v37 = v36 - 48;
                    long long v38 = *((_OWORD *)v28 - 3);
                    long long v39 = *((_OWORD *)v28 - 1);
                    *((_OWORD *)v36 - 2) = *((_OWORD *)v28 - 2);
                    *((_OWORD *)v36 - 1) = v39;
                    *((_OWORD *)v36 - 3) = v38;
                    v28 -= 48;
                    v36 -= 48;
                  }
                  while (v28 != v30);
                }
                uint64_t v29 = (uint64_t *)(v35 + 48);
                uint64_t v84 = v37;
                id v85 = v35 + 48;
                unint64_t v86 = (unint64_t)&v34[48 * v33];
                if (v30) {
                  operator delete(v30);
                }
                uint64_t v18 = v75;
                unint64_t v16 = v76;
              }
              else
              {
                *(void *)id v85 = *(void *)(v13 + 8 * v25);
                *((void *)v28 + 1) = v77;
                *((void *)v28 + 2) = *(void *)(v13 + 8 * v26);
                *((void *)v28 + 3) = v27;
                *((void *)v28 + 4) = v22;
                *((void *)v28 + 5) = v24;
                uint64_t v29 = (uint64_t *)(v28 + 48);
              }
              id v85 = (char *)v29;
            }
            else
            {
              *(void *)(*(void *)(v20 + 4096) + 8 * i) = *(void *)(v13 + 8 * i);
            }
          }
        }
      }
      unint64_t v12 = v73 + 1;
    }
    while (v73 + 1 != a4);
  }
  unint64_t v40 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((v85 - v84) >> 4));
  if (v85 == v84) {
    uint64_t v41 = 0;
  }
  else {
    uint64_t v41 = v40;
  }
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long> *,false>((uint64_t)v84, (uint64_t *)v85, (uint64_t)&__p, v41, 1);
  long long __p = 0;
  unint64_t v79 = 0;
  id v80 = 0;
  std::vector<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>::reserve(&__p, 2 * v76 * *((void *)&v82 + 1));
  uint64_t v42 = v84;
  v43 = v85;
  uint64_t v44 = v75;
  if (v84 != v85)
  {
    unint64_t v45 = 0;
    do
    {
      if (v45
        && (uint64_t v46 = *((void *)v45 + 3), v46 == *((void *)v42 + 3))
        && *((void *)v45 + 2) == *((void *)v42 + 2)
        && ((double v48 = v45, v47 = *(void *)v45, *((void *)v48 + 1) == *((void *)v42 + 1))
          ? (BOOL v49 = v47 == *(void *)v42)
          : (BOOL v49 = 0),
            v49))
      {
        uint64_t v66 = *(void *)(v74 + 32);
        uint64_t v67 = v46 - *(void *)(*(void *)(v66 + 1808) + 8 * v44);
        if (v67 != *(_DWORD *)(v66 + 3976)
          && v67 != *(_DWORD *)(v66 + 3980)
          && v67 != *(_DWORD *)(v66 + 3984)
          && v67 != *(_DWORD *)(v66 + 3988)
          && v67 != *(_DWORD *)(v66 + 3992))
        {
          objc_super v68 = v79;
          uint64_t v69 = *((void *)v79 - 1);
          *((void *)v79 - 2) += *((void *)v42 + 4);
          *((void *)v68 - 1) = v69 + *((void *)v42 + 5);
        }
      }
      else
      {
        double v50 = v79;
        if (v79 >= v80)
        {
          id v54 = (char *)__p;
          unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * ((v79 - (unsigned char *)__p) >> 4);
          unint64_t v56 = v55 + 1;
          if (v55 + 1 > 0x555555555555555) {
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((v80 - (unsigned char *)__p) >> 4) > v56) {
            unint64_t v56 = 0x5555555555555556 * ((v80 - (unsigned char *)__p) >> 4);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((v80 - (unsigned char *)__p) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
            unint64_t v57 = 0x555555555555555;
          }
          else {
            unint64_t v57 = v56;
          }
          if (v57)
          {
            id v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&v80, v57);
            id v54 = (char *)__p;
            double v50 = v79;
          }
          else
          {
            id v58 = 0;
          }
          uint64_t v59 = &v58[48 * v55];
          long long v60 = *(_OWORD *)v42;
          long long v61 = *((_OWORD *)v42 + 2);
          *((_OWORD *)v59 + 1) = *((_OWORD *)v42 + 1);
          *((_OWORD *)v59 + 2) = v61;
          *(_OWORD *)uint64_t v59 = v60;
          if (v50 == v54)
          {
            objc_super v63 = &v58[48 * v55];
          }
          else
          {
            objc_super v62 = &v58[48 * v55];
            do
            {
              objc_super v63 = v62 - 48;
              long long v64 = *((_OWORD *)v50 - 3);
              long long v65 = *((_OWORD *)v50 - 1);
              *((_OWORD *)v62 - 2) = *((_OWORD *)v50 - 2);
              *((_OWORD *)v62 - 1) = v65;
              *((_OWORD *)v62 - 3) = v64;
              v50 -= 48;
              v62 -= 48;
            }
            while (v50 != v54);
          }
          long long v53 = v59 + 48;
          long long __p = v63;
          unint64_t v79 = v59 + 48;
          id v80 = &v58[48 * v57];
          if (v54) {
            operator delete(v54);
          }
          uint64_t v44 = v75;
        }
        else
        {
          long long v51 = *(_OWORD *)v42;
          long long v52 = *((_OWORD *)v42 + 2);
          *((_OWORD *)v79 + 1) = *((_OWORD *)v42 + 1);
          *((_OWORD *)v50 + 2) = v52;
          *(_OWORD *)double v50 = v51;
          long long v53 = v50 + 48;
        }
        unint64_t v79 = v53;
      }
      unint64_t v45 = v42;
      v42 += 48;
    }
    while (v42 != v43);
  }
  [*(id *)(v74 + 40) addCommandBufferFrameProfile:&__p];
  if (__p)
  {
    unint64_t v79 = (char *)__p;
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&v81);
  if (v84)
  {
    id v85 = v84;
    operator delete(v84);
  }
}

- (void)setupFrameTimeProfiling
{
  v8.receiver = self;
  v8.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  BOOL v3 = [(DYMTLFunctionPlayer *)&v8 commandQueue];
  if (v3)
  {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F3F9A0]);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__DYMTLCommonDebugFunctionPlayer_setupFrameTimeProfiling__block_invoke;
    v6[3] = &unk_265339430;
    id v7 = v4;
    id v5 = v4;
    [v3 addPerfSampleHandler:v6];
  }
}

void __57__DYMTLCommonDebugFunctionPlayer_setupFrameTimeProfiling__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 label];
  char v8 = [v7 isEqualToString:*MEMORY[0x263F3FA28]];

  if ((v8 & 1) == 0)
  {
    uint64_t v17 = 0;
    [v5 GPUStartTime];
    double v10 = v9;
    [v5 GPUEndTime];
    double v12 = v11;
    uint64_t v13 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long,unsigned long long>>>((uint64_t)&v17, 1uLL);
    void *v13 = (unint64_t)(v10 * 1000000000.0);
    v13[1] = (unint64_t)(v12 * 1000000000.0);
    v13[2] = v5;
    v13[3] = 0;
    v13[4] = 0;
    void v13[5] = 0;
    long long __p = v13;
    uint64_t v17 = &v13[6 * v14];
    unint64_t v16 = v13 + 6;
    [*(id *)(a1 + 32) addCommandBufferFrameProfile:&__p];
    if (__p)
    {
      unint64_t v16 = __p;
      operator delete(__p);
    }
  }
}

- (BOOL)setupProfilingForListAtIndex:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  long long v38 = [(DYMTLFunctionPlayer *)&v43 commandQueue];
  if (!v38
    || ([(NSMutableArray *)self->_counterListsPerPass objectAtIndexedSubscript:a3],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v38 requestCounters:v5 withIndex:a3],
        v5,
        v6))
  {
    BOOL v7 = 0;
    goto LABEL_40;
  }
  counterInfos = self->_counterInfos;
  if (!counterInfos)
  {
    double v9 = [v38 counterInfo];
    double v10 = self->_counterInfos;
    self->_counterInfos = v9;

    counterInfos = self->_counterInfos;
  }
  if ([(NSDictionary *)counterInfos count]) {
    std::vector<BOOL>::resize((uint64_t)&self->_isDeltaCounter, [(NSDictionary *)self->_counterInfos count], 0);
  }
  if (self->_isAGXDevice)
  {
    self->_nSecuint64_t Index = -1;
    unsigned int v11 = 7;
  }
  else
  {
    unsigned int v11 = 3;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  double v12 = [(NSMutableArray *)self->_counterListsPerPass objectAtIndexedSubscript:a3];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (!v13)
  {
    BOOL v7 = 1;
    goto LABEL_39;
  }
  obuint64_t j = v12;
  int v14 = 0;
  unsigned int v15 = 0;
  uint64_t v16 = *(void *)v40;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v40 != v16) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      uint64_t v19 = [(NSDictionary *)self->_counterInfos objectForKeyedSubscript:v18];
      uint64_t v20 = [v19 objectForKeyedSubscript:@"type"];

      if (!v20)
      {
        BOOL v7 = 0;
        goto LABEL_37;
      }
      objc_opt_class();
      unsigned int v21 = v14 + i;
      if (objc_opt_isKindOfClass())
      {
        uint64_t v22 = [v20 unsignedIntegerValue];
        begiuint64_t n = self->_isDeltaCounter.__begin_;
        uint64_t v24 = v21 >> 6;
        uint64_t v25 = 1 << v21;
        if (v22 == 1)
        {
LABEL_19:
          unint64_t v26 = begin[v24] | v25;
LABEL_23:
          begin[v24] = v26;
          goto LABEL_24;
        }
LABEL_22:
        unint64_t v26 = begin[v24] & ~v25;
        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v27 = [v20 isEqualToString:@"DELTA"];
        begiuint64_t n = self->_isDeltaCounter.__begin_;
        uint64_t v24 = v21 >> 6;
        uint64_t v25 = 1 << v21;
        if (v27) {
          goto LABEL_19;
        }
        goto LABEL_22;
      }
LABEL_24:
      if (v15 < v11)
      {
        char v28 = [@"MTLStatCommandBufferIndex" isEqualToString:v18];
        uint64_t v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__commandBufferIndex;
        if (v28) {
          goto LABEL_32;
        }
        char v30 = [@"MTLStatEncoderIndex" isEqualToString:v18];
        uint64_t v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__encoderIndex;
        if (v30) {
          goto LABEL_32;
        }
        char v31 = [@"MTLStatCommandIndex" isEqualToString:v18];
        uint64_t v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__drawIndex;
        if (v31) {
          goto LABEL_32;
        }
        char v32 = [@"MTLStatDataMaster" isEqualToString:v18];
        uint64_t v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__datamasterIndex;
        if ((v32 & 1) != 0
          || (char v33 = [@"MTLStatSampleLocation" isEqualToString:v18],
              uint64_t v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__sampleLocationIndex,
              (v33 & 1) != 0)
          || (char v34 = [@"MTLStatTotalGPUCycles" isEqualToString:v18],
              uint64_t v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__gpuCyclesIndex,
              (v34 & 1) != 0)
          || (int v35 = [@"MTLStat_nSec" isEqualToString:v18],
              uint64_t v29 = &OBJC_IVAR___DYMTLCommonDebugFunctionPlayer__nSecIndex,
              v35))
        {
LABEL_32:
          *(_DWORD *)((char *)&self->super.super.super.super.isa + *v29) = v21;
          ++v15;
        }
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    v14 += i;
    if (v13) {
      continue;
    }
    break;
  }
  BOOL v7 = 1;
LABEL_37:
  double v12 = obj;
LABEL_39:

LABEL_40:
  return v7;
}

- (id)counterInfo:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v40 = (id)objc_opt_new();
  v45.receiver = self;
  v45.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  id v4 = [(DYMTLFunctionPlayer *)&v45 commandQueue];
  id v5 = v4;
  if (v4)
  {
    long long v38 = v4;
    char v37 = [v4 isStatEnabled];
    if ((v37 & 1) == 0) {
      [v5 setStatEnabled:1];
    }
    if (v39)
    {
      id v6 = v39;
      if (self->_isAGXDevice) {
        objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"MTLStatCommandBufferIndex", @"MTLStatEncoderIndex", @"MTLStatCommandIndex", @"MTLStatDataMaster", @"MTLStatSampleLocation", @"MTLStatTotalGPUCycles", @"MTLStat_nSec", 0);
      }
      else {
      char v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"MTLStatCommandBufferIndex", @"MTLStatEncoderIndex", @"MTLStatCommandIndex", @"MTLStat_nSec", 0);
      }
      double v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v42 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            if (([v9 containsObject:v14] & 1) == 0) {
              [v8 addObject:v14];
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v11);
      }

      BOOL v7 = v8;
      id v5 = v38;
    }
    else
    {
      BOOL v7 = [v5 availableCounters];
    }
    unsigned int v15 = [v5 subdivideCounterList:v7];
    uint64_t v16 = (NSMutableArray *)[v15 mutableCopy];
    counterListsPerPass = self->_counterListsPerPass;
    self->_counterListsPerPass = v16;

    uint64_t v18 = [(NSMutableArray *)self->_counterListsPerPass count];
    p_baseCounterIndexForList = &self->_baseCounterIndexForList;
    self->_baseCounterIndexForList.__end_ = self->_baseCounterIndexForList.__begin_;
    if (v18)
    {
      uint64_t v20 = 0;
      unint64_t v21 = 0;
      do
      {
        end = self->_baseCounterIndexForList.__end_;
        value = self->_baseCounterIndexForList.__end_cap_.__value_;
        if (end >= value)
        {
          begiuint64_t n = p_baseCounterIndexForList->__begin_;
          uint64_t v26 = end - p_baseCounterIndexForList->__begin_;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 61) {
            std::vector<std::pair<ShaderDebugger::Metadata::MDBase::MetadataType,unsigned long long>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v28 = (char *)value - (char *)begin;
          if (v28 >> 2 > v27) {
            unint64_t v27 = v28 >> 2;
          }
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v27;
          }
          if (v29)
          {
            char v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&self->_baseCounterIndexForList.__end_cap_, v29);
            begiuint64_t n = p_baseCounterIndexForList->__begin_;
            end = self->_baseCounterIndexForList.__end_;
          }
          else
          {
            char v30 = 0;
          }
          char v31 = (unint64_t *)&v30[8 * v26];
          *char v31 = v21;
          uint64_t v24 = v31 + 1;
          while (end != begin)
          {
            unint64_t v32 = *--end;
            *--char v31 = v32;
          }
          p_baseCounterIndexForList->__begin_ = v31;
          self->_baseCounterIndexForList.__end_ = v24;
          self->_baseCounterIndexForList.__end_cap_.__value_ = (unint64_t *)&v30[8 * v29];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          unint64_t *end = v21;
          uint64_t v24 = end + 1;
        }
        self->_baseCounterIndexForList.__end_ = v24;
        char v33 = [(NSMutableArray *)self->_counterListsPerPass objectAtIndexedSubscript:v20];
        uint64_t v34 = [v33 count];

        v21 += v34;
        ++v20;
      }
      while (v20 != v18);
    }
    [v40 setObject:self->_counterListsPerPass forKeyedSubscript:*MEMORY[0x263F3FAD0]];
    int v35 = [NSNumber numberWithUnsignedInteger:v18];
    [v40 setObject:v35 forKeyedSubscript:*MEMORY[0x263F3FDA0]];

    [v40 setObject:v7 forKeyedSubscript:*MEMORY[0x263F3FAD8]];
    if ((v37 & 1) == 0) {
      [v38 setStatEnabled:0];
    }

    id v5 = v38;
  }

  return v40;
}

- (void)sampleEncoderCounters
{
  v5.receiver = self;
  v5.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  BOOL v3 = [(DYMTLFunctionPlayer *)&v5 commandQueue];
  if (v3)
  {
    if (self->_isAGXDevice)
    {
      uint64_t v4 = 63;
    }
    else if ([(DYMTLCommonDebugFunctionPlayer *)self isBlitSamplingSupported])
    {
      uint64_t v4 = 63;
    }
    else
    {
      uint64_t v4 = 51;
    }
    [v3 setStatLocations:v4];
  }
}

- (void)sampleSplitEncoderCounters
{
  v4.receiver = self;
  v4.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  unsigned int v2 = [(DYMTLFunctionPlayer *)&v4 commandQueue];
  BOOL v3 = v2;
  if (v2) {
    [v2 setStatLocations:12];
  }
}

- (void)setStatLocations:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  objc_super v4 = [(DYMTLFunctionPlayer *)&v6 commandQueue];
  objc_super v5 = v4;
  if (v4) {
    [v4 setStatLocations:a3];
  }
}

- (unint64_t)getStatLocations
{
  v6.receiver = self;
  v6.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  unsigned int v2 = [(DYMTLFunctionPlayer *)&v6 commandQueue];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 getStatLocations];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)stopFrameProfiling
{
  v5.receiver = self;
  v5.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  BOOL v3 = [(DYMTLFunctionPlayer *)&v5 commandQueue];
  unint64_t v4 = v3;
  if (v3)
  {
    [v3 setStatEnabled:0];
    if (self->_isAGXDevice) {
      [v4 setGPUPriority:1];
    }
  }
}

- (id)derivedCounterData
{
  v15.receiver = self;
  v15.super_class = (Class)DYMTLCommonDebugFunctionPlayer;
  unsigned int v2 = [(DYMTLFunctionPlayer *)&v15 device];
  if (v2)
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x263F53630]) initWithMTLDevice:v2];
    unint64_t v4 = objc_opt_new();
    objc_super v5 = [v3 counterDictionary];
    objc_super v6 = [v5 allKeys];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      char v8 = [v3 counterDictionary];
      [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x263F3FB40]];

      double v9 = [v3 derivedCounterScript];
      [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x263F3FB48]];

      id v10 = [v3 analysisScript];
      [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x263F3FB18]];

      uint64_t v11 = [v3 configurationVariables];
      [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x263F3FB28]];

      uint64_t v12 = [v3 metalPluginName];

      if (v12)
      {
        uint64_t v13 = [v3 metalPluginName];
        [v4 setObject:v13 forKeyedSubscript:@"MetalPluginName"];
      }
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setupProfileInfo:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_profileInfo, a3);
  profileInfo = self->_profileInfo;
  if (profileInfo)
  {
    objc_super v6 = [(NSDictionary *)profileInfo objectForKeyedSubscript:@"activePerEncoderDrawCallCount"];
    splitEncoderCommandCount = self->_splitEncoderCommandCount;
    self->_splitEncoderCommandCount = v6;
  }
}

- (void)setupBatchFilterForEncoders:(id)a3
{
}

- (void)_updateRemainingCommandsForEncoder
{
  if (self->_splitEncoderCommandCount)
  {
    unsigned int v3 = [(DYMTLCommonDebugFunctionPlayer *)self currentEncoderIndex];
    if ([(NSArray *)self->_splitEncoderCommandCount count] > v3)
    {
      unint64_t v4 = [(NSArray *)self->_splitEncoderCommandCount objectAtIndexedSubscript:[(DYMTLCommonDebugFunctionPlayer *)self currentEncoderIndex]];
      if (v4)
      {
        id v5 = v4;
        self->_nRemainingCommandsForCurrentEncoder = [v4 unsignedIntValue];
        unint64_t v4 = v5;
      }
    }
  }
}

- (unint64_t)_executeIndirectCommandBufferUpToSubIndex:(unint64_t)a3 outBuffer:(id *)a4 outDataPointer:(const char *)a5
{
  uint64_t v10 = (int)*MEMORY[0x263F3F9A8];
  unint64_t v11 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v10) + 48, 0);
  uint64_t v12 = [(DYMTLFunctionPlayer *)self objectForKey:GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v10) + 72, 0)];
  uint64_t v13 = [v12 size];
  if (v13 - 1 >= a3) {
    unint64_t v14 = a3;
  }
  else {
    unint64_t v14 = v13 - 1;
  }
  [(DYFunctionPlayer *)self processArguments];
  objc_super v15 = *(unsigned int **)((char *)&self->super.super.super.super.isa + v10);
  uint64_t v16 = (GPUTools::MTL *)*v15;
  switch(v16)
  {
    case 0xFFFFC1A4:
    case 0xFFFFC1A6:
      uint64_t v17 = **(const char ***)((char *)&self->super.super.super._executeGraphics + (int)*MEMORY[0x263F3F970]);
      unint64_t v5 = GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>((uint64_t)(v15 + 24), 0);
      GPUTools::FD::Argument::ViewAsScalarArray<unsigned long long>(*(uint64_t *)((char *)&self->super.super.super.super.isa + v10) + 96, 1uLL);
      uint64_t v16 = (GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa + v10);
      break;
    case 0xFFFFC1A5:
    case 0xFFFFC1A7:
      uint64_t v18 = (char *)self + (int)*MEMORY[0x263F3F970];
      uint64_t v17 = (const char *)**((void **)v18 + 4);
      unint64_t v5 = ***((void ***)v18 + 5);
      break;
    default:
      uint64_t v17 = 0;
      break;
  }
  if (GPUTools::MTL::IsFuncEnumIndirectExecuteDrawCall(v16))
  {
    uint64_t v19 = [(DYMTLFunctionPlayer *)self objectForKey:v11];
    uint64_t v20 = v19;
    if (v14 > v5) {
      objc_msgSend(v19, "executeCommandsInBuffer:withRange:", v12, v5, v14 - v5);
    }
    unint64_t v21 = [(DYMTLFunctionPlayer *)self indirectCommandManager];
    uint64_t v22 = [v21 setupRenderCommandEncoder:v20 withData:v17 atIndex:v14 forIndirectCommandBuffer:v12];
  }
  else
  {
    if (!GPUTools::MTL::IsFuncEnumIndirectExecuteComputeCall((GPUTools::MTL *)**(unsigned int **)((char *)&self->super.super.super.super.isa + v10)))
    {
      unint64_t v24 = 0;
      goto LABEL_18;
    }
    unint64_t v23 = [(DYMTLFunctionPlayer *)self objectForKey:v11];
    uint64_t v20 = v23;
    if (v14 > v5) {
      objc_msgSend(v23, "executeCommandsInBuffer:withRange:", v12, v5, v14 - v5);
    }
    unint64_t v21 = [(DYMTLFunctionPlayer *)self indirectCommandManager];
    uint64_t v22 = [v21 setupComputeCommandEncoder:v20 withData:v17 atIndex:v14 forIndirectCommandBuffer:v12];
  }
  unint64_t v24 = v22;

LABEL_18:
  id v25 = v12;
  *a4 = v25;
  *a5 = v17;

  return v24;
}

- (int64_t)wireframeRenderMode
{
  return self->_wireframeRenderMode;
}

- (void)setWireframeRenderMode:(int64_t)a3
{
  self->_wireframeRenderMode = a3;
}

- (DYMTLPostVertexDump)postVertexDump
{
  return self->_postVertexDump;
}

- (BOOL)targetFunctionNeedsSeparatedPostVertexDump
{
  return self->_targetFunctionNeedsSeparatedPostVertexDump;
}

- (DYMTLShaderDebuggerTraceGenerator)shaderDebuggerTraceGenerator
{
  return self->_shaderDebuggerTraceGenerator;
}

- (BOOL)shouldIgnoreCaptureFile
{
  return self->_shouldIgnoreCaptureFile;
}

- (void)setShouldIgnoreCaptureFile:(BOOL)a3
{
  self->_shouldIgnoreCaptureFile = a3;
}

- (unsigned)currentEncoderIndex
{
  return self->_currentEncoderIndex;
}

- (void)setCurrentEncoderIndex:(unsigned int)a3
{
  self->_currentEncoderuint64_t Index = a3;
}

- (NSMutableArray)counterListsPerPass
{
  return self->_counterListsPerPass;
}

- (void)setCounterListsPerPass:(id)a3
{
}

- (NSString)statVertices
{
  return self->_statVertices;
}

- (void)setStatVertices:(id)a3
{
}

- (NSString)statPixels
{
  return self->_statPixels;
}

- (void)setStatPixels:(id)a3
{
}

- (NSMutableArray)frameCounters
{
  return self->_frameCounters;
}

- (void)setFrameCounters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameCounters, 0);
  objc_storeStrong((id *)&self->_statPixels, 0);
  objc_storeStrong((id *)&self->_statVertices, 0);
  objc_storeStrong((id *)&self->_counterListsPerPass, 0);
  objc_storeStrong((id *)&self->_pixelHistoryEncoderStateTrackings, 0);
  objc_storeStrong((id *)&self->_pixelHistoryDrawStatsRenderer, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_pixelHistoryInverseObjectMap);
  objc_storeStrong((id *)&self->_pixelHistoryPixelPreviousDepth, 0);
  objc_storeStrong((id *)&self->_pixelHistoryPixelPreviousStencil, 0);
  objc_storeStrong((id *)&self->_pixelHistory, 0);
  objc_storeStrong((id *)&self->_sparseTextureFence, 0);
  objc_storeStrong((id *)&self->_dependencyGraphParallelDescriptor, 0);
  objc_storeStrong((id *)&self->_dependencyGraphThumbnails, 0);
  objc_storeStrong((id *)&self->_thumbnailDictionary, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_persistantEncoder2ParallelMap);
  objc_storeStrong((id *)&self->_currentParallelDescriptor, 0);
  begiuint64_t n = self->_last.__begin_;
  if (begin)
  {
    self->_last.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,objc_object * {__strong}>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,objc_object * {__strong}>>>::~__hash_table((uint64_t)&self->_metalLayers);
  objc_storeStrong((id *)&self->_textureRenderer, 0);
  objc_storeStrong((id *)&self->_shaderDebuggerTraceGenerator, 0);
  objc_storeStrong((id *)&self->_tileMemoryExtractor, 0);
  objc_storeStrong((id *)&self->_postVertexDump, 0);
  unint64_t v4 = self->_isDeltaCounter.__begin_;
  if (v4) {
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_nopRenderPipelineState, 0);
  objc_storeStrong((id *)&self->_nopTileFunction, 0);
  objc_storeStrong((id *)&self->_nopDrawVertexFunction, 0);
  objc_storeStrong((id *)&self->_nopDrawFragFunction, 0);
  objc_storeStrong((id *)&self->_renderPipelineState, 0);
  objc_storeStrong((id *)&self->_splitEncoderCommandCount, 0);
  unint64_t v5 = self->_currentEncoderBatchInfo.__begin_;
  if (v5)
  {
    self->_currentEncoderBatchInfo.__end_ = v5;
    operator delete(v5);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::vector<OffsetPair>>>>::~__hash_table((uint64_t)&self->_encoderIndexToBatchInfo);
  objc_storeStrong((id *)&self->_batchInfos, 0);
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_parallelRenderCommandEncoderDescriptor, 0);
  objc_storeStrong((id *)&self->_wireframeRenderer, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_commandQueueSet);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_encoderToParallelEncoderMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_parallelEncoderMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_encoderMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_commandBufferMap);
  objc_super v6 = self->_baseCounterIndexForList.__begin_;
  if (v6)
  {
    self->_baseCounterIndexForList.__end_ = v6;
    operator delete(v6);
  }
  objc_storeStrong((id *)&self->_counterInfos, 0);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_commandEncoderDescriptorMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_textureToDrawableMap);
  std::__hash_table<std::__hash_value_type<unsigned long long,BOOL>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,BOOL>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,BOOL>>>::~__hash_table((uint64_t)&self->_drawableIdToLayerIdMap);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 105) = 0u;
  *((_OWORD *)self + 106) = 0u;
  *((_DWORD *)self + 428) = 1065353216;
  *(_OWORD *)((char *)self + 1720) = 0u;
  *(_OWORD *)((char *)self + 1736) = 0u;
  *((_DWORD *)self + 438) = 1065353216;
  *((_OWORD *)self + 110) = 0u;
  *((_OWORD *)self + 111) = 0u;
  *((_DWORD *)self + 448) = 1065353216;
  *((void *)self + 227) = 0;
  *((void *)self + 228) = 0;
  *((void *)self + 226) = 0;
  *(_OWORD *)((char *)self + 1832) = 0u;
  *(_OWORD *)((char *)self + 1848) = 0u;
  *((_DWORD *)self + 466) = 1065353216;
  *((_OWORD *)self + 117) = 0u;
  *((_OWORD *)self + 118) = 0u;
  *((_DWORD *)self + 476) = 1065353216;
  *(_OWORD *)((char *)self + 1912) = 0u;
  *(_OWORD *)((char *)self + 1928) = 0u;
  *((_DWORD *)self + 486) = 1065353216;
  *((_OWORD *)self + 122) = 0u;
  *((_OWORD *)self + 123) = 0u;
  *((_DWORD *)self + 496) = 1065353216;
  *((_DWORD *)self + 510) = 1065353216;
  *(_OWORD *)((char *)self + 2008) = 0u;
  *(_OWORD *)((char *)self + 2024) = 0u;
  *((void *)self + 261) = 0;
  unsigned int v2 = (char *)self + 3248;
  uint64_t v3 = 2096;
  do
  {
    unint64_t v4 = (char *)self + v3;
    *((_OWORD *)v4 + 2) = 0uLL;
    *((_OWORD *)v4 + 3) = 0uLL;
    *(_OWORD *)unint64_t v4 = 0uLL;
    *((_OWORD *)v4 + 1) = 0uLL;
    *((void *)v4 + 8) = 0;
    *((void *)v4 + 9) = 1;
    *((_OWORD *)v4 + 5) = 0uLL;
    *((_OWORD *)v4 + 6) = 0uLL;
    *((void *)v4 + 14) = 0x3FF0000000000000;
    v3 += 144;
    *((void *)v4 + 16) = 0;
    *((void *)v4 + 17) = 0;
  }
  while (v4 + 144 != v2);
  *((void *)self + 414) = 0;
  *((_OWORD *)self + 205) = 0u;
  *((_OWORD *)self + 206) = 0u;
  *(_OWORD *)unsigned int v2 = 0u;
  *((_OWORD *)self + 204) = 0u;
  *((void *)self + 415) = 1;
  *((_OWORD *)self + 208) = 0u;
  *((_OWORD *)self + 209) = 0u;
  *((void *)self + 420) = 0x3FF0000000000000;
  *((_OWORD *)self + 211) = 0u;
  *((_OWORD *)self + 212) = 0u;
  *((_OWORD *)self + 213) = 0u;
  *((_OWORD *)self + 214) = 0u;
  *((_OWORD *)self + 215) = 0u;
  *((void *)self + 432) = 0;
  *((void *)self + 433) = 1;
  *((_OWORD *)self + 218) = 0u;
  *((_OWORD *)self + 217) = 0u;
  *((void *)self + 438) = 0x3FF0000000000000;
  *((void *)self + 441) = 0;
  *((void *)self + 440) = 0;
  *(_OWORD *)((char *)self + 3720) = 0u;
  *(_OWORD *)((char *)self + 3736) = 0u;
  *((_DWORD *)self + 938) = 1065353216;
  *((void *)self + 471) = 0;
  *((void *)self + 472) = 0;
  *((void *)self + 470) = 0;
  *((void *)self + 490) = 0;
  *((void *)self + 491) = 0;
  *((void *)self + 489) = 0;
  *((_OWORD *)self + 251) = 0u;
  *((_OWORD *)self + 252) = 0u;
  *((_DWORD *)self + 1012) = 1065353216;
  *((void *)self + 510) = 0;
  *((void *)self + 511) = 0;
  *((void *)self + 513) = 0;
  *((void *)self + 514) = 0;
  *((void *)self + 512) = 0;
  *(_OWORD *)((char *)self + 4136) = 0u;
  *(_OWORD *)((char *)self + 4152) = 0u;
  *((_DWORD *)self + 1042) = 1065353216;
  *((void *)self + 527) = 0;
  unint64_t v5 = (char *)self + 5376;
  uint64_t v6 = 4224;
  do
  {
    uint64_t v7 = (char *)self + v6;
    *((_OWORD *)v7 + 2) = 0uLL;
    *((_OWORD *)v7 + 3) = 0uLL;
    *(_OWORD *)uint64_t v7 = 0uLL;
    *((_OWORD *)v7 + 1) = 0uLL;
    *((void *)v7 + 8) = 0;
    *((void *)v7 + 9) = 1;
    *((_OWORD *)v7 + 5) = 0uLL;
    *((_OWORD *)v7 + 6) = 0uLL;
    *((void *)v7 + 14) = 0x3FF0000000000000;
    v6 += 144;
    *((void *)v7 + 16) = 0;
    *((void *)v7 + 17) = 0;
  }
  while (v7 + 144 != v5);
  *((void *)self + 680) = 0;
  *((_OWORD *)self + 338) = 0u;
  *((_OWORD *)self + 339) = 0u;
  *(_OWORD *)unint64_t v5 = 0u;
  *((_OWORD *)self + 337) = 0u;
  *((void *)self + 681) = 1;
  *((_OWORD *)self + 341) = 0u;
  *((_OWORD *)self + 342) = 0u;
  *((void *)self + 686) = 0x3FF0000000000000;
  *((_OWORD *)self + 344) = 0u;
  *((_OWORD *)self + 345) = 0u;
  *((_OWORD *)self + 346) = 0u;
  *((_OWORD *)self + 347) = 0u;
  *((_OWORD *)self + 348) = 0u;
  *((void *)self + 698) = 0;
  *((void *)self + 699) = 1;
  *((_OWORD *)self + 351) = 0u;
  *((_OWORD *)self + 350) = 0u;
  *((void *)self + 704) = 0x3FF0000000000000;
  *((void *)self + 707) = 0;
  *((void *)self + 706) = 0;
  *((_OWORD *)self + 365) = 0u;
  *((_OWORD *)self + 366) = 0u;
  *((_DWORD *)self + 1468) = 1065353216;
  return self;
}

@end