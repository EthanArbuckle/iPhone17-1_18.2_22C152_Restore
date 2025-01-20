@interface _MTLDevice
+ (BOOL)featureProfile:(unint64_t)a3 supportsFeatureSet:(unint64_t)a4;
+ (BOOL)useNewPrimitiveRestartBehavior;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3;
- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats;
- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats;
- ($A51142D07271D8AEC4984BC318786978)pipelineFlagsWithObjectVariant:(id)a3 meshVariant:(id)a4 fragmentVariant:(id)a5;
- ($A51142D07271D8AEC4984BC318786978)pipelineFlagsWithTileVariant:(id)a3;
- ($A51142D07271D8AEC4984BC318786978)pipelineFlagsWithVertexVariant:(id)a3 fragmentVariant:(id)a4;
- ($CC87CEEC7FB96912C0F1D2377F1A8E9C)pipelineFlagsWithComputeVariant:(id)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3;
- (BOOL)_rateLimitQueueCreation;
- (BOOL)areGPUAssertionsEnabled;
- (BOOL)areProgrammableSamplePositionsSupported;
- (BOOL)areRasterOrderGroupsSupported;
- (BOOL)areWritableHeapsEnabled;
- (BOOL)copyShaderCacheToPath:(id)a3;
- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3;
- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3;
- (BOOL)isAnisoSampleFixSupported;
- (BOOL)isBCTextureCompressionSupported;
- (BOOL)isClampToHalfBorderSupported;
- (BOOL)isCollectingLibraries;
- (BOOL)isCollectingPipelines;
- (BOOL)isCompatibleWithAccelerationStructure:(id)a3;
- (BOOL)isCustomBorderColorSupported;
- (BOOL)isFixedLinePointFillDepthGradientSupported;
- (BOOL)isFloat32FilteringSupported;
- (BOOL)isLargeMRTSupported;
- (BOOL)isMagicMipmapSupported;
- (BOOL)isMsaa32bSupported;
- (BOOL)isPlacementHeapSupported;
- (BOOL)isQuadDataSharingSupported;
- (BOOL)isRGB10A2GammaSupported;
- (BOOL)isRTZRoundingSupported;
- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6;
- (BOOL)requiresBFloat16Emulation;
- (BOOL)requiresRaytracingEmulation;
- (BOOL)setCompilerProcessesCount:(int)a3;
- (BOOL)shaderDebugInfoCaching;
- (BOOL)supports2DLinearTexArraySPI;
- (BOOL)supports32BitFloatFiltering;
- (BOOL)supports32BitMSAA;
- (BOOL)supports32bpcMSAATextures;
- (BOOL)supports3DASTCTextures;
- (BOOL)supports3DBCTextures;
- (BOOL)supportsASTCHDRTextureCompression;
- (BOOL)supportsASTCTextureCompression;
- (BOOL)supportsAlphaYUVFormats;
- (BOOL)supportsAnisoSampleFix;
- (BOOL)supportsArgumentBuffers;
- (BOOL)supportsArgumentBuffersTier2;
- (BOOL)supportsArrayOfSamplers;
- (BOOL)supportsArrayOfTextures;
- (BOOL)supportsAtomicUlongVoidMinMax;
- (BOOL)supportsBCTextureCompression;
- (BOOL)supportsBGR10A2;
- (BOOL)supportsBaseVertexInstanceDrawing;
- (BOOL)supportsBfloat16Buffers;
- (BOOL)supportsBfloat16Format;
- (BOOL)supportsBinaryArchives;
- (BOOL)supportsBinaryLibraries;
- (BOOL)supportsBlackOrWhiteSamplerBorderColors;
- (BOOL)supportsBufferBoundsChecking;
- (BOOL)supportsBufferPrefetchStatistics;
- (BOOL)supportsBufferWithAddressRanges;
- (BOOL)supportsBufferWithIOSurface;
- (BOOL)supportsBufferlessClientStorageTexture;
- (BOOL)supportsCMPIndirectCommandBuffers;
- (BOOL)supportsColorSpaceConversionMatrixSelection;
- (BOOL)supportsCombinedMSAAStoreAndResolveAction;
- (BOOL)supportsCommandBufferJump;
- (BOOL)supportsCompressedTextureViewSPI;
- (BOOL)supportsComputeCompressedTextureWrite;
- (BOOL)supportsComputeMemoryBarrier;
- (BOOL)supportsConcurrentComputeDispatch;
- (BOOL)supportsConditionalLoadStore;
- (BOOL)supportsCounterSampling:(unint64_t)a3;
- (BOOL)supportsCountingOcclusionQuery;
- (BOOL)supportsCustomBorderColor;
- (BOOL)supportsDeadlineProfile;
- (BOOL)supportsDepthClipMode;
- (BOOL)supportsDepthClipModeClampExtended;
- (BOOL)supportsDeviceCoherency;
- (BOOL)supportsDevicePartitioning;
- (BOOL)supportsDynamicAttributeStride;
- (BOOL)supportsDynamicControlPointCount;
- (BOOL)supportsDynamicLibraries;
- (BOOL)supportsExplicitVisibilityGroups;
- (BOOL)supportsExtendedSamplerLODBiasRange;
- (BOOL)supportsExtendedVertexFormats;
- (BOOL)supportsExtendedXR10Formats;
- (BOOL)supportsExtendedYUVFormats;
- (BOOL)supportsFP32TessFactors;
- (BOOL)supportsFamily:(int64_t)a3;
- (BOOL)supportsFastMathInfNaNPropagation;
- (BOOL)supportsFillTexture;
- (BOOL)supportsFixedLinePointFillDepthGradient;
- (BOOL)supportsFloat16BCubicFiltering;
- (BOOL)supportsFloat16InfNanFiltering;
- (BOOL)supportsForceSeamsOnCubemaps;
- (BOOL)supportsForkJoin;
- (BOOL)supportsFragmentBufferWrites;
- (BOOL)supportsFragmentOnlyEncoders;
- (BOOL)supportsFunctionPointers;
- (BOOL)supportsFunctionPointersFromMesh;
- (BOOL)supportsFunctionPointersFromRender;
- (BOOL)supportsGFXIndirectCommandBuffers;
- (BOOL)supportsGPUStatistics;
- (BOOL)supportsGlobalVariableBindingInDylibs;
- (BOOL)supportsGlobalVariableBindings;
- (BOOL)supportsGlobalVariableRelocation;
- (BOOL)supportsGlobalVariableRelocationCompute;
- (BOOL)supportsGlobalVariableRelocationRender;
- (BOOL)supportsHeapAccelerationStructureAllocation;
- (BOOL)supportsHeapWithAddressRanges;
- (BOOL)supportsIABHashForTools;
- (BOOL)supportsImageBlockSampleCoverageControl;
- (BOOL)supportsImageBlocks;
- (BOOL)supportsIndirectDrawAndDispatch;
- (BOOL)supportsIndirectStageInRegion;
- (BOOL)supportsIndirectTessellation;
- (BOOL)supportsIndirectTextures;
- (BOOL)supportsIndirectWritableTextures;
- (BOOL)supportsInt64;
- (BOOL)supportsInterchangeTiled;
- (BOOL)supportsInvariantVertexPosition;
- (BOOL)supportsLargeFramebufferConfigs;
- (BOOL)supportsLateEvalEvent;
- (BOOL)supportsLayeredRendering;
- (BOOL)supportsLimitedYUVFormats;
- (BOOL)supportsLinearTexture2DArray;
- (BOOL)supportsLinearTextureFromSharedBuffer;
- (BOOL)supportsLossyCompression;
- (BOOL)supportsMSAADepthResolve;
- (BOOL)supportsMSAADepthResolveFilter;
- (BOOL)supportsMSAAStencilResolve;
- (BOOL)supportsMSAAStencilResolveFilter;
- (BOOL)supportsMemoryOrderAtomics;
- (BOOL)supportsMemorylessRenderTargets;
- (BOOL)supportsMeshRenderDynamicLibraries;
- (BOOL)supportsMeshShaders;
- (BOOL)supportsMeshShadersInICB;
- (BOOL)supportsMipLevelsSmallerThanBlockSize;
- (BOOL)supportsMirrorClampToEdgeSamplerMode;
- (BOOL)supportsMutableTier1ArgumentBuffers;
- (BOOL)supportsNativeHardwareFP16;
- (BOOL)supportsNonPrivateDepthStencilTextures;
- (BOOL)supportsNonPrivateMSAATextures;
- (BOOL)supportsNonSquareTileShaders;
- (BOOL)supportsNonUniformThreadgroupSize;
- (BOOL)supportsNonZeroTextureWriteLOD;
- (BOOL)supportsNorm16BCubicFiltering;
- (BOOL)supportsOpenCLTextureWriteSwizzles;
- (BOOL)supportsPacked32TextureBufferWrites;
- (BOOL)supportsPartialRenderMemoryBarrier;
- (BOOL)supportsPerPlaneCompression;
- (BOOL)supportsPerformanceStateAssertion;
- (BOOL)supportsPipelineLibraries;
- (BOOL)supportsPlacementHeaps;
- (BOOL)supportsPostDepthCoverage;
- (BOOL)supportsPrimitiveMotionBlur;
- (BOOL)supportsPrimitiveRestartOverride;
- (BOOL)supportsPrimitiveType:(unint64_t)a3;
- (BOOL)supportsProgrammableBlending;
- (BOOL)supportsProgrammableSamplePositions;
- (BOOL)supportsPublicXR10Formats;
- (BOOL)supportsPullModelInterpolation;
- (BOOL)supportsQuadGroup;
- (BOOL)supportsQuadReduction;
- (BOOL)supportsQuadShufflesAndBroadcast;
- (BOOL)supportsQueryTextureLOD;
- (BOOL)supportsRGBA10A2Gamma;
- (BOOL)supportsRTZRounding;
- (BOOL)supportsRasterOrderGroups;
- (BOOL)supportsRasterOrderGroupsColorAttachment;
- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3;
- (BOOL)supportsRayTracingAccelerationStructureCPUDeserialization;
- (BOOL)supportsRayTracingBuffersFromTables;
- (BOOL)supportsRayTracingCurves;
- (BOOL)supportsRayTracingDirectIntersectionResultAccess;
- (BOOL)supportsRayTracingExtendedVertexFormats;
- (BOOL)supportsRayTracingGPUTableUpdateBuffers;
- (BOOL)supportsRayTracingICBs;
- (BOOL)supportsRayTracingIndirectInstanceAccelerationStructureBuild;
- (BOOL)supportsRayTracingMatrixLayout;
- (BOOL)supportsRayTracingMultiLevelInstancing;
- (BOOL)supportsRayTracingPerComponentMotionInterpolation;
- (BOOL)supportsRayTracingPerPrimitiveData;
- (BOOL)supportsRayTracingTraversalMetrics;
- (BOOL)supportsRaytracing;
- (BOOL)supportsRaytracingFromRender;
- (BOOL)supportsReadWriteBufferArguments;
- (BOOL)supportsReadWriteTextureArguments;
- (BOOL)supportsReadWriteTextureArgumentsTier2;
- (BOOL)supportsReadWriteTextureCubeArguments;
- (BOOL)supportsRelaxedTextureViewRequirements;
- (BOOL)supportsRenderDynamicLibraries;
- (BOOL)supportsRenderMemoryBarrier;
- (BOOL)supportsRenderPassWithoutRenderTarget;
- (BOOL)supportsRenderTargetTextureRotation;
- (BOOL)supportsRenderTextureWrites;
- (BOOL)supportsRenderToLinearTextures;
- (BOOL)supportsResourceDetachBacking;
- (BOOL)supportsResourceHeaps;
- (BOOL)supportsSIMDGroup;
- (BOOL)supportsSIMDGroupMatrix;
- (BOOL)supportsSIMDReduction;
- (BOOL)supportsSIMDShuffleAndFill;
- (BOOL)supportsSIMDShufflesAndBroadcast;
- (BOOL)supportsSRGBwrites;
- (BOOL)supportsSamplerAddressModeClampToHalfBorder;
- (BOOL)supportsSamplerCompareFunction;
- (BOOL)supportsSeparateDepthStencil;
- (BOOL)supportsSeparateVisibilityAndShadingRate;
- (BOOL)supportsSetThreadgroupPackingDisabled;
- (BOOL)supportsShaderBarycentricCoordinates;
- (BOOL)supportsShaderLODAverage;
- (BOOL)supportsShaderMinLODClamp;
- (BOOL)supportsSharedFunctionTables;
- (BOOL)supportsSharedStorageHeapResources;
- (BOOL)supportsSharedStorageTextures;
- (BOOL)supportsSharedTextureHandles;
- (BOOL)supportsSparseDepthAttachments;
- (BOOL)supportsSparseHeaps;
- (BOOL)supportsSparseTextures;
- (BOOL)supportsStackOverflowErrorCode;
- (BOOL)supportsStatefulDynamicLibraries;
- (BOOL)supportsStencilFeedback;
- (BOOL)supportsStreamingCodecSignaling;
- (BOOL)supportsTLS;
- (BOOL)supportsTessellation;
- (BOOL)supportsTexture2DMultisampleArray;
- (BOOL)supportsTextureCubeArray;
- (BOOL)supportsTextureOutOfBoundsReads;
- (BOOL)supportsTextureSwizzle;
- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3;
- (BOOL)supportsTileShaders;
- (BOOL)supportsUnalignedVertexFetch;
- (BOOL)supportsVariableRateRasterization;
- (BOOL)supportsVertexAmplification;
- (BOOL)supportsViewportAndScissorArray;
- (BOOL)supportsVirtualSubstreams;
- (BOOL)supportsWritableArrayOfTextures;
- (BOOL)supportsYCBCRFormats;
- (BOOL)supportsYCBCRFormats12;
- (BOOL)supportsYCBCRFormatsPQ;
- (BOOL)supportsYCBCRFormatsXR;
- (BOOL)supportsYCBCRPackedFormats12;
- (BOOL)supportsYCBCRPackedFormatsPQ;
- (BOOL)supportsYCBCRPackedFormatsXR;
- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5;
- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4;
- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4;
- (BOOL)workaroundNewLibraryWithSourceImplicitInvariantPosition;
- (BOOL)workaroundNewLibraryWithSourceReplaceFastMathWithRelaxedMath;
- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities;
- (MTLCompiler)compiler;
- (MTLCompilerConnectionManager)getCompilerConnectionManager:(int)a3;
- (MTLGPUBVHBuilder)GPUBVHBuilder;
- (MTLLogState)defaultLogState;
- (MTLTargetDeviceArchitecture)targetDeviceArchitecture;
- (NSArray)counterSets;
- (NSDictionary)pluginData;
- (NSString)name;
- (OS_dispatch_queue)concurrentQueue;
- (OS_dispatch_queue)serialQueue;
- (_MTLDevice)init;
- (_MTLDevice)initWithAcceleratorPort:(unsigned int)a3;
- (char)getComputeFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5;
- (char)getComputeFunctionId:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 compilerOptionsSize:(unint64_t)a6;
- (char)getFragmentFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5;
- (char)getIntersectionFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5;
- (char)getMeshFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5;
- (char)getObjectFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5;
- (char)getVertexFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5;
- (char)getVertexFunctionId:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 compilerOptionsSize:(unint64_t)a6 compiledFragmentVariant:(id)a7;
- (char)getVisibleFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5;
- (char)newTranslatedDriverCompilerOptions:(id)a3 compilerOptionsSize:(unint64_t *)a4;
- (const)limits;
- (const)targetDeviceInfo;
- (float)maxLineWidth;
- (float)maxPointSize;
- (id).cxx_construct;
- (id)_deviceWrapper;
- (id)_newDescriptorForSharedTexture:(__IOSurface *)a3;
- (id)_newDynamicLibraryWithDescriptor:(id)a3 computeDescriptor:(id)a4 error:(id *)a5;
- (id)akIOResourceListPool;
- (id)allocResidencySet;
- (id)architecture;
- (id)computeVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4;
- (id)description;
- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5;
- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4;
- (id)endCollectingPipelineDescriptors;
- (id)familyName;
- (id)formattedDescription:(unint64_t)a3;
- (id)fragmentVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4;
- (id)getMostCompatibleArchitecture:(id)a3;
- (id)getRawBVHBuilderPtr;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)lookupRecompiledBinaryArchive:(id)a3;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4;
- (id)newArgumentEncoderWithArguments:(id)a3;
- (id)newArgumentEncoderWithArguments:(id)a3 structType:(id *)a4;
- (id)newArgumentEncoderWithBufferBinding:(id)a3;
- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4;
- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5;
- (id)newCommandQueue;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3;
- (id)newComputePipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newComputePipelineWithDescriptor:(id)a3 variant:(id)a4;
- (id)newComputePipelineWithDescriptor:(id)a3 variant:(id)a4 errorMessage:(id *)a5;
- (id)newComputeVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4;
- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDagStringWithGraphs:(id)a3;
- (id)newDefaultLibrary;
- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4;
- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5;
- (id)newDynamicLibrary:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryError:(unint64_t)a3 message:(id)a4;
- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newEvent;
- (id)newEventWithOptions:(int64_t)a3;
- (id)newFragmentVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4;
- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4;
- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5;
- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4;
- (id)newIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5;
- (id)newIOFileHandleWithURL:(id)a3 error:(id *)a4;
- (id)newLateEvalEvent;
- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5;
- (id)newLibraryWithData:(id)a3 error:(id *)a4;
- (id)newLibraryWithFile:(id)a3 error:(id *)a4;
- (id)newLibraryWithFunctionArray:(id)a3 error:(id *)a4;
- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newLibraryWithStitchedDescriptor:(id)a3 destinationBinaryArchive:(id)a4 error:(id *)a5;
- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4;
- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4;
- (id)newLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newMeshRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4;
- (id)newMeshVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4;
- (id)newObjectVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4;
- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4;
- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4;
- (id)newProfileWithExecutionSize:(unint64_t)a3;
- (id)newRasterizationRateMapWithDescriptor:(id)a3;
- (id)newRasterizationRateMapWithScreenSize:(id *)a3 layerCount:(unint64_t)a4 layers:(const void *)a5;
- (id)newRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineWithDescriptor:(id)a3 objectVariant:(id)a4 meshVariant:(id)a5 fragmentVariant:(id)a6 errorMessage:(id *)a7;
- (id)newRenderPipelineWithDescriptor:(id)a3 vertexVariant:(id)a4 fragmentVariant:(id)a5;
- (id)newRenderPipelineWithTileDescriptor:(id)a3 tileVariant:(id)a4 errorMessage:(id *)a5;
- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4;
- (id)newSharedEvent;
- (id)newSharedEventWithHandle:(id)a3;
- (id)newSharedEventWithMachPort:(unsigned int)a3;
- (id)newSharedEventWithOptions:(int64_t)a3;
- (id)newSharedTextureWithDescriptor:(id)a3;
- (id)newSharedTextureWithHandle:(id)a3;
- (id)newSharedTextureWithHandle:(id)a3 withResourceIndex:(unint64_t)a4;
- (id)newStructTypeWithSerializedData:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newTileRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4;
- (id)newTileVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4 functionType:(unint64_t)a5;
- (id)newUncachedIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5;
- (id)newUncachedIOFileHandleWithURL:(id)a3 error:(id *)a4;
- (id)newVertexVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4;
- (id)pipelinePerformanceStatisticsWithComputeVariant:(id)a3;
- (id)pipelinePerformanceStatisticsWithComputeVariant:(id)a3 compileTimeOutput:(id)a4;
- (id)pipelinePerformanceStatisticsWithObjectVariant:(id)a3 meshVariant:(id)a4 fragmentVariant:(id)a5 objectCompileTimeOutput:(id)a6 meshCompileTimeOutput:(id)a7 fragmentCompileTimeOutput:(id)a8;
- (id)pipelinePerformanceStatisticsWithTileVariant:(id)a3 compileTimeOutput:(id)a4;
- (id)pipelinePerformanceStatisticsWithVertexVariant:(id)a3 fragmentVariant:(id)a4;
- (id)pipelinePerformanceStatisticsWithVertexVariant:(id)a3 fragmentVariant:(id)a4 vertexCompileTimeOutput:(id)a5 fragmentCompileTimeOutput:(id)a6;
- (id)productName;
- (id)resolveCounters:(id)a3 withRange:(_NSRange)a4;
- (id)serializeComputePipelineDescriptor:(id)a3;
- (id)serializeMeshRenderPipelineDescriptor:(id)a3;
- (id)serializeRenderPipelineDescriptor:(id)a3;
- (id)serializeStructType:(id)a3;
- (id)serializeStructType:(id)a3 version:(unsigned int)a4;
- (id)serializeTileRenderPipelineDescriptor:(id)a3;
- (id)vendorName;
- (id)vertexVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4;
- (int)llvmVersion;
- (int64_t)currentPerformanceState;
- (int64_t)defaultTextureWriteRoundingMode;
- (os_unfair_lock_s)getBVHBuilderLock;
- (unint64_t)argumentBuffersSupport;
- (unint64_t)bufferRobustnessSupport;
- (unint64_t)commandBufferErrorOptions;
- (unint64_t)deviceCreationFlags;
- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes;
- (unint64_t)deviceLinearTextureAlignmentBytes;
- (unint64_t)getSupportedCommandBufferErrorOptions;
- (unint64_t)globalTraceObjectID;
- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes;
- (unint64_t)iosurfaceTextureAlignmentBytes;
- (unint64_t)latestSupportedGenericBVHVersion;
- (unint64_t)linearTextureAlignmentBytes;
- (unint64_t)linearTextureArrayAlignmentBytes;
- (unint64_t)linearTextureArrayAlignmentSlice;
- (unint64_t)maxAccelerationStructureLevels;
- (unint64_t)maxAccelerationStructureTraversalDepth;
- (unint64_t)maxArgumentBufferSamplerCount;
- (unint64_t)maxColorAttachments;
- (unint64_t)maxComputeAttributes;
- (unint64_t)maxComputeBuffers;
- (unint64_t)maxComputeInlineDataSize;
- (unint64_t)maxComputeLocalMemorySizes;
- (unint64_t)maxComputeSamplers;
- (unint64_t)maxComputeTextures;
- (unint64_t)maxComputeThreadgroupMemory;
- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes;
- (unint64_t)maxConstantBufferArguments;
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
- (unint64_t)optionsForPipelineLibrarySerialization;
- (unint64_t)readWriteTextureSupport;
- (unint64_t)sparseTexturesSupport;
- (unint64_t)sparseTileSizeInBytes;
- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3;
- (unsigned)acceleratorPort;
- (unsigned)maximumComputeSubstreams;
- (void)_decrementCommandQueueCount;
- (void)_incrementCommandQueueCount;
- (void)_purgeDevice;
- (void)allowLibrariesFromOtherPlatforms;
- (void)computeFunctionKeyWithComputePipelineDescriptor:(id)a3 options:(unint64_t)a4 keySize:(unint64_t *)a5;
- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7;
- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6;
- (void)dealloc;
- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6;
- (void)deserializeInstanceAccelerationStructureFromBytes:(const void *)a3 toBuffer:(id)a4 primitiveAccelerationStructures:(id)a5 forAccelerationStructure:(id)a6;
- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5;
- (void)deserializePrimitiveAccelerationStructureFromBytes:(const void *)a3 toBuffer:(id)a4 forAccelerationStructure:(id)a5;
- (void)dumpPipelineDescriptorsIfRequested;
- (void)fragmentFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 previousStateVariant:(id)a5 fragmentKeySize:(unint64_t *)a6;
- (void)freeComputeLibraryKey:(void *)a3 libraryKeySize:(unint64_t)a4;
- (void)freeFragmentFunctionKey:(void *)a3 fragmentKeySize:(unint64_t)a4;
- (void)freeMeshFunctionDriverData:(void *)a3 meshFunctionDriverDataSize:(unint64_t)a4;
- (void)freeMeshFunctionKey:(void *)a3 meshKeySize:(unint64_t)a4;
- (void)freeObjectFunctionDriverData:(void *)a3 objectFunctionDriverDataSize:(unint64_t)a4;
- (void)freeObjectFunctionKey:(void *)a3 objectKeySize:(unint64_t)a4;
- (void)freeVertexFunctionDriverData:(void *)a3 vertexFunctionDriverDataSize:(unint64_t)a4;
- (void)freeVertexFunctionKey:(void *)a3 vertexKeySize:(unint64_t)a4;
- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forComputeVariant:(id)a6;
- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forObjectVariant:(id)a6 meshVariant:(id)a7 fragmentVariant:(id)a8;
- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forTileVariant:(id)a6;
- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forVertexVariant:(id)a6 fragmentVariant:(id)a7;
- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forComputeVariant:(id)a7;
- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forObjectVariant:(id)a7 meshVariant:(id)a8 fragmentVariant:(id)a9;
- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forTileVariant:(id)a7;
- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forVertexVariant:(id)a7 fragmentVariant:(id)a8;
- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4;
- (void)getMeshFunctionDriverData:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 nextStageVariant:(id)a6 driverDataSize:(unint64_t *)a7;
- (void)getObjectFunctionDriverData:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 nextStageVariant:(id)a6 driverDataSize:(unint64_t *)a7;
- (void)getShaderCacheKeys;
- (void)getVertexFunctionDriverData:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 nextStageVariant:(id)a6 driverDataSize:(unint64_t *)a7;
- (void)initDefaultLogState;
- (void)initFeatureQueries;
- (void)initGPUFamilySupport;
- (void)initLimits;
- (void)initProgressTracking;
- (void)initSerializationPaths;
- (void)libraryKeyWithComputePipelineDescriptor:(id)a3 options:(unint64_t)a4 keySize:(unint64_t *)a5;
- (void)meshFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 nextStageVariant:(id)a5 meshKeySize:(unint64_t *)a6;
- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)objectFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 nextStageVariant:(id)a5 objectKeySize:(unint64_t *)a6;
- (void)recordBinaryArchiveUsage:(id)a3;
- (void)registerComputePipelineDescriptor:(id)a3;
- (void)registerMeshRenderPipelineDescriptor:(id)a3;
- (void)registerRenderPipelineDescriptor:(id)a3;
- (void)registerTileRenderPipelineDescriptor:(id)a3;
- (void)releaseCacheEntry:(MTLLibraryContainer *)a3;
- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4;
- (void)setCommandBufferErrorOptions:(unint64_t)a3;
- (void)setGPUAssertionsEnabled:(BOOL)a3;
- (void)setPluginData:(id)a3;
- (void)setRawBVHBuilderPtr:(id)a3;
- (void)setShaderDebugInfoCaching:(BOOL)a3;
- (void)setWritableHeapsEnabled:(BOOL)a3;
- (void)startCollectingPipelineDescriptors;
- (void)startCollectingPipelineDescriptorsFromLibrary:(id)a3 filePath:(id)a4;
- (void)startCollectingPipelineDescriptorsUsingPrefixForNames:(id)a3;
- (void)tileFunctionKeyWithTilePipelineDescriptor:(id)a3 options:(unint64_t)a4 keySize:(unint64_t *)a5;
- (void)unloadShaderCaches;
- (void)vertexFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 nextStageVariant:(id)a5 vertexKeySize:(unint64_t *)a6;
- (void)visibleFunctionKey:(id)a3 withFunctionDescriptor:(id)a4 keySize:(unint64_t *)a5;
@end

@implementation _MTLDevice

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (unint64_t)maxComputeThreadgroupMemory
{
  return [(_MTLDevice *)self limits][100];
}

- (unint64_t)minimumLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  MTLPixelFormatGetInfoForDevice(self, a3, (uint64_t)v11);
  int v3 = dyld_program_sdk_at_least();
  char v8 = BYTE8(v11[0]);
  if (v3 && (BYTE8(v11[0]) & 1) == 0)
  {
    MTLReportFailure(0, "-[_MTLDevice minimumLinearTextureAlignmentForPixelFormat:]", 5211, @"%s is not supported on this device.", v4, v5, v6, v7, *(uint64_t *)&v11[0]);
    char v8 = BYTE8(v11[0]);
    if ((WORD4(v11[0]) & 0x400) == 0) {
      goto LABEL_4;
    }
  }
  else if ((WORD4(v11[0]) & 0x400) == 0)
  {
    goto LABEL_4;
  }
  MTLReportFailure(0, "-[_MTLDevice minimumLinearTextureAlignmentForPixelFormat:]", 5212, @"Linear textures do not support compressed pixel formats", v4, v5, v6, v7, v10);
  char v8 = BYTE8(v11[0]);
LABEL_4:
  if ((v8 & 0x60) != 0) {
    MTLReportFailure(0, "-[_MTLDevice minimumLinearTextureAlignmentForPixelFormat:]", 5213, @"Linear textures do not support depth/stencil pixel formats", v4, v5, v6, v7, v10);
  }
  return 64;
}

- (unint64_t)maxComputeSamplers
{
  return [(_MTLDevice *)self limits][84];
}

- (unint64_t)maxFragmentSamplers
{
  return [(_MTLDevice *)self limits][68];
}

- (unint64_t)maxViewportCount
{
  return [(_MTLDevice *)self limits][216];
}

- (unint64_t)readWriteTextureSupport
{
  if ([(_MTLDevice *)self supportsFamily:1004]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (unint64_t)maxTextureHeight2D
{
  return [(_MTLDevice *)self limits][136];
}

- (unint64_t)maxTextureWidth2D
{
  return [(_MTLDevice *)self limits][132];
}

- (BOOL)supportsFamily:(int64_t)a3
{
  supportedGPUFamilies = self->_supportedGPUFamilies;
  uint64_t v4 = (void *)*supportedGPUFamilies;
  uint64_t v5 = (void *)supportedGPUFamilies[1];
  if (v4 != v5)
  {
    while (*v4 != a3)
    {
      if (++v4 == v5)
      {
        uint64_t v4 = v5;
        return v4 != v5;
      }
    }
  }
  return v4 != v5;
}

- (unint64_t)minTilePixels
{
  return [(_MTLDevice *)self limits][28];
}

- (const)limits
{
  return (const $8F4FC51FDE2459731A28129D66393995 *)&self->_limits;
}

- (BOOL)supportsNonPrivateMSAATextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsNonPrivateMSAATextures];
}

- (BOOL)supportsNonPrivateDepthStencilTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsNonPrivateDepthStencilTextures];
}

- (void)registerRenderPipelineDescriptor:(id)a3
{
  if (![a3 meshFunction])
  {
    if ([(_MTLDevice *)self isCollectingPipelines])
    {
      MTLPipelineCollection::addRenderPipeline((MTLPipelineCollection *)self->_pipelineCollection, (MTLRenderPipelineDescriptor *)a3);
      if ((_dumpAtExit & 1) == 0)
      {
        [(_MTLDevice *)self dumpPipelineDescriptorsIfRequested];
      }
    }
  }
}

- (unint64_t)iosurfaceTextureAlignmentBytes
{
  return [(_MTLDevice *)self limits][164];
}

- (unint64_t)iosurfaceReadOnlyTextureAlignmentBytes
{
  return [(_MTLDevice *)self limits][168];
}

- (unint64_t)maxTextureLayers
{
  return [(_MTLDevice *)self limits][156];
}

- (unint64_t)maxTextureDimensionCube
{
  return [(_MTLDevice *)self limits][152];
}

- (unint64_t)maxTextureWidth1D
{
  return [(_MTLDevice *)self limits][128];
}

- (unint64_t)maxTextureWidth3D
{
  return [(_MTLDevice *)self limits][140];
}

- (unint64_t)maxTextureHeight3D
{
  return [(_MTLDevice *)self limits][144];
}

- (unint64_t)maxTextureDepth3D
{
  return [(_MTLDevice *)self limits][148];
}

- (void)initLimits
{
  uint64_t v3 = [(_MTLDevice *)self featureProfile];
  uint64_t v4 = v3;
  unsigned int v5 = v3 == 0;
  if (v3) {
    int v6 = 0;
  }
  else {
    int v6 = 31;
  }
  if (v3) {
    int v7 = 0;
  }
  else {
    int v7 = 60;
  }
  int v164 = v7;
  if (v3) {
    int v8 = 0;
  }
  else {
    int v8 = 65528;
  }
  int v157 = v8;
  if (v3) {
    int v9 = 0;
  }
  else {
    int v9 = 96;
  }
  int v168 = v9;
  unsigned int v10 = v3 == 1;
  if (v3 == 1) {
    int v11 = 31;
  }
  else {
    int v11 = 0;
  }
  if (v3 == 1) {
    int v12 = 60;
  }
  else {
    int v12 = 0;
  }
  int v160 = v12;
  if (v3 == 1) {
    int v13 = 65528;
  }
  else {
    int v13 = 0;
  }
  int v154 = v13;
  if (v3 == 1) {
    int v14 = 96;
  }
  else {
    int v14 = 0;
  }
  int v167 = v14;
  if (v3 == 1) {
    unsigned int v15 = v5 + 1;
  }
  else {
    unsigned int v15 = v3 == 0;
  }
  if (v3 == 1) {
    int v16 = -1;
  }
  else {
    int v16 = 0;
  }
  int v172 = v16;
  unsigned int v17 = v3 == 4;
  if (v3 == 4) {
    int v18 = 31;
  }
  else {
    int v18 = 0;
  }
  if (v3 == 4) {
    int v19 = 60;
  }
  else {
    int v19 = 0;
  }
  int v165 = v19;
  if (v3 == 4) {
    int v20 = 65528;
  }
  else {
    int v20 = 0;
  }
  int v150 = v20;
  if (v3 == 4) {
    int v21 = 96;
  }
  else {
    int v21 = 0;
  }
  int v166 = v21;
  if (v3 == 4) {
    ++v15;
  }
  unsigned int v22 = v3 == 5;
  if (v3 == 5) {
    int v23 = 31;
  }
  else {
    int v23 = 0;
  }
  int v151 = v23;
  if (v3 == 5) {
    int v24 = 96;
  }
  else {
    int v24 = 0;
  }
  if (v3 == 5) {
    int v25 = 124;
  }
  else {
    int v25 = 0;
  }
  if (v3 == 5) {
    int v26 = 65528;
  }
  else {
    int v26 = 0;
  }
  if (v3 == 5) {
    unsigned int v27 = v15 + 1;
  }
  else {
    unsigned int v27 = v15;
  }
  unsigned int v159 = v27;
  unsigned int v28 = v3 == 6;
  if (v3 == 6) {
    int v29 = 31;
  }
  else {
    int v29 = 0;
  }
  int v147 = v26;
  int v148 = v29;
  if (v3 == 6) {
    int v30 = 96;
  }
  else {
    int v30 = 0;
  }
  if (v3 == 6) {
    int v31 = 124;
  }
  else {
    int v31 = 0;
  }
  int v161 = v31;
  int v32 = v24 + v30;
  if (v4 == 6) {
    int v33 = 65528;
  }
  else {
    int v33 = 0;
  }
  int v145 = v33;
  if (v4 == 6) {
    unsigned int v34 = v27 + 1;
  }
  else {
    unsigned int v34 = v27;
  }
  unsigned int v162 = v34;
  int v163 = v25;
  if (v4 == 7) {
    int v35 = 65528;
  }
  else {
    int v35 = 0;
  }
  BOOL v36 = v4 == 7;
  if (v4 == 7) {
    int v37 = 31;
  }
  else {
    int v37 = 0;
  }
  int v146 = v37;
  if (v4 == 7) {
    int v38 = 124;
  }
  else {
    int v38 = 0;
  }
  int v155 = v38;
  if (v4 == 7) {
    int v39 = 96;
  }
  else {
    int v39 = 0;
  }
  int v158 = v39;
  if (v4 == 7) {
    int v40 = 6;
  }
  else {
    int v40 = 0;
  }
  int v171 = v40;
  BOOL v41 = v4 == 8;
  BOOL v42 = 16 * v41 + 16 * v36;
  if (v4 == 8) {
    int v43 = 31;
  }
  else {
    int v43 = 0;
  }
  int v144 = v43;
  if (v4 == 8) {
    int v44 = 124;
  }
  else {
    int v44 = 0;
  }
  int v152 = v44;
  if (v4 == 8) {
    int v45 = 262136;
  }
  else {
    int v45 = 0;
  }
  if (v4 == 8) {
    int v46 = 96;
  }
  else {
    int v46 = 0;
  }
  int v156 = v46;
  if (v4 == 8) {
    int v47 = 6;
  }
  else {
    int v47 = 0;
  }
  int v170 = v47;
  BOOL v48 = v4 == 9;
  unint64_t v49 = v4 & 0xFFFFFFFFFFFFFFFELL;
  if (v4 == 9) {
    int v50 = 31;
  }
  else {
    int v50 = 0;
  }
  if (v4 == 9) {
    int v51 = 124;
  }
  else {
    int v51 = 0;
  }
  int v149 = v51;
  if (v4 == 9) {
    int v52 = 262136;
  }
  else {
    int v52 = 0;
  }
  if (v4 == 9) {
    int v53 = 96;
  }
  else {
    int v53 = 0;
  }
  int v153 = v53;
  if (v4 == 9) {
    int v54 = 6;
  }
  else {
    int v54 = 0;
  }
  int v169 = v54;
  unint64_t v173 = v4 & 0xFFFFFFFFFFFFFFFELL;
  BOOL v55 = v49 == 10;
  unsigned int v56 = v49 == 10;
  BOOL v57 = v42 + 16 * v48;
  unsigned int v58 = v57 + 16 * v28;
  unsigned int v59 = v58 + 16 * v56;
  self->_limits.maxTileTextures = v32 + (v36 << 7) + (v41 << 7) + (v48 << 7) + (v56 << 7);
  self->_limits.maxTileSamplers = v59 + 16 * v22;
  int v60 = v6 + v11 + v18;
  int v61 = (v41 << 7) + (v36 << 7) + (v48 << 7) + (v56 << 7);
  unsigned int v62 = v57 + 16 * v56;
  int v63 = v32 + v60;
  self->_limits.maxVertexTextures = v61 + v32 + v60;
  int v143 = 16 * v28 + 16 * v22 + 16 * v10 + 16 * v5 + 16 * v17;
  unsigned int v64 = v62 + v143;
  self->_limits.maxFragmentTextures = v61 + v32 + v60;
  self->_limits.maxComputeTextures = v61 + v32 + v60;
  int v65 = v157 + v154 + v150 + v147 + v145 + v35 + v45;
  if (v55) {
    int v66 = 262136;
  }
  else {
    int v66 = 0;
  }
  self->_limits.maxVisibilityQueryOffset = v65 + v52 + v66;
  if (v55) {
    int v67 = 31;
  }
  else {
    int v67 = 0;
  }
  unsigned int v68 = v151 + v148 + v146 + v144 + v50 + v67;
  self->_limits.linearTextureArrayAlignmentSlice = v61 + (v28 << 7);
  self->_limits.maxTileBuffers = v68;
  unsigned int v69 = v68 + v60;
  int32x2_t v70 = vdup_n_s32(v36);
  int8x8_t v71 = (int8x8_t)vcltz_s32(vshl_n_s32(v70, 0x1FuLL));
  int32x2_t v72 = (int32x2_t)vand_s8(v71, (int8x8_t)0x10000001000);
  int32x2_t v73 = vdup_n_s32(v41);
  int8x8_t v74 = (int8x8_t)vcltz_s32(vshl_n_s32(v73, 0x1FuLL));
  int32x2_t v75 = (int32x2_t)vand_s8(v74, (int8x8_t)0x10000001000);
  int32x2_t v76 = vdup_n_s32(v48);
  int8x8_t v77 = (int8x8_t)vcltz_s32(vshl_n_s32(v76, 0x1FuLL));
  int32x2_t v78 = (int32x2_t)vand_s8(v77, (int8x8_t)0x10000001000);
  int32x2_t v79 = vdup_n_s32(v56);
  int8x8_t v80 = (int8x8_t)vcltz_s32(vshl_n_s32(v79, 0x1FuLL));
  int32x2_t v81 = (int32x2_t)vand_s8(v80, (int8x8_t)0x10000001000);
  int32x2_t v82 = vdup_n_s32(v22);
  int8x8_t v83 = (int8x8_t)vcltz_s32(vshl_n_s32(v82, 0x1FuLL));
  int32x2_t v84 = vdup_n_s32(v28);
  int8x8_t v85 = (int8x8_t)vcltz_s32(vshl_n_s32(v84, 0x1FuLL));
  int32x2_t v86 = vadd_s32((int32x2_t)vand_s8(v83, (int8x8_t)0x10000001000), (int32x2_t)vand_s8(v85, (int8x8_t)0x10000001000));
  unsigned int v87 = v86.i32[0] + (v10 << 12) + (v5 << 12) + (v17 << 12) + v72.i32[0] + v75.i32[0] + v78.i32[0] + v81.i32[0];
  self->_limits.maxVertexInlineDataSize = v87;
  self->_limits.maxFragmentInlineDataSize = v87;
  self->_limits.maxComputeInlineDataSize = v87;
  self->_limits.minBufferNoCopyAlignmentBytes = v87;
  int v88 = (v28 << 16) + (v22 << 16);
  int32x2_t v89 = vdup_n_s32(v17);
  int32x2_t v90 = (int32x2_t)vand_s8((int8x8_t)vcltz_s32(vshl_n_s32(v89, 0x1FuLL)), (int8x8_t)0x80000004000);
  int v91 = (v48 << 10) + (v41 << 10);
  self->_limits.maxTotalComputeThreadsPerThreadgroup = (v91 | (v10 << 9))
                                                     + (v5 << 9)
                                                     + (v17 << 9)
                                                     + (v22 << 10)
                                                     + (v28 << 10)
                                                     + (v36 << 10)
                                                     + (v56 << 10);
  self->_limits.maxComputeThreadgroupMemory = (v88 | (v10 << 14))
                                            + (v5 << 14)
                                            + v90.i32[0]
                                            + (v36 << 16)
                                            + (v41 << 16)
                                            + (v48 << 16)
                                            + (v56 << 16);
  int v92 = 4 * v5 + 4 * v10;
  int v93 = 16 * v17 + 16 * v22;
  unsigned int v94 = v93 + (v42 | (v10 << 6)) + (v5 << 6) + 16 * v28 + 16 * v48 + 16 * v56;
  uint64_t v95 = ((v58 + v93) | v92) + 16 * v56;
  self->_limits.iosurfaceReadOnlyTextureAlignmentBytes = v95;
  self->_limits.deviceLinearTextureAlignmentBytes = v94;
  self->_limits.linearTextureAlignmentBytes = v94;
  self->_limits.deviceLinearReadOnlyTextureAlignmentBytes = v94;
  self->_limits.maxFunctionConstantIndices = v88
                                           + (v10 << 16)
                                           + (v5 << 16)
                                           + (v17 << 16)
                                           + (v36 << 16)
                                           + (v41 << 16)
                                           + (v48 << 16)
                                           + (v56 << 16);
  if (v55) {
    int v96 = 124;
  }
  else {
    int v96 = 0;
  }
  unsigned int v97 = v164 + v160 + v165 + v163 + v161 + v155 + v152 + v149 + v96;
  unsigned int v98 = 4 * v22 + 4 * v17 + 4 * v28 + v92;
  if (v55) {
    int v99 = 96;
  }
  else {
    int v99 = 0;
  }
  int v100 = v153 + v156 + v99;
  unsigned int v101 = v100 + v158 + v63;
  self->_limits.maxTessellationFactor = (v93 | (v28 << 6)) + (v36 << 6) + (v41 << 6) + (v48 << 6) + (v56 << 6);
  int v102 = v32 + v167 + v168 + v166 + v158;
  self->_limits.maxFramebufferStorageBits = ((v10 << 8) | (v5 << 7))
                                          + (v17 << 8)
                                          + (v22 << 9)
                                          + (v28 << 9)
                                          + (v36 << 9)
                                          + (v41 << 9)
                                          + (v48 << 9)
                                          + (v56 << 9);
  self->_limits.linearTextureArrayAlignmentBytes = v59;
  unsigned int v103 = 4 * v41 + 4 * v36 + 4 * v48 + 4 * v56 + v98;
  self->_limits.minConstantBufferAlignmentBytes = v103;
  self->_limits.maxFenceInstances = (v5 << 15)
                                  + (v10 << 15)
                                  + (v17 << 15)
                                  + (v22 << 15)
                                  + (v28 << 15)
                                  + (v36 << 15)
                                  + (v41 << 15)
                                  + (v48 << 15)
                                  + (v56 << 15);
  self->_limits.maxViewportCount = v59 | v159;
  self->_limits.maxCustomSamplePositions = v103;
  int32x2_t v104 = (int32x2_t)vand_s8(v77, (int8x8_t)0x200000008);
  int32x2_t v105 = (int32x2_t)vand_s8(v80, (int8x8_t)0x200000008);
  self->_limits.maxTextureBufferWidth = (((v5 << 26) + (v10 << 26)) | (v17 << 28))
                                      + (v22 << 28)
                                      + (v28 << 28)
                                      + (v36 << 28)
                                      + (v41 << 28)
                                      + (v48 << 28)
                                      + (v56 << 28);
  self->_limits.maxPredicatedNestingDepth = v172 - v5 - v17 - v22 - v28 - v36 - v41 - v48 - v56;
  int32x2_t v106 = vdup_n_s32(v10);
  int32x2_t v107 = vadd_s32((int32x2_t)vand_s8(v74, (int8x8_t)0x200000008), (int32x2_t)vand_s8(v71, (int8x8_t)0x200000008));
  self->_limits.maxAccelerationStructureLevels = 32 * v5
                                               + 32 * v10
                                               + 32 * v17
                                               + 32 * v22
                                               + 32 * v28
                                               + 32 * v36
                                               + 32 * v41
                                               + 32 * v48
                                               + 32 * v56;
  int32x2_t v108 = vdup_n_s32(v5);
  self->_limits.maxInterpolatedComponents = v97;
  self->_limits.maxInterpolants = v97;
  *(int32x2_t *)&self->_limits.maxTileInlineDataSize = vadd_s32(vadd_s32(v86, vadd_s32(v72, v75)), vadd_s32(v78, v81));
  v109.i64[0] = v108.u32[0];
  v109.i64[1] = v108.u32[1];
  float64x2_t v110 = (float64x2_t)vandq_s8((int8x16_t)xmmword_1828F0760, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL)));
  v109.i64[0] = v106.u32[0];
  v109.i64[1] = v106.u32[1];
  float64x2_t v111 = vaddq_f64(v110, (float64x2_t)vandq_s8((int8x16_t)xmmword_1828F0760, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL))));
  v109.i64[0] = v89.u32[0];
  v109.i64[1] = v89.u32[1];
  float64x2_t v112 = vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_1828F0760, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL))), v111);
  v109.i64[0] = v82.u32[0];
  v109.i64[1] = v82.u32[1];
  float64x2_t v113 = vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_1828F0760, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL))), v112);
  v109.i64[0] = v84.u32[0];
  v109.i64[1] = v84.u32[1];
  int8x16_t v114 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL));
  v109.i64[0] = v70.u32[0];
  v109.i64[1] = v70.u32[1];
  int8x16_t v115 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL));
  v109.i64[0] = v73.u32[0];
  v109.i64[1] = v73.u32[1];
  int8x16_t v116 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL));
  v109.i64[0] = v76.u32[0];
  v109.i64[1] = v76.u32[1];
  int8x16_t v117 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL));
  v109.i64[0] = v79.u32[0];
  v109.i64[1] = v79.u32[1];
  self->_limits.maxFragmentBuffers = v69;
  self->_limits.maxFragmentSamplers = v64;
  self->_limits.maxComputeBuffers = v69;
  self->_limits.maxComputeSamplers = v64;
  self->_limits.maxComputeLocalMemorySizes = v69;
  float64x2_t v118 = vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_1828F0760, (int8x16_t)vcltzq_s64(vshlq_n_s64(v109, 0x3FuLL))), vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_1828F0760, v117), vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_1828F0760, v116), vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_1828F0760, v115), vaddq_f64((float64x2_t)vandq_s8((int8x16_t)xmmword_1828F0760, v114), v113)))));
  *(float32x2_t *)&self->_limits.maxLineWidth = vcvt_f32_f64(v118);
  self->_limits.padmaxBufferLength = 0;
  *(int32x2_t *)&v118.f64[0] = vadd_s32(vadd_s32(vadd_s32(vadd_s32((int32x2_t)vand_s8((int8x8_t)vcltz_s32(vshl_n_s32(v108, 0x1FuLL)), (int8x8_t)0x80000002000), (int32x2_t)vand_s8((int8x8_t)vcltz_s32(vshl_n_s32(v106, 0x1FuLL)), (int8x8_t)0x80000002000)), vadd_s32(v90, (int32x2_t)vand_s8(v83, (int8x8_t)0x80000004000))), vadd_s32(vadd_s32((int32x2_t)vand_s8(v85, (int8x8_t)0x80000004000), (int32x2_t)vand_s8(v71, (int8x8_t)0x80000004000)), (int32x2_t)vand_s8(v74, (int8x8_t)0x80000004000))), vadd_s32((int32x2_t)vand_s8(v77, (int8x8_t)0x80000004000), (int32x2_t)vand_s8(v80, (int8x8_t)0x80000004000)));
  int8x16_t v119 = (int8x16_t)vzip1q_s32((int32x4_t)v118, (int32x4_t)v118);
  int8x16_t v120 = vextq_s8(v119, (int8x16_t)v118, 8uLL);
  v119.i32[2] = LODWORD(v118.f64[0]);
  *(int8x16_t *)&self->_limits.maxTextureWidth1D = v119;
  *(int8x16_t *)&self->_limits.maxTextureHeight3D = v120;
  self->_limits.iosurfaceTextureAlignmentBytes = v64;
  self->_limits.maxIndirectBuffers = v101;
  self->_limits.maxIndirectTextures = v101;
  *(int32x2_t *)&self->_limits.maxVertexAmplificationFactor = vadd_s32(vadd_s32(v107, vdup_n_s32(v162)), vadd_s32(v104, v105));
  self->_limits.maxConstantBufferArguments = v69;
  unsigned int v121 = ((v107.i32[0] + 8 * v10) | (4 * v5)) + 8 * v17 + 8 * v22 + 8 * v28 + v104.i32[0] + v105.i32[0];
  if (v55) {
    int v122 = 6;
  }
  else {
    int v122 = 0;
  }
  unsigned int v123 = v170 + v171 + v169 + v122 + v98;
  self->_limits.maxVertexAttributes = v69;
  self->_limits.maxVertexBuffers = v69;
  self->_limits.maxVertexSamplers = v64;
  self->_limits.maxComputeThreadgroupMemoryAlignmentBytes = v64;
  unsigned int v124 = v100 + v102;
  self->_limits.maxIndirectSamplers = v64;
  self->_limits.maxIndirectSamplersPerDevice = v100 + v102;
  self->_limits.maxComputeAttributes = v69;
  self->_limits.maxIOCommandsInFlight = v123;
  self->_limits.maxColorAttachments = v121;
  if (!v121)
  {
    v140 = "_limits.maxColorAttachments > 0";
    uint64_t v141 = 4218;
    goto LABEL_193;
  }
  unint64_t v125 = [(_MTLDevice *)self argumentBuffersSupport];
  unsigned int v126 = v101;
  if (v125)
  {
    if ([(_MTLDevice *)self argumentBuffersSupport] != 1)
    {
      self->_limits.maxIndirectBuffers = 0;
      goto LABEL_195;
    }
    if (v4 == 7) {
      int v127 = 500000;
    }
    else {
      int v127 = 0;
    }
    if (v4 == 8) {
      int v128 = 500000;
    }
    else {
      int v128 = 0;
    }
    if (v4 == 9) {
      int v129 = 500000;
    }
    else {
      int v129 = 0;
    }
    if (v173 == 10) {
      int v130 = 500000;
    }
    else {
      int v130 = 0;
    }
    unsigned int v126 = v128 + v127 + v129 + v130 + v63;
  }
  self->_limits.maxIndirectBuffers = v126;
  if (!v126)
  {
LABEL_195:
    v140 = "_limits.maxIndirectBuffers > 0";
    uint64_t v141 = 4221;
    goto LABEL_193;
  }
  if ([(_MTLDevice *)self argumentBuffersSupport])
  {
    if ([(_MTLDevice *)self argumentBuffersSupport] != 1)
    {
      self->_limits.maxIndirectTextures = 0;
      goto LABEL_197;
    }
    if (v4 == 7) {
      int v131 = 500000;
    }
    else {
      int v131 = 0;
    }
    if (v4 == 8) {
      int v132 = 500000;
    }
    else {
      int v132 = 0;
    }
    if (v4 == 9) {
      int v133 = 500000;
    }
    else {
      int v133 = 0;
    }
    if (v173 == 10) {
      int v134 = 500000;
    }
    else {
      int v134 = 0;
    }
    unsigned int v101 = v132 + v131 + v133 + v134 + v63;
  }
  self->_limits.maxIndirectTextures = v101;
  if (!v101)
  {
LABEL_197:
    v140 = "_limits.maxIndirectTextures > 0";
    uint64_t v141 = 4224;
    goto LABEL_193;
  }
  if ([(_MTLDevice *)self argumentBuffersSupport])
  {
    if ([(_MTLDevice *)self argumentBuffersSupport] != 1)
    {
      self->_limits.maxIndirectSamplers = 0;
      goto LABEL_199;
    }
    if (v4 == 7) {
      int v135 = 500000;
    }
    else {
      int v135 = 0;
    }
    if (v4 == 8) {
      int v136 = 500000;
    }
    else {
      int v136 = 0;
    }
    if (v4 == 9) {
      int v137 = 500000;
    }
    else {
      int v137 = 0;
    }
    if (v173 == 10) {
      int v138 = 500000;
    }
    else {
      int v138 = 0;
    }
    unsigned int v64 = v136 + v135 + v137 + v138 + v143;
  }
  self->_limits.maxIndirectSamplers = v64;
  if (!v64)
  {
LABEL_199:
    v140 = "_limits.maxIndirectSamplers > 0";
    uint64_t v141 = 4227;
    goto LABEL_193;
  }
  if ([(_MTLDevice *)self argumentBuffersSupport])
  {
    if ([(_MTLDevice *)self argumentBuffersSupport] != 1)
    {
      self->_limits.maxIndirectSamplersPerDevice = 0;
      goto LABEL_201;
    }
    if (v173 == 10) {
      int v139 = 500000;
    }
    else {
      int v139 = 0;
    }
    unsigned int v124 = (v91 | v139) + v102;
  }
  self->_limits.maxIndirectSamplersPerDevice = v124;
  if (!v124)
  {
LABEL_201:
    v140 = "_limits.maxIndirectSamplersPerDevice > 0";
    uint64_t v141 = 4230;
LABEL_193:
    MTLReleaseAssertionFailure((uint64_t)"-[_MTLDevice initLimits]", v141, (uint64_t)v140, 0, v36, v95, v41, v48, v142);
  }
  self->_limits.maxBufferLength = [(_MTLDevice *)self maxBufferLength];
  self->_limits.maxIOCommandsInFlight = v123;
}

- (unint64_t)argumentBuffersSupport
{
  return (~[(_MTLDevice *)self indirectArgumentBufferCapabilities] & 7) == 0;
}

- (BOOL)_rateLimitQueueCreation
{
  if (self->_kRateLimitTimePenalty <= 0.0) {
    return 0;
  }
  p_commandQueueWaitLock = &self->_commandQueueWaitLock;
  os_unfair_lock_lock(&self->_commandQueueWaitLock);
  unsigned int v4 = atomic_load(&self->_commandQueueID);
  uint64_t v5 = v4 % self->_kRateLimitCriticalCommandQueues;
  id v6 = (id)[(NSMutableArray *)self->_nextCommandQueueAllowedDateBuffer objectAtIndexedSubscript:v5];
  unsigned int v7 = atomic_load(&self->_commandQueueID);
  int v8 = (void *)[(NSMutableArray *)self->_nextCommandQueueAllowedDateBuffer objectAtIndexedSubscript:(v7 - 1) % self->_kRateLimitCriticalCommandQueues];
  if (objc_msgSend(v8, "compare:", objc_msgSend(MEMORY[0x1E4F1C9C8], "now")) == 1) {
    uint64_t v9 = [v8 dateByAddingTimeInterval:self->_kRateLimitTimePenalty];
  }
  else {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:self->_kRateLimitTimePenalty];
  }
  [(NSMutableArray *)self->_nextCommandQueueAllowedDateBuffer replaceObjectAtIndex:v5 withObject:v9];
  MTLAtomicIncrement((atomic_uint *)&self->_commandQueueID);
  os_unfair_lock_unlock(p_commandQueueWaitLock);
  if (objc_msgSend(v6, "compare:", objc_msgSend(MEMORY[0x1E4F1C9C8], "now")) != 1)
  {

    return 0;
  }
  if (self->_kRateLimitEnabled) {
    [MEMORY[0x1E4F29060] sleepUntilDate:v6];
  }

  createCommandQueueRateLimitingTelemetry();
  if (self->_kRateLimitEnabled)
  {
    if (self->_kRateLimitShouldOnlyLogOnce)
    {
      uint64_t v13 = 0;
      int v14 = &v13;
      uint64_t v15 = 0x2020000000;
      char v16 = 0;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37___MTLDevice__rateLimitQueueCreation__block_invoke;
      block[3] = &unk_1E5220550;
      block[4] = &v13;
      if (-[_MTLDevice _rateLimitQueueCreation]::onceToken != -1) {
        dispatch_once(&-[_MTLDevice _rateLimitQueueCreation]::onceToken, block);
      }
      BOOL v10 = *((unsigned char *)v14 + 24) != 0;
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      return 1;
    }
  }
  else
  {
    BOOL v10 = 0;
    self->_kRateLimitTimePenalty = 0.0;
  }
  return v10;
}

- (_MTLDevice)init
{
  v4.receiver = self;
  v4.super_class = (Class)_MTLDevice;
  v2 = [(_MTLDevice *)&v4 init];
  if (v2)
  {
    v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("Device serial queue", 0);
    v2->_pipelineSerializationQueue = (OS_dispatch_queue *)dispatch_queue_create("Pipeline serialization queue", 0);
    v2->_concurrentQueue = (OS_dispatch_queue *)dispatch_queue_create("Device concurrent queue", MEMORY[0x1E4F14430]);
    operator new();
  }
  return 0;
}

- (unint64_t)commandBufferErrorOptions
{
  return self->_commandBufferErrorOptions;
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  return -[MTLLoader loadLibrariesWithDevice:function:insertLibraries:options:error:]((uint64_t)self->_dynamicLoader, (uint64_t)self, (_MTLFunction *)a3, a4, a5, a6);
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5
{
  return [(_MTLDevice *)self loadDynamicLibrariesForFunction:a3 insertLibraries:a4 options:0 error:a5];
}

- (unint64_t)minConstantBufferAlignmentBytes
{
  return [(_MTLDevice *)self limits][120];
}

- (NSDictionary)pluginData
{
  return self->_pluginData;
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  unsigned int v7 = objc_alloc_init(MTLComputePipelineDescriptor);
  [(MTLComputePipelineDescriptor *)v7 setComputeFunction:a3];
  id v8 = [(_MTLDevice *)self newComputePipelineStateWithDescriptor:v7 error:a4];

  return v8;
}

- (void)releaseCacheEntry:(MTLLibraryContainer *)a3
{
}

- (BOOL)supportsBfloat16Buffers
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBfloat16Buffers];
}

- (BOOL)supportsUnalignedVertexFetch
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsUnalignedVertexFetch];
}

- (BOOL)requiresBFloat16Emulation
{
  return ![(_MTLDevice *)self supportsFamily:1009];
}

- (BOOL)supportsGlobalVariableRelocationCompute
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsGlobalVariableRelocationCompute];
}

- (void)registerComputePipelineDescriptor:(id)a3
{
  if ([(_MTLDevice *)self isCollectingPipelines])
  {
    MTLPipelineCollection::addComputePipeline((MTLPipelineCollection *)self->_pipelineCollection, (MTLComputePipelineDescriptor *)a3);
    if ((_dumpAtExit & 1) == 0)
    {
      [(_MTLDevice *)self dumpPipelineDescriptorsIfRequested];
    }
  }
}

- (BOOL)isCollectingPipelines
{
  return self->_pipelineCollection != 0;
}

- (void)initSerializationPaths
{
  if (!self->_hasInitSerializationPaths)
  {
    uint64_t v3 = (void *)MEMORY[0x18530C9F0]();
    _dumpAtExit = 0;
    objc_super v4 = getenv("MTL_DUMP_PIPELINES_TO_JSON_FILE");
    if (v4)
    {
      uint64_t v5 = v4;
      if ((os_variant_has_internal_diagnostics() & 1) == 0) {
        MTLReleaseAssertionFailure((uint64_t)"-[_MTLDevice initSerializationPaths]", 1605, (uint64_t)"!\"Dumping pipelines is not supported!\"", 0, v6, v7, v8, v9, v14);
      }
      BOOL v10 = (void *)[[NSString alloc] initWithUTF8String:v5];
      self->_pipelineDescriptorsOutputFile = (NSString *)(id)[v10 stringByExpandingTildeInPath];

      int v11 = getenv("MTL_DUMP_LIBRARIES_TO_DIRECTORY");
      if (v11)
      {
        int v12 = (void *)[[NSString alloc] initWithUTF8String:v11];
        self->_librariesOutputDirectory = (NSString *)(id)[v12 stringByExpandingTildeInPath];
      }
      uint64_t v13 = getenv("MTL_COLLECT_PIPELINES_AT_EXIT");
      if (!v13) {
        uint64_t v13 = "0";
      }
      if (strtol(v13, 0, 0))
      {
        _dumpAtExit = 1;
        atexit((void (*)(void))pipelineDumper);
      }
      [(_MTLDevice *)self startCollectingPipelineDescriptors];
    }
    self->_hasInitSerializationPaths = 1;
  }
}

- (BOOL)supportsSeparateVisibilityAndShadingRate
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSeparateVisibilityAndShadingRate];
}

- (BOOL)supportsRenderPassWithoutRenderTarget
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRenderPassWithoutRenderTarget];
}

- (unint64_t)maxColorAttachments
{
  return [(_MTLDevice *)self limits][32];
}

- (unint64_t)maxFramebufferStorageBits
{
  return *(unsigned int *)[(_MTLDevice *)self limits];
}

- (BOOL)supportsSeparateDepthStencil
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSeparateDepthStencil];
}

- (void)_incrementCommandQueueCount
{
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  uint64_t v5 = (void *)-[_MTLDevice newIndirectArgumentBufferLayoutWithStructType:](self, "newIndirectArgumentBufferLayoutWithStructType:", [a3 bufferStructType]);
  objc_msgSend(v5, "setStructType:withDevice:", objc_msgSend(a3, "bufferStructType"), self);
  id v6 = [(_MTLDevice *)self newArgumentEncoderWithLayout:v5];

  return v6;
}

- (void)initFeatureQueries
{
  [(_MTLDevice *)self initGPUFamilySupport];
  uint64_t v3 = [[MTLDeviceFeatureQueries alloc] initWithDevice:self];
  self->_featureQueries = v3;

  [(MTLDeviceFeatureQueries *)v3 validate];
}

- (BOOL)supportsExtendedXR10Formats
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsExtendedXR10Formats];
}

- (BOOL)supportsTextureSwizzle
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsTextureSwizzle];
}

- (BOOL)supportsDepthClipMode
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsDepthClipMode];
}

- (BOOL)supportsGlobalVariableBindingInDylibs
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsGlobalVariableBindingInDylibs];
}

- (BOOL)supportsNonUniformThreadgroupSize
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsNonUniformThreadgroupSize];
}

- (BOOL)supportsTextureCubeArray
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsTextureCubeArray];
}

- (BOOL)supportsTessellation
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsTessellation];
}

- (BOOL)supportsReadWriteTextureCubeArguments
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsReadWriteTextureCubeArguments];
}

- (BOOL)supportsProgrammableBlending
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsProgrammableBlending];
}

- (BOOL)supportsMSAAStencilResolve
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMSAAStencilResolve];
}

- (BOOL)supportsMSAADepthResolve
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMSAADepthResolve];
}

- (BOOL)supportsLayeredRendering
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsLayeredRendering];
}

- (BOOL)supportsBaseVertexInstanceDrawing
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBaseVertexInstanceDrawing];
}

- (BOOL)supportsSharedStorageHeapResources
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSharedStorageHeapResources];
}

- (BOOL)supportsSIMDShuffleAndFill
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSIMDShuffleAndFill];
}

- (BOOL)supportsSIMDReduction
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSIMDReduction];
}

- (BOOL)supportsWritableArrayOfTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsWritableArrayOfTextures];
}

- (BOOL)supportsSIMDShufflesAndBroadcast
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSIMDShufflesAndBroadcast];
}

- (BOOL)supportsReadWriteTextureArgumentsTier2
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsReadWriteTextureArgumentsTier2];
}

- (BOOL)supportsQuadShufflesAndBroadcast
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsQuadShufflesAndBroadcast];
}

- (BOOL)supportsNorm16BCubicFiltering
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsNorm16BCubicFiltering];
}

- (BOOL)supportsFunctionPointersFromRender
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFunctionPointersFromRender];
}

- (BOOL)supportsFloat16BCubicFiltering
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFloat16BCubicFiltering];
}

- (BOOL)supportsConditionalLoadStore
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsConditionalLoadStore];
}

- (BOOL)supportsCommandBufferJump
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsCommandBufferJump];
}

- (BOOL)supportsArrayOfTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsArrayOfTextures];
}

- (BOOL)supports32BitFloatFiltering
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupports32BitFloatFiltering];
}

- (BOOL)supportsYCBCRPackedFormats12
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsYCBCRPackedFormats12];
}

- (BOOL)supportsYCBCRFormats12
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsYCBCRFormats12];
}

- (BOOL)supportsTileShaders
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsTileShaders];
}

- (BOOL)supportsSIMDGroup
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSIMDGroup];
}

- (BOOL)supportsRasterOrderGroups
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRasterOrderGroups];
}

- (BOOL)supportsNativeHardwareFP16
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsNativeHardwareFP16];
}

- (BOOL)supportsBinaryArchives
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBinaryArchives];
}

- (BOOL)supportsYCBCRPackedFormatsXR
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsYCBCRPackedFormatsXR];
}

- (BOOL)supportsYCBCRPackedFormatsPQ
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsYCBCRPackedFormatsPQ];
}

- (BOOL)supportsYCBCRFormats
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsYCBCRFormats];
}

- (BOOL)supportsYCBCRFormatsXR
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsYCBCRFormatsXR];
}

- (BOOL)supportsYCBCRFormatsPQ
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsYCBCRFormatsPQ];
}

- (BOOL)supportsViewportAndScissorArray
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsViewportAndScissorArray];
}

- (BOOL)supportsVariableRateRasterization
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsVariableRateRasterization];
}

- (BOOL)supportsTextureOutOfBoundsReads
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsTextureOutOfBoundsReads];
}

- (BOOL)supportsStencilFeedback
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsStencilFeedback];
}

- (BOOL)supportsStatefulDynamicLibraries
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsStatefulDynamicLibraries];
}

- (BOOL)supportsStackOverflowErrorCode
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsStackOverflowErrorCode];
}

- (BOOL)supportsSparseTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSparseTextures];
}

- (BOOL)supportsSparseHeaps
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSparseHeaps];
}

- (BOOL)supportsSparseDepthAttachments
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSparseDepthAttachments];
}

- (BOOL)supportsSharedTextureHandles
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSharedTextureHandles];
}

- (BOOL)supportsSharedStorageTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSharedStorageTextures];
}

- (BOOL)supportsSharedFunctionTables
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSharedFunctionTables];
}

- (BOOL)supportsShaderLODAverage
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsShaderLODAverage];
}

- (BOOL)supportsSetThreadgroupPackingDisabled
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSetThreadgroupPackingDisabled];
}

- (BOOL)supportsSamplerCompareFunction
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSamplerCompareFunction];
}

- (BOOL)supportsSRGBwrites
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSRGBwrites];
}

- (BOOL)supportsSIMDGroupMatrix
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSIMDGroupMatrix];
}

- (BOOL)supportsResourceHeaps
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsResourceHeaps];
}

- (BOOL)supportsRenderToLinearTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRenderToLinearTextures];
}

- (BOOL)supportsRenderTextureWrites
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRenderTextureWrites];
}

- (BOOL)supportsRenderTargetTextureRotation
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRenderTargetTextureRotation];
}

- (BOOL)supportsRenderMemoryBarrier
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRenderMemoryBarrier];
}

- (BOOL)supportsRenderDynamicLibraries
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRenderDynamicLibraries];
}

- (BOOL)supportsRelaxedTextureViewRequirements
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRelaxedTextureViewRequirements];
}

- (BOOL)supportsReadWriteTextureArguments
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsReadWriteTextureArguments];
}

- (BOOL)supportsReadWriteBufferArguments
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsReadWriteBufferArguments];
}

- (BOOL)supportsRaytracingFromRender
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRaytracingFromRender];
}

- (BOOL)supportsRayTracingTraversalMetrics
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingTraversalMetrics];
}

- (BOOL)supportsRayTracingPerPrimitiveData
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingPerPrimitiveData];
}

- (BOOL)supportsRayTracingPerComponentMotionInterpolation
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingPerComponentMotionInterpolation];
}

- (BOOL)supportsRayTracingMultiLevelInstancing
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingMultiLevelInstancing];
}

- (BOOL)supportsRayTracingMatrixLayout
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingMatrixLayout];
}

- (BOOL)supportsRayTracingIndirectInstanceAccelerationStructureBuild
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingIndirectInstanceAccelerationStructureBuild];
}

- (BOOL)supportsRayTracingICBs
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingICBs];
}

- (BOOL)supportsRayTracingGPUTableUpdateBuffers
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingGPUTableUpdateBuffers];
}

- (BOOL)supportsRayTracingExtendedVertexFormats
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingExtendedVertexFormats];
}

- (BOOL)supportsRayTracingDirectIntersectionResultAccess
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingDirectIntersectionResultAccess];
}

- (BOOL)supportsRayTracingCurves
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingCurves];
}

- (BOOL)supportsRayTracingBuffersFromTables
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingBuffersFromTables];
}

- (BOOL)supportsRayTracingAccelerationStructureCPUDeserialization
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRayTracingAccelerationStructureCPUDeserialization];
}

- (BOOL)supportsRasterOrderGroupsColorAttachment
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRasterOrderGroupsColorAttachment];
}

- (BOOL)supportsRTZRounding
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRTZRounding];
}

- (BOOL)supportsRGBA10A2Gamma
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsRGBA10A2Gamma];
}

- (BOOL)supportsQuadReduction
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsQuadReduction];
}

- (BOOL)supportsQuadGroup
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsQuadGroup];
}

- (BOOL)supportsPullModelInterpolation
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPullModelInterpolation];
}

- (BOOL)supportsPublicXR10Formats
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPublicXR10Formats];
}

- (BOOL)supportsProgrammableSamplePositions
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsProgrammableSamplePositions];
}

- (BOOL)supportsPrimitiveRestartOverride
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPrimitiveRestartOverride];
}

- (BOOL)supportsPrimitiveMotionBlur
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPrimitiveMotionBlur];
}

- (BOOL)supportsPostDepthCoverage
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPostDepthCoverage];
}

- (BOOL)supportsPlacementHeaps
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPlacementHeaps];
}

- (BOOL)supportsPipelineLibraries
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPipelineLibraries];
}

- (BOOL)supportsPerformanceStateAssertion
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPerformanceStateAssertion];
}

- (BOOL)supportsPacked32TextureBufferWrites
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPacked32TextureBufferWrites];
}

- (BOOL)supportsOpenCLTextureWriteSwizzles
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsOpenCLTextureWriteSwizzles];
}

- (BOOL)supportsNonZeroTextureWriteLOD
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsNonZeroTextureWriteLOD];
}

- (BOOL)supportsNonSquareTileShaders
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsNonSquareTileShaders];
}

- (BOOL)supportsMutableTier1ArgumentBuffers
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMutableTier1ArgumentBuffers];
}

- (BOOL)supportsMipLevelsSmallerThanBlockSize
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMipLevelsSmallerThanBlockSize];
}

- (BOOL)supportsMeshShadersInICB
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMeshShadersInICB];
}

- (BOOL)supportsMeshRenderDynamicLibraries
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMeshRenderDynamicLibraries];
}

- (BOOL)supportsMSAAStencilResolveFilter
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMSAAStencilResolveFilter];
}

- (BOOL)supportsMSAADepthResolveFilter
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMSAADepthResolveFilter];
}

- (BOOL)supportsLossyCompression
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsLossyCompression];
}

- (BOOL)supportsLinearTextureFromSharedBuffer
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsLinearTextureFromSharedBuffer];
}

- (BOOL)supportsLinearTexture2DArray
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsLinearTexture2DArray];
}

- (BOOL)supportsLimitedYUVFormats
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsLimitedYUVFormats];
}

- (BOOL)supportsInvariantVertexPosition
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsInvariantVertexPosition];
}

- (BOOL)supportsInterchangeTiled
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsInterchangeTiled];
}

- (BOOL)supportsInt64
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsInt64];
}

- (BOOL)supportsIndirectWritableTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsIndirectWritableTextures];
}

- (BOOL)supportsIndirectTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsIndirectTextures];
}

- (BOOL)supportsIndirectTessellation
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsIndirectTessellation];
}

- (BOOL)supportsIndirectStageInRegion
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsIndirectStageInRegion];
}

- (BOOL)supportsIndirectDrawAndDispatch
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsIndirectDrawAndDispatch];
}

- (BOOL)supportsImageBlocks
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsImageBlocks];
}

- (BOOL)supportsImageBlockSampleCoverageControl
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsImageBlockSampleCoverageControl];
}

- (BOOL)supportsIABHashForTools
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsIABHashForTools];
}

- (BOOL)supportsHeapAccelerationStructureAllocation
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsHeapAccelerationStructureAllocation];
}

- (BOOL)supportsGlobalVariableBindings
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsGlobalVariableBindings];
}

- (BOOL)supportsGPUStatistics
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsGPUStatistics];
}

- (BOOL)supportsGFXIndirectCommandBuffers
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsGFXIndirectCommandBuffers];
}

- (BOOL)supportsFunctionPointers
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFunctionPointers];
}

- (BOOL)supportsFunctionPointersFromMesh
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFunctionPointersFromMesh];
}

- (BOOL)supportsFragmentBufferWrites
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFragmentBufferWrites];
}

- (BOOL)supportsForkJoin
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsForkJoin];
}

- (BOOL)supportsForceSeamsOnCubemaps
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsForceSeamsOnCubemaps];
}

- (BOOL)supportsFloat16InfNanFiltering
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFloat16InfNanFiltering];
}

- (BOOL)supportsFixedLinePointFillDepthGradient
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFixedLinePointFillDepthGradient];
}

- (BOOL)supportsFillTexture
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFillTexture];
}

- (BOOL)supportsFastMathInfNaNPropagation
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFastMathInfNaNPropagation];
}

- (BOOL)supportsFP32TessFactors
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFP32TessFactors];
}

- (BOOL)supportsExtendedYUVFormats
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsExtendedYUVFormats];
}

- (BOOL)supportsExtendedVertexFormats
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsExtendedVertexFormats];
}

- (BOOL)supportsDynamicControlPointCount
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsDynamicControlPointCount];
}

- (BOOL)supportsDynamicAttributeStride
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsDynamicAttributeStride];
}

- (BOOL)supportsDevicePartitioning
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsDevicePartitioning];
}

- (BOOL)supportsDeviceCoherency
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsDeviceCoherency];
}

- (BOOL)supportsDepthClipModeClampExtended
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsDepthClipModeClampExtended];
}

- (BOOL)supportsCountingOcclusionQuery
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsCountingOcclusionQuery];
}

- (BOOL)supportsConcurrentComputeDispatch
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsConcurrentComputeDispatch];
}

- (BOOL)supportsComputeMemoryBarrier
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsComputeMemoryBarrier];
}

- (BOOL)supportsCompressedTextureViewSPI
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsCompressedTextureViewSPI];
}

- (BOOL)supportsCombinedMSAAStoreAndResolveAction
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsCombinedMSAAStoreAndResolveAction];
}

- (BOOL)supportsColorSpaceConversionMatrixSelection
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsColorSpaceConversionMatrixSelection];
}

- (BOOL)supportsCMPIndirectCommandBuffers
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsCMPIndirectCommandBuffers];
}

- (BOOL)supportsBufferWithIOSurface
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBufferWithIOSurface];
}

- (BOOL)supportsBufferPrefetchStatistics
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBufferPrefetchStatistics];
}

- (BOOL)supportsBinaryLibraries
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBinaryLibraries];
}

- (BOOL)supportsBfloat16Format
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBfloat16Format];
}

- (BOOL)supportsArrayOfSamplers
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsArrayOfSamplers];
}

- (BOOL)supportsArgumentBuffers
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsArgumentBuffers];
}

- (BOOL)supportsArgumentBuffersTier2
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsArgumentBuffersTier2];
}

- (BOOL)supportsAnisoSampleFix
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsAnisoSampleFix];
}

- (BOOL)supportsAlphaYUVFormats
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsAlphaYUVFormats];
}

- (BOOL)supportsASTCTextureCompression
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsASTCTextureCompression];
}

- (BOOL)supportsASTCHDRTextureCompression
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsASTCHDRTextureCompression];
}

- (BOOL)supports3DBCTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupports3DBCTextures];
}

- (BOOL)supports3DASTCTextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupports3DASTCTextures];
}

- (BOOL)supports32BitMSAA
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupports32BitMSAA];
}

- (BOOL)supports2DLinearTexArraySPI
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupports2DLinearTexArraySPI];
}

- (void)initGPUFamilySupport
{
  supportedGPUFamilies = self->_supportedGPUFamilies;
  if (!supportedGPUFamilies) {
    operator new();
  }
  supportedGPUFamilies[1] = *supportedGPUFamilies;
  uint64_t v3 = [(_MTLDevice *)self featureProfile];
  if (v3 > 9999)
  {
    if (v3 <= 19999)
    {
      if (v3 == 10000)
      {
        int v20 = (char *)supportedGPUFamilies[1];
      }
      else
      {
        if (v3 == 10001)
        {
          uint64_t v7 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          if (v3 != 10002) {
            return;
          }
          unint64_t v5 = supportedGPUFamilies[2];
          id v6 = (void *)supportedGPUFamilies[1];
          if ((unint64_t)v6 >= v5)
          {
            int v31 = (void *)*supportedGPUFamilies;
            uint64_t v32 = ((uint64_t)v6 - *supportedGPUFamilies) >> 3;
            unint64_t v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 61) {
              goto LABEL_534;
            }
            uint64_t v34 = v5 - (void)v31;
            if (v34 >> 2 > v33) {
              unint64_t v33 = v34 >> 2;
            }
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v35 = v33;
            }
            if (v35)
            {
              BOOL v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v35);
              int v31 = (void *)*supportedGPUFamilies;
              id v6 = (void *)supportedGPUFamilies[1];
            }
            else
            {
              BOOL v36 = 0;
            }
            v198 = &v36[8 * v32];
            v199 = &v36[8 * v35];
            *(void *)v198 = 5001;
            uint64_t v7 = v198 + 8;
            while (v6 != v31)
            {
              uint64_t v200 = *--v6;
              *((void *)v198 - 1) = v200;
              v198 -= 8;
            }
            void *supportedGPUFamilies = v198;
            supportedGPUFamilies[1] = v7;
            supportedGPUFamilies[2] = v199;
            if (v31) {
              operator delete(v31);
            }
          }
          else
          {
            *id v6 = 5001;
            uint64_t v7 = (char *)(v6 + 1);
          }
          supportedGPUFamilies[1] = v7;
        }
        v202 = (char **)(supportedGPUFamilies + 2);
        v201 = (char *)supportedGPUFamilies[2];
        if (v7 >= v201)
        {
          v204 = (char *)*supportedGPUFamilies;
          uint64_t v205 = (uint64_t)&v7[-*supportedGPUFamilies] >> 3;
          unint64_t v206 = v205 + 1;
          if ((unint64_t)(v205 + 1) >> 61) {
            goto LABEL_534;
          }
          uint64_t v207 = v201 - v204;
          if (v207 >> 2 > v206) {
            unint64_t v206 = v207 >> 2;
          }
          if ((unint64_t)v207 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v208 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v208 = v206;
          }
          if (v208)
          {
            v209 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v208);
            v204 = (char *)*supportedGPUFamilies;
            uint64_t v7 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v209 = 0;
          }
          v210 = &v209[8 * v205];
          v201 = &v209[8 * v208];
          *(void *)v210 = 3003;
          v203 = v210 + 8;
          while (v7 != v204)
          {
            uint64_t v211 = *((void *)v7 - 1);
            v7 -= 8;
            *((void *)v210 - 1) = v211;
            v210 -= 8;
          }
          void *supportedGPUFamilies = v210;
          supportedGPUFamilies[1] = v203;
          supportedGPUFamilies[2] = v201;
          if (v204)
          {
            operator delete(v204);
            v201 = *v202;
          }
        }
        else
        {
          *(void *)uint64_t v7 = 3003;
          v203 = v7 + 8;
        }
        supportedGPUFamilies[1] = v203;
        if (v203 >= v201)
        {
          v213 = (char *)*supportedGPUFamilies;
          uint64_t v214 = (uint64_t)&v203[-*supportedGPUFamilies] >> 3;
          unint64_t v215 = v214 + 1;
          if ((unint64_t)(v214 + 1) >> 61) {
            goto LABEL_534;
          }
          uint64_t v216 = v201 - v213;
          if (v216 >> 2 > v215) {
            unint64_t v215 = v216 >> 2;
          }
          if ((unint64_t)v216 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v217 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v217 = v215;
          }
          if (v217)
          {
            v218 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v217);
            v213 = (char *)*supportedGPUFamilies;
            v203 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v218 = 0;
          }
          v219 = &v218[8 * v214];
          v220 = &v218[8 * v217];
          *(void *)v219 = 2002;
          v212 = v219 + 8;
          while (v203 != v213)
          {
            uint64_t v221 = *((void *)v203 - 1);
            v203 -= 8;
            *((void *)v219 - 1) = v221;
            v219 -= 8;
          }
          void *supportedGPUFamilies = v219;
          supportedGPUFamilies[1] = v212;
          supportedGPUFamilies[2] = v220;
          if (v213) {
            operator delete(v213);
          }
        }
        else
        {
          *(void *)v203 = 2002;
          v212 = v203 + 8;
        }
        supportedGPUFamilies[1] = v212;
        int v222 = _CFMZEnabled();
        int v20 = (char *)supportedGPUFamilies[1];
        if (v222)
        {
          if (v20 >= *v202)
          {
            v224 = (char *)*supportedGPUFamilies;
            uint64_t v225 = (uint64_t)&v20[-*supportedGPUFamilies] >> 3;
            unint64_t v226 = v225 + 1;
            if ((unint64_t)(v225 + 1) >> 61) {
              goto LABEL_534;
            }
            uint64_t v227 = *v202 - v224;
            if (v227 >> 2 > v226) {
              unint64_t v226 = v227 >> 2;
            }
            if ((unint64_t)v227 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v228 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v228 = v226;
            }
            if (v228)
            {
              v229 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v228);
              v224 = (char *)*supportedGPUFamilies;
              int v20 = (char *)supportedGPUFamilies[1];
            }
            else
            {
              v229 = 0;
            }
            v230 = &v229[8 * v225];
            v231 = &v229[8 * v228];
            *(void *)v230 = 4002;
            v223 = v230 + 8;
            while (v20 != v224)
            {
              uint64_t v232 = *((void *)v20 - 1);
              v20 -= 8;
              *((void *)v230 - 1) = v232;
              v230 -= 8;
            }
            void *supportedGPUFamilies = v230;
            supportedGPUFamilies[1] = v223;
            supportedGPUFamilies[2] = v231;
            if (v224) {
              operator delete(v224);
            }
          }
          else
          {
            *(void *)int v20 = 4002;
            v223 = v20 + 8;
          }
          supportedGPUFamilies[1] = v223;
          int v20 = v223;
        }
      }
      v234 = (char **)(supportedGPUFamilies + 2);
      v233 = (char *)supportedGPUFamilies[2];
      if (v20 >= v233)
      {
        v236 = (char *)*supportedGPUFamilies;
        uint64_t v237 = (uint64_t)&v20[-*supportedGPUFamilies] >> 3;
        unint64_t v238 = v237 + 1;
        if ((unint64_t)(v237 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v239 = v233 - v236;
        if (v239 >> 2 > v238) {
          unint64_t v238 = v239 >> 2;
        }
        if ((unint64_t)v239 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v240 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v240 = v238;
        }
        if (v240)
        {
          v241 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v240);
          v236 = (char *)*supportedGPUFamilies;
          int v20 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v241 = 0;
        }
        v242 = &v241[8 * v237];
        v233 = &v241[8 * v240];
        *(void *)v242 = 3001;
        v235 = v242 + 8;
        while (v20 != v236)
        {
          uint64_t v243 = *((void *)v20 - 1);
          v20 -= 8;
          *((void *)v242 - 1) = v243;
          v242 -= 8;
        }
        void *supportedGPUFamilies = v242;
        supportedGPUFamilies[1] = v235;
        supportedGPUFamilies[2] = v233;
        if (v236)
        {
          operator delete(v236);
          v233 = *v234;
        }
      }
      else
      {
        *(void *)int v20 = 3001;
        v235 = v20 + 8;
      }
      supportedGPUFamilies[1] = v235;
      if (v235 >= v233)
      {
        v245 = (char *)*supportedGPUFamilies;
        uint64_t v246 = (uint64_t)&v235[-*supportedGPUFamilies] >> 3;
        unint64_t v247 = v246 + 1;
        if ((unint64_t)(v246 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v248 = v233 - v245;
        if (v248 >> 2 > v247) {
          unint64_t v247 = v248 >> 2;
        }
        if ((unint64_t)v248 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v249 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v249 = v247;
        }
        if (v249)
        {
          v250 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v249);
          v245 = (char *)*supportedGPUFamilies;
          v235 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v250 = 0;
        }
        v251 = &v250[8 * v246];
        v233 = &v250[8 * v249];
        *(void *)v251 = 3002;
        v244 = v251 + 8;
        while (v235 != v245)
        {
          uint64_t v252 = *((void *)v235 - 1);
          v235 -= 8;
          *((void *)v251 - 1) = v252;
          v251 -= 8;
        }
        void *supportedGPUFamilies = v251;
        supportedGPUFamilies[1] = v244;
        supportedGPUFamilies[2] = v233;
        if (v245)
        {
          operator delete(v245);
          v233 = *v234;
        }
      }
      else
      {
        *(void *)v235 = 3002;
        v244 = v235 + 8;
      }
      supportedGPUFamilies[1] = v244;
      if (v244 >= v233)
      {
        v254 = (char *)*supportedGPUFamilies;
        uint64_t v255 = (uint64_t)&v244[-*supportedGPUFamilies] >> 3;
        unint64_t v256 = v255 + 1;
        if ((unint64_t)(v255 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v257 = v233 - v254;
        if (v257 >> 2 > v256) {
          unint64_t v256 = v257 >> 2;
        }
        if ((unint64_t)v257 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v258 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v258 = v256;
        }
        if (v258)
        {
          v259 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v258);
          v254 = (char *)*supportedGPUFamilies;
          v244 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v259 = 0;
        }
        v260 = &v259[8 * v255];
        v261 = &v259[8 * v258];
        *(void *)v260 = 2001;
        v253 = v260 + 8;
        while (v244 != v254)
        {
          uint64_t v262 = *((void *)v244 - 1);
          v244 -= 8;
          *((void *)v260 - 1) = v262;
          v260 -= 8;
        }
        void *supportedGPUFamilies = v260;
        supportedGPUFamilies[1] = v253;
        supportedGPUFamilies[2] = v261;
        if (v254) {
          operator delete(v254);
        }
      }
      else
      {
        *(void *)v244 = 2001;
        v253 = v244 + 8;
      }
      supportedGPUFamilies[1] = v253;
      if (!_CFMZEnabled()) {
        return;
      }
      v264 = (char *)supportedGPUFamilies[1];
      unint64_t v263 = supportedGPUFamilies[2];
      if ((unint64_t)v264 < v263)
      {
        *(void *)v264 = 4001;
        v188 = v264 + 8;
        goto LABEL_532;
      }
      v189 = (char *)*supportedGPUFamilies;
      uint64_t v265 = (uint64_t)&v264[-*supportedGPUFamilies] >> 3;
      unint64_t v266 = v265 + 1;
      if (!((unint64_t)(v265 + 1) >> 61))
      {
        uint64_t v267 = v263 - (void)v189;
        if (v267 >> 2 > v266) {
          unint64_t v266 = v267 >> 2;
        }
        if ((unint64_t)v267 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v268 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v268 = v266;
        }
        if (v268)
        {
          v269 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v268);
          v189 = (char *)*supportedGPUFamilies;
          v264 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v269 = 0;
        }
        v270 = &v269[8 * v265];
        v196 = &v269[8 * v268];
        *(void *)v270 = 4001;
        v188 = v270 + 8;
        while (v264 != v189)
        {
          uint64_t v271 = *((void *)v264 - 1);
          v264 -= 8;
          *((void *)v270 - 1) = v271;
          v270 -= 8;
        }
        void *supportedGPUFamilies = v270;
        goto LABEL_530;
      }
LABEL_534:
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    }
    if (v3 == 20000)
    {
      int v21 = (char *)supportedGPUFamilies[2];
      unsigned int v22 = (char *)supportedGPUFamilies[1];
      if (v22 >= v21)
      {
        int v43 = (char *)*supportedGPUFamilies;
        uint64_t v44 = (uint64_t)&v22[-*supportedGPUFamilies] >> 3;
        unint64_t v45 = v44 + 1;
        if ((unint64_t)(v44 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v46 = v21 - v43;
        if (v46 >> 2 > v45) {
          unint64_t v45 = v46 >> 2;
        }
        if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v47 = v45;
        }
        if (v47)
        {
          BOOL v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v47);
          int v43 = (char *)*supportedGPUFamilies;
          unsigned int v22 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          BOOL v48 = 0;
        }
        v281 = &v48[8 * v44];
        int v21 = &v48[8 * v47];
        *(void *)v281 = 1001;
        int v23 = v281 + 8;
        while (v22 != v43)
        {
          uint64_t v282 = *((void *)v22 - 1);
          v22 -= 8;
          *((void *)v281 - 1) = v282;
          v281 -= 8;
        }
        void *supportedGPUFamilies = v281;
        supportedGPUFamilies[1] = v23;
        supportedGPUFamilies[2] = v21;
        if (v43)
        {
          operator delete(v43);
          int v21 = (char *)supportedGPUFamilies[2];
        }
      }
      else
      {
        *(void *)unsigned int v22 = 1001;
        int v23 = v22 + 8;
      }
      supportedGPUFamilies[1] = v23;
      if (v23 >= v21)
      {
        v189 = (char *)*supportedGPUFamilies;
        uint64_t v283 = (uint64_t)&v23[-*supportedGPUFamilies] >> 3;
        unint64_t v284 = v283 + 1;
        if (!((unint64_t)(v283 + 1) >> 61))
        {
          uint64_t v285 = v21 - v189;
          if (v285 >> 2 > v284) {
            unint64_t v284 = v285 >> 2;
          }
          if ((unint64_t)v285 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v286 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v286 = v284;
          }
          if (v286)
          {
            v287 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v286);
            v189 = (char *)*supportedGPUFamilies;
            int v23 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v287 = 0;
          }
          v195 = &v287[8 * v283];
          v196 = &v287[8 * v286];
          *(void *)v195 = 3001;
          v188 = v195 + 8;
          while (v23 != v189)
          {
            uint64_t v296 = *((void *)v23 - 1);
            v23 -= 8;
            *((void *)v195 - 1) = v296;
            v195 -= 8;
          }
          goto LABEL_529;
        }
        goto LABEL_534;
      }
    }
    else
    {
      if (v3 == 30000)
      {
        int v24 = (char *)supportedGPUFamilies[1];
      }
      else
      {
        if (v3 != 30002) {
          return;
        }
        uint64_t v9 = (char **)(supportedGPUFamilies + 2);
        uint64_t v8 = (char *)supportedGPUFamilies[2];
        BOOL v10 = (char *)supportedGPUFamilies[1];
        if (v10 >= v8)
        {
          int v37 = (char *)*supportedGPUFamilies;
          uint64_t v38 = (uint64_t)&v10[-*supportedGPUFamilies] >> 3;
          unint64_t v39 = v38 + 1;
          if ((unint64_t)(v38 + 1) >> 61) {
            goto LABEL_534;
          }
          uint64_t v40 = v8 - v37;
          if (v40 >> 2 > v39) {
            unint64_t v39 = v40 >> 2;
          }
          if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v41 = v39;
          }
          if (v41)
          {
            BOOL v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v41);
            int v37 = (char *)*supportedGPUFamilies;
            BOOL v10 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            BOOL v42 = 0;
          }
          v272 = &v42[8 * v38];
          uint64_t v8 = &v42[8 * v41];
          *(void *)v272 = 1005;
          int v11 = v272 + 8;
          while (v10 != v37)
          {
            uint64_t v273 = *((void *)v10 - 1);
            v10 -= 8;
            *((void *)v272 - 1) = v273;
            v272 -= 8;
          }
          void *supportedGPUFamilies = v272;
          supportedGPUFamilies[1] = v11;
          supportedGPUFamilies[2] = v8;
          if (v37)
          {
            operator delete(v37);
            uint64_t v8 = *v9;
          }
        }
        else
        {
          *(void *)BOOL v10 = 1005;
          int v11 = v10 + 8;
        }
        supportedGPUFamilies[1] = v11;
        if (v11 >= v8)
        {
          v275 = (char *)*supportedGPUFamilies;
          uint64_t v276 = (uint64_t)&v11[-*supportedGPUFamilies] >> 3;
          unint64_t v277 = v276 + 1;
          if ((unint64_t)(v276 + 1) >> 61) {
            goto LABEL_534;
          }
          uint64_t v278 = v8 - v275;
          if (v278 >> 2 > v277) {
            unint64_t v277 = v278 >> 2;
          }
          if ((unint64_t)v278 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v279 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v279 = v277;
          }
          if (v279)
          {
            v280 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v279);
            v275 = (char *)*supportedGPUFamilies;
            int v11 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v280 = 0;
          }
          v288 = &v280[8 * v276];
          uint64_t v8 = &v280[8 * v279];
          *(void *)v288 = 3003;
          v274 = v288 + 8;
          while (v11 != v275)
          {
            uint64_t v289 = *((void *)v11 - 1);
            v11 -= 8;
            *((void *)v288 - 1) = v289;
            v288 -= 8;
          }
          void *supportedGPUFamilies = v288;
          supportedGPUFamilies[1] = v274;
          supportedGPUFamilies[2] = v8;
          if (v275)
          {
            operator delete(v275);
            uint64_t v8 = *v9;
          }
        }
        else
        {
          *(void *)int v11 = 3003;
          v274 = v11 + 8;
        }
        supportedGPUFamilies[1] = v274;
        if (v274 >= v8)
        {
          v290 = (char *)*supportedGPUFamilies;
          uint64_t v291 = (uint64_t)&v274[-*supportedGPUFamilies] >> 3;
          unint64_t v292 = v291 + 1;
          if ((unint64_t)(v291 + 1) >> 61) {
            goto LABEL_534;
          }
          uint64_t v293 = v8 - v290;
          if (v293 >> 2 > v292) {
            unint64_t v292 = v293 >> 2;
          }
          if ((unint64_t)v293 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v294 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v294 = v292;
          }
          if (v294)
          {
            v295 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v294);
            v290 = (char *)*supportedGPUFamilies;
            v274 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v295 = 0;
          }
          v297 = &v295[8 * v291];
          v298 = &v295[8 * v294];
          *(void *)v297 = 1004;
          int v24 = v297 + 8;
          while (v274 != v290)
          {
            uint64_t v299 = *((void *)v274 - 1);
            v274 -= 8;
            *((void *)v297 - 1) = v299;
            v297 -= 8;
          }
          void *supportedGPUFamilies = v297;
          supportedGPUFamilies[1] = v24;
          supportedGPUFamilies[2] = v298;
          if (v290) {
            operator delete(v290);
          }
        }
        else
        {
          *(void *)v274 = 1004;
          int v24 = v274 + 8;
        }
        supportedGPUFamilies[1] = v24;
      }
      v301 = (char **)(supportedGPUFamilies + 2);
      v300 = (char *)supportedGPUFamilies[2];
      if (v24 >= v300)
      {
        v303 = (char *)*supportedGPUFamilies;
        uint64_t v304 = (uint64_t)&v24[-*supportedGPUFamilies] >> 3;
        unint64_t v305 = v304 + 1;
        if ((unint64_t)(v304 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v306 = v300 - v303;
        if (v306 >> 2 > v305) {
          unint64_t v305 = v306 >> 2;
        }
        if ((unint64_t)v306 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v307 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v307 = v305;
        }
        if (v307)
        {
          v308 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v307);
          v303 = (char *)*supportedGPUFamilies;
          int v24 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v308 = 0;
        }
        v309 = &v308[8 * v304];
        v300 = &v308[8 * v307];
        *(void *)v309 = 1002;
        v302 = v309 + 8;
        while (v24 != v303)
        {
          uint64_t v310 = *((void *)v24 - 1);
          v24 -= 8;
          *((void *)v309 - 1) = v310;
          v309 -= 8;
        }
        void *supportedGPUFamilies = v309;
        supportedGPUFamilies[1] = v302;
        supportedGPUFamilies[2] = v300;
        if (v303)
        {
          operator delete(v303);
          v300 = *v301;
        }
      }
      else
      {
        *(void *)int v24 = 1002;
        v302 = v24 + 8;
      }
      supportedGPUFamilies[1] = v302;
      if (v302 >= v300)
      {
        v311 = (char *)*supportedGPUFamilies;
        uint64_t v312 = (uint64_t)&v302[-*supportedGPUFamilies] >> 3;
        unint64_t v313 = v312 + 1;
        if ((unint64_t)(v312 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v314 = v300 - v311;
        if (v314 >> 2 > v313) {
          unint64_t v313 = v314 >> 2;
        }
        if ((unint64_t)v314 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v315 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v315 = v313;
        }
        if (v315)
        {
          v316 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v315);
          v311 = (char *)*supportedGPUFamilies;
          v302 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v316 = 0;
        }
        v317 = &v316[8 * v312];
        v300 = &v316[8 * v315];
        *(void *)v317 = 1001;
        int v23 = v317 + 8;
        while (v302 != v311)
        {
          uint64_t v318 = *((void *)v302 - 1);
          v302 -= 8;
          *((void *)v317 - 1) = v318;
          v317 -= 8;
        }
        void *supportedGPUFamilies = v317;
        supportedGPUFamilies[1] = v23;
        supportedGPUFamilies[2] = v300;
        if (v311)
        {
          operator delete(v311);
          v300 = *v301;
        }
      }
      else
      {
        *(void *)v302 = 1001;
        int v23 = v302 + 8;
      }
      supportedGPUFamilies[1] = v23;
      if (v23 >= v300)
      {
        v189 = (char *)*supportedGPUFamilies;
        uint64_t v319 = (uint64_t)&v23[-*supportedGPUFamilies] >> 3;
        unint64_t v320 = v319 + 1;
        if (!((unint64_t)(v319 + 1) >> 61))
        {
          uint64_t v321 = v300 - v189;
          if (v321 >> 2 > v320) {
            unint64_t v320 = v321 >> 2;
          }
          if ((unint64_t)v321 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v322 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v322 = v320;
          }
          if (v322)
          {
            v323 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v322);
            v189 = (char *)*supportedGPUFamilies;
            int v23 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v323 = 0;
          }
          v195 = &v323[8 * v319];
          v196 = &v323[8 * v322];
          *(void *)v195 = 3001;
          v188 = v195 + 8;
          while (v23 != v189)
          {
            uint64_t v324 = *((void *)v23 - 1);
            v23 -= 8;
            *((void *)v195 - 1) = v324;
            v195 -= 8;
          }
          goto LABEL_529;
        }
        goto LABEL_534;
      }
    }
    *(void *)int v23 = 3001;
    v188 = v23 + 8;
    goto LABEL_532;
  }
  switch(v3)
  {
    case 0:
      objc_super v4 = (char *)supportedGPUFamilies[1];
      goto LABEL_274;
    case 1:
      int v12 = (char *)supportedGPUFamilies[1];
      goto LABEL_257;
    case 4:
      uint64_t v13 = (char *)supportedGPUFamilies[1];
      goto LABEL_224;
    case 5:
      uint64_t v14 = (char *)supportedGPUFamilies[1];
      goto LABEL_207;
    case 6:
      uint64_t v15 = (char *)supportedGPUFamilies[1];
      goto LABEL_174;
    case 7:
      goto LABEL_139;
    case 8:
      goto LABEL_104;
    case 9:
      char v16 = (char *)supportedGPUFamilies[1];
      goto LABEL_87;
    case 10:
      unsigned int v17 = (char *)supportedGPUFamilies[1];
      goto LABEL_70;
    case 11:
      unint64_t v18 = supportedGPUFamilies[2];
      int v19 = (char *)supportedGPUFamilies[1];
      if ((unint64_t)v19 >= v18)
      {
        int v25 = (char *)*supportedGPUFamilies;
        uint64_t v26 = (uint64_t)&v19[-*supportedGPUFamilies] >> 3;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v28 = v18 - (void)v25;
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
          int v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v29);
          int v25 = (char *)*supportedGPUFamilies;
          int v19 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int v30 = 0;
        }
        unint64_t v49 = &v30[8 * v26];
        int v50 = &v30[8 * v29];
        *(void *)unint64_t v49 = -1009;
        unsigned int v17 = v49 + 8;
        while (v19 != v25)
        {
          uint64_t v51 = *((void *)v19 - 1);
          v19 -= 8;
          *((void *)v49 - 1) = v51;
          v49 -= 8;
        }
        void *supportedGPUFamilies = v49;
        supportedGPUFamilies[1] = v17;
        supportedGPUFamilies[2] = v50;
        if (v25) {
          operator delete(v25);
        }
      }
      else
      {
        *(void *)int v19 = -1009;
        unsigned int v17 = v19 + 8;
      }
      supportedGPUFamilies[1] = v17;
LABEL_70:
      unint64_t v52 = supportedGPUFamilies[2];
      if ((unint64_t)v17 >= v52)
      {
        int v53 = (char *)*supportedGPUFamilies;
        uint64_t v54 = (uint64_t)&v17[-*supportedGPUFamilies] >> 3;
        unint64_t v55 = v54 + 1;
        if ((unint64_t)(v54 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v56 = v52 - (void)v53;
        if (v56 >> 2 > v55) {
          unint64_t v55 = v56 >> 2;
        }
        if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v57 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v57 = v55;
        }
        if (v57)
        {
          unsigned int v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v57);
          int v53 = (char *)*supportedGPUFamilies;
          unsigned int v17 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          unsigned int v58 = 0;
        }
        unsigned int v59 = &v58[8 * v54];
        int v60 = &v58[8 * v57];
        *(void *)unsigned int v59 = 1009;
        char v16 = v59 + 8;
        while (v17 != v53)
        {
          uint64_t v61 = *((void *)v17 - 1);
          v17 -= 8;
          *((void *)v59 - 1) = v61;
          v59 -= 8;
        }
        void *supportedGPUFamilies = v59;
        supportedGPUFamilies[1] = v16;
        supportedGPUFamilies[2] = v60;
        if (v53) {
          operator delete(v53);
        }
      }
      else
      {
        *(void *)unsigned int v17 = 1009;
        char v16 = v17 + 8;
      }
      supportedGPUFamilies[1] = v16;
LABEL_87:
      unint64_t v62 = supportedGPUFamilies[2];
      if ((unint64_t)v16 >= v62)
      {
        unsigned int v64 = (char *)*supportedGPUFamilies;
        uint64_t v65 = (uint64_t)&v16[-*supportedGPUFamilies] >> 3;
        unint64_t v66 = v65 + 1;
        if ((unint64_t)(v65 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v67 = v62 - (void)v64;
        if (v67 >> 2 > v66) {
          unint64_t v66 = v67 >> 2;
        }
        if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v68 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v68 = v66;
        }
        if (v68)
        {
          unsigned int v69 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v68);
          unsigned int v64 = (char *)*supportedGPUFamilies;
          char v16 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          unsigned int v69 = 0;
        }
        int32x2_t v70 = &v69[8 * v65];
        int8x8_t v71 = &v69[8 * v68];
        *(void *)int32x2_t v70 = 1008;
        int v63 = v70 + 8;
        while (v16 != v64)
        {
          uint64_t v72 = *((void *)v16 - 1);
          v16 -= 8;
          *((void *)v70 - 1) = v72;
          v70 -= 8;
        }
        void *supportedGPUFamilies = v70;
        supportedGPUFamilies[1] = v63;
        supportedGPUFamilies[2] = v71;
        if (v64) {
          operator delete(v64);
        }
      }
      else
      {
        *(void *)char v16 = 1008;
        int v63 = v16 + 8;
      }
      supportedGPUFamilies[1] = v63;
LABEL_104:
      int v73 = dyld_program_sdk_at_least();
      int8x8_t v74 = (char *)supportedGPUFamilies[1];
      if (!v73) {
        goto LABEL_122;
      }
      unint64_t v75 = supportedGPUFamilies[2];
      if ((unint64_t)v74 >= v75)
      {
        int8x8_t v77 = (char *)*supportedGPUFamilies;
        uint64_t v78 = (uint64_t)&v74[-*supportedGPUFamilies] >> 3;
        unint64_t v79 = v78 + 1;
        if ((unint64_t)(v78 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v80 = v75 - (void)v77;
        if (v80 >> 2 > v79) {
          unint64_t v79 = v80 >> 2;
        }
        if ((unint64_t)v80 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v81 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v81 = v79;
        }
        if (v81)
        {
          int32x2_t v82 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v81);
          int8x8_t v77 = (char *)*supportedGPUFamilies;
          int8x8_t v74 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int32x2_t v82 = 0;
        }
        int8x8_t v83 = &v82[8 * v78];
        int32x2_t v84 = &v82[8 * v81];
        *(void *)int8x8_t v83 = 5001;
        int32x2_t v76 = v83 + 8;
        while (v74 != v77)
        {
          uint64_t v85 = *((void *)v74 - 1);
          v74 -= 8;
          *((void *)v83 - 1) = v85;
          v83 -= 8;
        }
        void *supportedGPUFamilies = v83;
        supportedGPUFamilies[1] = v76;
        supportedGPUFamilies[2] = v84;
        if (v77) {
          operator delete(v77);
        }
      }
      else
      {
        *(void *)int8x8_t v74 = 5001;
        int32x2_t v76 = v74 + 8;
      }
      supportedGPUFamilies[1] = v76;
      int8x8_t v74 = v76;
LABEL_122:
      unint64_t v86 = supportedGPUFamilies[2];
      if ((unint64_t)v74 >= v86)
      {
        int v88 = (char *)*supportedGPUFamilies;
        uint64_t v89 = (uint64_t)&v74[-*supportedGPUFamilies] >> 3;
        unint64_t v90 = v89 + 1;
        if ((unint64_t)(v89 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v91 = v86 - (void)v88;
        if (v91 >> 2 > v90) {
          unint64_t v90 = v91 >> 2;
        }
        if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v92 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v92 = v90;
        }
        if (v92)
        {
          int v93 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v92);
          int v88 = (char *)*supportedGPUFamilies;
          int8x8_t v74 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int v93 = 0;
        }
        unsigned int v94 = &v93[8 * v89];
        uint64_t v95 = &v93[8 * v92];
        *(void *)unsigned int v94 = 1007;
        unsigned int v87 = v94 + 8;
        while (v74 != v88)
        {
          uint64_t v96 = *((void *)v74 - 1);
          v74 -= 8;
          *((void *)v94 - 1) = v96;
          v94 -= 8;
        }
        void *supportedGPUFamilies = v94;
        supportedGPUFamilies[1] = v87;
        supportedGPUFamilies[2] = v95;
        if (v88) {
          operator delete(v88);
        }
      }
      else
      {
        *(void *)int8x8_t v74 = 1007;
        unsigned int v87 = v74 + 8;
      }
      supportedGPUFamilies[1] = v87;
LABEL_139:
      char v97 = dyld_program_sdk_at_least();
      unsigned int v98 = (char *)supportedGPUFamilies[1];
      if (v97) {
        goto LABEL_157;
      }
      unint64_t v99 = supportedGPUFamilies[2];
      if ((unint64_t)v98 >= v99)
      {
        unsigned int v101 = (char *)*supportedGPUFamilies;
        uint64_t v102 = (uint64_t)&v98[-*supportedGPUFamilies] >> 3;
        unint64_t v103 = v102 + 1;
        if ((unint64_t)(v102 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v104 = v99 - (void)v101;
        if (v104 >> 2 > v103) {
          unint64_t v103 = v104 >> 2;
        }
        if ((unint64_t)v104 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v105 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v105 = v103;
        }
        if (v105)
        {
          int32x2_t v106 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v105);
          unsigned int v101 = (char *)*supportedGPUFamilies;
          unsigned int v98 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int32x2_t v106 = 0;
        }
        int32x2_t v107 = &v106[8 * v102];
        int32x2_t v108 = &v106[8 * v105];
        *(void *)int32x2_t v107 = 5001;
        int v100 = v107 + 8;
        while (v98 != v101)
        {
          uint64_t v109 = *((void *)v98 - 1);
          v98 -= 8;
          *((void *)v107 - 1) = v109;
          v107 -= 8;
        }
        void *supportedGPUFamilies = v107;
        supportedGPUFamilies[1] = v100;
        supportedGPUFamilies[2] = v108;
        if (v101) {
          operator delete(v101);
        }
      }
      else
      {
        *(void *)unsigned int v98 = 5001;
        int v100 = v98 + 8;
      }
      supportedGPUFamilies[1] = v100;
      unsigned int v98 = v100;
LABEL_157:
      unint64_t v110 = supportedGPUFamilies[2];
      if ((unint64_t)v98 >= v110)
      {
        float64x2_t v111 = (char *)*supportedGPUFamilies;
        uint64_t v112 = (uint64_t)&v98[-*supportedGPUFamilies] >> 3;
        unint64_t v113 = v112 + 1;
        if ((unint64_t)(v112 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v114 = v110 - (void)v111;
        if (v114 >> 2 > v113) {
          unint64_t v113 = v114 >> 2;
        }
        if ((unint64_t)v114 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v115 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v115 = v113;
        }
        if (v115)
        {
          int8x16_t v116 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v115);
          float64x2_t v111 = (char *)*supportedGPUFamilies;
          unsigned int v98 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int8x16_t v116 = 0;
        }
        int8x16_t v117 = &v116[8 * v112];
        float64x2_t v118 = &v116[8 * v115];
        *(void *)int8x16_t v117 = 1006;
        uint64_t v15 = v117 + 8;
        while (v98 != v111)
        {
          uint64_t v119 = *((void *)v98 - 1);
          v98 -= 8;
          *((void *)v117 - 1) = v119;
          v117 -= 8;
        }
        void *supportedGPUFamilies = v117;
        supportedGPUFamilies[1] = v15;
        supportedGPUFamilies[2] = v118;
        if (v111) {
          operator delete(v111);
        }
      }
      else
      {
        *(void *)unsigned int v98 = 1006;
        uint64_t v15 = v98 + 8;
      }
      supportedGPUFamilies[1] = v15;
LABEL_174:
      int8x16_t v120 = (char *)supportedGPUFamilies[2];
      if (v15 >= v120)
      {
        int v122 = (char *)*supportedGPUFamilies;
        uint64_t v123 = (uint64_t)&v15[-*supportedGPUFamilies] >> 3;
        unint64_t v124 = v123 + 1;
        if ((unint64_t)(v123 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v125 = v120 - v122;
        if (v125 >> 2 > v124) {
          unint64_t v124 = v125 >> 2;
        }
        if ((unint64_t)v125 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v126 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v126 = v124;
        }
        if (v126)
        {
          int v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v126);
          int v122 = (char *)*supportedGPUFamilies;
          uint64_t v15 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int v127 = 0;
        }
        int v128 = &v127[8 * v123];
        int8x16_t v120 = &v127[8 * v126];
        *(void *)int v128 = 1005;
        unsigned int v121 = v128 + 8;
        while (v15 != v122)
        {
          uint64_t v129 = *((void *)v15 - 1);
          v15 -= 8;
          *((void *)v128 - 1) = v129;
          v128 -= 8;
        }
        void *supportedGPUFamilies = v128;
        supportedGPUFamilies[1] = v121;
        supportedGPUFamilies[2] = v120;
        if (v122)
        {
          operator delete(v122);
          int8x16_t v120 = (char *)supportedGPUFamilies[2];
        }
      }
      else
      {
        *(void *)uint64_t v15 = 1005;
        unsigned int v121 = v15 + 8;
      }
      supportedGPUFamilies[1] = v121;
      if (v121 >= v120)
      {
        int v130 = (char *)*supportedGPUFamilies;
        uint64_t v131 = (uint64_t)&v121[-*supportedGPUFamilies] >> 3;
        unint64_t v132 = v131 + 1;
        if ((unint64_t)(v131 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v133 = v120 - v130;
        if (v133 >> 2 > v132) {
          unint64_t v132 = v133 >> 2;
        }
        if ((unint64_t)v133 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v134 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v134 = v132;
        }
        if (v134)
        {
          int v135 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v134);
          int v130 = (char *)*supportedGPUFamilies;
          unsigned int v121 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int v135 = 0;
        }
        int v136 = &v135[8 * v131];
        int v137 = &v135[8 * v134];
        *(void *)int v136 = 3003;
        uint64_t v14 = v136 + 8;
        while (v121 != v130)
        {
          uint64_t v138 = *((void *)v121 - 1);
          v121 -= 8;
          *((void *)v136 - 1) = v138;
          v136 -= 8;
        }
        void *supportedGPUFamilies = v136;
        supportedGPUFamilies[1] = v14;
        supportedGPUFamilies[2] = v137;
        if (v130) {
          operator delete(v130);
        }
      }
      else
      {
        *(void *)unsigned int v121 = 3003;
        uint64_t v14 = v121 + 8;
      }
      supportedGPUFamilies[1] = v14;
LABEL_207:
      unint64_t v139 = supportedGPUFamilies[2];
      if ((unint64_t)v14 >= v139)
      {
        v140 = (char *)*supportedGPUFamilies;
        uint64_t v141 = (uint64_t)&v14[-*supportedGPUFamilies] >> 3;
        unint64_t v142 = v141 + 1;
        if ((unint64_t)(v141 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v143 = v139 - (void)v140;
        if (v143 >> 2 > v142) {
          unint64_t v142 = v143 >> 2;
        }
        if ((unint64_t)v143 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v144 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v144 = v142;
        }
        if (v144)
        {
          int v145 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v144);
          v140 = (char *)*supportedGPUFamilies;
          uint64_t v14 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int v145 = 0;
        }
        int v146 = &v145[8 * v141];
        int v147 = &v145[8 * v144];
        *(void *)int v146 = 1004;
        uint64_t v13 = v146 + 8;
        while (v14 != v140)
        {
          uint64_t v148 = *((void *)v14 - 1);
          v14 -= 8;
          *((void *)v146 - 1) = v148;
          v146 -= 8;
        }
        void *supportedGPUFamilies = v146;
        supportedGPUFamilies[1] = v13;
        supportedGPUFamilies[2] = v147;
        if (v140) {
          operator delete(v140);
        }
      }
      else
      {
        *(void *)uint64_t v14 = 1004;
        uint64_t v13 = v14 + 8;
      }
      supportedGPUFamilies[1] = v13;
LABEL_224:
      int v149 = (char *)supportedGPUFamilies[2];
      if (v13 >= v149)
      {
        int v151 = (char *)*supportedGPUFamilies;
        uint64_t v152 = (uint64_t)&v13[-*supportedGPUFamilies] >> 3;
        unint64_t v153 = v152 + 1;
        if ((unint64_t)(v152 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v154 = v149 - v151;
        if (v154 >> 2 > v153) {
          unint64_t v153 = v154 >> 2;
        }
        if ((unint64_t)v154 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v155 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v155 = v153;
        }
        if (v155)
        {
          int v156 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v155);
          int v151 = (char *)*supportedGPUFamilies;
          uint64_t v13 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int v156 = 0;
        }
        int v157 = &v156[8 * v152];
        int v149 = &v156[8 * v155];
        *(void *)int v157 = 1003;
        int v150 = v157 + 8;
        while (v13 != v151)
        {
          uint64_t v158 = *((void *)v13 - 1);
          v13 -= 8;
          *((void *)v157 - 1) = v158;
          v157 -= 8;
        }
        void *supportedGPUFamilies = v157;
        supportedGPUFamilies[1] = v150;
        supportedGPUFamilies[2] = v149;
        if (v151)
        {
          operator delete(v151);
          int v149 = (char *)supportedGPUFamilies[2];
        }
      }
      else
      {
        *(void *)uint64_t v13 = 1003;
        int v150 = v13 + 8;
      }
      supportedGPUFamilies[1] = v150;
      if (v150 >= v149)
      {
        unsigned int v159 = (char *)*supportedGPUFamilies;
        uint64_t v160 = (uint64_t)&v150[-*supportedGPUFamilies] >> 3;
        unint64_t v161 = v160 + 1;
        if ((unint64_t)(v160 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v162 = v149 - v159;
        if (v162 >> 2 > v161) {
          unint64_t v161 = v162 >> 2;
        }
        if ((unint64_t)v162 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v163 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v163 = v161;
        }
        if (v163)
        {
          int v164 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v163);
          unsigned int v159 = (char *)*supportedGPUFamilies;
          int v150 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          int v164 = 0;
        }
        int v165 = &v164[8 * v160];
        int v166 = &v164[8 * v163];
        *(void *)int v165 = 3002;
        int v12 = v165 + 8;
        while (v150 != v159)
        {
          uint64_t v167 = *((void *)v150 - 1);
          v150 -= 8;
          *((void *)v165 - 1) = v167;
          v165 -= 8;
        }
        void *supportedGPUFamilies = v165;
        supportedGPUFamilies[1] = v12;
        supportedGPUFamilies[2] = v166;
        if (v159) {
          operator delete(v159);
        }
      }
      else
      {
        *(void *)int v150 = 3002;
        int v12 = v150 + 8;
      }
      supportedGPUFamilies[1] = v12;
LABEL_257:
      unint64_t v168 = supportedGPUFamilies[2];
      if ((unint64_t)v12 >= v168)
      {
        int v169 = (char *)*supportedGPUFamilies;
        uint64_t v170 = (uint64_t)&v12[-*supportedGPUFamilies] >> 3;
        unint64_t v171 = v170 + 1;
        if ((unint64_t)(v170 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v172 = v168 - (void)v169;
        if (v172 >> 2 > v171) {
          unint64_t v171 = v172 >> 2;
        }
        if ((unint64_t)v172 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v173 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v173 = v171;
        }
        if (v173)
        {
          v174 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v173);
          int v169 = (char *)*supportedGPUFamilies;
          int v12 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v174 = 0;
        }
        v175 = &v174[8 * v170];
        v176 = &v174[8 * v173];
        *(void *)v175 = 1002;
        objc_super v4 = v175 + 8;
        while (v12 != v169)
        {
          uint64_t v177 = *((void *)v12 - 1);
          v12 -= 8;
          *((void *)v175 - 1) = v177;
          v175 -= 8;
        }
        void *supportedGPUFamilies = v175;
        supportedGPUFamilies[1] = v4;
        supportedGPUFamilies[2] = v176;
        if (v169) {
          operator delete(v169);
        }
      }
      else
      {
        *(void *)int v12 = 1002;
        objc_super v4 = v12 + 8;
      }
      supportedGPUFamilies[1] = v4;
LABEL_274:
      v178 = (char *)supportedGPUFamilies[2];
      if (v4 >= v178)
      {
        v180 = (char *)*supportedGPUFamilies;
        uint64_t v181 = (uint64_t)&v4[-*supportedGPUFamilies] >> 3;
        unint64_t v182 = v181 + 1;
        if ((unint64_t)(v181 + 1) >> 61) {
          goto LABEL_534;
        }
        uint64_t v183 = v178 - v180;
        if (v183 >> 2 > v182) {
          unint64_t v182 = v183 >> 2;
        }
        if ((unint64_t)v183 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v184 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v184 = v182;
        }
        if (v184)
        {
          v185 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v184);
          v180 = (char *)*supportedGPUFamilies;
          objc_super v4 = (char *)supportedGPUFamilies[1];
        }
        else
        {
          v185 = 0;
        }
        v186 = &v185[8 * v181];
        v178 = &v185[8 * v184];
        *(void *)v186 = 1001;
        v179 = v186 + 8;
        while (v4 != v180)
        {
          uint64_t v187 = *((void *)v4 - 1);
          v4 -= 8;
          *((void *)v186 - 1) = v187;
          v186 -= 8;
        }
        void *supportedGPUFamilies = v186;
        supportedGPUFamilies[1] = v179;
        supportedGPUFamilies[2] = v178;
        if (v180)
        {
          operator delete(v180);
          v178 = (char *)supportedGPUFamilies[2];
        }
      }
      else
      {
        *(void *)objc_super v4 = 1001;
        v179 = v4 + 8;
      }
      supportedGPUFamilies[1] = v179;
      if (v179 >= v178)
      {
        v189 = (char *)*supportedGPUFamilies;
        uint64_t v190 = (uint64_t)&v179[-*supportedGPUFamilies] >> 3;
        unint64_t v191 = v190 + 1;
        if (!((unint64_t)(v190 + 1) >> 61))
        {
          uint64_t v192 = v178 - v189;
          if (v192 >> 2 > v191) {
            unint64_t v191 = v192 >> 2;
          }
          if ((unint64_t)v192 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v193 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v193 = v191;
          }
          if (v193)
          {
            v194 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)(supportedGPUFamilies + 2), v193);
            v189 = (char *)*supportedGPUFamilies;
            v179 = (char *)supportedGPUFamilies[1];
          }
          else
          {
            v194 = 0;
          }
          v195 = &v194[8 * v190];
          v196 = &v194[8 * v193];
          *(void *)v195 = 3001;
          v188 = v195 + 8;
          while (v179 != v189)
          {
            uint64_t v197 = *((void *)v179 - 1);
            v179 -= 8;
            *((void *)v195 - 1) = v197;
            v195 -= 8;
          }
LABEL_529:
          void *supportedGPUFamilies = v195;
LABEL_530:
          supportedGPUFamilies[1] = v188;
          supportedGPUFamilies[2] = v196;
          if (v189) {
            operator delete(v189);
          }
          goto LABEL_532;
        }
        goto LABEL_534;
      }
      *(void *)v179 = 3001;
      v188 = v179 + 8;
LABEL_532:
      supportedGPUFamilies[1] = v188;
      return;
    default:
      return;
  }
}

- (id)newPipelineLibraryWithFilePath:(id)a3 error:(id *)a4
{
  return MTLPipelineLibraryBuilder::newLibraryWithFile((uint64_t *)self->_pipelineLibraryBuilder, self, a3, a4, v4, v5, v6, v7);
}

- (BOOL)supportsFragmentOnlyEncoders
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsFragmentOnlyEncoders];
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
  _MTLMessageContextBegin_((uint64_t)v25, (uint64_t)"-[_MTLDevice newLibraryWithStitchedDescriptor:error:]", 3820, (uint64_t)self, 24, (uint64_t)"Stitched Library with Descriptor Validation");
  uint64_t v13 = 0;
  if (validateMTLStitchedLibraryDescriptor(a3, (uint64_t)v25, v7, v8, v9, v10, v11, v12))
  {
    id v14 = newDAGStringFromFunctionGraphs((void *)[a3 functionGraphs], objc_msgSend(a3, "options"), (uint64_t)v25);
    if ([v14 isEqualToString:&stru_1ECAC84A8])
    {
      uint64_t v13 = 0;
    }
    else
    {
      _MTLCreateStitchingScriptFromStichedLibraryDescriptor((MTLStitchedLibraryDescriptor *)a3, &v23);
      libraryBuilder = (_MTLDevice **)self->_libraryBuilder;
      char v16 = (void *)[a3 functions];
      uint64_t v21 = v23;
      unsigned int v22 = v24;
      if (v24) {
        atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v13 = (void *)MTLLibraryBuilder::newLibraryWithDAG(libraryBuilder, v14, v16, a4, &v21, objc_msgSend(a3, "options", v21), objc_msgSend(a3, "binaryArchives"), 0);
      if (v22) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v22);
      }
      pipelineCollection = self->_pipelineCollection;
      if (pipelineCollection && v13) {
        MTLPipelineCollection::addStitchedLibrary((uint64_t)pipelineCollection, v13);
      }
      if (v24) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      }
    }
  }
  if (*(void *)&v25[0])
  {
    uint64_t v18 = errorMessageFromContext((uint64_t)v25);
    if (a4)
    {
      uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v18 forKey:*MEMORY[0x1E4F28568]];
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:2 userInfo:v19];
    }
  }
  _MTLMessageContextEnd((uint64_t)v25);
  return v13;
}

- (NSString)name
{
  id v3 = [(_MTLDevice *)self vendorName];
  id v4 = [(_MTLDevice *)self familyName];
  id v5 = [(_MTLDevice *)self productName];
  CFPropertyListRef v6 = CFPreferencesCopyAppValue(@"forceDeviceName", @"com.apple.Metal");
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = (__CFString *)[NSString stringWithString:v6];
    CFRelease(v7);
  }
  else
  {
    uint64_t v9 = getenv("METAL_FORCE_DEVICE_VENDOR_NAME");
    if (v9) {
      id v3 = (id)[NSString stringWithUTF8String:v9];
    }
    uint64_t v10 = getenv("METAL_FORCE_DEVICE_FAMILY_NAME");
    if (v10) {
      id v4 = (id)[NSString stringWithUTF8String:v10];
    }
    uint64_t v11 = getenv("METAL_FORCE_DEVICE_PRODUCT_NAME");
    if (v11) {
      id v5 = (id)[NSString stringWithUTF8String:v11];
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v3 && ([v3 isEqualToString:&stru_1ECAC84A8] & 1) == 0) {
      objc_msgSend(v12, "addObject:", objc_msgSend((id)objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")), "componentsJoinedByString:", &stru_1ECAC84A8));
    }
    if (v4 && ([v4 isEqualToString:&stru_1ECAC84A8] & 1) == 0) {
      [v12 addObject:v4];
    }
    if (v5 && ([v5 isEqualToString:&stru_1ECAC84A8] & 1) == 0) {
      [v12 addObject:v5];
    }
    [v12 addObject:@"GPU"];
    if ([v12 count]) {
      uint64_t v8 = (__CFString *)[v12 componentsJoinedByString:@" "];
    }
    else {
      uint64_t v8 = @"Unnamed_GPU";
    }
  }
  return &v8->isa;
}

- (BOOL)supportsMemoryOrderAtomics
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMemoryOrderAtomics];
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  id v5 = objc_alloc_init(MTLCommandQueueDescriptor);
  [(MTLCommandQueueDescriptor *)v5 setMaxCommandBufferCount:a3];

  return [(_MTLDevice *)self newCommandQueueWithDescriptor:v5];
}

- (BOOL)deviceOrFeatureProfileSupportsFeatureSet:(unint64_t)a3
{
  if (-[_MTLDevice deviceSupportsFeatureSet:](self, "deviceSupportsFeatureSet:")) {
    return 1;
  }
  uint64_t v6 = MTLGetGPUFamilyFromFeatureSet(a3);

  return [(_MTLDevice *)self supportsFamily:v6];
}

- (BOOL)deviceSupportsFeatureSet:(unint64_t)a3
{
  return 0;
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  libraryBuilder = self->_libraryBuilder;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61___MTLDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v9[3] = &unk_1E5220438;
  v9[4] = a5;
  MTLLibraryBuilder::newLibraryWithSource((uint64_t)libraryBuilder, self, a3, a4, 0, (uint64_t)v9, v5, v6);
}

- (BOOL)workaroundNewLibraryWithSourceImplicitInvariantPosition
{
  return self->_workaroundNewLibraryWithSourceImplicitInvariantPosition;
}

- (BOOL)workaroundNewLibraryWithSourceReplaceFastMathWithRelaxedMath
{
  return self->_workaroundNewLibraryWithSourceReplaceFastMathWithRelaxedMath;
}

- (id).cxx_construct
{
  *((void *)self + 63) = 0;
  *((void *)self + 70) = 0;
  *((void *)self + 72) = 0;
  return self;
}

- (void)_purgeDevice
{
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  uint64_t v9 = MTLLibraryBuilder::newLibraryWithData((uint64_t)self->_libraryBuilder, self, a3, a4, v4, v5, v6, v7);
  if ([(_MTLDevice *)self isCollectingLibraries] && v9 && self->_librariesOutputDirectory) {
    MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v9);
  }
  return v9;
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  uint64_t v9 = MTLLibraryBuilder::newLibraryWithFile((uint64_t)self->_libraryBuilder, self, a3, a4, v4, v5, v6, v7);
  if ([(_MTLDevice *)self isCollectingLibraries] && v9) {
    MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v9);
  }
  return v9;
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  if (!a3) {
    MTLReportFailure(0, "-[_MTLDevice newLibraryWithURL:error:]", 1685, @"url must not be nil.", v4, v5, v6, v7, v20);
  }
  uint64_t v11 = [a3 fileSystemRepresentation];
  if (v11)
  {
    id v12 = (void *)[[NSString alloc] initWithUTF8String:v11];
    unsigned int v17 = MTLLibraryBuilder::newLibraryWithFile((uint64_t)self->_libraryBuilder, self, v12, a4, v13, v14, v15, v16);

    if ([(_MTLDevice *)self isCollectingLibraries] && v17) {
      MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v17);
    }
  }
  else
  {
    if (a4)
    {
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Invalid file url" forKey:*MEMORY[0x1E4F28568]];
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:6 userInfo:v18];
    }
    [(_MTLDevice *)self isCollectingLibraries];
    return 0;
  }
  return v17;
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)[a3 pathForResource:@"default" ofType:@"metallib"];
  if (v6)
  {
    uint64_t v11 = MTLLibraryBuilder::newLibraryWithFile((uint64_t)self->_libraryBuilder, self, v6, a4, v7, v8, v9, v10);
    if ([(_MTLDevice *)self isCollectingLibraries] && v11) {
      MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v11);
    }
  }
  else if (a4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"no default library was found" forKey:*MEMORY[0x1E4F28568]];
    uint64_t v11 = 0;
    *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:6 userInfo:v12];
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)isCollectingLibraries
{
  return self->_pipelineCollection && self->_collectAllLibraries;
}

- (void)_decrementCommandQueueCount
{
  if (!MTLAtomicDecrement(&self->_commandQueueCount))
  {
    [(_MTLDevice *)self _purgeDevice];
  }
}

- (id)_newDynamicLibraryWithDescriptor:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy__3;
  int v24 = __Block_byref_object_dispose__3;
  uint64_t v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  unsigned int v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  uint64_t v19 = 0;
  uint64_t v9 = [(_MTLDevice *)self compiler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71___MTLDevice__newDynamicLibraryWithDescriptor_computeDescriptor_error___block_invoke;
  v13[3] = &unk_1E5220460;
  v13[6] = &v14;
  v13[7] = &v20;
  v13[4] = a3;
  v13[5] = self;
  v13[8] = a5;
  [(MTLCompiler *)v9 compileDynamicLibraryWithDescriptor:a3 computePipelineDescriptor:a4 completionHandler:v13];
  id v10 = (id)v15[5];
  if (a5) {
    *a5 = (id)v15[5];
  }
  uint64_t v11 = (void *)v21[5];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v10 = 0;
  uint64_t v8 = [a3 newRenderPipelineDescriptorWithDevice:self error:&v10];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    [(_MTLDevice *)self newRenderPipelineStateWithDescriptor:v8 options:a4 completionHandler:a5];
  }
  else
  {
    (*((void (**)(id, void, void, uint64_t))a5 + 2))(a5, 0, 0, v10);
  }
}

- (BOOL)validateDynamicLibraryDescriptor:(id)a3 error:(id *)a4
{
  BOOL v7 = [a3 url] != 0;
  if ((v7 ^ ([a3 library] != 0)))
  {
    if (![a3 library]
      || (BOOL v8 = -[_MTLDevice validateDynamicLibrary:state:error:](self, "validateDynamicLibrary:state:error:", [a3 library], 0, a4), LOBYTE(v9) = 0, v8))
    {
      if (![a3 url]
        || (BOOL v9 = -[_MTLDevice validateDynamicLibraryURL:error:](self, "validateDynamicLibraryURL:error:", [a3 url], a4)))
      {
        LOBYTE(v9) = 1;
      }
    }
  }
  else if (a4)
  {
    id v10 = [(_MTLDevice *)self newDynamicLibraryError:5 message:@"Invalid descriptor. Dynamic library must be created from a URL or a MTLLibrary"];
    LOBYTE(v9) = 0;
    *a4 = v10;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (MTLCompilerConnectionManager)getCompilerConnectionManager:(int)a3
{
  BOOL v9 = self;
  int v8 = a3;
  if (a3 == 32024)
  {
    p_initConnectionOnceToken = &self->_initConnectionOnceToken;
    uint64_t v6 = &v9;
    BOOL v7 = &v8;
    if (atomic_load_explicit((atomic_ullong *volatile)p_initConnectionOnceToken, memory_order_acquire) != -1)
    {
      uint64_t v11 = &v6;
      id v10 = &v11;
      uint64_t v4 = std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice getCompilerConnectionManager:]::$_3 &&>>;
      goto LABEL_7;
    }
  }
  else
  {
    if (a3 != 32023) {
      abort();
    }
    p_initConnectionOnceToken = &self->_initConnectionOnceToken;
    uint64_t v6 = &v9;
    BOOL v7 = &v8;
    if (atomic_load_explicit((atomic_ullong *volatile)p_initConnectionOnceToken, memory_order_acquire) != -1)
    {
      uint64_t v11 = &v6;
      id v10 = &v11;
      uint64_t v4 = std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice getCompilerConnectionManager:]::$_2 &&>>;
LABEL_7:
      std::__call_once(&p_initConnectionOnceToken->__state_, &v10, (void (__cdecl *)(void *))v4);
    }
  }
  return v9->_compilerConnectionManager;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  uint64_t v14 = 0;
  uint64_t v14 = objc_alloc_init(MTLComputePipelineDescriptor);
  [(id)v10[5] setComputeFunction:a3];
  uint64_t v7 = v10[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68___MTLDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke;
  v8[3] = &unk_1E5220488;
  v8[4] = a4;
  v8[5] = &v9;
  [(_MTLDevice *)self newComputePipelineStateWithDescriptor:v7 completionHandler:v8];
  _Block_object_dispose(&v9, 8);
}

- (char)getComputeFunctionId:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 compilerOptionsSize:(unint64_t)a6
{
  int v8 = [(_MTLDevice *)self getComputeFunctionId:a3 compilerOptions:a5 compilerOptionsSize:a6];
  if (([(MTLCompiler *)[(_MTLDevice *)self compiler] compilerFlags] & 0x40) == 0)
  {
    size_t v12 = 0;
    uint64_t v13 = 0;
    _MTLGetSerializedVertexFormat((Air::PipelineScript *)a3, &v13, &v12, 0);
    if (v12)
    {
      uint64_t v9 = (unsigned __int8 *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
      CC_SHA256_Init(&c);
      CC_SHA256_Update(&c, v13, v12);
      CC_SHA256_Update(&c, v8, 0x20u);
      CC_SHA256_Final(v9, &c);
      free(v13);
      free(v8);
      return (char *)v9;
    }
  }
  return v8;
}

- (char)getVertexFunctionId:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 compilerOptionsSize:(unint64_t)a6 compiledFragmentVariant:(id)a7
{
  uint64_t v11 = [(_MTLDevice *)self getVertexFunctionId:a3 compilerOptions:a5 compilerOptionsSize:a6 compiledFragmentVariant:a7];
  unint64_t v12 = [(MTLCompiler *)[(_MTLDevice *)self compiler] compilerFlags];
  uint64_t v13 = [a4 patchType];
  uint64_t v14 = 24;
  if (!v13) {
    uint64_t v14 = 4;
  }
  *((void *)&v20 + 1) = 0;
  uint64_t v21 = 0;
  if ((v14 & v12) != 0) {
    _MTLGetSerializedVertexFormat((Air::PipelineScript *)a3, &v21, (size_t *)&v20 + 1, 0);
  }
  *(void *)&long long v20 = 0;
  uint64_t v15 = [a7 inputInfoAndSize:&v20];
  if (v20 == 0) {
    return v11;
  }
  unsigned int v17 = (const void *)v15;
  uint64_t v16 = (unsigned __int8 *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  CC_SHA256_Init(&v19);
  if ((void)v20) {
    CC_SHA256_Update(&v19, v17, v20);
  }
  if (*((void *)&v20 + 1)) {
    CC_SHA256_Update(&v19, v21, DWORD2(v20));
  }
  CC_SHA256_Update(&v19, v11, 0x20u);
  CC_SHA256_Final(v16, &v19);
  if (*((void *)&v20 + 1)) {
    free(v21);
  }
  free(v11);
  return (char *)v16;
}

- (void)registerTileRenderPipelineDescriptor:(id)a3
{
  if ([(_MTLDevice *)self isCollectingPipelines])
  {
    MTLPipelineCollection::addTileRenderPipeline((MTLPipelineCollection *)self->_pipelineCollection, (MTLTileRenderPipelineDescriptor *)a3);
    if ((_dumpAtExit & 1) == 0)
    {
      [(_MTLDevice *)self dumpPipelineDescriptorsIfRequested];
    }
  }
}

- (id)newArgumentEncoderWithArguments:(id)a3 structType:(id *)a4
{
  if ([a3 count])
  {
    if (!a3) {
      return 0;
    }
  }
  else
  {
    MTLReportFailure(0, "-[_MTLDevice newArgumentEncoderWithArguments:structType:]", 5456, @"count must be greater than zero", v7, v8, v9, v10, v15);
    if (!a3) {
      return 0;
    }
  }
  if (![a3 count]) {
    return 0;
  }
  uint64_t v11 = (void *)MTLCreateStructTypeFromArgumentDescriptors(a3);
  unint64_t v12 = (void *)[(_MTLDevice *)self newIndirectArgumentBufferLayoutWithStructType:v11];
  [v12 setStructType:v11 withDevice:self];
  if (a4) {
    *a4 = v11;
  }
  else {

  }
  id v13 = [(_MTLDevice *)self newArgumentEncoderWithLayout:v12];
  return v13;
}

- (unint64_t)bufferRobustnessSupport
{
  if ([(_MTLDevice *)self supportsBufferBoundsChecking]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (BOOL)supportsBufferlessClientStorageTexture
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBufferlessClientStorageTexture];
}

- (BOOL)supportsPartialRenderMemoryBarrier
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPartialRenderMemoryBarrier];
}

- (BOOL)supportsStreamingCodecSignaling
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsStreamingCodecSignaling];
}

- (BOOL)supportsLargeFramebufferConfigs
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsLargeFramebufferConfigs];
}

- (BOOL)supportsCustomBorderColor
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsCustomBorderColor];
}

- (BOOL)supportsSamplerAddressModeClampToHalfBorder
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsSamplerAddressModeClampToHalfBorder];
}

- (BOOL)supportsBCTextureCompression
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBCTextureCompression];
}

- (BOOL)supportsBGR10A2
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBGR10A2];
}

- (BOOL)supportsGlobalVariableRelocation
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsGlobalVariableRelocation];
}

- (BOOL)supportsGlobalVariableRelocationRender
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsGlobalVariableRelocationRender];
}

- (BOOL)supportsTLS
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsTLS];
}

- (BOOL)supports32bpcMSAATextures
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupports32bpcMSAATextures];
}

- (BOOL)supportsQueryTextureLOD
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsQueryTextureLOD];
}

- (BOOL)supportsVertexAmplification
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsVertexAmplification];
}

- (BOOL)supportsLateEvalEvent
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsLateEvalEvent];
}

- (BOOL)supportsMemorylessRenderTargets
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMemorylessRenderTargets];
}

- (BOOL)supportsDeadlineProfile
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsDeadlineProfile];
}

- (BOOL)supportsResourceDetachBacking
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsResourceDetachBacking];
}

- (BOOL)supportsBufferWithAddressRanges
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBufferWithAddressRanges];
}

- (BOOL)supportsHeapWithAddressRanges
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsHeapWithAddressRanges];
}

- (BOOL)supportsShaderMinLODClamp
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsShaderMinLODClamp];
}

- (BOOL)supportsDynamicLibraries
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsDynamicLibraries];
}

- (BOOL)supportsShaderBarycentricCoordinates
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsShaderBarycentricCoordinates];
}

- (BOOL)supportsBlackOrWhiteSamplerBorderColors
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBlackOrWhiteSamplerBorderColors];
}

- (BOOL)supportsMirrorClampToEdgeSamplerMode
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMirrorClampToEdgeSamplerMode];
}

- (BOOL)supportsTexture2DMultisampleArray
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsTexture2DMultisampleArray];
}

- (BOOL)supportsBufferBoundsChecking
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsBufferBoundsChecking];
}

- (BOOL)supportsComputeCompressedTextureWrite
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsComputeCompressedTextureWrite];
}

- (BOOL)supportsVirtualSubstreams
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsVirtualSubstreams];
}

- (BOOL)supportsAtomicUlongVoidMinMax
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsAtomicUlongVoidMinMax];
}

- (BOOL)supportsMeshShaders
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsMeshShaders];
}

- (BOOL)supportsPerPlaneCompression
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsPerPlaneCompression];
}

- (BOOL)supportsExplicitVisibilityGroups
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsExplicitVisibilityGroups];
}

- (BOOL)supportsExtendedSamplerLODBiasRange
{
  return [(MTLDeviceFeatureQueries *)self->_featureQueries familySupportsExtendedSamplerLODBiasRange];
}

- (_MTLDevice)initWithAcceleratorPort:(unsigned int)a3
{
  return 0;
}

- (void)initDefaultLogState
{
  uint64_t v4 = 0;
  uint64_t v5 = self;
  p_initDefaultLogState = &self->_initDefaultLogState;
  v3[0] = &v5;
  v3[1] = &v4;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initDefaultLogState, memory_order_acquire) != -1)
  {
    uint64_t v7 = v3;
    uint64_t v6 = &v7;
    std::__call_once(&p_initDefaultLogState->__state_, &v6, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice initDefaultLogState]::$_0 &&>>);
  }
}

- (void)initProgressTracking
{
  uint64_t v4 = self;
  p_initProgressTrackingOnceToken = &self->_initProgressTrackingOnceToken;
  id v3 = &v4;
  if (atomic_load_explicit((atomic_ullong *volatile)p_initProgressTrackingOnceToken, memory_order_acquire) != -1)
  {
    uint64_t v6 = &v3;
    uint64_t v5 = &v6;
    std::__call_once(&p_initProgressTrackingOnceToken->__state_, &v5, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<-[_MTLDevice initProgressTracking]::$_1 &&>>);
  }
}

- (void)dealloc
{
  libraryBuilder = (id *)self->_libraryBuilder;
  if (libraryBuilder)
  {
    MTLLibraryBuilder::~MTLLibraryBuilder(libraryBuilder);
    MEMORY[0x18530C140]();
  }
  pipelineLibraryBuilder = self->_pipelineLibraryBuilder;
  if (pipelineLibraryBuilder)
  {
    dispatch_release((dispatch_object_t)pipelineLibraryBuilder->var1);
    MEMORY[0x18530C140](pipelineLibraryBuilder, 0x80C40803F642BLL);
  }
  dispatch_release((dispatch_object_t)self->_serialQueue);
  dispatch_release((dispatch_object_t)self->_pipelineSerializationQueue);
  dispatch_release((dispatch_object_t)self->_concurrentQueue);

  supportedGPUFamilies = (void **)self->_supportedGPUFamilies;
  if (supportedGPUFamilies)
  {
    uint64_t v6 = *supportedGPUFamilies;
    if (*supportedGPUFamilies)
    {
      supportedGPUFamilies[1] = v6;
      operator delete(v6);
    }
    MEMORY[0x18530C140](supportedGPUFamilies, 0x10C402FEFCB83);
  }
  self->_supportedGPUFamilies = 0;

  self->_progressTrackBufferStack = 0;
  self->_progressTrackComputePipeline = 0;

  self->_progressTrackComputePipeline = 0;
  self->_akIOResourceListPool = 0;
  recompiledBinaryArchiveMap = self->_recompiledBinaryArchiveMap;
  if (recompiledBinaryArchiveMap)
  {
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)recompiledBinaryArchiveMap);
    MEMORY[0x18530C140]();
  }
  binaryArchiveUsage = self->_binaryArchiveUsage;
  if (binaryArchiveUsage)
  {
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)binaryArchiveUsage);
    MEMORY[0x18530C140]();
  }

  v9.receiver = self;
  v9.super_class = (Class)_MTLDevice;
  [(_MTLDevice *)&v9 dealloc];
}

- (const)targetDeviceInfo
{
  return 0;
}

- (MTLTargetDeviceArchitecture)targetDeviceArchitecture
{
  return 0;
}

- (BOOL)isVendorSliceCompatibleWithDeploymentTarget:(unsigned int)a3 platform:(unsigned int)a4 sdkVersion:(unsigned int)a5 compilerPluginVersion:(unsigned int)a6
{
  return [(MTLTargetDeviceArchitecture *)[(_MTLDevice *)self targetDeviceArchitecture] versionCombined] == a6;
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4
{
  return [(_MTLDevice *)self loadDynamicLibrariesForComputeDescriptor:a3 options:0 error:a4];
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9 = [a3 computeFunction];
  uint64_t v10 = [a3 preloadedLibraries];

  return [(_MTLDevice *)self loadDynamicLibrariesForFunction:v9 insertLibraries:v10 options:a4 error:a5];
}

- (BOOL)areProgrammableSamplePositionsSupported
{
  return 0;
}

- (unint64_t)getSupportedCommandBufferErrorOptions
{
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  _OWORD v11[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)_MTLDevice;
  id v6 = [(_MTLDevice *)&v10 description];
  v11[0] = v4;
  v11[1] = @"name =";
  uint64_t v7 = [(_MTLDevice *)self name];
  uint64_t v8 = @"<none>";
  if (v7) {
    uint64_t v8 = (__CFString *)v7;
  }
  v11[2] = v8;
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 3), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(_MTLDevice *)self formattedDescription:0];
}

- (id)newFunctionWithGLCoreIR:(void *)a3 functionType:(unint64_t)a4
{
}

- (id)newFunctionWithGLCoreIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
}

- (id)newFunctionWithGLESIR:(void *)a3 functionType:(unint64_t)a4
{
}

- (id)newFunctionWithGLESIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
}

- (id)newFunctionWithGLIR:(void *)a3 functionType:(unint64_t)a4
{
  int v4 = a4;
  int v6 = (int)self;
  dyld_get_active_platform();

  newFunctionWithGLIR(v6, v4, (unsigned int *)a3);
}

- (id)newFunctionWithGLIR:(void *)a3 inputsDescription:(id)a4 functionType:(unint64_t)a5
{
  int v5 = a5;
  int v7 = (int)self;
  dyld_get_active_platform();

  newFunctionWithGLIR(v7, v5, (unsigned int *)a3);
}

- (void)getShaderCacheKeys
{
  v2 = [(_MTLDevice *)self compiler];

  return [(MTLCompiler *)v2 getShaderCacheKeys];
}

- (os_unfair_lock_s)getBVHBuilderLock
{
  return &self->_GPUBVHBuilderLock;
}

- (id)getRawBVHBuilderPtr
{
  return self->_GPUBVHBuilder;
}

- (void)setRawBVHBuilderPtr:(id)a3
{
  GPUBVHBuilder = self->_GPUBVHBuilder;
  if (GPUBVHBuilder != a3)
  {

    self->_GPUBVHBuilder = (MTLGPUBVHBuilder *)a3;
  }
}

- (void)allowLibrariesFromOtherPlatforms
{
  *((unsigned char *)self->_libraryBuilder + 40) = 0;
  v2 = [(_MTLDevice *)self compiler];

  [(MTLCompiler *)v2 allowLibrariesFromOtherPlatforms];
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  int v5 = (MTLSharedTextureHandle *)-[_MTLDevice copyIOSurfaceSharedTextureProperties:](self, "copyIOSurfaceSharedTextureProperties:");
  if ([(MTLSharedTextureHandle *)v5 objectForKey:*MEMORY[0x1E4F2EFB8]])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_MTLDevice registryID](self, "registryID"));
    [(MTLSharedTextureHandle *)v5 setObject:v6 forKeyedSubscript:kMetalRegistryID];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "textureType"));
    [(MTLSharedTextureHandle *)v5 setObject:v7 forKeyedSubscript:kMetalTextureType];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "pixelFormat"));
    [(MTLSharedTextureHandle *)v5 setObject:v8 forKeyedSubscript:kMetalTexturePixelFormat];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "width"));
    [(MTLSharedTextureHandle *)v5 setObject:v9 forKeyedSubscript:kMetalTextureWidth];
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "height"));
    [(MTLSharedTextureHandle *)v5 setObject:v10 forKeyedSubscript:kMetalTextureHeight];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "depth"));
    [(MTLSharedTextureHandle *)v5 setObject:v11 forKeyedSubscript:kMetalTextureDepth];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "mipmapLevelCount"));
    [(MTLSharedTextureHandle *)v5 setObject:v12 forKeyedSubscript:kMetalTextureMipmapLevelCount];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "sampleCount"));
    [(MTLSharedTextureHandle *)v5 setObject:v13 forKeyedSubscript:kMetalTextureSampleCount];
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "arrayLength"));
    [(MTLSharedTextureHandle *)v5 setObject:v14 forKeyedSubscript:kMetalTextureArrayLength];
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "resourceOptions"));
    [(MTLSharedTextureHandle *)v5 setObject:v15 forKeyedSubscript:kMetalTextureResourceOptions];
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "usage"));
    [(MTLSharedTextureHandle *)v5 setObject:v16 forKeyedSubscript:kMetalTextureUsage];
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "sparseSurfaceDefaultValue"));
    [(MTLSharedTextureHandle *)v5 setObject:v17 forKeyedSubscript:kMetalTextureSparseValue];
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "allowGPUOptimizedContents"));
    [(MTLSharedTextureHandle *)v5 setObject:v18 forKeyedSubscript:kMetalTextureGPUOptimization];
    -[MTLSharedTextureHandle setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", MTLTextureSwizzleChannelsToKey(objc_msgSend(a3, "swizzle"))), kMetalTextureSwizzleKey);
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "rotation"));
    [(MTLSharedTextureHandle *)v5 setObject:v19 forKeyedSubscript:kMetalTextureRotation];
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "compressionFootprint"));
    [(MTLSharedTextureHandle *)v5 setObject:v20 forKeyedSubscript:kMetalTextureFootprint];
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "resourceIndex"));
    [(MTLSharedTextureHandle *)v5 setObject:v21 forKeyedSubscript:kMetalTextureResourceIndex];
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "colorSpaceConversionMatrix"));
    [(MTLSharedTextureHandle *)v5 setObject:v22 forKeyedSubscript:kMetalTextureCSCMatrix];
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "protectionOptions"));
    [(MTLSharedTextureHandle *)v5 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F2F280]];
    IOSurfaceRef v24 = IOSurfaceCreate((CFDictionaryRef)v5);

    if (!v24) {
      return 0;
    }
    int v5 = [[MTLSharedTextureHandle alloc] initWithIOSurface:v24 label:0];
    CFRelease(v24);
    id v25 = [(_MTLDevice *)self newSharedTextureWithHandle:v5];
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)_newDescriptorForSharedTexture:(__IOSurface *)a3
{
  int v4 = (void *)IOSurfaceCopyValue(a3, (CFStringRef)*MEMORY[0x1E4F2F080]);
  if ([v4 objectForKeyedSubscript:kMetalRegistryID]
    && [v4 objectForKeyedSubscript:kMetalTextureType]
    && [v4 objectForKeyedSubscript:kMetalTexturePixelFormat]
    && [v4 objectForKeyedSubscript:kMetalTextureWidth]
    && [v4 objectForKeyedSubscript:kMetalTextureHeight]
    && [v4 objectForKeyedSubscript:kMetalTextureDepth]
    && [v4 objectForKeyedSubscript:kMetalTextureMipmapLevelCount]
    && [v4 objectForKeyedSubscript:kMetalTextureSampleCount]
    && [v4 objectForKeyedSubscript:kMetalTextureArrayLength]
    && [v4 objectForKeyedSubscript:kMetalTextureSparseValue]
    && [v4 objectForKeyedSubscript:kMetalTextureSwizzleKey]
    && [v4 objectForKeyedSubscript:kMetalTextureRotation]
    && [v4 objectForKeyedSubscript:kMetalTextureFootprint]
    && [v4 objectForKeyedSubscript:kMetalTextureResourceIndex]
    && [v4 objectForKeyedSubscript:kMetalTextureCSCMatrix]
    && [v4 objectForKeyedSubscript:kMetalTextureGPUOptimization]
    && (uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalRegistryID), "unsignedLongLongValue"),
        [(_MTLDevice *)self registryID] == v5))
  {
    uint64_t v6 = objc_alloc_init(MTLTextureDescriptor);
    -[MTLTextureDescriptor setTextureType:](v6, "setTextureType:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureType), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setPixelFormat:](v6, "setPixelFormat:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTexturePixelFormat), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setWidth:](v6, "setWidth:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureWidth), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setHeight:](v6, "setHeight:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureHeight), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setDepth:](v6, "setDepth:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureDepth), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setMipmapLevelCount:](v6, "setMipmapLevelCount:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureMipmapLevelCount), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setSampleCount:](v6, "setSampleCount:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureSampleCount), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setArrayLength:](v6, "setArrayLength:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureArrayLength), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setResourceOptions:](v6, "setResourceOptions:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureResourceOptions), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setUsage:](v6, "setUsage:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureUsage), "unsignedIntegerValue"));
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureSwizzleKey), "unsignedIntegerValue");
    [(MTLTextureDescriptor *)v6 setSwizzle:MTLTextureSwizzleKeyToChannels(v7, v8)];
    -[MTLTextureDescriptor setSparseSurfaceDefaultValue:](v6, "setSparseSurfaceDefaultValue:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureSparseValue), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setAllowGPUOptimizedContents:](v6, "setAllowGPUOptimizedContents:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureGPUOptimization), "BOOLValue"));
    -[MTLTextureDescriptor setRotation:](v6, "setRotation:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureRotation), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setCompressionFootprint:](v6, "setCompressionFootprint:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureFootprint), "unsignedIntegerValue"));
    -[MTLTextureDescriptor setResourceIndex:](v6, "setResourceIndex:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureResourceIndex), "unsignedLongLongValue"));
    -[MTLTextureDescriptor setColorSpaceConversionMatrix:](v6, "setColorSpaceConversionMatrix:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", kMetalTextureCSCMatrix), "unsignedIntegerValue"));
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  uint64_t v5 = [a3 ioSurface];
  id v6 = [(_MTLDevice *)self _newDescriptorForSharedTexture:v5];
  uint64_t v7 = (void *)[(_MTLDevice *)self newTextureWithDescriptor:v6 iosurface:v5 plane:0];

  objc_msgSend(v7, "setLabel:", objc_msgSend(a3, "label"));
  return v7;
}

- (id)newSharedTextureWithHandle:(id)a3 withResourceIndex:(unint64_t)a4
{
  uint64_t v7 = [a3 ioSurface];
  id v8 = [(_MTLDevice *)self _newDescriptorForSharedTexture:v7];
  [v8 setResourceIndex:a4];
  uint64_t v9 = (void *)[(_MTLDevice *)self newTextureWithDescriptor:v8 iosurface:v7 plane:0];

  objc_msgSend(v9, "setLabel:", objc_msgSend(a3, "label"));
  return v9;
}

- (BOOL)areRasterOrderGroupsSupported
{
  return [(_MTLDevice *)self supportsFamily:1004];
}

- (BOOL)isQuadDataSharingSupported
{
  return [(_MTLDevice *)self supportsFamily:1004];
}

- (unint64_t)sparseTexturesSupport
{
  if ([(_MTLDevice *)self supportsFamily:1006]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (unsigned)maximumComputeSubstreams
{
  return 0;
}

- (id)_deviceWrapper
{
  return 0;
}

- (id)serializeRenderPipelineDescriptor:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  uint64_t v12 = 0;
  pipelineSerializationQueue = self->_pipelineSerializationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48___MTLDevice_serializeRenderPipelineDescriptor___block_invoke;
  v6[3] = &unk_1E52203E8;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(pipelineSerializationQueue, v6);
  int v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)newRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::PipelineDescriptorDeserializer(v7, a4);
  uint64_t v5 = MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::newRenderPipelineDescriptor((uint64_t)v7, (dispatch_data_t)a3);
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::~PipelineDescriptorDeserializer((MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer *)v7);
  return v5;
}

- (id)serializeComputePipelineDescriptor:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  uint64_t v12 = 0;
  pipelineSerializationQueue = self->_pipelineSerializationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49___MTLDevice_serializeComputePipelineDescriptor___block_invoke;
  v6[3] = &unk_1E52203E8;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(pipelineSerializationQueue, v6);
  int v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)newComputePipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::PipelineDescriptorDeserializer(v7, a4);
  uint64_t v5 = MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::newComputePipelineDescriptor((uint64_t)v7, (dispatch_data_t)a3);
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::~PipelineDescriptorDeserializer((MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer *)v7);
  return v5;
}

- (id)serializeTileRenderPipelineDescriptor:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  uint64_t v12 = 0;
  pipelineSerializationQueue = self->_pipelineSerializationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52___MTLDevice_serializeTileRenderPipelineDescriptor___block_invoke;
  v6[3] = &unk_1E52203E8;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(pipelineSerializationQueue, v6);
  int v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)newTileRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::PipelineDescriptorDeserializer(v7, a4);
  uint64_t v5 = MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::newTileRenderPipelineDescriptor((uint64_t)v7, (dispatch_data_t)a3);
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::~PipelineDescriptorDeserializer((MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer *)v7);
  return v5;
}

- (id)serializeMeshRenderPipelineDescriptor:(id)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  uint64_t v12 = 0;
  pipelineSerializationQueue = self->_pipelineSerializationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52___MTLDevice_serializeMeshRenderPipelineDescriptor___block_invoke;
  v6[3] = &unk_1E52203E8;
  v6[4] = a3;
  v6[5] = &v7;
  dispatch_sync(pipelineSerializationQueue, v6);
  int v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)newMeshRenderPipelineDescriptorWithSerializedData:(id)a3 deserializationContext:(id)a4
{
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::PipelineDescriptorDeserializer(v7, a4);
  uint64_t v5 = MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::newMeshRenderPipelineDescriptor((uint64_t)v7, (dispatch_data_t)a3);
  MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer::~PipelineDescriptorDeserializer((MTLPipelineLibrarySerializer::PipelineDescriptorDeserializer *)v7);
  return v5;
}

- (id)serializeStructType:(id)a3 version:(unsigned int)a4
{
  id v6 = malloc_type_malloc(0x400uLL, 0xFA8FEB0CuLL);
  buffer = v6;
  *(_OWORD *)size = xmmword_1828F0750;
  if (a4 >= 2)
  {
    *(void *)id v6 = 0x4E494253504C544DLL;
    v6[2] = a4;
    size[1] = 12;
  }
  serializeStructType((char *)a3, (char **)&buffer, a4);
  uint64_t v7 = buffer;
  size_t v8 = size[1];
  size[0] = 0;
  size[1] = 0;
  buffer = 0;
  dispatch_data_t v9 = dispatch_data_create(v7, v8, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
  free(buffer);
  return v9;
}

- (id)serializeStructType:(id)a3
{
  return [(_MTLDevice *)self serializeStructType:a3 version:2];
}

- (id)newStructTypeWithSerializedData:(id)a3
{
  size_t size_ptr = 0;
  buffer_ptr = 0;
  int v4 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  v9[0] = buffer_ptr;
  v9[1] = size_ptr;
  uint64_t v10 = 0;
  if (size_ptr >= 8 && *(void *)buffer_ptr == 0x4E494253504C544DLL)
  {
    if (size_ptr < 9 || (size_ptr & 0xFFFFFFFFFFFFFFFCLL) == 8) {
      abort();
    }
    unsigned int v5 = *((_DWORD *)buffer_ptr + 2);
    uint64_t v10 = 12;
  }
  else
  {
    unsigned int v5 = 1;
  }
  id v6 = newStructTypeWithSerializedContext((uint64_t)self, (DeserialContext *)v9, v5);
  dispatch_release(v4);
  return v6;
}

- (id)vendorName
{
  return @"Apple";
}

- (id)familyName
{
  return &stru_1ECAC84A8;
}

- (id)productName
{
  return &stru_1ECAC84A8;
}

- (void)unloadShaderCaches
{
  [(MTLCompiler *)[(_MTLDevice *)self compiler] unloadShaderCaches];
  libraryBuilder = (MTLLibraryBuilder *)self->_libraryBuilder;

  MTLLibraryBuilder::deleteLibraryCache(libraryBuilder);
}

- (BOOL)copyShaderCacheToPath:(id)a3
{
  int v4 = [(_MTLDevice *)self compiler];

  return [(MTLCompiler *)v4 copyShaderCacheToPath:a3];
}

- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats
{
  v2 = [(_MTLDevice *)self compiler];

  return ($85CD2974BE96D4886BB301820D1C36C2)[(MTLCompiler *)v2 libraryCacheStats];
}

- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats
{
  v2 = [(_MTLDevice *)self compiler];

  return ($85CD2974BE96D4886BB301820D1C36C2)[(MTLCompiler *)v2 pipelineCacheStats];
}

- (id)newDefaultLibrary
{
  id v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "pathForResource:ofType:", @"default", @"metallib");
  if (!v3) {
    return 0;
  }
  size_t v8 = MTLLibraryBuilder::newLibraryWithFile((uint64_t)self->_libraryBuilder, self, v3, 0, v4, v5, v6, v7);
  if ([(_MTLDevice *)self isCollectingLibraries] && v8) {
    MTLPipelineCollection::addLibrary((uint64_t)self->_pipelineCollection, v8);
  }
  return v8;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  IOSurfaceRef v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  uint64_t v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3052000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  uint64_t v20 = 0;
  libraryBuilder = self->_libraryBuilder;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49___MTLDevice_newLibraryWithSource_options_error___block_invoke;
  v14[3] = &unk_1E5220410;
  v14[5] = &v21;
  v14[6] = &v15;
  v14[4] = self;
  MTLLibraryBuilder::newLibraryWithSource((uint64_t)libraryBuilder, self, a3, a4, 1, (uint64_t)v14, v5, v6);
  if (v22[5])
  {
    uint64_t v10 = (NSError *)v16[5];
    if (v10)
    {
      _MTLCompilerWarningLog(v10);

      v16[5] = 0;
    }
  }
  uint64_t v11 = (void *)v16[5];
  if (a5) {
    *a5 = v11;
  }
  else {

  }
  uint64_t v12 = (void *)v22[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  return (id)MTLLibraryBuilder::newLibraryWithCIFilters((os_unfair_lock_s *)self->_libraryBuilder, a3, (uint64_t)a4, a5);
}

- (void)registerMeshRenderPipelineDescriptor:(id)a3
{
  if ([(_MTLDevice *)self isCollectingPipelines])
  {
    MTLPipelineCollection::addMeshRenderPipeline((MTLPipelineCollection *)self->_pipelineCollection, (MTLMeshRenderPipelineDescriptor *)a3);
    if ((_dumpAtExit & 1) == 0)
    {
      [(_MTLDevice *)self dumpPipelineDescriptorsIfRequested];
    }
  }
}

- (unint64_t)optionsForPipelineLibrarySerialization
{
  if (-[_MTLDevice optionsForPipelineLibrarySerialization]::onceToken != -1) {
    dispatch_once(&-[_MTLDevice optionsForPipelineLibrarySerialization]::onceToken, &__block_literal_global_239);
  }
  unint64_t v2 = 9;
  if (-[_MTLDevice optionsForPipelineLibrarySerialization]::serializeMetalScript == 1) {
    unint64_t v2 = 17;
  }
  if (-[_MTLDevice optionsForPipelineLibrarySerialization]::serializeMetalScript) {
    return v2;
  }
  else {
    return 5;
  }
}

- (void)startCollectingPipelineDescriptors
{
  if (!self->_pipelineCollection) {
    operator new();
  }
  self->_collectAllLibraries = 1;
}

- (void)startCollectingPipelineDescriptorsUsingPrefixForNames:(id)a3
{
  if (!a3) {
    MTLReportFailure(0, "-[_MTLDevice startCollectingPipelineDescriptorsUsingPrefixForNames:]", 2695, @"name prefix is null", v3, v4, v5, v6, v11);
  }
  pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
  if (!pipelineCollection)
  {
    [(_MTLDevice *)self startCollectingPipelineDescriptors];
    pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
  }
  uint64_t v10 = (const char *)[a3 UTF8String];

  MTLPipelineCollection::setNamePrefix(pipelineCollection, v10);
}

- (void)startCollectingPipelineDescriptorsFromLibrary:(id)a3 filePath:(id)a4
{
  pipelineCollection = self->_pipelineCollection;
  if (!pipelineCollection) {
    operator new();
  }

  MTLPipelineCollection::addLibrary((uint64_t)pipelineCollection, a3);
}

- (id)endCollectingPipelineDescriptors
{
  pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
  if (!pipelineCollection)
  {
    MTLReportFailure(0, "-[_MTLDevice endCollectingPipelineDescriptors]", 2717, @"startCollectingPipelineDescriptors was not called", v2, v3, v4, v5, v11);
    pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
  }
  size_t v8 = (void *)MTLPipelineCollection::JSONData(pipelineCollection);
  self->_collectAllLibraries = 0;
  dispatch_data_t v9 = (MTLPipelineCollection *)self->_pipelineCollection;
  if (v9)
  {
    MTLPipelineCollection::~MTLPipelineCollection(v9);
    MEMORY[0x18530C140]();
    self->_pipelineCollection = 0;
  }

  return v8;
}

- (void)dumpPipelineDescriptorsIfRequested
{
  pipelineDescriptorsOutputFile = self->_pipelineDescriptorsOutputFile;
  if (pipelineDescriptorsOutputFile)
  {
    pipelineCollection = (MTLPipelineCollection *)self->_pipelineCollection;
    if (pipelineCollection)
    {
      MTLPipelineCollection::writeJSONToFile(pipelineCollection, pipelineDescriptorsOutputFile);
      librariesOutputDirectory = self->_librariesOutputDirectory;
      if (librariesOutputDirectory)
      {
        uint64_t v6 = (MTLPipelineCollection *)self->_pipelineCollection;
        MTLPipelineCollection::dumpLibraries(v6, librariesOutputDirectory);
      }
    }
  }
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  dispatch_data_t v9 = objc_opt_new();
  [v9 setOptions:a3];
  [v9 setUrl:a4];
  id v10 = [(_MTLDevice *)self newBinaryArchiveWithDescriptor:v9 error:a5];

  return v10;
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v7 = [_MTLBinaryArchive alloc];

  return [(_MTLBinaryArchive *)v7 initWithDevice:self descriptor:a3 error:a4];
}

- (id)newDynamicLibraryError:(unint64_t)a3 message:(id)a4
{
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a4 forKey:*MEMORY[0x1E4F28568]];
  id v6 = objc_alloc(MEMORY[0x1E4F28C58]);

  return (id)[v6 initWithDomain:@"MTLBinaryArchiveDomain" code:a3 userInfo:v5];
}

- (BOOL)validateDynamicLibraryURL:(id)a3 error:(id *)a4
{
  if ([(_MTLDevice *)self supportsDynamicLibraries]
    || [(_MTLDevice *)self supportsStatefulDynamicLibraries])
  {
    if (a3) {
      return 1;
    }
    if (a4)
    {
      size_t v8 = @"URL for dynamic library is nil";
      dispatch_data_t v9 = self;
      uint64_t v10 = 1;
LABEL_9:
      id v11 = [(_MTLDevice *)v9 newDynamicLibraryError:v10 message:v8];
      BOOL result = 0;
      *a4 = v11;
      return result;
    }
  }
  else if (a4)
  {
    size_t v8 = @"Device does not support dynamic libraries.";
    dispatch_data_t v9 = self;
    uint64_t v10 = 5;
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)validateDynamicLibrary:(id)a3 state:(BOOL)a4 error:(id *)a5
{
  uint64_t v7 = self;
  if (a4)
  {
    if ([(_MTLDevice *)self supportsStatefulDynamicLibraries])
    {
LABEL_5:
      uint64_t v8 = [a3 type];
      BOOL result = v8 == 1;
      if (a5 && v8 != 1)
      {
        if (v8) {
          uint64_t v10 = 0;
        }
        else {
          uint64_t v10 = @"MTLLibraryTypeExecutable";
        }
        if (a3) {
          uint64_t v10 = @"null";
        }
        id v11 = (__CFString *)[NSString stringWithFormat:@"Expected a library with type MTLLibraryTypeDynamic, found invalid type: %@", v10];
        goto LABEL_15;
      }
      return result;
    }
    self = v7;
  }
  if ([(_MTLDevice *)self supportsDynamicLibraries]) {
    goto LABEL_5;
  }
  if (a5)
  {
    id v11 = @"Device does not support dynamic libraries.";
LABEL_15:
    id v12 = [(_MTLDevice *)v7 newDynamicLibraryError:5 message:v11];
    BOOL result = 0;
    *a5 = v12;
    return result;
  }
  return 0;
}

- (id)newDynamicLibraryWithDescriptor:(id)a3 error:(id *)a4
{
  if (!-[_MTLDevice validateDynamicLibraryDescriptor:error:](self, "validateDynamicLibraryDescriptor:error:")) {
    return 0;
  }

  return [(_MTLDevice *)self _newDynamicLibraryWithDescriptor:a3 computeDescriptor:0 error:a4];
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  if (![(_MTLDevice *)self validateDynamicLibrary:a3 state:0 error:a4]) {
    return 0;
  }
  uint64_t v7 = objc_opt_new();
  [v7 setLibrary:a3];
  id v8 = [(_MTLDevice *)self _newDynamicLibraryWithDescriptor:v7 computeDescriptor:0 error:a4];

  return v8;
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  if (!-[_MTLDevice validateDynamicLibrary:state:error:](self, "validateDynamicLibrary:state:error:", a3, 1)) {
    return 0;
  }
  dispatch_data_t v9 = objc_opt_new();
  [v9 setLibrary:a3];
  id v10 = [(_MTLDevice *)self _newDynamicLibraryWithDescriptor:v9 computeDescriptor:a4 error:a5];

  return v10;
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  return [(_MTLDevice *)self newDynamicLibraryWithURL:a3 options:0 error:a4];
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  if (![(_MTLDevice *)self validateDynamicLibraryURL:a3 error:a5]) {
    return 0;
  }
  dispatch_data_t v9 = [_MTLDynamicLibrary alloc];

  return [(_MTLDynamicLibrary *)v9 initWithURL:a3 device:self options:a4 error:a5];
}

- (BOOL)isFloat32FilteringSupported
{
  return 0;
}

- (BOOL)isBCTextureCompressionSupported
{
  return 0;
}

- (BOOL)isMsaa32bSupported
{
  return 0;
}

- (BOOL)isRGB10A2GammaSupported
{
  return 0;
}

- (BOOL)isCustomBorderColorSupported
{
  return 0;
}

- (BOOL)isClampToHalfBorderSupported
{
  return 0;
}

- (BOOL)isRTZRoundingSupported
{
  return 0;
}

- (BOOL)supportsTextureWriteRoundingMode:(int64_t)a3
{
  return a3 == 0;
}

- (int64_t)defaultTextureWriteRoundingMode
{
  return 0;
}

- (BOOL)isAnisoSampleFixSupported
{
  return 0;
}

- (BOOL)isFixedLinePointFillDepthGradientSupported
{
  return [(_MTLDevice *)self supportsFamily:2001];
}

- (BOOL)isLargeMRTSupported
{
  return 0;
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id v11 = objc_alloc_init(MTLComputePipelineDescriptor);
  [(MTLComputePipelineDescriptor *)v11 setComputeFunction:a3];
  id v12 = [(_MTLDevice *)self newComputePipelineStateWithDescriptor:v11 options:a4 reflection:a5 error:a6];

  return v12;
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  uint64_t v16 = 0;
  uint64_t v16 = objc_alloc_init(MTLComputePipelineDescriptor);
  [(id)v12[5] setComputeFunction:a3];
  uint64_t v9 = v12[5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76___MTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v10[3] = &unk_1E52204B0;
  v10[4] = a5;
  v10[5] = &v11;
  [(_MTLDevice *)self newComputePipelineStateWithDescriptor:v9 options:a4 completionHandler:v10];
  _Block_object_dispose(&v11, 8);
}

- (id)newComputePipelineStateWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  id result = (id)MTLLibraryBuilder::newLibraryWithCIFilters((os_unfair_lock_s *)self->_libraryBuilder, a3, (uint64_t)a4, a5);
  if (result)
  {
    id v8 = result;
    uint64_t v9 = (void *)[result newFunctionWithName:@"ciKernelMain"];
    id v10 = [(_MTLDevice *)self newComputePipelineStateWithFunction:v9 error:a5];

    return v10;
  }
  return result;
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  libraryBuilder = (_MTLDevice **)self->_libraryBuilder;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  id v6 = (void *)MTLLibraryBuilder::newLibraryWithDAG(libraryBuilder, a3, a4, a5, &v8, 0, 0, 0);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v6;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = 0;
  memset(v22, 0, sizeof(v22));
  _MTLMessageContextBegin_((uint64_t)v22, (uint64_t)"-[_MTLDevice newLibraryWithStitchedDescriptor:completionHandler:]", 3850, (uint64_t)self, 24, (uint64_t)"Stitched Library with Descriptor Validation");
  if (validateMTLStitchedLibraryDescriptor(a3, (uint64_t)v22, v7, v8, v9, v10, v11, v12)
    && (id v13 = newDAGStringFromFunctionGraphs((void *)[a3 functionGraphs], objc_msgSend(a3, "options"), (uint64_t)v22), (objc_msgSend(v13, "isEqualToString:", &stru_1ECAC84A8) & 1) == 0))
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65___MTLDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
    v21[3] = &unk_1E52204D8;
    v21[4] = self;
    v21[5] = a3;
    v21[6] = v13;
    v21[7] = a4;
    _MTLCreateStitchingScriptFromStichedLibraryDescriptor((MTLStitchedLibraryDescriptor *)a3, &v19);
    libraryBuilder = (_MTLDevice **)self->_libraryBuilder;
    uint64_t v16 = (void *)[a3 functions];
    uint64_t v17 = v19;
    uint64_t v18 = v20;
    if (v20) {
      atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    MTLLibraryBuilder::newLibraryWithDAG(libraryBuilder, v13, v16, (uint64_t)v21, 0, &v17, [a3 options], objc_msgSend(a3, "binaryArchives"), 0);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
  }
  else
  {
    if (*(void *)&v22[0]) {
      id v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", @"MTLLibraryErrorDomain", 2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", errorMessageFromContext((uint64_t)v22), *MEMORY[0x1E4F28568]));
    }
    else {
      id v14 = 0;
    }
    _MTLMessageContextEnd((uint64_t)v22);
    (*((void (**)(id, void, id))a4 + 2))(a4, 0, v14);
  }
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 destinationBinaryArchive:(id)a4 error:(id *)a5
{
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  _MTLMessageContextBegin_((uint64_t)v27, (uint64_t)"-[_MTLDevice newLibraryWithStitchedDescriptor:destinationBinaryArchive:error:]", 3891, (uint64_t)self, 24, (uint64_t)"Stitched Library with Descriptor SPI Validation");
  uint64_t v15 = 0;
  if (validateMTLStitchedLibraryDescriptor(a3, (uint64_t)v27, v9, v10, v11, v12, v13, v14))
  {
    id v16 = newDAGStringFromFunctionGraphs((void *)[a3 functionGraphs], objc_msgSend(a3, "options"), (uint64_t)v27);
    if ([v16 isEqualToString:&stru_1ECAC84A8])
    {
      uint64_t v15 = 0;
    }
    else
    {
      _MTLCreateStitchingScriptFromStichedLibraryDescriptor((MTLStitchedLibraryDescriptor *)a3, &v25);
      libraryBuilder = (_MTLDevice **)self->_libraryBuilder;
      uint64_t v18 = (void *)[a3 functions];
      uint64_t v23 = v25;
      IOSurfaceRef v24 = v26;
      if (v26) {
        atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v15 = (void *)MTLLibraryBuilder::newLibraryWithDAG(libraryBuilder, v16, v18, a5, &v23, objc_msgSend(a3, "options", v23), objc_msgSend(a3, "binaryArchives"), (std::__shared_weak_count_vtbl *)a4);
      if (v24) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      }
      pipelineCollection = self->_pipelineCollection;
      if (pipelineCollection && v15) {
        MTLPipelineCollection::addStitchedLibrary((uint64_t)pipelineCollection, v15);
      }
      if (v26) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v26);
      }
    }
  }
  if (*(void *)&v27[0])
  {
    uint64_t v20 = errorMessageFromContext((uint64_t)v27);
    if (a5)
    {
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v20 forKey:*MEMORY[0x1E4F28568]];
      *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:2 userInfo:v21];
    }
  }
  _MTLMessageContextEnd((uint64_t)v27);
  return v15;
}

- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4
{
  return [(_MTLDevice *)self newLibraryWithStitchedDescriptor:a3 destinationBinaryArchive:0 error:a4];
}

- (id)newDagStringWithGraphs:(id)a3
{
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  _MTLMessageContextBegin_((uint64_t)v6, (uint64_t)"-[_MTLDevice newDagStringWithGraphs:]", 3956, (uint64_t)self, 24, (uint64_t)"New Dag String With Graphs Validation");
  id v4 = newDAGStringFromFunctionGraphs(a3, 0, (uint64_t)v6);
  _MTLMessageContextEnd((uint64_t)v6);
  return v4;
}

- (BOOL)isMagicMipmapSupported
{
  return 0;
}

+ (BOOL)useNewPrimitiveRestartBehavior
{
  return dyld_program_sdk_at_least();
}

+ (BOOL)featureProfile:(unint64_t)a3 supportsFeatureSet:(unint64_t)a4
{
  switch(a4)
  {
    case 0uLL:
    case 2uLL:
    case 5uLL:
    case 8uLL:
    case 0xCuLL:
      unint64_t v4 = 0;
      BOOL v5 = 1;
      break;
    case 1uLL:
    case 3uLL:
    case 6uLL:
    case 9uLL:
    case 0xDuLL:
      BOOL v5 = 1;
      unint64_t v4 = 1;
      break;
    case 4uLL:
    case 7uLL:
    case 0xAuLL:
    case 0xEuLL:
      BOOL v5 = 1;
      unint64_t v4 = 4;
      break;
    case 0xBuLL:
    case 0xFuLL:
      BOOL v5 = 1;
      unint64_t v4 = 5;
      break;
    case 0x10uLL:
      BOOL v5 = 1;
      unint64_t v4 = 6;
      break;
    case 0x11uLL:
      BOOL v5 = 1;
      unint64_t v4 = 7;
      break;
    case 0x12uLL:
      BOOL v5 = 1;
      unint64_t v4 = 8;
      break;
    default:
      BOOL v5 = 0;
      unint64_t v4 = 0xFFFFFFFFLL;
      break;
  }
  return v4 <= a3 && v5;
}

- (unint64_t)linearTextureArrayAlignmentBytes
{
  return [(_MTLDevice *)self limits][4];
}

- (unint64_t)linearTextureArrayAlignmentSlice
{
  return [(_MTLDevice *)self limits][8];
}

- (unint64_t)maxTileBuffers
{
  return [(_MTLDevice *)self limits][12];
}

- (unint64_t)maxTileTextures
{
  return [(_MTLDevice *)self limits][16];
}

- (unint64_t)maxTileSamplers
{
  return [(_MTLDevice *)self limits][20];
}

- (unint64_t)maxTileInlineDataSize
{
  return [(_MTLDevice *)self limits][24];
}

- (unint64_t)maxVertexAttributes
{
  return [(_MTLDevice *)self limits][36];
}

- (unint64_t)maxVertexBuffers
{
  return [(_MTLDevice *)self limits][40];
}

- (unint64_t)maxVertexTextures
{
  return [(_MTLDevice *)self limits][44];
}

- (unint64_t)maxVertexSamplers
{
  return [(_MTLDevice *)self limits][48];
}

- (unint64_t)maxVertexInlineDataSize
{
  return [(_MTLDevice *)self limits][52];
}

- (unint64_t)maxInterpolants
{
  return [(_MTLDevice *)self limits][56];
}

- (unint64_t)maxFragmentBuffers
{
  return [(_MTLDevice *)self limits][60];
}

- (unint64_t)maxFragmentTextures
{
  return [(_MTLDevice *)self limits][64];
}

- (unint64_t)maxFragmentInlineDataSize
{
  return [(_MTLDevice *)self limits][72];
}

- (unint64_t)maxComputeBuffers
{
  return [(_MTLDevice *)self limits][76];
}

- (unint64_t)maxComputeTextures
{
  return [(_MTLDevice *)self limits][80];
}

- (unint64_t)maxComputeInlineDataSize
{
  return [(_MTLDevice *)self limits][88];
}

- (unint64_t)maxComputeLocalMemorySizes
{
  return [(_MTLDevice *)self limits][92];
}

- (unint64_t)maxTotalComputeThreadsPerThreadgroup
{
  return [(_MTLDevice *)self limits][96];
}

- (float)maxLineWidth
{
  return (float)[(_MTLDevice *)self limits][104];
}

- (float)maxPointSize
{
  return (float)[(_MTLDevice *)self limits][108];
}

- (unint64_t)maxVisibilityQueryOffset
{
  return [(_MTLDevice *)self limits][112];
}

- (unint64_t)minBufferNoCopyAlignmentBytes
{
  return [(_MTLDevice *)self limits][124];
}

- (unint64_t)linearTextureAlignmentBytes
{
  return [(_MTLDevice *)self limits][160];
}

- (unint64_t)deviceLinearTextureAlignmentBytes
{
  return [(_MTLDevice *)self limits][172];
}

- (unint64_t)deviceLinearReadOnlyTextureAlignmentBytes
{
  return [(_MTLDevice *)self limits][176];
}

- (unint64_t)maxFunctionConstantIndices
{
  return [(_MTLDevice *)self limits][180];
}

- (unint64_t)maxComputeThreadgroupMemoryAlignmentBytes
{
  return [(_MTLDevice *)self limits][184];
}

- (unint64_t)maxInterpolatedComponents
{
  return [(_MTLDevice *)self limits][188];
}

- (unint64_t)maxTessellationFactor
{
  return [(_MTLDevice *)self limits][192];
}

- (unint64_t)maxIndirectBuffers
{
  return [(_MTLDevice *)self limits][196];
}

- (unint64_t)maxIndirectTextures
{
  return [(_MTLDevice *)self limits][200];
}

- (unint64_t)maxIndirectSamplers
{
  return [(_MTLDevice *)self limits][204];
}

- (unint64_t)maxIndirectSamplersPerDevice
{
  return [(_MTLDevice *)self limits][208];
}

- (unint64_t)maxFenceInstances
{
  return [(_MTLDevice *)self limits][212];
}

- (unint64_t)maxCustomSamplePositions
{
  return [(_MTLDevice *)self limits][220];
}

- (unint64_t)maxVertexAmplificationFactor
{
  return [(_MTLDevice *)self limits][224];
}

- (unint64_t)maxVertexAmplificationCount
{
  return [(_MTLDevice *)self limits][228];
}

- (unint64_t)maxTextureBufferWidth
{
  return [(_MTLDevice *)self limits][232];
}

- (unint64_t)maxComputeAttributes
{
  return [(_MTLDevice *)self limits][236];
}

- (unint64_t)maxIOCommandsInFlight
{
  return [(_MTLDevice *)self limits][240];
}

- (unint64_t)maxPredicatedNestingDepth
{
  return [(_MTLDevice *)self limits][244];
}

- (unint64_t)maxAccelerationStructureLevels
{
  return [(_MTLDevice *)self limits][248];
}

- (unint64_t)maxConstantBufferArguments
{
  return [(_MTLDevice *)self limits][252];
}

- (unsigned)acceleratorPort
{
  return 0;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(_MTLDevice *)self compiler];

  return [(MTLCompiler *)v6 newRenderPipelineStateWithDescriptor:a3 options:0 reflection:0 error:a4 completionHandler:0];
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v10 = [(_MTLDevice *)self compiler];

  return [(MTLCompiler *)v10 newRenderPipelineStateWithDescriptor:a3 options:a4 reflection:a5 error:a6 completionHandler:0];
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(_MTLDevice *)self compiler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __69___MTLDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v7[3] = &unk_1E5220500;
  v7[4] = a4;
  [(MTLCompiler *)v6 newRenderPipelineStateWithDescriptor:a3 options:0 reflection:0 error:0 completionHandler:v7];
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = [(_MTLDevice *)self compiler];

  [(MTLCompiler *)v8 newRenderPipelineStateWithDescriptor:a3 options:a4 reflection:0 error:0 completionHandler:a5];
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(_MTLDevice *)self compiler];

  return [(MTLCompiler *)v6 newComputePipelineStateWithDescriptor:a3 options:0 reflection:0 error:a4 completionHandler:0];
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v10 = [(_MTLDevice *)self compiler];

  return [(MTLCompiler *)v10 newComputePipelineStateWithDescriptor:a3 options:a4 reflection:a5 error:a6 completionHandler:0];
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(_MTLDevice *)self compiler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __70___MTLDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v7[3] = &unk_1E5220528;
  v7[4] = a4;
  [(MTLCompiler *)v6 newComputePipelineStateWithDescriptor:a3 options:0 reflection:0 error:0 completionHandler:v7];
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = [(_MTLDevice *)self compiler];

  [(MTLCompiler *)v8 newComputePipelineStateWithDescriptor:a3 options:a4 reflection:0 error:0 completionHandler:a5];
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  if (a6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Tile render pipelines are not supported on this device", *MEMORY[0x1E4F28568], a5);
    *a6 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:1 userInfo:v7];
  }
  return 0;
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Tile render pipelines are not supported on this device" forKey:*MEMORY[0x1E4F28568]];
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:1 userInfo:v6];
  uint64_t v8 = (void (*)(id, void, void, id))*((void *)a5 + 2);

  v8(a5, 0, 0, v7);
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(a3, "newRenderPipelineDescriptorWithDevice:error:", self);
  if (result)
  {
    id v7 = result;
    id v8 = [(_MTLDevice *)self newRenderPipelineStateWithDescriptor:result error:a4];

    return v8;
  }
  return result;
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  id result = (id)[a3 newRenderPipelineDescriptorWithDevice:self error:a6];
  if (result)
  {
    id v11 = result;
    id v12 = [(_MTLDevice *)self newRenderPipelineStateWithDescriptor:result options:a4 reflection:a5 error:a6];

    return v12;
  }
  return result;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v6 = [a3 newRenderPipelineDescriptorWithDevice:self error:&v8];
  if (v6)
  {
    id v7 = (void *)v6;
    [(_MTLDevice *)self newRenderPipelineStateWithDescriptor:v6 completionHandler:a4];
  }
  else
  {
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, v8);
  }
}

- (int)llvmVersion
{
  return 32023;
}

- (MTLCompiler)compiler
{
  return 0;
}

- (char)newTranslatedDriverCompilerOptions:(id)a3 compilerOptionsSize:(unint64_t *)a4
{
  *a4 = 0;
  return 0;
}

- (char)getComputeFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getVertexFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getFragmentFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getObjectFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getMeshFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getVisibleFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (char)getIntersectionFunctionId:(const void *)a3 compilerOptions:(char *)a4 compilerOptionsSize:(unint64_t)a5
{
  return 0;
}

- (void)getVertexFunctionDriverData:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 nextStageVariant:(id)a6 driverDataSize:(unint64_t *)a7
{
  if (a7) {
    *a7 = 0;
  }
  return 0;
}

- (void)getObjectFunctionDriverData:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 nextStageVariant:(id)a6 driverDataSize:(unint64_t *)a7
{
  if (a7) {
    *a7 = 0;
  }
  return 0;
}

- (void)getMeshFunctionDriverData:(const void *)a3 function:(id)a4 compilerOptions:(char *)a5 nextStageVariant:(id)a6 driverDataSize:(unint64_t *)a7
{
  if (a7) {
    *a7 = 0;
  }
  return 0;
}

- (void)freeVertexFunctionDriverData:(void *)a3 vertexFunctionDriverDataSize:(unint64_t)a4
{
  if (a3) {
    free(a3);
  }
}

- (void)freeObjectFunctionDriverData:(void *)a3 objectFunctionDriverDataSize:(unint64_t)a4
{
  if (a3) {
    free(a3);
  }
}

- (void)freeMeshFunctionDriverData:(void *)a3 meshFunctionDriverDataSize:(unint64_t)a4
{
  if (a3) {
    free(a3);
  }
}

- (void)fragmentFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 previousStateVariant:(id)a5 fragmentKeySize:(unint64_t *)a6
{
  *a6 = 0;
  return 0;
}

- (void)vertexFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 nextStageVariant:(id)a5 vertexKeySize:(unint64_t *)a6
{
  *a6 = 0;
  return 0;
}

- (void)freeFragmentFunctionKey:(void *)a3 fragmentKeySize:(unint64_t)a4
{
}

- (void)freeVertexFunctionKey:(void *)a3 vertexKeySize:(unint64_t)a4
{
}

- (void)tileFunctionKeyWithTilePipelineDescriptor:(id)a3 options:(unint64_t)a4 keySize:(unint64_t *)a5
{
  *a5 = 0;
  return 0;
}

- (void)computeFunctionKeyWithComputePipelineDescriptor:(id)a3 options:(unint64_t)a4 keySize:(unint64_t *)a5
{
  *a5 = 0;
  return 0;
}

- (void)libraryKeyWithComputePipelineDescriptor:(id)a3 options:(unint64_t)a4 keySize:(unint64_t *)a5
{
  *a5 = 0;
  return 0;
}

- (void)freeComputeLibraryKey:(void *)a3 libraryKeySize:(unint64_t)a4
{
}

- (void)visibleFunctionKey:(id)a3 withFunctionDescriptor:(id)a4 keySize:(unint64_t *)a5
{
  *a5 = 0;
  return 0;
}

- (void)objectFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 nextStageVariant:(id)a5 objectKeySize:(unint64_t *)a6
{
  return 0;
}

- (void)meshFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 nextStageVariant:(id)a5 meshKeySize:(unint64_t *)a6
{
  return 0;
}

- (void)freeObjectFunctionKey:(void *)a3 objectKeySize:(unint64_t)a4
{
}

- (void)freeMeshFunctionKey:(void *)a3 meshKeySize:(unint64_t)a4
{
}

- (id)computeVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)fragmentVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)vertexVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)newComputeVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  id v7 = (void *)MEMORY[0x18530C9F0](self, a2);
  id v8 = [(_MTLDevice *)self computeVariantWithCompilerOutput:a3 pipelineStatisticsOutput:a4];
  return v8;
}

- (id)newFragmentVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  id v7 = (void *)MEMORY[0x18530C9F0](self, a2);
  id v8 = [(_MTLDevice *)self fragmentVariantWithCompilerOutput:a3 pipelineStatisticsOutput:a4];
  return v8;
}

- (id)newVertexVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  id v7 = (void *)MEMORY[0x18530C9F0](self, a2);
  id v8 = [(_MTLDevice *)self vertexVariantWithCompilerOutput:a3 pipelineStatisticsOutput:a4];
  return v8;
}

- (id)newTileVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4 functionType:(unint64_t)a5
{
  return 0;
}

- (id)newRenderPipelineWithDescriptor:(id)a3 vertexVariant:(id)a4 fragmentVariant:(id)a5
{
  return 0;
}

- (id)newRenderPipelineWithTileDescriptor:(id)a3 tileVariant:(id)a4 errorMessage:(id *)a5
{
  return 0;
}

- (id)newComputePipelineWithDescriptor:(id)a3 variant:(id)a4
{
  return 0;
}

- (id)newComputePipelineWithDescriptor:(id)a3 variant:(id)a4 errorMessage:(id *)a5
{
  if (a5)
  {
    *a5 = 0;
    id result = [(_MTLDevice *)self newComputePipelineWithDescriptor:a3 variant:a4];
    if (!result)
    {
      id v8 = (void *)[NSString stringWithFormat:@"Error creating compute variant"];
      id result = 0;
      *a5 = v8;
    }
  }
  else
  {
    return [(_MTLDevice *)self newComputePipelineWithDescriptor:a3 variant:a4];
  }
  return result;
}

- ($A51142D07271D8AEC4984BC318786978)pipelineFlagsWithVertexVariant:(id)a3 fragmentVariant:(id)a4
{
  return ($A51142D07271D8AEC4984BC318786978)0;
}

- ($CC87CEEC7FB96912C0F1D2377F1A8E9C)pipelineFlagsWithComputeVariant:(id)a3
{
  return ($CC87CEEC7FB96912C0F1D2377F1A8E9C)0;
}

- (id)pipelinePerformanceStatisticsWithVertexVariant:(id)a3 fragmentVariant:(id)a4
{
  return 0;
}

- (id)pipelinePerformanceStatisticsWithComputeVariant:(id)a3
{
  return 0;
}

- (id)pipelinePerformanceStatisticsWithVertexVariant:(id)a3 fragmentVariant:(id)a4 vertexCompileTimeOutput:(id)a5 fragmentCompileTimeOutput:(id)a6
{
  return 0;
}

- ($A51142D07271D8AEC4984BC318786978)pipelineFlagsWithTileVariant:(id)a3
{
  return ($A51142D07271D8AEC4984BC318786978)0;
}

- (id)pipelinePerformanceStatisticsWithTileVariant:(id)a3 compileTimeOutput:(id)a4
{
  return 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forTileVariant:(id)a6
{
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forTileVariant:(id)a7
{
  *a6 = 8;
  *a5 = 0;
  *a3 = 0;
  *a4 = 0;
  -[_MTLDevice getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forTileVariant:](self, "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forTileVariant:");
}

- (id)pipelinePerformanceStatisticsWithComputeVariant:(id)a3 compileTimeOutput:(id)a4
{
  return 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forVertexVariant:(id)a6 fragmentVariant:(id)a7
{
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forVertexVariant:(id)a7 fragmentVariant:(id)a8
{
  *a6 = 8;
  *a5 = 0;
  *a3 = 0;
  *a4 = 0;
  -[_MTLDevice getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forVertexVariant:fragmentVariant:](self, "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forVertexVariant:fragmentVariant:");
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forComputeVariant:(id)a6
{
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forComputeVariant:(id)a7
{
  *a6 = 8;
  *a5 = 0;
  *a3 = 0;
  *a4 = 0;
  -[_MTLDevice getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forComputeVariant:](self, "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forComputeVariant:");
}

- (id)newObjectVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)newMeshVariantWithCompilerOutput:(id)a3 pipelineStatisticsOutput:(id)a4
{
  return 0;
}

- (id)newRenderPipelineWithDescriptor:(id)a3 objectVariant:(id)a4 meshVariant:(id)a5 fragmentVariant:(id)a6 errorMessage:(id *)a7
{
  return 0;
}

- ($A51142D07271D8AEC4984BC318786978)pipelineFlagsWithObjectVariant:(id)a3 meshVariant:(id)a4 fragmentVariant:(id)a5
{
  return ($A51142D07271D8AEC4984BC318786978)0;
}

- (id)pipelinePerformanceStatisticsWithObjectVariant:(id)a3 meshVariant:(id)a4 fragmentVariant:(id)a5 objectCompileTimeOutput:(id)a6 meshCompileTimeOutput:(id)a7 fragmentCompileTimeOutput:(id)a8
{
  return 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 forObjectVariant:(id)a6 meshVariant:(id)a7 fragmentVariant:(id)a8
{
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
}

- (void)getConstantSamplersBitmasks:(unint64_t *)a3 uniqueIdentifiers:(unint64_t *)a4 constantSamplerCount:(unint64_t *)a5 stride:(unsigned int *)a6 forObjectVariant:(id)a7 meshVariant:(id)a8 fragmentVariant:(id)a9
{
  *a6 = 8;
  *a5 = 0;
  *a3 = 0;
  *a4 = 0;
  -[_MTLDevice getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forObjectVariant:meshVariant:fragmentVariant:](self, "getConstantSamplersBitmasks:uniqueIdentifiers:constantSamplerCount:forObjectVariant:meshVariant:fragmentVariant:");
}

- (BOOL)supportsPrimitiveType:(unint64_t)a3
{
  return a3 < 5;
}

- (unint64_t)deviceCreationFlags
{
  return 0;
}

- (unint64_t)minLinearTextureAlignmentForPixelFormat:(unint64_t)a3
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  MTLPixelFormatGetInfoForDevice(self, a3, (uint64_t)v9);
  if (dyld_program_sdk_at_least() && (BYTE8(v9[0]) & 1) == 0) {
    MTLReportFailure(0, "-[_MTLDevice minLinearTextureAlignmentForPixelFormat:]", 5225, @"%s is not supported on this device.", v4, v5, v6, v7, *(uint64_t *)&v9[0]);
  }
  return [(_MTLDevice *)self deviceLinearTextureAlignmentBytes];
}

- (unint64_t)maxArgumentBufferSamplerCount
{
  return self->_limits.maxIndirectSamplersPerDevice;
}

- (id)newLogStateWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v7 = [_MTLLogState alloc];

  return [(_MTLLogState *)v7 initWithDevice:self descriptor:a3 error:a4];
}

- (id)newCommandQueue
{
  uint64_t v3 = objc_alloc_init(MTLCommandQueueDescriptor);

  return [(_MTLDevice *)self newCommandQueueWithDescriptor:v3];
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  return 0;
}

- (void)getDefaultSamplePositions:(id *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (![(_MTLDevice *)self supportsTextureSampleCount:a4])
  {
    MTLReportFailure(0, "-[_MTLDevice getDefaultSamplePositions:count:]", 5405, @"count (%lu) is not supported on this device.", v6, v7, v8, v9, v4);
    if (a3) {
      goto LABEL_3;
    }
LABEL_12:
    MTLReportFailure(0, "-[_MTLDevice getDefaultSamplePositions:count:]", 5406, @"Null provided for positions array.", v6, v7, v8, v9, v12);
    goto LABEL_3;
  }
  if (!a3) {
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v10 = &_defaultSamplePositions_1;
  switch(v4)
  {
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
      uint64_t v10 = &_defaultSamplePositions_2;
      goto LABEL_9;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      uint64_t v10 = &_defaultSamplePositions_4;
      goto LABEL_9;
    case 8uLL:
      uint64_t v10 = &_defaultSamplePositions_8;
      goto LABEL_9;
    default:
      if (v4 != 16) {
        return;
      }
      uint64_t v10 = &_defaultSamplePositions_16;
      do
      {
LABEL_9:
        $94F468A8D4C62B317260615823C2B210 v11 = ($94F468A8D4C62B317260615823C2B210)*v10++;
        *a3++ = v11;
        --v4;
      }
      while (v4);
      return;
  }
}

- (IndirectArgumentBufferCapabilities)indirectArgumentBufferCapabilities
{
  return (IndirectArgumentBufferCapabilities)0;
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  return [(_MTLDevice *)self newArgumentEncoderWithArguments:a3 structType:0];
}

- (id)newEvent
{
  return objc_alloc_init(_MTLSharedEvent);
}

- (id)newEventWithOptions:(int64_t)a3
{
  if (a3) {
    return -[_MTLDevice newSharedEventWithOptions:](self, "newSharedEventWithOptions:");
  }
  else {
    return [(_MTLDevice *)self newEvent];
  }
}

- (id)newSharedEventWithOptions:(int64_t)a3
{
  unint64_t v4 = [_MTLSharedEvent alloc];

  return [(_MTLSharedEvent *)v4 initWithOptions:a3];
}

- (id)newSharedEventWithMachPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v4 = [_MTLSharedEvent alloc];

  return [(_MTLSharedEvent *)v4 initWithMachPort:v3];
}

- (id)newLateEvalEvent
{
  return 0;
}

- (id)newSharedEvent
{
  return objc_alloc_init(_MTLSharedEvent);
}

- (id)newSharedEventWithHandle:(id)a3
{
  unint64_t v4 = [_MTLSharedEvent alloc];

  return [(_MTLSharedEvent *)v4 initWithSharedEventHandle:a3];
}

- (id)newIOCommandQueueWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v6 = [_MTLIOCommandQueue alloc];

  return [(_MTLIOCommandQueue *)v6 initWithDevice:self descriptor:a3];
}

- (id)newIOFileHandleWithURL:(id)a3 error:(id *)a4
{
  if (![a3 isFileURL])
  {
    if (a4)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x1E4F28568]];
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLIOError" code:1 userInfo:v10];
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a4]) {
    return 0;
  }
  uint64_t v7 = [_MTLIOHandleRaw alloc];
  uint64_t v8 = [a3 fileSystemRepresentation];

  return [(_MTLIOHandleRaw *)v7 initWithDevice:self path:v8 error:a4 uncached:0];
}

- (id)newIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  if (![a3 isFileURL])
  {
    if (a5)
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x1E4F28568]];
      *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLIOError" code:1 userInfo:v12];
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a5]) {
    return 0;
  }
  uint64_t v9 = [_MTLIOHandleCompressed alloc];
  uint64_t v10 = [a3 fileSystemRepresentation];

  return [(_MTLIOHandleCompressed *)v9 initWithDevice:self path:v10 compressionType:a4 error:a5 uncached:0];
}

- (id)newUncachedIOFileHandleWithURL:(id)a3 error:(id *)a4
{
  if (![a3 isFileURL])
  {
    if (a4)
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x1E4F28568]];
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLIOError" code:1 userInfo:v10];
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a4]) {
    return 0;
  }
  uint64_t v7 = [_MTLIOHandleRaw alloc];
  uint64_t v8 = [a3 fileSystemRepresentation];

  return [(_MTLIOHandleRaw *)v7 initWithDevice:self path:v8 error:a4 uncached:1];
}

- (id)newUncachedIOFileHandleWithURL:(id)a3 compressionMethod:(int64_t)a4 error:(id *)a5
{
  if (![a3 isFileURL])
  {
    if (a5)
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"URL is not a file" forKey:*MEMORY[0x1E4F28568]];
      *a5 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLIOError" code:1 userInfo:v12];
    }
    return 0;
  }
  if (![a3 checkResourceIsReachableAndReturnError:a5]) {
    return 0;
  }
  uint64_t v9 = [_MTLIOHandleCompressed alloc];
  uint64_t v10 = [a3 fileSystemRepresentation];

  return [(_MTLIOHandleCompressed *)v9 initWithDevice:self path:v10 compressionType:a4 error:a5 uncached:1];
}

- (id)akIOResourceListPool
{
  return self->_akIOResourceListPool;
}

- (unint64_t)sparseTileSizeInBytesForSparsePageSize:(int64_t)a3
{
  if ((unint64_t)(a3 - 101) > 2) {
    return 0;
  }
  else {
    return qword_1828F0938[a3 - 101];
  }
}

- (BOOL)areGPUAssertionsEnabled
{
  return self->_gpuAssertionsEnabled;
}

- (void)setGPUAssertionsEnabled:(BOOL)a3
{
  self->_gpuAssertionsEnabled = a3;
}

- (unint64_t)maxRasterizationRateLayerCount
{
  return 0;
}

- (id)newRasterizationRateMapWithScreenSize:(id *)a3 layerCount:(unint64_t)a4 layers:(const void *)a5
{
  return 0;
}

- (id)newRasterizationRateMapWithDescriptor:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v5 = [a3 layerPointer:&v11];
  long long v9 = 0uLL;
  uint64_t v10 = 0;
  if (a3) {
    [a3 screenSize];
  }
  long long v7 = v9;
  uint64_t v8 = v10;
  return [(_MTLDevice *)self newRasterizationRateMapWithScreenSize:&v7 layerCount:v11 layers:v5];
}

- (BOOL)supportsRasterizationRateMapWithLayerCount:(unint64_t)a3
{
  return a3 && [(_MTLDevice *)self maxRasterizationRateLayerCount] >= a3;
}

- (NSArray)counterSets
{
  return 0;
}

- (id)newCounterSampleBufferWithDescriptor:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)resolveCounters:(id)a3 withRange:(_NSRange)a4
{
  return 0;
}

- (void)sampleTimestamps:(unint64_t *)a3 gpuTimestamp:(unint64_t *)a4
{
  *a3 = 0;
  *a4 = 0;
}

- (BOOL)supportsCounterSampling:(unint64_t)a3
{
  return (a3 < 5) & (0x16u >> a3);
}

- (BOOL)isPlacementHeapSupported
{
  if ([(_MTLDevice *)self supportsFamily:1001]) {
    return 1;
  }

  return [(_MTLDevice *)self supportsFamily:2002];
}

- (void)convertSparsePixelRegions:(id *)a3 toTileRegions:(id *)a4 withTileSize:(id *)a5 alignmentMode:(unint64_t)a6 numRegions:(unint64_t)a7
{
  if (a5->var1 * a5->var0 * a5->var2) {
    BOOL v7 = a7 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    p_unint64_t var1 = &a3->var1;
    long long v9 = &a4->var1;
    while (a6 != 1)
    {
      if (!a6)
      {
        unint64_t var0 = a5->var0;
        unint64_t var1 = a5->var1;
        unint64_t v12 = p_var1[-1].var1 / var1;
        v9[-1].unint64_t var0 = p_var1[-1].var0 / a5->var0;
        v9[-1].unint64_t var1 = v12;
        unint64_t var2 = a5->var2;
        v9[-1].unint64_t var2 = p_var1[-1].var2 / var2;
        unint64_t v14 = (var0 + p_var1->var0 + p_var1[-1].var0 % var0 - 1) / var0;
        unint64_t v15 = (var1 + p_var1->var1 + p_var1[-1].var1 % var1 - 1) / var1;
        v9->unint64_t var0 = v14;
        v9->unint64_t var1 = v15;
        unint64_t v16 = (var2 + p_var1->var2 + p_var1[-1].var2 % var2 - 1) / var2;
LABEL_10:
        v9->unint64_t var2 = v16;
      }
      p_var1 += 2;
      v9 += 2;
      if (!--a7) {
        return;
      }
    }
    unint64_t v17 = a5->var0;
    unint64_t v18 = a5->var1;
    unint64_t v19 = (p_var1[-1].var0 + a5->var0 - 1) / a5->var0;
    unint64_t v20 = (p_var1[-1].var1 + v18 - 1) / v18;
    v9[-1].unint64_t var0 = v19;
    v9[-1].unint64_t var1 = v20;
    unint64_t v21 = p_var1[-1].var1;
    unint64_t v22 = p_var1->var1;
    unint64_t v23 = a5->var2;
    unint64_t v24 = (p_var1[-1].var2 + v23 - 1) / v23;
    unint64_t v25 = (p_var1[-1].var0 - v19 * v17 + p_var1->var0) / v17;
    v9[-1].unint64_t var2 = v24;
    v9->unint64_t var0 = v25;
    v9->unint64_t var1 = (v21 - v20 * v18 + v22) / v18;
    unint64_t v16 = (p_var1[-1].var2 - v24 * v23 + p_var1->var2) / v23;
    goto LABEL_10;
  }
}

- (void)convertSparseTileRegions:(id *)a3 toPixelRegions:(id *)a4 withTileSize:(id *)a5 numRegions:(unint64_t)a6
{
  if (a6)
  {
    p_unint64_t var1 = &a3->var1;
    BOOL v7 = &a4->var1;
    do
    {
      unint64_t var0 = a5->var0;
      unint64_t var1 = a5->var1;
      unint64_t v10 = var1 * p_var1[-1].var1;
      v7[-1].unint64_t var0 = a5->var0 * p_var1[-1].var0;
      v7[-1].unint64_t var1 = v10;
      unint64_t var2 = a5->var2;
      v7[-1].unint64_t var2 = var2 * p_var1[-1].var2;
      unint64_t v12 = p_var1->var0 * var0;
      unint64_t v13 = p_var1->var1 * var1;
      v7->unint64_t var0 = v12;
      v7->unint64_t var1 = v13;
      v7->unint64_t var2 = p_var1->var2 * var2;
      p_var1 += 2;
      v7 += 2;
      --a6;
    }
    while (a6);
  }
}

- (unint64_t)sparseTileSizeInBytes
{
  return 0x4000;
}

- (BOOL)requiresRaytracingEmulation
{
  return 1;
}

- (BOOL)supportsRaytracing
{
  if (![(_MTLDevice *)self requiresRaytracingEmulation]
    || ![(_MTLDevice *)self argumentBuffersSupport])
  {
    return 0;
  }

  return [(_MTLDevice *)self supportsFunctionPointers];
}

- (unint64_t)latestSupportedGenericBVHVersion
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation]) {
    return 260;
  }
  else {
    return 259;
  }
}

- (MTLGPUBVHBuilder)GPUBVHBuilder
{
  id result = self->_GPUBVHBuilder;
  if (!result)
  {
    os_unfair_lock_lock(&self->_GPUBVHBuilderLock);
    if (!self->_GPUBVHBuilder) {
      self->_GPUBVHBuilder = [[MTLGPUBVHBuilder alloc] initWithDevice:self];
    }
    os_unfair_lock_unlock(&self->_GPUBVHBuilderLock);
    return self->_GPUBVHBuilder;
  }
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v8 = (void *)MEMORY[0x18530C9F0]();
    long long v9 = objc_opt_class();
    if ([v9 isSubclassOfClass:objc_opt_class()])
    {
      if ([a4 instanceDescriptorType] == 2 || objc_msgSend(a4, "instanceDescriptorType") == 4) {
        uint64_t v10 = 56 * [a4 instanceCount];
      }
      else {
        uint64_t v10 = 24 * [a4 instanceCount];
      }
    }
    else
    {
      unint64_t v12 = objc_opt_class();
      if ([v12 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v13 = [a4 instanceDescriptorType];
        uint64_t v14 = [a4 maxInstanceCount];
        if (v13 == 4) {
          uint64_t v10 = 56 * v14;
        }
        else {
          uint64_t v10 = 24 * v14;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    unint64_t v15 = MTLBVHDescriptorForMTLAccelerationStructureDescriptor(a4);
    unint64_t v16 = [(_MTLDevice *)self GPUBVHBuilder];
    uint64_t v17 = [(MTLGPUBVHBuilder *)v16 getGenericBVHSizeForDescriptor:v15];
    unint64_t v18 = [(MTLGPUBVHBuilder *)v16 getBuildScratchBufferSizeForDescriptor:v15];
    unint64_t v19 = [(MTLGPUBVHBuilder *)v16 getMTLSWBVHSizeForDescriptor:a4 bvhDescriptor:v15];
    unint64_t v20 = [(MTLGPUBVHBuilder *)v16 getEncodeMTLSWBVHScratchBufferSizeForDescriptor:a4 bvhDescriptor:v15];
    unint64_t v21 = [(MTLGPUBVHBuilder *)v16 getRefitScratchBufferSizeForDescriptor:a4 bvhDescriptor:v15];
    if (v18 <= v20) {
      unint64_t v22 = v20;
    }
    else {
      unint64_t v22 = v18;
    }
    unint64_t v23 = ((v10 + ((v22 + 255) & 0xFFFFFFFFFFFFFF00) + 255) & 0xFFFFFFFFFFFFFF00) + v17;
    if (v23 <= v20) {
      unint64_t v23 = v20;
    }
    retstr->unint64_t var0 = v19;
    retstr->unint64_t var1 = v23;
    retstr->unint64_t var2 = v21;
  }
  else
  {
    id result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[(_MTLDevice *)self doesNotRecognizeSelector:a3];
    retstr->unint64_t var0 = 0;
    retstr->unint64_t var1 = 0;
    retstr->unint64_t var2 = 0;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  return 0;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  if (self) {
    [(_MTLDevice *)self accelerationStructureSizesWithDescriptor:a3];
  }
  return [(_MTLDevice *)self newAccelerationStructureWithSize:0];
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v6 = [(_MTLDevice *)self GPUBVHBuilder];
    return [(MTLGPUBVHBuilder *)v6 isCompatibleWithAccelerationStructure:a3];
  }
  else
  {
    [(_MTLDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  return 0;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return 0;
}

- (void)deserializePrimitiveAccelerationStructureFromBytes:(const void *)a3 toBuffer:(id)a4 forAccelerationStructure:(id)a5
{
  BOOL v7 = (void *)[a4 contents];
  memcpy(v7, (char *)a3 + 24, *((void *)a3 + 2));
  v7[16] = [a5 accelerationStructureUniqueIdentifier];
}

- (void)deserializeInstanceAccelerationStructureFromBytes:(const void *)a3 toBuffer:(id)a4 primitiveAccelerationStructures:(id)a5 forAccelerationStructure:(id)a6
{
  long long v9 = (void *)[a4 contents];
  uint64_t v10 = (char *)a3 + 24;
  memcpy(v9, (char *)a3 + 24, *((void *)a3 + 2));
  uint64_t v11 = *((unsigned int *)a3 + 14);
  uint64_t v12 = *((void *)a3 + 16);
  uint64_t v13 = *((unsigned int *)a3 + 52);
  uint64_t v24 = *((void *)a3 + 27);
  uint64_t v14 = [a4 contents];
  if (v11)
  {
    unint64_t v15 = (void *)(v14 + v9[13]);
    unint64_t v16 = &v10[v12];
    do
    {
      unsigned int v17 = *(_DWORD *)v16;
      v16 += 4;
      unint64_t v18 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v17), "buffer");
      uint64_t v19 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v17), "bufferOffset");
      *v15++ = [v18 gpuAddress] + v19;
      --v11;
    }
    while (v11);
  }
  uint64_t v20 = [a4 contents];
  if (v13)
  {
    unint64_t v21 = &v10[v24];
    unint64_t v22 = (void *)(v20 + v9[24]);
    do
    {
      unsigned int v23 = *(_DWORD *)v21;
      v21 += 4;
      *v22++ = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v23), "gpuResourceID");
      --v13;
    }
    while (v13);
  }
  v9[16] = [a6 accelerationStructureUniqueIdentifier];
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  if (![(_MTLDevice *)self requiresRaytracingEmulation])
  {
    [(_MTLDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
  uint64_t v7 = [(_MTLDevice *)self newBufferWithLength:*((void *)a3 + 2) options:0];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = (void *)v7;
  id v9 = [(_MTLDevice *)self newAccelerationStructureWithBuffer:v7 offset:0];
  [(_MTLDevice *)self deserializePrimitiveAccelerationStructureFromBytes:a3 toBuffer:v8 forAccelerationStructure:v9];

  return v9;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  if (![(_MTLDevice *)self requiresRaytracingEmulation])
  {
    [(_MTLDevice *)self doesNotRecognizeSelector:a2];
    return 0;
  }
  uint64_t v9 = [(_MTLDevice *)self newBufferWithLength:*((void *)a3 + 2) options:0];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = (void *)v9;
  id v11 = [(_MTLDevice *)self newAccelerationStructureWithBuffer:v9 offset:0];

  [(_MTLDevice *)self deserializeInstanceAccelerationStructureFromBytes:a3 toBuffer:v10 primitiveAccelerationStructures:a4 forAccelerationStructure:v11];
  return v11;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  return 0;
}

- (void)deserializePrimitiveAccelerationStructure:(id)a3 fromBytes:(const void *)a4 withDescriptor:(id)a5
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v9 = [a3 buffer];
    [(_MTLDevice *)self deserializePrimitiveAccelerationStructureFromBytes:a4 toBuffer:v9 forAccelerationStructure:a3];
  }
  else
  {
    [(_MTLDevice *)self doesNotRecognizeSelector:a2];
  }
}

- (void)deserializeInstanceAccelerationStructure:(id)a3 fromBytes:(const void *)a4 primitiveAccelerationStructures:(id)a5 withDescriptor:(id)a6
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    uint64_t v11 = [a3 buffer];
    [(_MTLDevice *)self deserializeInstanceAccelerationStructureFromBytes:a4 toBuffer:v11 primitiveAccelerationStructures:a5 forAccelerationStructure:a3];
  }
  else
  {
    [(_MTLDevice *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setPluginData:(id)a3
{
  pluginData = self->_pluginData;
  if (pluginData != a3)
  {

    self->_pluginData = (NSDictionary *)[a3 copy];
  }
}

- (id)newProfileWithExecutionSize:(unint64_t)a3
{
  return 0;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithSize:(unint64_t)a3
{
  if ([(_MTLDevice *)self requiresRaytracingEmulation])
  {
    unint64_t v6 = [(_MTLDevice *)self heapBufferSizeAndAlignWithLength:a3 options:32];
  }
  else
  {
    [(_MTLDevice *)self doesNotRecognizeSelector:a2];
    unint64_t v7 = 0;
    unint64_t v6 = 0;
  }
  result.unint64_t var1 = v7;
  result.unint64_t var0 = v6;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapAccelerationStructureSizeAndAlignWithDescriptor:(id)a3
{
  if (self) {
    [(_MTLDevice *)self accelerationStructureSizesWithDescriptor:a3];
  }
  unint64_t v4 = [(_MTLDevice *)self heapAccelerationStructureSizeAndAlignWithSize:0];
  result.unint64_t var1 = v5;
  result.unint64_t var0 = v4;
  return result;
}

- (id)newPerformanceStateAssertion:(int64_t)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Device does not support performance state assertion feature";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  if (a4) {
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"MTLPerformanceStateAssertionDomain" code:1 userInfo:v5];
  }
  return 0;
}

- (int64_t)currentPerformanceState
{
  return 0;
}

- (id)lookupRecompiledBinaryArchive:(id)a3
{
  if (self->_isFirstParty || !self->_enableAssetUpgraderDaemon || self->_isPlugin) {
    return 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___MTLDevice_lookupRecompiledBinaryArchive___block_invoke;
  block[3] = &unk_1E521F9E8;
  block[4] = self;
  if (-[_MTLDevice lookupRecompiledBinaryArchive:]::onceToken != -1) {
    dispatch_once(&-[_MTLDevice lookupRecompiledBinaryArchive:]::onceToken, block);
  }
  if (!self->_recompiledBinaryArchiveMap) {
    return 0;
  }
  uint64_t v7 = [(_MTLDevice *)self targetDeviceArchitecture];
  uint64_t v8 = (void *)MTLResolveFileURL((NSURL *)a3);
  uint64_t v9 = v8;
  uint64_t v3 = 0;
  if (v8 && v7)
  {
    recompiledBinaryArchiveMap = self->_recompiledBinaryArchiveMap;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 fileSystemRepresentation]);
    [(MTLTargetDeviceArchitecture *)v7 cpuType];
    [(MTLTargetDeviceArchitecture *)v7 subType];
    MTLArchiveMapDB::read((MTLVersionedDB *)recompiledBinaryArchiveMap, (uint64_t)__p, v17);
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    unint64_t v11 = v18;
    unsigned __int8 v12 = v18;
    if ((v18 & 0x80u) != 0) {
      unint64_t v11 = (unint64_t)v17[1];
    }
    if (v11)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1CB10]);
      if ((v18 & 0x80u) == 0) {
        uint64_t v14 = v17;
      }
      else {
        uint64_t v14 = (void **)v17[0];
      }
      uint64_t v3 = objc_msgSend(v13, "initFileURLWithPath:", objc_msgSend(NSString, "stringWithCString:", v14));
      unsigned __int8 v12 = v18;
    }
    else
    {
      uint64_t v3 = 0;
    }
    if ((v12 & 0x80) != 0) {
      operator delete(v17[0]);
    }
  }

  return v3;
}

- (void)recordBinaryArchiveUsage:(id)a3
{
  if (!self->_isFirstParty && self->_enableAssetUpgraderDaemon && !self->_isPlugin)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39___MTLDevice_recordBinaryArchiveUsage___block_invoke;
    block[3] = &unk_1E521F9E8;
    block[4] = self;
    if (-[_MTLDevice recordBinaryArchiveUsage:]::onceToken != -1) {
      dispatch_once(&-[_MTLDevice recordBinaryArchiveUsage:]::onceToken, block);
    }
    if (self->_binaryArchiveUsage)
    {
      uint64_t v5 = [(_MTLDevice *)self targetDeviceArchitecture];
      unint64_t v6 = (void *)MTLResolveFileURL((NSURL *)a3);
      uint64_t v7 = v6;
      if (a3 && v5)
      {
        binaryArchiveUsage = self->_binaryArchiveUsage;
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 fileSystemRepresentation]);
        MTLArchiveUsageDB::store((MTLVersionedDB *)binaryArchiveUsage, (UsagePayload *)__p, [(MTLTargetDeviceArchitecture *)v5 cpuType], [(MTLTargetDeviceArchitecture *)v5 subType], 0);
        if (v10 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }
}

- (id)architecture
{
  id result = self->_architecture;
  if (!result)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26___MTLDevice_architecture__block_invoke;
    block[3] = &unk_1E521F9E8;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    return self->_architecture;
  }
  return result;
}

- (id)getMostCompatibleArchitecture:(id)a3
{
  uint64_t v3 = [[MTLArchitecture alloc] initWithCPUType:0 cpuSubtype:0];

  return v3;
}

- (BOOL)setCompilerProcessesCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v4 = [(_MTLDevice *)self getCompilerConnectionManager:_MTLGetMTLCompilerLLVMVersionForDevice(self)];
  if ((int)v3 < 1) {
    return 0;
  }
  uint64_t v5 = v4;
  if (v4->var2) {
    return 0;
  }
  if ((int)MTLGetMaximumCompilerProcessesCount() <= (int)v3) {
    uint64_t v3 = MTLGetMaximumCompilerProcessesCount();
  }
  (*((void (**)(MTLCompilerConnectionManager *, uint64_t))v5->var0 + 4))(v5, v3);
  return 1;
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  if (![(_MTLDevice *)self requiresRaytracingEmulation]) {
    return 0;
  }
  uint64_t maxAccelerationStructureLevels = self->_limits.maxAccelerationStructureLevels;

  return +[MTLGPUBVHBuilder getMaxAccelerationStructureTraversalDepth:maxAccelerationStructureLevels];
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  return 0;
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  id v6 = [(_MTLDevice *)self allocResidencySet];
  if ([v6 initWithDevice:self descriptor:a3]) {
    return v6;
  }
  else {
    return 0;
  }
}

- (id)allocResidencySet
{
  return 0;
}

- (MTLLogState)defaultLogState
{
  return self->_defaultLogState;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (BOOL)shaderDebugInfoCaching
{
  return self->_shaderDebugInfoCaching;
}

- (void)setShaderDebugInfoCaching:(BOOL)a3
{
  self->_shaderDebugInfoCaching = a3;
}

- (BOOL)areWritableHeapsEnabled
{
  return self->_writableHeapsEnabled;
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  self->_writableHeapsEnabled = a3;
}

- (void)setCommandBufferErrorOptions:(unint64_t)a3
{
  self->_commandBufferErrorOptions = a3;
}

- (id)newLibraryWithFunctionArray:(id)a3 error:(id *)a4
{
  if (!a3) {
    MTLReportFailure(0, "-[_MTLDevice(MTLDeviceInternal) newLibraryWithFunctionArray:error:]", 6891, @"Array must be not nil", v4, v5, v6, v7, v22);
  }
  if ([a3 count])
  {
    if (!a3) {
      goto LABEL_10;
    }
  }
  else
  {
    MTLReportFailure(0, "-[_MTLDevice(MTLDeviceInternal) newLibraryWithFunctionArray:error:]", 6892, @"Array must not be emty", v11, v12, v13, v14, v22);
    if (!a3) {
      goto LABEL_10;
    }
  }
  if ([a3 count])
  {
    libraryBuilder = self->_libraryBuilder;
    return MTLLibraryBuilder::newLibraryWithFunctionArray((uint64_t)libraryBuilder, self, a3, a4, v15, v16, v17, v18);
  }
LABEL_10:
  if (a4)
  {
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Array cannot be nil or emty" forKey:*MEMORY[0x1E4F28568]];
    *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:2 userInfo:v21];
  }
  return 0;
}

@end