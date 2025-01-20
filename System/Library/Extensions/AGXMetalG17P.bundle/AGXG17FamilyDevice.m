@interface AGXG17FamilyDevice
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6;
- (AGXG17FamilyDevice)initWithAcceleratorPort:(unsigned int)a3 simultaneousInstances:(unsigned int)a4;
- (BOOL)areProgrammableSamplePositionsSupported;
- (BOOL)buildBVHForRIA;
- (BOOL)disableBlitEncoderCoalescing;
- (BOOL)disableComputeEncoderCoalescing;
- (BOOL)disableConsistentPerfState;
- (BOOL)disableEncoderCoalescing;
- (BOOL)enableConsistentPerfState:(int)a3;
- (BOOL)isASTCPixelFormatsSupported;
- (BOOL)isAnisoSampleFixSupported;
- (BOOL)isCompatibleWithAccelerationStructure:(id)a3;
- (BOOL)isFixedLinePointFillDepthGradientSupported;
- (BOOL)isFloat32FilteringSupported;
- (BOOL)isMagicMipmapSupported;
- (BOOL)isMsaa32bSupported;
- (BOOL)isRGB10A2GammaSupported;
- (BOOL)isRTZRoundingSupported;
- (BOOL)isShaderSampleBufferMapped;
- (BOOL)isTileSizeIndependentVaryingsSupported;
- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6;
- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5;
- (BOOL)metalAssertionsEnabled;
- (BOOL)requiresRaytracingEmulation;
- (BOOL)setupCompiler:(int)a3;
- (BOOL)shaderDebugInfoCaching;
- (BOOL)supports32bpcMSAATextures;
- (BOOL)supportsAtomicFloat;
- (BOOL)supportsAtomicUlongVoidMinMax;
- (BOOL)supportsBCTextureCompression;
- (BOOL)supportsBGR10A2;
- (BOOL)supportsBlackOrWhiteSamplerBorderColors;
- (BOOL)supportsBufferBoundsChecking;
- (BOOL)supportsBufferWithAddressRanges;
- (BOOL)supportsBufferlessClientStorageTexture;
- (BOOL)supportsComputeCompressedTextureWrite;
- (BOOL)supportsCounterSampling:(unint64_t)a3;
- (BOOL)supportsCustomBorderColor;
- (BOOL)supportsDeadlineProfile;
- (BOOL)supportsDynamicLibraries;
- (BOOL)supportsExplicitVisibilityGroups;
- (BOOL)supportsExtendedSamplerLODBiasRange;
- (BOOL)supportsFragmentOnlyEncoders;
- (BOOL)supportsGlobalVariableRelocation;
- (BOOL)supportsGlobalVariableRelocationRender;
- (BOOL)supportsHeapWithAddressRanges;
- (BOOL)supportsIntersectionFunctionBuffers;
- (BOOL)supportsLargeFramebufferConfigs;
- (BOOL)supportsLateEvalEvent;
- (BOOL)supportsMemoryOrderAtomics;
- (BOOL)supportsMemorylessRenderTargets;
- (BOOL)supportsMeshShaders;
- (BOOL)supportsMirrorClampToEdgeSamplerMode;
- (BOOL)supportsPartialRenderMemoryBarrier;
- (BOOL)supportsPerPlaneCompression;
- (BOOL)supportsPrimitiveType:(unint64_t)a3;
- (BOOL)supportsQueryTextureLOD;
- (BOOL)supportsRaytracing;
- (BOOL)supportsSampleCount:(unint64_t)a3;
- (BOOL)supportsSamplerAddressModeClampToHalfBorder;
- (BOOL)supportsShaderBarycentricCoordinates;
- (BOOL)supportsShaderMinLODClamp;
- (BOOL)supportsStreamingCodecSignaling;
- (BOOL)supportsTLS;
- (BOOL)supportsTexture2DMultisampleArray;
- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3;
- (BOOL)supportsVertexAmplification;
- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3;
- (BOOL)supportsVirtualSubstreams;
- (Class)blitContextClass;
- (Class)computeContextClass;
- (Class)renderContextClass;
- (Class)threadedRenderPassClass;
- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities;
- (MTLArchitecture)architecture;
- (MTLTargetDeviceArchitecture)targetDeviceArchitecture;
- (NSArray)counterSets;
- (const)targetDeviceInfo;
- (id).cxx_construct;
- (id)allocResidencySet;
- (id)compiler;
- (id)copyIOSurfaceSharedTextureProperties:(id)a3;
- (id)counterSampleBufferLimits;
- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5;
- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4;
- (id)familyName;
- (id)getConsistentPerfStateInfoAndReset:(BOOL)a3;
- (id)getConsistentPerfStateMappingTable;
- (id)getMostCompatibleArchitecture:(id)a3;
- (id)gpuRevisionName;
- (id)indirectArgumentBufferDecodingData;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4;
- (id)newArgumentEncoderWithLayout:(id)a3;
- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6;
- (id)newBufferWithDescriptor:(id)a3;
- (id)newBufferWithIOSurface:(__IOSurface *)a3;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newCommandQueue;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4;
- (id)newCounterSampleBufferWithLength:(unint64_t)a3 label:(id)a4 error:(id *)a5;
- (id)newDefaultLibrary;
- (id)newDepthStencilStateWithDescriptor:(id)a3;
- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5;
- (id)newDynamicLibrary:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newHeapWithDescriptor:(id)a3;
- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4;
- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3;
- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3;
- (id)newLateEvalEvent;
- (id)newLibraryWithData:(id)a3 error:(id *)a4;
- (id)newLibraryWithFile:(id)a3 error:(id *)a4;
- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4;
- (id)newProfileWithExecutionSize:(unint64_t)a3;
- (id)newRasterizationRateMapWithDescriptor:(id)a3;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4;
- (id)newSamplerStateWithDescriptor:(id)a3;
- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4;
- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)productName;
- (id)vendorName;
- (int)llvmVersion;
- (int64_t)currentPerformanceState;
- (unint64_t)bufferRobustnessSupport;
- (unint64_t)deviceCreationFlags;
- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes;
- (unint64_t)deviceLinearTextureAlignmentBytes;
- (unint64_t)doubleFPConfig;
- (unint64_t)featureProfile;
- (unint64_t)getSupportedCommandBufferErrorOptions;
- (unint64_t)halfFPConfig;
- (unint64_t)latestSupportedGenericBVHVersion;
- (unint64_t)maxAccelerationStructureTraversalDepth;
- (unint64_t)maxComputeTextures;
- (unint64_t)maxFragmentTextures;
- (unint64_t)maxIndirectBuffers;
- (unint64_t)maxIndirectTextures;
- (unint64_t)maxRasterizationRateLayerCount;
- (unint64_t)maxThreadgroupMemoryLength;
- (unint64_t)maxVertexTextures;
- (unint64_t)maxVisibilityQueryOffset;
- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3;
- (unint64_t)singleFPConfig;
- (unsigned)cmdBufArgsSize;
- (unsigned)gpuCoreCount;
- (unsigned)maximumComputeSubstreams;
- (void)_decrementCommandQueueCount;
- (void)_deregisterForSignpostEnablement;
- (void)_incrementCommandQueueCount;
- (void)_purgeDevice;
- (void)_registerForSignpostEnablement;
- (void)_storeComputePipelineState:(id)a3;
- (void)_storeRenderPipelineState:(id)a3;
- (void)alertCommandBufferActivityComplete;
- (void)alertCommandBufferActivityStart;
- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 completionHandler:(id)a5;
- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 destinationBinaryArchive:(id)a5 error:(id *)a6;
- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)deserializeCompileTimeStats:(id)a3 addToDictionary:(id)a4;
- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5;
- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)removePerformanceStateAssertion:(id)a3;
- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5;
- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4;
- (void)setDisableBlitEncoderCoalescing:(BOOL)a3;
- (void)setDisableComputeEncoderCoalescing:(BOOL)a3;
- (void)setDisableEncoderCoalescing:(BOOL)a3;
- (void)setMetalAssertionsEnabled:(BOOL)a3;
- (void)setShaderDebugInfoCaching:(BOOL)a3;
- (void)setupDeferred;
- (void)shrinkHeaps;
- (void)unmapShaderSampleBuffer;
@end

@implementation AGXG17FamilyDevice

- (id).cxx_construct
{
  self->_telemetry.clientKeys = 0;
  *(_OWORD *)&self->_telemetry.deviceName = 0u;
  *(_OWORD *)&self->_telemetry.backtracePayload = 0u;
  *(_OWORD *)((char *)&self->_telemetry.dimensionPayload + 1) = 0u;
  bzero(&self->_telemetry.genericCounts, 0x338uLL);
  self->performance_state_assertion.lock.lock._os_unfair_lock_opaque = 0;
  return self;
}

- (void).cxx_destruct
{
  p_telemetry = &self->_telemetry;
  queue = self->_telemetry.queue;
  if (queue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN13AGXATelemetry16disableTelemetryEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = p_telemetry;
    dispatch_sync(queue, block);
  }
  deviceName = p_telemetry->deviceName;
  if (deviceName) {

  }
  backtracePayload = p_telemetry->backtracePayload;
  if (backtracePayload) {

  }
  dimensionPayload = p_telemetry->dimensionPayload;
  if (dimensionPayload) {

  }
  payload = p_telemetry->payload;
  if (payload) {

  }
  clientKeys = p_telemetry->clientKeys;
  if (clientKeys) {

  }
  timer = p_telemetry->timer;
  if (timer)
  {
    dispatch_release(timer);
    p_telemetry->timer = 0;
  }
  v10 = p_telemetry->queue;
  if (v10)
  {
    dispatch_release(v10);
    p_telemetry->queue = 0;
  }
  backtraceQueue = p_telemetry->backtraceQueue;
  if (backtraceQueue)
  {
    dispatch_release(backtraceQueue);
    p_telemetry->backtraceQueue = 0;
  }
}

- (void)setDisableEncoderCoalescing:(BOOL)a3
{
  self->_disableEncoderCoalescing = a3;
}

- (BOOL)disableEncoderCoalescing
{
  return self->_disableEncoderCoalescing;
}

- (void)setDisableBlitEncoderCoalescing:(BOOL)a3
{
  self->_disableBlitEncoderCoalescing = a3;
}

- (BOOL)disableBlitEncoderCoalescing
{
  return self->_disableBlitEncoderCoalescing;
}

- (void)setDisableComputeEncoderCoalescing:(BOOL)a3
{
  self->_disableComputeEncoderCoalescing = a3;
}

- (BOOL)disableComputeEncoderCoalescing
{
  return self->_disableComputeEncoderCoalescing;
}

- (void)setMetalAssertionsEnabled:(BOOL)a3
{
  self->_metalAssertionsEnabled = a3;
}

- (BOOL)metalAssertionsEnabled
{
  return self->_metalAssertionsEnabled;
}

- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5
{
  uint64_t v183 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0uLL:
      impl = self->_impl;
      uint64_t v9 = impl[764];
      if (!*(_DWORD *)(v9 + 64) && (*(_DWORD *)(v9 + 60) + 1) < 2)
      {
        if (!a5) {
          return;
        }
        if ((a5 & 0x8000000000000000) == 0)
        {
          size_t v10 = 8 * a5;
          v11 = (char *)operator new(8 * a5);
          v12 = (unsigned int *)&v11[v10];
          memcpy(v11, a4, v10);
          std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>();
          unint64_t v13 = *(void *)&v11[v10 - 8];
          if (!HIDWORD(v13))
          {
            uint64_t v14 = impl[764];
            unint64_t v15 = *(unsigned int *)(v14 + 32);
            if (v13 >= v15)
            {
              do
              {
                if (v15) {
                  LODWORD(v15) = 2 * v15;
                }
                else {
                  LODWORD(v15) = 16;
                }
              }
              while (v15 <= v13);
              int v179 = v15;
              *(void *)buf = v14;
              *(void *)&buf[8] = &v179;
              AGX::Mempool<16u,0u,true,AGX::HAL200::TextureHeapElem,AGX::HAL200::TextureHeapElem,unsigned int>::grow(unsigned int,BOOL)::{lambda(16u)#1}::operator()<std::integral_constant<unsigned long,0ul>,std::integral_constant<unsigned long,1ul>,std::integral_constant<unsigned long,2ul>>((uint64_t)buf);
              *(_DWORD *)(v14 + 32) = v179;
              v16 = *(atomic_uint **)(v14 + 72);
              atomic_uint v17 = *v16;
              if ((*v16 + 1) > 1) {
                unsigned int v18 = v17 + 1;
              }
              else {
                unsigned int v18 = 1;
              }
              atomic_uint v19 = *v16;
              atomic_compare_exchange_strong(v16, (unsigned int *)&v19, v18);
              if (v19 != v17)
              {
                atomic_uint v20 = v19;
                do
                {
                  if ((v19 + 1) > 1) {
                    unsigned int v21 = v19 + 1;
                  }
                  else {
                    unsigned int v21 = 1;
                  }
                  atomic_compare_exchange_strong(v16, (unsigned int *)&v20, v21);
                  BOOL v22 = v20 == v19;
                  atomic_uint v19 = v20;
                }
                while (!v22);
              }
              uint64_t v14 = impl[764];
            }
            unsigned int v23 = 0;
            atomic_store(0, (unint64_t *)(v14 + 48));
            v24 = (int *)MEMORY[0x263F4B188];
            v25 = (unsigned int *)v11;
            do
            {
              unint64_t v27 = v23 + 1;
              if (*(void *)v25 > v27)
              {
                uint64_t v28 = *(void *)v25 - 1;
                uint64_t v29 = impl[764];
                uint64_t v30 = *(void *)(v29 + 40);
                if (v27 < v28)
                {
                  uint64_t v31 = 32 * v27;
                  uint64_t v32 = v28 - v27;
                  unsigned int v33 = v23 + 2;
                  do
                  {
                    *(_DWORD *)(*(void *)(*(void *)(v30 + 8) + *v24 + 24) + v31) = v33;
                    v31 += 32;
                    ++v33;
                    --v32;
                  }
                  while (v32);
                }
                uint64_t v34 = *(void *)(v29 + 48);
                uint64_t v35 = 32 * v28;
                *(_DWORD *)(*(void *)(*(void *)(v30 + 8) + *v24 + 24) + v35) = v34;
                uint64_t v36 = v34;
                atomic_compare_exchange_strong((atomic_ullong *volatile)(v29 + 48), (unint64_t *)&v36, (v34 & 0xFFFFFFFF00000000 | v27) + 0x100000000);
                if (v36 != v34)
                {
                  do
                  {
                    *(_DWORD *)(*(void *)(*(void *)(*(void *)(v29 + 40) + 8) + *v24 + 24) + v35) = v36;
                    uint64_t v37 = v36;
                    atomic_compare_exchange_strong((atomic_ullong *volatile)(v29 + 48), (unint64_t *)&v37, (v36 & 0xFFFFFFFF00000000 | v27) + 0x100000000);
                    BOOL v22 = v37 == v36;
                    uint64_t v36 = v37;
                  }
                  while (!v22);
                }
              }
              unsigned int v26 = *v25;
              v25 += 2;
              unsigned int v23 = v26;
            }
            while (v25 != v12);
            uint64_t v134 = impl[764];
            uint64_t v135 = (*(_DWORD *)(v134 + 32) - 1);
            if (v135 > v23)
            {
              uint64_t v136 = v23 + 1;
              uint64_t v137 = *(void *)(v134 + 40);
              if (v136 < v135)
              {
                uint64_t v138 = 32 * v136;
                uint64_t v139 = v135 - v136;
                unsigned int v140 = v23 + 2;
                do
                {
                  *(_DWORD *)(*(void *)(*(void *)(v137 + 8) + *v24 + 24) + v138) = v140;
                  v138 += 32;
                  ++v140;
                  --v139;
                }
                while (v139);
              }
              uint64_t v141 = *(void *)(v134 + 48);
              uint64_t v142 = 32 * v135;
              *(_DWORD *)(*(void *)(*(void *)(v137 + 8) + *v24 + 24) + v142) = v141;
              uint64_t v143 = v141;
              atomic_compare_exchange_strong((atomic_ullong *volatile)(v134 + 48), (unint64_t *)&v143, (v141 & 0xFFFFFFFF00000000 | v136) + 0x100000000);
              if (v143 != v141)
              {
                uint64_t v144 = v143;
                do
                {
                  *(_DWORD *)(*(void *)(*(void *)(*(void *)(v134 + 40) + 8) + *v24 + 24) + v142) = v143;
                  atomic_compare_exchange_strong((atomic_ullong *volatile)(v134 + 48), (unint64_t *)&v144, (v143 & 0xFFFFFFFF00000000 | v136) + 0x100000000);
                  BOOL v22 = v144 == v143;
                  uint64_t v143 = v144;
                }
                while (!v22);
              }
            }
            atomic_store(v13, (unsigned int *)(impl[764] + 60));
          }
          goto LABEL_195;
        }
LABEL_197:
        abort();
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", "agxa_mempool_template.hpp", 302, "reserve");
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "agxa_mempool_template.hpp";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 302;
        __int16 v181 = 2080;
        v182 = "reserve";
        _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", buf, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
        goto LABEL_157;
      }
      return;
    case 1uLL:
      v38 = self->_impl;
      uint64_t v39 = v38[772];
      if (!*(_DWORD *)(v39 + 48) && (*(_DWORD *)(v39 + 44) + 1) < 2)
      {
        if (!a5) {
          return;
        }
        if ((a5 & 0x8000000000000000) != 0) {
          goto LABEL_197;
        }
        size_t v40 = 8 * a5;
        v11 = (char *)operator new(8 * a5);
        v41 = (unsigned int *)&v11[v40];
        memcpy(v11, a4, v40);
        std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>();
        unint64_t v42 = *(void *)&v11[v40 - 8];
        if (!HIDWORD(v42))
        {
          uint64_t v43 = v38[772];
          unint64_t v44 = *(unsigned int *)(v43 + 16);
          if (v42 >= v44)
          {
            do
            {
              if (v44) {
                unint64_t v44 = (2 * v44);
              }
              else {
                unint64_t v44 = 16;
              }
            }
            while (v42 >= v44);
            v45 = [[AGXBuffer alloc] initUntrackedInternalBufferWithDevice:*(void *)v43 length:32 * v44 options:0];
            v46 = v45;
            uint64_t v47 = *(void *)(v43 + 8);
            if (v47)
            {
              memcpy(*(void **)&v45[*MEMORY[0x263F4B188] + 24], *(const void **)(v47 + (int)*MEMORY[0x263F4B188] + 24), 32 * *(unsigned int *)(v43 + 16));
            }
            *(void *)(v43 + 8) = v46;
            *(_DWORD *)(v43 + 16) = v44;
            v48 = *(atomic_uint **)(v43 + 56);
            atomic_uint v49 = *v48;
            if ((*v48 + 1) > 1) {
              unsigned int v50 = v49 + 1;
            }
            else {
              unsigned int v50 = 1;
            }
            atomic_uint v51 = *v48;
            atomic_compare_exchange_strong(v48, (unsigned int *)&v51, v50);
            if (v51 != v49)
            {
              atomic_uint v52 = v51;
              do
              {
                if ((v51 + 1) > 1) {
                  unsigned int v53 = v51 + 1;
                }
                else {
                  unsigned int v53 = 1;
                }
                atomic_compare_exchange_strong(v48, (unsigned int *)&v52, v53);
                BOOL v22 = v52 == v51;
                atomic_uint v51 = v52;
              }
              while (!v22);
            }
          }
          unsigned int v54 = 0;
          atomic_store(0, (unint64_t *)(v38[772] + 32));
          v55 = (int *)MEMORY[0x263F4B188];
          v56 = (unsigned int *)v11;
          do
          {
            unint64_t v58 = v54 + 1;
            if (*(void *)v56 > v58)
            {
              uint64_t v59 = *(void *)v56 - 1;
              uint64_t v60 = v38[772];
              uint64_t v61 = *(void *)(v60 + 24);
              if (v58 < v59)
              {
                uint64_t v62 = 32 * v58;
                uint64_t v63 = v59 - v58;
                unsigned int v64 = v54 + 2;
                do
                {
                  *(_DWORD *)(*(void *)(*(void *)(v61 + 8) + *v55 + 24) + v62) = v64;
                  v62 += 32;
                  ++v64;
                  --v63;
                }
                while (v63);
              }
              uint64_t v65 = *(void *)(v60 + 32);
              uint64_t v66 = 32 * v59;
              *(_DWORD *)(*(void *)(*(void *)(v61 + 8) + *v55 + 24) + v66) = v65;
              uint64_t v67 = v65;
              atomic_compare_exchange_strong((atomic_ullong *volatile)(v60 + 32), (unint64_t *)&v67, (v65 & 0xFFFFFFFF00000000 | v58) + 0x100000000);
              if (v67 != v65)
              {
                do
                {
                  *(_DWORD *)(*(void *)(*(void *)(*(void *)(v60 + 24) + 8) + *v55 + 24) + v66) = v67;
                  uint64_t v68 = v67;
                  atomic_compare_exchange_strong((atomic_ullong *volatile)(v60 + 32), (unint64_t *)&v68, (v67 & 0xFFFFFFFF00000000 | v58) + 0x100000000);
                  BOOL v22 = v68 == v67;
                  uint64_t v67 = v68;
                }
                while (!v22);
              }
            }
            unsigned int v57 = *v56;
            v56 += 2;
            unsigned int v54 = v57;
          }
          while (v56 != v41);
          uint64_t v145 = v38[772];
          uint64_t v146 = (*(_DWORD *)(v145 + 16) - 1);
          if (v146 > v54)
          {
            uint64_t v147 = v54 + 1;
            uint64_t v148 = *(void *)(v145 + 24);
            if (v147 < v146)
            {
              uint64_t v149 = 32 * v147;
              uint64_t v150 = v146 - v147;
              unsigned int v151 = v54 + 2;
              do
              {
                *(_DWORD *)(*(void *)(*(void *)(v148 + 8) + *v55 + 24) + v149) = v151;
                v149 += 32;
                ++v151;
                --v150;
              }
              while (v150);
            }
            uint64_t v152 = *(void *)(v145 + 32);
            uint64_t v153 = 32 * v146;
            *(_DWORD *)(*(void *)(*(void *)(v148 + 8) + *v55 + 24) + v153) = v152;
            uint64_t v154 = v152;
            atomic_compare_exchange_strong((atomic_ullong *volatile)(v145 + 32), (unint64_t *)&v154, (v152 & 0xFFFFFFFF00000000 | v147) + 0x100000000);
            if (v154 != v152)
            {
              uint64_t v155 = v154;
              do
              {
                *(_DWORD *)(*(void *)(*(void *)(*(void *)(v145 + 24) + 8) + *v55 + 24) + v153) = v154;
                atomic_compare_exchange_strong((atomic_ullong *volatile)(v145 + 32), (unint64_t *)&v155, (v154 & 0xFFFFFFFF00000000 | v147) + 0x100000000);
                BOOL v22 = v155 == v154;
                uint64_t v154 = v155;
              }
              while (!v22);
            }
          }
          uint64_t v156 = v38[772];
LABEL_194:
          atomic_store(v42, (unsigned int *)(v156 + 44));
          goto LABEL_195;
        }
        goto LABEL_195;
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", "agxa_mempool_template.hpp", 302, "reserve");
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "agxa_mempool_template.hpp";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 302;
        __int16 v181 = 2080;
        v182 = "reserve";
        _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", buf, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
        goto LABEL_157;
      }
      return;
    case 4uLL:
      v69 = self->_impl;
      uint64_t v70 = 796;
      goto LABEL_115;
    case 5uLL:
      v69 = self->_impl;
      uint64_t v70 = 804;
      goto LABEL_115;
    case 6uLL:
      BOOL v71 = [(AGXG17FamilyDevice *)self requiresRaytracingEmulation];
      v69 = self->_impl;
      if (v71) {
        goto LABEL_70;
      }
      uint64_t v70 = 812;
      goto LABEL_115;
    case 7uLL:
      BOOL v72 = [(AGXG17FamilyDevice *)self requiresRaytracingEmulation];
      v69 = self->_impl;
      if (v72)
      {
LABEL_70:
        v73 = (void *)v69[826];
        std::vector<unsigned long long>::__insert_with_size[abi:nn180100]<unsigned long long *,unsigned long long *>(v69 + 825, v73, (char *)a4, (char *)&a4[a5], a5);
      }
      else
      {
        uint64_t v70 = 820;
LABEL_115:
        AGX::Mempool<32u,0u,true,unsigned long long>::AtomicList::reserve(&v69[v70], a4, a5);
      }
      return;
    case 8uLL:
      BOOL v74 = [(AGXG17FamilyDevice *)self buildBVHForRIA];
      v75 = self->_impl;
      if (v74)
      {
        uint64_t v76 = v75[780];
        if (!*(_DWORD *)(v76 + 48) && (*(_DWORD *)(v76 + 44) + 1) < 2)
        {
          if (!a5) {
            return;
          }
          if ((a5 & 0x8000000000000000) != 0) {
            goto LABEL_197;
          }
          size_t v77 = 8 * a5;
          v11 = (char *)operator new(8 * a5);
          v78 = (unsigned int *)&v11[v77];
          memcpy(v11, a4, v77);
          std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>();
          unint64_t v42 = *(void *)&v11[v77 - 8];
          if (!HIDWORD(v42))
          {
            uint64_t v79 = v75[780];
            unint64_t v80 = *(unsigned int *)(v79 + 16);
            if (v42 >= v80)
            {
              do
              {
                if (v80) {
                  unint64_t v80 = (2 * v80);
                }
                else {
                  unint64_t v80 = 16;
                }
              }
              while (v42 >= v80);
              v81 = [[AGXBuffer alloc] initUntrackedInternalBufferWithDevice:*(void *)v79 length:16 * v80 options:0];
              v82 = v81;
              uint64_t v83 = *(void *)(v79 + 8);
              if (v83)
              {
                memcpy(*(void **)&v81[*MEMORY[0x263F4B188] + 24], *(const void **)(v83 + (int)*MEMORY[0x263F4B188] + 24), 16 * *(unsigned int *)(v79 + 16));
              }
              *(void *)(v79 + 8) = v82;
              *(_DWORD *)(v79 + 16) = v80;
              v84 = *(atomic_uint **)(v79 + 56);
              atomic_uint v85 = *v84;
              if ((*v84 + 1) > 1) {
                unsigned int v86 = v85 + 1;
              }
              else {
                unsigned int v86 = 1;
              }
              atomic_uint v87 = *v84;
              atomic_compare_exchange_strong(v84, (unsigned int *)&v87, v86);
              if (v87 != v85)
              {
                atomic_uint v88 = v87;
                do
                {
                  if ((v87 + 1) > 1) {
                    unsigned int v89 = v87 + 1;
                  }
                  else {
                    unsigned int v89 = 1;
                  }
                  atomic_compare_exchange_strong(v84, (unsigned int *)&v88, v89);
                  BOOL v22 = v88 == v87;
                  atomic_uint v87 = v88;
                }
                while (!v22);
              }
            }
            unsigned int v90 = 0;
            atomic_store(0, (unint64_t *)(v75[780] + 32));
            v91 = (int *)MEMORY[0x263F4B188];
            v92 = (unsigned int *)v11;
            do
            {
              unint64_t v94 = v90 + 1;
              if (*(void *)v92 > v94)
              {
                uint64_t v95 = *(void *)v92 - 1;
                uint64_t v96 = v75[780];
                uint64_t v97 = *(void *)(v96 + 24);
                if (v94 < v95)
                {
                  uint64_t v98 = 16 * v94;
                  uint64_t v99 = v95 - v94;
                  unsigned int v100 = v90 + 2;
                  do
                  {
                    *(_DWORD *)(*(void *)(*(void *)(v97 + 8) + *v91 + 24) + v98) = v100;
                    v98 += 16;
                    ++v100;
                    --v99;
                  }
                  while (v99);
                }
                uint64_t v101 = *(void *)(v96 + 32);
                uint64_t v102 = 16 * v95;
                *(_DWORD *)(*(void *)(*(void *)(v97 + 8) + *v91 + 24) + v102) = v101;
                uint64_t v103 = v101;
                atomic_compare_exchange_strong((atomic_ullong *volatile)(v96 + 32), (unint64_t *)&v103, (v101 & 0xFFFFFFFF00000000 | v94) + 0x100000000);
                if (v103 != v101)
                {
                  do
                  {
                    *(_DWORD *)(*(void *)(*(void *)(*(void *)(v96 + 24) + 8) + *v91 + 24) + v102) = v103;
                    uint64_t v104 = v103;
                    atomic_compare_exchange_strong((atomic_ullong *volatile)(v96 + 32), (unint64_t *)&v104, (v103 & 0xFFFFFFFF00000000 | v94) + 0x100000000);
                    BOOL v22 = v104 == v103;
                    uint64_t v103 = v104;
                  }
                  while (!v22);
                }
              }
              unsigned int v93 = *v92;
              v92 += 2;
              unsigned int v90 = v93;
            }
            while (v92 != v78);
            uint64_t v157 = v75[780];
            uint64_t v158 = (*(_DWORD *)(v157 + 16) - 1);
            if (v158 > v90)
            {
              uint64_t v159 = v90 + 1;
              uint64_t v160 = *(void *)(v157 + 24);
              if (v159 < v158)
              {
                uint64_t v161 = 16 * v159;
                uint64_t v162 = v158 - v159;
                unsigned int v163 = v90 + 2;
                do
                {
                  *(_DWORD *)(*(void *)(*(void *)(v160 + 8) + *v91 + 24) + v161) = v163;
                  v161 += 16;
                  ++v163;
                  --v162;
                }
                while (v162);
              }
              uint64_t v164 = *(void *)(v157 + 32);
              uint64_t v165 = 16 * v158;
              *(_DWORD *)(*(void *)(*(void *)(v160 + 8) + *v91 + 24) + v165) = v164;
              uint64_t v166 = v164;
              atomic_compare_exchange_strong((atomic_ullong *volatile)(v157 + 32), (unint64_t *)&v166, (v164 & 0xFFFFFFFF00000000 | v159) + 0x100000000);
              if (v166 != v164)
              {
                uint64_t v167 = v166;
                do
                {
                  *(_DWORD *)(*(void *)(*(void *)(*(void *)(v157 + 24) + 8) + *v91 + 24) + v165) = v166;
                  atomic_compare_exchange_strong((atomic_ullong *volatile)(v157 + 32), (unint64_t *)&v167, (v166 & 0xFFFFFFFF00000000 | v159) + 0x100000000);
                  BOOL v22 = v167 == v166;
                  uint64_t v166 = v167;
                }
                while (!v22);
              }
            }
            uint64_t v156 = v75[780];
            goto LABEL_194;
          }
LABEL_195:
          operator delete(v11);
          return;
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", "agxa_mempool_template.hpp", 302, "reserve");
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "agxa_mempool_template.hpp";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 302;
          __int16 v181 = 2080;
          v182 = "reserve";
          _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
LABEL_157:
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "agxa_mempool_template.hpp";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 302;
          __int16 v181 = 2080;
          v182 = "reserve";
          _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", buf, 0x1Cu);
        }
      }
      else
      {
        uint64_t v105 = v75[788];
        if (!*(_DWORD *)(v105 + 48) && (*(_DWORD *)(v105 + 44) + 1) < 2)
        {
          if (!a5) {
            return;
          }
          if ((a5 & 0x8000000000000000) != 0) {
            goto LABEL_197;
          }
          size_t v106 = 8 * a5;
          v11 = (char *)operator new(8 * a5);
          v107 = (unsigned int *)&v11[v106];
          memcpy(v11, a4, v106);
          std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>();
          unint64_t v42 = *(void *)&v11[v106 - 8];
          if (!HIDWORD(v42))
          {
            uint64_t v108 = v75[788];
            unint64_t v109 = *(unsigned int *)(v108 + 16);
            v110 = (int *)MEMORY[0x263F4B188];
            if (v42 >= v109)
            {
              do
              {
                if (v109) {
                  unint64_t v109 = (2 * v109);
                }
                else {
                  unint64_t v109 = 16;
                }
              }
              while (v42 >= v109);
              v111 = [[AGXBuffer alloc] initUntrackedInternalBufferWithDevice:*(void *)v108 length:8 * v109 options:0];
              v112 = v111;
              uint64_t v113 = *(void *)(v108 + 8);
              if (v113)
              {
                memcpy(*(void **)&v111[*v110 + 24], *(const void **)(v113 + *v110 + 24), 8 * *(unsigned int *)(v108 + 16));
              }
              *(void *)(v108 + 8) = v112;
              *(_DWORD *)(v108 + 16) = v109;
              v114 = *(atomic_uint **)(v108 + 56);
              atomic_uint v115 = *v114;
              if ((*v114 + 1) > 1) {
                unsigned int v116 = v115 + 1;
              }
              else {
                unsigned int v116 = 1;
              }
              atomic_uint v117 = *v114;
              atomic_compare_exchange_strong(v114, (unsigned int *)&v117, v116);
              if (v117 != v115)
              {
                atomic_uint v118 = v117;
                do
                {
                  if ((v117 + 1) > 1) {
                    unsigned int v119 = v117 + 1;
                  }
                  else {
                    unsigned int v119 = 1;
                  }
                  atomic_compare_exchange_strong(v114, (unsigned int *)&v118, v119);
                  BOOL v22 = v118 == v117;
                  atomic_uint v117 = v118;
                }
                while (!v22);
              }
            }
            unsigned int v120 = 0;
            atomic_store(0, (unint64_t *)(v75[788] + 32));
            v121 = (unsigned int *)v11;
            do
            {
              unint64_t v123 = v120 + 1;
              if (*(void *)v121 > v123)
              {
                uint64_t v124 = *(void *)v121 - 1;
                uint64_t v125 = v75[788];
                uint64_t v126 = *(void *)(v125 + 24);
                if (v123 < v124)
                {
                  uint64_t v127 = 8 * v123;
                  uint64_t v128 = v124 - v123;
                  unsigned int v129 = v120 + 2;
                  do
                  {
                    *(_DWORD *)(*(void *)(*(void *)(v126 + 8) + *v110 + 24) + v127) = v129;
                    v127 += 8;
                    ++v129;
                    --v128;
                  }
                  while (v128);
                }
                uint64_t v130 = *(void *)(v125 + 32);
                uint64_t v131 = 8 * v124;
                *(_DWORD *)(*(void *)(*(void *)(v126 + 8) + *v110 + 24) + v131) = v130;
                uint64_t v132 = v130;
                atomic_compare_exchange_strong((atomic_ullong *volatile)(v125 + 32), (unint64_t *)&v132, (v130 & 0xFFFFFFFF00000000 | v123) + 0x100000000);
                if (v132 != v130)
                {
                  do
                  {
                    *(_DWORD *)(*(void *)(*(void *)(*(void *)(v125 + 24) + 8) + *v110 + 24) + v131) = v132;
                    uint64_t v133 = v132;
                    atomic_compare_exchange_strong((atomic_ullong *volatile)(v125 + 32), (unint64_t *)&v133, (v132 & 0xFFFFFFFF00000000 | v123) + 0x100000000);
                    BOOL v22 = v133 == v132;
                    uint64_t v132 = v133;
                  }
                  while (!v22);
                }
              }
              unsigned int v122 = *v121;
              v121 += 2;
              unsigned int v120 = v122;
            }
            while (v121 != v107);
            uint64_t v168 = v75[788];
            uint64_t v169 = (*(_DWORD *)(v168 + 16) - 1);
            if (v169 > v120)
            {
              uint64_t v170 = v120 + 1;
              uint64_t v171 = *(void *)(v168 + 24);
              if (v170 < v169)
              {
                uint64_t v172 = 8 * v170;
                uint64_t v173 = v169 - v170;
                unsigned int v174 = v120 + 2;
                do
                {
                  *(_DWORD *)(*(void *)(*(void *)(v171 + 8) + *v110 + 24) + v172) = v174;
                  v172 += 8;
                  ++v174;
                  --v173;
                }
                while (v173);
              }
              uint64_t v175 = *(void *)(v168 + 32);
              uint64_t v176 = 8 * v169;
              *(_DWORD *)(*(void *)(*(void *)(v171 + 8) + *v110 + 24) + v176) = v175;
              uint64_t v177 = v175;
              atomic_compare_exchange_strong((atomic_ullong *volatile)(v168 + 32), (unint64_t *)&v177, (v175 & 0xFFFFFFFF00000000 | v170) + 0x100000000);
              if (v177 != v175)
              {
                uint64_t v178 = v177;
                do
                {
                  *(_DWORD *)(*(void *)(*(void *)(*(void *)(v168 + 24) + 8) + *v110 + 24) + v176) = v177;
                  atomic_compare_exchange_strong((atomic_ullong *volatile)(v168 + 32), (unint64_t *)&v178, (v177 & 0xFFFFFFFF00000000 | v170) + 0x100000000);
                  BOOL v22 = v178 == v177;
                  uint64_t v177 = v178;
                }
                while (!v22);
              }
            }
            uint64_t v156 = v75[788];
            goto LABEL_194;
          }
          goto LABEL_195;
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", "agxa_mempool_template.hpp", 302, "reserve");
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "agxa_mempool_template.hpp";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 302;
          __int16 v181 = 2080;
          v182 = "reserve";
          _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** reserve() must be called before any allocation takes place\n", buf, 0x1Cu);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO)) {
          goto LABEL_157;
        }
      }
      return;
    default:
      return;
  }
}

- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3
{
  return -[AGXG17FamilyDevice resourcePatchingTypeForResourceType:]::resourceToPatchingTypeMap[a3];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  if (self) {
    [(AGXG17FamilyDevice *)self accelerationStructureSizesWithDescriptor:a3];
  }
  unint64_t v4 = [(AGXG17FamilyDevice *)self heapAccelerationStructureSizeAndAlignWithSize:0];
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  unint64_t v4 = 0x4000;
  result.var1 = v4;
  result.var0 = a3;
  return result;
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  if ([(AGXG17FamilyDevice *)self requiresRaytracingEmulation])
  {
    v26.receiver = self;
    v26.super_class = (Class)AGXG17FamilyDevice;
    [(_MTLDevice *)&v26 deserializeInstanceAccelerationStructure:a3 fromBytes:a4 primitiveAccelerationStructures:a5 withDescriptor:a6];
  }
  else
  {
    unint64_t v11 = 0x268D57000uLL;
    v24 = (char *)a3;
    v12 = (void *)*((void *)a3 + 41);
    memcpy(v12, (char *)a4 + 24, *((void *)a4 + 1) - 24);
    if (((*((_DWORD *)a4 + 36) - *((_DWORD *)a4 + 38)) & 0xFFFFFFF0) != 0)
    {
      unint64_t v13 = 0;
      uint64_t v14 = (_DWORD *)((char *)v12 + v12[16] + 8);
      id v25 = a6;
      do
      {
        uint64_t v15 = *v14;
        v16 = (char *)v12 + *((void *)v14 - 1);
        int v17 = *(_DWORD *)(objc_msgSend(a5, "objectAtIndexedSubscript:", v15, v24) + *(int *)(v11 + 1964) + 24);
        *((_DWORD *)v16 + 1) = v17;
        if ([a6 instanceDescriptorType] != 2 && objc_msgSend(a6, "instanceDescriptorType") != 4)
        {
          uint64_t v18 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v15), "buffer");
          atomic_uint v19 = v12;
          unint64_t v20 = v11;
          uint64_t v21 = *(void *)(v18 + (int)*MEMORY[0x263F4B188] + 8);
          uint64_t v22 = v21 + objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v15), "bufferOffset");
          unint64_t v11 = v20;
          v12 = v19;
          a6 = v25;
          *((void *)v16 + 11) = v22;
        }
        *uint64_t v14 = v17;
        v14 += 4;
        ++v13;
      }
      while (v13 < (*((_DWORD *)a4 + 36) - *((_DWORD *)a4 + 38)) >> 4);
    }
    uint64_t v23 = *(void *)&v24[*(int *)(v11 + 1964) + 8];
    *(void *)(v23 + 144) = objc_msgSend(v24, "accelerationStructureUniqueIdentifier", v24);
  }
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  if ([(AGXG17FamilyDevice *)self requiresRaytracingEmulation])
  {
    v10.receiver = self;
    v10.super_class = (Class)AGXG17FamilyDevice;
    [(_MTLDevice *)&v10 deserializePrimitiveAccelerationStructure:a3 fromBytes:a4 withDescriptor:a5];
  }
  else
  {
    memcpy(*((void **)a3 + 41), (char *)a4 + 24, *((void *)a4 + 1) - 24);
    uint64_t v9 = *((void *)a3 + 41);
    *(void *)(v9 + 144) = [a3 accelerationStructureUniqueIdentifier];
  }
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  if ([(AGXG17FamilyDevice *)self requiresRaytracingEmulation])
  {
    v12.receiver = self;
    v12.super_class = (Class)AGXG17FamilyDevice;
    id v9 = [(_MTLDevice *)&v12 deserializeInstanceAccelerationStructureFromBytes:a3 primitiveAccelerationStructures:a4 withDescriptor:a5];
    objc_super v10 = [[AGXG17FamilyRayTracingAccelerationStructureSW alloc] initWithDevice:self src:v9];
  }
  else
  {
    objc_super v10 = [[AGXG17FamilyRayTracingAccelerationStructure alloc] initWithDevice:self length:*((void *)a3 + 2) resourceIndex:0 storageMode:0];
    if (v10) {
      [(AGXG17FamilyDevice *)self deserializeInstanceAccelerationStructure:v10 fromBytes:a3 primitiveAccelerationStructures:a4 withDescriptor:a5];
    }
  }
  return v10;
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  if ([(AGXG17FamilyDevice *)self requiresRaytracingEmulation])
  {
    v9.receiver = self;
    v9.super_class = (Class)AGXG17FamilyDevice;
    return [(_MTLDevice *)&v9 deserializePrimitiveAccelerationStructureFromBytes:a3 withDescriptor:a4];
  }
  else
  {
    v7 = [[AGXG17FamilyRayTracingAccelerationStructure alloc] initWithDevice:self length:*((void *)a3 + 2) resourceIndex:0 storageMode:0];
    if (v7) {
      [(AGXG17FamilyDevice *)self deserializePrimitiveAccelerationStructure:v7 fromBytes:a3 withDescriptor:a4];
    }
  }
  return v7;
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  if ([(AGXG17FamilyDevice *)self requiresRaytracingEmulation])
  {
    v9.receiver = self;
    v9.super_class = (Class)AGXG17FamilyDevice;
    return [(_MTLDevice *)&v9 isCompatibleWithAccelerationStructure:a3];
  }
  uint64_t v6 = 1;
  if (a3.var0 != 465429) {
    uint64_t v6 = 2;
  }
  if (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::kBvhChipCodes[v6] == a3.var0
    && (unsigned int v7 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::kBvhVersions[v6] ^ a3.var1,
        (v7 & 0xFFF) == 0))
  {
    unsigned int v8 = a3.var1 & 0xFFFFFFF;
    BOOL result = 1;
    if ((a3.var1 & 0xFFFFFFF) == 0x1001006 || !(v7 & 0xFF0000 | a3.var1 & 0xF000)) {
      return result;
    }
  }
  else
  {
    unsigned int v8 = a3.var1 & 0xFFFFFFF;
    if ((a3.var1 & 0xFFFFFFF) == 0x1001006) {
      return 1;
    }
  }
  BOOL result = 1;
  if (v8 != 33558533 && v8 != 50335745) {
    return v8 == 67112960;
  }
  return result;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(AGXG17FamilyDevice *)self buildBVHForRIA])
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: !!! %s not supported for RIA BVH\n", "agxa_device_objc.mm", 2731, "-[AGXG17FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]", "-[AGXG17FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      objc_super v12 = "agxa_device_objc.mm";
      __int16 v13 = 1024;
      int v14 = 2731;
      __int16 v15 = 2080;
      v16 = "-[AGXG17FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]";
      __int16 v17 = 2080;
      uint64_t v18 = "-[AGXG17FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]";
      _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: !!! %s not supported for RIA BVH\n", buf, 0x26u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      objc_super v12 = "agxa_device_objc.mm";
      __int16 v13 = 1024;
      int v14 = 2731;
      __int16 v15 = 2080;
      v16 = "-[AGXG17FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]";
      __int16 v17 = 2080;
      uint64_t v18 = "-[AGXG17FamilyDevice newAccelerationStructureWithBuffer:offset:resourceIndex:]";
      _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: !!! %s not supported for RIA BVH\n", buf, 0x26u);
    }
    abort();
  }
  objc_super v9 = [AGXG17FamilyRayTracingAccelerationStructureSW alloc];

  return [(AGXG17FamilyRayTracingAccelerationStructureSW *)v9 initWithBuffer:a3 offset:a4 device:self resourceIndex:a5];
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  return [(AGXG17FamilyDevice *)self newAccelerationStructureWithBuffer:a3 offset:a4 resourceIndex:0];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  if ([a4 forceResourceIndex]) {
    uint64_t v7 = [a4 resourceIndex];
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(AGXG17FamilyDevice *)self buildBVHForRIA];
  objc_super v9 = off_26516E3A8;
  if (!v8) {
    objc_super v9 = off_26516E3B0;
  }
  id v10 = objc_alloc(*v9);
  uint64_t v11 = [a4 storageMode];

  return (id)[v10 initWithDevice:self length:a3 resourceIndex:v7 storageMode:v11];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  BOOL v7 = [(AGXG17FamilyDevice *)self buildBVHForRIA];
  BOOL v8 = off_26516E3A8;
  if (!v7) {
    BOOL v8 = off_26516E3B0;
  }
  id v9 = objc_alloc(*v8);

  return (id)[v9 initWithDevice:self length:a3 resourceIndex:a4 storageMode:2];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  return [(AGXG17FamilyDevice *)self newAccelerationStructureWithSize:a3 resourceIndex:0];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  if ([(AGXG17FamilyDevice *)self buildBVHForRIA])
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
    BOOL v7 = (void *)MEMORY[0x24566F2C0]();
    {
      AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
    }
    if (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride <= 0) {
      unsigned int v8 = 2;
    }
    else {
      unsigned int v8 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride;
    }
    BVHDescriptor = (void *)AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createBVHDescriptor(a4, 0, v8);
    {
      AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride = 0;
    }
    if (AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride <= 0) {
      unsigned int v10 = 2;
    }
    else {
      unsigned int v10 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getSelectedRiaBvhGen(void)::riaBvhGenOverride;
    }
    uint64_t v23 = 0;
    unint64_t v11 = AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::calcRiaBvhSize((unint64_t)BVHDescriptor, a4, v10, (unint64_t *)&v23);
    retstr->var0 = v11;
    retstr->var2 = 0;
    LOBYTE(v16[0]) = 0;
    v16[1] = v11;
    v16[2] = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    if ([BVHDescriptor buildAlgorithm] - 1 > 1) {
      AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocateTopDownScratch(v15, (uint64_t)self, (unint64_t)BVHDescriptor, a4, v16, v23);
    }
    else {
      AGX::RayTracingGPUBuilderGen1<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::allocatePLOCScratch(v15, (unint64_t)BVHDescriptor, v16);
    }
    unint64_t v13 = *((void *)&v18 + 1);
    if (*((void *)&v18 + 1) <= *((void *)&v19 + 1)) {
      unint64_t v13 = *((void *)&v19 + 1);
    }
    if (v13 <= *((void *)&v20 + 1)) {
      unint64_t v13 = *((void *)&v20 + 1);
    }
    if (v13 <= *((void *)&v21 + 1)) {
      unint64_t v13 = *((void *)&v21 + 1);
    }
    retstr->var1 = *((void *)&v22 + 1) + ((v13 + 63) & 0xFFFFFFFFFFFFFFC0) + 64;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AGXG17FamilyDevice;
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)&v14 accelerationStructureSizesWithDescriptor:a4];
  }
  return result;
}

- (BOOL)buildBVHForRIA
{
  {
    -[AGXG17FamilyDevice buildBVHForRIA]::riaBvhGenOverride = 0;
  }
  return 1;
}

- (BOOL)requiresRaytracingEmulation
{
  return 0;
}

- (unint64_t)latestSupportedGenericBVHVersion
{
  if ([(AGXG17FamilyDevice *)self buildBVHForRIA]) {
    return 261;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyDevice;
  return [(_MTLDevice *)&v4 latestSupportedGenericBVHVersion];
}

- (BOOL)supportsRaytracing
{
  unint64_t v3 = [(_MTLDevice *)self argumentBuffersSupport];
  if (v3)
  {
    LOBYTE(v3) = [(_MTLDevice *)self supportsFunctionPointers];
  }
  return v3;
}

- (unint64_t)deviceCreationFlags
{
  return *((void *)self->_impl + 911);
}

- (BOOL)supportsCounterSampling:(unint64_t)a3
{
  return a3 == 0;
}

- (id)counterSampleBufferLimits
{
  return &unk_26F86C7A8;
}

- (id)newCounterSampleBufferWithLength:(unint64_t)a3 label:(id)a4 error:(id *)a5
{
  id v9 = [AGXMTLCounterSampleBuffer alloc];

  return [(AGXMTLCounterSampleBuffer *)v9 initWithDevice:self length:a3 label:a4 options:0 error:a5];
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  return 0;
}

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  BOOL v7 = [AGXMTLCounterSampleBuffer alloc];

  return [(AGXMTLCounterSampleBuffer *)v7 initWithDevice:self descriptor:a3 error:a4];
}

- (NSArray)counterSets
{
  id v2 = objc_alloc(MEMORY[0x263F12870]);
  unint64_t v3 = (void *)[v2 initWithName:*MEMORY[0x263F12628] description:*MEMORY[0x263F12688]];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v3, 0);
  id v5 = objc_alloc(MEMORY[0x263F12888]);
  uint64_t v6 = (void *)[v5 initWithName:*MEMORY[0x263F12620] description:*MEMORY[0x263F12698] counters:v4];
  BOOL v7 = (NSArray *)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v6, 0);

  return v7;
}

- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4
{
  uint64_t v6 = mach_absolute_time();
  if (getTimebaseInfo(void)::once != -1) {
    dispatch_once(&getTimebaseInfo(void)::once, &__block_literal_global_7474);
  }
  unint64_t v7 = v6 * getTimebaseInfo(void)::sTimebaseInfo / *(unsigned int *)algn_268D5B048;
  *a3 = v7;
  *a4 = v7;
}

- (unsigned)maximumComputeSubstreams
{
  return 2;
}

- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3
{
  return ((1 << a3) & 6) != 0 || a3 == 0;
}

- (BOOL)isRTZRoundingSupported
{
  return 1;
}

- (id)copyIOSurfaceSharedTextureProperties:(id)a3
{
  id v5 = objc_opt_new();
  uint64_t v6 = [[AGXTextureLayout alloc] initWithDevice:self descriptor:a3 isHeapOrBufferBacked:0];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AGXTextureLayout size](v6, "size"));
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F0ED30]];

  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "compressionMode")), @"kAGXCompressionMode");
  return v5;
}

- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4
{
  if (os_parse_boot_arg_int()
    && -[AGXG17FamilyDevice newResourceGroupFromResources:count:]::disableDropHints == 1)
  {
    return 0;
  }
  uint64_t v7 = [AGXG17FamilyResourceGroup alloc];
  impl = self->_impl;

  return [(AGXG17FamilyResourceGroup *)v7 initWithDevice:impl resources:a3 count:a4];
}

- (unint64_t)maxRasterizationRateLayerCount
{
  return 2;
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  id v5 = [AGXG17FamilyRasterizationRateMap alloc];

  return [(AGXG17FamilyRasterizationRateMap *)v5 initWithDevice:self descriptor:a3];
}

- (id)indirectArgumentBufferDecodingData
{
  return (id)MEMORY[0x263EF8388];
}

- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities
{
  return (IndirectArgumentBufferCapabilities)7;
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  id v5 = [AGXG17FamilyIndirectArgumentEncoder alloc];

  return [(AGXG17FamilyIndirectArgumentEncoder *)v5 initWithLayout:a3 device:self];
}

- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3
{
  uint64_t v4 = [AGXG17FamilyIndirectArgumentBufferLayout alloc];

  return [(AGXG17FamilyIndirectArgumentBufferLayout *)v4 initWithStructType:a3];
}

- (BOOL)setupCompiler:(int)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  impl = self->_impl;
  id v5 = (void *)MEMORY[0x24566F2C0]();
  impl[1967] = a3;
  if (unsigned __int16)(a3 - 4) < 0x18u && ((0xEBF5FDu >> (a3 - 4)))
  {
    unint64_t v6 = qword_242EA8F60[(unsigned __int16)(a3 - 4)] | qword_242EA8EA0[(unsigned __int16)(a3 - 4)];
LABEL_9:
    uint64_t v10 = HIDWORD(v6);
    if (a3 <= 196615)
    {
      uint64_t v14 = HIDWORD(v6);
      uint64_t v13 = HIDWORD(v6);
      uint64_t v12 = HIDWORD(v6);
      switch(a3)
      {
        case 65542:
          unint64_t v11 = "g9p";
          break;
        case 65543:
          unint64_t v11 = "g9g";
          break;
        case 65545:
          unint64_t v11 = "g11p_a0";
          break;
        case 65546:
          unint64_t v11 = "g11m_a0";
          break;
        case 65547:
        case 65559:
LABEL_18:
          unint64_t v11 = "g11p";
          break;
        case 65550:
          unint64_t v11 = "g13p_a0";
          break;
        case 65552:
          unint64_t v11 = "g13g_a0";
          break;
        case 65553:
          unint64_t v11 = "g14p_a0";
          break;
        case 65554:
          unint64_t v11 = "g14g_a0";
          break;
        case 65555:
          unint64_t v11 = "g14s_a0";
          break;
        case 65556:
          unint64_t v11 = "g14c_a0";
          break;
        case 65557:
          unint64_t v11 = "g14d_a0";
          break;
        case 65560:
          goto LABEL_7;
        case 65561:
        case 65562:
          unint64_t v11 = "g13s_a0";
          break;
        case 65563:
          unint64_t v11 = "g13d_a0";
          break;
        case 65567:
          goto LABEL_21;
        case 65568:
          goto LABEL_19;
        case 65570:
          goto LABEL_20;
        default:
          goto LABEL_44;
      }
    }
    else if (a3 > 262174)
    {
      switch(a3)
      {
        case 262175:
LABEL_26:
          unint64_t v11 = "g16p";
          break;
        case 327684:
          unint64_t v11 = "g5p";
          break;
        case 327704:
LABEL_16:
          unint64_t v11 = "g15g";
          break;
        default:
LABEL_44:
          unint64_t v11 = 0;
          break;
      }
    }
    else
    {
      uint64_t v9 = HIDWORD(v6);
      uint64_t v8 = HIDWORD(v6);
      uint64_t v7 = HIDWORD(v6);
      switch(a3)
      {
        case 196616:
          unint64_t v11 = "g10p";
          break;
        case 196617:
          goto LABEL_18;
        case 196618:
          unint64_t v11 = "g11m";
          break;
        case 196620:
          unint64_t v11 = "g12p";
          break;
        case 196622:
          unint64_t v11 = "g13p";
          break;
        case 196624:
          unint64_t v11 = "g13g";
          break;
        case 196625:
          unint64_t v11 = "g14p";
          break;
        case 196626:
          unint64_t v11 = "g14g";
          break;
        case 196627:
        case 196628:
          unint64_t v11 = "g14s";
          break;
        case 196629:
          unint64_t v11 = "g14d";
          break;
        case 196630:
          goto LABEL_5;
        case 196632:
          goto LABEL_24;
        case 196633:
        case 196634:
          unint64_t v11 = "g13s";
          break;
        case 196635:
          unint64_t v11 = "g13d";
          break;
        case 196639:
          goto LABEL_22;
        case 196640:
          goto LABEL_23;
        default:
          goto LABEL_44;
      }
    }
  }
  else
  {
    unint64_t v6 = 0;
    if (a3 > 196629)
    {
      uint64_t v7 = 403;
      uint64_t v8 = 243;
      uint64_t v9 = 83;
      uint64_t v10 = 610;
      switch(a3)
      {
        case 196630:
LABEL_5:
          unint64_t v11 = "g15p";
          goto LABEL_27;
        case 196631:
        case 196633:
        case 196634:
        case 196635:
        case 196636:
        case 196637:
        case 196638:
          goto LABEL_9;
        case 196632:
LABEL_24:
          unint64_t v11 = "g15g_b0";
          uint64_t v10 = v9;
          goto LABEL_27;
        case 196639:
LABEL_22:
          unint64_t v11 = "g16p_b0";
          uint64_t v10 = v8;
          goto LABEL_27;
        case 196640:
LABEL_23:
          unint64_t v11 = "g16g";
          uint64_t v10 = v7;
          goto LABEL_27;
        default:
          if (a3 == 262175)
          {
            uint64_t v10 = 435;
            goto LABEL_26;
          }
          if (a3 != 327704) {
            goto LABEL_9;
          }
          uint64_t v10 = 275;
          break;
      }
      goto LABEL_16;
    }
    uint64_t v12 = 323;
    uint64_t v13 = 259;
    uint64_t v14 = 227;
    uint64_t v10 = 67;
    switch(a3)
    {
      case 65560:
LABEL_7:
        unint64_t v11 = "g15g_a0";
        break;
      case 65567:
LABEL_21:
        unint64_t v11 = "g16p_a0";
        uint64_t v10 = v14;
        break;
      case 65568:
LABEL_19:
        unint64_t v11 = "g16g_a0";
        uint64_t v10 = v13;
        break;
      case 65570:
LABEL_20:
        unint64_t v11 = "g17p";
        uint64_t v10 = v12;
        break;
      default:
        goto LABEL_9;
    }
  }
LABEL_27:
  *((void *)impl + 980) = v10;
  impl[1962] = 2;
  *((void *)impl + 982) = v11;
  *((_WORD *)impl + 3932) = 2;
  *((_WORD *)impl + 3933) = 0;
  if (AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getBundle(void)::pred != -1) {
    dispatch_once(&AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getBundle(void)::pred, &__block_literal_global_102);
  }
  __int16 v15 = (void *)AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getBundle(void)::bundle;
  uint64_t v16 = [NSString stringWithUTF8String:"ds"];
  uint64_t v17 = objc_msgSend(v15, "pathForResource:ofType:", v16, objc_msgSend(NSString, "stringWithUTF8String:", *((void *)impl + 982)));
  if (v17)
  {
    if ([objc_alloc(MEMORY[0x263F12AE8]) initWithFilePath:v17 readOnly:1 deviceInfo:impl + 1960]) {
      operator new[]();
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** unable to load precompiled driver shaders\n", "agxa_device_template.hpp", 1193, "setupCompiler");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      int buffer = 136315650;
      buffer_4 = "agxa_device_template.hpp";
      __int16 v25 = 1024;
      int v26 = 1193;
      __int16 v27 = 2080;
      uint64_t v28 = "setupCompiler";
      _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** unable to load precompiled driver shaders\n", (uint8_t *)&buffer, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int buffer = 136315650;
      buffer_4 = "agxa_device_template.hpp";
      __int16 v25 = 1024;
      int v26 = 1193;
      __int16 v27 = 2080;
      uint64_t v28 = "setupCompiler";
      _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** unable to load precompiled driver shaders\n", (uint8_t *)&buffer, 0x1Cu);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** FATAL: driver shader binary file not found in %s for extension %s!!!\n\n", "agxa_device_template.hpp", 1183, "setupCompiler", (const char *)objc_msgSend((id)objc_msgSend(v15, "bundlePath"), "UTF8String"), *((const char **)impl + 982));
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_msgSend((id)objc_msgSend(v15, "bundlePath"), "UTF8String");
      uint64_t v22 = *((void *)impl + 982);
      int buffer = 136316162;
      buffer_4 = "agxa_device_template.hpp";
      __int16 v25 = 1024;
      int v26 = 1183;
      __int16 v27 = 2080;
      uint64_t v28 = "setupCompiler";
      __int16 v29 = 2080;
      uint64_t v30 = v21;
      __int16 v31 = 2080;
      uint64_t v32 = v22;
      _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** FATAL: driver shader binary file not found in %s for extension %s!!!\n\n", (uint8_t *)&buffer, 0x30u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_msgSend((id)objc_msgSend(v15, "bundlePath"), "UTF8String");
      uint64_t v19 = *((void *)impl + 982);
      int buffer = 136316162;
      buffer_4 = "agxa_device_template.hpp";
      __int16 v25 = 1024;
      int v26 = 1183;
      __int16 v27 = 2080;
      uint64_t v28 = "setupCompiler";
      __int16 v29 = 2080;
      uint64_t v30 = v18;
      __int16 v31 = 2080;
      uint64_t v32 = v19;
      _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** FATAL: driver shader binary file not found in %s for extension %s!!!\n\n", (uint8_t *)&buffer, 0x30u);
    }
  }
  return 0;
}

- (unint64_t)maxThreadgroupMemoryLength
{
  return 0x8000;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup
{
  *(int64x2_t *)&retstr->var0 = vdupq_n_s64(0x400uLL);
  retstr->var2 = 1024;
  return self;
}

- (BOOL)areProgrammableSamplePositionsSupported
{
  return 1;
}

- (int)llvmVersion
{
  return 32023;
}

- (BOOL)supportsSampleCount:(unint64_t)a3
{
  return (a3 & (a3 - 1)) == 0 && a3 != 0 && a3 < 5;
}

- (void)deserializeCompileTimeStats:(id)a3 addToDictionary:(id)a4
{
  size_t v12 = 0;
  buffer_ptr = 0;
  dispatch_data_t v5 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &v12);
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = buffer_ptr;
    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:*(void *)buffer_ptr];
    [a4 setObject:v8 forKey:*MEMORY[0x263F12648]];
    uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v7[1]];
    [a4 setObject:v9 forKey:*MEMORY[0x263F12640]];
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v7[2]];
    [a4 setObject:v10 forKey:*MEMORY[0x263F12680]];
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v7[3]];
    [a4 setObject:v11 forKey:*MEMORY[0x263F12630]];
    dispatch_release(v6);
  }
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry, 0x1000000000uLL);
  v5.receiver = self;
  v5.super_class = (Class)AGXG17FamilyDevice;
  return [(_MTLDevice *)&v5 newLibraryWithData:a3 error:a4];
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry, 0x2000000000uLL);
  v5.receiver = self;
  v5.super_class = (Class)AGXG17FamilyDevice;
  [(_MTLDevice *)&v5 newLibraryWithSource:a3 options:a4 completionHandler:a5];
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry, 0x2000000000uLL);
  v6.receiver = self;
  v6.super_class = (Class)AGXG17FamilyDevice;
  return [(_MTLDevice *)&v6 newLibraryWithSource:a3 options:a4 error:a5];
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry, 0x2000000000uLL);
  v5.receiver = self;
  v5.super_class = (Class)AGXG17FamilyDevice;
  return [(_MTLDevice *)&v5 newLibraryWithFile:a3 error:a4];
}

- (id)newDefaultLibrary
{
  atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry, 0x1000000000uLL);
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyDevice;
  return [(_MTLDevice *)&v3 newDefaultLibrary];
}

- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [AGXTextureLayout alloc];

  return [(AGXTextureLayout *)v7 initWithDevice:self descriptor:a3 isHeapOrBufferBacked:v4];
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v7 = [AGXG17FamilyBinaryArchive alloc];

  return [(_MTLBinaryArchive *)v7 initWithDevice:self descriptor:a3 error:a4];
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (![(_MTLDevice *)self validateDynamicLibraryURL:a3 error:a5]) {
    return 0;
  }
  uint64_t v9 = [AGXG17FamilyDynamicLibrary alloc];

  return [(AGXG17FamilyDynamicLibrary *)v9 initWithURL:a3 device:self options:a4 error:a5];
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  if (!-[_MTLDevice validateDynamicLibraryURL:error:](self, "validateDynamicLibraryURL:error:")) {
    return 0;
  }
  uint64_t v7 = [AGXG17FamilyDynamicLibrary alloc];

  return [(AGXG17FamilyDynamicLibrary *)v7 initWithURL:a3 device:self error:a4];
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  if (!-[_MTLDevice validateDynamicLibrary:state:error:](self, "validateDynamicLibrary:state:error:", a3, 0)) {
    return 0;
  }
  uint64_t v9 = (void ***)*((void *)self->_impl + 752);

  return (id)AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createDynamicLibrary(v9, (uint64_t)a3, a4, (uint64_t)self, 0, a5);
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  if (![(_MTLDevice *)self validateDynamicLibrary:a3 state:0 error:a4]) {
    return 0;
  }
  uint64_t v7 = (void ***)*((void *)self->_impl + 752);

  return (id)AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createDynamicLibrary(v7, (uint64_t)a3, 0, (uint64_t)self, 0, a4);
}

- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  if (!-[_MTLDevice validateDynamicLibraryDescriptor:error:](self, "validateDynamicLibraryDescriptor:error:")) {
    return 0;
  }
  if ([a3 library])
  {
    uint64_t v7 = (void ***)*((void *)self->_impl + 752);
    uint64_t v8 = [a3 library];
    int v9 = [a3 options];
    return (id)AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createDynamicLibrary(v7, v8, 0, (uint64_t)self, v9, a4);
  }
  else
  {
    uint64_t v11 = [AGXG17FamilyDynamicLibrary alloc];
    uint64_t v12 = [a3 url];
    uint64_t v13 = [a3 options];
    return [(AGXG17FamilyDynamicLibrary *)v11 initWithURL:v12 device:self options:v13 error:a4];
  }
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 destinationBinaryArchive:(id)a5 error:(id *)a6
{
  if ([a3 functionType] == 6
    && ![(AGXG17FamilyDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v12 = *((void *)self->_impl + 752);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    __int16 v15 = ___ZN3AGX23UserCommonShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE29addIntersectionFnSetToArchiveEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXG17FamilyDeviceP25AGXG17FamilyBinaryArchivePP7NSError_block_invoke;
    uint64_t v16 = &__block_descriptor_48_e9_v16__0_v8l;
    uint64_t v17 = (void *)v12;
    uint64_t v18 = a6;
    AGX::UserShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createBinaryLinkedIntersectionProgramVariants<true>(v12, a4, (uint64_t)a3, (uint64_t)self, (uint64_t)a5, 0, (uint64_t)&v13);
  }
  else
  {
    uint64_t v11 = (id **)*((void *)self->_impl + 752);
    if (a6) {
      *a6 = 0;
    }
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 1;
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    __int16 v15 = ___ZN3AGX23UserCommonShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE27addVisibleFunctionToArchiveEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXG17FamilyDeviceP25AGXG17FamilyBinaryArchivePP7NSError_block_invoke;
    uint64_t v16 = &unk_26516ED88;
    uint64_t v18 = (id *)v11;
    uint64_t v19 = a6;
    uint64_t v17 = v20;
    AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::compileVisibleFunction(v11, (uint64_t)a4, (uint64_t)a3, (uint64_t)self, (uint64_t)a5, 0, (uint64_t)&v13);
    _Block_object_dispose(v20, 8);
  }
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 completionHandler:(id)a5
{
  if ([a3 functionType] == 6
    && ![(AGXG17FamilyDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v10 = *((void *)self->_impl + 752);
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3052000000;
    v11[3] = __Block_byref_object_copy_;
    v11[4] = __Block_byref_object_dispose_;
    v11[5] = 0;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = ___ZN3AGX23UserCommonShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE23createIntersectionFnSetEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXG17FamilyDevicePP7NSErrorU13block_pointerFvSD_E_block_invoke;
    __int16 v15 = &unk_26516EC50;
    uint64_t v17 = (AGXG17FamilyDevice *)v11;
    uint64_t v18 = v10;
    id v16 = a5;
    AGX::UserShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createBinaryLinkedIntersectionProgramVariants<true>(v10, a4, (uint64_t)a3, (uint64_t)self, 0, a5 != 0, (uint64_t)&v12);
    _Block_object_dispose(v11, 8);
  }
  else
  {
    int v9 = (id **)*((void *)self->_impl + 752);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = ___ZN3AGX23UserCommonShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE31createDynamicLibraryForFunctionEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXG17FamilyDevicePP7NSErrorU13block_pointerFvSD_E_block_invoke;
    __int16 v15 = &unk_26516ED18;
    id v16 = a3;
    uint64_t v17 = self;
    uint64_t v18 = (uint64_t)a3;
    id v19 = a5;
    long long v20 = v9;
    uint64_t v21 = 0;
    AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::compileVisibleFunction(v9, (uint64_t)a4, (uint64_t)a3, (uint64_t)self, 0, a5 != 0, (uint64_t)&v12);
  }
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  if ([a3 functionType] == 6
    && ![(AGXG17FamilyDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v10 = *((void *)self->_impl + 752);
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3052000000;
    v24 = __Block_byref_object_copy_;
    __int16 v25 = __Block_byref_object_dispose_;
    uint64_t v26 = 0;
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = ___ZN3AGX23UserCommonShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE23createIntersectionFnSetEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXG17FamilyDevicePP7NSErrorU13block_pointerFvSD_E_block_invoke;
    uint64_t v14 = &unk_26516EC50;
    id v16 = (AGXG17FamilyDevice *)&v21;
    uint64_t v17 = v10;
    id v15 = 0;
    AGX::UserShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createBinaryLinkedIntersectionProgramVariants<true>(v10, a4, (uint64_t)a3, (uint64_t)self, 0, 0, (uint64_t)&v11);
    if (a5) {
      *a5 = (id)v22[5];
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    int v9 = (id **)*((void *)self->_impl + 752);
    if (a5) {
      *a5 = 0;
    }
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = ___ZN3AGX23UserCommonShaderFactoryINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE31createDynamicLibraryForFunctionEP21MTLFunctionDescriptorPU22objcproto11MTLFunction11objc_objectP18AGXG17FamilyDevicePP7NSErrorU13block_pointerFvSD_E_block_invoke;
    uint64_t v14 = &unk_26516ED18;
    id v15 = a3;
    id v16 = self;
    uint64_t v17 = (uint64_t)a3;
    uint64_t v18 = 0;
    id v19 = v9;
    long long v20 = a5;
    AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::compileVisibleFunction(v9, (uint64_t)a4, (uint64_t)a3, (uint64_t)self, 0, 0, (uint64_t)&v11);
  }
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v7 = *((void *)self->_impl + 753);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__AGXG17FamilyDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v8[3] = &unk_26516EA28;
  v8[4] = self;
  v8[5] = a5;
  AGX::UserTileShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createTileRenderPipeline(v7, a3, self, a4, 0, 0, v8);
}

uint64_t __89__AGXG17FamilyDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _storeRenderPipelineState:a2];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id TileRenderPipeline = AGX::UserTileShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createTileRenderPipeline(*((void *)self->_impl + 753), a3, self, a4, (uint64_t)a5, a6, 0);
  [(AGXG17FamilyDevice *)self _storeRenderPipelineState:TileRenderPipeline];
  return TileRenderPipeline;
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = *((void *)self->_impl + 753);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__AGXG17FamilyDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke;
  v7[3] = &unk_26516EA28;
  v7[4] = self;
  v7[5] = a4;
  AGX::UserTileShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createTileRenderPipeline(v6, a3, self, 0, 0, 0, v7);
}

uint64_t __81__AGXG17FamilyDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _storeRenderPipelineState:a2];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  id TileRenderPipeline = AGX::UserTileShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createTileRenderPipeline(*((void *)self->_impl + 753), a3, self, 0, 0, a4, 0);
  [(AGXG17FamilyDevice *)self _storeRenderPipelineState:TileRenderPipeline];
  return TileRenderPipeline;
}

- (void)alertCommandBufferActivityComplete
{
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 2007);
  uint32_t os_unfair_lock_opaque = impl[2006]._os_unfair_lock_opaque;
  impl[2006]._uint32_t os_unfair_lock_opaque = os_unfair_lock_opaque - 1;
  if ((os_unfair_lock_opaque & 0x80000000) != 0) {
    AGX::Compiler::compileProgram<AGX::UserIntersectionProgramKey,AGCReplyArray>(AGX::UserIntersectionProgramKey const&,MTLCompileFunctionRequestData *,void({block_pointer})(AGCReplyArray const&,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,MTLCompilerError,NSString *,unsigned long long))::{lambda(void)#1}::operator()[abi:[AGX] Failed assertion __requestData.frameworkData && _requestData.pipelineOptions_]();
  }
  if (os_unfair_lock_opaque == 1) {
    *(std::chrono::system_clock::time_point *)&impl[1856]._uint32_t os_unfair_lock_opaque = std::chrono::system_clock::now();
  }

  os_unfair_lock_unlock(impl + 2007);
}

- (void)alertCommandBufferActivityStart
{
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 2007);
  uint32_t os_unfair_lock_opaque = impl[2006]._os_unfair_lock_opaque;
  impl[2006]._uint32_t os_unfair_lock_opaque = os_unfair_lock_opaque + 1;
  if (os_unfair_lock_opaque == 0x7FFFFFFF) {
    AGX::Compiler::compileProgram<AGX::UserIntersectionProgramKey,AGCReplyArray>(AGX::UserIntersectionProgramKey const&,MTLCompileFunctionRequestData *,void({block_pointer})(AGCReplyArray const&,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,MTLCompilerError,NSString *,unsigned long long))::{lambda(void)#1}::operator()[abi:[AGX] Failed assertion __requestData.frameworkData && _requestData.pipelineOptions_]();
  }
  LOBYTE(impl[1858]._os_unfair_lock_opaque) = 0;

  os_unfair_lock_unlock(impl + 2007);
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v7 = *((void *)self->_impl + 752);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__AGXG17FamilyDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v8[3] = &unk_26516EA50;
  v8[4] = self;
  v8[5] = a5;
  AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createComputePipeline(v7, a3, self, a4, 0, 0, v8);
}

uint64_t __86__AGXG17FamilyDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _storeComputePipelineState:a2];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id ComputePipeline = AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createComputePipeline(*((void *)self->_impl + 752), a3, self, a4, (uint64_t)a5, a6, 0);
  [(AGXG17FamilyDevice *)self _storeComputePipelineState:ComputePipeline];
  return ComputePipeline;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = *((void *)self->_impl + 752);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__AGXG17FamilyDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v7[3] = &unk_26516EA50;
  v7[4] = self;
  v7[5] = a4;
  AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createComputePipeline(v6, a3, self, 0, 0, 0, v7);
}

uint64_t __78__AGXG17FamilyDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _storeComputePipelineState:a2];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id ComputePipeline = AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createComputePipeline(*((void *)self->_impl + 752), a3, self, 0, 0, a4, 0);
  [(AGXG17FamilyDevice *)self _storeComputePipelineState:ComputePipeline];
  return ComputePipeline;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  if ((unint64_t)[a3 maxVertexAmplificationCount] >= 2) {
    atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 0x400000uLL);
  }
  uint64_t v9 = *((void *)self->_impl + 752);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__AGXG17FamilyDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v10[3] = &unk_26516EA28;
  v10[4] = self;
  v10[5] = a5;
  AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createRenderPipeline<MTLRenderPipelineDescriptor>(v9, a3, (uint64_t)self, a4, 0, 0, (uint64_t)v10);
}

uint64_t __85__AGXG17FamilyDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _storeRenderPipelineState:a2];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  if ((unint64_t)[a3 maxVertexAmplificationCount] >= 2) {
    atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 0x400000uLL);
  }
  Render = (void *)AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createRenderPipeline<MTLRenderPipelineDescriptor>(*((void *)self->_impl + 752), a3, (uint64_t)self, a4, (uint64_t)a5, a6, 0);
  [(AGXG17FamilyDevice *)self _storeRenderPipelineState:Render];
  return Render;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  if ((unint64_t)[a3 maxVertexAmplificationCount] >= 2) {
    atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 0x400000uLL);
  }
  uint64_t v7 = *((void *)self->_impl + 752);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__AGXG17FamilyDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_26516EA28;
  v8[4] = self;
  v8[5] = a4;
  AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createRenderPipeline<MTLRenderPipelineDescriptor>(v7, a3, (uint64_t)self, 0, 0, 0, (uint64_t)v8);
}

uint64_t __77__AGXG17FamilyDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _storeRenderPipelineState:a2];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  if ((unint64_t)[a3 maxVertexAmplificationCount] >= 2) {
    atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 0x400000uLL);
  }
  Render = (void *)AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createRenderPipeline<MTLRenderPipelineDescriptor>(*((void *)self->_impl + 752), a3, (uint64_t)self, 0, 0, a4, 0);
  [(AGXG17FamilyDevice *)self _storeRenderPipelineState:Render];
  return Render;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  if ((unint64_t)[a3 maxVertexAmplificationCount] >= 2) {
    atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 0x400000uLL);
  }
  uint64_t v9 = *((void *)self->_impl + 752);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __89__AGXG17FamilyDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  v10[3] = &unk_26516EA28;
  v10[4] = self;
  v10[5] = a5;
  AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createRenderPipeline<MTLMeshRenderPipelineDescriptor>(v9, a3, (uint64_t)self, a4, 0, 0, (uint64_t)v10);
}

uint64_t __89__AGXG17FamilyDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _storeRenderPipelineState:a2];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  if ((unint64_t)[a3 maxVertexAmplificationCount] >= 2) {
    atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 0x400000uLL);
  }
  uint64_t v7 = *((void *)self->_impl + 752);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__AGXG17FamilyDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_26516EA28;
  v8[4] = self;
  v8[5] = a4;
  AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createRenderPipeline<MTLMeshRenderPipelineDescriptor>(v7, a3, (uint64_t)self, 0, 0, 0, (uint64_t)v8);
}

uint64_t __81__AGXG17FamilyDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _storeRenderPipelineState:a2];
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  if ((unint64_t)[a3 maxVertexAmplificationCount] >= 2) {
    atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 0x400000uLL);
  }
  Render = (void *)AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createRenderPipeline<MTLMeshRenderPipelineDescriptor>(*((void *)self->_impl + 752), a3, (uint64_t)self, a4, (uint64_t)a5, a6, 0);
  [(AGXG17FamilyDevice *)self _storeRenderPipelineState:Render];
  return Render;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  if ((unint64_t)[a3 maxVertexAmplificationCount] >= 2) {
    atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 0x400000uLL);
  }
  Render = (void *)AGX::UserCommonShaderFactory<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createRenderPipeline<MTLMeshRenderPipelineDescriptor>(*((void *)self->_impl + 752), a3, (uint64_t)self, 0, 0, a4, 0);
  [(AGXG17FamilyDevice *)self _storeRenderPipelineState:Render];
  return Render;
}

- (void)_storeComputePipelineState:(id)a3
{
  if (*((unsigned char *)self->_impl + 7761)
    && [a3 label]
    && objc_msgSend((id)objc_msgSend(a3, "label"), "length"))
  {
    os_unfair_lock_lock(&self->_pipelineStatesLock);
    if (([(NSPointerArray *)self->_pipelineStates count] & 0x1FFFFFFFFFFF8000) == 0) {
      [(NSPointerArray *)self->_pipelineStates addPointer:a3];
    }
    os_unfair_lock_unlock(&self->_pipelineStatesLock);
  }
}

- (void)_storeRenderPipelineState:(id)a3
{
  if (*((unsigned char *)self->_impl + 7761)
    && [a3 label]
    && objc_msgSend((id)objc_msgSend(a3, "label"), "length"))
  {
    os_unfair_lock_lock(&self->_pipelineStatesLock);
    if (([(NSPointerArray *)self->_pipelineStates count] & 0x1FFFFFFFFFFF8000) == 0) {
      [(NSPointerArray *)self->_pipelineStates addPointer:a3];
    }
    os_unfair_lock_unlock(&self->_pipelineStatesLock);
  }
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  p_telemetry = &self->_telemetry;
  if (self->_telemetry.isEnabled)
  {
    if ([a3 lodAverage]) {
      uint64_t v6 = 2048;
    }
    else {
      uint64_t v6 = 1;
    }
    [a3 lodMinClamp];
    if (v7 == 0.0)
    {
      [a3 lodMaxClamp];
      char v8 = 12;
      if (v9 == 3.4028e38) {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 12;
    }
    uint64_t v10 = (1 << v8) | v6;
    if ([a3 maxAnisotropy] == 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 256;
    }
    int v12 = [a3 normalizedCoordinates];
    uint64_t v13 = 1024;
    if (v12) {
      uint64_t v13 = 512;
    }
    uint64_t v14 = v10 | v11 | v13;
    unint64_t v15 = [a3 sAddressMode];
    if (v15 > 4) {
      LOBYTE(v16) = 0;
    }
    else {
      uint64_t v16 = qword_242EAA258[v15];
    }
    uint64_t v17 = v14 | (1 << v16);
    unint64_t v18 = [a3 tAddressMode];
    if (v18 > 4) {
      LOBYTE(v19) = 0;
    }
    else {
      uint64_t v19 = qword_242EAA258[v18];
    }
    uint64_t v20 = v17 | (1 << v19);
    unint64_t v21 = [a3 rAddressMode];
    if (v21 > 4) {
      LOBYTE(v22) = 0;
    }
    else {
      uint64_t v22 = qword_242EAA258[v21];
    }
    atomic_fetch_or((atomic_ullong *volatile)p_telemetry, v20 | (1 << v22));
    atomic_fetch_or((atomic_ullong *volatile)&p_telemetry->usage[1], 0);
  }
  impl = self->_impl;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v59 = 0;
  int v24 = 32 * ([a3 mipFilter] != 0);
  int v25 = v24 | (([a3 mipFilter] == 2) << 6);
  int v26 = v25 | (([a3 minFilter] == 1) << 7);
  int v27 = v26 | (([a3 magFilter] == 1) << 8);
  v50[0] = v27;
  unint64_t v28 = [a3 compareFunction];
  __int16 v29 = 0;
  if (v28 <= 7) {
    __int16 v29 = word_242EA8920[v28];
  }
  v50[0] = v27 | v29;
  unsigned int v30 = (float)((float)(unint64_t)[a3 maxAnisotropy] + 0.5) & 0x1F;
  int v31 = v30 & 0xFFFFFF1F | (32 * ([a3 sAddressMode] & 7));
  int v32 = v31 & 0xFFFFF8FF | (([a3 tAddressMode] & 7) << 8);
  unsigned int v33 = v32 & 0xFFFFC7FF | (([a3 rAddressMode] & 7) << 11);
  unsigned int v51 = v33;
  if ([a3 normalizedCoordinates]) {
    int v34 = 0x4000;
  }
  else {
    int v34 = 0;
  }
  int v35 = v33 | v34;
  unsigned int v51 = v35;
  if ([a3 lodAverage]) {
    int v36 = 0x8000;
  }
  else {
    int v36 = 0;
  }
  int v37 = (v35 | v36) & 0xFFFCFFFF | (([a3 minFilter] & 3) << 16);
  unsigned int v38 = v37 & 0xFFF3FFFF | (([a3 magFilter] & 3) << 18);
  unsigned int v51 = v38;
  if ([a3 supportArgumentBuffers]) {
    int v39 = 0x100000;
  }
  else {
    int v39 = 0;
  }
  unsigned int v40 = v38 & 0xFFEFFFFF | v39;
  unsigned int v51 = v40;
  if ([a3 forceSeamsOnCubemapFiltering]) {
    int v41 = 0x1000000;
  }
  else {
    int v41 = 0;
  }
  unsigned int v42 = v40 & 0xFEFFFFFF | v41;
  int v43 = [a3 borderColor];
  unsigned int v51 = v42 & 0xFF9FFFFF | ((v43 & 3) << 21);
  if ((~v43 & 3) != 0)
  {
    uint64_t v57 = 0;
    uint64_t v56 = 0;
    uint64_t v55 = 0;
  }
  else
  {
    LODWORD(v55) = [a3 customBorderColorValue];
    HIDWORD(v55) = [a3 customBorderColorValue];
    LODWORD(v56) = [a3 customBorderColorValue];
    HIDWORD(v56) = [a3 customBorderColorValue];
    uint64_t v57 = [a3 pixelFormat];
  }
  [a3 lodMinClamp];
  int v52 = v44;
  [a3 lodMaxClamp];
  int v53 = v45;
  [a3 lodBias];
  int v54 = v46;
  uint64_t v47 = (void *)[a3 label];
  if (v47) {
    MEMORY[0x24566EB20](__p, [v47 UTF8String]);
  }
  Sampler = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::findOrCreateSampler((uint64_t)impl, (uint64_t)v50, (uint64_t)self, a3);
  if (SHIBYTE(v59) < 0) {
    operator delete(__p[0]);
  }
  return Sampler;
}

- (BOOL)shaderDebugInfoCaching
{
  return *((unsigned char *)self->_impl + 7440);
}

- (void)setShaderDebugInfoCaching:(BOOL)a3
{
  *((unsigned char *)self->_impl + 7440) = a3;
}

- (id)getConsistentPerfStateMappingTable
{
  v8[3] = *MEMORY[0x263EF8340];
  [(IOGPUMetalDevice *)self deviceRef];
  uint64_t inputStruct = 3;
  size_t outputStructCnt = 8;
  mach_port_t Connect = IOGPUDeviceGetConnect();
  if (IOConnectCallStructMethod(Connect, 0x109u, &inputStruct, 8uLL, v4, &outputStructCnt)) {
    return 0;
  }
  v7[0] = @"min_pstate";
  v8[0] = [NSNumber numberWithUnsignedChar:v4[1]];
  v7[1] = @"mid_pstate";
  v8[1] = [NSNumber numberWithUnsignedChar:v4[2]];
  v7[2] = @"max_pstate";
  v8[2] = [NSNumber numberWithUnsignedChar:v4[3]];
  return (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (id)getConsistentPerfStateInfoAndReset:(BOOL)a3
{
  v10[3] = *MEMORY[0x263EF8340];
  [(IOGPUMetalDevice *)self deviceRef];
  uint64_t inputStruct = 2;
  BYTE1(inputStruct) = a3;
  size_t outputStructCnt = 8;
  mach_port_t Connect = IOGPUDeviceGetConnect();
  if (IOConnectCallStructMethod(Connect, 0x109u, &inputStruct, 8uLL, v6, &outputStructCnt)) {
    return 0;
  }
  v9[0] = @"is_enabled";
  v10[0] = [NSNumber numberWithUnsignedChar:v6[2]];
  v9[1] = @"was_consistent";
  v10[1] = [NSNumber numberWithUnsignedChar:v6[3]];
  v9[2] = @"level";
  v10[2] = [NSNumber numberWithUnsignedChar:v6[4]];
  return (id)[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
}

- (BOOL)disableConsistentPerfState
{
  impl = (char *)self->_impl;
  [(IOGPUMetalDevice *)self deviceRef];
  objc_super v3 = impl + 7488;
  BOOL v4 = (os_unfair_lock_s *)(impl + 7492);
  os_unfair_lock_lock(v4);
  if (*v3)
  {
    size_t v7 = 8;
    uint64_t outputStruct = 0;
    mach_port_t Connect = IOGPUDeviceGetConnect();
    IOConnectCallStructMethod(Connect, 0x109u, &outputStruct, 8uLL, &outputStruct, &v7);
    *objc_super v3 = 0;
  }
  os_unfair_lock_unlock(v4);
  return 1;
}

- (BOOL)enableConsistentPerfState:(int)a3
{
  char v3 = a3;
  impl = (char *)self->_impl;
  [(IOGPUMetalDevice *)self deviceRef];
  size_t inputStructCnt = 8;
  mach_port_t Connect = IOGPUDeviceGetConnect();
  uint64_t v6 = impl + 7488;
  size_t v7 = (os_unfair_lock_s *)(impl + 7492);
  os_unfair_lock_lock(v7);
  if (!*v6)
  {
    __int16 outputStruct = 256;
    if (IOConnectCallStructMethod(Connect, 0x109u, &outputStruct, 8uLL, &outputStruct, &inputStructCnt))
    {
LABEL_6:
      os_unfair_lock_unlock(v7);
      return 0;
    }
    *uint64_t v6 = 1;
  }
  os_unfair_lock_unlock(v7);
  BOOL v8 = 1;
  LOBYTE(outputStruct) = 1;
  HIBYTE(outputStruct) = v3;
  if (IOConnectCallStructMethod(Connect, 0x109u, &outputStruct, inputStructCnt, &outputStruct, &inputStructCnt))
  {
    os_unfair_lock_lock(v7);
    if (*v6)
    {
      size_t outputStructCnt = 8;
      uint64_t inputStruct = 0;
      mach_port_t v9 = IOGPUDeviceGetConnect();
      IOConnectCallStructMethod(v9, 0x109u, &inputStruct, 8uLL, &inputStruct, &outputStructCnt);
      *uint64_t v6 = 0;
    }
    goto LABEL_6;
  }
  return v8;
}

- (int64_t)currentPerformanceState
{
  kern_return_t v3;
  int64_t v4;
  unsigned char outputStruct[4];
  unsigned __int8 v7;
  size_t outputStructCnt;
  uint64_t inputStruct;

  [(IOGPUMetalDevice *)self deviceRef];
  uint64_t inputStruct = 2;
  size_t outputStructCnt = 8;
  mach_port_t Connect = IOGPUDeviceGetConnect();
  char v3 = IOConnectCallStructMethod(Connect, 0x109u, &inputStruct, 8uLL, outputStruct, &outputStructCnt);
  if (v7 >= 3u) {
    BOOL v4 = 255;
  }
  else {
    BOOL v4 = v7;
  }
  if (v3) {
    return 0;
  }
  else {
    return v4;
  }
}

- (void)removePerformanceStateAssertion:(id)a3
{
  kern_return_t v6;
  FILE **v7;
  size_t outputStructCnt;
  int outputStruct;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  unint64_t v15 = *MEMORY[0x263EF8340];
  p_performance_state_assertion = &self->performance_state_assertion;
  p_lock = &self->performance_state_assertion.lock;
  os_unfair_lock_lock(&self->performance_state_assertion.lock.lock);
  size_t outputStructCnt = 8;
  mach_port_t Connect = IOGPUDeviceGetConnect();
  LOWORD(outputStruct) = 1025;
  uint64_t v6 = IOConnectCallStructMethod(Connect, 0x10Du, &outputStruct, 8uLL, &outputStruct, &outputStructCnt);
  if (v6)
  {
    size_t v7 = (FILE **)MEMORY[0x263EF8348];
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: Could not release perf state in kernel. Error: 0x%x\n\n", v6);
    fprintf(*v7, "AGX: %s:%d:%s: *** Error releasing performance state assertion!\n\n", "agxa_device_objc.mm", 1700, "-[AGXG17FamilyDevice removePerformanceStateAssertion:]");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __int16 outputStruct = 136315650;
      uint64_t v10 = "agxa_device_objc.mm";
      uint64_t v11 = 1024;
      int v12 = 1700;
      uint64_t v13 = 2080;
      uint64_t v14 = "-[AGXG17FamilyDevice removePerformanceStateAssertion:]";
      _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Error releasing performance state assertion!\n\n", (uint8_t *)&outputStruct, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      __int16 outputStruct = 136315650;
      uint64_t v10 = "agxa_device_objc.mm";
      uint64_t v11 = 1024;
      int v12 = 1700;
      uint64_t v13 = 2080;
      uint64_t v14 = "-[AGXG17FamilyDevice removePerformanceStateAssertion:]";
      _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Error releasing performance state assertion!\n\n", (uint8_t *)&outputStruct, 0x1Cu);
    }
  }
  else
  {
    p_performance_state_assertion->existingAssertion = 0;
  }
  os_unfair_lock_unlock(&p_lock->lock);
}

- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4
{
  kern_return_t v13;
  FILE **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  size_t outputStructCnt;
  unsigned char outputStruct[8];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  __CFString *v29;
  uint64_t v30;
  void v31[2];

  v31[1] = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 < 3)
  {
    p_performance_state_assertion = &self->performance_state_assertion;
    p_lock = &self->performance_state_assertion.lock;
    os_unfair_lock_lock(&self->performance_state_assertion.lock.lock);
    existingAssertion = p_performance_state_assertion->existingAssertion;
    if (p_performance_state_assertion->existingAssertion)
    {
      if (existingAssertion->_requestedLevel == a3)
      {
        uint64_t v10 = existingAssertion;
      }
      else
      {
        uint64_t v22 = *MEMORY[0x263F08320];
        uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Requested MTLDevicePerformanceState (%ld) is incompatible with the performance state currently set on the system.", a3);
        uint64_t v17 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"MTLPerformanceStateAssertionDomain" code:2 userInfo:v17];
        fwrite("AGX: PerformanceState: Incompatible PerformanceStateAssertion already exists\n\n", 0x4EuLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
        uint64_t v10 = 0;
      }
      goto LABEL_16;
    }
    size_t outputStructCnt = 8;
    mach_port_t Connect = IOGPUDeviceGetConnect();
    outputStruct[0] = 1;
    outputStruct[1] = a3;
    uint64_t v13 = IOConnectCallStructMethod(Connect, 0x10Du, outputStruct, 8uLL, outputStruct, &outputStructCnt);
    if (!v13)
    {
      uint64_t v10 = [[AGXG17FamilyPerformanceStateAssertion alloc] initWithDevice:self level:a3];
      p_performance_state_assertion->existingAssertion = v10;
LABEL_16:
      os_unfair_lock_unlock(&p_lock->lock);
      return v10;
    }
    uint64_t v14 = (FILE **)MEMORY[0x263EF8348];
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: PerformanceState: Could not acquire perf state from kernel. Error: 0x%x\n", v13);
    if (v13 == -536870207)
    {
      unint64_t v28 = *MEMORY[0x263F08320];
      __int16 v29 = @"This process does not have permission to request performance state changes";
      unint64_t v15 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      fwrite("AGX: PerformanceState: No entitlement to acquire performance states\n\n", 0x45uLL, 1uLL, *v14);
    }
    else
    {
      if (v13 == -536870203)
      {
        int v26 = *MEMORY[0x263F08320];
        int v27 = @"This process is attempting to acquire a Performance State Assertion in an incompatible state.";
        unint64_t v15 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        fwrite("AGX: PerformanceState: Incompatible performance state requested\n\n", 0x41uLL, 1uLL, *v14);
        uint64_t v16 = 2;
LABEL_15:
        unint64_t v18 = (void *)[MEMORY[0x263F087E8] errorWithDomain:@"MTLPerformanceStateAssertionDomain" code:v16 userInfo:v15];
        uint64_t v10 = 0;
        *a4 = v18;
        goto LABEL_16;
      }
      int v24 = *MEMORY[0x263F08320];
      int v25 = @"Failed to acquire performance state.";
      unint64_t v15 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      fprintf(*v14, "AGX: PerformanceState: Failed to acquire performance state with code 0x%x\n\n", v13);
    }
    uint64_t v16 = 3;
    goto LABEL_15;
  }
  unsigned int v30 = *MEMORY[0x263F08320];
  v31[0] = @"The provided performanceState is invalid";
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:@"MTLPerformanceStateAssertionDomain" code:2 userInfo:v11];
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: PerformanceState: Provided performance state %d is unknown or invalid\n\n", 4);
  return 0;
}

- (BOOL)isShaderSampleBufferMapped
{
  return *((void *)self->_impl + 931) != 0;
}

- (void)unmapShaderSampleBuffer
{
  id v2 = (void *)MEMORY[0x270FA5388](self);
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v3 = v2[101];
  [v2 deviceRef];
  if (*(unsigned char *)(v3 + 7456))
  {
    *(unsigned char *)(v3 + 7456) = 0;
  }
  else
  {
    BOOL v4 = *(void **)(v3 + 7464);
    if (v4)
    {
      objc_super v5 = (void *)[v4 objectAtIndexedSubscript:0];
      uint64_t v6 = *(void **)(v3 + 7472);
      uint64_t v7 = [v5 sampleMarker];
      [v5 stopSampling];
      if ([v6 ringBufferNum] == 1)
      {
        uint64_t v54 = 0;
        uint64_t v55 = 0;
        unsigned int v53 = 0;
        if ([v6 ringBufferInfoAtIndex:0 base:&v55 size:(char *)&v54 + 4 dataOffset:&v54 dataSize:&v53])
        {
          LODWORD(v54) = ((unint64_t)v53 + 8) % HIDWORD(v54);
          [v6 resetRawDataPostProcessor];
          BOOL v8 = (char *)operator new(0x40000uLL);
          bzero(v8, 0x40000uLL);
          int v45 = *(char **)(v3 + 7448);
          unsigned int v44 = *(_DWORD *)(v3 + 7480);
          do
          {
            unsigned int v9 = *(_DWORD *)(v3 + 7460);
            if (v9 == -2) {
              unsigned int v10 = 0;
            }
            else {
              unsigned int v10 = v9 + 1;
            }
            int v11 = *(_DWORD *)(v3 + 7460);
            atomic_compare_exchange_strong((atomic_uint *volatile)(v3 + 7460), (unsigned int *)&v11, v10);
          }
          while (v11 != v9);
          size_t v46 = 0;
          int v48 = -1;
          unint64_t v49 = -1;
          int v12 = &_os_log_internal;
          int v50 = -1;
          do
          {
            uint64_t v13 = v12;
            unint64_t v51 = 0;
            uint64_t v52 = v54;
            LOBYTE(v41) = 1;
            char v14 = [v6 postProcessRawDataWithRingBufferIndex:0 source:v55 sourceSize:HIDWORD(v54) sourceRead:&v52 sourceWrite:v53 output:v8 outputSize:0x40000 outputRead:0 outputWrite:&v51 isLast:v41];
            LODWORD(v54) = v52;
            if (!v51) {
              break;
            }
            char v15 = v14;
            LODWORD(v16) = 0;
            unint64_t v17 = (v51 + 7) & 0xFFFFFFFFFFFFFFF8;
            unint64_t v51 = v17;
            int v12 = v13;
            while (1)
            {
              unint64_t v18 = v16;
              if (v17 <= v16) {
                break;
              }
              unsigned int v19 = v16 + 8;
              while (1)
              {
                uint64_t v20 = *(void *)&v8[v18];
                unint64_t v18 = v19;
                if (v20 == v7) {
                  break;
                }
                v19 += 8;
                if (v17 <= v18) {
                  goto LABEL_12;
                }
              }
              LODWORD(v16) = v19;
              if (v17 > v19)
              {
                uint64_t v16 = v19;
                unsigned int v21 = v19;
                while (*(void *)&v8[v16] != v7)
                {
                  v21 += 8;
                  uint64_t v16 = v21;
                  if (v17 <= v21) {
                    goto LABEL_26;
                  }
                }
                LODWORD(v16) = v21;
              }
LABEL_26:
              uint64_t v22 = v16 - v19;
              if (v22 >= 0x20)
              {
                uint64_t v23 = &v8[v19];
                unint64_t v24 = *((void *)v23 + 2);
                if (v24 > 5)
                {
                  BOOL v25 = 0;
                }
                else if (((1 << v24) & 0x15) != 0)
                {
                  BOOL v25 = 0;
                  int v26 = v50;
                  if (v9 > *((_DWORD *)v23 + 6)) {
                    int v26 = *((_DWORD *)v23 + 6);
                  }
                  int v50 = v26;
                }
                else
                {
                  unsigned int v27 = *((_DWORD *)v23 + 6);
                  BOOL v25 = v9 > v27;
                  int v28 = v48;
                  if (v9 > v27) {
                    int v28 = *((_DWORD *)v23 + 6);
                  }
                  int v48 = v28;
                }
                if (v22 < 0x21)
                {
                  size_t v30 = v46;
                }
                else
                {
                  unsigned int v42 = v23;
                  BOOL v43 = v25;
                  bzero((char *)&v57 + 4, 0x11E8uLL);
                  size_t v29 = v22 - 32;
                  if ((unint64_t)(v22 - 32) < 0x11E1)
                  {
                    unsigned int v31 = 8 * v22 + 16128;
                    uint64_t v32 = *(void *)v42;
                    uint64_t v33 = *((void *)v42 + 1);
                    *(void *)__src = v31 & 0x3FC0 | 0xFEEDFFFFFFFFC003;
                    *(void *)&__src[8] = v32;
                    *(_DWORD *)&__src[16] = v33;
                    LODWORD(v57) = v50;
                    memcpy(&v58, v42 + 32, v29);
                    size_t v34 = ((v31 >> 3) & 0x7F8) + 32;
                    size_t v30 = (v34 + v46);
                    if (v30 <= v44)
                    {
                      memcpy(&v45[v46], __src, v34);
                    }
                    else
                    {
                      size_t v35 = (v44 - v46) & 0xFFFFFFF8;
                      int v36 = &v45[v46];
                      int v47 = v34;
                      memcpy(v36, __src, v35);
                      int v37 = &__src[v35];
                      size_t v30 = (v47 - v35);
                      memcpy(v45, v37, v30);
                    }
                    int v12 = v13;
                  }
                  else
                  {
                    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Error, insufficient sample buffer space!\n", "agxa_device_template.hpp", 2587, "generateLegacyFormatSample");
                    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315650;
                      uint64_t v60 = "agxa_device_template.hpp";
                      __int16 v61 = 1024;
                      int v62 = 2587;
                      __int16 v63 = 2080;
                      unsigned int v64 = "generateLegacyFormatSample";
                      _os_log_error_impl(&dword_2427AD000, v13, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Error, insufficient sample buffer space!\n", buf, 0x1Cu);
                    }
                    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315650;
                      uint64_t v60 = "agxa_device_template.hpp";
                      __int16 v61 = 1024;
                      int v62 = 2587;
                      __int16 v63 = 2080;
                      unsigned int v64 = "generateLegacyFormatSample";
                      _os_log_impl(&dword_2427AD000, v13, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Error, insufficient sample buffer space!\n", buf, 0x1Cu);
                    }
                    int v12 = v13;
                    size_t v30 = v46;
                  }
                  BOOL v25 = v43;
                }
                size_t v46 = v30;
                unint64_t v38 = v49;
                if (v25) {
                  unint64_t v38 = v30;
                }
                unint64_t v49 = v38;
                unint64_t v17 = v51;
              }
            }
LABEL_12:
            ;
          }
          while ((v15 & 1) != 0);
          if (v50 == -1 && v48 != -1)
          {
            uint64_t v39 = (v49 >> 3) + 1;
            unsigned int v40 = (int *)&v45[8 * (v49 >> 3) + 20];
            do
            {
              if (*((__int16 *)v40 - 7) == -275)
              {
                if (*v40 != -1) {
                  break;
                }
                *unsigned int v40 = v48;
              }
              v40 -= 2;
              --v39;
            }
            while (v39);
          }
          operator delete(v8);
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Should not be here as SPI is not supported in current chip!\n", "agxa_device_template.hpp", 2861, "unmapShaderSampleBuffer");
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__src = 136315650;
          *(void *)&__src[4] = "agxa_device_template.hpp";
          *(_WORD *)&__src[12] = 1024;
          *(_DWORD *)&__src[14] = 2861;
          *(_WORD *)&__src[18] = 2080;
          uint64_t v57 = "unmapShaderSampleBuffer";
          _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Should not be here as SPI is not supported in current chip!\n", __src, 0x1Cu);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__src = 136315650;
          *(void *)&__src[4] = "agxa_device_template.hpp";
          *(_WORD *)&__src[12] = 1024;
          *(_DWORD *)&__src[14] = 2861;
          *(_WORD *)&__src[18] = 2080;
          uint64_t v57 = "unmapShaderSampleBuffer";
          _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Should not be here as SPI is not supported in current chip!\n", __src, 0x1Cu);
        }
      }
      *(void *)(v3 + 7448) = 0;

      *(void *)(v3 + 7464) = 0;
      *(void *)(v3 + 7472) = 0;
      GRCReleaseAllCounterSourceGroup();
    }
  }
}

- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5
{
  int v5 = a5;
  v24[2] = *MEMORY[0x263EF8340];
  impl = (char *)self->_impl;
  [(IOGPUMetalDevice *)self deviceRef];
  BOOL v8 = impl + 7456;
  if (a3 || v5)
  {
    *BOOL v8 = 0;
    unsigned int v10 = (void *)GRCCopyAllCounterSourceGroup();
    if (![v10 count]) {
      goto LABEL_22;
    }
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count")) {
      goto LABEL_22;
    }
    int v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "objectAtIndexedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count") != 1);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count") == 1
      && !objc_msgSend((id)objc_msgSend(v11, "name"), "hasPrefix:", @"Firmware"))
    {
      goto LABEL_22;
    }
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count") != 1
      && (objc_msgSend((id)objc_msgSend(v11, "name"), "hasPrefix:", @"RDE") & 1) == 0
      || !v11
      || [v11 ringBufferNum] != 1)
    {
      goto LABEL_22;
    }
    uint64_t v12 = MEMORY[0x263EFFA88];
    v23[0] = @"DisableOverlap";
    v23[1] = @"DisableMCH";
    v24[0] = MEMORY[0x263EFFA88];
    int v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "features"), "objectForKeyedSubscript:", @"SupportOption_DisableMCH"), "BOOLValue");
    uint64_t v14 = MEMORY[0x263EFFA80];
    if (v13) {
      uint64_t v14 = v12;
    }
    v24[1] = v14;
    objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "setOptions:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
    char v15 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:4];
    v22[0] = [MEMORY[0x263F3F8F0] selectWithName:@"KickBoundary" options:0];
    v22[1] = [MEMORY[0x263F3F8F0] selectWithName:@"TimerFixed" options:&unk_26F86C780];
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x263F3F8E8], "selectWithName:options:", objc_msgSend(NSString, "stringWithUTF8String:", "GRC_TIMESTAMP"), 0));
    objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x263F3F8E8], "selectWithName:options:", objc_msgSend(NSString, "stringWithUTF8String:", "GRC_GPU_CYCLES"), 0));
    objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x263F3F8E8], "selectWithName:options:", objc_msgSend(NSString, "stringWithUTF8String:", "GRC_SAMPLE_TYPE"), 0));
    objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x263F3F8E8], "selectWithName:options:", objc_msgSend(NSString, "stringWithUTF8String:", "GRC_ENCODER_ID"), 0));
    uint64_t v19 = 0;
    if (([v11 requestTriggers:v16 firstErrorIndex:&v19] & 1) == 0
      || ([v11 requestCounters:v15 firstErrorIndex:&v19] & 1) == 0)
    {
      goto LABEL_22;
    }
    uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "sourceList"), "count");
    v20[0] = @"ShaderProfiler";
    v20[1] = @"BufferSizeInKB";
    v21[0] = MEMORY[0x263EFFA88];
    int v18 = v17 == 1 ? 4 : 6;
    v21[1] = [NSNumber numberWithUnsignedLongLong:(((unint64_t)((v18 * v5) >> 2) + 2 * *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8]) >> 10];
    objc_msgSend(v11, "setOptions:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    if (([v11 setEnabled:1] & 1) != 0
      && (objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 0), "startSampling") & 1) != 0)
    {
      *((void *)impl + 931) = a3;
      *((_DWORD *)impl + 1870) = v5;
      *((_DWORD *)impl + 1865) = 0;
      *((void *)impl + 933) = v10;
      BOOL result = 1;
      *((void *)impl + 934) = v11;
    }
    else
    {
LABEL_22:

      GRCReleaseAllCounterSourceGroup();
      return 0;
    }
  }
  else
  {
    BOOL result = 1;
    *BOOL v8 = 1;
  }
  return result;
}

- (id)newHeapWithDescriptor:(id)a3
{
  p_telemetry = &self->_telemetry;
  uint64_t v6 = &self->_telemetry.usage[1];
  atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 8uLL);
  if ([a3 hazardTrackingMode] == 2) {
    atomic_fetch_or((atomic_ullong *volatile)v6, 0x10uLL);
  }
  if ([a3 type] == 1) {
    atomic_fetch_or((atomic_ullong *volatile)&p_telemetry->usage[1], 0x20uLL);
  }
  uint64_t v7 = [a3 type];
  BOOL v8 = &off_26516E3B8;
  if (v7 != 2) {
    BOOL v8 = off_26516E3A0;
  }
  id v9 = objc_alloc(*v8);

  return (id)[v9 initWithDevice:self descriptor:a3];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  unint64_t v5 = 256;
  result.var1 = v5;
  result.var0 = a3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3
{
  if (![a3 validateWithDevice:self])
  {
    unint64_t v36 = 0;
    uint64_t v27 = 0;
    goto LABEL_61;
  }
  uint64_t v5 = [a3 descriptorPrivate];
  uint64_t v6 = *(void *)(v5 + 96);
  if (v6 == 2)
  {
    unint64_t v8 = 0;
    char v7 = 2;
  }
  else
  {
    if (v6 == 1) {
      char v7 = 9;
    }
    else {
      char v7 = 0;
    }
    if (*(void *)(v5 + 152) > 3uLL) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = (unint64_t)*(void *)(v5 + 152) << 8;
    }
  }
  char v9 = v7 & 0xFB;
  if (*(unsigned char *)(v5 + 128)) {
    char v10 = v9;
  }
  else {
    char v10 = 2;
  }
  uint64_t v57 = *(void *)(v5 + 8);
  unsigned int v11 = v57 - 1;
  if ((v57 - 1) > 0x284) {
    uint64_t v12 = &texFormatUnsupported;
  }
  else {
    uint64_t v12 = (uint64_t *)*(&off_26516F8A0 + v11);
  }
  uint64_t v13 = (v10 | ((*((_DWORD *)v12 + 15) & 0xC) != 0));
  impl = (os_unfair_lock_s *)self->_impl;
  uint64_t v55 = *(void *)v5;
  uint64_t v56 = *(void *)(v5 + 104);
  unint64_t v14 = *(void *)(v5 + 168) - 1;
  if (v14 > 9) {
    int v53 = 0;
  }
  else {
    int v53 = dword_242EAC4F0[v14];
  }
  uint64_t v52 = v8 | v13;
  uint64_t v51 = *(void *)(v5 + 192);
  if ((unint64_t)(*(void *)(v5 + 72) - 1) < 4) {
    int v15 = *(_DWORD *)(v5 + 72);
  }
  else {
    int v15 = 0;
  }
  int v50 = v15;
  int v16 = *(_DWORD *)(v5 + 84);
  unsigned int v17 = *(_DWORD *)(v5 + 16);
  unsigned int v18 = *(_DWORD *)(v5 + 24);
  unsigned int v19 = *(_DWORD *)(v5 + 32);
  unsigned int v20 = *(_DWORD *)(v5 + 40);
  int v21 = *(_DWORD *)(v5 + 48);
  int v22 = *(_DWORD *)(v5 + 56);
  uint64_t v23 = *(void *)(v5 + 112) & 0xFLL;
  unsigned int v24 = [a3 resourceIndex];
  if (v11 > 0x284) {
    int v26 = &texFormatUnsupported;
  }
  else {
    int v26 = (uint64_t *)*(&off_26516F8A0 + v11);
  }
  AGX::TextureGen4<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::TextureGen4((uint64_t)v58, impl, 0, 2, v55, (uint64_t)v26, v57, v56, v25, v51, v52, v53, v50, v16, v17, v18, v19, v20, v21,
    v22,
    0,
    0,
    v23,
    0,
    0,
    0,
    0,
    0,
    v20,
    0,
    0,
    1,
    v49,
    v24);
  v58[0] = off_26F853CD8;
  if (!v59)
  {
    if (v60)
    {
      uint64_t v27 = v62;
      goto LABEL_52;
    }
    uint64_t v27 = v61;
    if (v61) {
      goto LABEL_52;
    }
    int v28 = v64;
    int v29 = BYTE1(v64);
    unint64_t v30 = AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)3,AGX::HAL200::Encoders,AGX::HAL200::Classes>::View)0>((uint64_t)v58, 0);
    if (v29 == 1) {
      char v31 = BYTE2(v64) & 1;
    }
    else {
      char v31 = 0;
    }
    char v32 = 1;
    if ((v29 - 3) >= 2 && (v31 & 1) == 0)
    {
      if (v29 == 2) {
        char v32 = BYTE2(v64) & 1;
      }
      else {
        char v32 = 0;
      }
    }
    unsigned int v33 = (v28 - 1);
    if (v33 <= 1 && v30 >= 0x4000 && (v32 & 1) != 0)
    {
      uint64_t v27 = 0x4000;
      goto LABEL_52;
    }
    if (v33 >= 3)
    {
      BOOL v34 = (v64 & 0x10000) != 0 && v29 == 2;
      if (v34 && v28 == 0) {
        uint64_t v27 = 128;
      }
      else {
        uint64_t v27 = 16;
      }
      goto LABEL_52;
    }
  }
  uint64_t v27 = 128;
LABEL_52:
  unint64_t v36 = v63;
  uint64_t v37 = v68;
  v58[0] = &unk_26F853CB0;
  uint64_t v68 = 0;
  if (v37) {
    std::default_delete<AGX::HAL200::CompressionMetadata>::operator()[abi:nn180100](v37);
  }
  if (v65 && !v67)
  {
    unint64_t v38 = (os_unfair_lock_s *)(v66 + 56);
    os_unfair_lock_lock((os_unfair_lock_t)(v66 + 56));
    uint64_t v39 = v66;
    uint64_t v40 = v65;
    uint64_t v41 = (atomic_ullong *)(v66 + 48);
    uint64_t v42 = *(void *)(v66 + 48);
    BOOL v43 = (int *)MEMORY[0x263F4B188];
    uint64_t v44 = 32 * v65;
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(v66 + 40) + 8) + (int)*MEMORY[0x263F4B188] + 24) + v44) = v42;
    uint64_t v45 = v42;
    atomic_compare_exchange_strong(v41, (unint64_t *)&v45, (v42 & 0xFFFFFFFF00000000 | v40) + 0x100000000);
    if (v45 != v42)
    {
      uint64_t v46 = v45;
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(*(void *)(v39 + 40) + 8) + *v43 + 24) + v44) = v45;
        atomic_compare_exchange_strong((atomic_ullong *volatile)(v39 + 48), (unint64_t *)&v46, (v45 & 0xFFFFFFFF00000000 | v40) + 0x100000000);
        BOOL v34 = v46 == v45;
        uint64_t v45 = v46;
      }
      while (!v34);
    }
    os_unfair_lock_unlock(v38);
  }
LABEL_61:
  unint64_t v47 = v36;
  unint64_t v48 = v27;
  result.var1 = v48;
  result.var0 = v47;
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  unsigned int v11 = (void *)IOSurfaceCopyValue(a4, (CFStringRef)*MEMORY[0x263F0EDA8]);
  if (v11)
  {
    uint64_t v12 = v11;
    if ([v11 objectForKeyedSubscript:@"kAGXCompressionMode"])
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "objectForKeyedSubscript:", @"kAGXCompressionMode"), "unsignedIntegerValue");

      unint64_t v14 = [AGXG17FamilyTexture alloc];
      return [(AGXTexture *)v14 initWithSharedTextureHandle:a4 device:self desc:a3 compressionMode:v13];
    }
  }
  int v16 = [AGXG17FamilyTexture alloc];

  return [(AGXTexture *)v16 initWithDevice:self desc:a3 iosurface:a4 plane:a5 slice:a6];
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  char v9 = (void *)IOSurfaceCopyValue(a4, (CFStringRef)*MEMORY[0x263F0EDA8]);
  if (v9)
  {
    char v10 = v9;
    if ([v9 objectForKeyedSubscript:@"kAGXCompressionMode"])
    {
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"kAGXCompressionMode"), "unsignedIntegerValue");

      uint64_t v12 = [AGXG17FamilyTexture alloc];
      return [(AGXTexture *)v12 initWithSharedTextureHandle:a4 device:self desc:a3 compressionMode:v11];
    }
  }
  unint64_t v14 = [AGXG17FamilyTexture alloc];

  return [(AGXTexture *)v14 initWithDevice:self desc:a3 iosurface:a4 plane:a5 slice:0];
}

- (id)newTextureWithDescriptor:(id)a3
{
  uint64_t v5 = [AGXG17FamilyTexture alloc];
  uint64_t v6 = *((unsigned __int8 *)self->_impl + 7805);

  return [(AGXTexture *)v5 initWithDevice:self desc:a3 isSuballocDisabled:v6];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6
{
  if ((a6 - 1) > 0x284) {
    char v7 = &texFormatUnsupported;
  }
  else {
    char v7 = (uint64_t *)*(&off_26516F8A0 + (a6 - 1));
  }
  unint64_t v8 = 0x4000;
  if (a4 == 102) {
    unint64_t v8 = 0x10000;
  }
  uint64_t v9 = *((unsigned int *)v7 + 14);
  unint64_t v10 = a7 * (unint64_t)*((unsigned __int8 *)v7 + 88);
  if (a4 == 103) {
    unint64_t v8 = 0x40000;
  }
  unint64_t v11 = v8 / v10;
  unsigned int v12 = 32 - __clz(v11 - 1);
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  v14.i32[0] = (v13 + 1) >> 1;
  v14.i32[1] = v13 - v14.i32[0];
  uint32x2_t v15 = vshl_u32(qword_242EB3598[v9], v14);
  *(void *)&long long v16 = v15.u32[0];
  *((void *)&v16 + 1) = v15.u32[1];
  *(_OWORD *)&retstr->var0 = v16;
  retstr->var2 = 1;
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6
{
  if (self) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self tileSizeWithSparsePageSize:a7 textureType:a4 pixelFormat:a5 sampleCount:a6];
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5
{
  if (self) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self tileSizeWithSparsePageSize:101 textureType:a4 pixelFormat:a5 sampleCount:a6];
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return self;
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry.usage[1], 0x1000uLL);
  v5.receiver = self;
  v5.super_class = (Class)AGXG17FamilyDevice;
  return [(IOGPUMetalDevice *)&v5 newIOCommandQueueWithDescriptor:a3 error:a4];
}

- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3
{
  return 0;
}

- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3
{
  [(AGXG17FamilyDevice *)self setupDeferred];
  BOOL v4 = [AGXG17FamilyIndirectRenderCommandEncoder alloc];

  return [(AGXG17FamilyIndirectRenderCommandEncoder *)v4 initWithBuffer:a3];
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5
{
  return 0;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  [(AGXG17FamilyDevice *)self setupDeferred];
  uint64_t v9 = [AGXG17FamilyIndirectCommandBuffer alloc];
  uint64_t v10 = *((unsigned __int8 *)self->_impl + 7805);

  return [(AGXG17FamilyIndirectCommandBuffer *)v9 initWithDevice:self descriptor:a3 count:a4 options:a5 isSuballocDisabled:v10];
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  objc_super v5 = [AGXG17FamilyBuffer alloc];

  return [(AGXBuffer *)v5 initWithDevice:self iosurface:a3 pinnedGPUAddress:0];
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  unint64_t v11 = [AGXG17FamilyTexture alloc];

  return [(AGXTexture *)v11 initWithDevice:self bytes:a3 length:a4 desc:a5 deallocator:a6];
}

- (id)newBufferWithDescriptor:(id)a3
{
  size_t v5 = [a3 length];
  uint64_t v6 = [a3 resourceOptions];
  uint64_t v7 = (16 * ([a3 storageMode] & 0xF)) | v6;
  uint64_t v8 = [a3 alignment];
  uint64_t v9 = [a3 pointerTag];
  if ([a3 addressRanges])
  {
    uint64_t v10 = (void *)[a3 addressRanges];
    unint64_t v11 = -[AGXBuffer initWithDevice:addressRanges:addressRangeCount:length:alignment:options:pinnedGPUAddress:]([AGXG17FamilyBuffer alloc], "initWithDevice:addressRanges:addressRangeCount:length:alignment:options:pinnedGPUAddress:", self, [v10 ranges], objc_msgSend(v10, "count"), v5, v8, v7, objc_msgSend(a3, "pinnedGPUAddress"));
    goto LABEL_3;
  }
  if (![a3 iosurface])
  {
    if (([a3 noCopy] & 1) == 0)
    {
      v23[0] = [a3 pinnedGPUAddress];
      v23[1] = [a3 parentGPUAddress];
      void v23[2] = [a3 parentGPUSize];
      unsigned int v19 = [AGXG17FamilyBuffer alloc];
      uint64_t v20 = *((unsigned __int8 *)self->_impl + 7805);
      uint64_t v21 = [a3 pinnedGPUAddress];
      int v22 = v23;
      if (!v21) {
        int v22 = 0;
      }
      unsigned int v12 = [(AGXBuffer *)v19 initWithDevice:self length:v5 alignment:v8 pointerTag:v9 options:v7 isSuballocDisabled:v20 pinnedGPULocation:v22];
      if (v12 && [a3 contents]) {
        memcpy(-[IOGPUMetalBuffer contents](v12, "contents"), (const void *)[a3 contents], v5);
      }
LABEL_4:
      if (!v12) {
        return v12;
      }
      unint64_t v13 = 0x100000000000000;
      if ((v6 & 0x100) == 0) {
        unint64_t v13 = 1;
      }
      atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry, v13);
      if (v7 >> 4 == 2)
      {
        uint32x2_t v14 = &self->_telemetry.genericCounts.count[8];
      }
      else
      {
        if (v7 >> 4)
        {
LABEL_16:
          atomic_fetch_add((atomic_ullong *volatile)&self->_telemetry.genericCounts.count[6], 1uLL);
          return v12;
        }
        uint32x2_t v14 = &self->_telemetry.genericCounts.count[7];
      }
      atomic_fetch_add((atomic_ullong *volatile)v14, 1uLL);
      goto LABEL_16;
    }
    unint64_t v11 = -[AGXBuffer initWithDevice:bytes:length:alignment:pointerTag:options:deallocator:pinnedGPUAddress:]([AGXG17FamilyBuffer alloc], "initWithDevice:bytes:length:alignment:pointerTag:options:deallocator:pinnedGPUAddress:", self, [a3 contents], v5, v8, v9, v7, objc_msgSend(a3, "deallocator"), objc_msgSend(a3, "pinnedGPUAddress"));
LABEL_3:
    unsigned int v12 = v11;
    goto LABEL_4;
  }
  uint32x2_t v15 = [AGXG17FamilyBuffer alloc];
  uint64_t v16 = [a3 iosurface];
  uint64_t v17 = [a3 pinnedGPUAddress];

  return [(AGXBuffer *)v15 initWithDevice:self iosurface:v16 pinnedGPUAddress:v17];
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  unint64_t v11 = 0x100000000000000;
  if ((a5 & 0x100) == 0) {
    unint64_t v11 = 1;
  }
  atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry, v11);
  if (a5 >> 4 == 2)
  {
    unsigned int v12 = &self->_telemetry.genericCounts.count[8];
  }
  else
  {
    if (a5 >> 4) {
      goto LABEL_8;
    }
    unsigned int v12 = &self->_telemetry.genericCounts.count[7];
  }
  atomic_fetch_add((atomic_ullong *volatile)v12, 1uLL);
LABEL_8:
  atomic_fetch_add((atomic_ullong *volatile)&self->_telemetry.genericCounts.count[5], 1uLL);
  unint64_t v13 = [AGXG17FamilyBuffer alloc];

  return [(AGXBuffer *)v13 initWithDevice:self bytes:a3 length:a4 options:a5 deallocator:a6 pinnedGPUAddress:0];
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  __int16 v5 = a5;
  uint64_t v9 = [(AGXBuffer *)[AGXG17FamilyBuffer alloc] initWithDevice:self length:a4 options:a5 isSuballocDisabled:*((unsigned __int8 *)self->_impl + 7805) pinnedGPULocation:0];
  uint64_t v10 = v9;
  if (v9)
  {
    memcpy([(IOGPUMetalBuffer *)v9 contents], a3, a4);
    unint64_t v11 = 0x100000000000000;
    if ((v5 & 0x100) == 0) {
      unint64_t v11 = 1;
    }
    atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry, v11);
    if (v5 >> 4 == 2)
    {
      unsigned int v12 = &self->_telemetry.genericCounts.count[8];
    }
    else
    {
      if (v5 >> 4)
      {
LABEL_9:
        atomic_fetch_add((atomic_ullong *volatile)&self->_telemetry.genericCounts.count[6], 1uLL);
        return v10;
      }
      unsigned int v12 = &self->_telemetry.genericCounts.count[7];
    }
    atomic_fetch_add((atomic_ullong *volatile)v12, 1uLL);
    goto LABEL_9;
  }
  return v10;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  unint64_t v7 = 0x100000000000000;
  if ((a4 & 0x100) == 0) {
    unint64_t v7 = 1;
  }
  atomic_fetch_or((atomic_ullong *volatile)&self->_telemetry, v7);
  if (a4 >> 4 == 2)
  {
    uint64_t v8 = &self->_telemetry.genericCounts.count[8];
  }
  else
  {
    if (a4 >> 4) {
      goto LABEL_8;
    }
    uint64_t v8 = &self->_telemetry.genericCounts.count[7];
  }
  atomic_fetch_add((atomic_ullong *volatile)v8, 1uLL);
LABEL_8:
  atomic_fetch_add((atomic_ullong *volatile)&self->_telemetry.genericCounts.count[6], 1uLL);
  uint64_t v9 = [AGXG17FamilyBuffer alloc];
  uint64_t v10 = *((unsigned __int8 *)self->_impl + 7805);

  return [(AGXBuffer *)v9 initWithDevice:self length:a3 alignment:1 options:a4 isSuballocDisabled:v10 pinnedGPULocation:0];
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  if (*((unsigned char *)self->_impl + 7813))
  {
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_2427AD000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandQueueLifetime", "CommandQueue is allocated!", v8, 2u);
    }
  }
  __int16 v5 = [[AGXG17FamilyCommandQueue alloc] initWithDevice:self descriptor:a3];
  [(AGXG17FamilyDevice *)self setupDeferred];
  return v5;
}

- (id)newCommandQueue
{
  if (*((unsigned char *)self->_impl + 7813))
  {
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_2427AD000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandQueueLifetime", "CommandQueue is allocated!", v6, 2u);
    }
  }
  uint64_t v3 = [(_MTLCommandQueue *)[AGXG17FamilyCommandQueue alloc] initWithDevice:self];
  [(AGXG17FamilyDevice *)self setupDeferred];
  return v3;
}

- (void)setupDeferred
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__AGXG17FamilyDevice_setupDeferred__block_invoke;
  block[3] = &unk_265170D78;
  block[4] = self;
  if (-[AGXG17FamilyDevice setupDeferred]::once != -1) {
    dispatch_once(&-[AGXG17FamilyDevice setupDeferred]::once, block);
  }
}

void __35__AGXG17FamilyDevice_setupDeferred__block_invoke(uint64_t a1)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  v1 = *(Boolean **)(a1 + 32);
  uint64_t v2 = *((void *)v1 + 101);
  lock = (os_unfair_lock_s *)(v2 + 6128);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6128));
  if (*(_DWORD *)(v2 + 6104) <= 0xFu) {
    AGX::Mempool<16u,0u,true,AGX::HAL200::TextureHeapElem,AGX::HAL200::TextureHeapElem,unsigned int>::grow(v2 + 6072, 16);
  }
  os_unfair_lock_unlock(lock);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6192));
  if (*(_DWORD *)(v2 + 6168) <= 0xFu) {
    AGX::Mempool<16u,0u,true,AGX::HAL200::SamplerHeapElem>::grow(v2 + 6152, 0x10u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6192));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6256));
  if (*(_DWORD *)(v2 + 6232) <= 0xFu) {
    AGX::Mempool<16u,0u,true,AGX::HAL200::BVHStateHeapElem>::grow(v2 + 6216, 0x10u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6256));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6320));
  if (*(_DWORD *)(v2 + 6296) <= 0xFu) {
    AGX::Mempool<16u,0u,true,unsigned long long>::grow(v2 + 6280, 0x10u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6320));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6384));
  if (*(_DWORD *)(v2 + 6360) <= 0x1Fu) {
    AGX::Mempool<16u,0u,true,unsigned long long>::grow(v2 + 6344, 0x20u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6384));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6448));
  if (*(_DWORD *)(v2 + 6424) <= 0x1Fu) {
    AGX::Mempool<16u,0u,true,unsigned long long>::grow(v2 + 6408, 0x20u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6448));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6512));
  if (*(_DWORD *)(v2 + 6488) <= 0x1Fu) {
    AGX::Mempool<16u,0u,true,unsigned long long>::grow(v2 + 6472, 0x20u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6512));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6576));
  if (*(_DWORD *)(v2 + 6552) <= 0x1Fu) {
    AGX::Mempool<16u,0u,true,unsigned long long>::grow(v2 + 6536, 0x20u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6576));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6384));
  uint64_t v3 = (int *)MEMORY[0x263F4B188];
  **(void **)(*(void *)(v2 + 6352) + (int)*MEMORY[0x263F4B188] + 24) = 27984640;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6384));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6448));
  **(void **)(*(void *)(v2 + 6416) + *v3 + 24) = 27984896;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6448));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6512));
  **(void **)(*(void *)(v2 + 6480) + *v3 + 24) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6512));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 6576));
  **(void **)(*(void *)(v2 + 6544) + *v3 + 24) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 6576));
  uint64_t v4 = *((void *)v1 + 101);
  BOOL v71 = (void (**)(void **, CC_SHA256_CTX *))&unk_26F8519E0;
  LODWORD(v72) = 28;
  BOOL v74 = 0;
  p_uint64_t handler = 0;
  v73 = 0;
  uint64_t v5 = *(void *)(v4 + 6008);
  *(void *)keyExistsAndHasValidFormat = MEMORY[0x263EF8330];
  *(void *)&keyExistsAndHasValidFormat[8] = 3321888768;
  *(void *)&long long v59 = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20compileDriverShadersEP18AGXG17FamilyDevice_block_invoke;
  *((void *)&v59 + 1) = &__block_descriptor_80_e8_40c77_ZTS10ProgramKeyIL15_AGCStreamToken28ELN3AGX27DriverShaderCompilationModeE1EE_e26_v32__0r_v8Q16__NSString_24l;
  *(void *)&long long v60 = v4;
  *((void *)&v60 + 1) = &unk_26F8519E0;
  LODWORD(__p[0]) = 28;
  long long v62 = 0uLL;
  __p[1] = 0;
  uint64_t v6 = *(void *)(v5 + 8);
  unint64_t v7 = objc_opt_new();
  [v7 setSync:1];
  [v7 setPipelineCache:v6];
  [v7 setBinaryArchives:0];
  uint64_t handler = MEMORY[0x263EF8330];
  uint64_t v66 = 3221225472;
  char v67 = ___ZN3AGX8Compiler14compileProgramI10ProgramKeyIL15_AGCStreamToken28ELNS_27DriverShaderCompilationModeE1EEEEvRKT_P7NSArrayIPU27objcproto16MTLBinaryArchive11objc_objectEU13block_pointerFvRK20AGCDeserializedReply16MTLCompilerErrorP8NSStringEb_block_invoke;
  uint64_t v68 = &unk_26516F7C0;
  v69 = keyExistsAndHasValidFormat;
  size_t v77 = 0;
  *(void *)v78 = 0;
  unk_26F8519F0(&v71, v78, &v77);
  uint64_t v8 = dispatch_data_create(*(const void **)v78, (size_t)v77, 0, 0);
  [v7 setDriverKeyData:v8];
  if ([v7 airScript])
  {
    uint64_t v9 = [v7 airScript];
    long long v81 = 0uLL;
    *(void *)&long long v82 = 0;
    *(void *)&long long v81 = dispatch_data_create_map(v9, (const void **)&v81 + 1, (size_t *)&v82);
    uint64_t v10 = *((void *)&v81 + 1);
    uint64_t v11 = **((_DWORD **)&v81 + 1);
    CC_SHA256_Init(&c);
    (*v71)((void **)&v71, &c);
    *(void *)&long long v88 = 0;
    *(void *)len = 0;
    if (AGX::GetSerializedVertexFormat((AGX *)(v10 + v11), &v88, (size_t *)len, v12, v13))
    {
      uint32x2_t v14 = (void *)v88;
      CC_SHA256_Update(&c, (const void *)v88, len[0]);
      free(v14);
    }
    CC_SHA256_Final(md, &c);
    dispatch_release((dispatch_object_t)v81);
    long long v81 = *(_OWORD *)md;
    long long v82 = v85;
    [v7 setVendorPluginFunctionId:&v81];
  }
  *(void *)c.count = MEMORY[0x263EF8330];
  *(void *)c.hash = 3221225472;
  *(void *)&c.hash[2] = ___ZN3AGX8Compiler14compileProgramI10ProgramKeyIL15_AGCStreamToken28ELNS_27DriverShaderCompilationModeE1EE20AGCDeserializedReplyEEvRKT_P29MTLCompileFunctionRequestDataU13block_pointerFvRKT0_PU27objcproto16OS_dispatch_data8NSObjectSH_SH_SH_SH_16MTLCompilerErrorP8NSStringyE_block_invoke;
  *(void *)&c.hash[4] = &unk_26516F810;
  *(void *)&c.hash[6] = v7;
  *(void *)c.wbuf = &handler;
  if ([v7 function])
  {
    uint64_t v15 = mach_absolute_time();
    uint64_t v16 = *(void **)v5;
    *(void *)md = MEMORY[0x263EF8330];
    *(void *)&md[8] = 3221225472;
    *(void *)&long long v85 = ___ZN3AGX8Compiler14compileProgramI10ProgramKeyIL15_AGCStreamToken28ELNS_27DriverShaderCompilationModeE1EE20AGCDeserializedReplyEEvRKT_P29MTLCompileFunctionRequestDataU13block_pointerFvRKT0_PU27objcproto16OS_dispatch_data8NSObjectSH_SH_SH_SH_16MTLCompilerErrorP8NSStringyE_block_invoke_4;
    *((void *)&v85 + 1) = &unk_26516F860;
    p_CC_SHA256_CTX c = &c;
    uint64_t v87 = v15;
    [v16 compileFunctionRequest:v7 completionHandler:md];
  }
  else
  {
    if ([v7 frameworkData] || objc_msgSend(v7, "pipelineOptions")) {
      AGX::Compiler::compileProgram<AGX::UserIntersectionProgramKey,AGCReplyArray>(AGX::UserIntersectionProgramKey const&,MTLCompileFunctionRequestData *,void({block_pointer})(AGCReplyArray const&,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,MTLCompilerError,NSString *,unsigned long long))::{lambda(void)#1}::operator()[abi:[AGX] Failed assertion __requestData.frameworkData && _requestData.pipelineOptions_]();
    }
    *(void *)md = MEMORY[0x263EF8330];
    *(void *)&md[8] = 3221225472;
    *(void *)&long long v85 = ___ZN3AGX8Compiler14compileProgramI10ProgramKeyIL15_AGCStreamToken28ELNS_27DriverShaderCompilationModeE1EE20AGCDeserializedReplyEEvRKT_P29MTLCompileFunctionRequestDataU13block_pointerFvRKT0_PU27objcproto16OS_dispatch_data8NSObjectSH_SH_SH_SH_16MTLCompilerErrorP8NSStringyE_block_invoke_3;
    *((void *)&v85 + 1) = &unk_26516F838;
    p_CC_SHA256_CTX c = &c;
    uint64_t v17 = objc_msgSend((id)objc_msgSend(v7, "binaryArchives"), "count");
    unsigned int v18 = *(void **)v5;
    uint64_t v19 = [v7 driverKeyData];
    if (v17) {
      objc_msgSend(v18, "compileRequest:binaryArchives:failOnBinaryArchiveMiss:pipelineCache:sync:completionHandler:", v19, objc_msgSend(v7, "binaryArchives"), 0, objc_msgSend(v7, "pipelineCache"), objc_msgSend(v7, "sync"), md);
    }
    else {
      objc_msgSend(v18, "compileRequest:pipelineCache:sync:completionHandler:", v19, objc_msgSend(v7, "pipelineCache"), objc_msgSend(v7, "sync"), md);
    }
  }
  dispatch_release(v8);

  *((void *)&v60 + 1) = &unk_26F8519E0;
  if (__p[1])
  {
    *(void **)&long long v62 = __p[1];
    operator delete(__p[1]);
  }
  BOOL v71 = (void (**)(void **, CC_SHA256_CTX *))&unk_26F8519E0;
  if (v73)
  {
    BOOL v74 = v73;
    operator delete(v73);
  }
  *(void *)md = 0;
  *(void *)&md[8] = md;
  *(void *)&long long v85 = 0x2020000000;
  BYTE8(v85) = 0;
  *(void *)c.count = MEMORY[0x263EF8330];
  *(void *)c.hash = 3221225472;
  *(void *)&c.hash[2] = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE49createTGOptimizationDriverShaderAndBufferIfNeededEP18AGXG17FamilyDevice_block_invoke;
  *(void *)&c.hash[4] = &unk_26516E978;
  *(void *)c.wbuf = md;
  *(void *)&c.wbuf[2] = v4;
  *(void *)&c.hash[6] = v1;
  if (AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createTGOptimizationDriverShaderAndBufferIfNeeded(AGXG17FamilyDevice *)::tg_opt_shader_pred != -1) {
    dispatch_once(&AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::createTGOptimizationDriverShaderAndBufferIfNeeded(AGXG17FamilyDevice *)::tg_opt_shader_pred, &c);
  }
  if (*(unsigned char *)(*(void *)&md[8] + 24) || (uint64_t v20 = *(void *)(v4 + 7912)) == 0 || !*(void *)(v20 + 16))
  {
    MTLReleaseAssertionFailure();
    __break(1u);
    return;
  }
  _Block_object_dispose(md, 8);
  *(void *)&long long v81 = &unk_26F851A20;
  DWORD2(v81) = 94;
  uint64_t v83 = 0;
  long long v82 = 0uLL;
  uint64_t v21 = *(void *)(v4 + 6008);
  uint64_t handler = MEMORY[0x263EF8330];
  uint64_t v66 = 3221225472;
  char v67 = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE20compileDriverShadersEP18AGXG17FamilyDevice_block_invoke_122;
  uint64_t v68 = &unk_26516E9A0;
  v69 = v1;
  uint64_t v70 = v4;
  uint64_t v22 = *(void *)(v21 + 8);
  uint64_t v23 = objc_opt_new();
  [v23 setSync:1];
  [v23 setPipelineCache:v22];
  [v23 setBinaryArchives:0];
  BOOL v71 = (void (**)(void **, CC_SHA256_CTX *))MEMORY[0x263EF8330];
  uint64_t v72 = 3221225472;
  v73 = ___ZN3AGX8Compiler14compileProgramI10ProgramKeyIL15_AGCStreamToken94ELNS_27DriverShaderCompilationModeE1EEEEvRKT_P7NSArrayIPU27objcproto16MTLBinaryArchive11objc_objectEU13block_pointerFvRK20AGCDeserializedReply16MTLCompilerErrorP8NSStringEb_block_invoke;
  BOOL v74 = &unk_26516F7C0;
  p_uint64_t handler = &handler;
  size_t v76 = 0;
  size_t v77 = 0;
  (*(void (**)(long long *, const void **, size_t *))(v81 + 16))(&v81, &v77, &v76);
  unsigned int v24 = dispatch_data_create(v77, v76, 0, 0);
  [v23 setDriverKeyData:v24];
  if ([v23 airScript])
  {
    __n128 v25 = [v23 airScript];
    long long v88 = 0uLL;
    *(void *)&long long v89 = 0;
    *(void *)&long long v88 = dispatch_data_create_map(v25, (const void **)&v88 + 1, (size_t *)&v89);
    uint64_t v26 = *((void *)&v88 + 1);
    uint64_t v27 = **((_DWORD **)&v88 + 1);
    CC_SHA256_Init(&c);
    (*(void (**)(long long *, CC_SHA256_CTX *))v81)(&v81, &c);
    *(void *)v78 = 0;
    *(void *)len = 0;
    if (AGX::GetSerializedVertexFormat((AGX *)(v26 + v27), len, (size_t *)v78, v28, v29))
    {
      unint64_t v30 = *(void **)len;
      CC_SHA256_Update(&c, *(const void **)len, v78[0]);
      free(v30);
    }
    CC_SHA256_Final(md, &c);
    dispatch_release((dispatch_object_t)v88);
    long long v88 = *(_OWORD *)md;
    long long v89 = v85;
    [v23 setVendorPluginFunctionId:&v88];
  }
  *(void *)c.count = MEMORY[0x263EF8330];
  *(void *)c.hash = 3221225472;
  *(void *)&c.hash[2] = ___ZN3AGX8Compiler14compileProgramI10ProgramKeyIL15_AGCStreamToken94ELNS_27DriverShaderCompilationModeE1EE20AGCDeserializedReplyEEvRKT_P29MTLCompileFunctionRequestDataU13block_pointerFvRKT0_PU27objcproto16OS_dispatch_data8NSObjectSH_SH_SH_SH_16MTLCompilerErrorP8NSStringyE_block_invoke;
  *(void *)&c.hash[4] = &unk_26516F810;
  *(void *)&c.hash[6] = v23;
  *(void *)c.wbuf = &v71;
  if ([v23 function])
  {
    uint64_t v31 = mach_absolute_time();
    char v32 = *(void **)v21;
    *(void *)md = MEMORY[0x263EF8330];
    *(void *)&md[8] = 3221225472;
    *(void *)&long long v85 = ___ZN3AGX8Compiler14compileProgramI10ProgramKeyIL15_AGCStreamToken94ELNS_27DriverShaderCompilationModeE1EE20AGCDeserializedReplyEEvRKT_P29MTLCompileFunctionRequestDataU13block_pointerFvRKT0_PU27objcproto16OS_dispatch_data8NSObjectSH_SH_SH_SH_16MTLCompilerErrorP8NSStringyE_block_invoke_4;
    *((void *)&v85 + 1) = &unk_26516F860;
    p_CC_SHA256_CTX c = &c;
    uint64_t v87 = v31;
    [v32 compileFunctionRequest:v23 completionHandler:md];
  }
  else
  {
    if ([v23 frameworkData] || objc_msgSend(v23, "pipelineOptions")) {
      AGX::Compiler::compileProgram<AGX::UserIntersectionProgramKey,AGCReplyArray>(AGX::UserIntersectionProgramKey const&,MTLCompileFunctionRequestData *,void({block_pointer})(AGCReplyArray const&,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,NSObject  {objcproto16OS_dispatch_data}*,MTLCompilerError,NSString *,unsigned long long))::{lambda(void)#1}::operator()[abi:[AGX] Failed assertion __requestData.frameworkData && _requestData.pipelineOptions_]();
    }
    *(void *)md = MEMORY[0x263EF8330];
    *(void *)&md[8] = 3221225472;
    *(void *)&long long v85 = ___ZN3AGX8Compiler14compileProgramI10ProgramKeyIL15_AGCStreamToken94ELNS_27DriverShaderCompilationModeE1EE20AGCDeserializedReplyEEvRKT_P29MTLCompileFunctionRequestDataU13block_pointerFvRKT0_PU27objcproto16OS_dispatch_data8NSObjectSH_SH_SH_SH_16MTLCompilerErrorP8NSStringyE_block_invoke_3;
    *((void *)&v85 + 1) = &unk_26516F838;
    p_CC_SHA256_CTX c = &c;
    uint64_t v33 = objc_msgSend((id)objc_msgSend(v23, "binaryArchives"), "count");
    BOOL v34 = *(void **)v21;
    uint64_t v35 = [v23 driverKeyData];
    if (v33) {
      objc_msgSend(v34, "compileRequest:binaryArchives:failOnBinaryArchiveMiss:pipelineCache:sync:completionHandler:", v35, objc_msgSend(v23, "binaryArchives"), 0, objc_msgSend(v23, "pipelineCache"), objc_msgSend(v23, "sync"), md);
    }
    else {
      objc_msgSend(v34, "compileRequest:pipelineCache:sync:completionHandler:", v35, objc_msgSend(v23, "pipelineCache"), objc_msgSend(v23, "sync"), md);
    }
  }
  dispatch_release(v24);

  *(void *)&long long v81 = &unk_26F851A20;
  if ((void)v82)
  {
    *((void *)&v82 + 1) = v82;
    operator delete((void *)v82);
  }
  *(void *)(v2 + 5096) = 0;
  *(void *)c.count = 0;
  if (findEnvVarNum<unsigned long long>("AGX_DATA_BUFFER_CACHING_OVERRIDE", &c))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: environment variable forcing the following data buffer classes to use cacheable memory: 0x%016llX\n");
LABEL_54:
    unint64_t v36 = *(void *)c.count;
    goto LABEL_55;
  }
  keyExistsAndHasValidFormat[0] = 0;
  *(void *)c.count = CFPreferencesGetAppIntegerValue(@"dataBufferCachingOverride", @"com.apple.Metal", keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0])
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: preference forcing the following data buffer classes to use cacheable memory: 0x%016llX\n");
    goto LABEL_54;
  }
  unint64_t v36 = -1;
LABEL_55:
  uint64_t v37 = 0;
  unint64_t v38 = &AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::databuffer_params;
  do
  {
    uint64_t v39 = *v38;
    v38 += 2;
    long long v60 = xmmword_242EAA210;
    *(_OWORD *)__p = xmmword_242EAA220;
    *(void *)&long long v62 = 0;
    long long v63 = xmmword_242EAA240;
    *(_OWORD *)keyExistsAndHasValidFormat = defaultArgs;
    long long v59 = xmmword_242EAA200;
    *(_WORD *)&keyExistsAndHasValidFormat[8] = v39;
    *(_DWORD *)&keyExistsAndHasValidFormat[4] = (((v36 >> v37) & 1) == 0) << 10;
    uint64_t v64 = 0;
    *((void *)&v62 + 1) = v39;
    uint64_t v40 = 0x8000000;
    switch((int)v37)
    {
      case 0:
      case 1:
      case 2:
      case 9:
      case 14:
        uint64_t v41 = 939524096;
        goto LABEL_60;
      case 3:
      case 19:
      case 22:
        uint64_t v40 = 0x2008000000;
        goto LABEL_57;
      case 4:
      case 7:
      case 12:
      case 13:
      case 15:
      case 16:
      case 21:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 31:
      case 33:
LABEL_57:
        *((void *)&v63 + 1) = v40;
        break;
      case 5:
      case 6:
      case 8:
      case 10:
      case 11:
      case 17:
      case 18:
      case 20:
      case 28:
        *((void *)&v63 + 1) = 402653184;
        break;
      case 29:
        *((void *)&v63 + 1) = 0x8000000;
        break;
      case 30:
        uint64_t v41 = 1207959552;
LABEL_60:
        *((void *)&v63 + 1) = v41;
        DWORD1(v59) = 0x8000;
        break;
      case 32:
        *((void *)&v63 + 1) = 0x8000000;
        *(_DWORD *)&keyExistsAndHasValidFormat[4] = 0;
        break;
      default:
        AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::setupDeferred(AGXG17FamilyDevice *)::{lambda(void)#1}::operator()[abi:[AGX] Crashed.]();
    }
    *(void *)&c.count[2 * v37++] = [objc_alloc(MEMORY[0x263F4B138]) initWithDevice:v1 resourceClass:objc_opt_class() resourceArgs:keyExistsAndHasValidFormat resourceArgsSize:104 options:0];
  }
  while (v37 != 34);
  [(Boolean *)v1 setHwResourcePool:&c count:34];
  uint64_t v42 = [(AGXBuffer *)[AGXG17FamilyBuffer alloc] initUntrackedInternalBufferWithDevice:*(void *)(v2 + 5168) length:128 options:32];
  *(void *)(v2 + 7304) = v42;
  BOOL v43 = (int *)MEMORY[0x263F4B188];
  uint64_t v44 = (*(void *)&v42[*MEMORY[0x263F4B188] + 8] >> 4) & 0xFFFFFFFFFFFLL;
  *(void *)(v2 + 7312) = 0x200000000B6D0019;
  *(void *)(v2 + 7320) = v44;
  *(void *)(v2 + 7336) = 0;
  *(void *)(v2 + 7328) = 0;
  *(_OWORD *)(v2 + 7344) = xmmword_242EA7D20;
  *(_OWORD *)(v2 + 7360) = xmmword_242EA7D30;
  long long v45 = *(_OWORD *)(v2 + 7328);
  *(_OWORD *)c.count = *(_OWORD *)(v2 + 7312);
  *(_OWORD *)&c.hash[2] = v45;
  long long v46 = *(_OWORD *)(v2 + 7360);
  *(_OWORD *)&c.hash[6] = *(_OWORD *)(v2 + 7344);
  *(_OWORD *)&c.wbuf[2] = v46;
  os_unfair_lock_lock(lock);
  uint64_t v47 = *v43;
  unint64_t v48 = *(_OWORD **)(*(void *)(v2 + 6080) + v47 + 24);
  int v49 = *(_OWORD **)(*(void *)(v2 + 6088) + v47 + 24);
  int v50 = *(_DWORD **)(*(void *)(v2 + 6096) + v47 + 24);
  _OWORD *v48 = *(_OWORD *)c.count;
  v48[1] = *(_OWORD *)&c.hash[2];
  v49[1] = *(_OWORD *)&c.wbuf[2];
  *int v49 = *(_OWORD *)&c.hash[6];
  *int v50 = 0;
  os_unfair_lock_unlock(lock);
  uint64_t v51 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  *(void *)(v2 + 8032) = dispatch_queue_create("com.apple.AGXMetal.MemoryPoolDecay", v51);
  *(std::chrono::system_clock::time_point *)(v2 + 7424) = std::chrono::system_clock::now();
  uint64_t v52 = (const dispatch_source_type_s *)MEMORY[0x263EF8400];
  int v53 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(v2 + 8032));
  *(void *)(v2 + 8040) = v53;
  *(void *)c.count = MEMORY[0x263EF8330];
  *(void *)c.hash = 3221225472;
  *(void *)&c.hash[2] = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE13setupDeferredEP18AGXG17FamilyDevice_block_invoke_45;
  *(void *)&c.hash[4] = &__block_descriptor_40_e5_v8__0l;
  *(void *)&c.hash[6] = v2;
  dispatch_source_set_event_handler(v53, &c);
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 8040), 0, 0xB2D05E00uLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_activate(*(dispatch_object_t *)(v2 + 8040));
  uint64_t v54 = dispatch_source_create(MEMORY[0x263EF83D8], 0, 6uLL, *(dispatch_queue_t *)(v2 + 8032));
  *(void *)(v2 + 8048) = v54;
  *(void *)keyExistsAndHasValidFormat = MEMORY[0x263EF8330];
  *(void *)&keyExistsAndHasValidFormat[8] = 3221225472;
  *(void *)&long long v59 = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE13setupDeferredEP18AGXG17FamilyDevice_block_invoke_2;
  *((void *)&v59 + 1) = &__block_descriptor_40_e5_v8__0l;
  *(void *)&long long v60 = v2;
  dispatch_source_set_event_handler(v54, keyExistsAndHasValidFormat);
  dispatch_activate(*(dispatch_object_t *)(v2 + 8048));
  uint64_t v55 = dispatch_source_create(v52, 0, 0, *(dispatch_queue_t *)(v2 + 8032));
  *(void *)(v2 + 8064) = v55;
  *(void *)md = MEMORY[0x263EF8330];
  *(void *)&md[8] = 3221225472;
  *(void *)&long long v85 = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE13setupDeferredEP18AGXG17FamilyDevice_block_invoke_3;
  *((void *)&v85 + 1) = &__block_descriptor_40_e5_v8__0l;
  p_CC_SHA256_CTX c = (CC_SHA256_CTX *)v2;
  dispatch_source_set_event_handler(v55, md);
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 8064), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_activate(*(dispatch_object_t *)(v2 + 8064));
  uint64_t v56 = dispatch_source_create(v52, 0, 0, *(dispatch_queue_t *)(v2 + 8032));
  *(void *)(v2 + 8072) = v56;
  uint64_t handler = MEMORY[0x263EF8330];
  uint64_t v66 = 3221225472;
  char v67 = ___ZN3AGX6DeviceINS_6HAL2008EncodersENS1_7ClassesENS1_10ObjClassesEE13setupDeferredEP18AGXG17FamilyDevice_block_invoke_4;
  uint64_t v68 = &__block_descriptor_40_e5_v8__0l;
  v69 = (Boolean *)v2;
  dispatch_source_set_event_handler(v56, &handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 8072), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_activate(*(dispatch_object_t *)(v2 + 8072));
}

- (Class)threadedRenderPassClass
{
  return (Class)objc_opt_class();
}

- (Class)computeContextClass
{
  return (Class)objc_opt_class();
}

- (Class)renderContextClass
{
  return (Class)objc_opt_class();
}

- (Class)blitContextClass
{
  return (Class)objc_opt_class();
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  impl = (os_unfair_lock_s *)self->_impl;
  os_unfair_lock_lock(impl + 1874);
  uint64_t v83 = 0;
  memset(__p, 0, sizeof(__p));
  os_unfair_lock_t lock = impl + 1874;
  uint64_t v6 = (void *)[a3 frontFaceStencil];
  unint64_t v7 = (void *)[a3 backFaceStencil];
  LODWORD(__p[0]) = [v6 stencilCompareFunction] & 7;
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFFFFFC7 | (8 * ([v6 stencilFailureOperation] & 7));
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFFFFE3F | (([v6 depthFailureOperation] & 7) << 6);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFFFF1FF | (([v6 depthStencilPassOperation] & 7) << 9);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFFF1FFF | (([v7 stencilCompareFunction] & 7) << 13);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFF8FFFF | (([v7 stencilFailureOperation] & 7) << 16);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFFC7FFFF | (([v7 depthFailureOperation] & 7) << 19);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xFE3FFFFF | (([v7 depthStencilPassOperation] & 7) << 22);
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xE3FFFFFF | (([a3 depthCompareFunction] & 7) << 26);
  if ([a3 isDepthWriteEnabled]) {
    int v8 = 0x20000000;
  }
  else {
    int v8 = 0;
  }
  LODWORD(__p[0]) = (uint64_t)__p[0] & 0xDFFFFFFF | v8;
  BYTE4(__p[0]) = [v6 readMask];
  BYTE5(__p[0]) = [v6 writeMask];
  BYTE6(__p[0]) = [v7 readMask];
  HIBYTE(__p[0]) = [v7 writeMask];
  uint64_t v9 = (void *)[a3 label];
  if (v9)
  {
    MEMORY[0x24566EB20](&__p[1], [v9 UTF8String]);
  }
  else
  {
    if (SHIBYTE(__p[3]) < 0) {
      operator delete(__p[1]);
    }
    memset(&__p[1], 0, 24);
  }
  size_t v76 = self;
  int v10 = LOWORD(__p[0]) >> 13;
  if (BYTE6(__p[0])) {
    BOOL v11 = LOWORD(__p[0]) >> 13 != 0;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL v17 = v10 == 7;
  BOOL v12 = v10 != 7;
  if (v17) {
    BOOL v11 = 0;
  }
  __int16 v13 = ((LODWORD(__p[0]) >> 26) & 7) != 0 && ((LODWORD(__p[0]) >> 26) & 7) != 7;
  int v14 = (uint64_t)__p[0] & 7;
  if (BYTE4(__p[0])) {
    BOOL v15 = ((uint64_t)__p[0] & 7) != 0;
  }
  else {
    BOOL v15 = 0;
  }
  BOOL v17 = v14 == 7;
  BOOL v16 = v14 != 7;
  if (v17) {
    BOOL v15 = 0;
  }
  BOOL v17 = ((uint64_t)__p[0] & 0xFF8) == 0 || BYTE5(__p[0]) == 0;
  int v18 = !v17;
  if (!v17) {
    BOOL v16 = 1;
  }
  BOOL v19 = ((uint64_t)__p[0] & 0x1FF0000) == 0 || HIBYTE(__p[0]) == 0;
  int v20 = !v19;
  if (!v19) {
    BOOL v12 = 1;
  }
  if (v12) {
    int v21 = 0x2000000;
  }
  else {
    int v21 = 0;
  }
  int v22 = v16 & v18;
  if ((v16 & v18) != 0) {
    BOOL v15 = v18;
  }
  int v23 = v16 && v15;
  unsigned int v24 = (uint64_t)__p[0] & 0x20000000;
  int v25 = v12 & v20;
  if ((v12 & v20) != 0) {
    BOOL v11 = v20;
  }
  int v26 = v12 && v11;
  if (v22 | v25) {
    __int16 v27 = 8;
  }
  else {
    __int16 v27 = 0;
  }
  int v28 = v22 | v25 | v23 | v26;
  if (v16) {
    int v29 = 4096;
  }
  else {
    int v29 = 0;
  }
  LODWORD(__p[0]) = v29 | (uint64_t)__p[0] & 0xFDFFEFFF | v21;
  if (v28) {
    __int16 v30 = 4;
  }
  else {
    __int16 v30 = 0;
  }
  LOWORD(v83) = v13 | (v24 >> 29) | (v24 >> 28) | v27 | v30;
  uint64_t v31 = impl + 1878;
  v75 = impl;
  char v32 = *(char **)&impl[1878]._os_unfair_lock_opaque;
  if (v32)
  {
    char v33 = HIBYTE(__p[3]);
    BOOL v34 = SHIBYTE(__p[3]) >= 0 ? (void *)HIBYTE(__p[3]) : __p[2];
    uint64_t v35 = SHIBYTE(__p[3]) >= 0 ? &__p[1] : (void **)__p[1];
    unint64_t v36 = impl + 1878;
    do
    {
      uint64_t v37 = (void *)*((void *)v32 + 4);
      if (v37 < __p[0])
      {
        v32 += 8;
      }
      else if (__p[0] >= v37)
      {
        int v38 = v32[63];
        if (v38 >= 0) {
          size_t v39 = v32[63];
        }
        else {
          size_t v39 = *((void *)v32 + 6);
        }
        if (v38 >= 0) {
          uint64_t v40 = v32 + 40;
        }
        else {
          uint64_t v40 = (const void *)*((void *)v32 + 5);
        }
        if ((unint64_t)v34 >= v39) {
          size_t v41 = v39;
        }
        else {
          size_t v41 = (size_t)v34;
        }
        int v42 = memcmp(v40, v35, v41);
        BOOL v43 = v39 < (unint64_t)v34;
        if (v42) {
          BOOL v43 = v42 < 0;
        }
        if (v43) {
          v32 += 8;
        }
        else {
          unint64_t v36 = (os_unfair_lock_s *)v32;
        }
      }
      else
      {
        unint64_t v36 = (os_unfair_lock_s *)v32;
      }
      char v32 = *(char **)v32;
    }
    while (v32);
    if (v36 != v31)
    {
      uint64_t v44 = *(void **)&v36[8]._os_unfair_lock_opaque;
      if (__p[0] >= v44)
      {
        if (v44 < __p[0]) {
          goto LABEL_140;
        }
        int os_unfair_lock_opaque_high = SHIBYTE(v36[15]._os_unfair_lock_opaque);
        if (os_unfair_lock_opaque_high >= 0) {
          size_t v70 = HIBYTE(v36[15]._os_unfair_lock_opaque);
        }
        else {
          size_t v70 = *(void *)&v36[12]._os_unfair_lock_opaque;
        }
        if (os_unfair_lock_opaque_high >= 0) {
          BOOL v71 = v36 + 10;
        }
        else {
          BOOL v71 = *(os_unfair_lock_s **)&v36[10]._os_unfair_lock_opaque;
        }
        if (v70 >= (unint64_t)v34) {
          size_t v72 = (size_t)v34;
        }
        else {
          size_t v72 = v70;
        }
        int v73 = memcmp(v35, v71, v72);
        BOOL v74 = (unint64_t)v34 < v70;
        if (v73) {
          BOOL v74 = v73 < 0;
        }
        if (!v74)
        {
LABEL_140:
          long long v45 = *(AGXG17FamilyDepthStencilState **)&v36[18]._os_unfair_lock_opaque;
          uint64_t v66 = lock;
          if ((v33 & 0x80) == 0) {
            goto LABEL_126;
          }
          goto LABEL_125;
        }
      }
    }
  }
  long long v45 = [(_MTLDepthStencilState *)[AGXG17FamilyDepthStencilState alloc] initWithDevice:v76 depthStencilDescriptor:a3];
  v45->_impl.desc.var0.dword = (unint64_t)__p[0];
  std::string::operator=((std::string *)&v45->_impl.desc.label, (const std::string *)&__p[1]);
  v45->_impl.desc.label.__r_.var0 = v83;
  uint64_t v46 = 786432;
  if (((uint64_t)__p[0] & 0x2001000) == 0) {
    uint64_t v46 = 0;
  }
  v45->_impl.desc.label.var0 = v46 | ((unint64_t)(((LODWORD(__p[0]) >> 8) & 0x200000 | (LODWORD(__p[0]) >> 2) & 0x7000000) ^ 0x200000) << 32);
  if (((uint64_t)__p[0] & 0x1000) != 0)
  {
    int8x16_t v49 = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(__p[0]), (uint32x4_t)xmmword_242EA7D40), (int8x16_t)xmmword_242EA7D50);
    *(int8x8_t *)v49.i8 = vorr_s8(*(int8x8_t *)v49.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v49, v49, 8uLL));
    uint64_t v47 = v49.i32[0] | v49.i32[1] | (BYTE4(__p[0]) << 8) | BYTE5(__p[0]);
    if (((uint64_t)__p[0] & 0x2000000) != 0) {
      goto LABEL_87;
    }
  }
  else
  {
    uint64_t v47 = 234881024;
    if (((uint64_t)__p[0] & 0x2000000) != 0)
    {
LABEL_87:
      unint64_t v48 = (unint64_t)((uint64_t)__p[0] & 0x380000 | (LODWORD(__p[0]) >> 6) & 0x70000 | (bswap32(HIWORD(__p[0])) >> 16) | ((HIWORD(LODWORD(__p[0])) & 7) << 22) & 0xF1FFFFFF | (LOWORD(__p[0]) >> 13 << 25)) << 32;
      goto LABEL_90;
    }
  }
  unint64_t v48 = 0xE00000000000000;
LABEL_90:
  v45[1].super.super.isa = (Class)(v48 | v47);
  v78 = __p[0];
  if (SHIBYTE(__p[3]) < 0) {
    std::string::__init_copy_ctor_external(&v79, (const std::string::value_type *)__p[1], (std::string::size_type)__p[2]);
  }
  else {
    std::string v79 = *(std::string *)&__p[1];
  }
  int v50 = v83;
  int v80 = v83;
  long long v81 = v45;
  uint64_t v51 = *(char **)&v31->_os_unfair_lock_opaque;
  uint64_t v52 = v31;
  if (*(void *)&v31->_os_unfair_lock_opaque)
  {
    if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v79.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v79.__r_.__value_.__l.__size_;
    }
    if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v54 = &v79;
    }
    else {
      uint64_t v54 = (std::string *)v79.__r_.__value_.__r.__words[0];
    }
    while (1)
    {
      uint64_t v31 = (os_unfair_lock_s *)v51;
      unint64_t v55 = *((void *)v51 + 4);
      if ((unint64_t)v78 < v55) {
        goto LABEL_100;
      }
      if (v55 < (unint64_t)v78) {
        goto LABEL_118;
      }
      int v56 = SHIBYTE(v31[15]._os_unfair_lock_opaque);
      if (v56 >= 0) {
        size_t v57 = HIBYTE(v31[15]._os_unfair_lock_opaque);
      }
      else {
        size_t v57 = *(void *)&v31[12]._os_unfair_lock_opaque;
      }
      if (v56 >= 0) {
        uint64_t v58 = v31 + 10;
      }
      else {
        uint64_t v58 = *(os_unfair_lock_s **)&v31[10]._os_unfair_lock_opaque;
      }
      if (v57 >= size) {
        size_t v59 = size;
      }
      else {
        size_t v59 = v57;
      }
      int v60 = memcmp(v54, v58, v59);
      BOOL v61 = size < v57;
      if (v60) {
        BOOL v61 = v60 < 0;
      }
      if (v61)
      {
LABEL_100:
        uint64_t v51 = *(char **)&v31->_os_unfair_lock_opaque;
        uint64_t v52 = v31;
        if (!*(void *)&v31->_os_unfair_lock_opaque) {
          break;
        }
      }
      else
      {
        int v62 = memcmp(v58, v54, v59);
        BOOL v63 = v57 < size;
        if (v62) {
          BOOL v63 = v62 < 0;
        }
        if (!v63) {
          goto LABEL_122;
        }
LABEL_118:
        uint64_t v52 = v31 + 2;
        uint64_t v51 = *(char **)&v31[2]._os_unfair_lock_opaque;
        if (!v51) {
          break;
        }
      }
    }
  }
  uint64_t v64 = (char *)operator new(0x50uLL);
  *((void *)v64 + 4) = v78;
  *(std::string *)(v64 + 40) = v79;
  memset(&v79, 0, sizeof(v79));
  *((_DWORD *)v64 + 16) = v50;
  *((void *)v64 + 9) = v45;
  *(void *)uint64_t v64 = 0;
  *((void *)v64 + 1) = 0;
  *((void *)v64 + 2) = v31;
  *(void *)&v52->_uint32_t os_unfair_lock_opaque = v64;
  uint64_t v65 = **(void **)&v75[1876]._os_unfair_lock_opaque;
  if (v65)
  {
    *(void *)&v75[1876]._uint32_t os_unfair_lock_opaque = v65;
    uint64_t v64 = *(char **)&v52->_os_unfair_lock_opaque;
  }
  std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)&v75[1878]._os_unfair_lock_opaque, (uint64_t *)v64);
  ++*(void *)&v75[1880]._os_unfair_lock_opaque;
LABEL_122:
  if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v79.__r_.__value_.__l.__data_);
  }
  uint64_t v66 = lock;
  if ((HIBYTE(__p[3]) & 0x80) != 0) {
LABEL_125:
  }
    operator delete(__p[1]);
LABEL_126:
  os_unfair_lock_unlock(v66);
  char v67 = v45;
  return v45;
}

- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6
{
  LODWORD(v6) = a3 | (BYTE2(a3) << 8) | (a3 >> 4) & 0xFF0;
  if (a4 == 1) {
    unsigned int v7 = a3 | (BYTE2(a3) << 8) | (a3 >> 4) & 0xFF0;
  }
  else {
    unsigned int v7 = 0;
  }
  if ((a4 & 0xFFFFFFFE) == 2) {
    int v8 = v6 << 16;
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = v8 | v7;
  if (a4 == 4) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v10 = v9 | (v6 << 32);
  uint64_t v11 = 0xFFFFLL;
  if (!(_WORD)v9) {
    uint64_t v11 = 0;
  }
  BOOL v12 = v9 >= 0x10000;
  uint64_t v13 = 4294901760;
  if (!v12) {
    uint64_t v13 = 0;
  }
  BOOL v14 = v6 == 0;
  uint64_t v15 = 0xFFFF00000000;
  if (v14) {
    uint64_t v15 = 0;
  }
  uint64_t v16 = v13 | v15 | v11;
  return (v16 & (unint64_t)v10) >= (v16 & 0xB0012000F00uLL) || (v16 & 0xB0012000F00) == 0;
}

- (id)getMostCompatibleArchitecture:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    unsigned int v15 = 0;
    uint64_t v8 = *(void *)v17;
    unint64_t v9 = 0xFFFFFFFFLL;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 cpuType] == 16777235)
        {
          int v12 = [v11 cpuSubtype];
          if (v12 <= 289)
          {
            if (v12 <= 209)
            {
              switch(v12)
              {
                case 'A':
                case 'Q':
                case 'a':
                  unint64_t v13 = 4;
                  break;
                case 'B':
                case 'D':
                case 'E':
                case 'F':
                case 'G':
                case 'H':
                case 'I':
                case 'J':
                case 'K':
                case 'L':
                case 'M':
                case 'N':
                case 'O':
                case 'P':
                case 'T':
                case 'U':
                case 'V':
                case 'W':
                case 'X':
                case 'Y':
                case 'Z':
                case '[':
                case '\\':
                case ']':
                case '^':
                case '_':
                case 'b':
                case 'c':
                case 'd':
                case 'e':
                case 'f':
                case 'g':
                case 'h':
                case 'i':
                case 'j':
                case 'k':
                case 'l':
                case 'm':
                case 'n':
                case 'o':
                case 'p':
                case 'q':
                  goto LABEL_48;
                case 'C':
                case 'S':
                  goto LABEL_34;
                case 'R':
                case 'r':
                  unint64_t v13 = 6;
                  break;
                default:
                  if (v12 != 34) {
                    goto LABEL_48;
                  }
                  unint64_t v13 = 5;
                  break;
              }
              goto LABEL_44;
            }
            if (v12 <= 242)
            {
              if (v12 != 210)
              {
                if (v12 != 227) {
                  goto LABEL_48;
                }
                goto LABEL_34;
              }
              unint64_t v13 = 7;
LABEL_44:
              if (v13 <= [(AGXG17FamilyDevice *)self featureProfile] && (v9 == 0xFFFFFFFF || v13 > v9))
              {
                unsigned int v15 = [v11 cpuType];
                uint64_t v7 = [v11 cpuSubtype];
                unint64_t v9 = v13;
              }
              continue;
            }
            if (v12 == 243) {
              goto LABEL_34;
            }
            if (v12 != 259)
            {
              if (v12 != 275) {
                goto LABEL_48;
              }
LABEL_34:
              unint64_t v13 = 10;
              goto LABEL_44;
            }
LABEL_31:
            unint64_t v13 = 11;
            goto LABEL_44;
          }
          if (v12 <= 497)
          {
            if (v12 > 369)
            {
              switch(v12)
              {
                case 402:
                case 434:
                  goto LABEL_43;
                case 403:
                  goto LABEL_31;
                case 404:
                case 405:
                case 406:
                case 407:
                case 408:
                case 409:
                case 410:
                case 411:
                case 412:
                case 413:
                case 414:
                case 415:
                case 416:
                case 417:
                case 418:
                case 419:
                case 420:
                case 421:
                case 422:
                case 423:
                case 424:
                case 425:
                case 426:
                case 427:
                case 428:
                case 429:
                case 430:
                case 431:
                case 432:
                case 433:
                  goto LABEL_48;
                case 435:
                  goto LABEL_34;
                default:
                  if (v12 == 370) {
                    goto LABEL_43;
                  }
                  goto LABEL_48;
              }
            }
            if (v12 != 290 && v12 != 322)
            {
              if (v12 != 323) {
                goto LABEL_48;
              }
              goto LABEL_31;
            }
LABEL_37:
            unint64_t v13 = 8;
            goto LABEL_44;
          }
          if (v12 <= 561)
          {
            if (v12 != 498)
            {
              if (v12 != 530) {
                goto LABEL_48;
              }
              goto LABEL_37;
            }
          }
          else
          {
            if (v12 == 562 || v12 == 594) {
              goto LABEL_37;
            }
            if (v12 != 610)
            {
LABEL_48:
              unint64_t v13 = 0xFFFFFFFFLL;
              goto LABEL_44;
            }
          }
LABEL_43:
          unint64_t v13 = 9;
          goto LABEL_44;
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v6) {
        return (id)[objc_alloc(MEMORY[0x263F127B0]) initWithCPUType:v15 cpuSubtype:v7];
      }
    }
  }
  uint64_t v7 = 0;
  unsigned int v15 = 0;
  return (id)[objc_alloc(MEMORY[0x263F127B0]) initWithCPUType:v15 cpuSubtype:v7];
}

- (MTLArchitecture)architecture
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263F127B0]), "initWithCPUType:cpuSubtype:revision:", 16777235, *((unsigned int *)self->_impl + 1960), -[AGXG17FamilyDevice gpuRevisionName](self, "gpuRevisionName"));

  return (MTLArchitecture *)v2;
}

- (MTLTargetDeviceArchitecture)targetDeviceArchitecture
{
  uint64_t v3 = objc_opt_new();
  [v3 setCpuType:16777235];
  impl = (unsigned int *)self->_impl;
  [v3 setSubType:impl[1960]];
  [v3 setDriverVersion:impl[1962]];
  [v3 setVersion:*((unsigned int *)self->_impl + 1966)];

  return (MTLTargetDeviceArchitecture *)v3;
}

- (const)targetDeviceInfo
{
  return (const MTLTargetDeviceArch *)((char *)self->_impl + 7840);
}

- (unint64_t)featureProfile
{
  return 11;
}

- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes
{
  return 16;
}

- (unint64_t)deviceLinearTextureAlignmentBytes
{
  return 16;
}

- (unint64_t)doubleFPConfig
{
  return 0;
}

- (unint64_t)singleFPConfig
{
  return 84;
}

- (unint64_t)halfFPConfig
{
  return *((void *)self->_impl + 1002);
}

- (id)compiler
{
  return (id)**((void **)self->_impl + 751);
}

- (BOOL)supportsHeapWithAddressRanges
{
  return 1;
}

- (BOOL)supportsBufferWithAddressRanges
{
  return 1;
}

- (BOOL)supportsIntersectionFunctionBuffers
{
  return 0;
}

- (BOOL)supportsVirtualSubstreams
{
  return 1;
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return 1016;
}

- (BOOL)supportsExplicitVisibilityGroups
{
  return 1;
}

- (BOOL)supportsBGR10A2
{
  return 0;
}

- (BOOL)isFixedLinePointFillDepthGradientSupported
{
  return 1;
}

- (BOOL)supportsMeshShaders
{
  return 1;
}

- (unint64_t)getSupportedCommandBufferErrorOptions
{
  return *((void *)self->_impl + 984);
}

- (BOOL)supportsGlobalVariableRelocationRender
{
  return 1;
}

- (BOOL)supportsGlobalVariableRelocation
{
  return 1;
}

- (BOOL)supportsStreamingCodecSignaling
{
  return 0;
}

- (BOOL)supportsLateEvalEvent
{
  return 1;
}

- (BOOL)supportsTLS
{
  return 1;
}

- (BOOL)supportsExtendedSamplerLODBiasRange
{
  return 1;
}

- (BOOL)supportsDynamicLibraries
{
  return 1;
}

- (BOOL)isAnisoSampleFixSupported
{
  return 1;
}

- (BOOL)supportsPerPlaneCompression
{
  return 1;
}

- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3
{
  return a3 < 9;
}

- (BOOL)supportsVertexAmplification
{
  return 1;
}

- (unint64_t)maxVisibilityQueryOffset
{
  return 262136;
}

- (unint64_t)maxIndirectBuffers
{
  return 500000;
}

- (unint64_t)maxIndirectTextures
{
  return 500000;
}

- (unint64_t)maxComputeTextures
{
  return 128;
}

- (unint64_t)maxFragmentTextures
{
  return 128;
}

- (unint64_t)maxVertexTextures
{
  return 128;
}

- (BOOL)supportsComputeCompressedTextureWrite
{
  return 1;
}

- (BOOL)supportsDeadlineProfile
{
  return 1;
}

- (BOOL)supportsAtomicFloat
{
  return 1;
}

- (BOOL)supportsAtomicUlongVoidMinMax
{
  return 1;
}

- (BOOL)isTileSizeIndependentVaryingsSupported
{
  return 0;
}

- (BOOL)supportsPartialRenderMemoryBarrier
{
  return 1;
}

- (BOOL)supportsShaderMinLODClamp
{
  return 1;
}

- (BOOL)isMagicMipmapSupported
{
  return 0;
}

- (BOOL)isASTCPixelFormatsSupported
{
  return 1;
}

- (BOOL)isRGB10A2GammaSupported
{
  return 1;
}

- (BOOL)isMsaa32bSupported
{
  return 1;
}

- (BOOL)isFloat32FilteringSupported
{
  return 1;
}

- (BOOL)supportsMemoryOrderAtomics
{
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyDevice;
  return [(_MTLDevice *)&v3 supportsMemoryOrderAtomics];
}

- (BOOL)supportsLargeFramebufferConfigs
{
  return 1;
}

- (BOOL)supportsBufferBoundsChecking
{
  return 1;
}

- (BOOL)supportsQueryTextureLOD
{
  return 1;
}

- (BOOL)supportsShaderBarycentricCoordinates
{
  return 1;
}

- (BOOL)supportsBCTextureCompression
{
  return 1;
}

- (BOOL)supportsSamplerAddressModeClampToHalfBorder
{
  return 1;
}

- (BOOL)supportsCustomBorderColor
{
  return 1;
}

- (BOOL)supportsMirrorClampToEdgeSamplerMode
{
  return 1;
}

- (BOOL)supportsBlackOrWhiteSamplerBorderColors
{
  return 1;
}

- (BOOL)supportsTexture2DMultisampleArray
{
  return 1;
}

- (BOOL)supports32bpcMSAATextures
{
  return 1;
}

- (BOOL)supportsBufferlessClientStorageTexture
{
  return 0;
}

- (BOOL)supportsMemorylessRenderTargets
{
  return 1;
}

- (BOOL)supportsFragmentOnlyEncoders
{
  return 1;
}

- (BOOL)supportsPrimitiveType:(unint64_t)a3
{
  return a3 < 7;
}

- (unsigned)cmdBufArgsSize
{
  return 56;
}

- (id)gpuRevisionName
{
  impl = (unsigned int *)self->_impl;
  if (impl) {
    return (id)[NSString stringWithUTF8String:kAGXGPURevName[impl[1467]]];
  }
  else {
    return 0;
  }
}

- (unsigned)gpuCoreCount
{
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  if (!*((unsigned char *)impl + 5979)) {
    return impl[1469];
  }
  uint64_t v3 = 1484;
  if (*((_OWORD *)impl + 371) == 0) {
    uint64_t v3 = 1488;
  }
  int32x2_t v4 = vmovn_s64((int64x2_t)vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)&impl[v3])))));
  return vadd_s32(vdup_lane_s32(v4, 1), v4).u32[0];
}

- (id)productName
{
  return &stru_26F8544F8;
}

- (id)familyName
{
  return @"A17";
}

- (id)vendorName
{
  return @"Apple";
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl)
  {
    int32x2_t v4 = *((void *)impl + 923);
    if (v4) {
      dispatch_release(v4);
    }
    uint64_t v5 = *((void *)impl + 922);
    if (v5) {
      dispatch_release(v5);
    }
    uint64_t v6 = AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::~Device((uint64_t)impl);
    MEMORY[0x24566ED90](v6, 0x10F0C40176D463ALL);
  }
  cdmSubstreamProcessor = self->cdmSubstreamProcessor;
  if (cdmSubstreamProcessor) {
    (*(void (**)(void *, SEL))(*(void *)cdmSubstreamProcessor + 8))(cdmSubstreamProcessor, a2);
  }
  [(AGXG17FamilyDevice *)self _deregisterForSignpostEnablement];

  v8.receiver = self;
  v8.super_class = (Class)AGXG17FamilyDevice;
  [(IOGPUMetalDevice *)&v8 dealloc];
}

- (void)shrinkHeaps
{
  impl = self->_impl;
  if (impl)
  {
    uint64_t v3 = impl[650];
    bos_unfair_lock_t lock = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    unint64_t v9 = ___ZN3AGX4HeapILb1EE6shrinkEv_block_invoke;
    uint64_t v10 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v11 = impl + 648;
    dispatch_sync(v3, &block);
    int32x2_t v4 = impl[671];
    bos_unfair_lock_t lock = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    unint64_t v9 = ___ZN3AGX4HeapILb1EE6shrinkEv_block_invoke;
    uint64_t v10 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v11 = impl + 669;
    dispatch_sync(v4, &block);
    uint64_t v5 = impl[692];
    bos_unfair_lock_t lock = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    unint64_t v9 = ___ZN3AGX4HeapILb1EE6shrinkEv_block_invoke;
    uint64_t v10 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v11 = impl + 690;
    dispatch_sync(v5, &block);
    uint64_t v6 = impl[713];
    bos_unfair_lock_t lock = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    unint64_t v9 = ___ZN3AGX4HeapILb1EE6shrinkEv_block_invoke;
    uint64_t v10 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v11 = impl + 711;
    dispatch_sync(v6, &block);
  }
}

- (void)_purgeDevice
{
  impl = self->_impl;
  if (impl) {
    AGX::Device<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::purgeDevice((uint64_t)impl, 1.0);
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyDevice;
  [(IOGPUMetalDevice *)&v4 _purgeDevice];
}

- (void)_decrementCommandQueueCount
{
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyDevice;
  [(_MTLDevice *)&v3 _decrementCommandQueueCount];
  atomic_fetch_add((atomic_ushort *volatile)&self->_telemetry.commandQsInFlight, 0xFFFFu);
}

- (void)_incrementCommandQueueCount
{
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyDevice;
  [(_MTLDevice *)&v3 _incrementCommandQueueCount];
  atomic_fetch_add((atomic_ushort *volatile)&self->_telemetry.commandQsInFlight, 1u);
}

- (void)_deregisterForSignpostEnablement
{
  {
    id signpostEnablementCallback = self->_signpostEnablementCallback;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___ZN3AGX35agxaSignpostDeregisterForEnablementEU13block_pointerFvbE_block_invoke;
    v5[3] = &unk_265171458;
    v5[4] = signpostEnablementCallback;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    LOWORD(v5[0]) = 0;
    _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: signpost enablement notifications queue is uninitialized", (uint8_t *)v5, 2u);
  }
  id v4 = self->_signpostEnablementCallback;

  _Block_release(v4);
}

- (void)_registerForSignpostEnablement
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__AGXG17FamilyDevice__registerForSignpostEnablement__block_invoke;
  aBlock[3] = &unk_26516E9C8;
  aBlock[4] = self;
  objc_super v3 = _Block_copy(aBlock);
  self->_id signpostEnablementCallback = v3;
  AGX::agxaSignpostRegisterForEnablement((uint64_t)v3);
}

uint64_t __52__AGXG17FamilyDevice__registerForSignpostEnablement__block_invoke(uint64_t result, int a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v2 = result;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(result + 32) + 1784));
    [*(id *)(*(void *)(v2 + 32) + 1776) compact];
    objc_super v3 = (void *)[*(id *)(*(void *)(v2 + 32) + 1776) allObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v2 + 32) + 1784));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    $7DEDF3842AEFB7F1E6DF5AF62E424A02 result = [v3 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v26;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v26 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(uint64_t **)(*((void *)&v25 + 1) + 8 * v6);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v7 label]) {
            else
            }
              BOOL v8 = 1;
            if (!v8)
            {
              {
                uint64_t v10 = objc_msgSend((id)objc_msgSend(v7, "label"), "UTF8String");
                int v11 = *(_DWORD *)(v7[10] + 2344);
                *(_DWORD *)buf = 136446466;
                uint64_t v30 = v10;
                __int16 v31 = 1026;
                int v32 = v11;
                int v12 = v9;
                unint64_t v13 = "ComputePipelineLabel";
                BOOL v14 = "Label=%{public,signpost.description:attribute}s ID=%{public,signpost.description:attribute}u";
                uint32_t v15 = 18;
LABEL_6:
                _os_signpost_emit_with_name_impl(&dword_2427AD000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v13, v14, buf, v15);
                goto LABEL_7;
              }
            }
            goto LABEL_7;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ![v7 label]) {
            goto LABEL_7;
          }
          long long v16 = v7 + 18;
          uint64_t v17 = v7[19];
          if (v17)
          {
            int v18 = *(_DWORD *)(v17 + 2344);
            uint64_t v19 = *v16;
            if (*v16) {
              goto LABEL_22;
            }
          }
          else
          {
            int v18 = -1;
            uint64_t v19 = *v16;
            if (*v16)
            {
LABEL_22:
              int v20 = *(_DWORD *)(v19 + 2344);
              uint64_t v21 = v7[20];
              if (!v21) {
                goto LABEL_26;
              }
              goto LABEL_23;
            }
          }
          int v20 = -1;
          uint64_t v21 = v7[20];
          if (!v21)
          {
LABEL_26:
            int v22 = -1;
            goto LABEL_27;
          }
LABEL_23:
          int v22 = *(_DWORD *)(v21 + 2344);
LABEL_27:
          {
            {
              uint64_t v24 = objc_msgSend((id)objc_msgSend(v7, "label"), "UTF8String");
              *(_DWORD *)buf = 136446978;
              uint64_t v30 = v24;
              __int16 v31 = 1026;
              int v32 = v18;
              __int16 v33 = 1026;
              int v34 = v20;
              __int16 v35 = 1026;
              int v36 = v22;
              int v12 = v23;
              unint64_t v13 = "RenderPipelineLabel";
              BOOL v14 = "Label=%{public,signpost.description:attribute}s VertexID=%{public,signpost.description:attribute}u F"
                    "ragmentID=%{public,signpost.description:attribute}u TileID=%{public,signpost.description:attribute}u";
              uint32_t v15 = 30;
              goto LABEL_6;
            }
          }
LABEL_7:
          ++v6;
        }
        while (v4 != v6);
        $7DEDF3842AEFB7F1E6DF5AF62E424A02 result = [v3 countByEnumeratingWithState:&v25 objects:v37 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (AGXG17FamilyDevice)initWithAcceleratorPort:(unsigned int)a3 simultaneousInstances:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  gatherDeviceOptions(AGX::HAL200::Device *,NSString **,NSString **)::deviceOptions = 0;
  if (gatherDeviceOptions(AGX::HAL200::Device *,NSString **,NSString **)::once != -1) {
    dispatch_once(&gatherDeviceOptions(AGX::HAL200::Device *,NSString **,NSString **)::once, &__block_literal_global_1656);
  }
  v7.receiver = self;
  v7.super_class = (Class)AGXG17FamilyDevice;
  if ([(IOGPUMetalDevice *)&v7 initWithAcceleratorPort:v4 options:(unsigned __int16)gatherDeviceOptions(AGX::HAL200::Device *,NSString **,NSString **)::kernelOptions])
  {
    operator new();
  }
  return 0;
}

- (id)allocResidencySet
{
  return [AGXG17FamilyResidencySet alloc];
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  uint64_t v4 = [(IOGPUMetalDevice *)self deviceRef];
  uint64_t v5 = [AGXG17FamilyDeadlineProfile alloc];

  return [(AGXG17FamilyDeadlineProfile *)v5 initWithDevice:v4 executionSize:a3];
}

- (unint64_t)bufferRobustnessSupport
{
  if ([(AGXG17FamilyDevice *)self supportsBufferBoundsChecking]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)newLateEvalEvent
{
  {
  }
  objc_super v3 = [AGXG17FamilyLateEvalEvent alloc];

  return [(_IOGPUMetalMTLLateEvalEvent *)v3 initWithDevice:self];
}

@end