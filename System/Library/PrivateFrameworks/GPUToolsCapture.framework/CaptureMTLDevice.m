@interface CaptureMTLDevice
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3;
- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats;
- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6;
- (BOOL)areBarycentricCoordsSupported;
- (BOOL)areGPUAssertionsEnabled;
- (BOOL)areProgrammableSamplePositionsSupported;
- (BOOL)areRasterOrderGroupsSupported;
- (BOOL)areWritableHeapsEnabled;
- (BOOL)bufferPinningEnabled;
- (BOOL)captureRaytracingEnabled;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)copyShaderCacheToPath:(id)a3;
- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3;
- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3;
- (BOOL)isBCTextureCompressionSupported;
- (BOOL)isClampToHalfBorderSupported;
- (BOOL)isCompatibleWithAccelerationStructure:(id)a3;
- (BOOL)isCustomBorderColorSupported;
- (BOOL)isFixedLinePointFillDepthGradientSupported;
- (BOOL)isFloat32FilteringSupported;
- (BOOL)isLargeMRTSupported;
- (BOOL)isMsaa32bSupported;
- (BOOL)isPlacementHeapSupported;
- (BOOL)isQuadDataSharingSupported;
- (BOOL)isRGB10A2GammaSupported;
- (BOOL)isRTZRoundingSupported;
- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6;
- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5;
- (BOOL)metalAssertionsEnabled;
- (BOOL)newCaptureDepthStencilState:(id *)a3 associatedWithBaseDepthStencilState:(id)a4;
- (BOOL)newCaptureFunction:(id *)a3 associatedWithBaseFunction:(id)a4 captureLibrary:(id)a5;
- (BOOL)newCaptureSamplerState:(id *)a3 associatedWithBaseSamplerState:(id)a4;
- (BOOL)requiresBFloat16Emulation;
- (BOOL)requiresRaytracingEmulation;
- (BOOL)reserveGPUAddressRange:(_NSRange)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shaderDebugInfoCaching;
- (BOOL)supportPriorityBand;
- (BOOL)supportsCounterSampling:(unint64_t)a3;
- (BOOL)supportsFamily:(int64_t)a3;
- (BOOL)supportsFeatureSet:(unint64_t)a3;
- (BOOL)supportsPrimitiveType:(unint64_t)a3;
- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3;
- (BOOL)supportsSampleCount:(unint64_t)a3;
- (BOOL)supportsTextureSampleCount:(unint64_t)a3;
- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3;
- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3;
- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5;
- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4;
- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4;
- (CaptureMTLDevice)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4;
- (GTResourceDownloader)downloader;
- (GTResourceHarvester)harvester;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities;
- (MTLArchitecture)architecture;
- (MTLComputePipelineState)computePipelineCopyBuffer;
- (MTLComputePipelineState)computePipelineCopyIndirectCommandBuffer;
- (MTLDevice)baseObject;
- (MTLFunction)computeFunctionCopyIndirectCommandBuffer;
- (MTLFunction)renderFunctionCopyIndirectCommandBuffer;
- (MTLGPUBVHBuilder)GPUBVHBuilder;
- (MTLRenderPipelineState)renderPipelineCopyBuffer;
- (MTLRenderPipelineState)renderPipelineCopyIndirectCommandBuffer;
- (MTLSharedEventListener)captureEventListener;
- (MTLTargetDeviceArchitecture)targetDeviceArchitecture;
- (NSArray)counterSets;
- (NSString)description;
- (NSString)name;
- (OS_dispatch_group)dispatchGroup;
- (const)limits;
- (const)targetDeviceInfo;
- (float)maxLineWidth;
- (float)maxPointSize;
- (id)copyIOSurfaceSharedTextureProperties:(id)a3;
- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5;
- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4;
- (id)dummyArgumentEncoder;
- (id)dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeICBIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:(id)a3 withMeshDescriptor:(id)a4;
- (id)dummyEncodeSamplerIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeTextureIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4;
- (id)endCollectingPipelineDescriptors;
- (id)familyName;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)getRawBVHBuilderPtr;
- (id)indirectArgumentBufferDecodingData;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4;
- (id)newArgumentEncoderWithArguments:(id)a3;
- (id)newArgumentEncoderWithBufferBinding:(id)a3;
- (id)newArgumentEncoderWithLayout:(id)a3;
- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4;
- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7;
- (id)newBufferWithDescriptor:(id)a3;
- (id)newBufferWithIOSurface:(__IOSurface *)a3;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5;
- (id)newCommandQueue;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3;
- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDagStringWithGraphs:(id)a3;
- (id)newDefaultLibrary;
- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4;
- (id)newDepthStencilStateWithDescriptor:(id)a3;
- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5;
- (id)newDynamicLibrary:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryFromURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newEvent;
- (id)newEventWithOptions:(int64_t)a3;
- (id)newFence;
- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newHeapWithDescriptor:(id)a3;
- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4;
- (id)newIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5;
- (id)newIOFileHandleWithURL:(id)a3 error:(id *)a4;
- (id)newIOHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5;
- (id)newIOHandleWithURL:(id)a3 error:(id *)a4;
- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3;
- (id)newIndirectArgumentEncoderWithArguments:(id)a3;
- (id)newIndirectArgumentEncoderWithLayout:(id)a3;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3;
- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newLateEvalEvent;
- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithCIFiltersForComputePipeline:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5;
- (id)newLibraryWithData:(id)a3 error:(id *)a4;
- (id)newLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (id)newLibraryWithDescriptorSPI:(id)a3 error:(id *)a4;
- (id)newLibraryWithFile:(id)a3 error:(id *)a4;
- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4;
- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4;
- (id)newLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4;
- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4;
- (id)newProfileWithExecutionSize:(unint64_t)a3;
- (id)newRasterizationRateMapWithDescriptor:(id)a3;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4;
- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4;
- (id)newSamplerStateWithDescriptor:(id)a3;
- (id)newSharedEvent;
- (id)newSharedEventWithHandle:(id)a3;
- (id)newSharedEventWithMachPort:(unsigned int)a3;
- (id)newSharedEventWithOptions:(int64_t)a3;
- (id)newSharedTextureWithDescriptor:(id)a3;
- (id)newSharedTextureWithHandle:(id)a3;
- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4;
- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newTileRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)originalObject;
- (id)productName;
- (id)serializeTileRenderPipelineDescriptor:(id)a3;
- (id)vendorName;
- (int64_t)currentPerformanceState;
- (int64_t)defaultTextureWriteRoundingMode;
- (os_unfair_lock_s)getBVHBuilderLock;
- (unint64_t)argumentBuffersSupport;
- (unint64_t)bufferRobustnessSupport;
- (unint64_t)commandBufferErrorOptions;
- (unint64_t)currentAllocatedSize;
- (unint64_t)dedicatedMemorySize;
- (unint64_t)deviceCreationFlags;
- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes;
- (unint64_t)deviceLinearTextureAlignmentBytes;
- (unint64_t)doubleFPConfig;
- (unint64_t)featureProfile;
- (unint64_t)halfFPConfig;
- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes;
- (unint64_t)iosurfaceTextureAlignmentBytes;
- (unint64_t)latestSupportedGenericBVHVersion;
- (unint64_t)linearTextureAlignmentBytes;
- (unint64_t)linearTextureArrayAlignmentBytes;
- (unint64_t)linearTextureArrayAlignmentSlice;
- (unint64_t)maxAccelerationStructureLevels;
- (unint64_t)maxAccelerationStructureTraversalDepth;
- (unint64_t)maxArgumentBufferSamplerCount;
- (unint64_t)maxBufferLength;
- (unint64_t)maxColorAttachments;
- (unint64_t)maxComputeAttributes;
- (unint64_t)maxComputeBuffers;
- (unint64_t)maxComputeInlineDataSize;
- (unint64_t)maxComputeLocalMemorySizes;
- (unint64_t)maxComputeSamplers;
- (unint64_t)maxComputeTextures;
- (unint64_t)maxComputeThreadgroupMemory;
- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes;
- (unint64_t)maxCustomSamplePositions;
- (unint64_t)maxFenceInstances;
- (unint64_t)maxFragmentBuffers;
- (unint64_t)maxFragmentInlineDataSize;
- (unint64_t)maxFragmentSamplers;
- (unint64_t)maxFragmentTextures;
- (unint64_t)maxFramebufferStorageBits;
- (unint64_t)maxFunctionConstantIndices;
- (unint64_t)maxIOCommandsInFlight;
- (unint64_t)maxIndirectBuffers;
- (unint64_t)maxIndirectSamplers;
- (unint64_t)maxIndirectSamplersPerDevice;
- (unint64_t)maxIndirectTextures;
- (unint64_t)maxInterpolants;
- (unint64_t)maxInterpolatedComponents;
- (unint64_t)maxPredicatedNestingDepth;
- (unint64_t)maxRasterizationRateLayerCount;
- (unint64_t)maxTessellationFactor;
- (unint64_t)maxTextureBufferWidth;
- (unint64_t)maxTextureDepth3D;
- (unint64_t)maxTextureDimensionCube;
- (unint64_t)maxTextureHeight2D;
- (unint64_t)maxTextureHeight3D;
- (unint64_t)maxTextureLayers;
- (unint64_t)maxTextureWidth1D;
- (unint64_t)maxTextureWidth2D;
- (unint64_t)maxTextureWidth3D;
- (unint64_t)maxThreadgroupMemoryLength;
- (unint64_t)maxTileBuffers;
- (unint64_t)maxTileInlineDataSize;
- (unint64_t)maxTileSamplers;
- (unint64_t)maxTileTextures;
- (unint64_t)maxTotalComputeThreadsPerThreadgroup;
- (unint64_t)maxVertexAmplificationCount;
- (unint64_t)maxVertexAmplificationFactor;
- (unint64_t)maxVertexAttributes;
- (unint64_t)maxVertexBuffers;
- (unint64_t)maxVertexInlineDataSize;
- (unint64_t)maxVertexSamplers;
- (unint64_t)maxVertexTextures;
- (unint64_t)maxViewportCount;
- (unint64_t)maxVisibilityQueryOffset;
- (unint64_t)minBufferNoCopyAlignmentBytes;
- (unint64_t)minConstantBufferAlignmentBytes;
- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)minTilePixels;
- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)minimumTextureBufferAlignmentForPixelFormat:(unint64_t)a3;
- (unint64_t)readWriteTextureSupport;
- (unint64_t)recommendedMaxWorkingSetSize;
- (unint64_t)registryID;
- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3;
- (unint64_t)sharedMemorySize;
- (unint64_t)singleFPConfig;
- (unint64_t)sparseTexturesSupport;
- (unint64_t)sparseTileSizeInBytes;
- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3;
- (unint64_t)streamReference;
- (unsigned)acceleratorPort;
- (unsigned)maximumComputeSubstreams;
- (void)_initArgumentBufferPatchingTypes;
- (void)_initDummyEncoder;
- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 destinationBinaryArchive:(id)a5 error:(id *)a6;
- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 error:(id *)a5;
- (void)compilerPropagatesThreadPriority:(BOOL)a3;
- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7;
- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6;
- (void)dealloc;
- (void)deallocateResource:(id)a3;
- (void)deserializeCompileTimeStats:(id)a3 addToDictionary:(id)a4;
- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5;
- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4;
- (void)getShaderCacheKeys;
- (void)invalidateHarvester;
- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newLibraryWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)purgeDeallocatedObjects;
- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5;
- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4;
- (void)setCommandBufferErrorOptions:(unint64_t)a3;
- (void)setGPUAssertionsEnabled:(BOOL)a3;
- (void)setIndirectArgumentBufferDecodingData:(id)a3;
- (void)setMetalAssertionsEnabled:(BOOL)a3;
- (void)setRawBVHBuilderPtr:(id)a3;
- (void)setShaderDebugInfoCaching:(BOOL)a3;
- (void)setWritableHeapsEnabled:(BOOL)a3;
- (void)setupMPSFunctionTable:(MPSFunctionTable *)a3;
- (void)startCollectingPipelineDescriptors;
- (void)startCollectingPipelineDescriptorsUsingPrefixForNames:(id)a3;
- (void)touch;
- (void)unloadShaderCaches;
- (void)unmapShaderSampleBuffer;
@end

@implementation CaptureMTLDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSamplerStateMap, 0);
  objc_storeStrong((id *)&self->_cachedFunctionMap, 0);
  objc_storeStrong((id *)&self->_cachedDepthStencilStateMap, 0);
  objc_storeStrong((id *)&self->_retainObjects, 0);
  objc_storeStrong((id *)&self->_dummyArgumentEncoder, 0);
  objc_storeStrong((id *)&self->_eventListener, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_computePipelineCopyBuffer, 0);
  objc_storeStrong((id *)&self->_computePipelineCopyIndirectCommandBuffer, 0);
  objc_storeStrong((id *)&self->_renderPipelineCopyBuffer, 0);
  objc_storeStrong((id *)&self->_renderPipelineCopyIndirectCommandBuffer, 0);
  objc_storeStrong((id *)&self->_computeFunctionCopyIndirectCommandBuffer, 0);
  objc_storeStrong((id *)&self->_renderFunctionCopyIndirectCommandBuffer, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (GTResourceHarvester)harvester
{
  return self->_harvester;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  if ((qword_2501C8 & 0x200) != 0)
  {
    id v5 = [v4 copy];

    [v5 setCompressionType:0];
    [v5 setCompressionMode:2];
    id v4 = v5;
  }
  id v6 = [(MTLDeviceSPI *)self->_baseObject heapTextureSizeAndAlignWithDescriptor:v4];
  unint64_t v8 = v7;
  uint64_t v9 = v22;
  *(_DWORD *)(v22 + 8) = -16112;
  char v10 = BYTE9(v23);
  if (BYTE9(v23) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v13 = BYTE10(v23);
    ++BYTE10(v23);
    v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v22 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    v11 = (char *)(v9 + BYTE9(v23));
    BYTE9(v23) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  v14 = [(CaptureMTLDevice *)self traceStream];
  if (v14) {
    unint64_t var0 = v14->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v16 = SaveMTLTextureDescriptor((uint64_t)&v21, v4);
  *(void *)v11 = var0;
  *((void *)v11 + 1) = v6;
  *((void *)v11 + 2) = v8;
  v11[24] = v16;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;

  unint64_t v19 = (unint64_t)v6;
  unint64_t v20 = v8;
  result.var1 = v20;
  result.unint64_t var0 = v19;
  return result;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  id v8 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  traceContext = self->_traceContext;
  long long v30 = (unint64_t)traceContext;
  *(void *)&long long v31 = 0;
  *((void *)&v31 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v11 = v10;
  uint64_t v12 = *v10;
  *char v10 = v13;
  *(void *)&long long v32 = v12;
  BYTE8(v32) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v32 + 9) = 16400;
  *(_DWORD *)((char *)&v32 + 11) = 0;
  HIBYTE(v32) = 0;
  baseObject = self->_baseObject;
  v15 = [v8 baseObject];
  id v16 = [(MTLDeviceSPI *)baseObject newAccelerationStructureWithBuffer:v15 offset:a4 resourceIndex:a5];

  if (v16) {
    uint64_t v17 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v16 captureDevice:self captureBuffer:v8];
  }
  else {
    uint64_t v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v30, (uint64_t)[(CaptureMTLAccelerationStructure *)v17 traceStream]);
  uint64_t v18 = v31;
  *(_DWORD *)(v31 + 8) = -15359;
  char v19 = BYTE9(v32);
  if (BYTE9(v32) > 0x18uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 24);
    uint64_t v22 = BYTE10(v32);
    ++BYTE10(v32);
    unint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v31 + 1), v22 | 0x2800000000) + 16;
    char v19 = v22;
  }
  else
  {
    unint64_t v20 = (char *)(v18 + BYTE9(v32));
    BYTE9(v32) += 40;
  }
  *(unsigned char *)(v18 + 13) = v19;
  SaveMTLAccelerationStructureInfo((uint64_t)&v30, v16);
  long long v23 = [(CaptureMTLDevice *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v25 = [(CaptureMTLAccelerationStructure *)v17 traceStream];
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0;
  }
  v27 = (uint64_t *)[v8 traceStream];
  if (v27) {
    uint64_t v28 = *v27;
  }
  else {
    uint64_t v28 = 0;
  }
  *(void *)unint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = v28;
  *((void *)v20 + 3) = a4;
  *((void *)v20 + 4) = a5;
  uint64_t *v11 = v32;
  *((unsigned char *)v11 + 8) = BYTE8(v32);
  *(unsigned char *)(v31 + 15) |= 8u;

  return v17;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  id v6 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v30 = v10;
  BYTE8(v30) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  baseObject = self->_baseObject;
  uint64_t v13 = [v6 baseObject];
  id v14 = [(MTLDeviceSPI *)baseObject newAccelerationStructureWithBuffer:v13 offset:a4];

  if (v14) {
    v15 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v14 captureDevice:self captureBuffer:v6];
  }
  else {
    v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLAccelerationStructure *)v15 traceStream]);
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15464;
  char v17 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v20 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v29 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  SaveMTLAccelerationStructureInfo((uint64_t)&v28, v14);
  uint64_t v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v23 = [(CaptureMTLAccelerationStructure *)v15 traceStream];
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0;
  }
  v25 = (uint64_t *)[v6 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0;
  }
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = v26;
  *((void *)v18 + 3) = a4;
  *uint64_t v9 = v30;
  *((unsigned char *)v9 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newHeapWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  unint64_t v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v30 = v8;
  BYTE8(v30) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  if ([v4 type] == (char *)&def_CFBEC + 2) {
    goto LABEL_11;
  }
  if ((qword_2501C8 & 0x4000) != 0)
  {
    if (newHeapWithDescriptor__onceToken != -1) {
      dispatch_once(&newHeapWithDescriptor__onceToken, &__block_literal_global_425);
    }
    id v10 = [v4 copy];

    uint64_t v13 = v10;
    uint64_t v12 = 1;
  }
  else
  {
    if ((qword_2501C8 & 0x8000) == 0) {
      goto LABEL_11;
    }
    if (newHeapWithDescriptor__onceToken_158 != -1) {
      dispatch_once(&newHeapWithDescriptor__onceToken_158, &__block_literal_global_160);
    }
    id v10 = [v4 copy];

    [v10 setType:0];
    unint64_t v11 = (unint64_t)[v10 size];
    uint64_t v12 = v11 & ((uint64_t)(__int16)qword_2501C8 >> 15);
    uint64_t v13 = v10;
  }
  [v13 setSize:v12];
  id v4 = v10;
LABEL_11:
  id v14 = [(MTLDeviceSPI *)self->_baseObject newHeapWithDescriptor:v4];
  if (v14) {
    v15 = [[CaptureMTLHeap alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLHeap *)v15 traceStream]);
  if (self->_bufferPinningEnabled && [v4 type] != (char *)&def_CFBEC + 2)
  {
    id v16 = [v4 copy];

    objc_msgSend(v16, "setPinnedGPUAddress:", objc_msgSend(v14, "gpuAddress"));
    id v4 = v16;
  }
  uint64_t v17 = v29;
  *(_DWORD *)(v29 + 8) = -16120;
  char v18 = BYTE9(v30);
  if (BYTE9(v30) > 0x28uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v21 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x1800000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v30));
    BYTE9(v30) += 24;
  }
  *(unsigned char *)(v17 + 13) = v18;
  uint64_t v22 = [(CaptureMTLDevice *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v24 = [(CaptureMTLHeap *)v15 traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  char v26 = SaveMTLHeapDescriptor((uint64_t)&v28, v4);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  v19[16] = v26;
  *(_DWORD *)(v19 + 17) = 0;
  *((_DWORD *)v19 + 5) = 0;
  *unint64_t v7 = v30;
  *((unsigned char *)v7 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;

  return v15;
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(MTLDeviceSPI *)self->_baseObject newSamplerStateWithDescriptor:v4];
  id v25 = 0;
  if (v5
    && ![(CaptureMTLDevice *)self newCaptureSamplerState:&v25 associatedWithBaseSamplerState:v5])
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(CaptureMTLDevice *)self dummyEncodeSamplerIntoArgumentBufferForResourceIndex:v5 withDescriptor:v4];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    traceContext = self->_traceContext;
    objc_msgSend(v25, "traceStream", 0);
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v22);
    uint64_t v8 = v23;
    *(_DWORD *)(v23 + 8) = -16309;
    char v9 = BYTE9(v24);
    if (BYTE9(v24) > 0x28uLL)
    {
      uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 24);
      uint64_t v12 = BYTE10(v24);
      ++BYTE10(v24);
      id v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v23 + 1), v12 | 0x1800000000) + 16;
      char v9 = v12;
    }
    else
    {
      id v10 = (char *)(v8 + BYTE9(v24));
      BYTE9(v24) += 24;
    }
    *(unsigned char *)(v8 + 13) = v9;
    SaveMTLSamplerStateInfo((uint64_t)&v22, v5);
    uint64_t v13 = [(CaptureMTLDevice *)self traceStream];
    if (v13) {
      unint64_t var0 = v13->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v15 = (uint64_t *)[v25 traceStream];
    if (v15) {
      uint64_t v16 = *v15;
    }
    else {
      uint64_t v16 = 0;
    }
    char v17 = SaveMTLSamplerDescriptor((uint64_t)&v22, v6);
    *(void *)id v10 = var0;
    *((void *)v10 + 1) = v16;
    v10[16] = v17;
    *(_DWORD *)(v10 + 17) = 0;
    *((_DWORD *)v10 + 5) = 0;
    s();
    *(void *)uint64_t v18 = v19;
    *(unsigned char *)(v18 + 8) = BYTE8(v24);
    *(unsigned char *)(v23 + 15) |= 8u;
  }
  id v20 = v25;

  return v20;
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(MTLDeviceSPI *)self->_baseObject newDepthStencilStateWithDescriptor:v4];
  id v6 = v5;
  id v25 = 0;
  if (v5)
  {
    if (![(CaptureMTLDevice *)self newCaptureDepthStencilState:&v25 associatedWithBaseDepthStencilState:v5])goto LABEL_14; {
    id v5 = v25;
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  objc_msgSend(v5, "traceStream", 0);
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v22);
  uint64_t v8 = v23;
  *(_DWORD *)(v23 + 8) = -16311;
  char v9 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v12 = BYTE10(v24);
    ++BYTE10(v24);
    id v10 = GTTraceMemPool_allocateBytes(v11, *((uint64_t *)&v23 + 1), v12 | 0x1800000000) + 16;
    char v9 = v12;
  }
  else
  {
    id v10 = (char *)(v8 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v8 + 13) = v9;
  uint64_t v13 = [(CaptureMTLDevice *)self traceStream];
  if (v13) {
    unint64_t var0 = v13->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v15 = (uint64_t *)[v25 traceStream];
  if (v15) {
    uint64_t v16 = *v15;
  }
  else {
    uint64_t v16 = 0;
  }
  char v17 = SaveMTLDepthStencilDescriptor((uint64_t)&v22, v4);
  *(void *)id v10 = var0;
  *((void *)v10 + 1) = v16;
  v10[16] = v17;
  *(_DWORD *)(v10 + 17) = 0;
  *((_DWORD *)v10 + 5) = 0;
  s();
  *(void *)uint64_t v18 = v19;
  *(unsigned char *)(v18 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
LABEL_14:
  id v20 = v25;

  return v20;
}

- (void)reserveResourceIndicesForResourceType:(unint64_t)a3 indices:(unint64_t *)a4 indexCount:(unint64_t)a5
{
}

- (unint64_t)maxIOCommandsInFlight
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxIOCommandsInFlight];
}

- (id)newIOHandleWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newIOHandleWithURL:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLIOFileHandle alloc] initWithBaseObject:v12 captureContext:self->_traceContext];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLIOFileHandle *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15348;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLIOFileHandle *)v13 traceStream];
  if (!v21)
  {
    unint64_t v22 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v22 = v21->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  unsigned __int8 v23 = SaveNSURL((uint64_t)&v25, v6);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  v16[24] = v23;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *char v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)vendorName
{
  return [(MTLDeviceSPI *)self->_baseObject vendorName];
}

- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4
{
  return [(MTLDeviceSPI *)self->_baseObject validateDynamicLibraryURL:a3 error:a4];
}

- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLDeviceSPI *)self->_baseObject validateDynamicLibraryDescriptor:a3 error:a4];
}

- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  baseObject = self->_baseObject;
  uint64_t v8 = [a3 baseObject];
  LOBYTE(a5) = [(MTLDeviceSPI *)baseObject validateDynamicLibrary:v8 state:v6 error:a5];

  return (char)a5;
}

- (void)unmapShaderSampleBuffer
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v12);
  [(MTLDeviceSPI *)self->_baseObject unmapShaderSampleBuffer];
  uint64_t v3 = v13;
  *(_DWORD *)(v13 + 8) = -16295;
  char v4 = BYTE9(v14);
  if (BYTE9(v14) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 24);
    uint64_t v7 = BYTE10(v14);
    ++BYTE10(v14);
    id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v13 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    id v5 = (char *)(v3 + BYTE9(v14));
    BYTE9(v14) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLDevice *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v14);
  *(unsigned char *)(v13 + 15) |= 8u;
}

- (void)unloadShaderCaches
{
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)tileSizeWithSparsePageSize:(SEL)a3 textureType:(int64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  retstr->unint64_t var0 = 0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = 0;
  baseObject = self->_baseObject;
  if (baseObject) {
    [(MTLDeviceSPI *)baseObject tileSizeWithSparsePageSize:a4 textureType:a5 pixelFormat:a6 sampleCount:a7];
  }
  long long v14 = (char *)v24;
  *(_DWORD *)(v24 + 8) = -15796;
  if (BYTE9(v25))
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x4000000000) + 16;
  }
  else
  {
    LOBYTE(v16) = 0;
    BYTE9(v25) = 64;
    uint64_t v17 = v14;
  }
  v14[13] = v16;
  uint64_t v18 = [(CaptureMTLDevice *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = retstr->var2;
  *(void *)uint64_t v17 = var0;
  *(_OWORD *)(v17 + 8) = *(_OWORD *)&retstr->var0;
  *((void *)v17 + 3) = var2;
  *((void *)v17 + 4) = a4;
  *((void *)v17 + 5) = a5;
  *((void *)v17 + 6) = a6;
  *((void *)v17 + 7) = a7;
  s();
  result->unint64_t var0 = v22;
  LOBYTE(result->var1) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
  return result;
}

- (BOOL)supportsVertexAmplificationCount:(unint64_t)a3
{
  return [(MTLDeviceSPI *)self->_baseObject supportsVertexAmplificationCount:a3];
}

- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3
{
  return [(MTLDeviceSPI *)self->_baseObject supportsTextureWriteRoundingMode:a3];
}

- (BOOL)supportsTextureSampleCount:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  unsigned int v5 = [(MTLDeviceSPI *)self->_baseObject supportsTextureSampleCount:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16166;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLDevice *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return v5;
}

- (BOOL)supportsSampleCount:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  unsigned int v5 = [(MTLDeviceSPI *)self->_baseObject supportsSampleCount:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16205;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLDevice *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return v5;
}

- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  unsigned int v5 = [(MTLDeviceSPI *)self->_baseObject supportsRasterizationRateMapWithLayerCount:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15791;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLDevice *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return v5;
}

- (BOOL)supportsFeatureSet:(unint64_t)a3
{
  return [(MTLDeviceSPI *)self->_baseObject supportsFeatureSet:a3];
}

- (BOOL)supportsFamily:(int64_t)a3
{
  return [(MTLDeviceSPI *)self->_baseObject supportsFamily:a3];
}

- (BOOL)supportsCounterSampling:(unint64_t)a3
{
  return [(MTLDeviceSPI *)self->_baseObject supportsCounterSampling:a3];
}

- (void)startCollectingPipelineDescriptorsUsingPrefixForNames:(id)a3
{
}

- (void)startCollectingPipelineDescriptors
{
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5 sparsePageSize:(unint64_t)a6
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v23);
  retstr->unint64_t var0 = 0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = 0;
  baseObject = self->_baseObject;
  if (baseObject) {
    [(MTLDeviceSPI *)baseObject sparseTileSizeWithTextureType:a4 pixelFormat:a5 sampleCount:a6 sparsePageSize:a7];
  }
  uint64_t v14 = (char *)v24;
  *(_DWORD *)(v24 + 8) = -15314;
  if (BYTE9(v25))
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    long long v17 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x4000000000) + 16;
  }
  else
  {
    LOBYTE(v16) = 0;
    BYTE9(v25) = 64;
    long long v17 = v14;
  }
  v14[13] = v16;
  long long v18 = [(CaptureMTLDevice *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = retstr->var2;
  *(void *)long long v17 = var0;
  *(_OWORD *)(v17 + 8) = *(_OWORD *)&retstr->var0;
  *((void *)v17 + 3) = var2;
  *((void *)v17 + 4) = a4;
  *((void *)v17 + 5) = a5;
  *((void *)v17 + 6) = a6;
  *((void *)v17 + 7) = a7;
  s();
  result->unint64_t var0 = v22;
  LOBYTE(result->var1) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
  return result;
}

- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  id v5 = [(MTLDeviceSPI *)self->_baseObject sparseTileSizeInBytesForSparsePageSize:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15315;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLDevice *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- (void)setupMPSFunctionTable:(MPSFunctionTable *)a3
{
}

- (void)setRawBVHBuilderPtr:(id)a3
{
}

- (void)setIndirectArgumentBufferDecodingData:(id)a3
{
}

- (void)setGPUAssertionsEnabled:(BOOL)a3
{
}

- (id)serializeTileRenderPipelineDescriptor:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = unwrapMTLTileRenderPipelineDescriptor(a3);
  id v5 = [(MTLDeviceSPI *)baseObject serializeTileRenderPipelineDescriptor:v4];

  return v5;
}

- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4
{
}

- (unint64_t)resourcePatchingTypeForResourceType:(unint64_t)a3
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject resourcePatchingTypeForResourceType:a3];
}

- (BOOL)reserveGPUAddressRange:(_NSRange)a3
{
  return -[MTLDeviceSPI reserveGPUAddressRange:](self->_baseObject, "reserveGPUAddressRange:", a3.location, a3.length);
}

- (id)productName
{
  return [(MTLDeviceSPI *)self->_baseObject productName];
}

- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(MTLDeviceSPI *)self->_baseObject pipelineCacheStats];
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  baseObject = self->_baseObject;
  id v4 = [a3 copy];
  id v5 = [(MTLDeviceSPI *)baseObject newVisibleFunctionTableWithDescriptor:v4];

  return v5;
}

- (id)newTileRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  baseObject = self->_baseObject;
  id v6 = a3;
  char v7 = [a4 baseObject];
  id v8 = [(MTLDeviceSPI *)baseObject newTileRenderPipelineDescriptorWithSerializedData:v6 deserializationContext:v7];

  return v8;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  id v10 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_newTextureWithDescriptor_iosurface_plane_slice", (uint64_t)"IOSurface texture slices SPI", 0, 0);
  id v11 = [(MTLDeviceSPI *)self->_baseObject newTextureWithDescriptor:v10 iosurface:a4 plane:a5 slice:a6];
  long long v12 = [(CaptureMTLDevice *)self dummyEncodeTextureIntoArgumentBufferForResourceIndex:v11 withDescriptor:v10];

  if (v11) {
    uint64_t v13 = [[CaptureMTLTexture alloc] initWithBaseObject:v11 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  traceContext = self->_traceContext;
  id v9 = a3;
  long long v29 = (unint64_t)traceContext;
  *(void *)&long long v30 = 0;
  *((void *)&v30 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  *id v10 = v13;
  *(void *)&long long v31 = v12;
  BYTE8(v31) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v31 + 9) = 16400;
  *(_DWORD *)((char *)&v31 + 11) = 0;
  HIBYTE(v31) = 0;
  id v14 = [(MTLDeviceSPI *)self->_baseObject newTextureWithDescriptor:v9 iosurface:a4 plane:a5];
  uint64_t v15 = [(CaptureMTLDevice *)self dummyEncodeTextureIntoArgumentBufferForResourceIndex:v14 withDescriptor:v9];

  if (v14) {
    long long v16 = [[CaptureMTLTexture alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    long long v16 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)[(CaptureMTLTexture *)v16 traceStream]);
  uint64_t v17 = v30;
  *(_DWORD *)(v30 + 8) = -16294;
  char v18 = BYTE9(v31);
  if (BYTE9(v31) > 0x20uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 24);
    uint64_t v21 = BYTE10(v31);
    ++BYTE10(v31);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v30 + 1), v21 | 0x2000000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v31));
    BYTE9(v31) += 32;
  }
  *(unsigned char *)(v17 + 13) = v18;
  SaveMTLTextureInfo((uint64_t)&v29, v14);
  unint64_t v22 = [(CaptureMTLDevice *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v24 = [(CaptureMTLTexture *)v16 traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  char v26 = SaveMTLTextureDescriptor((uint64_t)&v29, v15);
  char v27 = SaveIOSurfaceRef((uint64_t)&v29, a4);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a5;
  v19[24] = v26;
  v19[25] = v27;
  *(_DWORD *)(v19 + 26) = 0;
  *((_WORD *)v19 + 15) = 0;
  uint64_t *v11 = v31;
  *((unsigned char *)v11 + 8) = BYTE8(v31);
  *(unsigned char *)(v30 + 15) |= 8u;

  return v16;
}

- (id)newTextureWithDescriptor:(id)a3
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v26 = v8;
  BYTE8(v26) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v10 = [(MTLDeviceSPI *)self->_baseObject newTextureWithDescriptor:v5];
  id v11 = [(CaptureMTLDevice *)self dummyEncodeTextureIntoArgumentBufferForResourceIndex:v10 withDescriptor:v5];

  if (v10) {
    uint64_t v12 = [[CaptureMTLTexture alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v12 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLTexture *)v12 traceStream]);
  uint64_t v13 = v25;
  *(_DWORD *)(v25 + 8) = -16310;
  char v14 = BYTE9(v26);
  if (BYTE9(v26) > 0x20uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v17 = BYTE10(v26);
    ++BYTE10(v26);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v25 + 1), v17 | 0x2000000000) + 16;
    char v14 = v17;
  }
  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v26));
    BYTE9(v26) += 32;
  }
  *(unsigned char *)(v13 + 13) = v14;
  SaveMTLTextureInfo((uint64_t)&v24, v10);
  char v18 = [(CaptureMTLDevice *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v20 = [(CaptureMTLTexture *)v12 traceStream];
  if (v20) {
    unint64_t v21 = v20->var0;
  }
  else {
    unint64_t v21 = 0;
  }
  char v22 = SaveMTLTextureDescriptor((uint64_t)&v24, v11);
  *(void *)uint64_t v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = 0;
  v15[24] = v22;
  *(_DWORD *)(v15 + 25) = 0;
  *((_DWORD *)v15 + 7) = 0;
  *char v7 = v26;
  *((unsigned char *)v7 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v12;
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  id v10 = a6;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  traceContext = self->_traceContext;
  id v12 = a5;
  long long v37 = (unint64_t)traceContext;
  *(void *)&long long v38 = 0;
  *((void *)&v38 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v14 = v13;
  uint64_t v15 = *v13;
  *uint64_t v13 = v16;
  *(void *)&long long v39 = v15;
  BYTE8(v39) = *((unsigned char *)v13 + 8);
  *(_WORD *)((char *)&v39 + 9) = 16400;
  *(_DWORD *)((char *)&v39 + 11) = 0;
  HIBYTE(v39) = 0;
  id v17 = [(MTLDeviceSPI *)self->_baseObject newTextureWithBytesNoCopy:a3 length:a4 descriptor:v12 deallocator:v10];
  char v18 = [(CaptureMTLDevice *)self dummyEncodeTextureIntoArgumentBufferForResourceIndex:v17 withDescriptor:v12];

  if (v17) {
    uint64_t v19 = [[CaptureMTLTexture alloc] initWithBaseObject:v17 captureDevice:self];
  }
  else {
    uint64_t v19 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v37, (uint64_t)[(CaptureMTLTexture *)v19 traceStream]);
  uint64_t v20 = v38;
  *(_DWORD *)(v38 + 8) = -16096;
  char v21 = BYTE9(v39);
  if (BYTE9(v39) > 0x18uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 24);
    v36 = v19;
    unint64_t v24 = a4;
    id v25 = v10;
    long long v26 = v18;
    char v27 = a3;
    uint64_t v28 = BYTE10(v39);
    ++BYTE10(v39);
    char v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v38 + 1), v28 | 0x2800000000) + 16;
    char v21 = v28;
    a3 = v27;
    char v18 = v26;
    id v10 = v25;
    a4 = v24;
    uint64_t v19 = v36;
  }
  else
  {
    char v22 = (char *)(v20 + BYTE9(v39));
    BYTE9(v39) += 40;
  }
  *(unsigned char *)(v20 + 13) = v21;
  SaveMTLTextureInfo((uint64_t)&v37, v17);
  long long v29 = [(CaptureMTLDevice *)self traceStream];
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v31 = [(CaptureMTLTexture *)v19 traceStream];
  if (v31) {
    unint64_t v32 = v31->var0;
  }
  else {
    unint64_t v32 = 0;
  }
  char v33 = TransferBytes((uint64_t)&v37, (uint64_t *)a3, (const void *)a4);
  char v34 = SaveMTLTextureDescriptor((uint64_t)&v37, v18);
  *(void *)char v22 = var0;
  *((void *)v22 + 1) = v32;
  *((void *)v22 + 2) = a4;
  *((void *)v22 + 3) = v10;
  v22[32] = v33;
  v22[33] = v34;
  *(_DWORD *)(v22 + 34) = 0;
  *((_WORD *)v22 + 19) = 0;
  uint64_t *v14 = v39;
  *((unsigned char *)v14 + 8) = BYTE8(v39);
  *(unsigned char *)(v38 + 15) |= 8u;

  return v19;
}

- (id)newTextureLayoutWithDescriptor:(id)a3 isHeapOrBufferBacked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newTextureLayoutWithDescriptor:v6 isHeapOrBufferBacked:v4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLTextureLayout alloc] initWithBaseObject:v12 captureContext:self->_traceContext];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLTextureLayout *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -16099;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v21 = [(CaptureMTLTextureLayout *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLTextureDescriptor((uint64_t)&v25, v6);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((_DWORD *)v16 + 4) = v4;
  v16[20] = v23;
  *(_WORD *)(v16 + 21) = 0;
  v16[23] = 0;
  *uint64_t v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newResidencySetWithDescriptor:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLResidencySet alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLResidencySet *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15245;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v21 = [(CaptureMTLResidencySet *)v13 traceStream];
  if (!v21)
  {
    unint64_t v22 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v22 = v21->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  char v23 = SaveMTLResidencySetDescriptor((uint64_t)&v25, v6);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  v16[24] = v23;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *uint64_t v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v24 = v8;
  BYTE8(v24) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  id v10 = -[MTLDeviceSPI newProfileWithExecutionSize:](self->_baseObject, "newProfileWithExecutionSize:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLDeadlineProfile alloc] initWithBaseObject:v10 captureContext:self->_traceContext];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLDeadlineProfile *)v11 traceStream]);
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -15317;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = [(CaptureMTLDeadlineProfile *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a3;
  *char v7 = v24;
  *((unsigned char *)v7 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v11;
}

- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4
{
  return [(MTLDeviceSPI *)self->_baseObject newPerformanceStateAssertion:a3 error:a4];
}

- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_newLogStateWithDescriptor_error", (uint64_t)"Shader logging", 0, 0);
  id v7 = [(MTLDeviceSPI *)self->_baseObject newLogStateWithDescriptor:v6 error:a4];

  if (v7) {
    uint64_t v8 = [[CaptureMTLLogState alloc] initWithBaseObject:v7 captureContext:self->_traceContext];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  traceContext = self->_traceContext;
  long long v27 = (unint64_t)traceContext;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v29 = v10;
  BYTE8(v29) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v29 + 9) = 16400;
  *(_DWORD *)((char *)&v29 + 11) = 0;
  HIBYTE(v29) = 0;
  baseObject = self->_baseObject;
  char v13 = unwrapMTLStitchedLibraryDescriptorSPI(v6);
  id v14 = [(MTLDeviceSPI *)baseObject newLibraryWithStitchedDescriptorSPI:v13 error:a4];

  if (v14) {
    uint64_t v15 = [[CaptureMTLLibrary alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    uint64_t v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)[(CaptureMTLLibrary *)v15 traceStream]);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15419;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  SaveMTLLibraryInfoWithPath((uint64_t)&v27, v14, 0);
  char v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v23 = [(CaptureMTLLibrary *)v15 traceStream];
  if (!v23)
  {
    unint64_t v24 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v24 = v23->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  char v25 = SaveMTLStitchedLibraryDescriptorSPI((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  *uint64_t v9 = v29;
  *((unsigned char *)v9 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newLibraryWithDescriptorSPI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  traceContext = self->_traceContext;
  long long v27 = (unint64_t)traceContext;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v29 = v10;
  BYTE8(v29) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v29 + 9) = 16400;
  *(_DWORD *)((char *)&v29 + 11) = 0;
  HIBYTE(v29) = 0;
  baseObject = self->_baseObject;
  char v13 = unwrapMTLStitchedLibraryDescriptorSPI(v6);
  id v14 = [(MTLDeviceSPI *)baseObject newLibraryWithDescriptorSPI:v13 error:a4];

  if (v14) {
    uint64_t v15 = [[CaptureMTLLibrary alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    uint64_t v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)[(CaptureMTLLibrary *)v15 traceStream]);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15434;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  SaveMTLLibraryInfoWithPath((uint64_t)&v27, v14, 0);
  char v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v23 = [(CaptureMTLLibrary *)v15 traceStream];
  if (!v23)
  {
    unint64_t v24 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v24 = v23->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  char v25 = SaveMTLStitchedLibraryDescriptorSPI((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  *uint64_t v9 = v29;
  *((unsigned char *)v9 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  traceContext = self->_traceContext;
  long long v27 = (unint64_t)traceContext;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v29 = v10;
  BYTE8(v29) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v29 + 9) = 16400;
  *(_DWORD *)((char *)&v29 + 11) = 0;
  HIBYTE(v29) = 0;
  baseObject = self->_baseObject;
  char v13 = unwrapMTLStitchedLibraryDescriptor(v6);
  id v14 = [(MTLDeviceSPI *)baseObject newLibraryWithDescriptor:v13 error:a4];

  if (v14) {
    uint64_t v15 = [[CaptureMTLLibrary alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    uint64_t v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)[(CaptureMTLLibrary *)v15 traceStream]);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15435;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  SaveMTLLibraryInfoWithPath((uint64_t)&v27, v14, 0);
  char v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v23 = [(CaptureMTLLibrary *)v15 traceStream];
  if (!v23)
  {
    unint64_t v24 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v24 = v23->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  char v25 = SaveMTLStitchedLibraryDescriptor((uint64_t)&v27, v6);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  v18[24] = v25;
  *(_DWORD *)(v18 + 25) = 0;
  *((_DWORD *)v18 + 7) = 0;
  *uint64_t v9 = v29;
  *((unsigned char *)v9 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newLibraryWithData:v6 error:a4];
  if (v12) {
    char v13 = [[CaptureMTLLibrary alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    char v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLLibrary *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -16306;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  SaveMTLLibraryInfoWithPath((uint64_t)&v25, v12, 0);
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v21 = [(CaptureMTLLibrary *)v13 traceStream];
  if (v21)
  {
    unint64_t v22 = v21->var0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v22 = 0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    RetainDebugObject(v12);
    char v23 = 0;
  }
  else
  {
    char v23 = SaveDispatchData_((uint64_t)&v25, v6);
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  v16[24] = v23;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *uint64_t v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newLateEvalEvent
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  traceContext = self->_traceContext;
  long long v20 = (unint64_t)traceContext;
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v5 = v4;
  uint64_t v6 = *v4;
  *BOOL v4 = v7;
  *(void *)&long long v22 = v6;
  BYTE8(v22) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v22 + 9) = 16400;
  *(_DWORD *)((char *)&v22 + 11) = 0;
  HIBYTE(v22) = 0;
  id v8 = [(MTLDeviceSPI *)self->_baseObject newLateEvalEvent];
  if (v8) {
    uint64_t v9 = [[CaptureMTLLateEvalEvent alloc] initWithBaseObject:v8 captureDevice:self];
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v20, (uint64_t)[(CaptureMTLLateEvalEvent *)v9 traceStream]);
  uint64_t v10 = v21;
  *(_DWORD *)(v21 + 8) = -15496;
  char v11 = BYTE9(v22);
  if (BYTE9(v22) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 24);
    uint64_t v14 = BYTE10(v22);
    ++BYTE10(v22);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v21 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v22));
    BYTE9(v22) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLDevice *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = [(CaptureMTLLateEvalEvent *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *id v5 = v22;
  *((unsigned char *)v5 + 8) = BYTE8(v22);
  *(unsigned char *)(v21 + 15) |= 8u;

  return v9;
}

- (id)newIndirectRenderCommandEncoderWithBuffer:(id)a3
{
  baseObject = self->_baseObject;
  BOOL v4 = [a3 baseObject];
  id v5 = [(MTLDeviceSPI *)baseObject newIndirectRenderCommandEncoderWithBuffer:v4];

  return v5;
}

- (id)newIndirectComputeCommandEncoderWithBuffer:(id)a3
{
  baseObject = self->_baseObject;
  BOOL v4 = [a3 baseObject];
  id v5 = [(MTLDeviceSPI *)baseObject newIndirectComputeCommandEncoderWithBuffer:v4];

  return v5;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCount:(unint64_t)a4 options:(unint64_t)a5
{
  id v8 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  traceContext = self->_traceContext;
  long long v27 = (unint64_t)traceContext;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v29 = v12;
  BYTE8(v29) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v29 + 9) = 16400;
  *(_DWORD *)((char *)&v29 + 11) = 0;
  HIBYTE(v29) = 0;
  id v14 = [(MTLDeviceSPI *)self->_baseObject newIndirectCommandBufferWithDescriptor:v8 maxCount:a4 options:a5];
  if (v14) {
    char v15 = [[CaptureMTLBuffer alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    char v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)[(CaptureMTLBuffer *)v15 traceStream]);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15972;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x18uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    unint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2800000000) + 16;
    char v17 = v20;
  }
  else
  {
    unint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 40;
  }
  *(unsigned char *)(v16 + 13) = v17;
  SaveMTLBufferInfo((uint64_t)&v27, v14);
  long long v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v23 = [(CaptureMTLBuffer *)v15 traceStream];
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0;
  }
  char v25 = SaveMTLIndirectCommandBufferDescriptor((uint64_t)&v27, v8, self);
  *(void *)unint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  v18[32] = v25;
  *(_DWORD *)(v18 + 33) = 0;
  *((_DWORD *)v18 + 9) = 0;
  uint64_t *v11 = v29;
  *((unsigned char *)v11 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  id v9 = a3;
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v30 = v12;
  BYTE8(v30) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  id v14 = [(MTLDeviceSPI *)self->_baseObject newIndirectCommandBufferWithDescriptor:v9 maxCommandCount:a4 options:a5];
  char v15 = [(CaptureMTLDevice *)self dummyEncodeICBIntoArgumentBufferForResourceIndex:v14 withDescriptor:v9];

  if (v14) {
    uint64_t v16 = [[CaptureMTLIndirectCommandBuffer alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    uint64_t v16 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLIndirectCommandBuffer *)v16 traceStream]);
  uint64_t v17 = v29;
  *(_DWORD *)(v29 + 8) = -15969;
  char v18 = BYTE9(v30);
  if (BYTE9(v30) > 0x18uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v21 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x2800000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v30));
    BYTE9(v30) += 40;
  }
  *(unsigned char *)(v17 + 13) = v18;
  SaveMTLIndirectCommandBufferInfo((uint64_t)&v28, v14);
  long long v22 = [(CaptureMTLDevice *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v24 = [(CaptureMTLIndirectCommandBuffer *)v16 traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  char v26 = SaveMTLIndirectCommandBufferDescriptor((uint64_t)&v28, v15, self);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = a5;
  v19[32] = v26;
  *(_DWORD *)(v19 + 33) = 0;
  *((_DWORD *)v19 + 9) = 0;
  uint64_t *v11 = v30;
  *((unsigned char *)v11 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;

  return v16;
}

- (id)newIndirectArgumentEncoderWithLayout:(id)a3
{
  return [(MTLDeviceSPI *)self->_baseObject newIndirectArgumentEncoderWithLayout:a3];
}

- (id)newIndirectArgumentEncoderWithArguments:(id)a3
{
  return [(MTLDeviceSPI *)self->_baseObject newIndirectArgumentEncoderWithArguments:a3];
}

- (id)newIndirectArgumentBufferLayoutWithStructType:(id)a3
{
  return [(MTLDeviceSPI *)self->_baseObject newIndirectArgumentBufferLayoutWithStructType:a3];
}

- (id)newIOHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  traceContext = self->_traceContext;
  long long v27 = (unint64_t)traceContext;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v29 = v12;
  BYTE8(v29) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v29 + 9) = 16400;
  *(_DWORD *)((char *)&v29 + 11) = 0;
  HIBYTE(v29) = 0;
  id v14 = [(MTLDeviceSPI *)self->_baseObject newIOHandleWithURL:v8 compressionMethod:a4 error:a5];
  if (v14) {
    char v15 = [[CaptureMTLIOFileHandle alloc] initWithBaseObject:v14 captureContext:self->_traceContext];
  }
  else {
    char v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)[(CaptureMTLIOFileHandle *)v15 traceStream]);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15296;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x18uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    char v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2800000000) + 16;
    char v17 = v20;
  }
  else
  {
    char v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 40;
  }
  *(unsigned char *)(v16 + 13) = v17;
  uint64_t v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v23 = [(CaptureMTLIOFileHandle *)v15 traceStream];
  if (!v23)
  {
    unint64_t v24 = 0;
    if (!a5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v24 = v23->var0;
  if (a5) {
LABEL_12:
  }
    a5 = (id *)*a5;
LABEL_13:
  unsigned __int8 v25 = SaveNSURL((uint64_t)&v27, v8);
  *(void *)char v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  v18[32] = v25;
  *(_DWORD *)(v18 + 33) = 0;
  *((_DWORD *)v18 + 9) = 0;
  uint64_t *v11 = v29;
  *((unsigned char *)v11 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newIOFileHandleWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newIOFileHandleWithURL:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLIOFileHandle alloc] initWithBaseObject:v12 captureContext:self->_traceContext];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLIOFileHandle *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15259;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLIOFileHandle *)v13 traceStream];
  if (!v21)
  {
    unint64_t v22 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v22 = v21->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  unsigned __int8 v23 = SaveNSURL((uint64_t)&v25, v6);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  v16[24] = v23;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *id v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  traceContext = self->_traceContext;
  long long v27 = (unint64_t)traceContext;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v29 = v12;
  BYTE8(v29) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v29 + 9) = 16400;
  *(_DWORD *)((char *)&v29 + 11) = 0;
  HIBYTE(v29) = 0;
  id v14 = [(MTLDeviceSPI *)self->_baseObject newIOFileHandleWithURL:v8 compressionMethod:a4 error:a5];
  if (v14) {
    char v15 = [[CaptureMTLIOFileHandle alloc] initWithBaseObject:v14 captureContext:self->_traceContext];
  }
  else {
    char v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)[(CaptureMTLIOFileHandle *)v15 traceStream]);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15260;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x18uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2800000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 40;
  }
  *(unsigned char *)(v16 + 13) = v17;
  uint64_t v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unsigned __int8 v23 = [(CaptureMTLIOFileHandle *)v15 traceStream];
  if (!v23)
  {
    unint64_t v24 = 0;
    if (!a5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v24 = v23->var0;
  if (a5) {
LABEL_12:
  }
    a5 = (id *)*a5;
LABEL_13:
  unsigned __int8 v25 = SaveNSURL((uint64_t)&v27, v8);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  v18[32] = v25;
  *(_DWORD *)(v18 + 33) = 0;
  *((_DWORD *)v18 + 9) = 0;
  uint64_t *v11 = v29;
  *((unsigned char *)v11 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newIOCommandQueueWithDescriptor:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLIOCommandQueue alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLIOCommandQueue *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15350;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLIOCommandQueue *)v13 traceStream];
  if (!v21)
  {
    unint64_t v22 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v22 = v21->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  char v23 = SaveMTLIOCommandQueueDescriptor((uint64_t)&v25, v6);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  v16[24] = v23;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *id v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newFence
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  traceContext = self->_traceContext;
  long long v20 = (unint64_t)traceContext;
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v5 = v4;
  uint64_t v6 = *v4;
  *BOOL v4 = v7;
  *(void *)&long long v22 = v6;
  BYTE8(v22) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v22 + 9) = 16400;
  *(_DWORD *)((char *)&v22 + 11) = 0;
  HIBYTE(v22) = 0;
  id v8 = [(MTLDeviceSPI *)self->_baseObject newFence];
  if (v8) {
    id v9 = [[CaptureMTLFence alloc] initWithBaseObject:v8 captureDevice:self];
  }
  else {
    id v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v20, (uint64_t)[(CaptureMTLFence *)v9 traceStream]);
  uint64_t v10 = v21;
  *(_DWORD *)(v21 + 8) = -16128;
  char v11 = BYTE9(v22);
  if (BYTE9(v22) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 24);
    uint64_t v14 = BYTE10(v22);
    ++BYTE10(v22);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v21 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v22));
    BYTE9(v22) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLDevice *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = [(CaptureMTLFence *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *id v5 = v22;
  *((unsigned char *)v5 + 8) = BYTE8(v22);
  *(unsigned char *)(v21 + 15) |= 8u;

  return v9;
}

- (id)newEvent
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  traceContext = self->_traceContext;
  long long v20 = (unint64_t)traceContext;
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v5 = v4;
  uint64_t v6 = *v4;
  *BOOL v4 = v7;
  *(void *)&long long v22 = v6;
  BYTE8(v22) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v22 + 9) = 16400;
  *(_DWORD *)((char *)&v22 + 11) = 0;
  HIBYTE(v22) = 0;
  id v8 = [(MTLDeviceSPI *)self->_baseObject newEvent];
  if (v8) {
    id v9 = [[CaptureMTLEvent alloc] initWithBaseObject:v8 captureDevice:self];
  }
  else {
    id v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v20, (uint64_t)[(CaptureMTLEvent *)v9 traceStream]);
  uint64_t v10 = v21;
  *(_DWORD *)(v21 + 8) = -15997;
  char v11 = BYTE9(v22);
  if (BYTE9(v22) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 24);
    uint64_t v14 = BYTE10(v22);
    ++BYTE10(v22);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v21 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v22));
    BYTE9(v22) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLDevice *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = [(CaptureMTLEvent *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *id v5 = v22;
  *((unsigned char *)v5 + 8) = BYTE8(v22);
  *(unsigned char *)(v21 + 15) |= 8u;

  return v9;
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  traceContext = self->_traceContext;
  long long v27 = (unint64_t)traceContext;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v29 = v12;
  BYTE8(v29) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v29 + 9) = 16400;
  *(_DWORD *)((char *)&v29 + 11) = 0;
  HIBYTE(v29) = 0;
  id v14 = [(MTLDeviceSPI *)self->_baseObject newDynamicLibraryWithURL:v8 options:a4 error:a5];
  if (v14) {
    char v15 = [[CaptureMTLDynamicLibrary alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    char v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)[(CaptureMTLDynamicLibrary *)v15 traceStream]);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -15531;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x18uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    unint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x2800000000) + 16;
    char v17 = v20;
  }
  else
  {
    unint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 40;
  }
  *(unsigned char *)(v16 + 13) = v17;
  SaveMTLDynamicLibraryInfo((uint64_t)&v27, v14);
  long long v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v23 = [(CaptureMTLDynamicLibrary *)v15 traceStream];
  if (!v23)
  {
    unint64_t v24 = 0;
    if (!a5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v24 = v23->var0;
  if (a5) {
LABEL_12:
  }
    a5 = (id *)*a5;
LABEL_13:
  unsigned __int8 v25 = SaveNSURL((uint64_t)&v27, v8);
  *(void *)unint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  v18[32] = v25;
  *(_DWORD *)(v18 + 33) = 0;
  *((_DWORD *)v18 + 9) = 0;
  uint64_t *v11 = v29;
  *((unsigned char *)v11 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newDynamicLibraryWithURL:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLDynamicLibrary alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLDynamicLibrary *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15613;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  SaveMTLDynamicLibraryInfo((uint64_t)&v25, v12);
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = [(CaptureMTLDynamicLibrary *)v13 traceStream];
  if (!v21)
  {
    unint64_t v22 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v22 = v21->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  unsigned __int8 v23 = SaveNSURL((uint64_t)&v25, v6);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  v16[24] = v23;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *id v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  id v5 = [(MTLDeviceSPI *)self->_baseObject newDynamicLibraryWithDescriptor:a3 error:a4];
  if (v5) {
    id v6 = [[CaptureMTLDynamicLibrary alloc] initWithBaseObject:v5 captureDevice:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)newDynamicLibraryFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_newDynamicLibraryFromURL_error", (uint64_t)"Dynamic Libraries", 0, 0);
  id v7 = [(MTLDeviceSPI *)self->_baseObject newDynamicLibraryFromURL:v6 error:a4];

  if (v7) {
    id v8 = [[CaptureMTLDynamicLibrary alloc] initWithBaseObject:v7 captureDevice:self];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_newDynamicLibrary_computeDescriptor_error", (uint64_t)"Dynamic Libraries SPI", 0, 0);
  baseObject = self->_baseObject;
  uint64_t v11 = [v9 baseObject];

  id v12 = unwrapMTLComputePipelineDescriptor(v8);

  id v13 = [(MTLDeviceSPI *)baseObject newDynamicLibrary:v11 computeDescriptor:v12 error:a5];
  if (v13) {
    uint64_t v14 = [[CaptureMTLDynamicLibrary alloc] initWithBaseObject:v13 captureDevice:self];
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)newDagStringWithGraphs:(id)a3
{
  return [(MTLDeviceSPI *)self->_baseObject newDagStringWithGraphs:a3];
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v24 = v8;
  BYTE8(v24) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  id v10 = -[MTLDeviceSPI newCommandQueueWithMaxCommandBufferCount:](self->_baseObject, "newCommandQueueWithMaxCommandBufferCount:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLCommandQueue alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLCommandQueue *)v11 traceStream]);
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -16315;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = [(CaptureMTLCommandQueue *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a3;
  *id v7 = v24;
  *((unsigned char *)v7 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v11;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v27 = v8;
  BYTE8(v27) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  baseObject = self->_baseObject;
  uint64_t v11 = unwrapMTLCommandQueueDescriptor(v4);
  id v12 = [(MTLDeviceSPI *)baseObject newCommandQueueWithDescriptor:v11];

  if (v12) {
    char v13 = [[CaptureMTLCommandQueue alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    char v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLCommandQueue *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -16165;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = [(CaptureMTLCommandQueue *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLCommandQueueDescriptor((uint64_t)&v25, v4);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  *id v7 = v27;
  *((unsigned char *)v7 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newCommandQueue
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  traceContext = self->_traceContext;
  long long v20 = (unint64_t)traceContext;
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v5 = v4;
  uint64_t v6 = *v4;
  *id v4 = v7;
  *(void *)&long long v22 = v6;
  BYTE8(v22) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v22 + 9) = 16400;
  *(_DWORD *)((char *)&v22 + 11) = 0;
  HIBYTE(v22) = 0;
  id v8 = [(MTLDeviceSPI *)self->_baseObject newCommandQueue];
  if (v8) {
    uint64_t v9 = [[CaptureMTLCommandQueue alloc] initWithBaseObject:v8 captureDevice:self];
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v20, (uint64_t)[(CaptureMTLCommandQueue *)v9 traceStream]);
  uint64_t v10 = v21;
  *(_DWORD *)(v21 + 8) = -16316;
  char v11 = BYTE9(v22);
  if (BYTE9(v22) > 0x30uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 24);
    uint64_t v14 = BYTE10(v22);
    ++BYTE10(v22);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v21 + 1), v14 | 0x1000000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v22));
    BYTE9(v22) += 16;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLDevice *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v17 = [(CaptureMTLCommandQueue *)v9 traceStream];
  if (v17) {
    unint64_t v18 = v17->var0;
  }
  else {
    unint64_t v18 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v18;
  *id v5 = v22;
  *((unsigned char *)v5 + 8) = BYTE8(v22);
  *(unsigned char *)(v21 + 15) |= 8u;

  return v9;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v28 = v12;
  BYTE8(v28) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  id v14 = -[MTLDeviceSPI newBufferWithLength:options:gpuAddress:](self->_baseObject, "newBufferWithLength:options:gpuAddress:");
  if (v14) {
    char v15 = [[CaptureMTLBuffer alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    char v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLBuffer *)v15 traceStream]);
  uint64_t v16 = v27;
  *(_DWORD *)(v27 + 8) = -15705;
  char v17 = BYTE9(v28);
  if (BYTE9(v28) > 0x18uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v20 = BYTE10(v28);
    ++BYTE10(v28);
    unint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v27 + 1), v20 | 0x2800000000) + 16;
    char v17 = v20;
  }
  else
  {
    unint64_t v18 = (char *)(v16 + BYTE9(v28));
    BYTE9(v28) += 40;
  }
  *(unsigned char *)(v16 + 13) = v17;
  SaveMTLBufferInfo((uint64_t)&v26, v14);
  long long v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v23 = [(CaptureMTLBuffer *)v15 traceStream];
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0;
  }
  *(void *)unint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a3;
  *((void *)v18 + 3) = a4;
  *((void *)v18 + 4) = a5;
  uint64_t *v11 = v28;
  *((unsigned char *)v11 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v15;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v26 = v10;
  BYTE8(v26) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v12 = -[MTLDeviceSPI newBufferWithLength:options:](self->_baseObject, "newBufferWithLength:options:");
  if (v12) {
    uint64_t v13 = [[CaptureMTLBuffer alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLBuffer *)v13 traceStream]);
  uint64_t v14 = v25;
  *(_DWORD *)(v25 + 8) = -16314;
  char v15 = BYTE9(v26);
  if (BYTE9(v26) > 0x18uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v18 = BYTE10(v26);
    ++BYTE10(v26);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v25 + 1), v18 | 0x2800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v26));
    BYTE9(v26) += 40;
  }
  *(unsigned char *)(v14 + 13) = v15;
  SaveMTLBufferInfo((uint64_t)&v24, v12);
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v21 = [(CaptureMTLBuffer *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  *((void *)v16 + 3) = a4;
  *((void *)v16 + 4) = 0;
  *uint64_t v9 = v26;
  *((unsigned char *)v9 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  long long v23 = (unint64_t)traceContext;
  *(void *)&long long v24 = 0;
  *((void *)&v24 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  *(void *)&long long v25 = v8;
  BYTE8(v25) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v25 + 9) = 16400;
  *(_DWORD *)((char *)&v25 + 11) = 0;
  HIBYTE(v25) = 0;
  id v10 = -[MTLDeviceSPI newBufferWithIOSurface:](self->_baseObject, "newBufferWithIOSurface:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLBuffer alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v23, (uint64_t)[(CaptureMTLBuffer *)v11 traceStream]);
  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -16163;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  SaveMTLBufferInfo((uint64_t)&v23, v10);
  uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = [(CaptureMTLBuffer *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  char v21 = SaveIOSurfaceRef((uint64_t)&v23, a3);
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  v14[16] = v21;
  *(_DWORD *)(v14 + 17) = 0;
  *((_DWORD *)v14 + 5) = 0;
  *uint64_t v7 = v25;
  *((unsigned char *)v7 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;

  return v11;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7
{
  id v8 = [(MTLDeviceSPI *)self->_baseObject newBufferWithBytesNoCopy:a3 length:a4 options:a5 gpuAddress:a6 deallocator:a7];
  if (v8) {
    uint64_t v9 = [[CaptureMTLBuffer alloc] initWithBaseObject:v8 captureDevice:self];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  traceContext = self->_traceContext;
  long long v35 = (unint64_t)traceContext;
  *(void *)&long long v36 = 0;
  *((void *)&v36 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v13 = v12;
  uint64_t v14 = *v12;
  *uint64_t v12 = v15;
  *(void *)&long long v37 = v14;
  BYTE8(v37) = *((unsigned char *)v12 + 8);
  *(_WORD *)((char *)&v37 + 9) = 16400;
  *(_DWORD *)((char *)&v37 + 11) = 0;
  HIBYTE(v37) = 0;
  id v16 = -[MTLDeviceSPI newBufferWithBytes:length:options:gpuAddress:](self->_baseObject, "newBufferWithBytes:length:options:gpuAddress:");
  if (v16) {
    uint64_t v17 = [[CaptureMTLBuffer alloc] initWithBaseObject:v16 captureDevice:self];
  }
  else {
    uint64_t v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v35, (uint64_t)[(CaptureMTLBuffer *)v17 traceStream]);
  uint64_t v18 = v36;
  *(_DWORD *)(v36 + 8) = -15707;
  char v19 = BYTE9(v37);
  if (BYTE9(v37) > 0x10uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 24);
    id v34 = v16;
    unint64_t v22 = v17;
    unint64_t v23 = a4;
    unint64_t v24 = a5;
    unint64_t v25 = a6;
    long long v26 = a3;
    uint64_t v27 = BYTE10(v37);
    ++BYTE10(v37);
    unint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v36 + 1), v27 | 0x3000000000) + 16;
    char v19 = v27;
    a3 = v26;
    a6 = v25;
    a5 = v24;
    a4 = v23;
    uint64_t v17 = v22;
    id v16 = v34;
  }
  else
  {
    unint64_t v20 = (char *)(v18 + BYTE9(v37));
    BYTE9(v37) += 48;
  }
  *(unsigned char *)(v18 + 13) = v19;
  SaveMTLBufferInfo((uint64_t)&v35, v16);
  long long v28 = [(CaptureMTLDevice *)self traceStream];
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v30 = [(CaptureMTLBuffer *)v17 traceStream];
  if (v30) {
    unint64_t v31 = v30->var0;
  }
  else {
    unint64_t v31 = 0;
  }
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2) {
    char v32 = GTTraceEncoder_storeBlob((uint64_t)&v35, a3, a4);
  }
  else {
    char v32 = 0;
  }
  *(void *)unint64_t v20 = var0;
  *((void *)v20 + 1) = v31;
  *((void *)v20 + 2) = a4;
  *((void *)v20 + 3) = a5;
  *((void *)v20 + 4) = a6;
  v20[40] = v32;
  *(_DWORD *)(v20 + 41) = 0;
  *((_DWORD *)v20 + 11) = 0;
  *char v13 = v37;
  *((unsigned char *)v13 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;

  return v17;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  traceContext = self->_traceContext;
  long long v27 = (unint64_t)traceContext;
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  *id v10 = v13;
  *(void *)&long long v29 = v12;
  BYTE8(v29) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v29 + 9) = 16400;
  *(_DWORD *)((char *)&v29 + 11) = 0;
  HIBYTE(v29) = 0;
  id v14 = -[MTLDeviceSPI newBufferWithBytes:length:options:](self->_baseObject, "newBufferWithBytes:length:options:");
  if (v14) {
    uint64_t v15 = [[CaptureMTLBuffer alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    uint64_t v15 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v27, (uint64_t)[(CaptureMTLBuffer *)v15 traceStream]);
  uint64_t v16 = v28;
  *(_DWORD *)(v28 + 8) = -16313;
  char v17 = BYTE9(v29);
  if (BYTE9(v29) > 0x10uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 24);
    uint64_t v20 = BYTE10(v29);
    ++BYTE10(v29);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v28 + 1), v20 | 0x3000000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v29));
    BYTE9(v29) += 48;
  }
  *(unsigned char *)(v16 + 13) = v17;
  SaveMTLBufferInfo((uint64_t)&v27, v14);
  uint64_t v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v23 = [(CaptureMTLBuffer *)v15 traceStream];
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0;
  }
  char v25 = TransferBytes((uint64_t)&v27, (uint64_t *)a3, (const void *)a4);
  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = a4;
  *((void *)v18 + 3) = a5;
  *((void *)v18 + 4) = 0;
  v18[40] = v25;
  *(_DWORD *)(v18 + 41) = 0;
  *((_DWORD *)v18 + 11) = 0;
  uint64_t *v11 = v29;
  *((unsigned char *)v11 + 8) = BYTE8(v29);
  *(unsigned char *)(v28 + 15) |= 8u;

  return v15;
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  id v8 = a4;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_newBinaryLibraryWithOptions_url_error", (uint64_t)"Binary Linking", 0, 0);
  id v9 = [(MTLDeviceSPI *)self->_baseObject newBinaryLibraryWithOptions:a3 url:v8 error:a5];

  if (v9) {
    id v10 = [[CaptureMTLBinaryArchive alloc] initWithBaseObject:v9 captureDevice:self];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newBinaryArchiveWithDescriptor:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLBinaryArchive alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLBinaryArchive *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15717;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLBinaryArchive *)v13 traceStream];
  if (!v21)
  {
    unint64_t v22 = 0;
    if (a4) {
      goto LABEL_12;
    }
LABEL_14:
    id v23 = 0;
    goto LABEL_15;
  }
  unint64_t v22 = v21->var0;
  if (!a4) {
    goto LABEL_14;
  }
LABEL_12:
  id v23 = *a4;
LABEL_15:
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = v23;
  *((void *)v16 + 3) = 0;
  *id v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  id v4 = [(MTLDeviceSPI *)self->_baseObject newArgumentEncoderWithLayout:a3];
  if (v4) {
    id v5 = [[CaptureMTLArgumentEncoder alloc] initWithBaseObject:v4 captureDevice:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newAccelerationStructureWithSize:a3 withDescriptor:v6];
  if (v12) {
    uint64_t v13 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLAccelerationStructure *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15358;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  SaveMTLAccelerationStructureInfo((uint64_t)&v25, v12);
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLAccelerationStructure *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLAccelerationStructureAllocationDescriptor((uint64_t)&v25, v6);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  v16[24] = v23;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *id v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v26 = v10;
  BYTE8(v26) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v12 = -[MTLDeviceSPI newAccelerationStructureWithSize:resourceIndex:](self->_baseObject, "newAccelerationStructureWithSize:resourceIndex:");
  if (v12) {
    uint64_t v13 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLAccelerationStructure *)v13 traceStream]);
  uint64_t v14 = v25;
  *(_DWORD *)(v25 + 8) = -15506;
  char v15 = BYTE9(v26);
  if (BYTE9(v26) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v18 = BYTE10(v26);
    ++BYTE10(v26);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v25 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v26));
    BYTE9(v26) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  SaveMTLAccelerationStructureInfo((uint64_t)&v24, v12);
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLAccelerationStructure *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a3;
  *((void *)v16 + 3) = a4;
  *id v9 = v26;
  *((unsigned char *)v9 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v13;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v24 = v8;
  BYTE8(v24) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  id v10 = -[MTLDeviceSPI newAccelerationStructureWithSize:](self->_baseObject, "newAccelerationStructureWithSize:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLAccelerationStructure *)v11 traceStream]);
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -15614;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  SaveMTLAccelerationStructureInfo((uint64_t)&v22, v10);
  uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = [(CaptureMTLAccelerationStructure *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = a3;
  *uint64_t v7 = v24;
  *((unsigned char *)v7 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v11;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v27 = v8;
  BYTE8(v27) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  baseObject = self->_baseObject;
  uint64_t v11 = unwrapMTLAccelerationStructureDescriptor(v4);
  id v12 = [(MTLDeviceSPI *)baseObject newAccelerationStructureWithDescriptor:v11];

  if (v12) {
    char v13 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    char v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLAccelerationStructure *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15615;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x28uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x1800000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 24;
  }
  *(unsigned char *)(v14 + 13) = v15;
  SaveMTLAccelerationStructureInfo((uint64_t)&v25, v12);
  uint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v21 = [(CaptureMTLAccelerationStructure *)v13 traceStream];
  if (v21) {
    unint64_t v22 = v21->var0;
  }
  else {
    unint64_t v22 = 0;
  }
  char v23 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v25, v4);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  v16[16] = v23;
  *(_DWORD *)(v16 + 17) = 0;
  *((_DWORD *)v16 + 5) = 0;
  *uint64_t v7 = v27;
  *((unsigned char *)v7 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (unint64_t)minimumTextureBufferAlignmentForPixelFormat:(unint64_t)a3
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject minimumTextureBufferAlignmentForPixelFormat:a3];
}

- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject minimumLinearTextureAlignmentForPixelFormat:a3];
}

- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  id v5 = [(MTLDeviceSPI *)self->_baseObject minLinearTextureAlignmentForPixelFormat:a3];
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -16093;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLDevice *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = v5;
  *((void *)v8 + 2) = a3;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return (unint64_t)v5;
}

- (unsigned)maximumComputeSubstreams
{
  return [(MTLDeviceSPI *)self->_baseObject maximumComputeSubstreams];
}

- (BOOL)mapShaderSampleBufferWithBuffer:(id *)a3 capacity:(unint64_t)a4 size:(unint64_t)a5
{
  return [(MTLDeviceSPI *)self->_baseObject mapShaderSampleBufferWithBuffer:a3 capacity:a4 size:a5];
}

- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats
{
  return ($85CD2974BE96D4886BB301820D1C36C2)[(MTLDeviceSPI *)self->_baseObject libraryCacheStats];
}

- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6
{
  return [(MTLDeviceSPI *)self->_baseObject isVendorSliceCompatibleWithDeploymentTarget:*(void *)&a3 platform:*(void *)&a4 sdkVersion:*(void *)&a5 compilerPluginVersion:*(void *)&a6];
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  return [(MTLDeviceSPI *)self->_baseObject isCompatibleWithAccelerationStructure:a3];
}

- (id)indirectArgumentBufferDecodingData
{
  return [(MTLDeviceSPI *)self->_baseObject indirectArgumentBufferDecodingData];
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  id v7 = [(MTLDeviceSPI *)self->_baseObject heapBufferSizeAndAlignWithLength:a3 options:a4];
  unint64_t v9 = v8;
  uint64_t v10 = v22;
  *(_DWORD *)(v22 + 8) = -16111;
  char v11 = BYTE9(v23);
  if (BYTE9(v23) > 0x18uLL)
  {
    uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v14 = BYTE10(v23);
    ++BYTE10(v23);
    id v12 = GTTraceMemPool_allocateBytes(v13, *((uint64_t *)&v22 + 1), v14 | 0x2800000000) + 16;
    char v11 = v14;
  }
  else
  {
    id v12 = (char *)(v10 + BYTE9(v23));
    BYTE9(v23) += 40;
  }
  *(unsigned char *)(v10 + 13) = v11;
  char v15 = [(CaptureMTLDevice *)self traceStream];
  if (v15) {
    unint64_t var0 = v15->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v12 = var0;
  *((void *)v12 + 1) = v7;
  *((void *)v12 + 2) = v9;
  *((void *)v12 + 3) = a3;
  *((void *)v12 + 4) = a4;
  s();
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
  unint64_t v19 = (unint64_t)v7;
  unint64_t v20 = v9;
  result.var1 = v20;
  result.unint64_t var0 = v19;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  id v3 = [(MTLDeviceSPI *)self->_baseObject heapAccelerationStructureSizeAndAlignWithSize:a3];
  result.var1 = v4;
  result.unint64_t var0 = (unint64_t)v3;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  baseObject = self->_baseObject;
  unint64_t v4 = unwrapMTLAccelerationStructureDescriptor(a3);
  id v5 = [(MTLDeviceSPI *)baseObject heapAccelerationStructureSizeAndAlignWithDescriptor:v4];
  unint64_t v7 = v6;

  unint64_t v8 = (unint64_t)v5;
  unint64_t v9 = v7;
  result.var1 = v9;
  result.unint64_t var0 = v8;
  return result;
}

- (void)getShaderCacheKeys
{
  return [(MTLDeviceSPI *)self->_baseObject getShaderCacheKeys];
}

- (id)getRawBVHBuilderPtr
{
  return [(MTLDeviceSPI *)self->_baseObject getRawBVHBuilderPtr];
}

- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4
{
}

- (os_unfair_lock_s)getBVHBuilderLock
{
  return (os_unfair_lock_s *)[(MTLDeviceSPI *)self->_baseObject getBVHBuilderLock];
}

- (id)familyName
{
  return [(MTLDeviceSPI *)self->_baseObject familyName];
}

- (id)endCollectingPipelineDescriptors
{
  return [(MTLDeviceSPI *)self->_baseObject endCollectingPipelineDescriptors];
}

- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3
{
  return [(MTLDeviceSPI *)self->_baseObject deviceSupportsFeatureSet:a3];
}

- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3
{
  return [(MTLDeviceSPI *)self->_baseObject deviceOrFeatureProfileSupportsFeatureSet:a3];
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  baseObject = self->_baseObject;
  unint64_t v7 = unwrapMTLAccelerationStructureDescriptor(a4);
  id v8 = [(MTLDeviceSPI *)baseObject deserializePrimitiveAccelerationStructureFromBytes:a3 withDescriptor:v7];

  if (v8) {
    unint64_t v9 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v8 captureDevice:self];
  }
  else {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  baseObject = self->_baseObject;
  id v9 = a5;
  uint64_t v10 = unwrapNSArray(a4);
  char v11 = unwrapMTLAccelerationStructureDescriptor(v9);

  id v12 = [(MTLDeviceSPI *)baseObject deserializeInstanceAccelerationStructureFromBytes:a3 primitiveAccelerationStructures:v10 withDescriptor:v11];
  if (v12) {
    uint64_t v13 = [[CaptureMTLAccelerationStructure alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)deserializeCompileTimeStats:(id)a3 addToDictionary:(id)a4
{
}

- (BOOL)copyShaderCacheToPath:(id)a3
{
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v21);
  unsigned int v5 = [(MTLDeviceSPI *)self->_baseObject copyShaderCacheToPath:v4];
  uint64_t v6 = v22;
  *(_DWORD *)(v22 + 8) = -15747;
  char v7 = BYTE9(v23);
  if (BYTE9(v23) > 0x30uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v10 = BYTE10(v23);
    ++BYTE10(v23);
    id v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v22 + 1), v10 | 0x1000000000) + 16;
    char v7 = v10;
  }
  else
  {
    id v8 = (char *)(v6 + BYTE9(v23));
    BYTE9(v23) += 16;
  }
  *(unsigned char *)(v6 + 13) = v7;
  char v11 = [(CaptureMTLDevice *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v13 = v4;
  id v14 = [v13 UTF8String];
  if (v14)
  {
    id v15 = v13;
    id v16 = [v15 UTF8String];
    size_t v17 = strlen((const char *)[v15 UTF8String]);
    LOBYTE(v14) = GTTraceEncoder_storeBytes((uint64_t)&v21, v16, v17 + 1);
  }
  *(void *)id v8 = var0;
  *((_DWORD *)v8 + 2) = v5;
  v8[12] = (char)v14;
  *(_WORD *)(v8 + 13) = 0;
  v8[15] = 0;
  s();
  *(void *)uint64_t v18 = v19;
  *(unsigned char *)(v18 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;

  return v5;
}

- (id)copyIOSurfaceSharedTextureProperties:(id)a3
{
  return [(MTLDeviceSPI *)self->_baseObject copyIOSurfaceSharedTextureProperties:a3];
}

- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a5;
  [(MTLDeviceSPI *)baseObject convertSparseTileRegions:a3 toPixelRegions:a4 withTileSize:&v7 numRegions:a6];
}

- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v8 = *a5;
  [(MTLDeviceSPI *)baseObject convertSparsePixelRegions:a3 toTileRegions:a4 withTileSize:&v8 alignmentMode:a6 numRegions:a7];
}

- (void)compilerPropagatesThreadPriority:(BOOL)a3
{
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_compileVisibleFunction_withDescriptor_error", (uint64_t)"Function Pointers", 0, 0);
  baseObject = self->_baseObject;
  id v12 = [v9 baseObject];

  char v11 = unwrapMTLFunctionDescriptor(v8);

  [(MTLDeviceSPI *)baseObject compileVisibleFunction:v12 withDescriptor:v11 error:a5];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  retstr->unint64_t var0 = 0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = 0;
  baseObject = self->_baseObject;
  unwrapMTLAccelerationStructureDescriptor(a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (baseObject)
  {
    id v9 = v6;
    id v6 = [(MTLDeviceSPI *)baseObject accelerationStructureSizesWithDescriptor:v6];
    id v7 = v9;
  }
  else
  {
    retstr->unint64_t var0 = 0;
    retstr->var1 = 0;
    retstr->unint64_t var2 = 0;
  }

  return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)_objc_release_x1(v6, v7);
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLDeviceSPI *)self->_baseObject setWritableHeapsEnabled:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15246;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLDevice *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (BOOL)areWritableHeapsEnabled
{
  return [(MTLDeviceSPI *)self->_baseObject areWritableHeapsEnabled];
}

- (const)targetDeviceInfo
{
  return (const MTLTargetDeviceArch *)[(MTLDeviceSPI *)self->_baseObject targetDeviceInfo];
}

- (MTLTargetDeviceArchitecture)targetDeviceArchitecture
{
  return (MTLTargetDeviceArchitecture *)[(MTLDeviceSPI *)self->_baseObject targetDeviceArchitecture];
}

- (BOOL)supportPriorityBand
{
  return [(MTLDeviceSPI *)self->_baseObject supportPriorityBand];
}

- (unint64_t)sparseTexturesSupport
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject sparseTexturesSupport];
}

- (unint64_t)singleFPConfig
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject singleFPConfig];
}

- (unint64_t)sharedMemorySize
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject sharedMemorySize];
}

- (void)setShaderDebugInfoCaching:(BOOL)a3
{
}

- (BOOL)shaderDebugInfoCaching
{
  return [(MTLDeviceSPI *)self->_baseObject shaderDebugInfoCaching];
}

- (BOOL)requiresRaytracingEmulation
{
  return [(MTLDeviceSPI *)self->_baseObject requiresRaytracingEmulation];
}

- (BOOL)requiresBFloat16Emulation
{
  return [(MTLDeviceSPI *)self->_baseObject requiresBFloat16Emulation];
}

- (unint64_t)registryID
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject registryID];
}

- (unint64_t)readWriteTextureSupport
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject readWriteTextureSupport];
}

- (BOOL)areRasterOrderGroupsSupported
{
  return [(MTLDeviceSPI *)self->_baseObject areRasterOrderGroupsSupported];
}

- (BOOL)isQuadDataSharingSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isQuadDataSharingSupported];
}

- (BOOL)areProgrammableSamplePositionsSupported
{
  return [(MTLDeviceSPI *)self->_baseObject areProgrammableSamplePositionsSupported];
}

- (BOOL)isPlacementHeapSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isPlacementHeapSupported];
}

- (NSString)name
{
  return (NSString *)[(MTLDeviceSPI *)self->_baseObject name];
}

- (BOOL)isMsaa32bSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isMsaa32bSupported];
}

- (unint64_t)minConstantBufferAlignmentBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject minConstantBufferAlignmentBytes];
}

- (unint64_t)minBufferNoCopyAlignmentBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject minBufferNoCopyAlignmentBytes];
}

- (void)setMetalAssertionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLDeviceSPI *)self->_baseObject setMetalAssertionsEnabled:v3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -16318;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLDevice *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v7 = var0;
  *((_DWORD *)v7 + 2) = v3;
  *((_DWORD *)v7 + 3) = 0;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (BOOL)metalAssertionsEnabled
{
  return [(MTLDeviceSPI *)self->_baseObject metalAssertionsEnabled];
}

- (unint64_t)maxVisibilityQueryOffset
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxVisibilityQueryOffset];
}

- (unint64_t)maxViewportCount
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxViewportCount];
}

- (unint64_t)maxVertexTextures
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxVertexTextures];
}

- (unint64_t)maxVertexSamplers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxVertexSamplers];
}

- (unint64_t)maxVertexInlineDataSize
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxVertexInlineDataSize];
}

- (unint64_t)maxVertexBuffers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxVertexBuffers];
}

- (unint64_t)maxVertexAttributes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxVertexAttributes];
}

- (unint64_t)maxVertexAmplificationFactor
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxVertexAmplificationFactor];
}

- (unint64_t)maxVertexAmplificationCount
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxVertexAmplificationCount];
}

- (unint64_t)maxTotalComputeThreadsPerThreadgroup
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTotalComputeThreadsPerThreadgroup];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadsPerThreadgroup
{
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self->_baseObject;
  if (result) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)result maxThreadsPerThreadgroup];
  }
  retstr->unint64_t var0 = 0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = 0;
  return result;
}

- (unint64_t)maxThreadgroupMemoryLength
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxThreadgroupMemoryLength];
}

- (unint64_t)maxTextureWidth3D
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTextureWidth3D];
}

- (unint64_t)maxTextureWidth2D
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTextureWidth2D];
}

- (unint64_t)maxTextureWidth1D
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTextureWidth1D];
}

- (unint64_t)maxTextureLayers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTextureLayers];
}

- (unint64_t)maxTextureHeight3D
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTextureHeight3D];
}

- (unint64_t)maxTextureHeight2D
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTextureHeight2D];
}

- (unint64_t)maxTextureDimensionCube
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTextureDimensionCube];
}

- (unint64_t)maxTextureDepth3D
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTextureDepth3D];
}

- (unint64_t)maxTextureBufferWidth
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTextureBufferWidth];
}

- (unint64_t)maxTessellationFactor
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTessellationFactor];
}

- (unint64_t)maxRasterizationRateLayerCount
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxRasterizationRateLayerCount];
}

- (float)maxPointSize
{
  [(MTLDeviceSPI *)self->_baseObject maxPointSize];
  return result;
}

- (float)maxLineWidth
{
  [(MTLDeviceSPI *)self->_baseObject maxLineWidth];
  return result;
}

- (unint64_t)maxInterpolatedComponents
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxInterpolatedComponents];
}

- (unint64_t)maxInterpolants
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxInterpolants];
}

- (unint64_t)maxIndirectTextures
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxIndirectTextures];
}

- (unint64_t)maxIndirectSamplersPerDevice
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxIndirectSamplersPerDevice];
}

- (unint64_t)maxIndirectSamplers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxIndirectSamplers];
}

- (unint64_t)maxIndirectBuffers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxIndirectBuffers];
}

- (unint64_t)maxFunctionConstantIndices
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxFunctionConstantIndices];
}

- (unint64_t)maxFramebufferStorageBits
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxFramebufferStorageBits];
}

- (unint64_t)maxFragmentTextures
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxFragmentTextures];
}

- (unint64_t)maxFragmentSamplers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxFragmentSamplers];
}

- (unint64_t)maxFragmentInlineDataSize
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxFragmentInlineDataSize];
}

- (unint64_t)maxFragmentBuffers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxFragmentBuffers];
}

- (unint64_t)maxFenceInstances
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxFenceInstances];
}

- (unint64_t)maxCustomSamplePositions
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxCustomSamplePositions];
}

- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxComputeThreadgroupMemoryAlignmentBytes];
}

- (unint64_t)maxComputeThreadgroupMemory
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxComputeThreadgroupMemory];
}

- (unint64_t)maxComputeTextures
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxComputeTextures];
}

- (unint64_t)maxComputeSamplers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxComputeSamplers];
}

- (unint64_t)maxComputeLocalMemorySizes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxComputeLocalMemorySizes];
}

- (unint64_t)maxComputeInlineDataSize
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxComputeInlineDataSize];
}

- (unint64_t)maxComputeBuffers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxComputeBuffers];
}

- (unint64_t)maxComputeAttributes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxComputeAttributes];
}

- (unint64_t)maxColorAttachments
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxColorAttachments];
}

- (unint64_t)maxBufferLength
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxBufferLength];
}

- (unint64_t)maxArgumentBufferSamplerCount
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxArgumentBufferSamplerCount];
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxAccelerationStructureTraversalDepth];
}

- (unint64_t)linearTextureArrayAlignmentSlice
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject linearTextureArrayAlignmentSlice];
}

- (unint64_t)linearTextureArrayAlignmentBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject linearTextureArrayAlignmentBytes];
}

- (unint64_t)linearTextureAlignmentBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject linearTextureAlignmentBytes];
}

- (const)limits
{
  return (const $8F4FC51FDE2459731A28129D66393995 *)[(MTLDeviceSPI *)self->_baseObject limits];
}

- (unint64_t)latestSupportedGenericBVHVersion
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject latestSupportedGenericBVHVersion];
}

- (BOOL)isLargeMRTSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isLargeMRTSupported];
}

- (unint64_t)iosurfaceTextureAlignmentBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject iosurfaceTextureAlignmentBytes];
}

- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject iosurfaceReadOnlyTextureAlignmentBytes];
}

- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities
{
  return (IndirectArgumentBufferCapabilities)[(MTLDeviceSPI *)self->_baseObject indirectArgumentBufferCapabilities];
}

- (unint64_t)halfFPConfig
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject halfFPConfig];
}

- (BOOL)areGPUAssertionsEnabled
{
  return [(MTLDeviceSPI *)self->_baseObject areGPUAssertionsEnabled];
}

- (BOOL)isFloat32FilteringSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isFloat32FilteringSupported];
}

- (unint64_t)featureProfile
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject featureProfile];
}

- (unint64_t)doubleFPConfig
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject doubleFPConfig];
}

- (unint64_t)deviceLinearTextureAlignmentBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject deviceLinearTextureAlignmentBytes];
}

- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject deviceLinearReadOnlyTextureAlignmentBytes];
}

- (unint64_t)deviceCreationFlags
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject deviceCreationFlags];
}

- (int64_t)defaultTextureWriteRoundingMode
{
  return (int64_t)[(MTLDeviceSPI *)self->_baseObject defaultTextureWriteRoundingMode];
}

- (unint64_t)dedicatedMemorySize
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject dedicatedMemorySize];
}

- (int64_t)currentPerformanceState
{
  return (int64_t)[(MTLDeviceSPI *)self->_baseObject currentPerformanceState];
}

- (unint64_t)currentAllocatedSize
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject currentAllocatedSize];
}

- (NSArray)counterSets
{
  return (NSArray *)[(MTLDeviceSPI *)self->_baseObject counterSets];
}

- (void)setCommandBufferErrorOptions:(unint64_t)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v14);
  [(MTLDeviceSPI *)self->_baseObject setCommandBufferErrorOptions:a3];
  uint64_t v5 = v15;
  *(_DWORD *)(v15 + 8) = -15698;
  char v6 = BYTE9(v16);
  if (BYTE9(v16) > 0x30uLL)
  {
    uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 24);
    uint64_t v9 = BYTE10(v16);
    ++BYTE10(v16);
    id v7 = GTTraceMemPool_allocateBytes(v8, *((uint64_t *)&v15 + 1), v9 | 0x1000000000) + 16;
    char v6 = v9;
  }
  else
  {
    id v7 = (char *)(v5 + BYTE9(v16));
    BYTE9(v16) += 16;
  }
  *(unsigned char *)(v5 + 13) = v6;
  uint64_t v10 = [(CaptureMTLDevice *)self traceStream];
  if (v10) {
    unint64_t var0 = v10->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v7 = var0;
  *((void *)v7 + 1) = a3;
  s();
  *(void *)uint64_t v12 = v13;
  *(unsigned char *)(v12 + 8) = BYTE8(v16);
  *(unsigned char *)(v15 + 15) |= 8u;
}

- (unint64_t)commandBufferErrorOptions
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject commandBufferErrorOptions];
}

- (unint64_t)bufferRobustnessSupport
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject bufferRobustnessSupport];
}

- (BOOL)areBarycentricCoordsSupported
{
  return [(MTLDeviceSPI *)self->_baseObject areBarycentricCoordsSupported];
}

- (unint64_t)argumentBuffersSupport
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject argumentBuffersSupport];
}

- (MTLArchitecture)architecture
{
  return (MTLArchitecture *)[(MTLDeviceSPI *)self->_baseObject architecture];
}

- (unsigned)acceleratorPort
{
  return [(MTLDeviceSPI *)self->_baseObject acceleratorPort];
}

- (BOOL)isRTZRoundingSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isRTZRoundingSupported];
}

- (BOOL)isRGB10A2GammaSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isRGB10A2GammaSupported];
}

- (MTLGPUBVHBuilder)GPUBVHBuilder
{
  return (MTLGPUBVHBuilder *)[(MTLDeviceSPI *)self->_baseObject GPUBVHBuilder];
}

- (BOOL)isFixedLinePointFillDepthGradientSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isFixedLinePointFillDepthGradientSupported];
}

- (BOOL)isCustomBorderColorSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isCustomBorderColorSupported];
}

- (BOOL)isClampToHalfBorderSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isClampToHalfBorderSupported];
}

- (BOOL)isBCTextureCompressionSupported
{
  return [(MTLDeviceSPI *)self->_baseObject isBCTextureCompressionSupported];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CaptureMTLDevice;
  BOOL v3 = [(CaptureMTLDevice *)&v7 description];
  id v4 = [(MTLDeviceSPI *)self->_baseObject description];
  uint64_t v5 = +[NSString stringWithFormat:@"%@ -> %@", v3, v4];

  return (NSString *)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0;
  }
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    unint64_t v4 = atomic_load(&traceStream[1].var1);
    unint64_t v5 = v4;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&traceStream[1].var1, &v5, v4 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  objc_super v7 = v6;
  uint64_t v8 = *v6;
  *BOOL v6 = v9;
  *(void *)&long long v24 = v8;
  BYTE8(v24) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  id v10 = [(MTLDeviceSPI *)self->_baseObject newArgumentEncoderWithBufferBinding:v5];

  if (v10) {
    char v11 = [[CaptureMTLArgumentEncoder alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    char v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLArgumentEncoder *)v11 traceStream]);
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -15261;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    long long v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    long long v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  size_t v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v19 = [(CaptureMTLArgumentEncoder *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)long long v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = 0;
  *objc_super v7 = v24;
  *((unsigned char *)v7 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v11;
}

- (id)newSharedEventWithOptions:(int64_t)a3
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_newSharedEventWithOptions", (uint64_t)"Event with options", 0, 0);
  id v5 = [(MTLDeviceSPI *)self->_baseObject newSharedEventWithOptions:a3];
  if (v5) {
    BOOL v6 = [[CaptureMTLSharedEvent alloc] initWithBaseObject:v5 captureDevice:self];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)newEventWithOptions:(int64_t)a3
{
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_newEventWithOptions", (uint64_t)"Event with options", 0, 0);
  id v5 = [(MTLDeviceSPI *)self->_baseObject newEventWithOptions:a3];
  if (v5) {
    BOOL v6 = [[CaptureMTLEvent alloc] initWithBaseObject:v5 captureDevice:self];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  traceContext = self->_traceContext;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v33);
  baseObject = self->_baseObject;
  uint64_t v15 = objc_msgSend(v13, "baseObject", (void)v33);
  uint64_t v16 = unwrapNSArray(v12);
  size_t v17 = unwrapMTLAccelerationStructureDescriptor(v11);
  [(MTLDeviceSPI *)baseObject deserializeInstanceAccelerationStructure:v15 fromBytes:a4 primitiveAccelerationStructures:v16 withDescriptor:v17];

  uint64_t v18 = copyAndNullifyReferencesInDescriptor(v11);
  [v13 setDescriptor:v18];

  uint64_t v19 = (const void *)*((void *)a4 + 1);
  uint64_t v20 = v34;
  *(_DWORD *)(v34 + 8) = -15363;
  char v21 = BYTE9(v35);
  if (BYTE9(v35) > 0x28uLL)
  {
    uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 24);
    uint64_t v24 = BYTE10(v35);
    ++BYTE10(v35);
    long long v22 = GTTraceMemPool_allocateBytes(v23, *((uint64_t *)&v34 + 1), v24 | 0x1800000000) + 16;
    char v21 = v24;
  }
  else
  {
    long long v22 = (char *)(v20 + BYTE9(v35));
    BYTE9(v35) += 24;
  }
  *(unsigned char *)(v20 + 13) = v21;
  long long v25 = [(CaptureMTLDevice *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v27 = [v13 traceStream];

  if (v27) {
    long long v27 = (void *)*v27;
  }
  char v28 = TransferBytes((uint64_t)&v33, (uint64_t *)a4, v19);
  char v29 = StreamMTLNameArray((uint64_t)&v33, v12);

  char v30 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v33, v11);
  *(void *)long long v22 = var0;
  *((void *)v22 + 1) = v27;
  v22[16] = v28;
  v22[17] = v29;
  v22[18] = v30;
  *(_DWORD *)(v22 + 19) = 0;
  v22[23] = 0;
  s();
  *(void *)uint64_t v31 = v32;
  *(unsigned char *)(v31 + 8) = BYTE8(v35);
  *(unsigned char *)(v34 + 15) |= 8u;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  id v9 = a5;
  id v10 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v28);
  baseObject = self->_baseObject;
  id v12 = objc_msgSend(v10, "baseObject", (void)v28);
  id v13 = unwrapMTLAccelerationStructureDescriptor(v9);
  [(MTLDeviceSPI *)baseObject deserializePrimitiveAccelerationStructure:v12 fromBytes:a4 withDescriptor:v13];

  long long v14 = copyAndNullifyReferencesInDescriptor(v9);
  [v10 setDescriptor:v14];

  uint64_t v15 = (const void *)*((void *)a4 + 1);
  uint64_t v16 = v29;
  *(_DWORD *)(v29 + 8) = -15362;
  char v17 = BYTE9(v30);
  if (BYTE9(v30) > 0x28uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v20 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v29 + 1), v20 | 0x1800000000) + 16;
    char v17 = v20;
  }
  else
  {
    uint64_t v18 = (char *)(v16 + BYTE9(v30));
    BYTE9(v30) += 24;
  }
  *(unsigned char *)(v16 + 13) = v17;
  char v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = [v10 traceStream];

  if (v23) {
    uint64_t v23 = (void *)*v23;
  }
  char v24 = TransferBytes((uint64_t)&v28, (uint64_t *)a4, v15);
  char v25 = SaveMTLAccelerationStructureDescriptor((uint64_t)&v28, v9);

  *(void *)uint64_t v18 = var0;
  *((void *)v18 + 1) = v23;
  v18[16] = v24;
  v18[17] = v25;
  *(_DWORD *)(v18 + 18) = 0;
  *((_WORD *)v18 + 11) = 0;
  s();
  *(void *)uint64_t v26 = v27;
  *(unsigned char *)(v26 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;
}

- (void)compileVisibleFunction:(id)a3 withDescriptor:(id)a4 destinationBinaryArchive:(id)a5 error:(id *)a6
{
  id v10 = a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  traceContext = self->_traceContext;
  id v12 = a5;
  id v13 = a3;
  GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v34);
  baseObject = self->_baseObject;
  uint64_t v15 = objc_msgSend(v13, "baseObject", (void)v34);
  uint64_t v16 = unwrapMTLFunctionDescriptor(v10);
  char v17 = [v12 baseObject];
  [(MTLDeviceSPI *)baseObject compileVisibleFunction:v15 withDescriptor:v16 destinationBinaryArchive:v17 error:a6];

  uint64_t v18 = v35;
  *(_DWORD *)(v35 + 8) = -15475;
  char v19 = BYTE9(v36);
  if (BYTE9(v36) > 0x18uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 24);
    uint64_t v22 = BYTE10(v36);
    ++BYTE10(v36);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v35 + 1), v22 | 0x2800000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v36));
    BYTE9(v36) += 40;
  }
  *(unsigned char *)(v18 + 13) = v19;
  uint64_t v23 = [(CaptureMTLDevice *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v25 = (uint64_t *)[v13 traceStream];
  if (v25) {
    uint64_t v26 = *v25;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v27 = (uint64_t *)[v12 traceStream];

  if (!v27)
  {
    uint64_t v28 = 0;
    if (a6) {
      goto LABEL_12;
    }
LABEL_14:
    id v29 = 0;
    goto LABEL_15;
  }
  uint64_t v28 = *v27;
  if (!a6) {
    goto LABEL_14;
  }
LABEL_12:
  id v29 = *a6;
LABEL_15:
  long long v30 = [v13 functionConstantsDictionary];

  char v31 = SaveMTLFunctionDescriptor((uint64_t)&v34, v10, v30);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = v28;
  *((void *)v20 + 3) = v29;
  v20[32] = v31;
  *(_DWORD *)(v20 + 33) = 0;
  *((_DWORD *)v20 + 9) = 0;

  s();
  *(void *)uint64_t v32 = v33;
  *(unsigned char *)(v32 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  uint64_t v8 = self;
  baseObject = v8->_baseObject;
  id v10 = unwrapMTLStitchedLibraryDescriptor(v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __71__CaptureMTLDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
  v14[3] = &unk_221770;
  uint64_t v15 = v8;
  id v16 = v7;
  id v17 = v6;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  [(MTLDeviceSPI *)baseObject newLibraryWithStitchedDescriptor:v10 completionHandler:v14];
}

void __71__CaptureMTLDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [CaptureMTLLibrary alloc];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) functions];
    id v10 = [(CaptureMTLLibrary *)v7 initWithBaseObject:v5 captureDevice:v8 captureFunctions:v9];
  }
  else
  {
    id v10 = 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  id v11 = objc_msgSend(*(id *)(a1 + 32), "traceContext", 0);
  [(CaptureMTLLibrary *)v10 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v11, (uint64_t)&v24);
  uint64_t v12 = v25;
  *(_DWORD *)(v25 + 8) = -15421;
  char v13 = BYTE9(v26);
  if (BYTE9(v26) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v16 = BYTE10(v26);
    ++BYTE10(v26);
    long long v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v25 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    long long v14 = (char *)(v12 + BYTE9(v26));
    BYTE9(v26) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  SaveMTLLibraryInfoWithPath((uint64_t)&v24, v5, 0);
  id v17 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v17) {
    uint64_t v18 = *v17;
  }
  else {
    uint64_t v18 = 0;
  }
  char v19 = [(CaptureMTLLibrary *)v10 traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v21 = SaveMTLStitchedLibraryDescriptor((uint64_t)&v24, *(void **)(a1 + 40));
  *(void *)long long v14 = v18;
  *((void *)v14 + 1) = var0;
  *((void *)v14 + 2) = 0;
  v14[24] = v21;
  *(_DWORD *)(v14 + 25) = 0;
  *((_DWORD *)v14 + 7) = 0;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v22 = v23;
  *(unsigned char *)(v22 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  traceContext = self->_traceContext;
  long long v29 = (unint64_t)traceContext;
  *(void *)&long long v30 = 0;
  *((void *)&v30 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v31 = v10;
  BYTE8(v31) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v31 + 9) = 16400;
  *(_DWORD *)((char *)&v31 + 11) = 0;
  HIBYTE(v31) = 0;
  baseObject = self->_baseObject;
  char v13 = unwrapMTLStitchedLibraryDescriptor(v6);
  id v14 = [(MTLDeviceSPI *)baseObject newLibraryWithStitchedDescriptor:v13 error:a4];

  if (v14)
  {
    uint64_t v15 = [CaptureMTLLibrary alloc];
    uint64_t v16 = [v6 functions];
    id v17 = [(CaptureMTLLibrary *)v15 initWithBaseObject:v14 captureDevice:self captureFunctions:v16];
  }
  else
  {
    id v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)[(CaptureMTLLibrary *)v17 traceStream]);
  uint64_t v18 = v30;
  *(_DWORD *)(v30 + 8) = -15420;
  char v19 = BYTE9(v31);
  if (BYTE9(v31) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 24);
    uint64_t v22 = BYTE10(v31);
    ++BYTE10(v31);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v30 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v31));
    BYTE9(v31) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  SaveMTLLibraryInfoWithPath((uint64_t)&v29, v14, 0);
  uint64_t v23 = [(CaptureMTLDevice *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v25 = [(CaptureMTLLibrary *)v17 traceStream];
  if (!v25)
  {
    unint64_t v26 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v26 = v25->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  char v27 = SaveMTLStitchedLibraryDescriptor((uint64_t)&v29, v6);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = a4;
  v20[24] = v27;
  *(_DWORD *)(v20 + 25) = 0;
  *((_DWORD *)v20 + 7) = 0;
  *id v9 = v31;
  *((unsigned char *)v9 + 8) = BYTE8(v31);
  *(unsigned char *)(v30 + 15) |= 8u;

  return v17;
}

- (void)newLibraryWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  uint64_t v8 = self;
  baseObject = v8->_baseObject;
  uint64_t v10 = unwrapMTLStitchedLibraryDescriptor(v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __63__CaptureMTLDevice_newLibraryWithDescriptor_completionHandler___block_invoke;
  v14[3] = &unk_221770;
  uint64_t v15 = v8;
  id v16 = v7;
  id v17 = v6;
  id v11 = v6;
  id v12 = v7;
  char v13 = v8;
  [(MTLDeviceSPI *)baseObject newLibraryWithDescriptor:v10 completionHandler:v14];
}

void __63__CaptureMTLDevice_newLibraryWithDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    id v7 = [[CaptureMTLLibrary alloc] initWithBaseObject:v5 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    id v7 = 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "traceContext", 0);
  [(CaptureMTLLibrary *)v7 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v8, (uint64_t)&v21);
  uint64_t v9 = v22;
  *(_DWORD *)(v22 + 8) = -15425;
  char v10 = BYTE9(v23);
  if (BYTE9(v23) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 24);
    uint64_t v13 = BYTE10(v23);
    ++BYTE10(v23);
    id v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v22 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    id v11 = (char *)(v9 + BYTE9(v23));
    BYTE9(v23) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  SaveMTLLibraryInfoWithPath((uint64_t)&v21, v5, 0);
  id v14 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v14) {
    uint64_t v15 = *v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = [(CaptureMTLLibrary *)v7 traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v18 = SaveMTLStitchedLibraryDescriptor((uint64_t)&v21, *(void **)(a1 + 40));
  *(void *)id v11 = v15;
  *((void *)v11 + 1) = var0;
  *((void *)v11 + 2) = 0;
  v11[24] = v18;
  *(_DWORD *)(v11 + 25) = 0;
  *((_DWORD *)v11 + 7) = 0;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v19 = v20;
  *(unsigned char *)(v19 + 8) = BYTE8(v23);
  *(unsigned char *)(v22 + 15) |= 8u;
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  traceContext = self->_traceContext;
  long long v29 = (unint64_t)traceContext;
  *(void *)&long long v30 = 0;
  *((void *)&v30 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v31 = v10;
  BYTE8(v31) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v31 + 9) = 16400;
  *(_DWORD *)((char *)&v31 + 11) = 0;
  HIBYTE(v31) = 0;
  baseObject = self->_baseObject;
  uint64_t v13 = [v6 baseObject];
  id v14 = [(MTLDeviceSPI *)baseObject newDynamicLibrary:v13 error:a4];

  if (v14) {
    uint64_t v15 = [[CaptureMTLDynamicLibrary alloc] initWithBaseObject:v14 captureDevice:self];
  }
  else {
    uint64_t v15 = 0;
  }
  [(CaptureMTLDynamicLibrary *)v15 setParentLibrary:v6];
  GTTraceEncoder_setStream((uint64_t *)&v29, (uint64_t)[(CaptureMTLDynamicLibrary *)v15 traceStream]);
  uint64_t v16 = v30;
  *(_DWORD *)(v30 + 8) = -15695;
  char v17 = BYTE9(v31);
  if (BYTE9(v31) > 0x20uLL)
  {
    uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 24);
    uint64_t v20 = BYTE10(v31);
    ++BYTE10(v31);
    char v18 = GTTraceMemPool_allocateBytes(v19, *((uint64_t *)&v30 + 1), v20 | 0x2000000000) + 16;
    char v17 = v20;
  }
  else
  {
    char v18 = (char *)(v16 + BYTE9(v31));
    BYTE9(v31) += 32;
  }
  *(unsigned char *)(v16 + 13) = v17;
  SaveMTLDynamicLibraryInfo((uint64_t)&v29, v14);
  long long v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v23 = [(CaptureMTLDynamicLibrary *)v15 traceStream];
  if (v23) {
    unint64_t v24 = v23->var0;
  }
  else {
    unint64_t v24 = 0;
  }
  long long v25 = (uint64_t *)[v6 traceStream];
  if (!v25)
  {
    uint64_t v26 = 0;
    if (a4) {
      goto LABEL_15;
    }
LABEL_17:
    id v27 = 0;
    goto LABEL_18;
  }
  uint64_t v26 = *v25;
  if (!a4) {
    goto LABEL_17;
  }
LABEL_15:
  id v27 = *a4;
LABEL_18:
  *(void *)char v18 = var0;
  *((void *)v18 + 1) = v24;
  *((void *)v18 + 2) = v26;
  *((void *)v18 + 3) = v27;
  *uint64_t v9 = v31;
  *((unsigned char *)v9 + 8) = BYTE8(v31);
  *(unsigned char *)(v30 + 15) |= 8u;

  return v15;
}

- (id)newBufferWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v26 = v8;
  BYTE8(v26) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v10 = [(MTLDeviceSPI *)self->_baseObject newBufferWithDescriptor:v4];
  if (v10) {
    uint64_t v11 = [[CaptureMTLBuffer alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLBuffer *)v11 traceStream]);
  if ([v4 contents]) {
    char v12 = TransferBytes((uint64_t)&v24, (uint64_t *)[v4 contents], objc_msgSend(v4, "length"));
  }
  else {
    char v12 = 0;
  }
  uint64_t v13 = v25;
  *(_DWORD *)(v25 + 8) = -15509;
  char v14 = BYTE9(v26);
  if (BYTE9(v26) > 0x28uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v17 = BYTE10(v26);
    ++BYTE10(v26);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v25 + 1), v17 | 0x1800000000) + 16;
    char v14 = v17;
  }
  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v26));
    BYTE9(v26) += 24;
  }
  *(unsigned char *)(v13 + 13) = v14;
  SaveMTLBufferInfo((uint64_t)&v24, v10);
  char v18 = [(CaptureMTLDevice *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v20 = [(CaptureMTLBuffer *)v11 traceStream];
  if (v20) {
    unint64_t v21 = v20->var0;
  }
  else {
    unint64_t v21 = 0;
  }
  char v22 = SaveMTLBufferDescriptor((uint64_t)&v24, v4);
  *(void *)uint64_t v15 = var0;
  *((void *)v15 + 1) = v21;
  v15[16] = v22;
  v15[17] = v12;
  *(_DWORD *)(v15 + 18) = 0;
  *((_WORD *)v15 + 11) = 0;
  *id v7 = v26;
  *((unsigned char *)v7 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v11;
}

- (unint64_t)maxAccelerationStructureLevels
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxAccelerationStructureLevels];
}

- (unint64_t)maxPredicatedNestingDepth
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxPredicatedNestingDepth];
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_newIntersectionFunctionTableWithDescriptor", (uint64_t)"Ray Tracing", 0, 0);
  id v5 = [(MTLDeviceSPI *)self->_baseObject newIntersectionFunctionTableWithDescriptor:v4];
  if (v5) {
    id v6 = [[CaptureMTLIntersectionFunctionTable alloc] initWithBaseObject:v5 captureDevice:self descriptor:v4];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  baseObject = self->_baseObject;
  char v12 = [a3 baseObject];
  uint64_t v13 = unwrapNSArray(v10);
  id v14 = [(MTLDeviceSPI *)baseObject loadDynamicLibrariesForFunction:v12 insertLibraries:v13 options:a5 error:a6];

  id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v14, "count"));
  if ([v14 count])
  {
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = [v14 objectAtIndexedSubscript:v16];
      if (v17)
      {
        char v18 = [CaptureMTLDynamicLibrary alloc];
        uint64_t v19 = [v14 objectAtIndexedSubscript:v16];
        uint64_t v20 = [(CaptureMTLDynamicLibrary *)v18 initWithBaseObject:v19 captureDevice:self];
        [v15 setObject:v20 atIndexedSubscript:v16];
      }
      else
      {
        [v15 setObject:0 atIndexedSubscript:v16];
      }

      ++v16;
    }
    while ((unint64_t)[v14 count] > v16);
  }

  return v15;
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5
{
  id v8 = a4;
  baseObject = self->_baseObject;
  id v10 = [a3 baseObject];
  uint64_t v11 = unwrapNSArray(v8);
  id v12 = [(MTLDeviceSPI *)baseObject loadDynamicLibrariesForFunction:v10 insertLibraries:v11 error:a5];

  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
  if ([v12 count])
  {
    unint64_t v14 = 0;
    do
    {
      id v15 = [v12 objectAtIndexedSubscript:v14];
      if (v15)
      {
        unint64_t v16 = [CaptureMTLDynamicLibrary alloc];
        uint64_t v17 = [v12 objectAtIndexedSubscript:v14];
        char v18 = [(CaptureMTLDynamicLibrary *)v16 initWithBaseObject:v17 captureDevice:self];
        [v13 setObject:v18 atIndexedSubscript:v14];
      }
      else
      {
        [v13 setObject:0 atIndexedSubscript:v14];
      }

      ++v14;
    }
    while ((unint64_t)[v12 count] > v14);
  }

  return v13;
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  baseObject = self->_baseObject;
  uint64_t v9 = unwrapMTLComputePipelineDescriptor(a3);
  id v10 = [(MTLDeviceSPI *)baseObject loadDynamicLibrariesForComputeDescriptor:v9 options:a4 error:a5];

  id v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  if ([v10 count])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [v10 objectAtIndexedSubscript:v12];
      if (v13)
      {
        unint64_t v14 = [CaptureMTLDynamicLibrary alloc];
        id v15 = [v10 objectAtIndexedSubscript:v12];
        unint64_t v16 = [(CaptureMTLDynamicLibrary *)v14 initWithBaseObject:v15 captureDevice:self];
        [v11 setObject:v16 atIndexedSubscript:v12];
      }
      else
      {
        [v11 setObject:0 atIndexedSubscript:v12];
      }

      ++v12;
    }
    while ((unint64_t)[v10 count] > v12);
  }

  return v11;
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4
{
  baseObject = self->_baseObject;
  id v7 = unwrapMTLComputePipelineDescriptor(a3);
  id v8 = [(MTLDeviceSPI *)baseObject loadDynamicLibrariesForComputeDescriptor:v7 error:a4];

  id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  if ([v8 count])
  {
    unint64_t v10 = 0;
    do
    {
      id v11 = [v8 objectAtIndexedSubscript:v10];
      if (v11)
      {
        unint64_t v12 = [CaptureMTLDynamicLibrary alloc];
        id v13 = [v8 objectAtIndexedSubscript:v10];
        unint64_t v14 = [(CaptureMTLDynamicLibrary *)v12 initWithBaseObject:v13 captureDevice:self];
        [v9 setObject:v14 atIndexedSubscript:v10];
      }
      else
      {
        [v9 setObject:0 atIndexedSubscript:v10];
      }

      ++v10;
    }
    while ((unint64_t)[v8 count] > v10);
  }

  return v9;
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  traceContext = self->_traceContext;
  long long v37 = (unint64_t)traceContext;
  *(void *)&long long v38 = 0;
  *((void *)&v38 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  unint64_t v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  *(void *)&long long v39 = v13;
  BYTE8(v39) = *((unsigned char *)v11 + 8);
  *(_WORD *)((char *)&v39 + 9) = 16400;
  *(_DWORD *)((char *)&v39 + 11) = 0;
  HIBYTE(v39) = 0;
  baseObject = self->_baseObject;
  unint64_t v16 = unwrapNSArray(v9);
  id v17 = [(MTLDeviceSPI *)baseObject newLibraryWithDAG:v8 functions:v16 error:a5];

  if (v17) {
    char v18 = [[CaptureMTLLibrary alloc] initWithBaseObject:v17 captureDevice:self captureFunctions:v9];
  }
  else {
    char v18 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v37, (uint64_t)[(CaptureMTLLibrary *)v18 traceStream]);
  uint64_t v19 = v38;
  *(_DWORD *)(v38 + 8) = -15693;
  char v20 = BYTE9(v39);
  long long v36 = v9;
  if (BYTE9(v39) > 0x20uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 24);
    uint64_t v23 = BYTE10(v39);
    ++BYTE10(v39);
    unint64_t v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v38 + 1), v23 | 0x2000000000) + 16;
    char v20 = v23;
  }
  else
  {
    unint64_t v21 = (char *)(v19 + BYTE9(v39));
    BYTE9(v39) += 32;
  }
  *(unsigned char *)(v19 + 13) = v20;
  SaveMTLLibraryInfoWithPath((uint64_t)&v37, v17, 0);
  long long v24 = [(CaptureMTLDevice *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v26 = [(CaptureMTLLibrary *)v18 traceStream];
  if (v26)
  {
    unint64_t v27 = v26->var0;
    if (a5)
    {
LABEL_12:
      id v28 = *a5;
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v27 = 0;
    if (a5) {
      goto LABEL_12;
    }
  }
  id v28 = 0;
LABEL_15:
  id v29 = v8;
  if ([v29 UTF8String])
  {
    id v30 = v29;
    id v31 = [v30 UTF8String];
    size_t v32 = strlen((const char *)[v30 UTF8String]);
    char v33 = GTTraceEncoder_storeBytes((uint64_t)&v37, v31, v32 + 1);
  }
  else
  {
    char v33 = 0;
  }
  char v34 = StreamMTLNameArray((uint64_t)&v37, v36);
  *(void *)unint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = v28;
  v21[24] = v33;
  v21[25] = v34;
  *(_DWORD *)(v21 + 26) = 0;
  *((_WORD *)v21 + 15) = 0;
  *unint64_t v12 = v39;
  *((unsigned char *)v12 + 8) = BYTE8(v39);
  *(unsigned char *)(v38 + 15) |= 8u;

  return v18;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  id v10 = a6;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  traceContext = self->_traceContext;
  long long v39 = (unint64_t)traceContext;
  *(void *)&long long v40 = 0;
  *((void *)&v40 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  *unint64_t v12 = v15;
  *(void *)&long long v41 = v14;
  BYTE8(v41) = *((unsigned char *)v12 + 8);
  *(_WORD *)((char *)&v41 + 9) = 16400;
  *(_DWORD *)((char *)&v41 + 11) = 0;
  HIBYTE(v41) = 0;
  id v16 = [(MTLDeviceSPI *)self->_baseObject newBufferWithBytesNoCopy:a3 length:a4 options:a5 deallocator:v10];
  if (v16) {
    id v17 = [[CaptureMTLBuffer alloc] initWithBaseObject:v16 captureDevice:self];
  }
  else {
    id v17 = 0;
  }
  char v18 = [(CaptureMTLBuffer *)v17 traceStream];
  if (v18)
  {
    unint64_t v19 = atomic_load(&v18[1].var1);
    unint64_t v20 = v19;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&v18[1].var1, &v20, v19 | 3);
      BOOL v21 = v20 == v19;
      unint64_t v19 = v20;
    }
    while (!v21);
  }
  if (v17) {
    CaptureMTLBuffer_registerBaseBufferForTracing(v17->_baseObject, (uint64_t)v17->_traceStream, 0);
  }
  GTTraceEncoder_setStream((uint64_t *)&v39, (uint64_t)[(CaptureMTLBuffer *)v17 traceStream]);
  uint64_t v22 = v40;
  *(_DWORD *)(v40 + 8) = -16312;
  char v23 = BYTE9(v41);
  if (BYTE9(v41) > 0x10uLL)
  {
    uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 24);
    long long v38 = self;
    id v26 = v16;
    unint64_t v27 = a4;
    id v28 = v10;
    id v29 = a3;
    unint64_t v30 = a5;
    uint64_t v31 = BYTE10(v41);
    ++BYTE10(v41);
    long long v24 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v40 + 1), v31 | 0x3000000000) + 16;
    char v23 = v31;
    a5 = v30;
    a3 = v29;
    id v10 = v28;
    a4 = v27;
    id v16 = v26;
    self = v38;
  }
  else
  {
    long long v24 = (char *)(v22 + BYTE9(v41));
    BYTE9(v41) += 48;
  }
  *(unsigned char *)(v22 + 13) = v23;
  SaveMTLBufferInfo((uint64_t)&v39, v16);
  size_t v32 = [(CaptureMTLDevice *)self traceStream];
  if (v32) {
    unint64_t var0 = v32->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v34 = [(CaptureMTLBuffer *)v17 traceStream];
  if (v34) {
    unint64_t v35 = v34->var0;
  }
  else {
    unint64_t v35 = 0;
  }
  char v36 = TransferBytes((uint64_t)&v39, (uint64_t *)a3, (const void *)a4);
  *(void *)long long v24 = var0;
  *((void *)v24 + 1) = v35;
  *((void *)v24 + 2) = a4;
  *((void *)v24 + 3) = a5;
  *((void *)v24 + 4) = v10;
  v24[40] = v36;
  *(_DWORD *)(v24 + 41) = 0;
  *((_DWORD *)v24 + 11) = 0;
  *uint64_t v13 = v41;
  *((unsigned char *)v13 + 8) = BYTE8(v41);
  *(unsigned char *)(v40 + 15) |= 8u;

  return v17;
}

- (unint64_t)sparseTileSizeInBytes
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject sparseTileSizeInBytes];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sparseTileSizeWithTextureType:(SEL)a3 pixelFormat:(unint64_t)a4 sampleCount:(unint64_t)a5
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  retstr->unint64_t var0 = 0;
  retstr->var1 = 0;
  retstr->unint64_t var2 = 0;
  baseObject = self->_baseObject;
  if (baseObject) {
    [(MTLDeviceSPI *)baseObject sparseTileSizeWithTextureType:a4 pixelFormat:a5 sampleCount:a6];
  }
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -15737;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 8uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x3800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 56;
  }
  *(unsigned char *)(v12 + 13) = v13;
  id v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t var2 = retstr->var2;
  *(void *)uint64_t v14 = var0;
  *(_OWORD *)(v14 + 8) = *(_OWORD *)&retstr->var0;
  *((void *)v14 + 3) = var2;
  *((void *)v14 + 4) = a4;
  *((void *)v14 + 5) = a5;
  *((void *)v14 + 6) = a6;
  s();
  result->unint64_t var0 = v21;
  LOBYTE(result->var1) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
  return result;
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  long long v23 = (unint64_t)traceContext;
  *(void *)&long long v24 = 0;
  *((void *)&v24 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v25 = v8;
  BYTE8(v25) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v25 + 9) = 16400;
  *(_DWORD *)((char *)&v25 + 11) = 0;
  HIBYTE(v25) = 0;
  id v10 = [(MTLDeviceSPI *)self->_baseObject newRasterizationRateMapWithDescriptor:v4];
  if (v10) {
    id v11 = [[CaptureMTLRasterizationRateMap alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    id v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v23, (uint64_t)[(CaptureMTLRasterizationRateMap *)v11 traceStream]);
  uint64_t v12 = v24;
  *(_DWORD *)(v24 + 8) = -15793;
  char v13 = BYTE9(v25);
  if (BYTE9(v25) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v16 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v24 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v25));
    BYTE9(v25) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  id v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v19 = [(CaptureMTLRasterizationRateMap *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  char v21 = SaveMTLRasterizationRateMapDescriptor((uint64_t)&v23, v4);
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  v14[16] = v21;
  *(_DWORD *)(v14 + 17) = 0;
  *((_DWORD *)v14 + 5) = 0;
  *id v7 = v25;
  *((unsigned char *)v7 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;

  return v11;
}

- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  uint64_t v8 = a4;
  id v9 = [(MTLDeviceSPI *)self->_baseObject newFunctionWithGLIR:a3 inputsDescription:v8 functionType:a5];
  if (v9)
  {
    id v10 = [[CaptureMTLFunction alloc] initWithBaseObject:v9 captureDevice:self];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    traceContext = self->_traceContext;
    [(CaptureMTLFunction *)v10 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v28);
    uint64_t v12 = *(unsigned int *)a3;
    uint64_t v13 = v29;
    *(_DWORD *)(v29 + 8) = -15730;
    char v14 = BYTE9(v30);
    if (BYTE9(v30) > 0x20uLL)
    {
      uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 24);
      uint64_t v17 = BYTE10(v30);
      ++BYTE10(v30);
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v29 + 1), v17 | 0x2000000000) + 16;
      char v14 = v17;
    }
    else
    {
      uint64_t v15 = (char *)(v13 + BYTE9(v30));
      BYTE9(v30) += 32;
    }
    uint64_t v18 = v12 + 4;
    *(unsigned char *)(v13 + 13) = v14;
    SaveMTLFunctionInfo((uint64_t)&v28, v9, 0);
    unint64_t v19 = [(CaptureMTLDevice *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    char v21 = [(CaptureMTLFunction *)v10 traceStream];
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0;
    }
    char v23 = GTTraceEncoder_storeBlob((uint64_t)&v28, a3, v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      RetainDebugObject(v9);
      char v24 = 0;
    }
    else
    {
      char v24 = SaveDispatchData_((uint64_t)&v28, v8);
    }
    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = v22;
    *((void *)v15 + 2) = a5;
    v15[24] = v23;
    v15[25] = v24;
    *(_DWORD *)(v15 + 26) = 0;
    *((_WORD *)v15 + 15) = 0;
    s();
    *(void *)uint64_t v25 = v26;
    *(unsigned char *)(v25 + 8) = BYTE8(v30);
    *(unsigned char *)(v29 + 15) |= 8u;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4
{
  id v7 = -[MTLDeviceSPI newFunctionWithGLIR:functionType:](self->_baseObject, "newFunctionWithGLIR:functionType:");
  if (v7)
  {
    uint64_t v8 = [[CaptureMTLFunction alloc] initWithBaseObject:v7 captureDevice:self];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    traceContext = self->_traceContext;
    [(CaptureMTLFunction *)v8 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v25);
    uint64_t v10 = *(unsigned int *)a3;
    uint64_t v11 = v26;
    *(_DWORD *)(v26 + 8) = -15731;
    char v12 = BYTE9(v27);
    if (BYTE9(v27) > 0x20uLL)
    {
      uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v15 = BYTE10(v27);
      ++BYTE10(v27);
      uint64_t v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v26 + 1), v15 | 0x2000000000) + 16;
      char v12 = v15;
    }
    else
    {
      uint64_t v13 = (char *)(v11 + BYTE9(v27));
      BYTE9(v27) += 32;
    }
    uint64_t v16 = v10 + 4;
    *(unsigned char *)(v11 + 13) = v12;
    SaveMTLFunctionInfo((uint64_t)&v25, v7, 0);
    uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    unint64_t v19 = [(CaptureMTLFunction *)v8 traceStream];
    if (v19) {
      unint64_t v20 = v19->var0;
    }
    else {
      unint64_t v20 = 0;
    }
    char v21 = GTTraceEncoder_storeBlob((uint64_t)&v25, a3, v16);
    *(void *)uint64_t v13 = var0;
    *((void *)v13 + 1) = v20;
    *((void *)v13 + 2) = a4;
    v13[24] = v21;
    *(_DWORD *)(v13 + 25) = 0;
    *((_DWORD *)v13 + 7) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(unsigned char *)(v22 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  uint64_t v8 = a4;
  id v9 = [(MTLDeviceSPI *)self->_baseObject newFunctionWithGLESIR:a3 inputsDescription:v8 functionType:a5];
  if (v9)
  {
    uint64_t v10 = [[CaptureMTLFunction alloc] initWithBaseObject:v9 captureDevice:self];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    traceContext = self->_traceContext;
    [(CaptureMTLFunction *)v10 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v28);
    uint64_t v12 = *(unsigned int *)a3;
    uint64_t v13 = v29;
    *(_DWORD *)(v29 + 8) = -15427;
    char v14 = BYTE9(v30);
    if (BYTE9(v30) > 0x20uLL)
    {
      uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 24);
      uint64_t v17 = BYTE10(v30);
      ++BYTE10(v30);
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v29 + 1), v17 | 0x2000000000) + 16;
      char v14 = v17;
    }
    else
    {
      uint64_t v15 = (char *)(v13 + BYTE9(v30));
      BYTE9(v30) += 32;
    }
    uint64_t v18 = v12 + 4;
    *(unsigned char *)(v13 + 13) = v14;
    SaveMTLFunctionInfo((uint64_t)&v28, v9, 0);
    unint64_t v19 = [(CaptureMTLDevice *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    char v21 = [(CaptureMTLFunction *)v10 traceStream];
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0;
    }
    char v23 = GTTraceEncoder_storeBlob((uint64_t)&v28, a3, v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      RetainDebugObject(v9);
      char v24 = 0;
    }
    else
    {
      char v24 = SaveDispatchData_((uint64_t)&v28, v8);
    }
    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = v22;
    *((void *)v15 + 2) = a5;
    v15[24] = v23;
    v15[25] = v24;
    *(_DWORD *)(v15 + 26) = 0;
    *((_WORD *)v15 + 15) = 0;
    s();
    *(void *)uint64_t v25 = v26;
    *(unsigned char *)(v25 + 8) = BYTE8(v30);
    *(unsigned char *)(v29 + 15) |= 8u;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4
{
  id v7 = -[MTLDeviceSPI newFunctionWithGLESIR:functionType:](self->_baseObject, "newFunctionWithGLESIR:functionType:");
  if (v7)
  {
    uint64_t v8 = [[CaptureMTLFunction alloc] initWithBaseObject:v7 captureDevice:self];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    traceContext = self->_traceContext;
    [(CaptureMTLFunction *)v8 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v25);
    uint64_t v10 = *(unsigned int *)a3;
    uint64_t v11 = v26;
    *(_DWORD *)(v26 + 8) = -15428;
    char v12 = BYTE9(v27);
    if (BYTE9(v27) > 0x20uLL)
    {
      uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v15 = BYTE10(v27);
      ++BYTE10(v27);
      uint64_t v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v26 + 1), v15 | 0x2000000000) + 16;
      char v12 = v15;
    }
    else
    {
      uint64_t v13 = (char *)(v11 + BYTE9(v27));
      BYTE9(v27) += 32;
    }
    uint64_t v16 = v10 + 4;
    *(unsigned char *)(v11 + 13) = v12;
    SaveMTLFunctionInfo((uint64_t)&v25, v7, 0);
    uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    unint64_t v19 = [(CaptureMTLFunction *)v8 traceStream];
    if (v19) {
      unint64_t v20 = v19->var0;
    }
    else {
      unint64_t v20 = 0;
    }
    char v21 = GTTraceEncoder_storeBlob((uint64_t)&v25, a3, v16);
    *(void *)uint64_t v13 = var0;
    *((void *)v13 + 1) = v20;
    *((void *)v13 + 2) = a4;
    v13[24] = v21;
    *(_DWORD *)(v13 + 25) = 0;
    *((_DWORD *)v13 + 7) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(unsigned char *)(v22 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  uint64_t v8 = a4;
  id v9 = [(MTLDeviceSPI *)self->_baseObject newFunctionWithGLCoreIR:a3 inputsDescription:v8 functionType:a5];
  if (v9)
  {
    uint64_t v10 = [[CaptureMTLFunction alloc] initWithBaseObject:v9 captureDevice:self];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    traceContext = self->_traceContext;
    [(CaptureMTLFunction *)v10 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v28);
    uint64_t v12 = *(unsigned int *)a3;
    uint64_t v13 = v29;
    *(_DWORD *)(v29 + 8) = -15429;
    char v14 = BYTE9(v30);
    if (BYTE9(v30) > 0x20uLL)
    {
      uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 24);
      uint64_t v17 = BYTE10(v30);
      ++BYTE10(v30);
      uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v29 + 1), v17 | 0x2000000000) + 16;
      char v14 = v17;
    }
    else
    {
      uint64_t v15 = (char *)(v13 + BYTE9(v30));
      BYTE9(v30) += 32;
    }
    uint64_t v18 = v12 + 4;
    *(unsigned char *)(v13 + 13) = v14;
    SaveMTLFunctionInfo((uint64_t)&v28, v9, 0);
    unint64_t v19 = [(CaptureMTLDevice *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    char v21 = [(CaptureMTLFunction *)v10 traceStream];
    if (v21) {
      unint64_t v22 = v21->var0;
    }
    else {
      unint64_t v22 = 0;
    }
    char v23 = GTTraceEncoder_storeBlob((uint64_t)&v28, a3, v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      RetainDebugObject(v9);
      char v24 = 0;
    }
    else
    {
      char v24 = SaveDispatchData_((uint64_t)&v28, v8);
    }
    *(void *)uint64_t v15 = var0;
    *((void *)v15 + 1) = v22;
    *((void *)v15 + 2) = a5;
    v15[24] = v23;
    v15[25] = v24;
    *(_DWORD *)(v15 + 26) = 0;
    *((_WORD *)v15 + 15) = 0;
    s();
    *(void *)uint64_t v25 = v26;
    *(unsigned char *)(v25 + 8) = BYTE8(v30);
    *(unsigned char *)(v29 + 15) |= 8u;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4
{
  id v7 = -[MTLDeviceSPI newFunctionWithGLCoreIR:functionType:](self->_baseObject, "newFunctionWithGLCoreIR:functionType:");
  if (v7)
  {
    uint64_t v8 = [[CaptureMTLFunction alloc] initWithBaseObject:v7 captureDevice:self];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    traceContext = self->_traceContext;
    [(CaptureMTLFunction *)v8 traceStream];
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v25);
    uint64_t v10 = *(unsigned int *)a3;
    uint64_t v11 = v26;
    *(_DWORD *)(v26 + 8) = -15430;
    char v12 = BYTE9(v27);
    if (BYTE9(v27) > 0x20uLL)
    {
      uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 24);
      uint64_t v15 = BYTE10(v27);
      ++BYTE10(v27);
      uint64_t v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v26 + 1), v15 | 0x2000000000) + 16;
      char v12 = v15;
    }
    else
    {
      uint64_t v13 = (char *)(v11 + BYTE9(v27));
      BYTE9(v27) += 32;
    }
    uint64_t v16 = v10 + 4;
    *(unsigned char *)(v11 + 13) = v12;
    SaveMTLFunctionInfo((uint64_t)&v25, v7, 0);
    uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    unint64_t v19 = [(CaptureMTLFunction *)v8 traceStream];
    if (v19) {
      unint64_t v20 = v19->var0;
    }
    else {
      unint64_t v20 = 0;
    }
    char v21 = GTTraceEncoder_storeBlob((uint64_t)&v25, a3, v16);
    *(void *)uint64_t v13 = var0;
    *((void *)v13 + 1) = v20;
    *((void *)v13 + 2) = a4;
    v13[24] = v21;
    *(_DWORD *)(v13 + 25) = 0;
    *((_DWORD *)v13 + 7) = 0;
    s();
    *(void *)uint64_t v22 = v23;
    *(unsigned char *)(v22 + 8) = BYTE8(v27);
    *(unsigned char *)(v26 + 15) |= 8u;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)minTilePixels
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject minTilePixels];
}

- (unint64_t)maxTileTextures
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTileTextures];
}

- (unint64_t)maxTileSamplers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTileSamplers];
}

- (unint64_t)maxTileInlineDataSize
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTileInlineDataSize];
}

- (unint64_t)maxTileBuffers
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject maxTileBuffers];
}

- (unint64_t)recommendedMaxWorkingSetSize
{
  return (unint64_t)[(MTLDeviceSPI *)self->_baseObject recommendedMaxWorkingSetSize];
}

- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MTLDeviceSPI *)self->_baseObject newPipelineLibraryWithFilePath:v6 error:a4];
  if (!v7)
  {
    uint64_t v8 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = [[CaptureMTLPipelineLibrary alloc] initWithBaseObject:v7 captureDevice:self];
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLDevice_newPipelineLibraryWithFilePath_error", (uint64_t)"Pipeline Libraries SPI", (uint64_t)"metallibPaths SPI property is not available", 0);
      goto LABEL_20;
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    traceContext = self->_traceContext;
    long long v34 = (unint64_t)traceContext;
    *(void *)&long long v35 = 0;
    *((void *)&v35 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
    s();
    uint64_t v11 = v10;
    uint64_t v12 = *v10;
    *uint64_t v10 = v13;
    *(void *)&long long v36 = v12;
    BYTE8(v36) = *((unsigned char *)v10 + 8);
    *(_WORD *)((char *)&v36 + 9) = 16400;
    *(_DWORD *)((char *)&v36 + 11) = 0;
    HIBYTE(v36) = 0;
    GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)[(CaptureMTLPipelineLibrary *)v8 traceStream]);
    uint64_t v14 = v35;
    *(_DWORD *)(v35 + 8) = -16075;
    char v15 = BYTE9(v36);
    if (BYTE9(v36) > 0x20uLL)
    {
      uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 24);
      uint64_t v18 = BYTE10(v36);
      ++BYTE10(v36);
      uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v35 + 1), v18 | 0x2000000000) + 16;
      char v15 = v18;
    }
    else
    {
      uint64_t v16 = (char *)(v14 + BYTE9(v36));
      BYTE9(v36) += 32;
    }
    *(unsigned char *)(v14 + 13) = v15;
    unint64_t v19 = DEVICEOBJECT(v7);
    id v20 = v6;
    SaveMTLPipelineLibraryInfoWithPath((uint64_t)&v34, v19, (const char *)[v20 fileSystemRepresentation]);

    char v21 = [(CaptureMTLDevice *)self traceStream];
    if (v21) {
      unint64_t var0 = v21->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v23 = [(CaptureMTLPipelineLibrary *)v8 traceStream];
    if (v23)
    {
      unint64_t v24 = v23->var0;
      if (a4)
      {
LABEL_14:
        id v25 = *a4;
LABEL_17:
        id v26 = v20;
        id v27 = [v26 UTF8String];
        if (v27)
        {
          id v28 = v26;
          unint64_t v29 = var0;
          id v30 = [v28 UTF8String];
          size_t v31 = strlen((const char *)[v28 UTF8String]);
          size_t v32 = v30;
          unint64_t var0 = v29;
          LOBYTE(v27) = GTTraceEncoder_storeBytes((uint64_t)&v34, v32, v31 + 1);
        }
        *(void *)uint64_t v16 = var0;
        *((void *)v16 + 1) = v24;
        *((void *)v16 + 2) = v25;
        v16[24] = (char)v27;
        *(_DWORD *)(v16 + 25) = 0;
        *((_DWORD *)v16 + 7) = 0;
        uint64_t *v11 = v36;
        *((unsigned char *)v11 + 8) = BYTE8(v36);
        *(unsigned char *)(v35 + 15) |= 8u;
        goto LABEL_20;
      }
    }
    else
    {
      unint64_t v24 = 0;
      if (a4) {
        goto LABEL_14;
      }
    }
    id v25 = 0;
    goto LABEL_17;
  }
LABEL_20:

  return v8;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v28 = v8;
  BYTE8(v28) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  id v10 = [(MTLDeviceSPI *)self->_baseObject newSharedTextureWithHandle:v4];
  if (v10) {
    uint64_t v11 = [[CaptureMTLTexture alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLTexture *)v11 traceStream]);
  uint64_t v12 = v27;
  *(_DWORD *)(v27 + 8) = -15980;
  char v13 = BYTE9(v28);
  if (BYTE9(v28) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v16 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v27 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v28));
    BYTE9(v28) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  SaveMTLTextureInfo((uint64_t)&v26, v10);
  uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v19 = [(CaptureMTLTexture *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  id v21 = [v4 ioSurface];
  uint64_t v22 = [(CaptureMTLTexture *)v11 baseObject];
  uint64_t v23 = MakeMTLTextureDescriptorFromTextureWithResourceIndex(v22);
  char v24 = SaveMTLTextureDescriptor((uint64_t)&v26, v23);
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = v21;
  v14[24] = v24;
  *(_DWORD *)(v14 + 25) = 0;
  *((_DWORD *)v14 + 7) = 0;

  *id v7 = v28;
  *((unsigned char *)v7 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v11;
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v26 = v8;
  BYTE8(v26) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v10 = [(MTLDeviceSPI *)self->_baseObject newSharedTextureWithDescriptor:v4];
  if (v10) {
    uint64_t v11 = [[CaptureMTLTexture alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLTexture *)v11 traceStream]);
  uint64_t v12 = v25;
  *(_DWORD *)(v25 + 8) = -15980;
  char v13 = BYTE9(v26);
  if (BYTE9(v26) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v16 = BYTE10(v26);
    ++BYTE10(v26);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v25 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v26));
    BYTE9(v26) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLDevice *)self dummyEncodeTextureIntoArgumentBufferForResourceIndex:v10 withDescriptor:v4];

  SaveMTLTextureInfo((uint64_t)&v24, v10);
  uint64_t v18 = [(CaptureMTLDevice *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v20 = [(CaptureMTLTexture *)v11 traceStream];
  if (v20) {
    unint64_t v21 = v20->var0;
  }
  else {
    unint64_t v21 = 0;
  }
  char v22 = SaveMTLTextureDescriptor((uint64_t)&v24, v17);
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v21;
  *((void *)v14 + 2) = 0;
  v14[24] = v22;
  *(_DWORD *)(v14 + 25) = 0;
  *((_DWORD *)v14 + 7) = 0;
  *id v7 = v26;
  *((unsigned char *)v7 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v11;
}

- (id)newResourceGroupFromResources:(const void *)a3 count:(unint64_t)a4
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  traceContext = self->_traceContext;
  long long v34 = (unint64_t)traceContext;
  *(void *)&long long v35 = 0;
  *((void *)&v35 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v36 = v10;
  BYTE8(v36) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v36 + 9) = 16400;
  *(_DWORD *)((char *)&v36 + 11) = 0;
  HIBYTE(v36) = 0;
  baseObject = self->_baseObject;
  size_t v14 = 8 * v13;
  __chkstk_darwin(v8, v15);
  bzero((char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
  if (a4)
  {
    uint64_t v16 = a3;
    uint64_t v17 = (void *)((char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v18 = a4;
    do
    {
      unint64_t v19 = (void *)*v16++;
      *v17++ = [v19 baseObject];
      --v18;
    }
    while (v18);
  }
  id v20 = [(MTLDeviceSPI *)baseObject newResourceGroupFromResources:(char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0) count:a4];
  if (v20) {
    unint64_t v21 = [[CaptureMTLResourceGroup alloc] initWithBaseObject:v20 captureDevice:self];
  }
  else {
    unint64_t v21 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)[(CaptureMTLResourceGroup *)v21 traceStream]);
  uint64_t v22 = v35;
  *(_DWORD *)(v35 + 8) = -15900;
  char v23 = BYTE9(v36);
  if (BYTE9(v36) > 0x20uLL)
  {
    uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 24);
    uint64_t v26 = BYTE10(v36);
    ++BYTE10(v36);
    long long v24 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v35 + 1), v26 | 0x2000000000) + 16;
    char v23 = v26;
  }
  else
  {
    long long v24 = (char *)(v22 + BYTE9(v36));
    BYTE9(v36) += 32;
  }
  *(unsigned char *)(v22 + 13) = v23;
  long long v27 = [(CaptureMTLDevice *)self traceStream];
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v29 = [(CaptureMTLResourceGroup *)v21 traceStream];
  if (v29) {
    unint64_t v31 = v29->var0;
  }
  else {
    unint64_t v31 = 0;
  }
  __chkstk_darwin(v29, v30);
  bzero((char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
  char v32 = StreamArray((uint64_t)&v34, (long long *)((char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0)), (id *)a3, a4);
  *(void *)long long v24 = var0;
  *((void *)v24 + 1) = v31;
  *((void *)v24 + 2) = a4;
  v24[24] = v32;
  *(_DWORD *)(v24 + 25) = 0;
  *((_DWORD *)v24 + 7) = 0;
  *uint64_t v9 = v36;
  *((unsigned char *)v9 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;

  return v21;
}

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v27 = v10;
  BYTE8(v27) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newCounterSampleBufferWithDescriptor:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLCounterSampleBuffer alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLCounterSampleBuffer *)v13 traceStream]);
  uint64_t v14 = v26;
  *(_DWORD *)(v26 + 8) = -15848;
  char v15 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v18 = BYTE10(v27);
    ++BYTE10(v27);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v26 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  unint64_t v19 = [(CaptureMTLDevice *)self traceStream];
  if (v19) {
    unint64_t var0 = v19->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v21 = [(CaptureMTLCounterSampleBuffer *)v13 traceStream];
  if (!v21)
  {
    unint64_t v22 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v22 = v21->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  char v23 = SaveMTLCounterSampleBufferDescriptor((uint64_t)&v25, v6);
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v22;
  *((void *)v16 + 2) = a4;
  v16[24] = v23;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *uint64_t v9 = v27;
  *((unsigned char *)v9 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;

  return v13;
}

- (BOOL)supportsPrimitiveType:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v16);
  if (objc_opt_respondsToSelector()) {
    unsigned int v5 = [(MTLDeviceSPI *)self->_baseObject supportsPrimitiveType:a3];
  }
  else {
    unsigned int v5 = 0;
  }
  uint64_t v6 = v17;
  *(_DWORD *)(v17 + 8) = -15902;
  char v7 = BYTE9(v18);
  if (BYTE9(v18) > 0x28uLL)
  {
    uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 24);
    uint64_t v10 = BYTE10(v18);
    ++BYTE10(v18);
    uint64_t v8 = GTTraceMemPool_allocateBytes(v9, *((uint64_t *)&v17 + 1), v10 | 0x1800000000) + 16;
    char v7 = v10;
  }
  else
  {
    uint64_t v8 = (char *)(v6 + BYTE9(v18));
    BYTE9(v18) += 24;
  }
  *(unsigned char *)(v6 + 13) = v7;
  uint64_t v11 = [(CaptureMTLDevice *)self traceStream];
  if (v11) {
    unint64_t var0 = v11->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)uint64_t v8 = var0;
  *((void *)v8 + 1) = a3;
  *((_DWORD *)v8 + 4) = v5;
  *((_DWORD *)v8 + 5) = 0;
  s();
  *(void *)uint64_t v13 = v14;
  *(unsigned char *)(v13 + 8) = BYTE8(v18);
  *(unsigned char *)(v17 + 15) |= 8u;
  return v5;
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  traceContext = self->_traceContext;
  long long v33 = (unint64_t)traceContext;
  *(void *)&long long v34 = 0;
  *((void *)&v34 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v35 = v10;
  BYTE8(v35) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v35 + 9) = 16400;
  *(_DWORD *)((char *)&v35 + 11) = 0;
  HIBYTE(v35) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newDefaultLibraryWithBundle:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLLibrary alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v33, (uint64_t)[(CaptureMTLLibrary *)v13 traceStream]);
  uint64_t v14 = [v6 URLForResource:@"default" withExtension:@"metallib"];
  uint64_t v15 = v34;
  *(_DWORD *)(v34 + 8) = -16095;
  char v16 = BYTE9(v35);
  char v32 = v6;
  if (BYTE9(v35) > 0x20uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 24);
    uint64_t v19 = BYTE10(v35);
    ++BYTE10(v35);
    long long v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v34 + 1), v19 | 0x2000000000) + 16;
    char v16 = v19;
  }
  else
  {
    long long v17 = (char *)(v15 + BYTE9(v35));
    BYTE9(v35) += 32;
  }
  *(unsigned char *)(v15 + 13) = v16;
  id v20 = v14;
  SaveMTLLibraryInfoWithPath((uint64_t)&v33, v12, (const char *)[v20 fileSystemRepresentation]);
  unint64_t v21 = [(CaptureMTLDevice *)self traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v23 = [(CaptureMTLLibrary *)v13 traceStream];
  if (v23)
  {
    unint64_t v24 = v23->var0;
    if (a4)
    {
LABEL_12:
      id v25 = *a4;
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v24 = 0;
    if (a4) {
      goto LABEL_12;
    }
  }
  id v25 = 0;
LABEL_15:
  id v26 = v20;
  id v27 = [v26 fileSystemRepresentation];
  if (v27)
  {
    id v28 = v26;
    id v29 = [v28 fileSystemRepresentation];
    size_t v30 = strlen((const char *)[v28 fileSystemRepresentation]);
    LOBYTE(v27) = GTTraceEncoder_storeBytes((uint64_t)&v33, v29, v30 + 1);
  }
  *(void *)long long v17 = var0;
  *((void *)v17 + 1) = v24;
  *((void *)v17 + 2) = v25;
  v17[24] = (char)v27;
  *(_DWORD *)(v17 + 25) = 0;
  *((_DWORD *)v17 + 7) = 0;
  *uint64_t v9 = v35;
  *((unsigned char *)v9 + 8) = BYTE8(v35);
  *(unsigned char *)(v34 + 15) |= 8u;

  return v13;
}

- (id)newDefaultLibrary
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  unsigned int v5 = v4;
  uint64_t v6 = *v4;
  *id v4 = v7;
  *(void *)&long long v30 = v6;
  BYTE8(v30) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  id v8 = [(MTLDeviceSPI *)self->_baseObject newDefaultLibrary];
  if (v8) {
    uint64_t v9 = [[CaptureMTLLibrary alloc] initWithBaseObject:v8 captureDevice:self];
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLLibrary *)v9 traceStream]);
  uint64_t v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 URLForResource:@"default" withExtension:@"metallib"];

  uint64_t v12 = v29;
  *(_DWORD *)(v29 + 8) = -16308;
  char v13 = BYTE9(v30);
  if (BYTE9(v30) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v16 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v29 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v30));
    BYTE9(v30) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  id v17 = v11;
  SaveMTLLibraryInfoWithPath((uint64_t)&v28, v8, (const char *)[v17 fileSystemRepresentation]);
  uint64_t v18 = [(CaptureMTLDevice *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v20 = [(CaptureMTLLibrary *)v9 traceStream];
  if (v20) {
    unint64_t v21 = v20->var0;
  }
  else {
    unint64_t v21 = 0;
  }
  id v22 = v17;
  id v23 = [v22 fileSystemRepresentation];
  if (v23)
  {
    id v24 = v22;
    id v25 = [v24 fileSystemRepresentation];
    size_t v26 = strlen((const char *)[v24 fileSystemRepresentation]);
    LOBYTE(v23) = GTTraceEncoder_storeBytes((uint64_t)&v28, v25, v26 + 1);
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v21;
  v14[16] = (char)v23;
  *(_DWORD *)(v14 + 17) = 0;
  *((_DWORD *)v14 + 5) = 0;
  *unsigned int v5 = v30;
  *((unsigned char *)v5 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;

  return v9;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  traceContext = self->_traceContext;
  long long v46 = (unint64_t)traceContext;
  *(void *)&long long v47 = 0;
  *((void *)&v47 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  char v13 = v12;
  uint64_t v14 = *v12;
  *uint64_t v12 = v15;
  *(void *)&long long v48 = v14;
  BYTE8(v48) = *((unsigned char *)v12 + 8);
  *(_WORD *)((char *)&v48 + 9) = 16400;
  *(_DWORD *)((char *)&v48 + 11) = 0;
  HIBYTE(v48) = 0;
  baseObject = self->_baseObject;
  id v17 = unwrapMTLTileRenderPipelineDescriptor(v10);
  if (self->_isBaseObjectDebugDevice) {
    unint64_t v18 = a4;
  }
  else {
    unint64_t v18 = a4 & 4 | 0x50003;
  }
  id v45 = 0;
  uint64_t v19 = baseObject;
  id v20 = a6;
  id v21 = [(MTLDeviceSPI *)v19 newRenderPipelineStateWithTileDescriptor:v17 options:v18 reflection:&v45 error:a6];
  id v22 = v45;

  if (v21) {
    id v23 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v21 captureDevice:self];
  }
  else {
    id v23 = 0;
  }
  [(CaptureMTLRenderPipelineState *)v23 setTileDescriptor:v10];
  if ([v10 supportAddingBinaryFunctions]) {
    [(CaptureMTLRenderPipelineState *)v23 setReflection:v22];
  }
  v42 = a5;
  GTTraceEncoder_setStream((uint64_t *)&v46, (uint64_t)[(CaptureMTLRenderPipelineState *)v23 traceStream]);
  uint64_t v24 = v47;
  *(_DWORD *)(v47 + 8) = -16090;
  char v25 = BYTE9(v48);
  id v43 = v21;
  if (BYTE9(v48) > 0x18uLL)
  {
    uint64_t v27 = *(void *)(*((void *)&v46 + 1) + 24);
    uint64_t v28 = BYTE10(v48);
    ++BYTE10(v48);
    size_t v26 = GTTraceMemPool_allocateBytes(v27, *((uint64_t *)&v47 + 1), v28 | 0x2800000000) + 16;
    char v25 = v28;
    id v21 = v43;
  }
  else
  {
    size_t v26 = (char *)(v24 + BYTE9(v48));
    BYTE9(v48) += 40;
  }
  *(unsigned char *)(v24 + 13) = v25;
  long long v29 = LoadDynamicLibrariesForTileRenderPipelineDescriptor(v10);
  SaveMTLRenderPipelineReflection((uint64_t)&v46, v21, v22, v29);

  long long v30 = [(CaptureMTLDevice *)self traceStream];
  if (v30) {
    unint64_t var0 = v30->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v32 = [(CaptureMTLRenderPipelineState *)v23 traceStream];
  if (v32) {
    unint64_t v33 = v32->var0;
  }
  else {
    unint64_t v33 = 0;
  }
  long long v41 = v20;
  if (v20) {
    id v20 = (id *)*v20;
  }
  char v34 = SaveMTLTileRenderPipelineDescriptor((uint64_t)&v46, v10);
  *(void *)size_t v26 = var0;
  *((void *)v26 + 1) = v33;
  *((void *)v26 + 2) = a4;
  *((void *)v26 + 3) = v20;
  v26[32] = v34;
  *(_DWORD *)(v26 + 33) = 0;
  *((_DWORD *)v26 + 9) = 0;
  if (a4)
  {
    long long v35 = v43;
    if (v42)
    {
      if ((~(_BYTE)a4 & 3) != 0 && !self->_isBaseObjectDebugDevice)
      {
        long long v36 = DEVICEOBJECT(self->_baseObject);
        long long v37 = deviceMTLTileRenderPipelineDescriptor(v10);
        id v44 = v22;
        id v38 = [v36 newRenderPipelineStateWithTileDescriptor:v37 options:a4 reflection:&v44 error:v41];
        id v39 = v44;

        long long v35 = v43;
        id v22 = v39;
      }
      id v22 = v22;
      id *v42 = v22;
    }
  }
  else
  {
    long long v35 = v43;
  }
  *char v13 = v48;
  *((unsigned char *)v13 + 8) = BYTE8(v48);
  *(unsigned char *)(v47 + 15) |= 8u;

  return v23;
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 copy];
  id v10 = self;
  baseObject = v10->_baseObject;
  uint64_t v12 = unwrapMTLTileRenderPipelineDescriptor(v9);
  BOOL v13 = !v10->_isBaseObjectDebugDevice;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __87__CaptureMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke;
  v18[3] = &unk_221748;
  if (v13) {
    uint64_t v14 = 327683;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v19 = v10;
  id v20 = v9;
  id v21 = v8;
  unint64_t v22 = a4;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  [(MTLDeviceSPI *)baseObject newRenderPipelineStateWithTileDescriptor:v12 options:v14 completionHandler:v18];
}

void __87__CaptureMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    id v10 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v7 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    id v10 = 0;
  }
  id v11 = *(id *)(a1 + 40);
  [(CaptureMTLRenderPipelineState *)v10 setTileDescriptor:v11];
  if ([v11 supportAddingBinaryFunctions]) {
    [(CaptureMTLRenderPipelineState *)v10 setReflection:v8];
  }
  long long v41 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = [*(id *)(a1 + 32) traceContext];
  [(CaptureMTLRenderPipelineState *)v10 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v39);
  uint64_t v13 = v40;
  *(_DWORD *)(v40 + 8) = -16088;
  char v14 = BYTE9(v41);
  if (BYTE9(v41) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v39 + 1) + 24);
    uint64_t v17 = BYTE10(v41);
    ++BYTE10(v41);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v40 + 1), v17 | 0x2800000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v41));
    BYTE9(v41) += 40;
  }
  *(unsigned char *)(v13 + 13) = v14;
  unint64_t v18 = LoadDynamicLibrariesForTileRenderPipelineDescriptor(v11);
  SaveMTLRenderPipelineReflection((uint64_t)&v39, v7, v8, v18);

  uint64_t v19 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  id v21 = [(CaptureMTLRenderPipelineState *)v10 traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = *(void *)(a1 + 56);
  char v24 = SaveMTLTileRenderPipelineDescriptor((uint64_t)&v39, v11);
  *(void *)id v15 = v20;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = v23;
  *((void *)v15 + 3) = 0;
  v15[32] = v24;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  char v25 = *(unsigned char **)(a1 + 32);
  if (!v25[325] && (~*(_DWORD *)(a1 + 56) & 3) != 0)
  {
    size_t v26 = [v25 baseObject];
    uint64_t v27 = DEVICEOBJECT(v26);
    uint64_t v28 = deviceMTLTileRenderPipelineDescriptor(*(void **)(a1 + 40));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    long long v36 = v39;
    long long v37 = v40;
    v32[2] = __87__CaptureMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke_2;
    v32[3] = &unk_221658;
    long long v38 = v41;
    uint64_t v29 = *(void *)(a1 + 56);
    id v35 = *(id *)(a1 + 48);
    unint64_t v33 = v10;
    id v34 = v9;
    [v27 newRenderPipelineStateWithTileDescriptor:v28 options:v29 completionHandler:v32];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v41);
  *(unsigned char *)(v40 + 15) |= 8u;
}

void __87__CaptureMTLDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  *id v7 = v8;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v33 = v10;
  BYTE8(v33) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  baseObject = self->_baseObject;
  uint64_t v13 = unwrapMTLTileRenderPipelineDescriptor(v6);
  if (self->_isBaseObjectDebugDevice) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 327683;
  }
  id v30 = 0;
  id v15 = [(MTLDeviceSPI *)baseObject newRenderPipelineStateWithTileDescriptor:v13 options:v14 reflection:&v30 error:a4];
  id v16 = v30;

  if (v15) {
    uint64_t v17 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v15 captureDevice:self];
  }
  else {
    uint64_t v17 = 0;
  }
  [(CaptureMTLRenderPipelineState *)v17 setTileDescriptor:v6];
  if ([v6 supportAddingBinaryFunctions]) {
    [(CaptureMTLRenderPipelineState *)v17 setReflection:v16];
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLRenderPipelineState *)v17 traceStream]);
  uint64_t v18 = v32;
  *(_DWORD *)(v32 + 8) = -16091;
  char v19 = BYTE9(v33);
  if (BYTE9(v33) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v22 = BYTE10(v33);
    ++BYTE10(v33);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v32 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v33));
    BYTE9(v33) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  uint64_t v23 = LoadDynamicLibrariesForTileRenderPipelineDescriptor(v6);
  SaveMTLRenderPipelineReflection((uint64_t)&v31, v15, v16, v23);

  char v24 = [(CaptureMTLDevice *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  size_t v26 = [(CaptureMTLRenderPipelineState *)v17 traceStream];
  if (!v26)
  {
    unint64_t v27 = 0;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  unint64_t v27 = v26->var0;
  if (a4) {
LABEL_17:
  }
    a4 = (id *)*a4;
LABEL_18:
  char v28 = SaveMTLTileRenderPipelineDescriptor((uint64_t)&v31, v6);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v27;
  *((void *)v20 + 2) = a4;
  v20[24] = v28;
  *(_DWORD *)(v20 + 25) = 0;
  *((_DWORD *)v20 + 7) = 0;
  *id v9 = v33;
  *((unsigned char *)v9 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;

  return v17;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 copy];
  uint64_t v10 = self;
  baseObject = v10->_baseObject;
  id v12 = unwrapMTLMeshRenderPipelineDescriptor(v9);
  BOOL isBaseObjectDebugDevice = v10->_isBaseObjectDebugDevice;
  uint64_t v14 = [v9 pipelineLibrary];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __87__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke;
  v19[3] = &unk_221680;
  uint64_t v15 = 327683;
  if (v14) {
    uint64_t v15 = 65539;
  }
  uint64_t v20 = v10;
  uint64_t v21 = v10;
  id v23 = v8;
  unint64_t v24 = a4;
  if (!isBaseObjectDebugDevice) {
    a4 = v15 | a4 & 4;
  }
  id v22 = v9;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = v10;
  [(MTLDeviceSPI *)baseObject newRenderPipelineStateWithMeshDescriptor:v12 options:a4 completionHandler:v19];
}

void __87__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    uint64_t v10 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v7 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [*(id *)(a1 + 40) dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v7 withMeshDescriptor:*(void *)(a1 + 48)];
  [(CaptureMTLRenderPipelineState *)v10 setMeshDescriptor:v11];
  long long v40 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = [*(id *)(a1 + 32) traceContext];
  [(CaptureMTLRenderPipelineState *)v10 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v38);
  uint64_t v13 = v39;
  *(_DWORD *)(v39 + 8) = -15404;
  char v14 = BYTE9(v40);
  if (BYTE9(v40) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v38 + 1) + 24);
    uint64_t v17 = BYTE10(v40);
    ++BYTE10(v40);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v39 + 1), v17 | 0x2800000000) + 16;
    char v14 = v17;
  }
  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v40));
    BYTE9(v40) += 40;
  }
  *(unsigned char *)(v13 + 13) = v14;
  SaveMTLRenderPipelineReflection((uint64_t)&v38, v7, v8, 0);
  uint64_t v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = [(CaptureMTLRenderPipelineState *)v10 traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = *(void *)(a1 + 64);
  char v23 = SaveMTLMeshRenderPipelineDescriptor((uint64_t)&v38, v11);
  *(void *)uint64_t v15 = v19;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = v22;
  *((void *)v15 + 3) = 0;
  v15[32] = v23;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  unint64_t v24 = *(unsigned char **)(a1 + 32);
  if (!v24[325] && (~*(_DWORD *)(a1 + 64) & 3) != 0)
  {
    char v25 = [v24 baseObject];
    size_t v26 = DEVICEOBJECT(v25);
    unint64_t v27 = deviceMTLMeshRenderPipelineDescriptorWithoutResourceIndex(*(void **)(a1 + 48));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    long long v35 = v38;
    long long v36 = v39;
    v31[2] = __87__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke_2;
    v31[3] = &unk_221658;
    long long v37 = v40;
    uint64_t v28 = *(void *)(a1 + 64);
    id v34 = *(id *)(a1 + 56);
    long long v32 = v10;
    id v33 = v9;
    [v26 newRenderPipelineStateWithMeshDescriptor:v27 options:v28 completionHandler:v31];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v29 = v30;
  *(unsigned char *)(v29 + 8) = BYTE8(v40);
  *(unsigned char *)(v39 + 15) |= 8u;
}

void __87__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  *id v7 = v8;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  traceContext = self->_traceContext;
  long long v48 = (unint64_t)traceContext;
  *(void *)&long long v49 = 0;
  *((void *)&v49 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  *(void *)&long long v50 = v13;
  BYTE8(v50) = *((unsigned char *)v11 + 8);
  *(_WORD *)((char *)&v50 + 9) = 16400;
  *(_DWORD *)((char *)&v50 + 11) = 0;
  HIBYTE(v50) = 0;
  baseObject = self->_baseObject;
  uint64_t v16 = unwrapMTLMeshRenderPipelineDescriptor(v9);
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  uint64_t v18 = [v9 pipelineLibrary];
  uint64_t v19 = 65539;
  if (!v18) {
    uint64_t v19 = 327683;
  }
  if (isBaseObjectDebugDevice) {
    unint64_t v20 = a4;
  }
  else {
    unint64_t v20 = v19 | a4 & 4;
  }
  id v47 = 0;
  id v43 = a6;
  id v21 = -[MTLDeviceSPI newRenderPipelineStateWithMeshDescriptor:options:reflection:error:](baseObject, "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", v16, v20, &v47, a6, a5);
  id v22 = v47;

  if (v21) {
    char v23 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v21 captureDevice:self];
  }
  else {
    char v23 = 0;
  }
  id v44 = v9;
  id v45 = [(CaptureMTLDevice *)self dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v21 withMeshDescriptor:v9];
  -[CaptureMTLRenderPipelineState setMeshDescriptor:](v23, "setMeshDescriptor:");
  GTTraceEncoder_setStream((uint64_t *)&v48, (uint64_t)[(CaptureMTLRenderPipelineState *)v23 traceStream]);
  uint64_t v24 = v49;
  *(_DWORD *)(v49 + 8) = -15403;
  char v25 = BYTE9(v50);
  if (BYTE9(v50) > 0x18uLL)
  {
    uint64_t v27 = *(void *)(*((void *)&v48 + 1) + 24);
    uint64_t v28 = BYTE10(v50);
    ++BYTE10(v50);
    size_t v26 = GTTraceMemPool_allocateBytes(v27, *((uint64_t *)&v49 + 1), v28 | 0x2800000000) + 16;
    char v25 = v28;
  }
  else
  {
    size_t v26 = (char *)(v24 + BYTE9(v50));
    BYTE9(v50) += 40;
  }
  *(unsigned char *)(v24 + 13) = v25;
  SaveMTLRenderPipelineReflection((uint64_t)&v48, v21, v22, 0);
  uint64_t v29 = [(CaptureMTLDevice *)self traceStream];
  if (v29) {
    unint64_t var0 = v29->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v31 = [(CaptureMTLRenderPipelineState *)v23 traceStream];
  if (v31) {
    unint64_t v32 = v31->var0;
  }
  else {
    unint64_t v32 = 0;
  }
  if (v43) {
    id v33 = *v43;
  }
  else {
    id v33 = 0;
  }
  char v34 = SaveMTLMeshRenderPipelineDescriptor((uint64_t)&v48, v45);
  *(void *)size_t v26 = var0;
  *((void *)v26 + 1) = v32;
  *((void *)v26 + 2) = a4;
  *((void *)v26 + 3) = v33;
  v26[32] = v34;
  *(_DWORD *)(v26 + 33) = 0;
  *((_DWORD *)v26 + 9) = 0;
  if (a4)
  {
    long long v35 = v44;
    if (v42)
    {
      if ((~(_BYTE)a4 & 3) != 0 && !self->_isBaseObjectDebugDevice)
      {
        long long v36 = DEVICEOBJECT(self->_baseObject);
        long long v37 = deviceMTLMeshRenderPipelineDescriptorWithoutResourceIndex(v44);
        id v46 = v22;
        id v38 = [v36 newRenderPipelineStateWithMeshDescriptor:v37 options:a4 reflection:&v46 error:v43];
        id v39 = v46;

        long long v35 = v44;
        id v22 = v39;
      }
      id v22 = v22;
      void *v42 = v22;
    }
  }
  else
  {
    long long v35 = v44;
  }
  *id v12 = v50;
  *((unsigned char *)v12 + 8) = BYTE8(v50);
  *(unsigned char *)(v49 + 15) |= 8u;

  return v23;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  uint64_t v8 = self;
  baseObject = v8->_baseObject;
  uint64_t v10 = unwrapMTLMeshRenderPipelineDescriptor(v7);
  BOOL isBaseObjectDebugDevice = v8->_isBaseObjectDebugDevice;
  id v12 = [v7 pipelineLibrary];
  uint64_t v13 = 65539;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __79__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v18[3] = &unk_221630;
  if (!v12) {
    uint64_t v13 = 327683;
  }
  uint64_t v19 = v8;
  unint64_t v20 = v8;
  if (isBaseObjectDebugDevice) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v13;
  }
  id v21 = v7;
  id v22 = v6;
  id v15 = v6;
  id v16 = v7;
  uint64_t v17 = v8;
  [(MTLDeviceSPI *)baseObject newRenderPipelineStateWithMeshDescriptor:v10 options:v14 completionHandler:v18];
}

void __79__CaptureMTLDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    uint64_t v10 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v7 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [*(id *)(a1 + 40) dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v7 withMeshDescriptor:*(void *)(a1 + 48)];
  [(CaptureMTLRenderPipelineState *)v10 setMeshDescriptor:v11];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  id v12 = objc_msgSend(*(id *)(a1 + 32), "traceContext", 0);
  [(CaptureMTLRenderPipelineState *)v10 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v25);
  uint64_t v13 = v26;
  *(_DWORD *)(v26 + 8) = -15406;
  char v14 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v17 = BYTE10(v27);
    ++BYTE10(v27);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v26 + 1), v17 | 0x2000000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v13 + 13) = v14;
  SaveMTLRenderPipelineReflection((uint64_t)&v25, v7, v8, 0);
  uint64_t v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0;
  }
  unint64_t v20 = [(CaptureMTLRenderPipelineState *)v10 traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v22 = SaveMTLMeshRenderPipelineDescriptor((uint64_t)&v25, v11);
  *(void *)id v15 = v19;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = 0;
  v15[24] = v22;
  *(_DWORD *)(v15 + 25) = 0;
  *((_DWORD *)v15 + 7) = 0;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v23 = v24;
  *(unsigned char *)(v23 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  traceContext = self->_traceContext;
  long long v34 = (unint64_t)traceContext;
  *(void *)&long long v35 = 0;
  *((void *)&v35 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v36 = v10;
  BYTE8(v36) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v36 + 9) = 16400;
  *(_DWORD *)((char *)&v36 + 11) = 0;
  HIBYTE(v36) = 0;
  baseObject = self->_baseObject;
  uint64_t v13 = unwrapMTLMeshRenderPipelineDescriptor(v6);
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  id v15 = [v6 pipelineLibrary];
  uint64_t v16 = 65539;
  if (!v15) {
    uint64_t v16 = 327683;
  }
  if (isBaseObjectDebugDevice) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v16;
  }
  id v33 = 0;
  id v18 = [(MTLDeviceSPI *)baseObject newRenderPipelineStateWithMeshDescriptor:v13 options:v17 reflection:&v33 error:a4];
  id v19 = v33;

  if (v18) {
    unint64_t v20 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v18 captureDevice:self];
  }
  else {
    unint64_t v20 = 0;
  }
  id v21 = [(CaptureMTLDevice *)self dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v18 withMeshDescriptor:v6];

  [(CaptureMTLRenderPipelineState *)v20 setMeshDescriptor:v21];
  GTTraceEncoder_setStream((uint64_t *)&v34, (uint64_t)[(CaptureMTLRenderPipelineState *)v20 traceStream]);
  uint64_t v22 = v35;
  *(_DWORD *)(v35 + 8) = -15405;
  char v23 = BYTE9(v36);
  if (BYTE9(v36) > 0x20uLL)
  {
    uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 24);
    uint64_t v26 = BYTE10(v36);
    ++BYTE10(v36);
    uint64_t v24 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v35 + 1), v26 | 0x2000000000) + 16;
    char v23 = v26;
  }
  else
  {
    uint64_t v24 = (char *)(v22 + BYTE9(v36));
    BYTE9(v36) += 32;
  }
  *(unsigned char *)(v22 + 13) = v23;
  SaveMTLRenderPipelineReflection((uint64_t)&v34, v18, v19, 0);
  long long v27 = [(CaptureMTLDevice *)self traceStream];
  if (v27) {
    unint64_t var0 = v27->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v29 = [(CaptureMTLRenderPipelineState *)v20 traceStream];
  if (!v29)
  {
    unint64_t v30 = 0;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  unint64_t v30 = v29->var0;
  if (a4) {
LABEL_17:
  }
    a4 = (id *)*a4;
LABEL_18:
  char v31 = SaveMTLMeshRenderPipelineDescriptor((uint64_t)&v34, v21);
  *(void *)uint64_t v24 = var0;
  *((void *)v24 + 1) = v30;
  *((void *)v24 + 2) = a4;
  v24[24] = v31;
  *(_DWORD *)(v24 + 25) = 0;
  *((_DWORD *)v24 + 7) = 0;
  *id v9 = v36;
  *((unsigned char *)v9 + 8) = BYTE8(v36);
  *(unsigned char *)(v35 + 15) |= 8u;

  return v20;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  traceContext = self->_traceContext;
  long long v52 = (unint64_t)traceContext;
  *(void *)&long long v53 = 0;
  *((void *)&v53 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  *(void *)&long long v54 = v13;
  BYTE8(v54) = *((unsigned char *)v11 + 8);
  *(_WORD *)((char *)&v54 + 9) = 16400;
  *(_DWORD *)((char *)&v54 + 11) = 0;
  HIBYTE(v54) = 0;
  baseObject = self->_baseObject;
  uint64_t v16 = unwrapMTLRenderPipelineDescriptor(v9);
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  id v18 = [v9 pipelineLibrary];
  uint64_t v19 = 65539;
  if (!v18) {
    uint64_t v19 = 327683;
  }
  unint64_t v48 = a4;
  long long v49 = a6;
  if (isBaseObjectDebugDevice) {
    unint64_t v20 = a4;
  }
  else {
    unint64_t v20 = v19 | a4 & 4;
  }
  id v51 = 0;
  id v21 = -[MTLDeviceSPI newRenderPipelineStateWithDescriptor:options:reflection:error:](baseObject, "newRenderPipelineStateWithDescriptor:options:reflection:error:", v16, v20, &v51, a6, a5);
  id v22 = v51;

  if (v21) {
    char v23 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v21 captureDevice:self];
  }
  else {
    char v23 = 0;
  }
  uint64_t v24 = [(CaptureMTLDevice *)self dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v21 withDescriptor:v9];
  [(CaptureMTLRenderPipelineState *)v23 setDescriptor:v24];
  if (([v24 supportAddingVertexBinaryFunctions] & 1) != 0
    || [v24 supportAddingFragmentBinaryFunctions])
  {
    [(CaptureMTLRenderPipelineState *)v23 setReflection:v22];
  }
  GTTraceEncoder_setStream((uint64_t *)&v52, (uint64_t)[(CaptureMTLRenderPipelineState *)v23 traceStream]);
  uint64_t v25 = v53;
  *(_DWORD *)(v53 + 8) = -16302;
  char v26 = BYTE9(v54);
  if (BYTE9(v54) > 0x18uLL)
  {
    uint64_t v28 = *(void *)(*((void *)&v52 + 1) + 24);
    uint64_t v29 = BYTE10(v54);
    ++BYTE10(v54);
    long long v27 = GTTraceMemPool_allocateBytes(v28, *((uint64_t *)&v53 + 1), v29 | 0x2800000000) + 16;
    char v26 = v29;
  }
  else
  {
    long long v27 = (char *)(v25 + BYTE9(v54));
    BYTE9(v54) += 40;
  }
  *(unsigned char *)(v25 + 13) = v26;
  unint64_t v30 = LoadDynamicLibrariesForRenderPipelineDescriptor(v24);
  SaveMTLRenderPipelineReflection((uint64_t)&v52, v21, v22, v30);

  char v31 = [(CaptureMTLDevice *)self traceStream];
  if (v31) {
    unint64_t var0 = v31->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v33 = [(CaptureMTLRenderPipelineState *)v23 traceStream];
  id v47 = v12;
  if (v33) {
    unint64_t v34 = v33->var0;
  }
  else {
    unint64_t v34 = 0;
  }
  long long v35 = v9;
  if (v49) {
    id v36 = *v49;
  }
  else {
    id v36 = 0;
  }
  char v37 = SaveMTLRenderPipelineDescriptor((uint64_t)&v52, v24);
  *(void *)long long v27 = var0;
  *((void *)v27 + 1) = v34;
  *((void *)v27 + 2) = v48;
  *((void *)v27 + 3) = v36;
  v27[32] = v37;
  *(_DWORD *)(v27 + 33) = 0;
  *((_DWORD *)v27 + 9) = 0;
  id v38 = v35;
  if (v48 && v46)
  {
    if ((~(_BYTE)v48 & 3) != 0 && !self->_isBaseObjectDebugDevice)
    {
      id v39 = DEVICEOBJECT(self->_baseObject);
      long long v40 = deviceMTLRenderPipelineDescriptorWithoutResourceIndex(v35);
      id v50 = v22;
      id v41 = [v39 newRenderPipelineStateWithDescriptor:v40 options:v48 reflection:&v50 error:v49];
      id v42 = v50;

      id v22 = v42;
    }
    id v43 = v47;
    id v22 = v22;
    *id v46 = v22;
  }
  else
  {
    id v43 = v47;
  }
  *id v43 = v54;
  *((unsigned char *)v43 + 8) = BYTE8(v54);
  *(unsigned char *)(v53 + 15) |= 8u;

  return v23;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  traceContext = self->_traceContext;
  long long v35 = (unint64_t)traceContext;
  *(void *)&long long v36 = 0;
  *((void *)&v36 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v37 = v10;
  BYTE8(v37) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v37 + 9) = 16400;
  *(_DWORD *)((char *)&v37 + 11) = 0;
  HIBYTE(v37) = 0;
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  uint64_t v13 = [v6 pipelineLibrary];
  uint64_t v14 = 65539;
  if (!v13) {
    uint64_t v14 = 327683;
  }
  if (isBaseObjectDebugDevice) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v14;
  }

  baseObject = self->_baseObject;
  uint64_t v17 = unwrapMTLRenderPipelineDescriptor(v6);
  id v34 = 0;
  id v18 = [(MTLDeviceSPI *)baseObject newRenderPipelineStateWithDescriptor:v17 options:v15 reflection:&v34 error:a4];
  id v19 = v34;

  if (v18) {
    unint64_t v20 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v18 captureDevice:self];
  }
  else {
    unint64_t v20 = 0;
  }
  id v21 = [(CaptureMTLDevice *)self dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v18 withDescriptor:v6];

  [(CaptureMTLRenderPipelineState *)v20 setDescriptor:v21];
  if (([v21 supportAddingVertexBinaryFunctions] & 1) != 0
    || [v21 supportAddingFragmentBinaryFunctions])
  {
    [(CaptureMTLRenderPipelineState *)v20 setReflection:v19];
  }
  GTTraceEncoder_setStream((uint64_t *)&v35, (uint64_t)[(CaptureMTLRenderPipelineState *)v20 traceStream]);
  uint64_t v22 = v36;
  *(_DWORD *)(v36 + 8) = -16303;
  char v23 = BYTE9(v37);
  if (BYTE9(v37) > 0x20uLL)
  {
    uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 24);
    uint64_t v26 = BYTE10(v37);
    ++BYTE10(v37);
    uint64_t v24 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v36 + 1), v26 | 0x2000000000) + 16;
    char v23 = v26;
  }
  else
  {
    uint64_t v24 = (char *)(v22 + BYTE9(v37));
    BYTE9(v37) += 32;
  }
  *(unsigned char *)(v22 + 13) = v23;
  long long v27 = LoadDynamicLibrariesForRenderPipelineDescriptor(v21);
  SaveMTLRenderPipelineReflection((uint64_t)&v35, v18, v19, v27);

  uint64_t v28 = [(CaptureMTLDevice *)self traceStream];
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v30 = [(CaptureMTLRenderPipelineState *)v20 traceStream];
  if (!v30)
  {
    unint64_t v31 = 0;
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  unint64_t v31 = v30->var0;
  if (a4) {
LABEL_20:
  }
    a4 = (id *)*a4;
LABEL_21:
  char v32 = SaveMTLRenderPipelineDescriptor((uint64_t)&v35, v21);
  *(void *)uint64_t v24 = var0;
  *((void *)v24 + 1) = v31;
  *((void *)v24 + 2) = a4;
  v24[24] = v32;
  *(_DWORD *)(v24 + 25) = 0;
  *((_DWORD *)v24 + 7) = 0;
  *id v9 = v37;
  *((unsigned char *)v9 + 8) = BYTE8(v37);
  *(unsigned char *)(v36 + 15) |= 8u;

  return v20;
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  traceContext = self->_traceContext;
  long long v44 = (unint64_t)traceContext;
  *(void *)&long long v45 = 0;
  *((void *)&v45 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  *id v12 = v15;
  *(void *)&long long v46 = v14;
  BYTE8(v46) = *((unsigned char *)v12 + 8);
  *(_WORD *)((char *)&v46 + 9) = 16400;
  *(_DWORD *)((char *)&v46 + 11) = 0;
  HIBYTE(v46) = 0;
  baseObject = self->_baseObject;
  uint64_t v17 = [v10 baseObject];
  if (self->_isBaseObjectDebugDevice) {
    unint64_t v18 = a4;
  }
  else {
    unint64_t v18 = a4 & 4 | 0x50003;
  }
  id v43 = 0;
  id v41 = a6;
  id v19 = [(MTLDeviceSPI *)baseObject newComputePipelineStateWithFunction:v17 options:v18 reflection:&v43 error:a6];
  id v20 = v43;

  if (v19) {
    id v21 = [[CaptureMTLComputePipelineState alloc] initWithBaseObject:v19 captureDevice:self];
  }
  else {
    id v21 = 0;
  }
  -[CaptureMTLComputePipelineState setFunction:](v21, "setFunction:", v10, a5);
  GTTraceEncoder_setStream((uint64_t *)&v44, (uint64_t)[(CaptureMTLComputePipelineState *)v21 traceStream]);
  uint64_t v22 = v45;
  *(_DWORD *)(v45 + 8) = -16298;
  char v23 = BYTE9(v46);
  if (BYTE9(v46) > 0x10uLL)
  {
    uint64_t v25 = *(void *)(*((void *)&v44 + 1) + 24);
    uint64_t v26 = BYTE10(v46);
    ++BYTE10(v46);
    uint64_t v24 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v45 + 1), v26 | 0x3000000000) + 16;
    char v23 = v26;
  }
  else
  {
    uint64_t v24 = (char *)(v22 + BYTE9(v46));
    BYTE9(v46) += 48;
  }
  *(unsigned char *)(v22 + 13) = v23;
  long long v27 = [v10 baseObject];
  SaveMTLComputePipelineReflection((uint64_t)&v44, v19, v20, 0, v27);

  uint64_t v28 = [(CaptureMTLDevice *)self traceStream];
  if (v28) {
    unint64_t var0 = v28->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v30 = [(CaptureMTLComputePipelineState *)v21 traceStream];
  if (v30) {
    unint64_t v31 = v30->var0;
  }
  else {
    unint64_t v31 = 0;
  }
  char v32 = (uint64_t *)[v10 traceStream];
  if (v32) {
    uint64_t v33 = *v32;
  }
  else {
    uint64_t v33 = 0;
  }
  if (v41) {
    id v34 = *v41;
  }
  else {
    id v34 = 0;
  }
  *(void *)uint64_t v24 = var0;
  *((void *)v24 + 1) = v31;
  *((void *)v24 + 2) = v33;
  *((void *)v24 + 3) = a4;
  *((void *)v24 + 4) = v34;
  *((void *)v24 + 5) = 0;
  if (a4 && v40)
  {
    if ((~(_BYTE)a4 & 3) != 0 && !self->_isBaseObjectDebugDevice)
    {
      long long v35 = DEVICEOBJECT(self->_baseObject);
      long long v36 = DEVICEOBJECT(v10);
      id v42 = v20;
      id v37 = [v35 newComputePipelineStateWithFunction:v36 options:a4 reflection:&v42 error:v41];
      id v38 = v42;

      id v20 = v38;
    }
    id v20 = v20;
    *long long v40 = v20;
  }
  *uint64_t v13 = v46;
  *((unsigned char *)v13 + 8) = BYTE8(v46);
  *(unsigned char *)(v45 + 15) |= 8u;

  return v21;
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  traceContext = self->_traceContext;
  long long v33 = (unint64_t)traceContext;
  *(void *)&long long v34 = 0;
  *((void *)&v34 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v35 = v10;
  BYTE8(v35) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v35 + 9) = 16400;
  *(_DWORD *)((char *)&v35 + 11) = 0;
  HIBYTE(v35) = 0;
  baseObject = self->_baseObject;
  uint64_t v13 = [v6 baseObject];
  if (self->_isBaseObjectDebugDevice) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 327683;
  }
  id v32 = 0;
  id v15 = [(MTLDeviceSPI *)baseObject newComputePipelineStateWithFunction:v13 options:v14 reflection:&v32 error:a4];
  id v16 = v32;

  if (v15) {
    uint64_t v17 = [[CaptureMTLComputePipelineState alloc] initWithBaseObject:v15 captureDevice:self];
  }
  else {
    uint64_t v17 = 0;
  }
  [(CaptureMTLComputePipelineState *)v17 setFunction:v6];
  GTTraceEncoder_setStream((uint64_t *)&v33, (uint64_t)[(CaptureMTLComputePipelineState *)v17 traceStream]);
  uint64_t v18 = v34;
  *(_DWORD *)(v34 + 8) = -16299;
  char v19 = BYTE9(v35);
  if (BYTE9(v35) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 24);
    uint64_t v22 = BYTE10(v35);
    ++BYTE10(v35);
    id v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v34 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    id v20 = (char *)(v18 + BYTE9(v35));
    BYTE9(v35) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  char v23 = [v6 baseObject];
  SaveMTLComputePipelineReflection((uint64_t)&v33, v15, v16, 0, v23);

  uint64_t v24 = [(CaptureMTLDevice *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v26 = [(CaptureMTLComputePipelineState *)v17 traceStream];
  if (v26) {
    unint64_t v27 = v26->var0;
  }
  else {
    unint64_t v27 = 0;
  }
  uint64_t v28 = (uint64_t *)[v6 traceStream];
  if (!v28)
  {
    uint64_t v29 = 0;
    if (a4) {
      goto LABEL_18;
    }
LABEL_20:
    id v30 = 0;
    goto LABEL_21;
  }
  uint64_t v29 = *v28;
  if (!a4) {
    goto LABEL_20;
  }
LABEL_18:
  id v30 = *a4;
LABEL_21:
  *(void *)id v20 = var0;
  *((void *)v20 + 1) = v27;
  *((void *)v20 + 2) = v29;
  *((void *)v20 + 3) = v30;
  *id v9 = v35;
  *((unsigned char *)v9 + 8) = BYTE8(v35);
  *(unsigned char *)(v34 + 15) |= 8u;

  return v17;
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v10 = unwrapMTLComputePipelineDescriptor(v9);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  traceContext = self->_traceContext;
  long long v52 = (unint64_t)traceContext;
  *(void *)&long long v53 = 0;
  *((void *)&v53 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v13 = *v12;
  *id v12 = v14;
  *(void *)&long long v54 = v13;
  long long v46 = v12;
  BYTE8(v54) = *((unsigned char *)v12 + 8);
  *(_WORD *)((char *)&v54 + 9) = 16400;
  *(_DWORD *)((char *)&v54 + 11) = 0;
  HIBYTE(v54) = 0;
  baseObject = self->_baseObject;
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  uint64_t v17 = [v9 pipelineLibrary];
  uint64_t v18 = 65539;
  if (!v17) {
    uint64_t v18 = 327683;
  }
  if (isBaseObjectDebugDevice) {
    unint64_t v19 = a4;
  }
  else {
    unint64_t v19 = v18 | a4 & 4;
  }
  id v51 = 0;
  id v20 = baseObject;
  uint64_t v21 = (void *)v10;
  unint64_t v48 = a6;
  id v22 = [(MTLDeviceSPI *)v20 newComputePipelineStateWithDescriptor:v10 options:v19 reflection:&v51 error:a6];
  id v23 = v51;

  if (v22) {
    uint64_t v24 = [[CaptureMTLComputePipelineState alloc] initWithBaseObject:v22 captureDevice:self];
  }
  else {
    uint64_t v24 = 0;
  }
  uint64_t v25 = [(CaptureMTLDevice *)self dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:v22 withDescriptor:v9];
  [(CaptureMTLComputePipelineState *)v24 setDescriptor:v25];
  long long v49 = v25;
  if ([v25 supportAddingBinaryFunctions]) {
    [(CaptureMTLComputePipelineState *)v24 setReflection:v23];
  }
  GTTraceEncoder_setStream((uint64_t *)&v52, (uint64_t)[(CaptureMTLComputePipelineState *)v24 traceStream]);
  uint64_t v26 = v53;
  *(_DWORD *)(v53 + 8) = -16199;
  char v27 = BYTE9(v54);
  if (BYTE9(v54) > 0x18uLL)
  {
    uint64_t v29 = *(void *)(*((void *)&v52 + 1) + 24);
    uint64_t v30 = BYTE10(v54);
    ++BYTE10(v54);
    uint64_t v28 = GTTraceMemPool_allocateBytes(v29, *((uint64_t *)&v53 + 1), v30 | 0x2800000000) + 16;
    char v27 = v30;
  }
  else
  {
    uint64_t v28 = (char *)(v26 + BYTE9(v54));
    BYTE9(v54) += 40;
  }
  *(unsigned char *)(v26 + 13) = v27;
  SaveMTLComputePipelineReflection((uint64_t)&v52, v22, v23, v21, 0);
  unint64_t v31 = [(CaptureMTLDevice *)self traceStream];
  if (v31) {
    unint64_t var0 = v31->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v33 = [(CaptureMTLComputePipelineState *)v24 traceStream];
  id v47 = v21;
  if (v33) {
    unint64_t v34 = v33->var0;
  }
  else {
    unint64_t v34 = 0;
  }
  long long v35 = v9;
  if (v48) {
    id v36 = *v48;
  }
  else {
    id v36 = 0;
  }
  char v37 = SaveMTLComputePipelineDescriptor((uint64_t)&v52, v49);
  *(void *)uint64_t v28 = var0;
  *((void *)v28 + 1) = v34;
  *((void *)v28 + 2) = a4;
  *((void *)v28 + 3) = v36;
  v28[32] = v37;
  *(_DWORD *)(v28 + 33) = 0;
  *((_DWORD *)v28 + 9) = 0;
  if (a4 && a5)
  {
    if ((~(_BYTE)a4 & 3) != 0 && !self->_isBaseObjectDebugDevice)
    {
      id v38 = DEVICEOBJECT(self->_baseObject);
      id v39 = deviceMTLComputePipelineDescriptorWithoutResourceIndex(v35);
      id v50 = v23;
      id v40 = [v38 newComputePipelineStateWithDescriptor:v39 options:a4 reflection:&v50 error:v48];
      id v41 = v50;

      id v23 = v41;
    }
    id v43 = v46;
    id v42 = v47;
    id v23 = v23;
    *a5 = v23;
  }
  else
  {
    id v43 = v46;
    id v42 = v47;
  }
  *id v43 = v54;
  *((unsigned char *)v43 + 8) = BYTE8(v54);
  *(unsigned char *)(v53 + 15) |= 8u;

  return v24;
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  traceContext = self->_traceContext;
  long long v39 = (unint64_t)traceContext;
  *(void *)&long long v40 = 0;
  *((void *)&v40 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v41 = v10;
  BYTE8(v41) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v41 + 9) = 16400;
  *(_DWORD *)((char *)&v41 + 11) = 0;
  HIBYTE(v41) = 0;
  id v12 = unwrapMTLComputePipelineDescriptor(v6);
  baseObject = self->_baseObject;
  BOOL isBaseObjectDebugDevice = self->_isBaseObjectDebugDevice;
  id v15 = [v6 pipelineLibrary];
  uint64_t v16 = 65539;
  if (!v15) {
    uint64_t v16 = 327683;
  }
  if (isBaseObjectDebugDevice) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v16;
  }
  id v38 = 0;
  id v18 = [(MTLDeviceSPI *)baseObject newComputePipelineStateWithDescriptor:v12 options:v17 reflection:&v38 error:a4];
  id v19 = v38;

  if (v18) {
    id v20 = [[CaptureMTLComputePipelineState alloc] initWithBaseObject:v18 captureDevice:self];
  }
  else {
    id v20 = 0;
  }
  uint64_t v21 = [(CaptureMTLDevice *)self dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:v18 withDescriptor:v6];

  [(CaptureMTLComputePipelineState *)v20 setDescriptor:v21];
  if ([v21 supportAddingBinaryFunctions]) {
    [(CaptureMTLComputePipelineState *)v20 setReflection:v19];
  }
  GTTraceEncoder_setStream((uint64_t *)&v39, (uint64_t)[(CaptureMTLComputePipelineState *)v20 traceStream]);
  uint64_t v22 = v40;
  *(_DWORD *)(v40 + 8) = -16200;
  char v23 = BYTE9(v41);
  if (BYTE9(v41) > 0x20uLL)
  {
    uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 24);
    id v37 = v18;
    uint64_t v26 = v9;
    char v27 = v12;
    id v28 = v19;
    uint64_t v29 = a4;
    uint64_t v30 = BYTE10(v41);
    ++BYTE10(v41);
    uint64_t v24 = GTTraceMemPool_allocateBytes(v25, *((uint64_t *)&v40 + 1), v30 | 0x2000000000) + 16;
    char v23 = v30;
    a4 = v29;
    id v19 = v28;
    id v12 = v27;
    id v9 = v26;
    id v18 = v37;
  }
  else
  {
    uint64_t v24 = (char *)(v22 + BYTE9(v41));
    BYTE9(v41) += 32;
  }
  *(unsigned char *)(v22 + 13) = v23;
  SaveMTLComputePipelineReflection((uint64_t)&v39, v18, v19, v12, 0);
  unint64_t v31 = [(CaptureMTLDevice *)self traceStream];
  if (v31) {
    unint64_t var0 = v31->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v33 = [(CaptureMTLComputePipelineState *)v20 traceStream];
  if (!v33)
  {
    unint64_t v34 = 0;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  unint64_t v34 = v33->var0;
  if (a4) {
LABEL_19:
  }
    a4 = (id *)*a4;
LABEL_20:
  char v35 = SaveMTLComputePipelineDescriptor((uint64_t)&v39, v21);
  *(void *)uint64_t v24 = var0;
  *((void *)v24 + 1) = v34;
  *((void *)v24 + 2) = a4;
  v24[24] = v35;
  *(_DWORD *)(v24 + 25) = 0;
  *((_DWORD *)v24 + 7) = 0;
  *id v9 = v41;
  *((unsigned char *)v9 + 8) = BYTE8(v41);
  *(unsigned char *)(v40 + 15) |= 8u;

  return v20;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 copy];
  uint64_t v10 = self;
  uint64_t v11 = unwrapMTLComputePipelineDescriptor(v9);
  baseObject = v10->_baseObject;
  BOOL isBaseObjectDebugDevice = v10->_isBaseObjectDebugDevice;
  uint64_t v14 = [v9 pipelineLibrary];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __84__CaptureMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v21[3] = &unk_221720;
  uint64_t v15 = 327683;
  uint64_t v22 = v10;
  char v23 = v10;
  if (v14) {
    uint64_t v15 = 65539;
  }
  id v24 = v9;
  id v25 = v11;
  if (isBaseObjectDebugDevice) {
    unint64_t v16 = a4;
  }
  else {
    unint64_t v16 = v15 | a4 & 4;
  }
  id v26 = v8;
  unint64_t v27 = a4;
  id v17 = v8;
  id v18 = v11;
  id v19 = v9;
  id v20 = v10;
  [(MTLDeviceSPI *)baseObject newComputePipelineStateWithDescriptor:v18 options:v16 completionHandler:v21];
}

void __84__CaptureMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    uint64_t v10 = [[CaptureMTLComputePipelineState alloc] initWithBaseObject:v7 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [*(id *)(a1 + 40) dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:v7 withDescriptor:*(void *)(a1 + 48)];
  [(CaptureMTLComputePipelineState *)v10 setDescriptor:v11];
  if ([v11 supportAddingBinaryFunctions]) {
    [(CaptureMTLComputePipelineState *)v10 setReflection:v8];
  }
  long long v40 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = [*(id *)(a1 + 32) traceContext];
  [(CaptureMTLComputePipelineState *)v10 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v38);
  uint64_t v13 = v39;
  *(_DWORD *)(v39 + 8) = -16197;
  char v14 = BYTE9(v40);
  if (BYTE9(v40) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v38 + 1) + 24);
    uint64_t v17 = BYTE10(v40);
    ++BYTE10(v40);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v39 + 1), v17 | 0x2800000000) + 16;
    char v14 = v17;
  }
  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v40));
    BYTE9(v40) += 40;
  }
  *(unsigned char *)(v13 + 13) = v14;
  SaveMTLComputePipelineReflection((uint64_t)&v38, v7, v8, *(void **)(a1 + 56), 0);
  id v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = [(CaptureMTLComputePipelineState *)v10 traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = *(void *)(a1 + 72);
  char v23 = SaveMTLComputePipelineDescriptor((uint64_t)&v38, v11);
  *(void *)uint64_t v15 = v19;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = v22;
  *((void *)v15 + 3) = 0;
  v15[32] = v23;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  id v24 = *(unsigned char **)(a1 + 32);
  if (!v24[325] && (~*(_DWORD *)(a1 + 72) & 3) != 0)
  {
    id v25 = [v24 baseObject];
    id v26 = DEVICEOBJECT(v25);
    unint64_t v27 = deviceMTLComputePipelineDescriptorWithoutResourceIndex(*(void **)(a1 + 48));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    long long v35 = v38;
    long long v36 = v39;
    v31[2] = __84__CaptureMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke_2;
    v31[3] = &unk_2216D0;
    long long v37 = v40;
    uint64_t v28 = *(void *)(a1 + 72);
    id v34 = *(id *)(a1 + 64);
    id v32 = v10;
    id v33 = v9;
    [v26 newComputePipelineStateWithDescriptor:v27 options:v28 completionHandler:v31];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v29 = v30;
  *(unsigned char *)(v29 + 8) = BYTE8(v40);
  *(unsigned char *)(v39 + 15) |= 8u;
}

void __84__CaptureMTLDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  *id v7 = v8;
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  baseObject = v10->_baseObject;
  id v12 = [v8 baseObject];
  BOOL isBaseObjectDebugDevice = v10->_isBaseObjectDebugDevice;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __82__CaptureMTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v18[3] = &unk_2216F8;
  if (isBaseObjectDebugDevice) {
    unint64_t v14 = a4;
  }
  else {
    unint64_t v14 = a4 & 4 | 0x50003;
  }
  uint64_t v19 = v10;
  id v20 = v8;
  id v21 = v9;
  unint64_t v22 = a4;
  id v15 = v9;
  id v16 = v8;
  uint64_t v17 = v10;
  [(MTLDeviceSPI *)baseObject newComputePipelineStateWithFunction:v12 options:v14 completionHandler:v18];
}

void __82__CaptureMTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    uint64_t v10 = [[CaptureMTLComputePipelineState alloc] initWithBaseObject:v7 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v10 = 0;
  }
  [(CaptureMTLComputePipelineState *)v10 setFunction:*(void *)(a1 + 40)];
  long long v41 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = [*(id *)(a1 + 32) traceContext];
  [(CaptureMTLComputePipelineState *)v10 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v11, (uint64_t)&v39);
  uint64_t v12 = v40;
  *(_DWORD *)(v40 + 8) = -16296;
  char v13 = BYTE9(v41);
  if (BYTE9(v41) > 0x18uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 24);
    uint64_t v16 = BYTE10(v41);
    ++BYTE10(v41);
    unint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v40 + 1), v16 | 0x2800000000) + 16;
    char v13 = v16;
  }
  else
  {
    unint64_t v14 = (char *)(v12 + BYTE9(v41));
    BYTE9(v41) += 40;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [*(id *)(a1 + 40) baseObject];
  SaveMTLComputePipelineReflection((uint64_t)&v39, v7, v8, 0, v17);

  id v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = [(CaptureMTLComputePipelineState *)v10 traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v22 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v24 = *(void *)(a1 + 56);
  *(void *)unint64_t v14 = v19;
  *((void *)v14 + 1) = var0;
  *((void *)v14 + 2) = v23;
  *((void *)v14 + 3) = v24;
  *((void *)v14 + 4) = 0;
  id v25 = *(unsigned char **)(a1 + 32);
  if (!v25[325] && (~*(_DWORD *)(a1 + 56) & 3) != 0)
  {
    id v26 = [v25 baseObject];
    unint64_t v27 = DEVICEOBJECT(v26);
    uint64_t v28 = DEVICEOBJECT(*(id *)(a1 + 40));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    long long v36 = v39;
    long long v37 = v40;
    v32[2] = __82__CaptureMTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke_2;
    v32[3] = &unk_2216D0;
    long long v38 = v41;
    uint64_t v29 = *(void *)(a1 + 56);
    id v35 = *(id *)(a1 + 48);
    id v33 = v10;
    id v34 = v9;
    [v27 newComputePipelineStateWithFunction:v28 options:v29 completionHandler:v32];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v41);
  *(unsigned char *)(v40 + 15) |= 8u;
}

void __82__CaptureMTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  *id v7 = v8;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  baseObject = v8->_baseObject;
  uint64_t v10 = [v6 baseObject];
  BOOL v11 = !v8->_isBaseObjectDebugDevice;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __74__CaptureMTLDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke;
  v16[3] = &unk_2216A8;
  if (v11) {
    uint64_t v12 = 327683;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v17 = v8;
  id v18 = v6;
  id v19 = v7;
  id v13 = v7;
  id v14 = v6;
  uint64_t v15 = v8;
  [(MTLDeviceSPI *)baseObject newComputePipelineStateWithFunction:v10 options:v12 completionHandler:v16];
}

void __74__CaptureMTLDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    uint64_t v10 = [[CaptureMTLComputePipelineState alloc] initWithBaseObject:v7 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v10 = 0;
  }
  [(CaptureMTLComputePipelineState *)v10 setFunction:*(void *)(a1 + 40)];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  id v11 = objc_msgSend(*(id *)(a1 + 32), "traceContext", 0);
  [(CaptureMTLComputePipelineState *)v10 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v11, (uint64_t)&v26);
  uint64_t v12 = v27;
  *(_DWORD *)(v27 + 8) = -16297;
  char v13 = BYTE9(v28);
  if (BYTE9(v28) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v16 = BYTE10(v28);
    ++BYTE10(v28);
    id v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v27 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    id v14 = (char *)(v12 + BYTE9(v28));
    BYTE9(v28) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [*(id *)(a1 + 40) baseObject];
  SaveMTLComputePipelineReflection((uint64_t)&v26, v7, v8, 0, v17);

  id v18 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v18) {
    uint64_t v19 = *v18;
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = [(CaptureMTLComputePipelineState *)v10 traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  unint64_t v22 = (uint64_t *)[*(id *)(a1 + 40) traceStream];
  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  *(void *)id v14 = v19;
  *((void *)v14 + 1) = var0;
  *((void *)v14 + 2) = v23;
  *((void *)v14 + 3) = 0;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [a3 copy];
  uint64_t v10 = self;
  baseObject = v10->_baseObject;
  uint64_t v12 = unwrapMTLRenderPipelineDescriptor(v9);
  BOOL isBaseObjectDebugDevice = v10->_isBaseObjectDebugDevice;
  id v14 = [v9 pipelineLibrary];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __83__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v19[3] = &unk_221680;
  uint64_t v15 = 327683;
  if (v14) {
    uint64_t v15 = 65539;
  }
  id v20 = v10;
  id v21 = v10;
  id v23 = v8;
  unint64_t v24 = a4;
  if (!isBaseObjectDebugDevice) {
    a4 = v15 | a4 & 4;
  }
  id v22 = v9;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  [(MTLDeviceSPI *)baseObject newRenderPipelineStateWithDescriptor:v12 options:a4 completionHandler:v19];
}

void __83__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    uint64_t v10 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v7 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = [*(id *)(a1 + 40) dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v7 withDescriptor:*(void *)(a1 + 48)];
  [(CaptureMTLRenderPipelineState *)v10 setDescriptor:v11];
  if (([v11 supportAddingVertexBinaryFunctions] & 1) != 0
    || [v11 supportAddingFragmentBinaryFunctions])
  {
    [(CaptureMTLRenderPipelineState *)v10 setReflection:v8];
  }
  long long v41 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = [*(id *)(a1 + 32) traceContext];
  [(CaptureMTLRenderPipelineState *)v10 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v39);
  uint64_t v13 = v40;
  *(_DWORD *)(v40 + 8) = -16300;
  char v14 = BYTE9(v41);
  if (BYTE9(v41) > 0x18uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v39 + 1) + 24);
    uint64_t v17 = BYTE10(v41);
    ++BYTE10(v41);
    uint64_t v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v40 + 1), v17 | 0x2800000000) + 16;
    char v14 = v17;
  }
  else
  {
    uint64_t v15 = (char *)(v13 + BYTE9(v41));
    BYTE9(v41) += 40;
  }
  *(unsigned char *)(v13 + 13) = v14;
  id v18 = LoadDynamicLibrariesForRenderPipelineDescriptor(v11);
  SaveMTLRenderPipelineReflection((uint64_t)&v39, v7, v8, v18);

  uint64_t v19 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  id v21 = [(CaptureMTLRenderPipelineState *)v10 traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v23 = *(void *)(a1 + 64);
  char v24 = SaveMTLRenderPipelineDescriptor((uint64_t)&v39, v11);
  *(void *)uint64_t v15 = v20;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = v23;
  *((void *)v15 + 3) = 0;
  v15[32] = v24;
  *(_DWORD *)(v15 + 33) = 0;
  *((_DWORD *)v15 + 9) = 0;
  uint64_t v25 = *(unsigned char **)(a1 + 32);
  if (!v25[325] && (~*(_DWORD *)(a1 + 64) & 3) != 0)
  {
    long long v26 = [v25 baseObject];
    long long v27 = DEVICEOBJECT(v26);
    long long v28 = deviceMTLRenderPipelineDescriptorWithoutResourceIndex(*(void **)(a1 + 48));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    long long v36 = v39;
    long long v37 = v40;
    v32[2] = __83__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke_2;
    v32[3] = &unk_221658;
    long long v38 = v41;
    uint64_t v29 = *(void *)(a1 + 64);
    id v35 = *(id *)(a1 + 56);
    id v33 = v10;
    id v34 = v9;
    [v27 newRenderPipelineStateWithDescriptor:v28 options:v29 completionHandler:v32];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v30 = v31;
  *(unsigned char *)(v30 + 8) = BYTE8(v41);
  *(unsigned char *)(v40 + 15) |= 8u;
}

void __83__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 80);
  id v5 = a3;
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  *id v7 = v8;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 copy];
  uint64_t v8 = self;
  baseObject = v8->_baseObject;
  uint64_t v10 = unwrapMTLRenderPipelineDescriptor(v7);
  BOOL isBaseObjectDebugDevice = v8->_isBaseObjectDebugDevice;
  id v12 = [v7 pipelineLibrary];
  uint64_t v13 = 65539;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __75__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v18[3] = &unk_221630;
  if (!v12) {
    uint64_t v13 = 327683;
  }
  uint64_t v19 = v8;
  uint64_t v20 = v8;
  if (isBaseObjectDebugDevice) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v13;
  }
  id v21 = v7;
  id v22 = v6;
  id v15 = v6;
  id v16 = v7;
  uint64_t v17 = v8;
  [(MTLDeviceSPI *)baseObject newRenderPipelineStateWithDescriptor:v10 options:v14 completionHandler:v18];
}

void __75__CaptureMTLDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    uint64_t v10 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v7 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = [*(id *)(a1 + 40) dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:v7 withDescriptor:*(void *)(a1 + 48)];
  [(CaptureMTLRenderPipelineState *)v10 setDescriptor:v11];
  if (([v11 supportAddingVertexBinaryFunctions] & 1) != 0
    || [v11 supportAddingFragmentBinaryFunctions])
  {
    [(CaptureMTLRenderPipelineState *)v10 setReflection:v8];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  id v12 = objc_msgSend(*(id *)(a1 + 32), "traceContext", 0);
  [(CaptureMTLRenderPipelineState *)v10 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v12, (uint64_t)&v26);
  uint64_t v13 = v27;
  *(_DWORD *)(v27 + 8) = -16301;
  char v14 = BYTE9(v28);
  if (BYTE9(v28) > 0x20uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v17 = BYTE10(v28);
    ++BYTE10(v28);
    id v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v27 + 1), v17 | 0x2000000000) + 16;
    char v14 = v17;
  }
  else
  {
    id v15 = (char *)(v13 + BYTE9(v28));
    BYTE9(v28) += 32;
  }
  *(unsigned char *)(v13 + 13) = v14;
  id v18 = LoadDynamicLibrariesForRenderPipelineDescriptor(v11);
  SaveMTLRenderPipelineReflection((uint64_t)&v26, v7, v8, v18);

  uint64_t v19 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v19) {
    uint64_t v20 = *v19;
  }
  else {
    uint64_t v20 = 0;
  }
  id v21 = [(CaptureMTLRenderPipelineState *)v10 traceStream];
  if (v21) {
    unint64_t var0 = v21->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v23 = SaveMTLRenderPipelineDescriptor((uint64_t)&v26, v11);
  *(void *)id v15 = v20;
  *((void *)v15 + 1) = var0;
  *((void *)v15 + 2) = 0;
  v15[24] = v23;
  *(_DWORD *)(v15 + 25) = 0;
  *((_DWORD *)v15 + 7) = 0;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v24 = v25;
  *(unsigned char *)(v24 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v33 = v10;
  BYTE8(v33) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newLibraryWithURL:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLLibrary alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLLibrary *)v13 traceStream]);
  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -16039;
  char v15 = BYTE9(v33);
  if (BYTE9(v33) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v18 = BYTE10(v33);
    ++BYTE10(v33);
    uint64_t v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v32 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    uint64_t v16 = (char *)(v14 + BYTE9(v33));
    BYTE9(v33) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  id v19 = v6;
  SaveMTLLibraryInfoWithPath((uint64_t)&v31, v12, (const char *)[v19 fileSystemRepresentation]);
  uint64_t v20 = [(CaptureMTLDevice *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v22 = [(CaptureMTLLibrary *)v13 traceStream];
  if (v22)
  {
    unint64_t v23 = v22->var0;
    if (a4)
    {
LABEL_12:
      id v24 = *a4;
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v23 = 0;
    if (a4) {
      goto LABEL_12;
    }
  }
  id v24 = 0;
LABEL_15:
  id v25 = v19;
  id v26 = [v25 fileSystemRepresentation];
  if (v26)
  {
    id v27 = v25;
    id v28 = [v27 fileSystemRepresentation];
    size_t v29 = strlen((const char *)[v27 fileSystemRepresentation]);
    LOBYTE(v26) = GTTraceEncoder_storeBytes((uint64_t)&v31, v28, v29 + 1);
  }
  *(void *)uint64_t v16 = var0;
  *((void *)v16 + 1) = v23;
  *((void *)v16 + 2) = v24;
  v16[24] = (char)v26;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *id v9 = v33;
  *((unsigned char *)v9 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;

  return v13;
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 copy];
  if (v8)
  {
    unwrapMTLCompileOptions(v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = objc_alloc_init((Class)MTLCompileOptions);
  }
  id v12 = v11;
  [v11 setDebuggingEnabled:1];
  uint64_t v13 = self;
  baseObject = v13->_baseObject;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __67__CaptureMTLDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v19[3] = &unk_221608;
  uint64_t v20 = v13;
  id v21 = v8;
  id v22 = v10;
  id v23 = v9;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  uint64_t v18 = v13;
  [(MTLDeviceSPI *)baseObject newLibraryWithSource:v16 options:v12 completionHandler:v19];
}

void __67__CaptureMTLDevice_newLibraryWithSource_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    id v7 = [[CaptureMTLLibrary alloc] initWithBaseObject:v5 captureDevice:*(void *)(a1 + 32)];
  }
  else {
    id v7 = 0;
  }
  [(CaptureMTLLibrary *)v7 setOptions:*(void *)(a1 + 40)];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "traceContext", 0);
  [(CaptureMTLLibrary *)v7 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v8, (uint64_t)&v25);
  uint64_t v9 = v26;
  *(_DWORD *)(v26 + 8) = -16304;
  char v10 = BYTE9(v27);
  if (BYTE9(v27) > 0x20uLL)
  {
    uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v13 = BYTE10(v27);
    ++BYTE10(v27);
    id v11 = GTTraceMemPool_allocateBytes(v12, *((uint64_t *)&v26 + 1), v13 | 0x2000000000) + 16;
    char v10 = v13;
  }
  else
  {
    id v11 = (char *)(v9 + BYTE9(v27));
    BYTE9(v27) += 32;
  }
  *(unsigned char *)(v9 + 13) = v10;
  SaveMTLLibraryInfoWithPath((uint64_t)&v25, v5, 0);
  uint64_t v14 = (uint64_t *)[*(id *)(a1 + 32) traceStream];
  if (v14) {
    uint64_t v15 = *v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = [(CaptureMTLLibrary *)v7 traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    RetainDebugObject(v5);
    char v18 = 0;
  }
  else
  {
    id v19 = [*(id *)(a1 + 48) UTF8String];
    uint64_t v20 = *(void **)(a1 + 48);
    if (v20) {
      uint64_t v21 = strlen((const char *)[v20 UTF8String]) + 1;
    }
    else {
      uint64_t v21 = 0;
    }
    char v18 = GTTraceEncoder_storeBlob((uint64_t)&v25, v19, v21);
  }
  char v22 = SaveMTLCompileOptions((uint64_t)&v25, *(void **)(a1 + 40));
  *(void *)id v11 = v15;
  *((void *)v11 + 1) = var0;
  *((void *)v11 + 2) = 0;
  v11[24] = v18;
  v11[25] = v22;
  *(_DWORD *)(v11 + 26) = 0;
  *((_WORD *)v11 + 15) = 0;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) traceContext];
  s();
  *(void *)uint64_t v23 = v24;
  *(unsigned char *)(v23 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  traceContext = self->_traceContext;
  long long v38 = (unint64_t)traceContext;
  *(void *)&long long v39 = 0;
  *((void *)&v39 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v12 = v11;
  uint64_t v13 = *v11;
  uint64_t *v11 = v14;
  *(void *)&long long v40 = v13;
  BYTE8(v40) = *((unsigned char *)v11 + 8);
  *(_WORD *)((char *)&v40 + 9) = 16400;
  *(_DWORD *)((char *)&v40 + 11) = 0;
  HIBYTE(v40) = 0;
  if (v9)
  {
    unwrapMTLCompileOptions(v9);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = objc_alloc_init((Class)MTLCompileOptions);
  }
  id v16 = v15;
  [v15 setDebuggingEnabled:1];
  id v17 = [(MTLDeviceSPI *)self->_baseObject newLibraryWithSource:v8 options:v16 error:a5];
  id v37 = v8;
  if (v17) {
    char v18 = [[CaptureMTLLibrary alloc] initWithBaseObject:v17 captureDevice:self];
  }
  else {
    char v18 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v38, (uint64_t)[(CaptureMTLLibrary *)v18 traceStream]);
  [(CaptureMTLLibrary *)v18 setOptions:v9];
  uint64_t v19 = v39;
  *(_DWORD *)(v39 + 8) = -16305;
  char v20 = BYTE9(v40);
  if (BYTE9(v40) > 0x20uLL)
  {
    uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 24);
    uint64_t v23 = BYTE10(v40);
    ++BYTE10(v40);
    uint64_t v21 = GTTraceMemPool_allocateBytes(v22, *((uint64_t *)&v39 + 1), v23 | 0x2000000000) + 16;
    char v20 = v23;
  }
  else
  {
    uint64_t v21 = (char *)(v19 + BYTE9(v40));
    BYTE9(v40) += 32;
  }
  *(unsigned char *)(v19 + 13) = v20;
  SaveMTLLibraryInfoWithPath((uint64_t)&v38, v17, 0);
  uint64_t v24 = [(CaptureMTLDevice *)self traceStream];
  if (v24) {
    unint64_t var0 = v24->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v26 = [(CaptureMTLLibrary *)v18 traceStream];
  if (v26)
  {
    unint64_t v27 = v26->var0;
    if (a5)
    {
LABEL_15:
      id v28 = *a5;
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v27 = 0;
    if (a5) {
      goto LABEL_15;
    }
  }
  id v28 = 0;
LABEL_18:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    RetainDebugObject(v17);
    char v29 = 0;
  }
  else
  {
    long long v36 = v16;
    unint64_t v30 = var0;
    id v31 = v37;
    id v32 = [v31 UTF8String];
    if (v31) {
      uint64_t v33 = strlen((const char *)[v31 UTF8String]) + 1;
    }
    else {
      uint64_t v33 = 0;
    }
    unint64_t var0 = v30;
    char v29 = GTTraceEncoder_storeBlob((uint64_t)&v38, v32, v33);
    id v16 = v36;
  }
  char v34 = SaveMTLCompileOptions((uint64_t)&v38, v9);
  *(void *)uint64_t v21 = var0;
  *((void *)v21 + 1) = v27;
  *((void *)v21 + 2) = v28;
  v21[24] = v29;
  v21[25] = v34;
  *(_DWORD *)(v21 + 26) = 0;
  *((_WORD *)v21 + 15) = 0;
  *uint64_t v12 = v40;
  *((unsigned char *)v12 + 8) = BYTE8(v40);
  *(unsigned char *)(v39 + 15) |= 8u;

  return v18;
}

- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  traceContext = self->_traceContext;
  long long v38 = (unint64_t)traceContext;
  *(void *)&long long v39 = 0;
  *((void *)&v39 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v11 = v10;
  uint64_t v12 = *v10;
  *char v10 = v13;
  *(void *)&long long v40 = v12;
  BYTE8(v40) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v40 + 9) = 16400;
  *(_DWORD *)((char *)&v40 + 11) = 0;
  HIBYTE(v40) = 0;
  baseObject = self->_baseObject;
  id v15 = unwrapNSArray(v8);
  id v37 = ($D8DEAA3156C5105DEBC38EA8AF03C94C *)a4;
  id v16 = [(MTLDeviceSPI *)baseObject newLibraryWithImageFilterFunctionsSPI:v15 imageFilterFunctionInfo:a4 error:a5];

  if (v16) {
    id v17 = [[CaptureMTLLibrary alloc] initWithBaseObject:v16 captureDevice:self captureFunctions:v8];
  }
  else {
    id v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v38, (uint64_t)[(CaptureMTLLibrary *)v17 traceStream]);
  uint64_t v18 = v39;
  *(_DWORD *)(v39 + 8) = -15847;
  char v19 = BYTE9(v40);
  if (BYTE9(v40) > 0x18uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v38 + 1) + 24);
    uint64_t v22 = BYTE10(v40);
    ++BYTE10(v40);
    char v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v39 + 1), v22 | 0x2800000000) + 16;
    char v19 = v22;
  }
  else
  {
    char v20 = (char *)(v18 + BYTE9(v40));
    BYTE9(v40) += 40;
  }
  *(unsigned char *)(v18 + 13) = v19;
  SaveMTLLibraryInfoWithPath((uint64_t)&v38, v16, 0);
  uint64_t v23 = [(CaptureMTLDevice *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v25 = [(CaptureMTLLibrary *)v17 traceStream];
  if (v25) {
    unint64_t v26 = v25->var0;
  }
  else {
    unint64_t v26 = 0;
  }
  id v27 = [v8 count];
  if (a5) {
    id v28 = *a5;
  }
  else {
    id v28 = 0;
  }
  id v29 = [v8 count];
  __chkstk_darwin(v29, 8 * (void)v29);
  id v31 = (uint64_t *)((char *)&v36 - v30);
  bzero((char *)&v36 - v30, v32);
  LOBYTE(v31) = StreamNSArray((uint64_t)&v38, v31, v8);
  int v33 = [v8 count];
  char v34 = SaveImageFilterFunctionInfo((uint64_t)&v38, (char *)&v37->var0, v33);
  *(void *)char v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = v27;
  *((void *)v20 + 3) = v28;
  v20[32] = (char)v31;
  v20[33] = v34;
  *(_DWORD *)(v20 + 34) = 0;
  *((_WORD *)v20 + 19) = 0;
  uint64_t *v11 = v40;
  *((unsigned char *)v11 + 8) = BYTE8(v40);
  *(unsigned char *)(v39 + 15) |= 8u;

  return v17;
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v33 = v10;
  BYTE8(v33) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  id v12 = [(MTLDeviceSPI *)self->_baseObject newLibraryWithFile:v6 error:a4];
  if (v12) {
    uint64_t v13 = [[CaptureMTLLibrary alloc] initWithBaseObject:v12 captureDevice:self];
  }
  else {
    uint64_t v13 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLLibrary *)v13 traceStream]);
  uint64_t v14 = v32;
  *(_DWORD *)(v32 + 8) = -16307;
  char v15 = BYTE9(v33);
  if (BYTE9(v33) > 0x20uLL)
  {
    uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v18 = BYTE10(v33);
    ++BYTE10(v33);
    id v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v32 + 1), v18 | 0x2000000000) + 16;
    char v15 = v18;
  }
  else
  {
    id v16 = (char *)(v14 + BYTE9(v33));
    BYTE9(v33) += 32;
  }
  *(unsigned char *)(v14 + 13) = v15;
  id v19 = v6;
  SaveMTLLibraryInfoWithPath((uint64_t)&v31, v12, (const char *)[v19 fileSystemRepresentation]);
  char v20 = [(CaptureMTLDevice *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = [(CaptureMTLLibrary *)v13 traceStream];
  if (v22)
  {
    unint64_t v23 = v22->var0;
    if (a4)
    {
LABEL_12:
      id v24 = *a4;
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v23 = 0;
    if (a4) {
      goto LABEL_12;
    }
  }
  id v24 = 0;
LABEL_15:
  id v25 = v19;
  id v26 = [v25 UTF8String];
  if (v26)
  {
    id v27 = v25;
    id v28 = [v27 UTF8String];
    size_t v29 = strlen((const char *)[v27 UTF8String]);
    LOBYTE(v26) = GTTraceEncoder_storeBytes((uint64_t)&v31, v28, v29 + 1);
  }
  *(void *)id v16 = var0;
  *((void *)v16 + 1) = v23;
  *((void *)v16 + 2) = v24;
  v16[24] = (char)v26;
  *(_DWORD *)(v16 + 25) = 0;
  *((_DWORD *)v16 + 7) = 0;
  *id v9 = v33;
  *((unsigned char *)v9 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;

  return v13;
}

- (id)newLibraryWithCIFiltersForComputePipeline:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v33 = v12;
  BYTE8(v33) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  baseObject = self->_baseObject;
  char v15 = unwrapNSArray(v8);
  id v16 = [(MTLDeviceSPI *)baseObject newLibraryWithCIFiltersForComputePipeline:v15 imageFilterFunctionInfo:a4 error:a5];

  if (v16) {
    uint64_t v17 = [[CaptureMTLLibrary alloc] initWithBaseObject:v16 captureDevice:self];
  }
  else {
    uint64_t v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLLibrary *)v17 traceStream]);
  uint64_t v18 = v32;
  *(_DWORD *)(v32 + 8) = -16018;
  char v19 = BYTE9(v33);
  if (BYTE9(v33) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v22 = BYTE10(v33);
    ++BYTE10(v33);
    char v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v32 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    char v20 = (char *)(v18 + BYTE9(v33));
    BYTE9(v33) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  SaveMTLLibraryInfoWithPath((uint64_t)&v31, v16, 0);
  unint64_t v23 = [(CaptureMTLDevice *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v25 = [(CaptureMTLLibrary *)v17 traceStream];
  if (!v25)
  {
    unint64_t v26 = 0;
    if (a5) {
      goto LABEL_12;
    }
LABEL_14:
    id v27 = 0;
    goto LABEL_15;
  }
  unint64_t v26 = v25->var0;
  if (!a5) {
    goto LABEL_14;
  }
LABEL_12:
  id v27 = *a5;
LABEL_15:
  char v28 = SaveMTLArray((uint64_t)&v31, v8);
  char v29 = SaveImageFilterFunctionInfo((uint64_t)&v31, (char *)&a4->var0, (int)[v8 count]);
  *(void *)char v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = v27;
  v20[24] = v28;
  v20[25] = v29;
  *(_DWORD *)(v20 + 26) = 0;
  *((_WORD *)v20 + 15) = 0;
  uint64_t *v11 = v33;
  *((unsigned char *)v11 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;

  return v17;
}

- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  *uint64_t v10 = v13;
  *(void *)&long long v33 = v12;
  BYTE8(v33) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  baseObject = self->_baseObject;
  char v15 = unwrapNSArray(v8);
  id v16 = [(MTLDeviceSPI *)baseObject newLibraryWithCIFilters:v15 imageFilterFunctionInfo:a4 error:a5];

  if (v16) {
    uint64_t v17 = [[CaptureMTLLibrary alloc] initWithBaseObject:v16 captureDevice:self];
  }
  else {
    uint64_t v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLLibrary *)v17 traceStream]);
  uint64_t v18 = v32;
  *(_DWORD *)(v32 + 8) = -16029;
  char v19 = BYTE9(v33);
  if (BYTE9(v33) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v22 = BYTE10(v33);
    ++BYTE10(v33);
    char v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v32 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    char v20 = (char *)(v18 + BYTE9(v33));
    BYTE9(v33) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  SaveMTLLibraryInfoWithPath((uint64_t)&v31, v16, 0);
  unint64_t v23 = [(CaptureMTLDevice *)self traceStream];
  if (v23) {
    unint64_t var0 = v23->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v25 = [(CaptureMTLLibrary *)v17 traceStream];
  if (!v25)
  {
    unint64_t v26 = 0;
    if (a5) {
      goto LABEL_12;
    }
LABEL_14:
    id v27 = 0;
    goto LABEL_15;
  }
  unint64_t v26 = v25->var0;
  if (!a5) {
    goto LABEL_14;
  }
LABEL_12:
  id v27 = *a5;
LABEL_15:
  char v28 = SaveMTLArray((uint64_t)&v31, v8);
  char v29 = SaveImageFilterFunctionInfo((uint64_t)&v31, (char *)&a4->var0, (int)[v8 count]);
  *(void *)char v20 = var0;
  *((void *)v20 + 1) = v26;
  *((void *)v20 + 2) = v27;
  v20[24] = v28;
  v20[25] = v29;
  *(_DWORD *)(v20 + 26) = 0;
  *((_WORD *)v20 + 15) = 0;
  uint64_t *v11 = v33;
  *((unsigned char *)v11 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;

  return v17;
}

- (id)newSharedEventWithMachPort:(unsigned int)a3
{
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  traceContext = self->_traceContext;
  long long v32 = (unint64_t)traceContext;
  *(void *)&long long v33 = 0;
  *((void *)&v33 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v34 = v8;
  BYTE8(v34) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v34 + 9) = 16400;
  *(_DWORD *)((char *)&v34 + 11) = 0;
  HIBYTE(v34) = 0;
  id v10 = -[MTLDeviceSPI newSharedEventWithMachPort:](self->_baseObject, "newSharedEventWithMachPort:");
  if (v10) {
    uint64_t v11 = [[CaptureMTLSharedEvent alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v32, (uint64_t)[(CaptureMTLSharedEvent *)v11 traceStream]);
  uint64_t v12 = v33;
  *(_DWORD *)(v33 + 8) = -15912;
  char v13 = BYTE9(v34);
  if (BYTE9(v34) > 0x20uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v16 = BYTE10(v34);
    ++BYTE10(v34);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v33 + 1), v16 | 0x2000000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v34));
    BYTE9(v34) += 32;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v19 = [(CaptureMTLSharedEvent *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  id v21 = [v10 signaledValue];
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = v21;
  *((_DWORD *)v14 + 6) = a3;
  *((_DWORD *)v14 + 7) = 0;
  *id v7 = v34;
  *((unsigned char *)v7 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  uint64_t v22 = self->_traceContext;
  [(CaptureMTLSharedEvent *)v11 traceStream];
  GTTraceContext_pushEncoderWithStream((uint64_t)v22, (uint64_t)&v32);
  *((unsigned char *)v7 + 8) |= 0x40u;
  id v23 = [(CaptureMTLSharedEvent *)v11 newSharedEventHandle];
  uint64_t v24 = v33;
  *(_DWORD *)(v33 + 8) = -15907;
  char v25 = BYTE9(v34);
  if (BYTE9(v34) > 0x30uLL)
  {
    uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 24);
    uint64_t v28 = BYTE10(v34);
    ++BYTE10(v34);
    unint64_t v26 = GTTraceMemPool_allocateBytes(v27, *((uint64_t *)&v33 + 1), v28 | 0x1000000000) + 16;
    char v25 = v28;
  }
  else
  {
    unint64_t v26 = (char *)(v24 + BYTE9(v34));
    BYTE9(v34) += 16;
  }
  *(unsigned char *)(v24 + 13) = v25;
  char v29 = [(CaptureMTLDevice *)self traceStream];
  if (v29) {
    unint64_t v30 = v29->var0;
  }
  else {
    unint64_t v30 = 0;
  }
  *(void *)unint64_t v26 = v30;
  *((void *)v26 + 1) = v23;
  *id v7 = v34;
  *((unsigned char *)v7 + 8) = BYTE8(v34);
  *(unsigned char *)(v33 + 15) |= 8u;

  return v11;
}

- (id)newSharedEventWithHandle:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  traceContext = self->_traceContext;
  long long v24 = (unint64_t)traceContext;
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  *id v6 = v9;
  *(void *)&long long v26 = v8;
  BYTE8(v26) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v26 + 9) = 16400;
  *(_DWORD *)((char *)&v26 + 11) = 0;
  HIBYTE(v26) = 0;
  id v10 = [(MTLDeviceSPI *)self->_baseObject newSharedEventWithHandle:v4];
  if (v10) {
    uint64_t v11 = [[CaptureMTLSharedEvent alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v24, (uint64_t)[(CaptureMTLSharedEvent *)v11 traceStream]);
  uint64_t v12 = v25;
  *(_DWORD *)(v25 + 8) = -15909;
  char v13 = BYTE9(v26);
  if (BYTE9(v26) > 0x18uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 24);
    uint64_t v16 = BYTE10(v26);
    ++BYTE10(v26);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v25 + 1), v16 | 0x2800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v26));
    BYTE9(v26) += 40;
  }
  *(unsigned char *)(v12 + 13) = v13;
  uint64_t v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v19 = [(CaptureMTLSharedEvent *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  id v21 = [v10 signaledValue];
  unsigned int v22 = [v4 eventPort];
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = v4;
  *((void *)v14 + 3) = v21;
  *((_DWORD *)v14 + 8) = v22;
  *((_DWORD *)v14 + 9) = 0;
  *id v7 = v26;
  *((unsigned char *)v7 + 8) = BYTE8(v26);
  *(unsigned char *)(v25 + 15) |= 8u;

  return v11;
}

- (id)newSharedEvent
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v5 = v4;
  uint64_t v6 = *v4;
  *id v4 = v7;
  *(void *)&long long v24 = v6;
  BYTE8(v24) = *((unsigned char *)v4 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  id v8 = [(MTLDeviceSPI *)self->_baseObject newSharedEvent];
  if (v8) {
    uint64_t v9 = [[CaptureMTLSharedEvent alloc] initWithBaseObject:v8 captureDevice:self];
  }
  else {
    uint64_t v9 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLSharedEvent *)v9 traceStream]);
  id v10 = [v8 newSharedEventHandle];
  uint64_t v11 = v23;
  *(_DWORD *)(v23 + 8) = -15996;
  char v12 = BYTE9(v24);
  if (BYTE9(v24) > 0x20uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v15 = BYTE10(v24);
    ++BYTE10(v24);
    char v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v23 + 1), v15 | 0x2000000000) + 16;
    char v12 = v15;
  }
  else
  {
    char v13 = (char *)(v11 + BYTE9(v24));
    BYTE9(v24) += 32;
  }
  *(unsigned char *)(v11 + 13) = v12;
  uint64_t v16 = [(CaptureMTLDevice *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v18 = [(CaptureMTLSharedEvent *)v9 traceStream];
  if (v18) {
    unint64_t v19 = v18->var0;
  }
  else {
    unint64_t v19 = 0;
  }
  unsigned int v20 = [v10 eventPort];
  *(void *)char v13 = var0;
  *((void *)v13 + 1) = v19;
  *((void *)v13 + 2) = v10;
  *((_DWORD *)v13 + 6) = v20;
  *((_DWORD *)v13 + 7) = 0;
  *id v5 = v24;
  *((unsigned char *)v5 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v9;
}

- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  traceContext = self->_traceContext;
  long long v39 = (unint64_t)traceContext;
  *(void *)&long long v40 = 0;
  *((void *)&v40 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v11 = v10;
  uint64_t v12 = *v10;
  *id v10 = v13;
  *(void *)&long long v41 = v12;
  BYTE8(v41) = *((unsigned char *)v10 + 8);
  *(_WORD *)((char *)&v41 + 9) = 16400;
  *(_DWORD *)((char *)&v41 + 11) = 0;
  HIBYTE(v41) = 0;
  baseObject = self->_baseObject;
  uint64_t v15 = unwrapNSArray(v8);
  id v16 = [(MTLDeviceSPI *)baseObject newLibraryWithImageFilterFunctionsSPI:v15 imageFilterFunctionInfo:a4 error:a5];

  id v17 = [v16 newFunctionWithName:@"ciKernelMain"];
  uint64_t v18 = self->_baseObject;
  id v38 = 0;
  id v19 = [(MTLDeviceSPI *)v18 newComputePipelineStateWithFunction:v17 options:0 reflection:&v38 error:a5];
  id v37 = v38;
  if (v19) {
    unsigned int v20 = [[CaptureMTLComputePipelineState alloc] initWithBaseObject:v19 captureDevice:self];
  }
  else {
    unsigned int v20 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v39, (uint64_t)[(CaptureMTLComputePipelineState *)v20 traceStream]);
  uint64_t v21 = v40;
  *(_DWORD *)(v40 + 8) = -16101;
  char v22 = BYTE9(v41);
  id v34 = v16;
  uint64_t v36 = ($D8DEAA3156C5105DEBC38EA8AF03C94C *)a4;
  if (BYTE9(v41) > 0x20uLL)
  {
    uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 24);
    uint64_t v25 = BYTE10(v41);
    ++BYTE10(v41);
    long long v23 = GTTraceMemPool_allocateBytes(v24, *((uint64_t *)&v40 + 1), v25 | 0x2000000000) + 16;
    char v22 = v25;
  }
  else
  {
    long long v23 = (char *)(v21 + BYTE9(v41));
    BYTE9(v41) += 32;
  }
  *(unsigned char *)(v21 + 13) = v22;
  SaveMTLComputePipelineReflection((uint64_t)&v39, v19, v37, 0, v17);
  long long v26 = [(CaptureMTLDevice *)self traceStream];
  if (v26) {
    unint64_t var0 = v26->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v28 = [(CaptureMTLComputePipelineState *)v20 traceStream];
  if (!v28)
  {
    unint64_t v29 = 0;
    if (a5) {
      goto LABEL_12;
    }
LABEL_14:
    id v30 = 0;
    goto LABEL_15;
  }
  unint64_t v29 = v28->var0;
  if (!a5) {
    goto LABEL_14;
  }
LABEL_12:
  id v30 = *a5;
LABEL_15:
  char v31 = StreamMTLNameArray((uint64_t)&v39, v8);
  char v32 = SaveImageFilterFunctionInfo((uint64_t)&v39, (char *)&v36->var0, (int)[v8 count]);
  *(void *)long long v23 = var0;
  *((void *)v23 + 1) = v29;
  *((void *)v23 + 2) = v30;
  v23[24] = v31;
  v23[25] = v32;
  *(_DWORD *)(v23 + 26) = 0;
  *((_WORD *)v23 + 15) = 0;
  uint64_t *v11 = v41;
  *((unsigned char *)v11 + 8) = BYTE8(v41);
  *(unsigned char *)(v40 + 15) |= 8u;

  return v20;
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  traceContext = self->_traceContext;
  long long v22 = (unint64_t)traceContext;
  *(void *)&long long v23 = 0;
  *((void *)&v23 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v7 = v6;
  uint64_t v8 = *v6;
  *uint64_t v6 = v9;
  *(void *)&long long v24 = v8;
  BYTE8(v24) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v24 + 9) = 16400;
  *(_DWORD *)((char *)&v24 + 11) = 0;
  HIBYTE(v24) = 0;
  id v10 = [(MTLDeviceSPI *)self->_baseObject newArgumentEncoderWithArguments:v4];
  if (v10) {
    uint64_t v11 = [[CaptureMTLArgumentEncoder alloc] initWithBaseObject:v10 captureDevice:self];
  }
  else {
    uint64_t v11 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v22, (uint64_t)[(CaptureMTLArgumentEncoder *)v11 traceStream]);
  uint64_t v12 = v23;
  *(_DWORD *)(v23 + 8) = -16037;
  char v13 = BYTE9(v24);
  if (BYTE9(v24) > 0x28uLL)
  {
    uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v16 = BYTE10(v24);
    ++BYTE10(v24);
    uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v23 + 1), v16 | 0x1800000000) + 16;
    char v13 = v16;
  }
  else
  {
    uint64_t v14 = (char *)(v12 + BYTE9(v24));
    BYTE9(v24) += 24;
  }
  *(unsigned char *)(v12 + 13) = v13;
  id v17 = [(CaptureMTLDevice *)self traceStream];
  if (v17) {
    unint64_t var0 = v17->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  id v19 = [(CaptureMTLArgumentEncoder *)v11 traceStream];
  if (v19) {
    unint64_t v20 = v19->var0;
  }
  else {
    unint64_t v20 = 0;
  }
  *(void *)uint64_t v14 = var0;
  *((void *)v14 + 1) = v20;
  *((void *)v14 + 2) = v4;
  *uint64_t v7 = v24;
  *((unsigned char *)v7 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;

  return v11;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_getUid("newCNNConvolutionWithDescriptor:dataSource:fullyConnected:") == a3
    || sel_getUid("newCNNConvolutionWithDescriptor:convolutionData:") == a3
    || sel_getUid("newCNNConvolutionGradientWithDescriptor:convolutionData:") == a3
    || sel_getUid("newCNNNeuronWithNeuronType:neuronParameterA:neuronParameterB:neuronParameterC:") == a3
    || sel_getUid("newCNNNeuronWithNeuronType:neuronParameterAArray:count:") == a3
    || sel_getUid("newMatrixMultiplicationWithTransposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:") == a3
    || sel_getUid("newMatrixVectorMultiplicationWithTranspose:rows:columns:alpha:beta:") == a3
    || sel_getUid("newMatrixFullyConnected") == a3
    || sel_getUid("newCNNPoolingMaxWithKernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:") == a3
    || sel_getUid("newCNNPoolingAverageWithKernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:") == a3
    || sel_getUid("newCNNDilatedPoolingMaxWithKernelWidth:kernelHeight:strideInPixelsX:strideInPixelsY:dilationRateX:dilationRateY:") == a3|| sel_getUid("newCNNSoftMax") == a3|| sel_getUid("newNDArrayConvolution2DWithDescriptor:") == a3)
  {
    baseObject = self->_baseObject;
    goto LABEL_19;
  }
  Uid = sel_getUid("newNDArrayConvolution2DGradientWithDescriptor:");
  baseObject = self->_baseObject;
  if (Uid == a3)
  {
LABEL_19:
    uint64_t v8 = DEVICEOBJECT(baseObject);
    char v9 = objc_opt_respondsToSelector();

    return v9 & 1;
  }

  return CaptureRespondsToSelector((uint64_t)baseObject, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = (Protocol *)a3;
  objc_getProtocol("MPSPlugin");
  id v5 = (Protocol *)objc_claimAutoreleasedReturnValue();
  BOOL isEqual = protocol_isEqual(v4, v5);

  if (isEqual) {
    goto LABEL_5;
  }
  objc_getProtocol("MPSNeuralNetworkPlugin");
  uint64_t v7 = (Protocol *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = protocol_isEqual(v4, v7);

  if (v8) {
    goto LABEL_5;
  }
  objc_getProtocol("MPSMatrixPlugin");
  char v9 = (Protocol *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = protocol_isEqual(v4, v9);

  if (v10
    || (objc_getProtocol("MPSNDArrayPlugin"),
        uint64_t v11 = (Protocol *)objc_claimAutoreleasedReturnValue(),
        BOOL v12 = protocol_isEqual(v4, v11),
        v11,
        v12))
  {
LABEL_5:
    char v13 = DEVICEOBJECT(self->_baseObject);
    unsigned __int8 v14 = [v13 conformsToProtocol:v4];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CaptureMTLDevice;
    unsigned __int8 v14 = [(CaptureMTLDevice *)&v16 conformsToProtocol:v4];
  }

  return v14;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_retainMutex);
  pthread_mutex_destroy((pthread_mutex_t *)self->_harvester);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16317;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    id v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  BOOL v8 = [(CaptureMTLDevice *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLDevice;
  [(CaptureMTLDevice *)&v12 dealloc];
}

- (MTLSharedEventListener)captureEventListener
{
  return self->_eventListener;
}

- (BOOL)captureRaytracingEnabled
{
  return self->_captureRaytracingEnabled;
}

- (BOOL)bufferPinningEnabled
{
  return self->_bufferPinningEnabled;
}

- (void)purgeDeallocatedObjects
{
  p_retainMutex = &self->_retainMutex;
  pthread_mutex_lock(&self->_retainMutex);
  [(NSMutableArray *)self->_retainObjects removeAllObjects];

  pthread_mutex_unlock(p_retainMutex);
}

- (void)deallocateResource:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(_DWORD *)(boundaryTrackerInstance + 20))
  {
    if (self->_bufferPinningEnabled)
    {
      long long v14 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v14 heap], v6 = objc_claimAutoreleasedReturnValue(), v6, id v5 = v14, !v6))
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v5 = v14;
        if ((isKindOfClass & 1) == 0
          || ([v14 heap],
              BOOL v8 = objc_claimAutoreleasedReturnValue(),
              v8,
              id v5 = v14,
              !v8))
        {
          char v9 = [v5 baseObject];
          [v9 setPurgeableState:3];

          p_retainMutex = &self->_retainMutex;
          pthread_mutex_lock(&self->_retainMutex);
          retainObjects = self->_retainObjects;
          objc_super v12 = [v14 baseObject];
          long long v13 = DEVICEOBJECT(v12);
          [(NSMutableArray *)retainObjects addObject:v13];

          id v4 = (id)pthread_mutex_unlock(p_retainMutex);
          id v5 = v14;
        }
      }
    }
  }

  _objc_release_x1(v4, v5);
}

- (void)invalidateHarvester
{
  [(CaptureMTLDevice *)self purgeDeallocatedObjects];
  apr_pool_clear(self->_harvesterPool);
  self->_harvester = (GTResourceHarvester *)GTResourceHarvesterMake(self->_harvesterPool);
  uint64_t v3 = [[GTResourceDownloader alloc] initWithDevice:self];
  downloader = self->_downloader;
  self->_downloader = v3;

  _objc_release_x1(v3, downloader);
}

- (BOOL)newCaptureSamplerState:(id *)a3 associatedWithBaseSamplerState:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_cachedSamplerStateLock);
  uint64_t v7 = [(NSMapTable *)self->_cachedSamplerStateMap objectForKey:v6];
  id v8 = *a3;
  *a3 = v7;

  id v9 = *a3;
  if (!*a3)
  {
    uint64_t v10 = [[CaptureMTLSamplerState alloc] initWithBaseObject:v6 captureDevice:self];
    id v11 = *a3;
    *a3 = v10;

    [(NSMapTable *)self->_cachedSamplerStateMap setObject:*a3 forKey:v6];
  }
  os_unfair_lock_unlock(&self->_cachedSamplerStateLock);

  return v9 == 0;
}

- (BOOL)newCaptureDepthStencilState:(id *)a3 associatedWithBaseDepthStencilState:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_cachedDepthStencilStateLock);
  uint64_t v7 = [(NSMapTable *)self->_cachedDepthStencilStateMap objectForKey:v6];
  id v8 = *a3;
  *a3 = v7;

  id v9 = *a3;
  if (!*a3)
  {
    uint64_t v10 = [[CaptureMTLDepthStencilState alloc] initWithBaseObject:v6 captureDevice:self];
    id v11 = *a3;
    *a3 = v10;

    [(NSMapTable *)self->_cachedDepthStencilStateMap setObject:*a3 forKey:v6];
  }
  os_unfair_lock_unlock(&self->_cachedDepthStencilStateLock);

  return v9 == 0;
}

- (BOOL)newCaptureFunction:(id *)a3 associatedWithBaseFunction:(id)a4 captureLibrary:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  os_unfair_lock_lock(&self->_cachedFunctionLock);
  uint64_t v10 = [(NSMapTable *)self->_cachedFunctionMap objectForKey:v8];
  id v11 = *a3;
  *a3 = v10;

  id v12 = *a3;
  if (!*a3)
  {
    long long v13 = [[CaptureMTLFunction alloc] initWithBaseObject:v8 captureLibrary:v9];
    id v14 = *a3;
    *a3 = v13;

    [(NSMapTable *)self->_cachedFunctionMap setObject:*a3 forKey:v8];
  }
  os_unfair_lock_unlock(&self->_cachedFunctionLock);

  return v12 == 0;
}

- (CaptureMTLDevice)initWithBaseObject:(id)a3 captureContext:(GTTraceContext *)a4
{
  id v7 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CaptureMTLDevice;
  id v8 = [(CaptureMTLDevice *)&v37 init];
  unint64_t v9 = (unint64_t)v8;
  if (v8)
  {
    p_baseObject = (id *)&v8->_baseObject;
    objc_storeStrong((id *)&v8->_baseObject, a3);
    *(void *)(v9 + 16) = a4;
    id v11 = DEVICEOBJECT(v7);
    *(void *)(v9 + 24) = GTTraceContext_openStream((uint64_t)a4, (unint64_t)v11, v9);

    NSClassFromString(@"MTLGPUDebugDevice");
    Class v12 = NSClassFromString(@"MTLLegacySVDevice");
    long long v13 = DEVICEOBJECT(v7);
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0 && [v7 resourcePatchingTypeForResourceType:3] != (char *)&def_CFBEC + 2) {
      *(unsigned char *)(v9 + 324) = 1;
    }
    id v15 = objc_alloc_init((Class)NSMutableArray);
    objc_super v16 = *(void **)(v9 + 280);
    *(void *)(v9 + 280) = v15;

    pthread_mutex_init((pthread_mutex_t *)(v9 + 216), 0);
    if ((qword_2501C8 & 8) != 0)
    {
      char v19 = 1;
    }
    else
    {
      id v17 = [*p_baseObject name];
      unsigned int v18 = [v17 containsString:@"AMD"];

      if (v18) {
        char v19 = [*p_baseObject supportsRaytracing]
      }
           && [*p_baseObject requiresRaytracingEmulation]
           && *(unsigned char *)(v9 + 324) != 0;
      else {
        char v19 = *(unsigned char *)(v9 + 324);
      }
    }
    *(unsigned char *)(v9 + 326) = v19;
    unint64_t v20 = [v7 targetDeviceArchitecture];
    unsigned int v21 = [v20 cpuType];

    if (v21 != 16777235) {
      qword_2501C8 |= 0x100uLL;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else if (v12)
    {
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
    *(unsigned char *)(v9 + 325) = isKindOfClass & 1;
    apr_pool_create_ex((apr_pool_t **)(v9 + 32), 0, 0, 0);
    dispatch_group_t v23 = dispatch_group_create();
    long long v24 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v23;

    *(void *)(v9 + 328) = GTResourceHarvesterMake(*(apr_pool_t **)(v9 + 32));
    [(id)v9 _initArgumentBufferPatchingTypes];
    id v25 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:2 valueOptions:5 capacity:8];
    long long v26 = *(void **)(v9 + 288);
    *(void *)(v9 + 288) = v25;

    id v27 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:2 valueOptions:5 capacity:32];
    uint64_t v28 = *(void **)(v9 + 296);
    *(void *)(v9 + 296) = v27;

    id v29 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:2 valueOptions:5 capacity:8];
    id v30 = *(void **)(v9 + 304);
    *(void *)(v9 + 304) = v29;

    *(void *)(v9 + 312) = 0;
    *(_DWORD *)(v9 + 320) = 0;
    char v31 = [(id)v9 baseObject];
    [v31 _setDeviceWrapper:v9];

    dispatch_queue_t v32 = dispatch_queue_create("com.apple.dt.GPUTools.eventsQueue", 0);
    long long v33 = *(void **)(v9 + 120);
    *(void *)(v9 + 120) = v32;

    id v34 = [objc_alloc((Class)MTLSharedEventListener) initWithDispatchQueue:*(void *)(v9 + 120)];
    id v35 = *(void **)(v9 + 128);
    *(void *)(v9 + 128) = v34;

    GTMTLGuestAppClient_addCaptureDevice(g_guestAppClientMTL, (void *)v9);
  }

  return (CaptureMTLDevice *)v9;
}

- (MTLDevice)baseObject
{
  return self->_baseObject;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (MTLComputePipelineState)computePipelineCopyBuffer
{
  CaptureMTLDevice_initIndirectCommandBufferCopy(self);
  computePipelineCopyBuffer = self->_computePipelineCopyBuffer;

  return computePipelineCopyBuffer;
}

void __CaptureMTLDevice_initIndirectCommandBufferCopy_block_invoke(uint64_t a1)
{
  v2 = DEVICEOBJECT(*(id *)(a1 + 32));
  id v3 = objc_alloc_init((Class)MTLCompileOptions);
  [v3 setLanguageVersion:131073];
  id v41 = 0;
  id v4 = objc_msgSend(v2, "newLibraryWithSource:options:error:", @"#include <metal_stdlib>\nusing namespace metal;\nstruct CopyIndirectCommandBufferArgument {\ncommand_buffer destination;\ncommand_buffer source;\n};\n\nvertex void renderCopyIndirectCommandBuffer (device CopyIndirectCommandBufferArgument& in [[ buffer(0) ]], uint i [[ vertex_id ]])\n{\nrender_command src(in.source, i);\nrender_command dest(in.destination, i);\ndest.copy_command(src);\n}\n\nvertex void renderCopyBuffer (device char* dest [[ buffer(0) ]], constant char* src [[ buffer(1) ]], uint i [[ vertex_id ]])\n{\ndest[i] = src[i];\n}\n",
         v3,
         &v41);
  id v5 = v41;
  id v6 = [v4 newFunctionWithName:@"renderCopyIndirectCommandBuffer"];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 56);
  *(void *)(v7 + 56) = v6;

  id v9 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v9 setVertexFunction:*(void *)(*(void *)(a1 + 32) + 56)];
  [v9 setRasterizationEnabled:0];
  uint64_t v10 = [v9 colorAttachments];
  id v11 = [v10 objectAtIndexedSubscript:0];
  [v11 setPixelFormat:71];

  id v40 = v5;
  id v12 = [v2 newRenderPipelineStateWithDescriptor:v9 error:&v40];
  id v13 = v40;

  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 72);
  *(void *)(v14 + 72) = v12;

  id v16 = [v4 newFunctionWithName:@"renderCopyBuffer"];
  [v9 setVertexFunction:v16];

  id v39 = v13;
  id v17 = [v2 newRenderPipelineStateWithDescriptor:v9 error:&v39];
  id v18 = v39;

  uint64_t v19 = *(void *)(a1 + 32);
  unint64_t v20 = *(void **)(v19 + 80);
  *(void *)(v19 + 80) = v17;

  id v21 = objc_alloc_init((Class)MTLCompileOptions);
  if ((unint64_t)[v21 languageVersion] > 0x20001)
  {
    id v38 = 0;
    id v22 = objc_msgSend(v2, "newLibraryWithSource:options:error:", @"#include <metal_stdlib>\nusing namespace metal;\nstruct CopyIndirectCommandBufferArgument {\ncommand_buffer destination;\ncommand_buffer source;\n};\n\nkernel void computeCopyIndirectCommandBuffer (device CopyIndirectCommandBufferArgument& in [[ buffer(0) ]], uint i [[ thread_position_in_grid ]])\n{\ncompute_command src(in.source, i);\ncompute_command dest(in.destination, i);\ndest.copy_command(src);\n}\n\nkernel void computeCopyBuffer (device char* dest [[ buffer(0) ]], constant char* src [[ buffer(1) ]], uint i [[ thread_position_in_grid ]])\n{\ndest[i] = src[i];\n}\n",
            v21,
            &v38);
    id v23 = v38;
    if (v22)
    {
      id v24 = [v22 newFunctionWithName:@"computeCopyIndirectCommandBuffer"];
      uint64_t v25 = *(void *)(a1 + 32);
      long long v26 = *(void **)(v25 + 64);
      *(void *)(v25 + 64) = v24;

      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 64);
      id v37 = v23;
      id v28 = [v2 newComputePipelineStateWithFunction:v27 error:&v37];
      id v29 = v37;

      uint64_t v30 = *(void *)(a1 + 32);
      char v31 = *(void **)(v30 + 88);
      *(void *)(v30 + 88) = v28;

      id v32 = [v22 newFunctionWithName:@"computeCopyBuffer"];
      id v36 = v29;
      id v33 = [v2 newComputePipelineStateWithFunction:v32 error:&v36];
      id v23 = v36;

      uint64_t v34 = *(void *)(a1 + 32);
      id v35 = *(void **)(v34 + 96);
      *(void *)(v34 + 96) = v33;
    }
  }
}

- (MTLComputePipelineState)computePipelineCopyIndirectCommandBuffer
{
  CaptureMTLDevice_initIndirectCommandBufferCopy(self);
  computePipelineCopyIndirectCommandBuffer = self->_computePipelineCopyIndirectCommandBuffer;

  return computePipelineCopyIndirectCommandBuffer;
}

- (MTLFunction)computeFunctionCopyIndirectCommandBuffer
{
  CaptureMTLDevice_initIndirectCommandBufferCopy(self);
  computeFunctionCopyIndirectCommandBuffer = self->_computeFunctionCopyIndirectCommandBuffer;

  return computeFunctionCopyIndirectCommandBuffer;
}

- (MTLRenderPipelineState)renderPipelineCopyBuffer
{
  CaptureMTLDevice_initIndirectCommandBufferCopy(self);
  renderPipelineCopyBuffer = self->_renderPipelineCopyBuffer;

  return renderPipelineCopyBuffer;
}

- (MTLRenderPipelineState)renderPipelineCopyIndirectCommandBuffer
{
  CaptureMTLDevice_initIndirectCommandBufferCopy(self);
  renderPipelineCopyIndirectCommandBuffer = self->_renderPipelineCopyIndirectCommandBuffer;

  return renderPipelineCopyIndirectCommandBuffer;
}

- (MTLFunction)renderFunctionCopyIndirectCommandBuffer
{
  CaptureMTLDevice_initIndirectCommandBufferCopy(self);
  renderFunctionCopyIndirectCommandBuffer = self->_renderFunctionCopyIndirectCommandBuffer;

  return renderFunctionCopyIndirectCommandBuffer;
}

- (GTResourceDownloader)downloader
{
  int64_t downloaderOnceToken = self->_downloaderOnceToken;
  p_int64_t downloaderOnceToken = &self->_downloaderOnceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __30__CaptureMTLDevice_downloader__block_invoke;
  block[3] = &unk_222120;
  block[4] = self;
  if (downloaderOnceToken != -1) {
    dispatch_once(p_downloaderOnceToken, block);
  }
  return self->_downloader;
}

uint64_t __30__CaptureMTLDevice_downloader__block_invoke(uint64_t a1)
{
  v2 = [[GTResourceDownloader alloc] initWithDevice:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 104);
  *(void *)(v3 + 104) = v2;

  return _objc_release_x1(v2, v4);
}

- (id)dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && self->isArgumentBufferPatchingTypeIndexed[7])
  {
    id v8 = DEVICEOBJECT(v6);
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v9 = [v8 resourceIndex];
      id v10 = (id)_MTLInvalidResourceIndex;
      if (v9 == (id)_MTLInvalidResourceIndex)
      {
        id v11 = [(CaptureMTLDevice *)self dummyArgumentEncoder];
        [v11 setIntersectionFunctionTable:v8 atIndex:self->_dummyIntersectionFunctionTableIndex];
      }
      id v12 = [v7 copy];

      objc_msgSend(v12, "setResourceIndex:", objc_msgSend(v8, "resourceIndex"));
      objc_msgSend(v12, "setForceResourceIndex:", objc_msgSend(v8, "resourceIndex") != v10);
      id v7 = v12;
    }
  }
  id v13 = v7;

  return v13;
}

- (id)dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && self->isArgumentBufferPatchingTypeIndexed[6])
  {
    id v8 = DEVICEOBJECT(v6);
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v9 = [v8 resourceIndex];
      id v10 = (id)_MTLInvalidResourceIndex;
      if (v9 == (id)_MTLInvalidResourceIndex)
      {
        id v11 = [(CaptureMTLDevice *)self dummyArgumentEncoder];
        [v11 setVisibleFunctionTable:v8 atIndex:self->_dummyVisibleFunctionTableIndex];
      }
      id v12 = [v7 copy];

      objc_msgSend(v12, "setResourceIndex:", objc_msgSend(v8, "resourceIndex"));
      objc_msgSend(v12, "setForceResourceIndex:", objc_msgSend(v8, "resourceIndex") != v10);
      id v7 = v12;
    }
  }
  id v13 = v7;

  return v13;
}

- (id)dummyEncodeComputePSOIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (objc_opt_respondsToSelector() & 1) != 0
    && self->isArgumentBufferPatchingTypeIndexed[4]
    && [v6 supportIndirectCommandBuffers])
  {
    id v8 = DEVICEOBJECT(v6);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v8 resourceIndex];
      id v10 = (id)_MTLInvalidResourceIndex;
      if (v9 == (id)_MTLInvalidResourceIndex)
      {
        id v11 = [(CaptureMTLDevice *)self dummyArgumentEncoder];
        [v11 setComputePipelineState:v8 atIndex:self->_dummyComputePSOIndex];
      }
      if (v7)
      {
        id v12 = [v7 copy];

        objc_msgSend(v12, "setResourceIndex:", objc_msgSend(v8, "resourceIndex"));
        objc_msgSend(v12, "setForceResourceIndex:", objc_msgSend(v8, "resourceIndex") != v10);
        id v7 = v12;
      }
    }
  }

  return v7;
}

- (id)dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:(id)a3 withMeshDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && self->isArgumentBufferPatchingTypeIndexed[4]
    && [v6 supportIndirectCommandBuffers])
  {
    id v8 = DEVICEOBJECT(v6);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v8 resourceIndex];
      id v10 = (id)_MTLInvalidResourceIndex;
      if (v9 == (id)_MTLInvalidResourceIndex)
      {
        id v11 = [(CaptureMTLDevice *)self dummyArgumentEncoder];
        [v11 setRenderPipelineState:v8 atIndex:self->_dummyRenderPSOIndex];
      }
      if (v7)
      {
        id v12 = [v7 copy];

        objc_msgSend(v12, "setResourceIndex:", objc_msgSend(v8, "resourceIndex"));
        objc_msgSend(v12, "setForceResourceIndex:", objc_msgSend(v8, "resourceIndex") != v10);
        id v7 = v12;
      }
    }
  }

  return v7;
}

- (id)dummyEncodeRenderPSOIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && self->isArgumentBufferPatchingTypeIndexed[4]
    && [v6 supportIndirectCommandBuffers])
  {
    id v8 = DEVICEOBJECT(v6);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v8 resourceIndex];
      id v10 = (id)_MTLInvalidResourceIndex;
      if (v9 == (id)_MTLInvalidResourceIndex)
      {
        id v11 = [(CaptureMTLDevice *)self dummyArgumentEncoder];
        [v11 setRenderPipelineState:v8 atIndex:self->_dummyRenderPSOIndex];
      }
      if (v7)
      {
        id v12 = [v7 copy];

        objc_msgSend(v12, "setResourceIndex:", objc_msgSend(v8, "resourceIndex"));
        objc_msgSend(v12, "setForceResourceIndex:", objc_msgSend(v8, "resourceIndex") != v10);
        id v7 = v12;
      }
    }
  }

  return v7;
}

- (id)dummyEncodeICBIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = v7;
  if (v6)
  {
    id v9 = v7;
    if (self->isArgumentBufferPatchingTypeIndexed[5])
    {
      id v10 = DEVICEOBJECT(v6);
      id v9 = v8;
      if (objc_opt_respondsToSelector())
      {
        id v9 = v8;
        if (objc_opt_respondsToSelector())
        {
          id v11 = [v10 resourceIndex];
          if (v11 == (id)_MTLInvalidResourceIndex)
          {
            id v12 = [(CaptureMTLDevice *)self dummyArgumentEncoder];
            [v12 setIndirectCommandBuffer:v10 atIndex:self->_dummyICBIndex];
          }
          id v9 = [v8 copy];

          objc_msgSend(v9, "setResourceIndex:", objc_msgSend(v10, "resourceIndex"));
        }
      }
    }
  }
  id v13 = v9;

  return v13;
}

- (id)dummyEncodeSamplerIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && self->isArgumentBufferPatchingTypeIndexed[1] && [v7 supportArgumentBuffers])
  {
    id v9 = DEVICEOBJECT(v6);
    if (objc_opt_respondsToSelector())
    {
      if (![v9 resourceIndex])
      {
        id v10 = [(CaptureMTLDevice *)self dummyArgumentEncoder];
        [v10 setSamplerState:v9 atIndex:self->_dummySamplerIndex];
      }
      id v11 = [v8 copy];

      objc_msgSend(v11, "setResourceIndex:", objc_msgSend(v9, "resourceIndex"));
      objc_msgSend(v11, "setForceResourceIndex:", objc_msgSend(v9, "resourceIndex") != 0);
      id v8 = v11;
    }
  }
  id v12 = v8;

  return v12;
}

- (id)dummyEncodeTextureIntoArgumentBufferForResourceIndex:(id)a3 withDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && self->isArgumentBufferPatchingTypeIndexed[0])
  {
    id v8 = DEVICEOBJECT(v6);
    if (objc_opt_respondsToSelector())
    {
      if (![v8 resourceIndex])
      {
        id v9 = [v8 textureType];
        id v10 = [(CaptureMTLDevice *)self dummyArgumentEncoder];
        [v10 setTexture:v8 atIndex:v9];
      }
      if (v7)
      {
        id v11 = [v7 copy];

        objc_msgSend(v11, "setResourceIndex:", objc_msgSend(v8, "resourceIndex"));
        objc_msgSend(v11, "setForceResourceIndex:", objc_msgSend(v8, "resourceIndex") != 0);
        id v7 = v11;
      }
    }
  }

  return v7;
}

- (void)_initDummyEncoder
{
  id v25 = (id)objc_opt_new();
  uint64_t v3 = DEVICEOBJECT(self->_baseObject);
  uint64_t v4 = 0;
  id v5 = &qword_1DA348;
  do
  {
    id v6 = objc_alloc_init((Class)MTLArgumentDescriptor);
    [v6 setDataType:58];
    if ([v3 supportsFeatureSet:*v5]) {
      uint64_t v7 = *(v5 - 1);
    }
    else {
      uint64_t v7 = 2;
    }
    [v6 setTextureType:v7];
    [v6 setIndex:v4];
    [v25 addObject:v6];

    ++v4;
    v5 += 2;
  }
  while (v4 != 10);
  self->_dummySamplerIndex = (unint64_t)[v25 count];
  id v8 = objc_alloc_init((Class)MTLArgumentDescriptor);
  [v8 setDataType:59];
  [v8 setIndex:self->_dummySamplerIndex];
  [v25 addObject:v8];

  id v9 = (MTLArgumentEncoder *)[v3 newArgumentEncoderWithArguments:v25];
  dummyArgumentEncoder = self->_dummyArgumentEncoder;
  self->_dummyArgumentEncoder = v9;

  self->_dummyICBIndex = (unint64_t)[v25 count];
  id v11 = objc_alloc_init((Class)MTLArgumentDescriptor);
  [v11 setDataType:80];
  [v11 setIndex:self->_dummyICBIndex];
  [v25 addObject:v11];

  self->_dummyRenderPSOIndex = (unint64_t)[v25 count];
  id v12 = objc_alloc_init((Class)MTLArgumentDescriptor);
  [v12 setDataType:78];
  [v12 setIndex:self->_dummyRenderPSOIndex];
  [v25 addObject:v12];

  id v13 = DEVICEOBJECT(self->_dummyArgumentEncoder);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    self->_dummyComputePSOIndex = (unint64_t)[v25 count];
    id v15 = objc_alloc_init((Class)MTLArgumentDescriptor);
    [v15 setDataType:79];
    [v15 setIndex:self->_dummyComputePSOIndex];
    [v25 addObject:v15];
  }
  id v16 = DEVICEOBJECT(self->_dummyArgumentEncoder);
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    self->_dummyVisibleFunctionTableIndex = (unint64_t)[v25 count];
    id v18 = objc_alloc_init((Class)MTLArgumentDescriptor);
    [v18 setDataType:115];
    [v18 setIndex:self->_dummyVisibleFunctionTableIndex];
    [v25 addObject:v18];
  }
  uint64_t v19 = DEVICEOBJECT(self->_dummyArgumentEncoder);
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    self->_dummyIntersectionFunctionTableIndex = (unint64_t)[v25 count];
    id v21 = objc_alloc_init((Class)MTLArgumentDescriptor);
    [v21 setDataType:116];
    [v21 setIndex:self->_dummyIntersectionFunctionTableIndex];
    [v25 addObject:v21];
  }
  id v22 = (MTLArgumentEncoder *)[v3 newArgumentEncoderWithArguments:v25];
  id v23 = self->_dummyArgumentEncoder;
  self->_dummyArgumentEncoder = v22;

  id v24 = objc_msgSend(v3, "newBufferWithLength:options:", -[MTLArgumentEncoder encodedLength](self->_dummyArgumentEncoder, "encodedLength"), 0);
  [(MTLArgumentEncoder *)self->_dummyArgumentEncoder setArgumentBuffer:v24 offset:0];
}

- (id)dummyArgumentEncoder
{
  int64_t dummyArgEncOnceToken = self->_dummyArgEncOnceToken;
  p_int64_t dummyArgEncOnceToken = &self->_dummyArgEncOnceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __40__CaptureMTLDevice_dummyArgumentEncoder__block_invoke;
  block[3] = &unk_222120;
  block[4] = self;
  if (dummyArgEncOnceToken != -1) {
    dispatch_once(p_dummyArgEncOnceToken, block);
  }
  return self->_dummyArgumentEncoder;
}

id __40__CaptureMTLDevice_dummyArgumentEncoder__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initDummyEncoder];
}

- (void)_initArgumentBufferPatchingTypes
{
  DEVICEOBJECT(self->_baseObject);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  char v3 = objc_opt_respondsToSelector();
  uint64_t v4 = 0;
  isArgumentBufferPatchingTypeIndexed = self->isArgumentBufferPatchingTypeIndexed;
  do
  {
    BOOL v6 = (v3 & 1) != 0 && [v7 resourcePatchingTypeForResourceType:v4] == (char *)&def_CFBEC + 1;
    isArgumentBufferPatchingTypeIndexed[v4++] = v6;
  }
  while (v4 != 9);
}

@end