@interface _MTLDeviceFeatureQueries
- (BOOL)familySupports2DLinearTexArraySPI;
- (BOOL)familySupports32BitFloatFiltering;
- (BOOL)familySupports32BitMSAA;
- (BOOL)familySupports32bpcMSAATextures;
- (BOOL)familySupports3DASTCTextures;
- (BOOL)familySupports3DBCTextures;
- (BOOL)familySupportsASTCHDRTextureCompression;
- (BOOL)familySupportsASTCTextureCompression;
- (BOOL)familySupportsAlphaYUVFormats;
- (BOOL)familySupportsAnisoSampleFix;
- (BOOL)familySupportsArgumentBuffers;
- (BOOL)familySupportsArgumentBuffersTier2;
- (BOOL)familySupportsArrayOfSamplers;
- (BOOL)familySupportsArrayOfTextures;
- (BOOL)familySupportsAtomicUlongVoidMinMax;
- (BOOL)familySupportsBCTextureCompression;
- (BOOL)familySupportsBGR10A2;
- (BOOL)familySupportsBaseVertexInstanceDrawing;
- (BOOL)familySupportsBfloat16Buffers;
- (BOOL)familySupportsBfloat16Format;
- (BOOL)familySupportsBinaryArchives;
- (BOOL)familySupportsBinaryLibraries;
- (BOOL)familySupportsBlackOrWhiteSamplerBorderColors;
- (BOOL)familySupportsBufferBoundsChecking;
- (BOOL)familySupportsBufferPrefetchStatistics;
- (BOOL)familySupportsBufferWithAddressRanges;
- (BOOL)familySupportsBufferWithIOSurface;
- (BOOL)familySupportsBufferlessClientStorageTexture;
- (BOOL)familySupportsCMPIndirectCommandBuffers;
- (BOOL)familySupportsColorSpaceConversionMatrixSelection;
- (BOOL)familySupportsCombinedMSAAStoreAndResolveAction;
- (BOOL)familySupportsCommandBufferJump;
- (BOOL)familySupportsCompressedTextureViewSPI;
- (BOOL)familySupportsComputeCompressedTextureWrite;
- (BOOL)familySupportsComputeMemoryBarrier;
- (BOOL)familySupportsConcurrentComputeDispatch;
- (BOOL)familySupportsConditionalLoadStore;
- (BOOL)familySupportsCountingOcclusionQuery;
- (BOOL)familySupportsCustomBorderColor;
- (BOOL)familySupportsDeadlineProfile;
- (BOOL)familySupportsDepthClipMode;
- (BOOL)familySupportsDepthClipModeClampExtended;
- (BOOL)familySupportsDeviceCoherency;
- (BOOL)familySupportsDevicePartitioning;
- (BOOL)familySupportsDynamicAttributeStride;
- (BOOL)familySupportsDynamicControlPointCount;
- (BOOL)familySupportsDynamicLibraries;
- (BOOL)familySupportsExplicitVisibilityGroups;
- (BOOL)familySupportsExtendedSamplerLODBiasRange;
- (BOOL)familySupportsExtendedVertexFormats;
- (BOOL)familySupportsExtendedXR10Formats;
- (BOOL)familySupportsExtendedYUVFormats;
- (BOOL)familySupportsFP32TessFactors;
- (BOOL)familySupportsFastMathInfNaNPropagation;
- (BOOL)familySupportsFillTexture;
- (BOOL)familySupportsFixedLinePointFillDepthGradient;
- (BOOL)familySupportsFloat16BCubicFiltering;
- (BOOL)familySupportsFloat16InfNanFiltering;
- (BOOL)familySupportsForceSeamsOnCubemaps;
- (BOOL)familySupportsForkJoin;
- (BOOL)familySupportsFragmentBufferWrites;
- (BOOL)familySupportsFragmentOnlyEncoders;
- (BOOL)familySupportsFunctionPointers;
- (BOOL)familySupportsFunctionPointersFromMesh;
- (BOOL)familySupportsFunctionPointersFromRender;
- (BOOL)familySupportsGFXIndirectCommandBuffers;
- (BOOL)familySupportsGPUStatistics;
- (BOOL)familySupportsGlobalVariableBindingInDylibs;
- (BOOL)familySupportsGlobalVariableBindings;
- (BOOL)familySupportsGlobalVariableRelocation;
- (BOOL)familySupportsGlobalVariableRelocationCompute;
- (BOOL)familySupportsGlobalVariableRelocationRender;
- (BOOL)familySupportsHeapAccelerationStructureAllocation;
- (BOOL)familySupportsHeapWithAddressRanges;
- (BOOL)familySupportsIABHashForTools;
- (BOOL)familySupportsImageBlockSampleCoverageControl;
- (BOOL)familySupportsImageBlocks;
- (BOOL)familySupportsIndirectDrawAndDispatch;
- (BOOL)familySupportsIndirectStageInRegion;
- (BOOL)familySupportsIndirectTessellation;
- (BOOL)familySupportsIndirectTextures;
- (BOOL)familySupportsIndirectWritableTextures;
- (BOOL)familySupportsInt64;
- (BOOL)familySupportsInterchangeTiled;
- (BOOL)familySupportsInvariantVertexPosition;
- (BOOL)familySupportsLargeFramebufferConfigs;
- (BOOL)familySupportsLateEvalEvent;
- (BOOL)familySupportsLayeredRendering;
- (BOOL)familySupportsLimitedYUVFormats;
- (BOOL)familySupportsLinearTexture2DArray;
- (BOOL)familySupportsLinearTextureFromSharedBuffer;
- (BOOL)familySupportsLossyCompression;
- (BOOL)familySupportsMSAADepthResolve;
- (BOOL)familySupportsMSAADepthResolveFilter;
- (BOOL)familySupportsMSAAStencilResolve;
- (BOOL)familySupportsMSAAStencilResolveFilter;
- (BOOL)familySupportsMemoryOrderAtomics;
- (BOOL)familySupportsMemorylessRenderTargets;
- (BOOL)familySupportsMeshRenderDynamicLibraries;
- (BOOL)familySupportsMeshShaders;
- (BOOL)familySupportsMeshShadersInICB;
- (BOOL)familySupportsMipLevelsSmallerThanBlockSize;
- (BOOL)familySupportsMirrorClampToEdgeSamplerMode;
- (BOOL)familySupportsMutableTier1ArgumentBuffers;
- (BOOL)familySupportsNativeHardwareFP16;
- (BOOL)familySupportsNonPrivateDepthStencilTextures;
- (BOOL)familySupportsNonPrivateMSAATextures;
- (BOOL)familySupportsNonSquareTileShaders;
- (BOOL)familySupportsNonUniformThreadgroupSize;
- (BOOL)familySupportsNonZeroTextureWriteLOD;
- (BOOL)familySupportsNorm16BCubicFiltering;
- (BOOL)familySupportsOpenCLTextureWriteSwizzles;
- (BOOL)familySupportsPacked32TextureBufferWrites;
- (BOOL)familySupportsPartialRenderMemoryBarrier;
- (BOOL)familySupportsPerPlaneCompression;
- (BOOL)familySupportsPerformanceStateAssertion;
- (BOOL)familySupportsPipelineLibraries;
- (BOOL)familySupportsPlacementHeaps;
- (BOOL)familySupportsPostDepthCoverage;
- (BOOL)familySupportsPrimitiveMotionBlur;
- (BOOL)familySupportsPrimitiveRestartOverride;
- (BOOL)familySupportsProgrammableBlending;
- (BOOL)familySupportsProgrammableSamplePositions;
- (BOOL)familySupportsPublicXR10Formats;
- (BOOL)familySupportsPullModelInterpolation;
- (BOOL)familySupportsQuadGroup;
- (BOOL)familySupportsQuadReduction;
- (BOOL)familySupportsQuadShufflesAndBroadcast;
- (BOOL)familySupportsQueryTextureLOD;
- (BOOL)familySupportsRGBA10A2Gamma;
- (BOOL)familySupportsRTZRounding;
- (BOOL)familySupportsRasterOrderGroups;
- (BOOL)familySupportsRasterOrderGroupsColorAttachment;
- (BOOL)familySupportsRayTracingAccelerationStructureCPUDeserialization;
- (BOOL)familySupportsRayTracingBuffersFromTables;
- (BOOL)familySupportsRayTracingCurves;
- (BOOL)familySupportsRayTracingDirectIntersectionResultAccess;
- (BOOL)familySupportsRayTracingExtendedVertexFormats;
- (BOOL)familySupportsRayTracingGPUTableUpdateBuffers;
- (BOOL)familySupportsRayTracingICBs;
- (BOOL)familySupportsRayTracingIndirectInstanceAccelerationStructureBuild;
- (BOOL)familySupportsRayTracingMatrixLayout;
- (BOOL)familySupportsRayTracingMultiLevelInstancing;
- (BOOL)familySupportsRayTracingPerComponentMotionInterpolation;
- (BOOL)familySupportsRayTracingPerPrimitiveData;
- (BOOL)familySupportsRayTracingTraversalMetrics;
- (BOOL)familySupportsRaytracingFromRender;
- (BOOL)familySupportsReadWriteBufferArguments;
- (BOOL)familySupportsReadWriteTextureArguments;
- (BOOL)familySupportsReadWriteTextureArgumentsTier2;
- (BOOL)familySupportsReadWriteTextureCubeArguments;
- (BOOL)familySupportsRelaxedTextureViewRequirements;
- (BOOL)familySupportsRenderDynamicLibraries;
- (BOOL)familySupportsRenderMemoryBarrier;
- (BOOL)familySupportsRenderPassWithoutRenderTarget;
- (BOOL)familySupportsRenderTargetTextureRotation;
- (BOOL)familySupportsRenderTextureWrites;
- (BOOL)familySupportsRenderToLinearTextures;
- (BOOL)familySupportsResourceDetachBacking;
- (BOOL)familySupportsResourceHeaps;
- (BOOL)familySupportsSIMDGroup;
- (BOOL)familySupportsSIMDGroupMatrix;
- (BOOL)familySupportsSIMDReduction;
- (BOOL)familySupportsSIMDShuffleAndFill;
- (BOOL)familySupportsSIMDShufflesAndBroadcast;
- (BOOL)familySupportsSRGBwrites;
- (BOOL)familySupportsSamplerAddressModeClampToHalfBorder;
- (BOOL)familySupportsSamplerCompareFunction;
- (BOOL)familySupportsSeparateDepthStencil;
- (BOOL)familySupportsSeparateVisibilityAndShadingRate;
- (BOOL)familySupportsSetThreadgroupPackingDisabled;
- (BOOL)familySupportsShaderBarycentricCoordinates;
- (BOOL)familySupportsShaderLODAverage;
- (BOOL)familySupportsShaderMinLODClamp;
- (BOOL)familySupportsSharedFunctionTables;
- (BOOL)familySupportsSharedStorageHeapResources;
- (BOOL)familySupportsSharedStorageTextures;
- (BOOL)familySupportsSharedTextureHandles;
- (BOOL)familySupportsSparseDepthAttachments;
- (BOOL)familySupportsSparseHeaps;
- (BOOL)familySupportsSparseTextures;
- (BOOL)familySupportsStackOverflowErrorCode;
- (BOOL)familySupportsStatefulDynamicLibraries;
- (BOOL)familySupportsStencilFeedback;
- (BOOL)familySupportsStreamingCodecSignaling;
- (BOOL)familySupportsTLS;
- (BOOL)familySupportsTessellation;
- (BOOL)familySupportsTexture2DMultisampleArray;
- (BOOL)familySupportsTextureCubeArray;
- (BOOL)familySupportsTextureOutOfBoundsReads;
- (BOOL)familySupportsTextureSwizzle;
- (BOOL)familySupportsTileShaders;
- (BOOL)familySupportsUnalignedVertexFetch;
- (BOOL)familySupportsVariableRateRasterization;
- (BOOL)familySupportsVertexAmplification;
- (BOOL)familySupportsViewportAndScissorArray;
- (BOOL)familySupportsVirtualSubstreams;
- (BOOL)familySupportsWritableArrayOfTextures;
- (BOOL)familySupportsYCBCRFormats;
- (BOOL)familySupportsYCBCRFormats12;
- (BOOL)familySupportsYCBCRFormatsPQ;
- (BOOL)familySupportsYCBCRFormatsXR;
- (BOOL)familySupportsYCBCRPackedFormats12;
- (BOOL)familySupportsYCBCRPackedFormatsPQ;
- (BOOL)familySupportsYCBCRPackedFormatsXR;
- (BOOL)supportForFeature:(int64_t)a3;
- (_MTLDeviceFeatureQueries)initWithDevice:(id)a3;
- (id)nameForFeature:(int64_t)a3;
- (int64_t)requirementForFeature:(int64_t)a3;
@end

@implementation _MTLDeviceFeatureQueries

- (BOOL)familySupportsExtendedXR10Formats
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsReadWriteTextureArgumentsTier2
{
  return (unint64_t)[(MTLDeviceSPI *)self->_device readWriteTextureSupport] > 1;
}

- (BOOL)familySupportsNonPrivateMSAATextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsNonPrivateDepthStencilTextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsBfloat16Buffers
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsUnalignedVertexFetch
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsGlobalVariableRelocationCompute
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsSeparateVisibilityAndShadingRate
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsRenderPassWithoutRenderTarget
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsSeparateDepthStencil
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsTextureSwizzle
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (_MTLDeviceFeatureQueries)initWithDevice:(id)a3
{
  v419.receiver = self;
  v419.super_class = (Class)_MTLDeviceFeatureQueries;
  v4 = [(_MTLDeviceFeatureQueries *)&v419 init];
  v5 = v4;
  if (v4)
  {
    v4->_device = (MTLDeviceSPI *)a3;
    uint64_t v6 = [a3 featureProfile];
    char v7 = 1;
    if (v6 > 9999)
    {
      if (v6 > 19999)
      {
        if (v6 != 20000 && v6 != 30000 && v6 != 30002) {
          goto LABEL_13;
        }
      }
      else
      {
        if ((unint64_t)(v6 - 10000) >= 3)
        {
LABEL_13:
          char v105 = [a3 supportsBufferlessClientStorageTexture];
          char v104 = [a3 supportsComputeMemoryBarrier];
          char v103 = [a3 supportsRenderMemoryBarrier];
          char v102 = [a3 supportsPartialRenderMemoryBarrier];
          char v101 = [a3 supportsArgumentBuffersTier2];
          char v100 = [a3 supportsReadWriteTextureArgumentsTier2];
          char v99 = [a3 supportsStreamingCodecSignaling];
          char v98 = [a3 supportsProgrammableSamplePositions];
          char v97 = [a3 supportsLargeFramebufferConfigs];
          char v96 = [a3 supportsCustomBorderColor];
          char v95 = [a3 supportsSamplerAddressModeClampToHalfBorder];
          char v94 = [a3 supportsBCTextureCompression];
          char v93 = [a3 supports3DBCTextures];
          char v92 = [a3 supportsRGBA10A2Gamma];
          char v91 = [a3 supportsBGR10A2];
          char v90 = [a3 supportsPrimitiveRestartOverride];
          char v89 = [a3 supportsGlobalVariableRelocation];
          char v88 = [a3 supportsGlobalVariableRelocationRender];
          char v87 = [a3 supportsGlobalVariableRelocationCompute];
          char v86 = [a3 supportsTLS];
          char v85 = [a3 supportsGlobalVariableBindings];
          char v84 = [a3 supportsGlobalVariableBindingInDylibs];
          char v83 = [a3 supports32bpcMSAATextures];
          char v82 = [a3 supports32BitMSAA];
          char v81 = [a3 supports32BitFloatFiltering];
          char v80 = [a3 supportsQueryTextureLOD];
          char v79 = [a3 supportsVertexAmplification];
          char v78 = [a3 supportsPlacementHeaps];
          char v77 = [a3 supportsOpenCLTextureWriteSwizzles];
          char v76 = [a3 supportsPullModelInterpolation];
          char v75 = [a3 supportsInt64];
          char v73 = [a3 supportsFixedLinePointFillDepthGradient];
          char v72 = [a3 supportsLateEvalEvent];
          char v71 = [a3 supportsNonZeroTextureWriteLOD];
          char v69 = [a3 supportsSharedTextureHandles];
          char v68 = [a3 supportsBufferPrefetchStatistics];
          char v66 = [a3 supportsLimitedYUVFormats];
          char v65 = [a3 supportsNonPrivateDepthStencilTextures];
          char v64 = [a3 supportsNonPrivateMSAATextures];
          char v62 = [a3 supportsSharedStorageHeapResources];
          char v61 = [a3 supportsSharedStorageTextures];
          char v60 = [a3 supportsLinearTextureFromSharedBuffer];
          char v59 = [a3 supportsPipelineLibraries];
          char v58 = [a3 supportsFragmentOnlyEncoders];
          char v57 = [a3 supportsBufferWithIOSurface];
          char v56 = [a3 supportsProgrammableBlending];
          char v55 = [a3 supportsRenderToLinearTextures];
          char v54 = [a3 supportsMemorylessRenderTargets];
          char v53 = [a3 supportsFastMathInfNaNPropagation];
          char v52 = [a3 supportsInvariantVertexPosition];
          char v51 = [a3 supportsShaderLODAverage];
          char v50 = [a3 supportsRelaxedTextureViewRequirements];
          char v49 = [a3 supportsSeparateDepthStencil];
          char v48 = [a3 supportsGPUStatistics];
          char v47 = [a3 supportsCompressedTextureViewSPI];
          char v45 = [a3 supportsRenderTargetTextureRotation];
          char v44 = [a3 supportsDynamicControlPointCount];
          char v43 = [a3 supportsIABHashForTools];
          char v42 = [a3 supportsBinaryArchives];
          char v41 = [a3 supportsBinaryLibraries];
          char v40 = [a3 supportsDeadlineProfile];
          char v46 = [a3 supportsFillTexture];
          char v213 = [a3 supportsSetThreadgroupPackingDisabled];
          char v212 = [a3 supportsASTCTextureCompression];
          char v211 = [a3 supportsExtendedYUVFormats];
          char v210 = [a3 supportsPublicXR10Formats];
          char v209 = [a3 supportsSRGBwrites];
          char v208 = [a3 supportsDepthClipMode];
          char v206 = [a3 supportsResourceHeaps];
          char v207 = [a3 supportsArgumentBuffers];
          char v205 = [a3 supportsPacked32TextureBufferWrites];
          char v204 = [a3 supports3DASTCTextures];
          char v203 = [a3 supportsExtendedXR10Formats];
          char v202 = [a3 supportsFragmentBufferWrites];
          char v201 = [a3 supportsCountingOcclusionQuery];
          char v200 = [a3 supportsBaseVertexInstanceDrawing];
          char v199 = [a3 supportsIndirectDrawAndDispatch];
          char v198 = [a3 supportsTessellation];
          char v197 = [a3 supportsReadWriteBufferArguments];
          char v196 = [a3 supportsArrayOfTextures];
          char v195 = [a3 supportsArrayOfSamplers];
          char v194 = [a3 supportsCombinedMSAAStoreAndResolveAction];
          char v193 = [a3 supportsMutableTier1ArgumentBuffers];
          char v192 = [a3 supportsSamplerCompareFunction];
          char v191 = [a3 supportsMSAADepthResolve];
          char v190 = [a3 supportsMSAAStencilResolve];
          char v189 = [a3 supportsMSAADepthResolveFilter];
          char v188 = [a3 supportsGFXIndirectCommandBuffers];
          char v187 = [a3 supportsCMPIndirectCommandBuffers];
          char v186 = [a3 supportsIndirectStageInRegion];
          char v184 = [a3 supportsIndirectTextures];
          char v183 = [a3 supportsNorm16BCubicFiltering];
          char v182 = [a3 supportsTextureOutOfBoundsReads];
          char v181 = [a3 supportsTextureSwizzle];
          char v180 = [a3 supportsAlphaYUVFormats];
          char v179 = [a3 supportsMemoryOrderAtomics];
          char v178 = [a3 supportsQuadGroup];
          char v177 = [a3 supportsRenderTextureWrites];
          char v176 = [a3 supportsImageBlocks];
          char v172 = [a3 supportsTileShaders];
          char v164 = [a3 supportsImageBlockSampleCoverageControl];
          char v161 = [a3 supportsNativeHardwareFP16];
          char v168 = [a3 supportsPostDepthCoverage];
          char v167 = [a3 supportsMipLevelsSmallerThanBlockSize];
          char v166 = [a3 supportsNonUniformThreadgroupSize];
          char v163 = [a3 supportsReadWriteTextureArguments];
          char v174 = [a3 supportsReadWriteTextureCubeArguments];
          char v171 = [a3 supportsTextureCubeArray];
          char v165 = [a3 supportsQuadShufflesAndBroadcast];
          char v185 = [a3 supportsConcurrentComputeDispatch];
          char v170 = [a3 supportsRenderPassWithoutRenderTarget];
          char v162 = [a3 supportsRasterOrderGroups];
          char v175 = [a3 supportsRasterOrderGroupsColorAttachment];
          char v173 = [a3 supportsDynamicAttributeStride];
          char v169 = [a3 supportsLinearTexture2DArray];
          char v160 = [a3 supportsNonSquareTileShaders];
          char v159 = [a3 supportsSeparateVisibilityAndShadingRate];
          char v158 = [a3 supports2DLinearTexArraySPI];
          char v157 = [a3 supportsLayeredRendering];
          char v156 = [a3 supportsViewportAndScissorArray];
          char v155 = [a3 supportsIndirectTessellation];
          char v154 = [a3 supportsMSAAStencilResolveFilter];
          char v153 = [a3 supportsStencilFeedback];
          char v152 = [a3 supportsFP32TessFactors];
          char v151 = [a3 supportsUnalignedVertexFetch];
          char v150 = [a3 supportsExtendedVertexFormats];
          char v149 = [a3 supportsResourceDetachBacking];
          char v148 = [a3 supportsBufferWithAddressRanges];
          char v147 = [a3 supportsHeapWithAddressRanges];
          char v146 = [a3 supportsSIMDGroup];
          char v144 = [a3 supportsShaderMinLODClamp];
          char v141 = [a3 supportsSIMDShufflesAndBroadcast];
          char v138 = [a3 supportsWritableArrayOfTextures];
          char v135 = [a3 supportsVariableRateRasterization];
          char v131 = [a3 supportsYCBCRFormats];
          char v128 = [a3 supportsYCBCRFormatsPQ];
          char v125 = [a3 supportsYCBCRFormats12];
          char v122 = [a3 supportsYCBCRFormatsXR];
          char v118 = [a3 supportsASTCHDRTextureCompression];
          char v115 = [a3 supportsSparseTextures];
          char v112 = [a3 supportsSparseHeaps];
          char v145 = [a3 supportsIndirectWritableTextures];
          char v143 = [a3 supportsFunctionPointers];
          char v142 = [a3 supportsDynamicLibraries];
          char v140 = [a3 supportsStatefulDynamicLibraries];
          char v139 = [a3 supportsRenderDynamicLibraries];
          char v137 = [a3 supportsFunctionPointersFromRender];
          char v136 = [a3 supportsSharedFunctionTables];
          char v134 = [a3 supportsRaytracingFromRender];
          char v133 = [a3 supportsPrimitiveMotionBlur];
          char v132 = [a3 supportsRayTracingExtendedVertexFormats];
          char v130 = [a3 supportsHeapAccelerationStructureAllocation];
          char v129 = [a3 supportsRayTracingPerPrimitiveData];
          char v127 = [a3 supportsRayTracingTraversalMetrics];
          char v126 = [a3 supportsRayTracingBuffersFromTables];
          char v124 = [a3 supportsRayTracingAccelerationStructureCPUDeserialization];
          char v123 = [a3 supportsRayTracingMultiLevelInstancing];
          char v121 = [a3 supportsRayTracingIndirectInstanceAccelerationStructureBuild];
          char v120 = [a3 supportsRayTracingGPUTableUpdateBuffers];
          char v119 = [a3 supportsRayTracingCurves];
          char v117 = [a3 supportsShaderBarycentricCoordinates];
          char v116 = [a3 supportsBlackOrWhiteSamplerBorderColors];
          char v114 = [a3 supportsMirrorClampToEdgeSamplerMode];
          char v113 = [a3 supportsSIMDReduction];
          char v111 = [a3 supportsDepthClipModeClampExtended];
          char v110 = [a3 supportsTexture2DMultisampleArray];
          char v109 = [a3 supportsForceSeamsOnCubemaps];
          char v108 = [a3 supportsFloat16BCubicFiltering];
          char v106 = [a3 supportsFloat16InfNanFiltering];
          char v107 = [a3 supportsRTZRounding];
          char v8 = [a3 supportsAnisoSampleFix];
          char v9 = [a3 supportsYCBCRPackedFormatsPQ];
          char v12 = [a3 supportsYCBCRPackedFormats12];
          char v13 = [a3 supportsYCBCRPackedFormatsXR];
          char v14 = [a3 supportsBufferBoundsChecking];
          char v15 = [a3 supportsForkJoin];
          char v16 = [a3 supportsDevicePartitioning];
          char v17 = [a3 supportsComputeCompressedTextureWrite];
          char v18 = [a3 supportsSIMDGroupMatrix];
          char v19 = [a3 supportsInterchangeTiled];
          char v20 = [a3 supportsQuadReduction];
          char v21 = [a3 supportsVirtualSubstreams];
          char v22 = [a3 supportsSIMDShuffleAndFill];
          char v23 = [a3 supportsBfloat16Format];
          char v24 = [a3 supportsSparseDepthAttachments];
          char v25 = [a3 supportsAtomicUlongVoidMinMax];
          char v26 = [a3 supportsLossyCompression];
          char v27 = [a3 supportsMeshShaders];
          char v28 = [a3 supportsFunctionPointersFromMesh];
          char v29 = [a3 supportsMeshShadersInICB];
          char v30 = [a3 supportsMeshRenderDynamicLibraries];
          char v31 = [a3 supportsBfloat16Buffers];
          char v32 = [a3 supportsCommandBufferJump];
          char v33 = [a3 supportsColorSpaceConversionMatrixSelection];
          char v34 = [a3 supportsPerPlaneCompression];
          char v35 = [a3 supportsConditionalLoadStore];
          char v36 = [a3 supportsStackOverflowErrorCode];
          char v37 = [a3 supportsRayTracingICBs];
          char v38 = [a3 supportsPerformanceStateAssertion];
          char v39 = [a3 supportsExplicitVisibilityGroups];
          char v63 = [a3 supportsRayTracingMatrixLayout];
          char v67 = [a3 supportsRayTracingDirectIntersectionResultAccess];
          char v70 = [a3 supportsRayTracingPerComponentMotionInterpolation];
          char v74 = [a3 supportsExtendedSamplerLODBiasRange];
          char v10 = [a3 supportsDeviceCoherency];
          *((_DWORD *)&v5->_featureInfo[10].supported + 1) = *(_DWORD *)&v408[3];
          *(_DWORD *)(&v5->_featureInfo[10].supported + 1) = *(_DWORD *)v408;
          *((_DWORD *)&v5->_featureInfo[11].supported + 1) = *(_DWORD *)&v407[3];
          *(_DWORD *)(&v5->_featureInfo[11].supported + 1) = *(_DWORD *)v407;
          *((_DWORD *)&v5->_featureInfo[12].supported + 1) = *(_DWORD *)&v406[3];
          *(_DWORD *)(&v5->_featureInfo[12].supported + 1) = *(_DWORD *)v406;
          *((_DWORD *)&v5->_featureInfo[13].supported + 1) = *(_DWORD *)&v405[3];
          *(_DWORD *)(&v5->_featureInfo[13].supported + 1) = *(_DWORD *)v405;
          *((_DWORD *)&v5->_featureInfo[14].supported + 1) = *(_DWORD *)&v404[3];
          *(_DWORD *)(&v5->_featureInfo[14].supported + 1) = *(_DWORD *)v404;
          *((_DWORD *)&v5->_featureInfo[15].supported + 1) = *(_DWORD *)&v403[3];
          *(_DWORD *)(&v5->_featureInfo[15].supported + 1) = *(_DWORD *)v403;
          *((_DWORD *)&v5->_featureInfo[16].supported + 1) = *(_DWORD *)&v402[3];
          *(_DWORD *)(&v5->_featureInfo[16].supported + 1) = *(_DWORD *)v402;
          *((_DWORD *)&v5->_featureInfo[17].supported + 1) = *(_DWORD *)&v401[3];
          *(_DWORD *)(&v5->_featureInfo[17].supported + 1) = *(_DWORD *)v401;
          *((_DWORD *)&v5->_featureInfo[18].supported + 1) = *(_DWORD *)&v400[3];
          *(_DWORD *)(&v5->_featureInfo[18].supported + 1) = *(_DWORD *)v400;
          *((_DWORD *)&v5->_featureInfo[19].supported + 1) = *(_DWORD *)&v399[3];
          *(_DWORD *)(&v5->_featureInfo[19].supported + 1) = *(_DWORD *)v399;
          *((_DWORD *)&v5->_featureInfo[20].supported + 1) = *(_DWORD *)&v398[3];
          *(_DWORD *)(&v5->_featureInfo[20].supported + 1) = *(_DWORD *)v398;
          *((_DWORD *)&v5->_featureInfo[21].supported + 1) = *(_DWORD *)&v397[3];
          *(_DWORD *)(&v5->_featureInfo[21].supported + 1) = *(_DWORD *)v397;
          *((_DWORD *)&v5->_featureInfo[22].supported + 1) = *(_DWORD *)&v396[3];
          *(_DWORD *)(&v5->_featureInfo[22].supported + 1) = *(_DWORD *)v396;
          *((_DWORD *)&v5->_featureInfo[23].supported + 1) = *(_DWORD *)&v395[3];
          *(_DWORD *)(&v5->_featureInfo[23].supported + 1) = *(_DWORD *)v395;
          *((_DWORD *)&v5->_featureInfo[24].supported + 1) = *(_DWORD *)&v394[3];
          *(_DWORD *)(&v5->_featureInfo[24].supported + 1) = *(_DWORD *)v394;
          *((_DWORD *)&v5->_featureInfo[25].supported + 1) = *(_DWORD *)&v393[3];
          *(_DWORD *)(&v5->_featureInfo[25].supported + 1) = *(_DWORD *)v393;
          *((_DWORD *)&v5->_featureInfo[26].supported + 1) = *(_DWORD *)&v392[3];
          *(_DWORD *)(&v5->_featureInfo[26].supported + 1) = *(_DWORD *)v392;
          *((_DWORD *)&v5->_featureInfo[27].supported + 1) = *(_DWORD *)&v391[3];
          *(_DWORD *)(&v5->_featureInfo[27].supported + 1) = *(_DWORD *)v391;
          *((_DWORD *)&v5->_featureInfo[28].supported + 1) = *(_DWORD *)&v390[3];
          *(_DWORD *)(&v5->_featureInfo[28].supported + 1) = *(_DWORD *)v390;
          *((_DWORD *)&v5->_featureInfo[29].supported + 1) = *(_DWORD *)&v389[3];
          *(_DWORD *)(&v5->_featureInfo[29].supported + 1) = *(_DWORD *)v389;
          *((_DWORD *)&v5->_featureInfo[30].supported + 1) = *(_DWORD *)&v388[3];
          *(_DWORD *)(&v5->_featureInfo[30].supported + 1) = *(_DWORD *)v388;
          *((_DWORD *)&v5->_featureInfo[31].supported + 1) = *(_DWORD *)&v387[3];
          *(_DWORD *)(&v5->_featureInfo[31].supported + 1) = *(_DWORD *)v387;
          *((_DWORD *)&v5->_featureInfo[32].supported + 1) = *(_DWORD *)&v386[3];
          *(_DWORD *)(&v5->_featureInfo[32].supported + 1) = *(_DWORD *)v386;
          *((_DWORD *)&v5->_featureInfo[33].supported + 1) = *(_DWORD *)&v385[3];
          *(_DWORD *)(&v5->_featureInfo[33].supported + 1) = *(_DWORD *)v385;
          *((_DWORD *)&v5->_featureInfo[34].supported + 1) = *(_DWORD *)&v384[3];
          *(_DWORD *)(&v5->_featureInfo[34].supported + 1) = *(_DWORD *)v384;
          *((_DWORD *)&v5->_featureInfo[35].supported + 1) = *(_DWORD *)&v383[3];
          *(_DWORD *)(&v5->_featureInfo[35].supported + 1) = *(_DWORD *)v383;
          *((_DWORD *)&v5->_featureInfo[36].supported + 1) = *(_DWORD *)&v382[3];
          *(_DWORD *)(&v5->_featureInfo[36].supported + 1) = *(_DWORD *)v382;
          *((_DWORD *)&v5->_featureInfo[37].supported + 1) = *(_DWORD *)&v381[3];
          *(_DWORD *)(&v5->_featureInfo[37].supported + 1) = *(_DWORD *)v381;
          *((_DWORD *)&v5->_featureInfo[38].supported + 1) = *(_DWORD *)&v380[3];
          *(_DWORD *)(&v5->_featureInfo[38].supported + 1) = *(_DWORD *)v380;
          *((_DWORD *)&v5->_featureInfo[39].supported + 1) = *(_DWORD *)&v379[3];
          *(_DWORD *)(&v5->_featureInfo[39].supported + 1) = *(_DWORD *)v379;
          *((_DWORD *)&v5->_featureInfo[40].supported + 1) = *(_DWORD *)&v378[3];
          *(_DWORD *)(&v5->_featureInfo[40].supported + 1) = *(_DWORD *)v378;
          *((_DWORD *)&v5->_featureInfo[41].supported + 1) = *(_DWORD *)&v377[3];
          *(_DWORD *)(&v5->_featureInfo[41].supported + 1) = *(_DWORD *)v377;
          *((_DWORD *)&v5->_featureInfo[42].supported + 1) = *(_DWORD *)&v376[3];
          *(_DWORD *)(&v5->_featureInfo[42].supported + 1) = *(_DWORD *)v376;
          *((_DWORD *)&v5->_featureInfo[43].supported + 1) = *(_DWORD *)&v375[3];
          *(_DWORD *)(&v5->_featureInfo[43].supported + 1) = *(_DWORD *)v375;
          *((_DWORD *)&v5->_featureInfo[44].supported + 1) = *(_DWORD *)&v374[3];
          *(_DWORD *)(&v5->_featureInfo[44].supported + 1) = *(_DWORD *)v374;
          *((_DWORD *)&v5->_featureInfo[45].supported + 1) = *(_DWORD *)&v373[3];
          *(_DWORD *)(&v5->_featureInfo[45].supported + 1) = *(_DWORD *)v373;
          *((_DWORD *)&v5->_featureInfo[46].supported + 1) = *(_DWORD *)&v372[3];
          *(_DWORD *)(&v5->_featureInfo[46].supported + 1) = *(_DWORD *)v372;
          *((_DWORD *)&v5->_featureInfo[47].supported + 1) = *(_DWORD *)&v371[3];
          *(_DWORD *)(&v5->_featureInfo[47].supported + 1) = *(_DWORD *)v371;
          *((_DWORD *)&v5->_featureInfo[48].supported + 1) = *(_DWORD *)&v370[3];
          *(_DWORD *)(&v5->_featureInfo[48].supported + 1) = *(_DWORD *)v370;
          *((_DWORD *)&v5->_featureInfo[49].supported + 1) = *(_DWORD *)&v369[3];
          *(_DWORD *)(&v5->_featureInfo[49].supported + 1) = *(_DWORD *)v369;
          *((_DWORD *)&v5->_featureInfo[50].supported + 1) = *(_DWORD *)&v368[3];
          *(_DWORD *)(&v5->_featureInfo[50].supported + 1) = *(_DWORD *)v368;
          *((_DWORD *)&v5->_featureInfo[51].supported + 1) = *(_DWORD *)&v367[3];
          *(_DWORD *)(&v5->_featureInfo[51].supported + 1) = *(_DWORD *)v367;
          *((_DWORD *)&v5->_featureInfo[52].supported + 1) = *(_DWORD *)&v366[3];
          *(_DWORD *)(&v5->_featureInfo[52].supported + 1) = *(_DWORD *)v366;
          *((_DWORD *)&v5->_featureInfo[53].supported + 1) = *(_DWORD *)&v365[3];
          *(_DWORD *)(&v5->_featureInfo[53].supported + 1) = *(_DWORD *)v365;
          *((_DWORD *)&v5->_featureInfo[54].supported + 1) = *(_DWORD *)&v364[3];
          *(_DWORD *)(&v5->_featureInfo[54].supported + 1) = *(_DWORD *)v364;
          *((_DWORD *)&v5->_featureInfo[55].supported + 1) = *(_DWORD *)&v363[3];
          *(_DWORD *)(&v5->_featureInfo[55].supported + 1) = *(_DWORD *)v363;
          *((_DWORD *)&v5->_featureInfo[56].supported + 1) = *(_DWORD *)&v362[3];
          *(_DWORD *)(&v5->_featureInfo[56].supported + 1) = *(_DWORD *)v362;
          *((_DWORD *)&v5->_featureInfo[57].supported + 1) = *(_DWORD *)&v361[3];
          *(_DWORD *)(&v5->_featureInfo[57].supported + 1) = *(_DWORD *)v361;
          *((_DWORD *)&v5->_featureInfo[58].supported + 1) = *(_DWORD *)&v360[3];
          *(_DWORD *)(&v5->_featureInfo[58].supported + 1) = *(_DWORD *)v360;
          *((_DWORD *)&v5->_featureInfo[59].supported + 1) = *(_DWORD *)&v359[3];
          *(_DWORD *)(&v5->_featureInfo[59].supported + 1) = *(_DWORD *)v359;
          *((_DWORD *)&v5->_featureInfo[60].supported + 1) = *(_DWORD *)&v358[3];
          *(_DWORD *)(&v5->_featureInfo[60].supported + 1) = *(_DWORD *)v358;
          *((_DWORD *)&v5->_featureInfo[61].supported + 1) = *(_DWORD *)&v357[3];
          *(_DWORD *)(&v5->_featureInfo[61].supported + 1) = *(_DWORD *)v357;
          *((_DWORD *)&v5->_featureInfo[62].supported + 1) = *(_DWORD *)&v356[3];
          *(_DWORD *)(&v5->_featureInfo[62].supported + 1) = *(_DWORD *)v356;
          *((_DWORD *)&v5->_featureInfo[63].supported + 1) = *(_DWORD *)&v355[3];
          *(_DWORD *)(&v5->_featureInfo[63].supported + 1) = *(_DWORD *)v355;
          *((_DWORD *)&v5->_featureInfo[64].supported + 1) = *(_DWORD *)&v354[3];
          *(_DWORD *)(&v5->_featureInfo[64].supported + 1) = *(_DWORD *)v354;
          *((_DWORD *)&v5->_featureInfo[65].supported + 1) = *(_DWORD *)&v353[3];
          *(_DWORD *)(&v5->_featureInfo[65].supported + 1) = *(_DWORD *)v353;
          *((_DWORD *)&v5->_featureInfo[66].supported + 1) = *(_DWORD *)&v352[3];
          *(_DWORD *)(&v5->_featureInfo[66].supported + 1) = *(_DWORD *)v352;
          *((_DWORD *)&v5->_featureInfo[67].supported + 1) = *(_DWORD *)&v351[3];
          *(_DWORD *)(&v5->_featureInfo[67].supported + 1) = *(_DWORD *)v351;
          *((_DWORD *)&v5->_featureInfo[68].supported + 1) = *(_DWORD *)&v350[3];
          *(_DWORD *)(&v5->_featureInfo[68].supported + 1) = *(_DWORD *)v350;
          *((_DWORD *)&v5->_featureInfo[69].supported + 1) = *(_DWORD *)&v349[3];
          *(_DWORD *)(&v5->_featureInfo[69].supported + 1) = *(_DWORD *)v349;
          *((_DWORD *)&v5->_featureInfo[70].supported + 1) = *(_DWORD *)&v348[3];
          *(_DWORD *)(&v5->_featureInfo[70].supported + 1) = *(_DWORD *)v348;
          *((_DWORD *)&v5->_featureInfo[71].supported + 1) = *(_DWORD *)&v347[3];
          *(_DWORD *)(&v5->_featureInfo[71].supported + 1) = *(_DWORD *)v347;
          *((_DWORD *)&v5->_featureInfo[72].supported + 1) = *(_DWORD *)&v346[3];
          *(_DWORD *)(&v5->_featureInfo[72].supported + 1) = *(_DWORD *)v346;
          *((_DWORD *)&v5->_featureInfo[73].supported + 1) = *(_DWORD *)&v345[3];
          *(_DWORD *)(&v5->_featureInfo[73].supported + 1) = *(_DWORD *)v345;
          *((_DWORD *)&v5->_featureInfo[74].supported + 1) = *(_DWORD *)&v344[3];
          *(_DWORD *)(&v5->_featureInfo[74].supported + 1) = *(_DWORD *)v344;
          *((_DWORD *)&v5->_featureInfo[75].supported + 1) = *(_DWORD *)&v343[3];
          *(_DWORD *)(&v5->_featureInfo[75].supported + 1) = *(_DWORD *)v343;
          *((_DWORD *)&v5->_featureInfo[76].supported + 1) = *(_DWORD *)&v342[3];
          *(_DWORD *)(&v5->_featureInfo[76].supported + 1) = *(_DWORD *)v342;
          *((_DWORD *)&v5->_featureInfo[77].supported + 1) = *(_DWORD *)&v341[3];
          *(_DWORD *)(&v5->_featureInfo[77].supported + 1) = *(_DWORD *)v341;
          *((_DWORD *)&v5->_featureInfo[78].supported + 1) = *(_DWORD *)&v340[3];
          *(_DWORD *)(&v5->_featureInfo[78].supported + 1) = *(_DWORD *)v340;
          *((_DWORD *)&v5->_featureInfo[79].supported + 1) = *(_DWORD *)&v339[3];
          *(_DWORD *)(&v5->_featureInfo[79].supported + 1) = *(_DWORD *)v339;
          *((_DWORD *)&v5->_featureInfo[80].supported + 1) = *(_DWORD *)&v338[3];
          *(_DWORD *)(&v5->_featureInfo[80].supported + 1) = *(_DWORD *)v338;
          *((_DWORD *)&v5->_featureInfo[81].supported + 1) = *(_DWORD *)&v337[3];
          *(_DWORD *)(&v5->_featureInfo[81].supported + 1) = *(_DWORD *)v337;
          *((_DWORD *)&v5->_featureInfo[82].supported + 1) = *(_DWORD *)&v336[3];
          *(_DWORD *)(&v5->_featureInfo[82].supported + 1) = *(_DWORD *)v336;
          *((_DWORD *)&v5->_featureInfo[83].supported + 1) = *(_DWORD *)&v335[3];
          *(_DWORD *)(&v5->_featureInfo[83].supported + 1) = *(_DWORD *)v335;
          *((_DWORD *)&v5->_featureInfo[84].supported + 1) = *(_DWORD *)&v334[3];
          *(_DWORD *)(&v5->_featureInfo[84].supported + 1) = *(_DWORD *)v334;
          *((_DWORD *)&v5->_featureInfo[85].supported + 1) = *(_DWORD *)&v333[3];
          *(_DWORD *)(&v5->_featureInfo[85].supported + 1) = *(_DWORD *)v333;
          *((_DWORD *)&v5->_featureInfo[86].supported + 1) = *(_DWORD *)&v332[3];
          *(_DWORD *)(&v5->_featureInfo[86].supported + 1) = *(_DWORD *)v332;
          *((_DWORD *)&v5->_featureInfo[87].supported + 1) = *(_DWORD *)&v331[3];
          *(_DWORD *)(&v5->_featureInfo[87].supported + 1) = *(_DWORD *)v331;
          *((_DWORD *)&v5->_featureInfo[88].supported + 1) = *(_DWORD *)&v330[3];
          *(_DWORD *)(&v5->_featureInfo[88].supported + 1) = *(_DWORD *)v330;
          *((_DWORD *)&v5->_featureInfo[89].supported + 1) = *(_DWORD *)&v329[3];
          *(_DWORD *)(&v5->_featureInfo[89].supported + 1) = *(_DWORD *)v329;
          *((_DWORD *)&v5->_featureInfo[90].supported + 1) = *(_DWORD *)&v328[3];
          *(_DWORD *)(&v5->_featureInfo[90].supported + 1) = *(_DWORD *)v328;
          *((_DWORD *)&v5->_featureInfo[91].supported + 1) = *(_DWORD *)&v327[3];
          *(_DWORD *)(&v5->_featureInfo[91].supported + 1) = *(_DWORD *)v327;
          *((_DWORD *)&v5->_featureInfo[92].supported + 1) = *(_DWORD *)&v326[3];
          *(_DWORD *)(&v5->_featureInfo[92].supported + 1) = *(_DWORD *)v326;
          *((_DWORD *)&v5->_featureInfo[93].supported + 1) = *(_DWORD *)&v325[3];
          *(_DWORD *)(&v5->_featureInfo[93].supported + 1) = *(_DWORD *)v325;
          *((_DWORD *)&v5->_featureInfo[94].supported + 1) = *(_DWORD *)&v324[3];
          *(_DWORD *)(&v5->_featureInfo[94].supported + 1) = *(_DWORD *)v324;
          *((_DWORD *)&v5->_featureInfo[95].supported + 1) = *(_DWORD *)&v323[3];
          *(_DWORD *)(&v5->_featureInfo[95].supported + 1) = *(_DWORD *)v323;
          *((_DWORD *)&v5->_featureInfo[96].supported + 1) = *(_DWORD *)&v322[3];
          *(_DWORD *)(&v5->_featureInfo[96].supported + 1) = *(_DWORD *)v322;
          *((_DWORD *)&v5->_featureInfo[97].supported + 1) = *(_DWORD *)&v321[3];
          *(_DWORD *)(&v5->_featureInfo[97].supported + 1) = *(_DWORD *)v321;
          *((_DWORD *)&v5->_featureInfo[98].supported + 1) = *(_DWORD *)&v320[3];
          *(_DWORD *)(&v5->_featureInfo[98].supported + 1) = *(_DWORD *)v320;
          *((_DWORD *)&v5->_featureInfo[99].supported + 1) = *(_DWORD *)&v319[3];
          *(_DWORD *)(&v5->_featureInfo[99].supported + 1) = *(_DWORD *)v319;
          *((_DWORD *)&v5->_featureInfo[100].supported + 1) = *(_DWORD *)&v318[3];
          *(_DWORD *)(&v5->_featureInfo[100].supported + 1) = *(_DWORD *)v318;
          *((_DWORD *)&v5->_featureInfo[101].supported + 1) = *(_DWORD *)&v317[3];
          *(_DWORD *)(&v5->_featureInfo[101].supported + 1) = *(_DWORD *)v317;
          *((_DWORD *)&v5->_featureInfo[102].supported + 1) = *(_DWORD *)&v316[3];
          *(_DWORD *)(&v5->_featureInfo[102].supported + 1) = *(_DWORD *)v316;
          *((_DWORD *)&v5->_featureInfo[103].supported + 1) = *(_DWORD *)&v315[3];
          *(_DWORD *)(&v5->_featureInfo[103].supported + 1) = *(_DWORD *)v315;
          *((_DWORD *)&v5->_featureInfo[104].supported + 1) = *(_DWORD *)&v314[3];
          *(_DWORD *)(&v5->_featureInfo[104].supported + 1) = *(_DWORD *)v314;
          *((_DWORD *)&v5->_featureInfo[105].supported + 1) = *(_DWORD *)&v313[3];
          *(_DWORD *)(&v5->_featureInfo[105].supported + 1) = *(_DWORD *)v313;
          *((_DWORD *)&v5->_featureInfo[106].supported + 1) = *(_DWORD *)&v312[3];
          *(_DWORD *)(&v5->_featureInfo[106].supported + 1) = *(_DWORD *)v312;
          *((_DWORD *)&v5->_featureInfo[107].supported + 1) = *(_DWORD *)&v311[3];
          *(_DWORD *)(&v5->_featureInfo[107].supported + 1) = *(_DWORD *)v311;
          *((_DWORD *)&v5->_featureInfo[108].supported + 1) = *(_DWORD *)&v310[3];
          *(_DWORD *)(&v5->_featureInfo[108].supported + 1) = *(_DWORD *)v310;
          *((_DWORD *)&v5->_featureInfo[109].supported + 1) = *(_DWORD *)&v309[3];
          *(_DWORD *)(&v5->_featureInfo[109].supported + 1) = *(_DWORD *)v309;
          *((_DWORD *)&v5->_featureInfo[110].supported + 1) = *(_DWORD *)&v308[3];
          *(_DWORD *)(&v5->_featureInfo[110].supported + 1) = *(_DWORD *)v308;
          *((_DWORD *)&v5->_featureInfo[111].supported + 1) = *(_DWORD *)&v307[3];
          *(_DWORD *)(&v5->_featureInfo[111].supported + 1) = *(_DWORD *)v307;
          *((_DWORD *)&v5->_featureInfo[112].supported + 1) = *(_DWORD *)&v306[3];
          *(_DWORD *)(&v5->_featureInfo[112].supported + 1) = *(_DWORD *)v306;
          *((_DWORD *)&v5->_featureInfo[113].supported + 1) = *(_DWORD *)&v305[3];
          *(_DWORD *)(&v5->_featureInfo[113].supported + 1) = *(_DWORD *)v305;
          *((_DWORD *)&v5->_featureInfo[114].supported + 1) = *(_DWORD *)&v304[3];
          *(_DWORD *)(&v5->_featureInfo[114].supported + 1) = *(_DWORD *)v304;
          *((_DWORD *)&v5->_featureInfo[115].supported + 1) = *(_DWORD *)&v303[3];
          *(_DWORD *)(&v5->_featureInfo[115].supported + 1) = *(_DWORD *)v303;
          *((_DWORD *)&v5->_featureInfo[116].supported + 1) = *(_DWORD *)&v302[3];
          *(_DWORD *)(&v5->_featureInfo[116].supported + 1) = *(_DWORD *)v302;
          *((_DWORD *)&v5->_featureInfo[117].supported + 1) = *(_DWORD *)&v301[3];
          *(_DWORD *)(&v5->_featureInfo[117].supported + 1) = *(_DWORD *)v301;
          *((_DWORD *)&v5->_featureInfo[118].supported + 1) = *(_DWORD *)&v300[3];
          *(_DWORD *)(&v5->_featureInfo[118].supported + 1) = *(_DWORD *)v300;
          *((_DWORD *)&v5->_featureInfo[119].supported + 1) = *(_DWORD *)&v299[3];
          *(_DWORD *)(&v5->_featureInfo[119].supported + 1) = *(_DWORD *)v299;
          *((_DWORD *)&v5->_featureInfo[120].supported + 1) = *(_DWORD *)&v298[3];
          *(_DWORD *)(&v5->_featureInfo[120].supported + 1) = *(_DWORD *)v298;
          *((_DWORD *)&v5->_featureInfo[121].supported + 1) = *(_DWORD *)&v297[3];
          *(_DWORD *)(&v5->_featureInfo[121].supported + 1) = *(_DWORD *)v297;
          *((_DWORD *)&v5->_featureInfo[122].supported + 1) = *(_DWORD *)&v296[3];
          *(_DWORD *)(&v5->_featureInfo[122].supported + 1) = *(_DWORD *)v296;
          *((_DWORD *)&v5->_featureInfo[123].supported + 1) = *(_DWORD *)&v295[3];
          *(_DWORD *)(&v5->_featureInfo[123].supported + 1) = *(_DWORD *)v295;
          *((_DWORD *)&v5->_featureInfo[124].supported + 1) = *(_DWORD *)&v294[3];
          *(_DWORD *)(&v5->_featureInfo[124].supported + 1) = *(_DWORD *)v294;
          *((_DWORD *)&v5->_featureInfo[125].supported + 1) = *(_DWORD *)&v293[3];
          *(_DWORD *)(&v5->_featureInfo[125].supported + 1) = *(_DWORD *)v293;
          *((_DWORD *)&v5->_featureInfo[126].supported + 1) = *(_DWORD *)&v292[3];
          *(_DWORD *)(&v5->_featureInfo[126].supported + 1) = *(_DWORD *)v292;
          *((_DWORD *)&v5->_featureInfo[127].supported + 1) = *(_DWORD *)&v291[3];
          *(_DWORD *)(&v5->_featureInfo[127].supported + 1) = *(_DWORD *)v291;
          *((_DWORD *)&v5->_featureInfo[128].supported + 1) = *(_DWORD *)&v290[3];
          *(_DWORD *)(&v5->_featureInfo[128].supported + 1) = *(_DWORD *)v290;
          *((_DWORD *)&v5->_featureInfo[129].supported + 1) = *(_DWORD *)&v289[3];
          *(_DWORD *)(&v5->_featureInfo[129].supported + 1) = *(_DWORD *)v289;
          *((_DWORD *)&v5->_featureInfo[130].supported + 1) = *(_DWORD *)&v288[3];
          *(_DWORD *)(&v5->_featureInfo[130].supported + 1) = *(_DWORD *)v288;
          *((_DWORD *)&v5->_featureInfo[131].supported + 1) = *(_DWORD *)&v287[3];
          *(_DWORD *)(&v5->_featureInfo[131].supported + 1) = *(_DWORD *)v287;
          *((_DWORD *)&v5->_featureInfo[132].supported + 1) = *(_DWORD *)&v286[3];
          *(_DWORD *)(&v5->_featureInfo[132].supported + 1) = *(_DWORD *)v286;
          v5->_featureInfo[0].supported = v105;
          *(_DWORD *)(&v5->_featureInfo[0].supported + 1) = *(_DWORD *)v418;
          *((_DWORD *)&v5->_featureInfo[0].supported + 1) = *(_DWORD *)&v418[3];
          v5->_featureInfo[1].supported = v104;
          *(_DWORD *)(&v5->_featureInfo[1].supported + 1) = *(_DWORD *)v417;
          *((_DWORD *)&v5->_featureInfo[1].supported + 1) = *(_DWORD *)&v417[3];
          v5->_featureInfo[2].name = (NSString *)@"Memory barrier in render";
          v5->_featureInfo[2].supported = v103;
          *((_DWORD *)&v5->_featureInfo[2].supported + 1) = *(_DWORD *)&v416[3];
          *(_DWORD *)(&v5->_featureInfo[2].supported + 1) = *(_DWORD *)v416;
          v5->_featureInfo[3].name = (NSString *)@"Vertex->Vertex,Vertex->Fragment memory barriers in render";
          v5->_featureInfo[3].supported = v102;
          *((_DWORD *)&v5->_featureInfo[3].supported + 1) = *(_DWORD *)&v415[3];
          *(_DWORD *)(&v5->_featureInfo[3].supported + 1) = *(_DWORD *)v415;
          v5->_featureInfo[4].name = (NSString *)@"Argument Buffers Tier 2";
          v5->_featureInfo[4].supported = v101;
          *(_DWORD *)(&v5->_featureInfo[4].supported + 1) = *(_DWORD *)v414;
          *((_DWORD *)&v5->_featureInfo[4].supported + 1) = *(_DWORD *)&v414[3];
          v5->_featureInfo[5].supported = v100;
          *((_DWORD *)&v5->_featureInfo[5].supported + 1) = *(_DWORD *)&v413[3];
          *(_DWORD *)(&v5->_featureInfo[5].supported + 1) = *(_DWORD *)v413;
          v5->_featureInfo[6].name = (NSString *)@"Command buffer streaming codec signalling SPI";
          v5->_featureInfo[6].supported = v99;
          *((_DWORD *)&v5->_featureInfo[6].supported + 1) = *(_DWORD *)&v412[3];
          *(_DWORD *)(&v5->_featureInfo[6].supported + 1) = *(_DWORD *)v412;
          v5->_featureInfo[7].name = (NSString *)@"Programmable Sample Positions";
          v5->_featureInfo[7].supported = v98;
          *((_DWORD *)&v5->_featureInfo[7].supported + 1) = *(_DWORD *)&v411[3];
          *(_DWORD *)(&v5->_featureInfo[7].supported + 1) = *(_DWORD *)v411;
          v5->_featureInfo[8].name = (NSString *)@"Framebuffer sizes larger than 64 bytes";
          v5->_featureInfo[8].supported = v97;
          *((_DWORD *)&v5->_featureInfo[8].supported + 1) = *(_DWORD *)&v410[3];
          *(_DWORD *)(&v5->_featureInfo[8].supported + 1) = *(_DWORD *)v410;
          v5->_featureInfo[9].name = (NSString *)@"MTLClampToBorder with custom color";
          v5->_featureInfo[9].supported = v96;
          *((_DWORD *)&v5->_featureInfo[9].supported + 1) = *(_DWORD *)&v409[3];
          *(_DWORD *)(&v5->_featureInfo[9].supported + 1) = *(_DWORD *)v409;
          v5->_featureInfo[10].name = (NSString *)@"Clamp to half border";
          v5->_featureInfo[10].supported = v95;
          v5->_featureInfo[11].name = (NSString *)@"BC-format texture compression";
          v5->_featureInfo[11].supported = v94;
          v5->_featureInfo[12].name = (NSString *)@"BC-format textures with MTLTextureType3D";
          v5->_featureInfo[12].supported = v93;
          v5->_featureInfo[13].name = (NSString *)@"RGB10A2 format with gamma";
          v5->_featureInfo[13].supported = v92;
          v5->_featureInfo[14].name = (NSString *)@"BGR10A2 format with gamma";
          v5->_featureInfo[14].supported = v91;
          v5->_featureInfo[15].supported = v90;
          v5->_featureInfo[16].name = (NSString *)@"Global Variable Relocation";
          v5->_featureInfo[16].supported = v89;
          v5->_featureInfo[17].name = (NSString *)@"Global Variable Relocation for Render";
          v5->_featureInfo[17].supported = v88;
          v5->_featureInfo[18].name = (NSString *)@"Global Variable Relocation for Compute";
          v5->_featureInfo[18].supported = v87;
          v5->_featureInfo[19].name = (NSString *)@"TLS variables in metal programs";
          v5->_featureInfo[19].supported = v86;
          v5->_featureInfo[20].name = (NSString *)@"Resource bindings using global variables";
          v5->_featureInfo[20].supported = v85;
          v5->_featureInfo[21].name = (NSString *)@"Resource bindings using global variables in dylibs";
          v5->_featureInfo[21].supported = v84;
          v5->_featureInfo[22].supported = v83;
          v5->_featureInfo[22].name = (NSString *)@"32 bits per channel MSAA textures";
          v5->_featureInfo[23].name = (NSString *)@"32 bits per channel MSAA textures";
          v5->_featureInfo[23].supported = v82;
          v5->_featureInfo[24].name = (NSString *)@"32 bits per channel Float texture filtering";
          v5->_featureInfo[24].supported = v81;
          v5->_featureInfo[25].name = (NSString *)@"Query Texture LOD";
          v5->_featureInfo[25].supported = v80;
          v5->_featureInfo[26].name = (NSString *)@"Vertex Amplification";
          v5->_featureInfo[26].supported = v79;
          v5->_featureInfo[27].name = (NSString *)@"Placement heaps";
          v5->_featureInfo[27].supported = v78;
          v5->_featureInfo[28].name = (NSString *)@"OpenCL Texture Write Swizzles";
          v5->_featureInfo[28].supported = v77;
          v5->_featureInfo[29].name = (NSString *)@"Pull model interpolation";
          v5->_featureInfo[29].supported = v76;
          v5->_featureInfo[30].name = (NSString *)@"Int64 Types";
          v5->_featureInfo[30].supported = v75;
          v5->_featureInfo[31].name = (NSString *)@"Fixed line/point fill depth gradient";
          v5->_featureInfo[31].supported = v73;
          v5->_featureInfo[32].name = (NSString *)@"Late Eval Events";
          v5->_featureInfo[32].supported = v72;
          v5->_featureInfo[33].name = (NSString *)@"texture.write() with a non-zero LOD";
          v5->_featureInfo[33].supported = v71;
          v5->_featureInfo[34].name = (NSString *)@"Shared Texture Handles";
          v5->_featureInfo[34].supported = v69;
          v5->_featureInfo[35].name = (NSString *)@"Gathering buffer prefetch statistics";
          v5->_featureInfo[35].supported = v68;
          v5->_featureInfo[36].name = (NSString *)@"YUV pixel formats";
          v5->_featureInfo[36].supported = v66;
          v5->_featureInfo[37].name = (NSString *)@"Non-Private Depth/Stencil textures";
          v5->_featureInfo[37].supported = v65;
          v5->_featureInfo[38].name = (NSString *)@"Non-Private MSAA textures";
          v5->_featureInfo[38].supported = v64;
          v5->_featureInfo[39].name = (NSString *)@"MTLStorageModeShared Heap resources";
          v5->_featureInfo[39].supported = v62;
          v5->_featureInfo[40].name = (NSString *)@"MTLStorageModeShared textures";
          v5->_featureInfo[40].supported = v61;
          v5->_featureInfo[41].name = (NSString *)@"Linear textures from shared buffers";
          v5->_featureInfo[41].supported = v60;
          v5->_featureInfo[42].name = (NSString *)@"Pipeline Libraries";
          v5->_featureInfo[42].supported = v59;
          v5->_featureInfo[43].name = (NSString *)@"Fragment Only Render Encoders";
          v5->_featureInfo[43].supported = v58;
          v5->_featureInfo[44].name = (NSString *)@"Create a buffer from an IOSurface";
          v5->_featureInfo[44].supported = v57;
          v5->_featureInfo[45].name = (NSString *)@"Programmable Blending";
          v5->_featureInfo[45].supported = v56;
          v5->_featureInfo[46].name = (NSString *)@"Render To Linear Textures";
          v5->_featureInfo[46].supported = v55;
          v5->_featureInfo[47].name = (NSString *)@"Memoryless Render Targets";
          v5->_featureInfo[47].supported = v54;
          v5->_featureInfo[48].name = (NSString *)@"Fast Math Inf/NaN Propagation";
          v5->_featureInfo[48].supported = v53;
          v5->_featureInfo[49].name = (NSString *)@"Invariant Vertex Position";
          v5->_featureInfo[49].supported = v52;
          v5->_featureInfo[50].name = (NSString *)@"LOD Average in shaders";
          v5->_featureInfo[50].supported = v51;
          v5->_featureInfo[51].name = (NSString *)@"sRGB views without MTLTextureUsagePixelFormatView";
          v5->_featureInfo[51].supported = v50;
          v5->_featureInfo[52].name = (NSString *)@"separate depth/stencil";
          v5->_featureInfo[52].supported = v49;
          v5->_featureInfo[53].name = (NSString *)@"gpu statistics";
          v5->_featureInfo[53].supported = v48;
          v5->_featureInfo[54].name = (NSString *)@"CompressedTextureView SPI";
          v5->_featureInfo[54].supported = v47;
          v5->_featureInfo[55].name = (NSString *)@"Render target rotation";
          v5->_featureInfo[55].supported = v45;
          v5->_featureInfo[56].name = (NSString *)@"Dynamic control point counts";
          v5->_featureInfo[56].supported = v44;
          v5->_featureInfo[57].name = (NSString *)@"Hash support for IAB layouts for use by Tools";
          v5->_featureInfo[57].supported = v43;
          v5->_featureInfo[58].name = (NSString *)@"Binary Archives";
          v5->_featureInfo[58].supported = v42;
          v5->_featureInfo[59].name = (NSString *)@"Binary Libraries";
          v5->_featureInfo[59].supported = v41;
          v5->_featureInfo[60].name = (NSString *)@"Deadline-profile objects";
          v5->_featureInfo[60].supported = v40;
          v5->_featureInfo[15].name = (NSString *)@"Override default primitive restart";
          v5->_featureInfo[15].requirement = 1001;
          v5->_featureInfo[61].name = (NSString *)@"FillTexture on blit encoder";
          v5->_featureInfo[1].name = (NSString *)@"Memory barrier in compute";
          v5->_featureInfo[1].requirement = 1001;
          v5->_featureInfo[6].requirement = 0;
          v5->_featureInfo[7].requirement = 0;
          v5->_featureInfo[14].requirement = 1007;
          v5->_featureInfo[8].requirement = 0;
          v5->_featureInfo[9].requirement = 0;
          v5->_featureInfo[10].requirement = 0;
          v5->_featureInfo[11].requirement = 0;
          v5->_featureInfo[12].requirement = 0;
          v5->_featureInfo[13].requirement = 0;
          v5->_featureInfo[33].requirement = 1001;
          v5->_featureInfo[34].requirement = 1001;
          v5->_featureInfo[35].requirement = 1001;
          v5->_featureInfo[36].requirement = 1001;
          v5->_featureInfo[37].requirement = 1001;
          v5->_featureInfo[38].requirement = 1001;
          v5->_featureInfo[39].requirement = 1001;
          v5->_featureInfo[40].requirement = 1001;
          v5->_featureInfo[41].requirement = 1001;
          v5->_featureInfo[42].requirement = 1001;
          v5->_featureInfo[43].requirement = 1001;
          v5->_featureInfo[44].requirement = 1001;
          v5->_featureInfo[45].requirement = 1001;
          v5->_featureInfo[46].requirement = 1001;
          v5->_featureInfo[47].requirement = 1001;
          v5->_featureInfo[48].requirement = 1001;
          v5->_featureInfo[49].requirement = 1001;
          v5->_featureInfo[50].requirement = 1001;
          v5->_featureInfo[51].requirement = 1001;
          v5->_featureInfo[52].requirement = 1001;
          v5->_featureInfo[53].requirement = 1001;
          v5->_featureInfo[54].requirement = 1001;
          v5->_featureInfo[55].requirement = 1001;
          v5->_featureInfo[56].requirement = 1001;
          v5->_featureInfo[57].requirement = 1001;
          v5->_featureInfo[60].requirement = 1001;
          v5->_featureInfo[61].requirement = 1001;
          v5->_featureInfo[61].supported = v46;
          v5->_featureInfo[5].name = (NSString *)@"Read-Write Texture Arguments Tier 2";
          v5->_featureInfo[5].requirement = 0;
          v5->_featureInfo[62].name = (NSString *)@"setThreadgroupPackingDisabled on ComputeEncoder";
          v5->_featureInfo[0].name = (NSString *)@"Client storage textures";
          v5->_featureInfo[0].requirement = 0;
          v5->_featureInfo[2].requirement = 0;
          v5->_featureInfo[3].requirement = 0;
          v5->_featureInfo[4].requirement = 0;
          v5->_featureInfo[16].requirement = 0;
          v5->_featureInfo[17].requirement = 1006;
          v5->_featureInfo[18].requirement = 1006;
          v5->_featureInfo[19].requirement = 0;
          v5->_featureInfo[20].requirement = 1006;
          v5->_featureInfo[21].requirement = 1006;
          v5->_featureInfo[22].requirement = 0;
          v5->_featureInfo[23].requirement = 0;
          v5->_featureInfo[24].requirement = 0;
          v5->_featureInfo[25].requirement = 0;
          v5->_featureInfo[26].requirement = 0;
          v5->_featureInfo[27].requirement = 0;
          v5->_featureInfo[28].requirement = 1003;
          v5->_featureInfo[29].requirement = 1003;
          v5->_featureInfo[30].requirement = 1003;
          v5->_featureInfo[31].requirement = 0;
          v5->_featureInfo[32].requirement = 1004;
          v5->_featureInfo[58].requirement = 1003;
          v5->_featureInfo[59].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[133].supported + 1) = *(_DWORD *)&v285[3];
          *(_DWORD *)(&v5->_featureInfo[133].supported + 1) = *(_DWORD *)v285;
          *((_DWORD *)&v5->_featureInfo[134].supported + 1) = *(_DWORD *)&v284[3];
          *(_DWORD *)(&v5->_featureInfo[134].supported + 1) = *(_DWORD *)v284;
          *((_DWORD *)&v5->_featureInfo[135].supported + 1) = *(_DWORD *)&v283[3];
          *(_DWORD *)(&v5->_featureInfo[135].supported + 1) = *(_DWORD *)v283;
          *((_DWORD *)&v5->_featureInfo[136].supported + 1) = *(_DWORD *)&v282[3];
          *(_DWORD *)(&v5->_featureInfo[136].supported + 1) = *(_DWORD *)v282;
          *((_DWORD *)&v5->_featureInfo[137].supported + 1) = *(_DWORD *)&v281[3];
          *(_DWORD *)(&v5->_featureInfo[137].supported + 1) = *(_DWORD *)v281;
          *((_DWORD *)&v5->_featureInfo[138].supported + 1) = *(_DWORD *)&v280[3];
          *(_DWORD *)(&v5->_featureInfo[138].supported + 1) = *(_DWORD *)v280;
          *((_DWORD *)&v5->_featureInfo[139].supported + 1) = *(_DWORD *)&v279[3];
          *(_DWORD *)(&v5->_featureInfo[139].supported + 1) = *(_DWORD *)v279;
          *((_DWORD *)&v5->_featureInfo[140].supported + 1) = *(_DWORD *)&v278[3];
          *(_DWORD *)(&v5->_featureInfo[140].supported + 1) = *(_DWORD *)v278;
          v5->_featureInfo[170].supported = v8;
          *(_DWORD *)(&v5->_featureInfo[170].supported + 1) = *(_DWORD *)v248;
          *((_DWORD *)&v5->_featureInfo[141].supported + 1) = *(_DWORD *)&v277[3];
          *(_DWORD *)(&v5->_featureInfo[141].supported + 1) = *(_DWORD *)v277;
          v5->_featureInfo[171].supported = v9;
          *(_DWORD *)(&v5->_featureInfo[171].supported + 1) = *(_DWORD *)v247;
          *((_DWORD *)&v5->_featureInfo[142].supported + 1) = *(_DWORD *)&v276[3];
          *(_DWORD *)(&v5->_featureInfo[142].supported + 1) = *(_DWORD *)v276;
          v5->_featureInfo[172].supported = v12;
          *(_DWORD *)(&v5->_featureInfo[172].supported + 1) = *(_DWORD *)v246;
          *((_DWORD *)&v5->_featureInfo[143].supported + 1) = *(_DWORD *)&v275[3];
          *(_DWORD *)(&v5->_featureInfo[143].supported + 1) = *(_DWORD *)v275;
          v5->_featureInfo[173].supported = v13;
          *(_DWORD *)(&v5->_featureInfo[173].supported + 1) = *(_DWORD *)v245;
          *((_DWORD *)&v5->_featureInfo[144].supported + 1) = *(_DWORD *)&v274[3];
          *(_DWORD *)(&v5->_featureInfo[144].supported + 1) = *(_DWORD *)v274;
          v5->_featureInfo[174].supported = v14;
          *(_DWORD *)(&v5->_featureInfo[174].supported + 1) = *(_DWORD *)v244;
          *((_DWORD *)&v5->_featureInfo[145].supported + 1) = *(_DWORD *)&v273[3];
          *(_DWORD *)(&v5->_featureInfo[145].supported + 1) = *(_DWORD *)v273;
          v5->_featureInfo[175].supported = v15;
          *(_DWORD *)(&v5->_featureInfo[175].supported + 1) = *(_DWORD *)v243;
          *((_DWORD *)&v5->_featureInfo[146].supported + 1) = *(_DWORD *)&v272[3];
          *(_DWORD *)(&v5->_featureInfo[146].supported + 1) = *(_DWORD *)v272;
          v5->_featureInfo[176].supported = v16;
          *(_DWORD *)(&v5->_featureInfo[176].supported + 1) = *(_DWORD *)v242;
          *((_DWORD *)&v5->_featureInfo[147].supported + 1) = *(_DWORD *)&v271[3];
          *(_DWORD *)(&v5->_featureInfo[147].supported + 1) = *(_DWORD *)v271;
          v5->_featureInfo[177].supported = v17;
          *(_DWORD *)(&v5->_featureInfo[177].supported + 1) = *(_DWORD *)v241;
          *((_DWORD *)&v5->_featureInfo[148].supported + 1) = *(_DWORD *)&v270[3];
          *(_DWORD *)(&v5->_featureInfo[148].supported + 1) = *(_DWORD *)v270;
          v5->_featureInfo[178].supported = v18;
          *(_DWORD *)(&v5->_featureInfo[178].supported + 1) = *(_DWORD *)v240;
          *((_DWORD *)&v5->_featureInfo[149].supported + 1) = *(_DWORD *)&v269[3];
          *(_DWORD *)(&v5->_featureInfo[149].supported + 1) = *(_DWORD *)v269;
          v5->_featureInfo[179].supported = v19;
          *(_DWORD *)(&v5->_featureInfo[179].supported + 1) = *(_DWORD *)v239;
          *((_DWORD *)&v5->_featureInfo[150].supported + 1) = *(_DWORD *)&v268[3];
          *(_DWORD *)(&v5->_featureInfo[150].supported + 1) = *(_DWORD *)v268;
          v5->_featureInfo[180].supported = v20;
          *(_DWORD *)(&v5->_featureInfo[180].supported + 1) = *(_DWORD *)v238;
          *((_DWORD *)&v5->_featureInfo[151].supported + 1) = *(_DWORD *)&v267[3];
          *(_DWORD *)(&v5->_featureInfo[151].supported + 1) = *(_DWORD *)v267;
          v5->_featureInfo[181].supported = v21;
          *(_DWORD *)(&v5->_featureInfo[181].supported + 1) = *(_DWORD *)v237;
          *((_DWORD *)&v5->_featureInfo[152].supported + 1) = *(_DWORD *)&v266[3];
          *(_DWORD *)(&v5->_featureInfo[152].supported + 1) = *(_DWORD *)v266;
          v5->_featureInfo[182].supported = v22;
          *(_DWORD *)(&v5->_featureInfo[182].supported + 1) = *(_DWORD *)v236;
          *((_DWORD *)&v5->_featureInfo[153].supported + 1) = *(_DWORD *)&v265[3];
          *(_DWORD *)(&v5->_featureInfo[153].supported + 1) = *(_DWORD *)v265;
          v5->_featureInfo[183].supported = v23;
          *(_DWORD *)(&v5->_featureInfo[183].supported + 1) = *(_DWORD *)v235;
          *((_DWORD *)&v5->_featureInfo[154].supported + 1) = *(_DWORD *)&v264[3];
          *(_DWORD *)(&v5->_featureInfo[154].supported + 1) = *(_DWORD *)v264;
          v5->_featureInfo[184].supported = v24;
          *(_DWORD *)(&v5->_featureInfo[184].supported + 1) = *(_DWORD *)v234;
          *((_DWORD *)&v5->_featureInfo[155].supported + 1) = *(_DWORD *)&v263[3];
          *(_DWORD *)(&v5->_featureInfo[155].supported + 1) = *(_DWORD *)v263;
          v5->_featureInfo[185].supported = v25;
          *(_DWORD *)(&v5->_featureInfo[185].supported + 1) = *(_DWORD *)v233;
          *((_DWORD *)&v5->_featureInfo[156].supported + 1) = *(_DWORD *)&v262[3];
          *(_DWORD *)(&v5->_featureInfo[156].supported + 1) = *(_DWORD *)v262;
          v5->_featureInfo[186].supported = v26;
          *(_DWORD *)(&v5->_featureInfo[186].supported + 1) = *(_DWORD *)v232;
          *((_DWORD *)&v5->_featureInfo[157].supported + 1) = *(_DWORD *)&v261[3];
          *(_DWORD *)(&v5->_featureInfo[157].supported + 1) = *(_DWORD *)v261;
          v5->_featureInfo[187].supported = v27;
          *(_DWORD *)(&v5->_featureInfo[187].supported + 1) = *(_DWORD *)v231;
          *((_DWORD *)&v5->_featureInfo[158].supported + 1) = *(_DWORD *)&v260[3];
          *(_DWORD *)(&v5->_featureInfo[158].supported + 1) = *(_DWORD *)v260;
          v5->_featureInfo[188].supported = v28;
          *(_DWORD *)(&v5->_featureInfo[188].supported + 1) = *(_DWORD *)v230;
          *((_DWORD *)&v5->_featureInfo[159].supported + 1) = *(_DWORD *)&v259[3];
          *(_DWORD *)(&v5->_featureInfo[159].supported + 1) = *(_DWORD *)v259;
          v5->_featureInfo[189].supported = v29;
          *(_DWORD *)(&v5->_featureInfo[189].supported + 1) = *(_DWORD *)v229;
          *((_DWORD *)&v5->_featureInfo[160].supported + 1) = *(_DWORD *)&v258[3];
          *(_DWORD *)(&v5->_featureInfo[160].supported + 1) = *(_DWORD *)v258;
          v5->_featureInfo[190].supported = v30;
          *(_DWORD *)(&v5->_featureInfo[190].supported + 1) = *(_DWORD *)v228;
          *((_DWORD *)&v5->_featureInfo[161].supported + 1) = *(_DWORD *)&v257[3];
          *(_DWORD *)(&v5->_featureInfo[161].supported + 1) = *(_DWORD *)v257;
          v5->_featureInfo[191].supported = v31;
          *(_DWORD *)(&v5->_featureInfo[191].supported + 1) = *(_DWORD *)v227;
          *((_DWORD *)&v5->_featureInfo[162].supported + 1) = *(_DWORD *)&v256[3];
          *(_DWORD *)(&v5->_featureInfo[162].supported + 1) = *(_DWORD *)v256;
          v5->_featureInfo[192].supported = v32;
          *(_DWORD *)(&v5->_featureInfo[192].supported + 1) = *(_DWORD *)v226;
          *((_DWORD *)&v5->_featureInfo[163].supported + 1) = *(_DWORD *)&v255[3];
          *(_DWORD *)(&v5->_featureInfo[163].supported + 1) = *(_DWORD *)v255;
          v5->_featureInfo[193].supported = v33;
          *(_DWORD *)(&v5->_featureInfo[193].supported + 1) = *(_DWORD *)v225;
          *((_DWORD *)&v5->_featureInfo[164].supported + 1) = *(_DWORD *)&v254[3];
          *(_DWORD *)(&v5->_featureInfo[164].supported + 1) = *(_DWORD *)v254;
          v5->_featureInfo[194].supported = v34;
          *(_DWORD *)(&v5->_featureInfo[194].supported + 1) = *(_DWORD *)v224;
          *((_DWORD *)&v5->_featureInfo[165].supported + 1) = *(_DWORD *)&v253[3];
          *(_DWORD *)(&v5->_featureInfo[165].supported + 1) = *(_DWORD *)v253;
          v5->_featureInfo[195].supported = v35;
          *(_DWORD *)(&v5->_featureInfo[195].supported + 1) = *(_DWORD *)v223;
          *((_DWORD *)&v5->_featureInfo[166].supported + 1) = *(_DWORD *)&v252[3];
          *(_DWORD *)(&v5->_featureInfo[166].supported + 1) = *(_DWORD *)v252;
          v5->_featureInfo[196].supported = v36;
          *(_DWORD *)(&v5->_featureInfo[196].supported + 1) = *(_DWORD *)v222;
          *((_DWORD *)&v5->_featureInfo[167].supported + 1) = *(_DWORD *)&v251[3];
          *(_DWORD *)(&v5->_featureInfo[167].supported + 1) = *(_DWORD *)v251;
          v5->_featureInfo[197].supported = v37;
          *(_DWORD *)(&v5->_featureInfo[197].supported + 1) = *(_DWORD *)v221;
          *((_DWORD *)&v5->_featureInfo[168].supported + 1) = *(_DWORD *)&v250[3];
          *(_DWORD *)(&v5->_featureInfo[168].supported + 1) = *(_DWORD *)v250;
          v5->_featureInfo[198].supported = v38;
          *(_DWORD *)(&v5->_featureInfo[198].supported + 1) = *(_DWORD *)v220;
          *((_DWORD *)&v5->_featureInfo[169].supported + 1) = *(_DWORD *)&v249[3];
          *(_DWORD *)(&v5->_featureInfo[169].supported + 1) = *(_DWORD *)v249;
          v5->_featureInfo[199].supported = v39;
          *(_DWORD *)(&v5->_featureInfo[199].supported + 1) = *(_DWORD *)v219;
          v5->_featureInfo[62].supported = v213;
          v5->_featureInfo[63].name = (NSString *)@"ASTC-format texture compression";
          v5->_featureInfo[63].supported = v212;
          v5->_featureInfo[64].name = (NSString *)@"Extended YUV pixel formats";
          v5->_featureInfo[64].supported = v211;
          v5->_featureInfo[65].name = (NSString *)@"XR10 pixel formats";
          v5->_featureInfo[65].supported = v210;
          v5->_featureInfo[66].name = (NSString *)@"sRGBwrites";
          v5->_featureInfo[66].supported = v209;
          v5->_featureInfo[67].name = (NSString *)@"Depth Clip Mode";
          v5->_featureInfo[67].supported = v208;
          v5->_featureInfo[68].name = (NSString *)@"Resource heaps";
          v5->_featureInfo[68].supported = v206;
          v5->_featureInfo[69].name = (NSString *)@"Argument buffers";
          v5->_featureInfo[63].requirement = 1002;
          v5->_featureInfo[64].requirement = 1002;
          v5->_featureInfo[65].requirement = 1002;
          v5->_featureInfo[66].requirement = 1002;
          v5->_featureInfo[67].requirement = 1002;
          v5->_featureInfo[68].requirement = 1002;
          v5->_featureInfo[69].requirement = 1002;
          v5->_featureInfo[69].supported = v207;
          v5->_featureInfo[70].name = (NSString *)@"Packed 32-bit format Texture Buffer Writes";
          v5->_featureInfo[70].supported = v205;
          v5->_featureInfo[71].name = (NSString *)@"ASTC-format textures with MTLTextureType3D";
          v5->_featureInfo[71].supported = v204;
          v5->_featureInfo[72].name = (NSString *)@"Extended XR10 pixel formats";
          v5->_featureInfo[72].supported = v203;
          v5->_featureInfo[73].name = (NSString *)@"Writes to buffers from fragment functions";
          v5->_featureInfo[73].supported = v202;
          v5->_featureInfo[74].name = (NSString *)@"Counting Occlusion Query";
          v5->_featureInfo[74].supported = v201;
          v5->_featureInfo[75].name = (NSString *)@"Base Vertex Instance Drawing";
          v5->_featureInfo[75].supported = v200;
          v5->_featureInfo[76].name = (NSString *)@"Indirect draw & dispatch arguments";
          v5->_featureInfo[76].supported = v199;
          v5->_featureInfo[77].name = (NSString *)@"Tessellation";
          v5->_featureInfo[77].supported = v198;
          v5->_featureInfo[78].name = (NSString *)@"Read-Write Buffer Arguments";
          v5->_featureInfo[78].supported = v197;
          v5->_featureInfo[79].name = (NSString *)@"Readable Array Of Textures";
          v5->_featureInfo[79].supported = v196;
          v5->_featureInfo[80].name = (NSString *)@"Array Of Samplers";
          v5->_featureInfo[80].supported = v195;
          v5->_featureInfo[81].name = (NSString *)@"Combined MSAA Store And Resolve Action";
          v5->_featureInfo[81].supported = v194;
          v5->_featureInfo[82].name = (NSString *)@"Mutable Tier1 Argument Buffers";
          v5->_featureInfo[82].supported = v193;
          v5->_featureInfo[83].name = (NSString *)@"Sampler Compare Function";
          v5->_featureInfo[83].supported = v192;
          v5->_featureInfo[84].name = (NSString *)@"MSAA Depth Resolve";
          v5->_featureInfo[84].supported = v191;
          v5->_featureInfo[85].name = (NSString *)@"MSAA Stencil Resolve";
          v5->_featureInfo[85].supported = v190;
          v5->_featureInfo[86].name = (NSString *)@"MSAA Depth Resolve Filter";
          v5->_featureInfo[86].supported = v189;
          v5->_featureInfo[87].name = (NSString *)@"Indirect Command Buffers for graphics";
          v5->_featureInfo[87].supported = v188;
          v5->_featureInfo[88].name = (NSString *)@"Indirect Command Buffers for compute";
          v5->_featureInfo[88].supported = v187;
          v5->_featureInfo[89].name = (NSString *)@"Indirect Stage In Region";
          v5->_featureInfo[89].supported = v186;
          v5->_featureInfo[90].name = (NSString *)@"Indirect texture access";
          v5->_featureInfo[90].supported = v184;
          v5->_featureInfo[91].name = (NSString *)@"Bicubic filtering of 16-bit normalized values";
          v5->_featureInfo[91].supported = v183;
          v5->_featureInfo[92].name = (NSString *)@"Out of Bounds Reads on Textures";
          v5->_featureInfo[92].supported = v182;
          v5->_featureInfo[93].name = (NSString *)@"Texture Swizzle";
          v5->_featureInfo[93].supported = v181;
          v5->_featureInfo[94].name = (NSString *)@"YUV + Alpha pixel formats";
          v5->_featureInfo[94].supported = v180;
          v5->_featureInfo[95].name = (NSString *)@"Atomic functions with memory order";
          v5->_featureInfo[95].supported = v179;
          v5->_featureInfo[96].name = (NSString *)@"Support quad_group* attributes in kernel functions";
          v5->_featureInfo[96].supported = v178;
          v5->_featureInfo[97].name = (NSString *)@"Writes to textures from vertex and fragment functions";
          v5->_featureInfo[97].supported = v177;
          v5->_featureInfo[98].name = (NSString *)@"Image Blocks";
          v5->_featureInfo[98].supported = v176;
          v5->_featureInfo[99].name = (NSString *)@"Tile Shaders";
          v5->_featureInfo[99].supported = v172;
          v5->_featureInfo[100].name = (NSString *)@"Image Block Sample Coverage Control";
          v5->_featureInfo[100].supported = v164;
          v5->_featureInfo[140].name = (NSString *)@"Sparse heaps";
          v5->_featureInfo[140].supported = v112;
          v5->_featureInfo[140].requirement = 1006;
          v5->_featureInfo[101].name = (NSString *)@"FP16 on native hardware";
          v5->_featureInfo[101].supported = v161;
          v5->_featureInfo[139].supported = v115;
          v5->_featureInfo[139].requirement = 1006;
          v5->_featureInfo[138].supported = v118;
          v5->_featureInfo[139].name = (NSString *)@"Sparse textures";
          v5->_featureInfo[138].name = (NSString *)@"ASTC HDR Texture Compression";
          v5->_featureInfo[138].requirement = 1006;
          v5->_featureInfo[102].name = (NSString *)@"Post-Depth Coverage";
          v5->_featureInfo[137].name = (NSString *)@"YCBCR XR pixel formats";
          v5->_featureInfo[137].supported = v122;
          v5->_featureInfo[137].requirement = 1006;
          v5->_featureInfo[102].supported = v168;
          v5->_featureInfo[136].name = (NSString *)@"YCBCR 12 pixel formats";
          v5->_featureInfo[136].supported = v125;
          v5->_featureInfo[136].requirement = 1006;
          v5->_featureInfo[103].name = (NSString *)@"Mip Levels smaller than Block Size";
          v5->_featureInfo[135].supported = v128;
          v5->_featureInfo[135].name = (NSString *)@"YCBCR PQ pixel formats";
          v5->_featureInfo[135].requirement = 1006;
          v5->_featureInfo[103].supported = v167;
          v5->_featureInfo[134].name = (NSString *)@"YCBCR PQ pixel formats";
          v5->_featureInfo[134].supported = v131;
          v5->_featureInfo[134].requirement = 1006;
          v5->_featureInfo[104].name = (NSString *)@"Dispatch Threads with Non-Uniform Threadgroup Size";
          v5->_featureInfo[133].name = (NSString *)@"Variable Rate Rasterization";
          v5->_featureInfo[133].supported = v135;
          v5->_featureInfo[133].requirement = 1006;
          v5->_featureInfo[104].supported = v166;
          v5->_featureInfo[132].name = (NSString *)@"Writable Array Of Textures";
          v5->_featureInfo[132].supported = v138;
          v5->_featureInfo[132].requirement = 1006;
          v5->_featureInfo[105].name = (NSString *)@"Read-Write Texture Arguments";
          v5->_featureInfo[105].supported = v163;
          v5->_featureInfo[131].supported = v141;
          v5->_featureInfo[131].requirement = 1006;
          v5->_featureInfo[130].supported = v144;
          v5->_featureInfo[131].name = (NSString *)@"SIMD Shuffles And Broadcast";
          v5->_featureInfo[130].name = (NSString *)@"Shader Min LOD Clamp";
          v5->_featureInfo[130].requirement = 1006;
          v5->_featureInfo[106].name = (NSString *)@"Read-Write Texture Cube Arguments";
          v5->_featureInfo[129].name = (NSString *)@"Support simd_group* attributes in kernel functions";
          v5->_featureInfo[129].supported = v146;
          v5->_featureInfo[129].requirement = 1006;
          v5->_featureInfo[128].name = (NSString *)@"Create a heap from a set of address ranges";
          v5->_featureInfo[128].supported = v147;
          v5->_featureInfo[128].requirement = 1005;
          v5->_featureInfo[106].supported = v174;
          v5->_featureInfo[127].name = (NSString *)@"Create a buffer from a set of address ranges";
          v5->_featureInfo[127].supported = v148;
          v5->_featureInfo[127].requirement = 1005;
          v5->_featureInfo[107].name = (NSString *)@"Texture Cube Array";
          v5->_featureInfo[107].supported = v171;
          v5->_featureInfo[126].supported = v149;
          v5->_featureInfo[126].requirement = 0;
          v5->_featureInfo[108].name = (NSString *)@"QUAD Shuffles And Broadcast";
          v5->_featureInfo[108].supported = v165;
          v5->_featureInfo[125].supported = v150;
          v5->_featureInfo[126].name = (NSString *)@"Resource detach backing";
          v5->_featureInfo[125].name = (NSString *)@"RGB9E5 & RG11B10 vertex fetch";
          v5->_featureInfo[125].requirement = 1005;
          v5->_featureInfo[123].name = (NSString *)@"FP32 Tessellation Factors";
          v5->_featureInfo[124].name = (NSString *)@"Unaligned vertex fetch";
          v5->_featureInfo[124].supported = v151;
          v5->_featureInfo[124].requirement = 1005;
          v5->_featureInfo[123].supported = v152;
          v5->_featureInfo[123].requirement = 1005;
          v5->_featureInfo[109].name = (NSString *)@"Concurrent Compute Dispatch";
          v5->_featureInfo[122].name = (NSString *)@"Stencil Feedback";
          v5->_featureInfo[122].supported = v153;
          v5->_featureInfo[122].requirement = 1005;
          v5->_featureInfo[110].name = (NSString *)@"A Render Pass without a Render Target";
          v5->_featureInfo[110].supported = v170;
          v5->_featureInfo[121].supported = v154;
          v5->_featureInfo[121].requirement = 1005;
          v5->_featureInfo[111].name = (NSString *)@"Raster Order Groups";
          v5->_featureInfo[111].supported = v162;
          v5->_featureInfo[120].supported = v155;
          v5->_featureInfo[121].name = (NSString *)@"MSAA Stencil Resolve Filter";
          v5->_featureInfo[120].name = (NSString *)@"Indirect Tessellation";
          v5->_featureInfo[120].requirement = 1005;
          v5->_featureInfo[118].name = (NSString *)@"Layered Rendering";
          v5->_featureInfo[119].name = (NSString *)@"Viewport and Scissor Array";
          v5->_featureInfo[119].supported = v156;
          v5->_featureInfo[119].requirement = 1005;
          v5->_featureInfo[118].supported = v157;
          v5->_featureInfo[118].requirement = 1005;
          v5->_featureInfo[112].name = (NSString *)@"Raster Order Groups on Color Attachments";
          v5->_featureInfo[117].name = (NSString *)@"2D Linear Texture Array";
          v5->_featureInfo[117].supported = v158;
          v5->_featureInfo[117].requirement = 1005;
          v5->_featureInfo[112].supported = v175;
          v5->_featureInfo[116].name = (NSString *)@"Separate Visibility And Shading Rate";
          v5->_featureInfo[116].supported = v159;
          v5->_featureInfo[116].requirement = 1005;
          v5->_featureInfo[113].name = (NSString *)@"Dynamic Attribute Stride in vertex fetching";
          v5->_featureInfo[113].supported = v173;
          v5->_featureInfo[115].supported = v160;
          v5->_featureInfo[115].requirement = 1005;
          v5->_featureInfo[114].name = (NSString *)@"Linear Texture 2D arrays";
          v5->_featureInfo[114].requirement = 1005;
          v5->_featureInfo[114].supported = v169;
          v5->_featureInfo[115].name = (NSString *)@"Non-Square Tile Shaders";
          v5->_featureInfo[94].requirement = 1004;
          v5->_featureInfo[96].requirement = 1004;
          v5->_featureInfo[97].requirement = 1004;
          v5->_featureInfo[98].requirement = 1004;
          v5->_featureInfo[112].requirement = 1004;
          v5->_featureInfo[113].requirement = 1004;
          v5->_featureInfo[99].requirement = 1004;
          v5->_featureInfo[100].requirement = 1004;
          v5->_featureInfo[101].requirement = 1004;
          v5->_featureInfo[102].requirement = 1004;
          v5->_featureInfo[103].requirement = 1004;
          v5->_featureInfo[111].requirement = 1004;
          v5->_featureInfo[104].requirement = 1004;
          v5->_featureInfo[105].requirement = 1004;
          v5->_featureInfo[106].requirement = 1004;
          v5->_featureInfo[107].requirement = 1004;
          v5->_featureInfo[108].requirement = 1004;
          v5->_featureInfo[110].requirement = 1004;
          v5->_featureInfo[109].requirement = 1004;
          v5->_featureInfo[109].supported = v185;
          v5->_featureInfo[141].name = (NSString *)@"access::write on indirect textures";
          v5->_featureInfo[141].supported = v145;
          v5->_featureInfo[142].name = (NSString *)@"Function Pointers";
          v5->_featureInfo[142].supported = v143;
          v5->_featureInfo[143].name = (NSString *)@"Dynamic Libraries";
          v5->_featureInfo[143].supported = v142;
          v5->_featureInfo[144].name = (NSString *)@"Dynamic Libraries created with compute state";
          v5->_featureInfo[144].supported = v140;
          v5->_featureInfo[145].name = (NSString *)@"Dynamic Libraries created with render/tileRender state";
          v5->_featureInfo[145].supported = v139;
          v5->_featureInfo[146].name = (NSString *)@"Function Pointers from Render stages";
          v5->_featureInfo[146].supported = v137;
          v5->_featureInfo[147].name = (NSString *)@"Shared function tables";
          v5->_featureInfo[147].supported = v136;
          v5->_featureInfo[148].name = (NSString *)@"Raytracing from Render stages";
          v5->_featureInfo[148].supported = v134;
          v5->_featureInfo[149].name = (NSString *)@"Raytracing Primitive Motion Blur";
          v5->_featureInfo[149].supported = v133;
          v5->_featureInfo[150].name = (NSString *)@"Ray Tracing Extended Vertex Formats and Transformation";
          v5->_featureInfo[150].supported = v132;
          v5->_featureInfo[151].name = (NSString *)@"Heap Acceleration Structure Allocation";
          v5->_featureInfo[151].supported = v130;
          v5->_featureInfo[152].name = (NSString *)@"RayTracing Per Primitive Data";
          v5->_featureInfo[152].supported = v129;
          v5->_featureInfo[153].name = (NSString *)@"Ray Tracing Traversal Metrics";
          v5->_featureInfo[153].supported = v127;
          v5->_featureInfo[154].name = (NSString *)@"Raytracing Buffers from Intersection Function Tables";
          v5->_featureInfo[154].supported = v126;
          v5->_featureInfo[155].name = (NSString *)@"Deserialization of Acceleration Structures on CPU";
          v5->_featureInfo[155].supported = v124;
          v5->_featureInfo[156].name = (NSString *)@"Ray tracing multi-level instancing";
          v5->_featureInfo[156].supported = v123;
          v5->_featureInfo[157].name = (NSString *)@"Ray Tracing Indirect Instance Acceleration Structure Build";
          v5->_featureInfo[157].supported = v121;
          v5->_featureInfo[158].name = (NSString *)@"Ray Tracing GPU Table Update Buffers";
          v5->_featureInfo[158].supported = v120;
          v5->_featureInfo[159].name = (NSString *)@"Ray tracing curve primitives";
          v5->_featureInfo[159].supported = v119;
          v5->_featureInfo[160].name = (NSString *)@"Barycentrics coordinates and PrimitiveID";
          v5->_featureInfo[160].supported = v117;
          v5->_featureInfo[161].name = (NSString *)@"Black Or White Sampler Border Colors";
          v5->_featureInfo[161].supported = v116;
          v5->_featureInfo[162].name = (NSString *)@"MirrorClampToEdge Sampler Mode";
          v5->_featureInfo[162].supported = v114;
          v5->_featureInfo[163].name = (NSString *)@"SIMD Reduction";
          v5->_featureInfo[163].supported = v113;
          v5->_featureInfo[164].name = (NSString *)@"DepthClipModeClamp with zMin != 0 or zMax != 1";
          v5->_featureInfo[164].supported = v111;
          v5->_featureInfo[165].name = (NSString *)@"Texture 2D Multisample Array";
          v5->_featureInfo[165].supported = v110;
          v5->_featureInfo[166].name = (NSString *)@"Force seams on cubemap filtering";
          v5->_featureInfo[166].supported = v109;
          v5->_featureInfo[167].name = (NSString *)@"Bicubic filtering of 16-bit float values";
          v5->_featureInfo[167].supported = v108;
          v5->_featureInfo[168].name = (NSString *)@"Inf/Nan filtering of 16-bit float values";
          v5->_featureInfo[95].requirement = 0;
          v5->_featureInfo[168].supported = v106;
          v5->_featureInfo[200].supported = v63;
          *(_DWORD *)(&v5->_featureInfo[200].supported + 1) = *(_DWORD *)v218;
          v5->_featureInfo[169].name = (NSString *)@"RTZ Rounding and Clamping";
          v5->_featureInfo[169].supported = v107;
          v5->_featureInfo[170].name = (NSString *)@"Aniso sampling controls for certain conditions";
          *((_DWORD *)&v5->_featureInfo[170].supported + 1) = *(_DWORD *)&v248[3];
          v5->_featureInfo[171].name = (NSString *)@"YCBCR Packed PQ pixel formats";
          *((_DWORD *)&v5->_featureInfo[171].supported + 1) = *(_DWORD *)&v247[3];
          v5->_featureInfo[93].requirement = 1003;
          v5->_featureInfo[172].name = (NSString *)@"YCBCR Packed 12 pixel formats";
          v5->_featureInfo[201].supported = v67;
          *((_DWORD *)&v5->_featureInfo[172].supported + 1) = *(_DWORD *)&v246[3];
          *(_DWORD *)(&v5->_featureInfo[201].supported + 1) = *(_DWORD *)v217;
          v5->_featureInfo[173].name = (NSString *)@"YCBCR Packed XR pixel formats";
          v5->_featureInfo[91].requirement = 1003;
          v5->_featureInfo[92].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[173].supported + 1) = *(_DWORD *)&v245[3];
          v5->_featureInfo[174].name = (NSString *)@"Buffer Bounds Checking";
          v5->_featureInfo[202].supported = v70;
          *(_DWORD *)(&v5->_featureInfo[202].supported + 1) = *(_DWORD *)v216;
          *((_DWORD *)&v5->_featureInfo[174].supported + 1) = *(_DWORD *)&v244[3];
          v5->_featureInfo[175].name = (NSString *)@"Forkable command buffers";
          *((_DWORD *)&v5->_featureInfo[175].supported + 1) = *(_DWORD *)&v243[3];
          v5->_featureInfo[176].name = (NSString *)@"Support device partitioning";
          *((_DWORD *)&v5->_featureInfo[176].supported + 1) = *(_DWORD *)&v242[3];
          v5->_featureInfo[90].requirement = 1003;
          v5->_featureInfo[177].name = (NSString *)@"Support compute writes on compressed textures";
          *((_DWORD *)&v5->_featureInfo[177].supported + 1) = *(_DWORD *)&v241[3];
          v5->_featureInfo[88].requirement = 1003;
          v5->_featureInfo[178].name = (NSString *)@"Support SIMD group matrix multiply add";
          *((_DWORD *)&v5->_featureInfo[178].supported + 1) = *(_DWORD *)&v240[3];
          v5->_featureInfo[89].requirement = 1003;
          v5->_featureInfo[179].name = (NSString *)@"Support compression interchange";
          v5->_featureInfo[203].supported = v74;
          *(_DWORD *)(&v5->_featureInfo[203].supported + 1) = *(_DWORD *)v215;
          *((_DWORD *)&v5->_featureInfo[179].supported + 1) = *(_DWORD *)&v239[3];
          v5->_featureInfo[180].name = (NSString *)@"Quad Reduction";
          v5->_featureInfo[80].requirement = 1003;
          v5->_featureInfo[83].requirement = 1003;
          v5->_featureInfo[84].requirement = 1003;
          v5->_featureInfo[87].requirement = 1003;
          v5->_featureInfo[85].requirement = 1003;
          v5->_featureInfo[86].requirement = 1003;
          v5->_featureInfo[160].requirement = 1007;
          v5->_featureInfo[161].requirement = 1007;
          v5->_featureInfo[162].requirement = 1007;
          v5->_featureInfo[163].requirement = 1007;
          v5->_featureInfo[164].requirement = 1007;
          v5->_featureInfo[165].requirement = 1007;
          v5->_featureInfo[166].requirement = 1007;
          v5->_featureInfo[167].requirement = 1007;
          v5->_featureInfo[168].requirement = 1007;
          v5->_featureInfo[171].requirement = 1007;
          v5->_featureInfo[172].requirement = 1007;
          v5->_featureInfo[173].requirement = 1007;
          v5->_featureInfo[175].requirement = 1007;
          v5->_featureInfo[176].requirement = 1007;
          v5->_featureInfo[177].requirement = 1007;
          v5->_featureInfo[178].requirement = 1007;
          v5->_featureInfo[179].requirement = 1007;
          v5->_featureInfo[180].requirement = 1007;
          *((_DWORD *)&v5->_featureInfo[180].supported + 1) = *(_DWORD *)&v238[3];
          v5->_featureInfo[82].requirement = 1003;
          v5->_featureInfo[181].name = (NSString *)@"Compute Virtual Substreams";
          *((_DWORD *)&v5->_featureInfo[181].supported + 1) = *(_DWORD *)&v237[3];
          v5->_featureInfo[81].requirement = 1003;
          v5->_featureInfo[182].name = (NSString *)@"SIMD Shuffle and fill";
          *((_DWORD *)&v5->_featureInfo[182].supported + 1) = *(_DWORD *)&v236[3];
          v5->_featureInfo[183].name = (NSString *)@"Bfloat16 Texture format";
          *((_DWORD *)&v5->_featureInfo[183].supported + 1) = *(_DWORD *)&v235[3];
          v5->_featureInfo[184].name = (NSString *)@"Sparse Depth Texture Attachments";
          *((_DWORD *)&v5->_featureInfo[184].supported + 1) = *(_DWORD *)&v234[3];
          v5->_featureInfo[185].name = (NSString *)@"ulong atomic min and max without return";
          *((_DWORD *)&v5->_featureInfo[185].supported + 1) = *(_DWORD *)&v233[3];
          v5->_featureInfo[186].name = (NSString *)@"Texture lossy compression footprint selection";
          v5->_featureInfo[182].requirement = 1008;
          v5->_featureInfo[183].requirement = 1008;
          v5->_featureInfo[184].requirement = 1008;
          v5->_featureInfo[185].requirement = 1008;
          v5->_featureInfo[186].requirement = 1008;
          v5->_featureInfo[77].requirement = 1003;
          v5->_featureInfo[79].requirement = 1003;
          v5->_featureInfo[78].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[186].supported + 1) = *(_DWORD *)&v232[3];
          v5->_featureInfo[187].name = (NSString *)@"Object and Mesh shader stages";
          *((_DWORD *)&v5->_featureInfo[187].supported + 1) = *(_DWORD *)&v231[3];
          v5->_featureInfo[188].name = (NSString *)@"Function Pointers and Ray Tracing from Mesh and Object stages";
          *((_DWORD *)&v5->_featureInfo[188].supported + 1) = *(_DWORD *)&v230[3];
          v5->_featureInfo[204].supported = v10;
          v5->_featureInfo[189].name = (NSString *)@"Mesh shader draws can be encoded into ICBs";
          *(_DWORD *)(&v5->_featureInfo[204].supported + 1) = *(_DWORD *)v214;
          *((_DWORD *)&v5->_featureInfo[189].supported + 1) = *(_DWORD *)&v229[3];
          v5->_featureInfo[190].name = (NSString *)@"Dynamic library linking inside Mesh render pipelines";
          *((_DWORD *)&v5->_featureInfo[190].supported + 1) = *(_DWORD *)&v228[3];
          v5->_featureInfo[191].name = (NSString *)@"Bfloat16 Buffer content";
          v5->_featureInfo[76].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[191].supported + 1) = *(_DWORD *)&v227[3];
          v5->_featureInfo[192].name = (NSString *)@"Command Buffer Jump";
          v5->_featureInfo[70].requirement = 1003;
          v5->_featureInfo[71].requirement = 1003;
          v5->_featureInfo[75].requirement = 1003;
          v5->_featureInfo[72].requirement = 1003;
          v5->_featureInfo[73].requirement = 1003;
          v5->_featureInfo[74].requirement = 1003;
          v5->_featureInfo[141].requirement = 1006;
          v5->_featureInfo[142].requirement = 1006;
          v5->_featureInfo[143].requirement = 1006;
          v5->_featureInfo[144].requirement = 1006;
          v5->_featureInfo[145].requirement = 1006;
          v5->_featureInfo[146].requirement = 1006;
          v5->_featureInfo[147].requirement = 1006;
          v5->_featureInfo[148].requirement = 1006;
          v5->_featureInfo[149].requirement = 1006;
          v5->_featureInfo[150].requirement = 1006;
          v5->_featureInfo[192].requirement = 1003;
          *((_DWORD *)&v5->_featureInfo[192].supported + 1) = *(_DWORD *)&v226[3];
          v5->_featureInfo[151].requirement = 1006;
          v5->_featureInfo[193].name = (NSString *)@"Selection of per-texture color space conversion matrix";
          *((_DWORD *)&v5->_featureInfo[193].supported + 1) = *(_DWORD *)&v225[3];
          v5->_featureInfo[152].requirement = 1006;
          v5->_featureInfo[194].name = (NSString *)@"Selection of lossy compression rate per-iosurface plane";
          *((_DWORD *)&v5->_featureInfo[194].supported + 1) = *(_DWORD *)&v224[3];
          v5->_featureInfo[154].requirement = 1006;
          v5->_featureInfo[195].name = (NSString *)@"Conditional edge checked load/store";
          *((_DWORD *)&v5->_featureInfo[195].supported + 1) = *(_DWORD *)&v223[3];
          v5->_featureInfo[155].requirement = 1006;
          v5->_featureInfo[196].name = (NSString *)@"Stack Overflow, maximum call stack depth exceeded";
          *((_DWORD *)&v5->_featureInfo[196].supported + 1) = *(_DWORD *)&v222[3];
          v5->_featureInfo[156].requirement = 1006;
          v5->_featureInfo[197].name = (NSString *)@"Ray tracing from indirect command buffers";
          *((_DWORD *)&v5->_featureInfo[197].supported + 1) = *(_DWORD *)&v221[3];
          v5->_featureInfo[157].requirement = 1006;
          v5->_featureInfo[198].name = (NSString *)@"Performance State Assertion";
          *((_DWORD *)&v5->_featureInfo[198].supported + 1) = *(_DWORD *)&v220[3];
          v5->_featureInfo[199].name = (NSString *)@"Explicit visibility groups";
          *((_DWORD *)&v5->_featureInfo[199].supported + 1) = *(_DWORD *)&v219[3];
          v5->_featureInfo[200].name = (NSString *)@"Ray Tracing Matrix Layout";
          *((_DWORD *)&v5->_featureInfo[200].supported + 1) = *(_DWORD *)&v218[3];
          v5->_featureInfo[201].name = (NSString *)@"Direct access to ray tracing intersection result state";
          *((_DWORD *)&v5->_featureInfo[201].supported + 1) = *(_DWORD *)&v217[3];
          v5->_featureInfo[202].name = (NSString *)@"Ray tracing per-component motion transform interpolation";
          v5->_featureInfo[188].requirement = 1009;
          v5->_featureInfo[189].requirement = 1009;
          v5->_featureInfo[193].requirement = 1009;
          v5->_featureInfo[194].requirement = 1009;
          v5->_featureInfo[195].requirement = 1009;
          v5->_featureInfo[200].requirement = 1009;
          v5->_featureInfo[201].requirement = 1009;
          v5->_featureInfo[202].requirement = 1009;
          *((_DWORD *)&v5->_featureInfo[202].supported + 1) = *(_DWORD *)&v216[3];
          v5->_featureInfo[203].name = (NSString *)@"Extended Sampler LOD Bias Range";
          *((_DWORD *)&v5->_featureInfo[203].supported + 1) = *(_DWORD *)&v215[3];
          v5->_featureInfo[204].name = (NSString *)@"Device scoped memory coherency for buffers and textures";
          v5->_featureInfo[158].requirement = 1006;
          v5->_featureInfo[159].requirement = 1006;
          v5->_featureInfo[191].requirement = 1006;
          v5->_featureInfo[197].requirement = 1006;
          v5->_featureInfo[204].requirement = 1006;
          *((_DWORD *)&v5->_featureInfo[204].supported + 1) = *(_DWORD *)&v214[3];
          v5->_featureInfo[62].requirement = 0;
          v5->_featureInfo[153].requirement = 0;
          v5->_featureInfo[169].requirement = 0;
          v5->_featureInfo[170].requirement = 0;
          v5->_featureInfo[174].requirement = 0;
          v5->_featureInfo[181].requirement = 0;
          v5->_featureInfo[187].requirement = 0;
          v5->_featureInfo[190].requirement = 0;
          v5->_featureInfo[196].requirement = 0;
          v5->_featureInfo[198].requirement = 0;
          v5->_featureInfo[199].requirement = 0;
          v5->_featureInfo[203].requirement = 0;
          return v5;
        }
        char v7 = 0;
      }
    }
    else if ((unint64_t)v6 > 0xB || ((1 << v6) & 0xFF3) == 0)
    {
      goto LABEL_13;
    }
    v5->isAGX = v7;
    goto LABEL_13;
  }
  return v5;
}

- (BOOL)familySupportsSharedStorageHeapResources
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsGlobalVariableBindingInDylibs
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsDepthClipMode
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1002];
}

- (BOOL)familySupportsNonUniformThreadgroupSize
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsTextureCubeArray
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsTessellation
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsReadWriteTextureCubeArguments
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsProgrammableBlending
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsMSAAStencilResolve
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsMSAADepthResolve
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsLayeredRendering
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsBaseVertexInstanceDrawing
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsSIMDShuffleAndFill
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1008];
}

- (BOOL)familySupportsSIMDReduction
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupports32BitFloatFiltering
{
  return [(MTLDeviceSPI *)self->_device isFloat32FilteringSupported];
}

- (BOOL)familySupportsWritableArrayOfTextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsSIMDShufflesAndBroadcast
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsQuadShufflesAndBroadcast
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsNorm16BCubicFiltering
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsFunctionPointersFromRender
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsFloat16BCubicFiltering
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsConditionalLoadStore
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1009];
}

- (BOOL)familySupportsCommandBufferJump
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsArrayOfTextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsYCBCRPackedFormats12
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsYCBCRFormats12
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsTileShaders
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsSIMDGroup
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRasterOrderGroups
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsNativeHardwareFP16
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsBinaryArchives
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsBufferlessClientStorageTexture
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsComputeMemoryBarrier
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsRenderMemoryBarrier
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsPartialRenderMemoryBarrier
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsArgumentBuffersTier2
{
  return [(MTLDeviceSPI *)self->_device argumentBuffersSupport] == 1;
}

- (BOOL)familySupportsStreamingCodecSignaling
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsProgrammableSamplePositions
{
  return [(MTLDeviceSPI *)self->_device areProgrammableSamplePositionsSupported];
}

- (BOOL)familySupportsLargeFramebufferConfigs
{
  return [(MTLDeviceSPI *)self->_device isLargeMRTSupported];
}

- (BOOL)familySupportsCustomBorderColor
{
  return [(MTLDeviceSPI *)self->_device isCustomBorderColorSupported];
}

- (BOOL)familySupportsSamplerAddressModeClampToHalfBorder
{
  return [(MTLDeviceSPI *)self->_device isClampToHalfBorderSupported];
}

- (BOOL)familySupportsBCTextureCompression
{
  return [(MTLDeviceSPI *)self->_device isBCTextureCompressionSupported];
}

- (BOOL)familySupports3DBCTextures
{
  return [(MTLDeviceSPI *)self->_device isBCTextureCompressionSupported];
}

- (BOOL)familySupportsRGBA10A2Gamma
{
  return [(MTLDeviceSPI *)self->_device isRGB10A2GammaSupported];
}

- (BOOL)familySupportsBGR10A2
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsPrimitiveRestartOverride
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsGlobalVariableRelocation
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsGlobalVariableRelocationRender
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsTLS
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsGlobalVariableBindings
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupports32bpcMSAATextures
{
  return [(MTLDeviceSPI *)self->_device isMsaa32bSupported];
}

- (BOOL)familySupports32BitMSAA
{
  return [(MTLDeviceSPI *)self->_device isMsaa32bSupported];
}

- (BOOL)familySupportsQueryTextureLOD
{
  return 0;
}

- (BOOL)familySupportsVertexAmplification
{
  return [(MTLDeviceSPI *)self->_device supportsVertexAmplificationCount:2];
}

- (BOOL)familySupportsPlacementHeaps
{
  return [(MTLDeviceSPI *)self->_device isPlacementHeapSupported];
}

- (BOOL)familySupportsOpenCLTextureWriteSwizzles
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsPullModelInterpolation
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsInt64
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsFixedLinePointFillDepthGradient
{
  return [(MTLDeviceSPI *)self->_device isFixedLinePointFillDepthGradientSupported];
}

- (BOOL)familySupportsLateEvalEvent
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsNonZeroTextureWriteLOD
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsSharedTextureHandles
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsBufferPrefetchStatistics
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsLimitedYUVFormats
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsSharedStorageTextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsLinearTextureFromSharedBuffer
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsPipelineLibraries
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsFragmentOnlyEncoders
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsBufferWithIOSurface
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsRenderToLinearTextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsMemorylessRenderTargets
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsFastMathInfNaNPropagation
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsInvariantVertexPosition
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsShaderLODAverage
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsRelaxedTextureViewRequirements
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsGPUStatistics
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsCompressedTextureViewSPI
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsRenderTargetTextureRotation
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsDynamicControlPointCount
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsIABHashForTools
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsBinaryLibraries
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsDeadlineProfile
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsFillTexture
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1001];
}

- (BOOL)familySupportsSetThreadgroupPackingDisabled
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsASTCTextureCompression
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1002];
}

- (BOOL)familySupportsExtendedYUVFormats
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1002];
}

- (BOOL)familySupportsPublicXR10Formats
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1002];
}

- (BOOL)familySupportsSRGBwrites
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1002];
}

- (BOOL)familySupportsResourceHeaps
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1002];
}

- (BOOL)familySupportsArgumentBuffers
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1002];
}

- (BOOL)familySupportsPacked32TextureBufferWrites
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupports3DASTCTextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsFragmentBufferWrites
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsCountingOcclusionQuery
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsIndirectDrawAndDispatch
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsReadWriteBufferArguments
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsArrayOfSamplers
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsCombinedMSAAStoreAndResolveAction
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsMutableTier1ArgumentBuffers
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsSamplerCompareFunction
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsMSAADepthResolveFilter
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsGFXIndirectCommandBuffers
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsCMPIndirectCommandBuffers
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsIndirectStageInRegion
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsIndirectTextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsTextureOutOfBoundsReads
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1003];
}

- (BOOL)familySupportsAlphaYUVFormats
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsMemoryOrderAtomics
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsQuadGroup
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsRenderTextureWrites
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsImageBlocks
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsImageBlockSampleCoverageControl
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsPostDepthCoverage
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsMipLevelsSmallerThanBlockSize
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsReadWriteTextureArguments
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsConcurrentComputeDispatch
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsRasterOrderGroupsColorAttachment
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsDynamicAttributeStride
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1004];
}

- (BOOL)familySupportsLinearTexture2DArray
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsNonSquareTileShaders
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupports2DLinearTexArraySPI
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsViewportAndScissorArray
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsIndirectTessellation
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsMSAAStencilResolveFilter
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsStencilFeedback
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsFP32TessFactors
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsExtendedVertexFormats
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsResourceDetachBacking
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsBufferWithAddressRanges
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsHeapWithAddressRanges
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1005];
}

- (BOOL)familySupportsShaderMinLODClamp
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsVariableRateRasterization
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsYCBCRFormats
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsYCBCRFormatsPQ
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsYCBCRFormatsXR
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsASTCHDRTextureCompression
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsSparseTextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsSparseHeaps
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsIndirectWritableTextures
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsFunctionPointers
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsDynamicLibraries
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsStatefulDynamicLibraries
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRenderDynamicLibraries
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsSharedFunctionTables
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRaytracingFromRender
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsPrimitiveMotionBlur
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRayTracingExtendedVertexFormats
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsHeapAccelerationStructureAllocation
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRayTracingPerPrimitiveData
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRayTracingTraversalMetrics
{
  device = self->_device;
  int v3 = [(MTLDeviceSPI *)device supportsRaytracing];
  if (v3)
  {
    LOBYTE(v3) = [(MTLDeviceSPI *)device requiresRaytracingEmulation];
  }
  return v3;
}

- (BOOL)familySupportsRayTracingBuffersFromTables
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRayTracingAccelerationStructureCPUDeserialization
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRayTracingMultiLevelInstancing
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRayTracingIndirectInstanceAccelerationStructureBuild
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRayTracingGPUTableUpdateBuffers
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsRayTracingCurves
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsShaderBarycentricCoordinates
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsBlackOrWhiteSamplerBorderColors
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsMirrorClampToEdgeSamplerMode
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsDepthClipModeClampExtended
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsTexture2DMultisampleArray
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsForceSeamsOnCubemaps
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsFloat16InfNanFiltering
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsRTZRounding
{
  return [(MTLDeviceSPI *)self->_device isRTZRoundingSupported];
}

- (BOOL)familySupportsAnisoSampleFix
{
  return [(MTLDeviceSPI *)self->_device isAnisoSampleFixSupported];
}

- (BOOL)familySupportsYCBCRPackedFormatsPQ
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsYCBCRPackedFormatsXR
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsBufferBoundsChecking
{
  return 0;
}

- (BOOL)familySupportsForkJoin
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsDevicePartitioning
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsComputeCompressedTextureWrite
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsSIMDGroupMatrix
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsInterchangeTiled
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsQuadReduction
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1007];
}

- (BOOL)familySupportsVirtualSubstreams
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsBfloat16Format
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1008];
}

- (BOOL)familySupportsSparseDepthAttachments
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1008];
}

- (BOOL)familySupportsAtomicUlongVoidMinMax
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1008];
}

- (BOOL)familySupportsLossyCompression
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1008];
}

- (BOOL)familySupportsMeshShaders
{
  return 0;
}

- (BOOL)familySupportsFunctionPointersFromMesh
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1009];
}

- (BOOL)familySupportsMeshShadersInICB
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1009];
}

- (BOOL)familySupportsMeshRenderDynamicLibraries
{
  return 0;
}

- (BOOL)familySupportsColorSpaceConversionMatrixSelection
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1009];
}

- (BOOL)familySupportsPerPlaneCompression
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1009];
}

- (BOOL)familySupportsStackOverflowErrorCode
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsRayTracingICBs
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (BOOL)familySupportsPerformanceStateAssertion
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsExplicitVisibilityGroups
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsRayTracingMatrixLayout
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1009];
}

- (BOOL)familySupportsRayTracingDirectIntersectionResultAccess
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1009];
}

- (BOOL)familySupportsRayTracingPerComponentMotionInterpolation
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1009];
}

- (BOOL)familySupportsExtendedSamplerLODBiasRange
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:0];
}

- (BOOL)familySupportsDeviceCoherency
{
  return [(MTLDeviceSPI *)self->_device supportsFamily:1006];
}

- (int64_t)requirementForFeature:(int64_t)a3
{
  if (a3 > 204) {
    return 0;
  }
  else {
    return self->_featureInfo[a3].requirement;
  }
}

- (BOOL)supportForFeature:(int64_t)a3
{
  return a3 <= 204 && self->_featureInfo[a3].supported;
}

- (id)nameForFeature:(int64_t)a3
{
  if (a3 > 204) {
    return 0;
  }
  else {
    return self->_featureInfo[a3].name;
  }
}

@end