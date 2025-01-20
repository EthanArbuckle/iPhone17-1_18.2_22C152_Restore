@interface MTLRenderPipelineDescriptorInternal
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxPipelineChildren;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)meshThreadsPerThreadgroup;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)objectThreadsPerThreadgroup;
- (BOOL)forceResourceIndex;
- (BOOL)forceSoftwareVertexFetch;
- (BOOL)isAlphaTestEnabled;
- (BOOL)isAlphaToCoverageEnabled;
- (BOOL)isAlphaToOneEnabled;
- (BOOL)isDepthStencilWriteDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLogicOperationEnabled;
- (BOOL)isPointCoordLowerLeft;
- (BOOL)isPointSizeOutputVS;
- (BOOL)isPointSmoothEnabled;
- (BOOL)isRasterizationEnabled;
- (BOOL)isTessellationFactorScaleEnabled;
- (BOOL)isTwoSideEnabled;
- (BOOL)meshThreadgroupSizeIsMultipleOfThreadExecutionWidth;
- (BOOL)needsCustomBorderColorSamplers;
- (BOOL)objectThreadgroupSizeIsMultipleOfThreadExecutionWidth;
- (BOOL)openGLModeEnabled;
- (BOOL)sampleCoverageInvert;
- (BOOL)supportAddingFragmentBinaryFunctions;
- (BOOL)supportAddingMeshBinaryFunctions;
- (BOOL)supportAddingObjectBinaryFunctions;
- (BOOL)supportAddingVertexBinaryFunctions;
- (BOOL)supportIndirectCommandBuffers;
- (BOOL)validateWithDevice:(id)a3 error:(id *)a4;
- (MTLRenderPipelineDescriptorInternal)init;
- (const)_descriptorPrivate;
- (float)sampleCoverage;
- (id)binaryArchives;
- (id)colorAttachments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)driverCompilerOptions;
- (id)formattedDescription:(unint64_t)a3;
- (id)fragmentBuffers;
- (id)fragmentFunction;
- (id)fragmentLinkedFunctions;
- (id)fragmentPreloadedLibraries;
- (id)gpuCompilerSPIOptions;
- (id)insertFragmentLibraries;
- (id)insertMeshLibraries;
- (id)insertObjectLibraries;
- (id)insertVertexLibraries;
- (id)label;
- (id)meshBuffers;
- (id)meshFunction;
- (id)meshLinkedFunctions;
- (id)meshPreloadedLibraries;
- (id)newSerializedFragmentDataWithFlags:(unint64_t)a3 options:(unint64_t)a4;
- (id)newSerializedMeshDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newSerializedObjectDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newSerializedVertexDataWithFlags:(unint64_t)a3 error:(id *)a4;
- (id)newSerializedVertexDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)objectBuffers;
- (id)objectFunction;
- (id)objectLinkedFunctions;
- (id)objectPreloadedLibraries;
- (id)pipelineLibrary;
- (id)pluginData;
- (id)profileControl;
- (id)serializeFragmentData;
- (id)vertexBuffers;
- (id)vertexDescriptor;
- (id)vertexFunction;
- (id)vertexLinkedFunctions;
- (id)vertexPreloadedLibraries;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteRoundingMode;
- (uint64_t)fastBlendDescriptorAtIndex:(uint64_t)a3;
- (uint64_t)internalPipeline;
- (uint64_t)setInternalPipeline:(uint64_t)result;
- (uint64_t)setTextureWriteFPRoundingMode:(uint64_t)result;
- (uint64_t)textureWriteFPRoundingMode;
- (unint64_t)alphaTestFunction;
- (unint64_t)colorSampleCount;
- (unint64_t)depthAttachmentPixelFormat;
- (unint64_t)hash;
- (unint64_t)inputPrimitiveTopology;
- (unint64_t)logicOperation;
- (unint64_t)maxAccelerationStructureTraversalDepth;
- (unint64_t)maxFragmentCallStackDepth;
- (unint64_t)maxMeshCallStackDepth;
- (unint64_t)maxObjectCallStackDepth;
- (unint64_t)maxTessellationFactor;
- (unint64_t)maxTotalThreadsPerMeshThreadgroup;
- (unint64_t)maxTotalThreadsPerObjectThreadgroup;
- (unint64_t)maxVertexAmplificationCount;
- (unint64_t)maxVertexCallStackDepth;
- (unint64_t)pipelineMemoryLength;
- (unint64_t)postVertexDumpBufferIndex;
- (unint64_t)rasterSampleCount;
- (unint64_t)resourceIndex;
- (unint64_t)sampleMask;
- (unint64_t)stencilAttachmentPixelFormat;
- (unint64_t)tessellationControlPointIndexType;
- (unint64_t)tessellationFactorFormat;
- (unint64_t)tessellationFactorStepFunction;
- (unint64_t)tessellationOutputWindingOrder;
- (unint64_t)tessellationPartitionMode;
- (unint64_t)vertexAmplificationMode;
- (unsigned)clipDistanceEnableMask;
- (unsigned)explicitVisibilityGroupID;
- (unsigned)fragmentDepthCompareClampMask;
- (unsigned)vertexDepthCompareClampMask;
- (void)attachVertexDescriptor:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setAlphaTestEnabled:(BOOL)a3;
- (void)setAlphaTestFunction:(unint64_t)a3;
- (void)setAlphaToCoverageEnabled:(BOOL)a3;
- (void)setAlphaToOneEnabled:(BOOL)a3;
- (void)setBinaryArchives:(id)a3;
- (void)setClipDistanceEnableMask:(unsigned __int8)a3;
- (void)setColorSampleCount:(unint64_t)a3;
- (void)setDepthAttachmentPixelFormat:(unint64_t)a3;
- (void)setDepthStencilWriteDisabled:(BOOL)a3;
- (void)setDriverCompilerOptions:(id)a3;
- (void)setExplicitVisibilityGroupID:(unsigned int)a3;
- (void)setForceResourceIndex:(BOOL)a3;
- (void)setForceSoftwareVertexFetch:(BOOL)a3;
- (void)setFragmentDepthCompareClampMask:(unsigned int)a3;
- (void)setFragmentFunction:(id)a3;
- (void)setFragmentLinkedFunctions:(id)a3;
- (void)setFragmentPreloadedLibraries:(id)a3;
- (void)setGpuCompilerSPIOptions:(id)a3;
- (void)setInputPrimitiveTopology:(unint64_t)a3;
- (void)setInsertFragmentLibraries:(id)a3;
- (void)setInsertMeshLibraries:(id)a3;
- (void)setInsertObjectLibraries:(id)a3;
- (void)setInsertVertexLibraries:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLogicOperation:(unint64_t)a3;
- (void)setLogicOperationEnabled:(BOOL)a3;
- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3;
- (void)setMaxFragmentCallStackDepth:(unint64_t)a3;
- (void)setMaxMeshCallStackDepth:(unint64_t)a3;
- (void)setMaxObjectCallStackDepth:(unint64_t)a3;
- (void)setMaxPipelineChildren:(id *)a3;
- (void)setMaxTessellationFactor:(unint64_t)a3;
- (void)setMaxTotalThreadsPerMeshThreadgroup:(unint64_t)a3;
- (void)setMaxTotalThreadsPerObjectThreadgroup:(unint64_t)a3;
- (void)setMaxVertexAmplificationCount:(unint64_t)a3;
- (void)setMaxVertexCallStackDepth:(unint64_t)a3;
- (void)setMeshFunction:(id)a3;
- (void)setMeshLinkedFunctions:(id)a3;
- (void)setMeshPreloadedLibraries:(id)a3;
- (void)setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a3;
- (void)setMeshThreadsPerThreadgroup:(id *)a3;
- (void)setNeedsCustomBorderColorSamplers:(BOOL)a3;
- (void)setObjectFunction:(id)a3;
- (void)setObjectLinkedFunctions:(id)a3;
- (void)setObjectPreloadedLibraries:(id)a3;
- (void)setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a3;
- (void)setObjectThreadsPerThreadgroup:(id *)a3;
- (void)setOpenGLModeEnabled:(BOOL)a3;
- (void)setPipelineLibrary:(id)a3;
- (void)setPipelineMemoryLength:(unint64_t)a3;
- (void)setPluginData:(id)a3;
- (void)setPointCoordLowerLeft:(BOOL)a3;
- (void)setPointSizeOutputVS:(BOOL)a3;
- (void)setPointSmoothEnabled:(BOOL)a3;
- (void)setPostVertexDumpBufferIndex:(unint64_t)a3;
- (void)setProfileControl:(id)a3;
- (void)setRasterSampleCount:(unint64_t)a3;
- (void)setRasterizationEnabled:(BOOL)a3;
- (void)setResourceIndex:(unint64_t)a3;
- (void)setSampleCoverage:(float)a3;
- (void)setSampleCoverageInvert:(BOOL)a3;
- (void)setSampleMask:(unint64_t)a3;
- (void)setShaderValidation:(int64_t)a3;
- (void)setShaderValidationState:(int64_t)a3;
- (void)setStencilAttachmentPixelFormat:(unint64_t)a3;
- (void)setSupportAddingFragmentBinaryFunctions:(BOOL)a3;
- (void)setSupportAddingMeshBinaryFunctions:(BOOL)a3;
- (void)setSupportAddingObjectBinaryFunctions:(BOOL)a3;
- (void)setSupportAddingVertexBinaryFunctions:(BOOL)a3;
- (void)setSupportIndirectCommandBuffers:(BOOL)a3;
- (void)setTessellationControlPointIndexType:(unint64_t)a3;
- (void)setTessellationFactorFormat:(unint64_t)a3;
- (void)setTessellationFactorScaleEnabled:(BOOL)a3;
- (void)setTessellationFactorStepFunction:(unint64_t)a3;
- (void)setTessellationOutputWindingOrder:(unint64_t)a3;
- (void)setTessellationPartitionMode:(unint64_t)a3;
- (void)setTextureWriteRoundingMode:(int64_t)a3;
- (void)setTwoSideEnabled:(BOOL)a3;
- (void)setVertexAmplificationMode:(unint64_t)a3;
- (void)setVertexDepthCompareClampMask:(unsigned int)a3;
- (void)setVertexDescriptor:(id)a3;
- (void)setVertexFunction:(id)a3;
- (void)setVertexLinkedFunctions:(id)a3;
- (void)setVertexPreloadedLibraries:(id)a3;
- (void)validateWithDevice:(id)a3;
@end

@implementation MTLRenderPipelineDescriptorInternal

- (id)newSerializedVertexDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  unsigned int v5 = a3;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  uint64_t __src = 0;
  uint64_t v36 = 0;
  unsigned int v37 = 0;
  p_private = &self->_private;
  unsigned int v7 = ((a4 >> 14) | (self->_private.var2.miscHash[0] << 12)) & 0x80400 | (self->_private.var2.miscHash[0] >> 2) & 1;
  uint64_t v8 = [(MTLFunction *)self->_private.vertexFunction patchType];
  int v9 = v5 & 0x18 | v7;
  if (v8)
  {
    if ((((v5 >> 3) | (v5 >> 4)) & 1) == 0)
    {
LABEL_3:
      int v10 = 0;
      goto LABEL_6;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  int v10 = 4;
LABEL_6:
  int v11 = v10 | v9;
  $65165931DE83DC9F336BFC9DC178100F var2 = p_private->var2;
  int v13 = v9 | 4;
  if ((*(void *)&var2 & 0x200000000) != 0) {
    int v13 = v7 | 0x1C;
  }
  if ((*(void *)&var2 & 0x200000080) == 0) {
    int v13 = v11;
  }
  unsigned int v14 = v13 & 0x8049F | (32 * ((var2.miscHash[0] >> 3) & 3)) & 0xFFF804FF | ((p_private->tessellationControlPointIndexType & 3) << 8) & 0x7FF | (LODWORD(p_private->postVertexDumpBufferIndex) << 11);
  LODWORD(v36) = v14;
  vertexLinkedFunctions = p_private->vertexLinkedFunctions;
  if (vertexLinkedFunctions
    && ([(MTLLinkedFunctions *)vertexLinkedFunctions functions]
     && [(NSArray *)[(MTLLinkedFunctions *)p_private->vertexLinkedFunctions functions] count]
     || [(MTLLinkedFunctions *)p_private->vertexLinkedFunctions privateFunctions]
     && [(NSArray *)[(MTLLinkedFunctions *)p_private->vertexLinkedFunctions privateFunctions] count]))
  {
    v14 |= 0x100000u;
    LODWORD(v36) = v14;
  }
  if ((v14 & 0x100000) != 0) {
    uint64_t v16 = 20;
  }
  else {
    uint64_t v16 = 12;
  }
  if ((v14 & 4) != 0
    && (vertexDescriptor = p_private->vertexDescriptor) != 0
    && (v18 = [(MTLVertexDescriptorInternal *)vertexDescriptor newSerializedDescriptor]) != 0)
  {
    v19 = v18;
    v14 |= 2u;
    LODWORD(v36) = v14;
    v20 = dispatch_data_create_map(v18, (const void **)&buffer_ptr, &size_ptr);
    size_t v21 = size_ptr + v16;
    dispatch_release(v19);
  }
  else
  {
    v20 = 0;
    size_t v21 = v16;
  }
  size_t v33 = 0;
  v34 = 0;
  fragmentFunction = p_private->fragmentFunction;
  if (fragmentFunction && (v23 = [(MTLFunction *)fragmentFunction functionInputs]) != 0)
  {
    v24 = dispatch_data_create_map(v23, (const void **)&v34, &v33);
    v21 += v33;
    v14 |= 0x80u;
    LODWORD(v36) = v14;
  }
  else
  {
    v24 = 0;
  }
  v25 = (void *)[(MTLFunction *)p_private->vertexFunction device];
  if (!v25) {
    v25 = (void *)[(MTLFunction *)p_private->meshFunction device];
  }
  uint64_t v26 = MTLSerializePluginDataDictionary((void *)[v25 pluginData], 0);
  uint64_t v27 = v26;
  if (v26)
  {
    LODWORD(__src) = v21;
    v21 += v26;
  }
  uint64_t v28 = MTLSerializePluginDataDictionary(p_private->pluginData, 0);
  uint64_t v29 = v28;
  if (v28)
  {
    HIDWORD(__src) = v21;
    v21 += v28;
  }
  if ((v14 & 0x100000) != 0) {
    _MTLPopulateLinkedFunctionExtraData(p_private->vertexLinkedFunctions);
  }
  v30 = (char *)malloc_type_malloc(v21, 0xF6397F46uLL);
  memcpy(v30, &__src, v16);
  v31 = &v30[v16];
  if (v20)
  {
    memcpy(v31, buffer_ptr, size_ptr);
    v31 += size_ptr;
    dispatch_release(v20);
  }
  if (v24)
  {
    memcpy(v31, v34, v33);
    v31 += v33;
    dispatch_release(v24);
  }
  if (v27) {
    v31 += MTLSerializePluginDataDictionary((void *)[v25 pluginData], v31);
  }
  if (v29) {
    MTLSerializePluginDataDictionary(p_private->pluginData, v31);
  }
  if ((v36 & 0x100000) != 0)
  {
    memcpy(&v30[HIDWORD(v36)], MEMORY[0], v37);
    free(MEMORY[0]);
    MEMORY[0x18530C140](0, 0x1010C40113C0ABBLL);
  }
  return dispatch_data_create(v30, v21, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
}

- (BOOL)validateWithDevice:(id)a3 error:(id *)a4
{
  p_private = &self->_private;
  char v8 = [a3 supportsTextureSampleCount:self->_private.var0.sampleCount];
  if (v8)
  {
    if ((*((unsigned char *)&p_private->var2.var0 + 4) & 0x10) == 0) {
      [a3 registerRenderPipelineDescriptor:self];
    }
    validateWithDevice((id *)a3, (uint64_t)p_private);
  }
  else
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"rasterSampleCount (%lu) is not supported by device.", p_private->var0.sampleCount);
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v9 forKey:*MEMORY[0x1E4F28568]];
    *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PipelineError" code:1 userInfo:v10];
  }
  return v8;
}

- (id)vertexLinkedFunctions
{
  p_private = &self->_private;
  id result = self->_private.vertexLinkedFunctions;
  if (!result)
  {
    id result = objc_alloc_init(MTLLinkedFunctions);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&p_private->vertexLinkedFunctions, (unint64_t *)&v4, (unint64_t)result);
    if (v4)
    {

      return p_private->vertexLinkedFunctions;
    }
    else
    {
      p_private->vertexLinkedFunctions = (MTLLinkedFunctions *)result;
    }
  }
  return result;
}

- (BOOL)supportIndirectCommandBuffers
{
  return self->_private.supportIndirectCommandBuffers;
}

- (id)meshFunction
{
  return self->_private.meshFunction;
}

- (id)vertexFunction
{
  return self->_private.vertexFunction;
}

- (id)fragmentFunction
{
  return self->_private.fragmentFunction;
}

- (BOOL)needsCustomBorderColorSamplers
{
  return self->_private.needsCustomBorderColorSamplers;
}

- (unint64_t)tessellationPartitionMode
{
  return self->_private.tessellationPartitionMode;
}

- (unint64_t)maxVertexAmplificationCount
{
  return self->_private.maxVertexAmplificationCount;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (BOOL)supportAddingVertexBinaryFunctions
{
  return self->_private.supportAddingVertexBinaryFunctions;
}

- (unint64_t)tessellationFactorStepFunction
{
  return self->_private.tessellationFactorStepFunction;
}

- (unint64_t)tessellationFactorFormat
{
  return self->_private.tessellationFactorFormat;
}

- (BOOL)isRasterizationEnabled
{
  return (LOBYTE(self->_private.var2.miscHash[0]) >> 2) & 1;
}

- (BOOL)isTessellationFactorScaleEnabled
{
  return self->_private.tessellationFactorScaleEnabled;
}

- (id)objectFunction
{
  return self->_private.objectFunction;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_private.textureWriteRoundingMode;
}

- (unsigned)vertexDepthCompareClampMask
{
  return self->_private.vertexDepthCompareClampMask;
}

- (unsigned)clipDistanceEnableMask
{
  return self->_private.var2.miscHash[0] >> 15;
}

- (unint64_t)vertexAmplificationMode
{
  return (*(void *)&self->_private.var2 >> 10) & 1;
}

- (unint64_t)inputPrimitiveTopology
{
  return (*(void *)&self->_private.var2 >> 3) & 3;
}

- (unint64_t)tessellationOutputWindingOrder
{
  return self->_private.tessellationOutputWindingOrder;
}

- (unint64_t)maxTessellationFactor
{
  return self->_private.maxTessellationFactor;
}

- (unint64_t)tessellationControlPointIndexType
{
  return self->_private.tessellationControlPointIndexType;
}

- (id)label
{
  return self->_private.label;
}

- (void)setVertexDescriptor:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setVertexDescriptor:]", 3743, @"vertexDescriptor is not a MTLVertexDescriptor.", v5, v6, v7, v8, v11);
    }
  }
  p_private = &self->_private;
  vertexDescriptor = p_private->vertexDescriptor;
  if (vertexDescriptor != a3)
  {

    p_private->vertexDescriptor = (MTLVertexDescriptorInternal *)[a3 copy];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = 0;
    p_private = &self->_private;
    uint64_t v9 = (void *)(v5 + 48);
    do
    {
      *(void *)(*v9 + 8 + v7 * 8) = [(MTLRenderPipelineColorAttachmentDescriptorInternal *)p_private->attachments->_descriptors[v7] copyWithZone:a3];
      ++v7;
    }
    while (v7 != 8);
    *(_OWORD *)(v6 + 120) = *(_OWORD *)&p_private->depthAttachmentPixelFormat;
    *(_OWORD *)(v6 + 136) = *(_OWORD *)&p_private->tessellationPartitionMode;
    *(unsigned char *)(v6 + 152) = p_private->tessellationFactorScaleEnabled;
    *(_OWORD *)(v6 + 160) = *(_OWORD *)&p_private->tessellationFactorFormat;
    *(_OWORD *)(v6 + 176) = *(_OWORD *)&p_private->tessellationFactorStepFunction;
    *(unsigned char *)(v6 + 200) = p_private->supportIndirectCommandBuffers;
    *(void *)(v6 + 224) = p_private->textureWriteRoundingMode;
    *(void *)(v6 + 272) = *(void *)(v6 + 272) & 0xFFFFFFFEFFFFFFFFLL | ((HIDWORD(*(void *)&p_private->var2) & 1) << 32);
    *(void *)(v6 + 288) = p_private->resourceIndex;
    *(void *)(v6 + 192) = p_private->postVertexDumpBufferIndex;
    *(void *)(v6 + 280) = *(void *)&p_private->vertexDepthCompareClampMask;
    *(unsigned char *)(v6 + 520) = p_private->needsCustomBorderColorSamplers;
    *(void *)(v6 + 232) = p_private->var0.sampleCount;
    *(void *)(v6 + 240) = p_private->sampleMask;
    *(_DWORD *)(v6 + 248) = p_private->var1.sampleCoverageHash;
    *(void *)(v6 + 264) = p_private->colorSampleCount;
    *(_DWORD *)(v6 + 272) = p_private->var2.miscHash[0];
    *(_DWORD *)(v6 + 276) = p_private->var2.miscHash[1];
    *(void *)(v6 + 296) = [(NSString *)p_private->label copyWithZone:a3];
    *(void *)(v6 + 488) = p_private->pipelineLibrary;
    *(void *)(v6 + 320) = [(MTLVertexDescriptorInternal *)p_private->vertexDescriptor copyWithZone:a3];
    *(void *)(v6 + 304) = p_private->vertexFunction;
    uint64_t v10 = 0;
    *(void *)(v6 + 312) = p_private->fragmentFunction;
    do
    {
      *(void *)(*(void *)(v6 + 456) + 8 + v10 * 8) = [(MTLPipelineBufferDescriptorInternal *)p_private->vertexBuffers->_descriptors[v10] copyWithZone:a3];
      ++v10;
    }
    while (v10 != 31);
    for (uint64_t i = 0; i != 31; ++i)
      *(void *)(*(void *)(v6 + 464) + 8 + i * 8) = [(MTLPipelineBufferDescriptorInternal *)p_private->fragmentBuffers->_descriptors[i] copyWithZone:a3];
    *(void *)(v6 + 472) = [(NSDictionary *)p_private->driverCompilerOptions copy];
    *(void *)(v6 + 480) = [(NSDictionary *)p_private->gpuCompilerSPIOptions copy];
    *(_DWORD *)(v6 + 524) = p_private->maxVertexAmplificationCount;
    *(void *)(v6 + 512) = p_private->pluginData;
    *(void *)(v6 + 528) = [(NSArray *)p_private->binaryArchives copy];
    *(void *)(v6 + 328) = p_private->objectFunction;
    uint64_t v12 = 0;
    *(void *)(v6 + 336) = p_private->meshFunction;
    unint64_t depth = p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth;
    *(_OWORD *)(v6 + 344) = *(_OWORD *)&p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width;
    *(void *)(v6 + 360) = depth;
    long long v14 = *(_OWORD *)&p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width;
    *(void *)(v6 + 384) = p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth;
    *(_OWORD *)(v6 + 368) = v14;
    unint64_t maxTotalThreadsPerMeshThreadgroup = p_private->maxTotalThreadsPerMeshThreadgroup;
    *(void *)(v6 + 440) = p_private->maxTotalThreadsPerObjectThreadgroup;
    *(void *)(v6 + 448) = maxTotalThreadsPerMeshThreadgroup;
    long long v16 = *(_OWORD *)&p_private->maxPipelineChildren.width;
    *(void *)(v6 + 408) = p_private->maxPipelineChildren.depth;
    *(_OWORD *)(v6 + 392) = v16;
    *(void *)(v6 + 416) = p_private->pipelineMemoryLength;
    do
    {
      *(void *)(*(void *)(v6 + 424) + 8 + v12 * 8) = [(MTLPipelineBufferDescriptorInternal *)p_private->objectBuffers->_descriptors[v12] copyWithZone:a3];
      ++v12;
    }
    while (v12 != 31);
    for (uint64_t j = 0; j != 31; ++j)
      *(void *)(*(void *)(v6 + 432) + 8 + j * 8) = [(MTLPipelineBufferDescriptorInternal *)p_private->meshBuffers->_descriptors[j] copyWithZone:a3];
    *(void *)(v6 + 536) = [(MTLLinkedFunctions *)p_private->vertexLinkedFunctions copy];
    *(void *)(v6 + 544) = [(MTLLinkedFunctions *)p_private->fragmentLinkedFunctions copy];
    *(void *)(v6 + 552) = [(MTLLinkedFunctions *)p_private->objectLinkedFunctions copy];
    *(void *)(v6 + 560) = [(MTLLinkedFunctions *)p_private->meshLinkedFunctions copy];
    *(void *)(v6 + 568) = [(NSArray *)p_private->vertexPreloadedLibraries copy];
    *(void *)(v6 + 576) = [(NSArray *)p_private->fragmentPreloadedLibraries copy];
    *(void *)(v6 + 584) = [(NSArray *)p_private->objectPreloadedLibraries copy];
    *(void *)(v6 + 592) = [(NSArray *)p_private->meshPreloadedLibraries copy];
    *(void *)(v6 + 600) = p_private->maxVertexStackCallDepth;
    *(void *)(v6 + 608) = p_private->maxFragmentStackCallDepth;
    *(_WORD *)(v6 + 616) = *(_WORD *)&p_private->supportAddingVertexBinaryFunctions;
    *(_OWORD *)(v6 + 624) = *(_OWORD *)&p_private->maxMeshStackCallDepth;
    *(_WORD *)(v6 + 640) = *(_WORD *)&p_private->supportAddingMeshBinaryFunctions;
    *(void *)(v6 + 648) = [(MTLProfileControl *)p_private->profileControl copy];
    *(_DWORD *)(v6 + 656) = p_private->explicitVisibilityGroupID;
    *(void *)(v6 + 664) = p_private->maxAccelerationStructureTraversalDepth;
    *(_OWORD *)(v6 + 208) = *(_OWORD *)&p_private->shaderValidation;
    *(void *)(v6 + 272) = *(void *)(v6 + 272) & 0xFFFFFFEFFFFFFFFFLL | (((*(void *)&p_private->var2 >> 36) & 1) << 36);
  }
  return (id)v6;
}

- (MTLRenderPipelineDescriptorInternal)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTLRenderPipelineDescriptorInternal;
  v2 = [(MTLRenderPipelineDescriptorInternal *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_private.$65165931DE83DC9F336BFC9DC178100F var2 = 0;
    v2->_private.attachments = objc_alloc_init(MTLRenderPipelineColorAttachmentDescriptorArrayInternal);
    v3->_private.depthAttachmentPixelFormat = 0;
    v3->_private.stencilAttachmentPixelFormat = 0;
    v3->_private.tessellationPartitionMode = 0;
    v3->_private.maxTessellationFactor = 16;
    v3->_private.tessellationFactorScaleEnabled = 0;
    *(_OWORD *)&v3->_private.tessellationFactorFormat = 0u;
    *(_OWORD *)&v3->_private.tessellationFactorStepFunction = 0u;
    v3->_private.postVertexDumpBufferIndex = 0;
    *(_OWORD *)&v3->_private.var0.sampleCount = xmmword_1828F2180;
    v3->_private.var1.sampleCoverageHash = 1065353216;
    uint64_t v4 = *(void *)&v3->_private.var2 | 0x7F8004;
    v3->_private.colorSampleCount = 0;
    v3->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)v4;
    v3->_private.vertexBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v3->_private.fragmentBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v3->_private.supportIndirectCommandBuffers = 0;
    $65165931DE83DC9F336BFC9DC178100F var2 = v3->_private.var2;
    v3->_private.resourceIndex = 0;
    v3->_private.explicitVisibilityGroupID = -1;
    v3->_private.textureWriteRoundingMode = 0;
    v3->_private.maxVertexAmplificationCount = 1;
    v3->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&var2 & 0xFFFFFFFCFFFFFFFFLL);
    v3->_private.objectBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v3->_private.meshBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    *(_WORD *)&v3->_private.supportAddingVertexBinaryFunctions = 0;
    *(_OWORD *)&v3->_private.vertexLinkedFunctions = 0u;
    *(_OWORD *)&v3->_private.objectLinkedFunctions = 0u;
    v3->_private.maxVertexStackCallDepth = 1;
    v3->_private.maxFragmentStackCallDepth = 1;
    *(_WORD *)&v3->_private.supportAddingMeshBinaryFunctions = 0;
    *(int64x2_t *)&v3->_private.maxMeshStackCallDepth = vdupq_n_s64(1uLL);
    v3->_private.vertexPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v3->_private.fragmentPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v3->_private.objectPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v3->_private.meshPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v3->_private.profileControl = 0;
    v3->_private.maxAccelerationStructureTraversalDepth = 0;
    v3->_private.shaderValidation = 0;
    v3->_private.shaderValidationState = 0;
  }
  return v3;
}

- (void)dealloc
{
  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPipelineDescriptorInternal;
  [(MTLRenderPipelineDescriptorInternal *)&v4 dealloc];
}

- (id)gpuCompilerSPIOptions
{
  return self->_private.gpuCompilerSPIOptions;
}

- (id)binaryArchives
{
  return self->_private.binaryArchives;
}

- (id)pipelineLibrary
{
  return self->_private.pipelineLibrary;
}

- (BOOL)supportAddingFragmentBinaryFunctions
{
  return self->_private.supportAddingFragmentBinaryFunctions;
}

- (BOOL)openGLModeEnabled
{
  return LOBYTE(self->_private.var2.miscHash[0]) >> 7;
}

- (id)driverCompilerOptions
{
  return self->_private.driverCompilerOptions;
}

- (unint64_t)rasterSampleCount
{
  return self->_private.var0.sampleCount;
}

- (unint64_t)sampleMask
{
  return self->_private.sampleMask;
}

- (float)sampleCoverage
{
  return self->_private.var1.sampleCoverage;
}

- (id)fragmentLinkedFunctions
{
  p_private = &self->_private;
  id result = self->_private.fragmentLinkedFunctions;
  if (!result)
  {
    id result = objc_alloc_init(MTLLinkedFunctions);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&p_private->fragmentLinkedFunctions, (unint64_t *)&v4, (unint64_t)result);
    if (v4)
    {

      return p_private->fragmentLinkedFunctions;
    }
    else
    {
      p_private->fragmentLinkedFunctions = (MTLLinkedFunctions *)result;
    }
  }
  return result;
}

- (unint64_t)maxFragmentCallStackDepth
{
  return self->_private.maxFragmentStackCallDepth;
}

- (unint64_t)maxVertexCallStackDepth
{
  return self->_private.maxVertexStackCallDepth;
}

- (id)profileControl
{
  return self->_private.profileControl;
}

- (id)vertexBuffers
{
  return self->_private.vertexBuffers;
}

- (id)vertexPreloadedLibraries
{
  return self->_private.vertexPreloadedLibraries;
}

- (id)fragmentPreloadedLibraries
{
  return self->_private.fragmentPreloadedLibraries;
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return self->_private.maxAccelerationStructureTraversalDepth;
}

- (unsigned)explicitVisibilityGroupID
{
  return self->_private.explicitVisibilityGroupID;
}

- (unsigned)fragmentDepthCompareClampMask
{
  return self->_private.fragmentDepthCompareClampMask;
}

- (id)fragmentBuffers
{
  return self->_private.fragmentBuffers;
}

- (unint64_t)logicOperation
{
  return (*(void *)&self->_private.var2 >> 27) & 0xFLL;
}

- (BOOL)isPointSmoothEnabled
{
  return (BYTE1(self->_private.var2.miscHash[0]) >> 6) & 1;
}

- (BOOL)isLogicOperationEnabled
{
  return *((unsigned __int8 *)&self->_private.var2.var0 + 3) >> 7;
}

- (BOOL)isDepthStencilWriteDisabled
{
  return (LOBYTE(self->_private.var2.miscHash[0]) >> 6) & 1;
}

- (BOOL)isAlphaToOneEnabled
{
  return (LOBYTE(self->_private.var2.miscHash[0]) >> 1) & 1;
}

- (BOOL)isAlphaToCoverageEnabled
{
  return self->_private.var2.miscHash[0] & 1;
}

- (BOOL)isAlphaTestEnabled
{
  return (*((unsigned __int8 *)&self->_private.var2.var0 + 3) >> 2) & 1;
}

- (unint64_t)alphaTestFunction
{
  return (*(void *)&self->_private.var2 >> 23) & 7;
}

- (id)newSerializedFragmentDataWithFlags:(unint64_t)a3 options:(unint64_t)a4
{
  return createSerializedFragmentData<MTLRenderPipelineDescriptorPrivate>(a3, a4, (uint64_t)&self->_private);
}

- (void)setDepthAttachmentPixelFormat:(unint64_t)a3
{
  self->_private.depthAttachmentPixelFormat = a3;
}

- (void)setStencilAttachmentPixelFormat:(unint64_t)a3
{
  self->_private.stencilAttachmentPixelFormat = a3;
}

- (void)setRasterSampleCount:(unint64_t)a3
{
  self->_private.var0.sampleCount = a3;
}

- (void)setRasterizationEnabled:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (void)setInputPrimitiveTopology:(unint64_t)a3
{
  char v7 = a3;
  if (a3 >= 4) {
    MTLReportFailure(0, "-[MTLRenderPipelineDescriptorInternal setInputPrimitiveTopology:]", 3026, @"inputPrimitiveTopology value (%u) is invalid", v3, v4, v5, v6, a3);
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFFFE7 | (8 * (v7 & 3)));
}

- (void)setSupportIndirectCommandBuffers:(BOOL)a3
{
  self->_private.supportIndirectCommandBuffers = a3;
}

- (void)setMaxVertexAmplificationCount:(unint64_t)a3
{
  self->_private.maxVertexAmplificationCount = a3;
}

- (id)vertexDescriptor
{
  p_private = &self->_private;
  id result = self->_private.vertexDescriptor;
  if (!result)
  {
    id result = objc_alloc_init(MTLVertexDescriptorInternal);
    p_private->vertexDescriptor = (MTLVertexDescriptorInternal *)result;
  }
  return result;
}

- (void)setPipelineLibrary:(id)a3
{
  p_private = &self->_private;
  pipelineLibrary = self->_private.pipelineLibrary;
  if (pipelineLibrary != a3)
  {

    p_private->pipelineLibrary = (MTLPipelineLibrary *)a3;
  }
}

- (id)colorAttachments
{
  return self->_private.attachments;
}

- (void)setFragmentFunction:(id)a3
{
  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB34AB8] & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setFragmentFunction:]", 3568, @"fragmentFunction is not a MTLFunction.", v11, v12, v13, v14, v15);
    }
    if ([a3 functionType] != 2) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setFragmentFunction:]", 3569, @"fragmentFunction functionType is not a MTLFunctionTypeFragment.", v5, v6, v7, v8, v15);
    }
  }
  id v9 = a3;
  p_private = &self->_private;

  p_private->fragmentFunction = (MTLFunction *)a3;
}

- (void)setVertexFunction:(id)a3
{
  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB34AB8] & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setVertexFunction:]", 3551, @"vertexFunction is not a MTLFunction.", v11, v12, v13, v14, v15);
    }
    if ([a3 functionType] != 1) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setVertexFunction:]", 3552, @"vertexFunction functionType is not a MTLFunctionTypeVertex.", v5, v6, v7, v8, v15);
    }
  }
  id v9 = a3;
  p_private = &self->_private;

  p_private->vertexFunction = (MTLFunction *)a3;
}

- (void)setLabel:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v11 = @"label is not a NSString.";
    unint64_t v12 = 1;
    uint64_t v13 = 3538;
  }
  else
  {
    uint64_t v11 = @"label must not be nil.";
    unint64_t v12 = 0;
    uint64_t v13 = 3535;
  }
  MTLReportFailure(v12, "-[MTLRenderPipelineDescriptorInternal setLabel:]", v13, (uint64_t)v11, v3, v4, v5, v6, v14);
LABEL_3:
  p_private = &self->_private;
  label = p_private->label;
  if (label != a3)
  {

    p_private->label = (NSString *)[a3 copy];
  }
}

- (void)setAlphaToCoverageEnabled:(BOOL)a3
{
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setBinaryArchives:(id)a3
{
  p_private = &self->_private;
  binaryArchives = self->_private.binaryArchives;
  if (binaryArchives != a3)
  {

    p_private->binaryArchives = (NSArray *)[a3 copy];
  }
}

- (void)setVertexLinkedFunctions:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setVertexLinkedFunctions:]", 3067, @"linkedFunctions is not a MTLLinkedFunctions.", v5, v6, v7, v8, v10);
    }
  }
  p_private = &self->_private;
  if (p_private->vertexLinkedFunctions != a3)
  {
    vertexLinkedFunctions = p_private->vertexLinkedFunctions;
    p_private->vertexLinkedFunctions = (MTLLinkedFunctions *)[a3 copy];
  }
}

- (void)setFragmentLinkedFunctions:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setFragmentLinkedFunctions:]", 3095, @"linkedFunctions is not a MTLLinkedFunctions.", v5, v6, v7, v8, v10);
    }
  }
  p_private = &self->_private;
  if (p_private->fragmentLinkedFunctions != a3)
  {
    fragmentLinkedFunctions = p_private->fragmentLinkedFunctions;
    p_private->fragmentLinkedFunctions = (MTLLinkedFunctions *)[a3 copy];
  }
}

- (void)setSupportAddingFragmentBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingFragmentBinaryFunctions = a3;
}

- (id)formattedDescription:(unint64_t)a3
{
  v58[95] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = a3 + 8;
  [@"\n" stringByPaddingToLength:a3 + 8 withString:@" " startingAtIndex:0];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:128];
  v58[0] = v5;
  v58[1] = @"label =";
  v45 = self;
  p_private = &self->_private;
  label = @"<none>";
  if (self->_private.label) {
    label = (__CFString *)self->_private.label;
  }
  v58[2] = label;
  v58[3] = v5;
  v58[4] = @"Alpha to Coverage =";
  v58[5] = [NSNumber numberWithUnsignedInt:self->_private.var2.miscHash[0] & 1];
  v58[6] = v5;
  v58[7] = @"Alpha to One =";
  v58[8] = [NSNumber numberWithUnsignedInt:(self->_private.var2.miscHash[0] >> 1) & 1];
  v58[9] = v5;
  v58[10] = @"Rasterization Enabled =";
  v58[11] = [NSNumber numberWithUnsignedInt:(self->_private.var2.miscHash[0] >> 2) & 1];
  v58[12] = v5;
  v58[13] = @"Sample Coverage =";
  LODWORD(v10) = self->_private.var1.sampleCoverageHash;
  v58[14] = [NSNumber numberWithFloat:v10];
  v58[15] = v5;
  v58[16] = @"Sample Mask =";
  v58[17] = objc_msgSend(NSString, "stringWithFormat:", @"0x%lx", self->_private.sampleMask);
  v58[18] = v5;
  v58[19] = @"Raster Sample Count =";
  v58[20] = [NSNumber numberWithUnsignedInteger:self->_private.var0.sampleCount];
  v58[21] = v5;
  uint64_t v11 = *(uint64_t *)((char *)off_1E5221EE0 + (*(void *)&self->_private.var2 & 0x18));
  v58[22] = @"Input Primitive Topology =";
  v58[23] = v11;
  v58[24] = v5;
  v58[25] = @"Depth Attachment Format =";
  v58[26] = [NSString stringWithUTF8String:MTLPixelFormatGetName(self->_private.depthAttachmentPixelFormat)];
  v58[27] = v5;
  v58[28] = @"Stencil Attachment Format =";
  v58[29] = [NSString stringWithUTF8String:MTLPixelFormatGetName(self->_private.stencilAttachmentPixelFormat)];
  v58[30] = v5;
  v58[31] = @"tessellationPartitionMode =";
  unint64_t tessellationPartitionMode = self->_private.tessellationPartitionMode;
  uint64_t v13 = @"Unknown";
  uint64_t v14 = @"Unknown";
  if (tessellationPartitionMode <= 3) {
    uint64_t v14 = off_1E5221F38[tessellationPartitionMode];
  }
  v58[32] = v14;
  v58[33] = v5;
  v58[34] = @"maxTessellationFactor =";
  v58[35] = [NSNumber numberWithUnsignedInteger:p_private->maxTessellationFactor];
  v58[36] = v5;
  v58[37] = @"tessellationFactorScaleEnabled =";
  uint64_t v15 = [NSNumber numberWithBool:p_private->tessellationFactorScaleEnabled];
  long long v16 = @"MTLTessellationFactorFormatFloat_SPI";
  v58[38] = v15;
  v58[39] = v5;
  unint64_t tessellationFactorFormat = p_private->tessellationFactorFormat;
  unint64_t tessellationControlPointIndexType = p_private->tessellationControlPointIndexType;
  if (tessellationFactorFormat != 1) {
    long long v16 = @"Unknown";
  }
  if (!tessellationFactorFormat) {
    long long v16 = @"MTLTessellationFactorFormatHalf";
  }
  v58[40] = @"tessellationFactorFormat =";
  v58[41] = v16;
  v58[42] = v5;
  v58[43] = @"tessellationControlPointIndexType =";
  if (tessellationControlPointIndexType <= 2) {
    uint64_t v13 = off_1E5221F00[tessellationControlPointIndexType];
  }
  v58[44] = v13;
  v58[45] = v5;
  v58[46] = @"tessellationFactorStepFunction =";
  unint64_t tessellationFactorStepFunction = p_private->tessellationFactorStepFunction;
  v20 = @"Unknown";
  size_t v21 = @"Unknown";
  if (tessellationFactorStepFunction <= 3) {
    size_t v21 = off_1E5221F18[tessellationFactorStepFunction];
  }
  unint64_t tessellationOutputWindingOrder = p_private->tessellationOutputWindingOrder;
  if (tessellationOutputWindingOrder == 1) {
    v20 = @"MTLWindingCounterClockwise";
  }
  v58[47] = v21;
  v58[48] = v5;
  if (!tessellationOutputWindingOrder) {
    v20 = @"MTLWindingClockwise";
  }
  v58[49] = @"tessellationOutputWindingOrder =";
  v58[50] = v20;
  v58[51] = v5;
  v58[52] = @"Vertex Function =";
  vertexFunction = p_private->vertexFunction;
  if (vertexFunction) {
    uint64_t v24 = [(MTLFunction *)vertexFunction formattedDescription:v6];
  }
  else {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[53] = v24;
  v58[54] = v5;
  v58[55] = @"Fragment Function =";
  fragmentFunction = p_private->fragmentFunction;
  if (fragmentFunction) {
    uint64_t v26 = [(MTLFunction *)fragmentFunction formattedDescription:v6];
  }
  else {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[56] = v26;
  v58[57] = v5;
  v58[58] = @"Vertex Array:";
  uint64_t v27 = MTLVertexDescriptorDescription((uint64_t)p_private->vertexDescriptor, v6);
  if (!v27) {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[59] = v27;
  v58[60] = v5;
  uint64_t v28 = @"MTLVertexAmplificationModeCount";
  if ((*(void *)&p_private->var2 & 0x400) != 0) {
    uint64_t v28 = @"MTLVertexAmplificationModeMask";
  }
  v58[61] = @"Vertex Amplification Mode =";
  v58[62] = v28;
  v58[63] = v5;
  v58[64] = @"Max Vertex Amplification Count =";
  v58[65] = [NSNumber numberWithUnsignedInt:p_private->maxVertexAmplificationCount];
  v58[66] = v5;
  v58[67] = @"supportIndirectCommandBuffers =";
  v58[68] = [NSNumber numberWithBool:p_private->supportIndirectCommandBuffers];
  v58[69] = v5;
  v58[70] = @"shaderValidation =";
  v58[71] = [NSNumber numberWithInteger:p_private->shaderValidation];
  v58[72] = v5;
  v58[73] = @"shaderValidationState =";
  v58[74] = [NSNumber numberWithInteger:p_private->shaderValidationState];
  v58[75] = v5;
  v58[76] = @"textureWriteRoundingMode =";
  v58[77] = MTLRoundingModeString(p_private->textureWriteRoundingMode);
  v58[78] = v5;
  v58[79] = @"forceResourceIndex =";
  v58[80] = [NSNumber numberWithUnsignedInt:p_private->var2.miscHash[1] & 1];
  v58[81] = v5;
  v58[82] = @"resourceIndex =";
  v58[83] = [NSNumber numberWithUnsignedLongLong:p_private->resourceIndex];
  v58[84] = v5;
  v58[85] = @"Vertex   Depth Compare Clamp Mask =";
  v58[86] = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", p_private->vertexDepthCompareClampMask);
  v58[87] = v5;
  v58[88] = @"Fragment Depth Compare Clamp Mask =";
  v58[89] = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", p_private->fragmentDepthCompareClampMask);
  v58[90] = v5;
  v58[91] = @"Needs custom border color samplers = ";
  v58[92] = [NSNumber numberWithBool:p_private->needsCustomBorderColorSamplers];
  v58[93] = v5;
  v58[94] = @"Color Attachments:";
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v58, 95));
  for (uint64_t i = 0; i != 8; ++i)
  {
    if (p_private->attachments->_descriptors[i])
    {
      v57[0] = v5;
      v57[1] = objc_msgSend(NSString, "stringWithFormat:", @"Color Attachment %u:", i);
      v57[2] = pipelineColorAttachmentFormattedDescription(v6, p_private->attachments->_descriptors[i]);
      v30 = v57;
    }
    else
    {
      v56[0] = v5;
      v56[1] = objc_msgSend(NSString, "stringWithFormat:", @"Color Attachment %u:", i);
      v56[2] = pipelineColorAttachmentDefaultFormattedDescription(v6);
      v30 = v56;
    }
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v30, 3));
  }
  pipelineLibrary = p_private->pipelineLibrary;
  if (pipelineLibrary)
  {
    v55[0] = v5;
    v55[1] = @"Pipeline Library:";
    v55[2] = objc_msgSend(NSString, "stringWithFormat:", @"%p", pipelineLibrary);
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v55, 3));
  }
  for (uint64_t j = 0; j != 31; ++j)
  {
    [v7 addObject:v5];
    [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"Vertex Buffer %u:", j)];
    size_t v33 = p_private->vertexBuffers->_descriptors[j];
    if (v33) {
      uint64_t v34 = pipelineBufferFormattedDescription(v6, v33);
    }
    else {
      uint64_t v34 = pipelineBufferDefaultFormattedDescription(v6);
    }
    [v7 addObject:v34];
  }
  for (uint64_t k = 0; k != 31; ++k)
  {
    [v7 addObject:v5];
    [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"Fragment Buffer %u:", k)];
    uint64_t v36 = p_private->fragmentBuffers->_descriptors[k];
    if (v36) {
      uint64_t v37 = pipelineBufferFormattedDescription(v6, v36);
    }
    else {
      uint64_t v37 = pipelineBufferDefaultFormattedDescription(v6);
    }
    [v7 addObject:v37];
  }
  v54[0] = v5;
  v54[1] = @"vertexLinkedFunctions =";
  vertexLinkedFunctions = p_private->vertexLinkedFunctions;
  if (vertexLinkedFunctions) {
    uint64_t v39 = [(MTLLinkedFunctions *)vertexLinkedFunctions formattedDescription:v6];
  }
  else {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[2] = v39;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v54, 3));
  v53[0] = v5;
  v53[1] = @"fragmentLinkedFunctions =";
  fragmentLinkedFunctions = p_private->fragmentLinkedFunctions;
  if (fragmentLinkedFunctions) {
    uint64_t v41 = [(MTLLinkedFunctions *)fragmentLinkedFunctions formattedDescription:v6];
  }
  else {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v53[2] = v41;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v53, 3));
  v52[0] = v5;
  v52[1] = @"supportAddingVertexBinaryFunctions =";
  if (p_private->supportAddingVertexBinaryFunctions) {
    v42 = @"YES";
  }
  else {
    v42 = @"NO";
  }
  v52[2] = v42;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v52, 3));
  v51[0] = v5;
  v51[1] = @"maxVertexCallStackDepth =";
  v51[2] = [NSNumber numberWithUnsignedInteger:p_private->maxVertexStackCallDepth];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v51, 3));
  v50[0] = v5;
  v50[1] = @"supportAddingFragmentBinaryFunctions =";
  if (p_private->supportAddingFragmentBinaryFunctions) {
    v43 = @"YES";
  }
  else {
    v43 = @"NO";
  }
  v50[2] = v43;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v50, 3));
  v49[0] = v5;
  v49[1] = @"maxFragmentCallStackDepth =";
  v49[2] = [NSNumber numberWithUnsignedInteger:p_private->maxFragmentStackCallDepth];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v49, 3));
  v48[0] = v5;
  v48[1] = @"explicitVisibilityGroupID =";
  v48[2] = [NSNumber numberWithUnsignedInt:p_private->explicitVisibilityGroupID];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 3));
  v47[0] = v5;
  v47[1] = @"maxAccelerationStructureTraversalDepth =";
  v47[2] = [NSNumber numberWithUnsignedInteger:p_private->maxAccelerationStructureTraversalDepth];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v47, 3));
  v46.receiver = v45;
  v46.super_class = (Class)MTLRenderPipelineDescriptorInternal;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLRenderPipelineDescriptorInternal description](&v46, sel_description), objc_msgSend(v7, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLRenderPipelineDescriptorInternal *)self formattedDescription:0];
}

- (BOOL)forceSoftwareVertexFetch
{
  return (*((unsigned __int8 *)&self->_private.var2.var0 + 4) >> 1) & 1;
}

- (void)setForceSoftwareVertexFetch:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (void)setTessellationPartitionMode:(unint64_t)a3
{
  if (a3 >= 4) {
    MTLReportFailure(0, "validateMTLTessellationPartitionMode", 2451, @"tessellationPartitionMode is not a valid MTLTessellationPartitionMode.", v3, v4, v5, v6, v9);
  }
  self->_private.unint64_t tessellationPartitionMode = a3;
}

- (void)setMaxTessellationFactor:(unint64_t)a3
{
  if (a3 - 65 <= 0xFFFFFFFFFFFFFFBFLL) {
    MTLReportFailure(0, "validateMaxTessellationFactor", 2506, @"maxTessellationFactor must be >= 1 and <= 64", v3, v4, v5, v6, v9);
  }
  self->_private.maxTessellationFactor = a3;
}

- (void)setTessellationFactorScaleEnabled:(BOOL)a3
{
  self->_private.tessellationFactorScaleEnabled = a3;
}

- (void)setTessellationFactorFormat:(unint64_t)a3
{
  if (a3 >= 2) {
    MTLReportFailure(0, "validateMTLTessellationFactorFormat", 2521, @"tessellationFactorFormat is not a valid MTLTessellationFactorFormat.", v3, v4, v5, v6, v9);
  }
  self->_private.unint64_t tessellationFactorFormat = a3;
}

- (void)setTessellationControlPointIndexType:(unint64_t)a3
{
  if (a3 >= 3) {
    MTLReportFailure(0, "validateMTLTessellationControlPointIndexType", 2553, @"tessellationControlPointIndexType is not a valid MTLTessellationControlPointIndexType.", v3, v4, v5, v6, v9);
  }
  self->_private.unint64_t tessellationControlPointIndexType = a3;
}

- (void)setTessellationFactorStepFunction:(unint64_t)a3
{
  if (a3 >= 4) {
    MTLReportFailure(0, "validateMTLTessellationFactorStepFunction", 2584, @"tessellationFactorStepFunction is not a valid MTLTessellationFactorStepFunction.", v3, v4, v5, v6, v9);
  }
  self->_private.unint64_t tessellationFactorStepFunction = a3;
}

- (void)setTessellationOutputWindingOrder:(unint64_t)a3
{
  if (a3 >= 2) {
    MTLReportFailure(0, "validateMTLWinding", 2614, @"tessellationOutputWindingOrder is not a valid MTLWinding.", v3, v4, v5, v6, v9);
  }
  self->_private.unint64_t tessellationOutputWindingOrder = a3;
}

- (void)setShaderValidation:(int64_t)a3
{
  self->_private.shaderValidation = a3;
}

- (int64_t)shaderValidation
{
  return self->_private.shaderValidation;
}

- (void)setShaderValidationState:(int64_t)a3
{
  self->_private.shaderValidationState = a3;
}

- (int64_t)shaderValidationState
{
  return self->_private.shaderValidationState;
}

- (void)setTextureWriteRoundingMode:(int64_t)a3
{
  self->_private.textureWriteRoundingMode = a3;
}

- (uint64_t)setTextureWriteFPRoundingMode:(uint64_t)result
{
  if (result) {
    *(void *)(result + 224) = a2;
  }
  return result;
}

- (uint64_t)textureWriteFPRoundingMode
{
  if (result) {
    return *(void *)(result + 224);
  }
  return result;
}

- (BOOL)forceResourceIndex
{
  return *((unsigned char *)&self->_private.var2.var0 + 4) & 1;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (unint64_t)resourceIndex
{
  return self->_private.resourceIndex;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_private.resourceIndex = a3;
}

- (unint64_t)postVertexDumpBufferIndex
{
  return self->_private.postVertexDumpBufferIndex;
}

- (void)setPostVertexDumpBufferIndex:(unint64_t)a3
{
  self->_private.postVertexDumpBufferIndex = a3;
}

- (void)setSampleMask:(unint64_t)a3
{
  self->_private.sampleMasuint64_t k = a3;
}

- (void)setSampleCoverage:(float)a3
{
  self->_private.var1.sampleCoverage = a3;
}

- (void)setAlphaToOneEnabled:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (void)setVertexAmplificationMode:(unint64_t)a3
{
  char v7 = a3;
  if (a3 >= 2) {
    MTLReportFailure(0, "-[MTLRenderPipelineDescriptorInternal setVertexAmplificationMode:]", 2923, @"vertexAmplificationMode value %lu is invalid", v3, v4, v5, v6, a3);
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(v7 & 1) << 10));
}

- (unint64_t)colorSampleCount
{
  return self->_private.colorSampleCount;
}

- (void)setColorSampleCount:(unint64_t)a3
{
  self->_private.colorSampleCount = a3;
}

- (void)setLogicOperationEnabled:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)setLogicOperation:(unint64_t)a3
{
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFF87FFFFFFLL | ((a3 & 0xF) << 27));
}

- (void)setAlphaTestEnabled:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (void)setAlphaTestFunction:(unint64_t)a3
{
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFC7FFFFFLL | ((a3 & 7) << 23));
}

- (void)setClipDistanceEnableMask:(unsigned __int8)a3
{
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFF807FFFLL | ((unint64_t)a3 << 15));
}

- (void)setPointSmoothEnabled:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)isPointCoordLowerLeft
{
  return (BYTE1(self->_private.var2.miscHash[0]) >> 5) & 1;
}

- (void)setPointCoordLowerLeft:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)isPointSizeOutputVS
{
  return (BYTE1(self->_private.var2.miscHash[0]) >> 4) & 1;
}

- (void)setPointSizeOutputVS:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)isTwoSideEnabled
{
  return (BYTE1(self->_private.var2.miscHash[0]) >> 3) & 1;
}

- (void)setTwoSideEnabled:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (void)setVertexDepthCompareClampMask:(unsigned int)a3
{
  self->_private.vertexDepthCompareClampMasuint64_t k = a3;
}

- (void)setFragmentDepthCompareClampMask:(unsigned int)a3
{
  self->_private.fragmentDepthCompareClampMasuint64_t k = a3;
}

- (id)pluginData
{
  return self->_private.pluginData;
}

- (void)setPluginData:(id)a3
{
  p_private = &self->_private;
  pluginData = self->_private.pluginData;
  if (pluginData != a3)
  {

    p_private->pluginData = (NSDictionary *)a3;
  }
}

- (void)setOpenGLModeEnabled:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (uint64_t)internalPipeline
{
  if (result) {
    return (*(unsigned __int8 *)(result + 276) >> 4) & 1;
  }
  return result;
}

- (uint64_t)setInternalPipeline:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = 0x1000000000;
    if (!a2) {
      uint64_t v2 = 0;
    }
    *(void *)(result + 272) = *(void *)(result + 272) & 0xFFFFFFEFFFFFFFFFLL | v2;
  }
  return result;
}

- (void)setNeedsCustomBorderColorSamplers:(BOOL)a3
{
  self->_private.needsCustomBorderColorSamplers = a3;
}

- (BOOL)sampleCoverageInvert
{
  return BYTE1(self->_private.var2.miscHash[0]) & 1;
}

- (void)setSampleCoverageInvert:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (void)setDepthStencilWriteDisabled:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (id)objectLinkedFunctions
{
  p_private = &self->_private;
  id result = self->_private.objectLinkedFunctions;
  if (!result)
  {
    id result = objc_alloc_init(MTLLinkedFunctions);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&p_private->objectLinkedFunctions, (unint64_t *)&v4, (unint64_t)result);
    if (v4)
    {

      return p_private->objectLinkedFunctions;
    }
    else
    {
      p_private->objectLinkedFunctions = (MTLLinkedFunctions *)result;
    }
  }
  return result;
}

- (void)setObjectLinkedFunctions:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setObjectLinkedFunctions:]", 3124, @"linkedFunctions is not a MTLLinkedFunctions.", v5, v6, v7, v8, v10);
    }
  }
  p_private = &self->_private;
  if (p_private->objectLinkedFunctions != a3)
  {
    objectLinkedFunctions = p_private->objectLinkedFunctions;
    p_private->objectLinkedFunctions = (MTLLinkedFunctions *)[a3 copy];
  }
}

- (id)meshLinkedFunctions
{
  p_private = &self->_private;
  id result = self->_private.meshLinkedFunctions;
  if (!result)
  {
    id result = objc_alloc_init(MTLLinkedFunctions);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&p_private->meshLinkedFunctions, (unint64_t *)&v4, (unint64_t)result);
    if (v4)
    {

      return p_private->meshLinkedFunctions;
    }
    else
    {
      p_private->meshLinkedFunctions = (MTLLinkedFunctions *)result;
    }
  }
  return result;
}

- (void)setMeshLinkedFunctions:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setMeshLinkedFunctions:]", 3152, @"linkedFunctions is not a MTLLinkedFunctions.", v5, v6, v7, v8, v10);
    }
  }
  p_private = &self->_private;
  if (p_private->meshLinkedFunctions != a3)
  {
    meshLinkedFunctions = p_private->meshLinkedFunctions;
    p_private->meshLinkedFunctions = (MTLLinkedFunctions *)[a3 copy];
  }
}

- (void)setVertexPreloadedLibraries:(id)a3
{
  p_private = &self->_private;
  vertexPreloadedLibraries = self->_private.vertexPreloadedLibraries;
  if (vertexPreloadedLibraries != a3)
  {

    p_private->vertexPreloadedLibraries = (NSArray *)[a3 copy];
  }
}

- (void)setFragmentPreloadedLibraries:(id)a3
{
  p_private = &self->_private;
  fragmentPreloadedLibraries = self->_private.fragmentPreloadedLibraries;
  if (fragmentPreloadedLibraries != a3)
  {

    p_private->fragmentPreloadedLibraries = (NSArray *)[a3 copy];
  }
}

- (id)objectPreloadedLibraries
{
  return self->_private.objectPreloadedLibraries;
}

- (void)setObjectPreloadedLibraries:(id)a3
{
  p_private = &self->_private;
  objectPreloadedLibraries = self->_private.objectPreloadedLibraries;
  if (objectPreloadedLibraries != a3)
  {

    p_private->objectPreloadedLibraries = (NSArray *)[a3 copy];
  }
}

- (id)meshPreloadedLibraries
{
  return self->_private.meshPreloadedLibraries;
}

- (void)setMeshPreloadedLibraries:(id)a3
{
  p_private = &self->_private;
  meshPreloadedLibraries = self->_private.meshPreloadedLibraries;
  if (meshPreloadedLibraries != a3)
  {

    p_private->meshPreloadedLibraries = (NSArray *)[a3 copy];
  }
}

- (id)insertVertexLibraries
{
  return self->_private.vertexPreloadedLibraries;
}

- (void)setInsertVertexLibraries:(id)a3
{
  if (!a3) {
    a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  [(MTLRenderPipelineDescriptorInternal *)self setVertexPreloadedLibraries:a3];
}

- (id)insertFragmentLibraries
{
  return self->_private.fragmentPreloadedLibraries;
}

- (void)setInsertFragmentLibraries:(id)a3
{
  if (!a3) {
    a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  [(MTLRenderPipelineDescriptorInternal *)self setFragmentPreloadedLibraries:a3];
}

- (id)insertObjectLibraries
{
  return self->_private.objectPreloadedLibraries;
}

- (void)setInsertObjectLibraries:(id)a3
{
  if (!a3) {
    a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  [(MTLRenderPipelineDescriptorInternal *)self setObjectPreloadedLibraries:a3];
}

- (id)insertMeshLibraries
{
  return self->_private.meshPreloadedLibraries;
}

- (void)setInsertMeshLibraries:(id)a3
{
  if (!a3) {
    a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  [(MTLRenderPipelineDescriptorInternal *)self setMeshPreloadedLibraries:a3];
}

- (void)setSupportAddingVertexBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingVertexBinaryFunctions = a3;
}

- (void)setMaxVertexCallStackDepth:(unint64_t)a3
{
  self->_private.maxVertexStackCallDepth = a3;
}

- (void)setMaxFragmentCallStackDepth:(unint64_t)a3
{
  self->_private.maxFragmentStackCallDepth = a3;
}

- (BOOL)supportAddingMeshBinaryFunctions
{
  return self->_private.supportAddingMeshBinaryFunctions;
}

- (void)setSupportAddingMeshBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingMeshBinaryFunctions = a3;
}

- (BOOL)supportAddingObjectBinaryFunctions
{
  return self->_private.supportAddingObjectBinaryFunctions;
}

- (void)setSupportAddingObjectBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingObjectBinaryFunctions = a3;
}

- (unint64_t)maxMeshCallStackDepth
{
  return self->_private.maxMeshStackCallDepth;
}

- (void)setMaxMeshCallStackDepth:(unint64_t)a3
{
  self->_private.maxMeshStackCallDepth = a3;
}

- (unint64_t)maxObjectCallStackDepth
{
  return self->_private.maxObjectStackCallDepth;
}

- (void)setMaxObjectCallStackDepth:(unint64_t)a3
{
  self->_private.maxObjectStackCallDepth = a3;
}

- (void)setExplicitVisibilityGroupID:(unsigned int)a3
{
  self->_private.explicitVisibilityGroupID = a3;
}

- (void)setProfileControl:(id)a3
{
  p_private = &self->_private;
  profileControl = self->_private.profileControl;
  if (profileControl != a3)
  {

    p_private->profileControl = (MTLProfileControl *)[a3 copy];
  }
}

- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3
{
  self->_private.maxAccelerationStructureTraversalDepth = a3;
}

- (void)reset
{
  uint64_t v2 = 0;
  p_private = &self->_private;
  self->_private.$65165931DE83DC9F336BFC9DC178100F var2 = 0;
  rtBlendDescHash = self->_private.rtBlendDescHash;
  do
  {

    p_private->attachments->_descriptors[v2] = 0;
    rtBlendDescHash[v2++] = 0;
  }
  while (v2 != 8);
  p_private->depthAttachmentPixelFormat = 0;
  p_private->stencilAttachmentPixelFormat = 0;
  p_private->unint64_t tessellationPartitionMode = 0;
  p_private->maxTessellationFactor = 16;
  p_private->tessellationFactorScaleEnabled = 0;
  p_private->supportIndirectCommandBuffers = 0;
  *(_OWORD *)&p_private->unint64_t tessellationFactorFormat = 0u;
  *(_OWORD *)&p_private->unint64_t tessellationFactorStepFunction = 0u;
  $65165931DE83DC9F336BFC9DC178100F var2 = p_private->var2;
  *(void *)&p_private->vertexDepthCompareClampMasuint64_t k = 0;
  p_private->resourceIndex = 0;
  p_private->postVertexDumpBufferIndex = 0;
  *(_OWORD *)&p_private->textureWriteRoundingMode = xmmword_1828E1E20;
  p_private->sampleMasuint64_t k = -1;
  p_private->var1.sampleCoverageHash = 1065353216;
  p_private->maxVertexAmplificationCount = 1;
  p_private->colorSampleCount = 0;
  p_private->$65165931DE83DC9F336BFC9DC178100F var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&var2 & 0xFFFFFFFE84007FFBLL | 0x13FF8004);
  p_private->needsCustomBorderColorSamplers = 0;

  uint64_t v6 = 0;
  p_private->label = 0;
  do
  {

    p_private->vertexBuffers->_descriptors[v6++] = 0;
  }
  while (v6 != 31);
  for (uint64_t i = 0; i != 31; ++i)
  {

    p_private->fragmentBuffers->_descriptors[i] = 0;
  }

  p_private->vertexFunction = 0;
  p_private->fragmentFunction = 0;

  p_private->vertexDescriptor = 0;
  p_private->objectFunction = 0;

  uint64_t v8 = 0;
  p_private->meshFunction = 0;
  p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width = 0;
  p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.height = 0;
  p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.unint64_t depth = 0;
  p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width = 0;
  p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.height = 0;
  p_private->maxTotalThreadsPerObjectThreadgroup = 0;
  p_private->unint64_t maxTotalThreadsPerMeshThreadgroup = 0;
  p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.unint64_t depth = 0;
  p_private->maxPipelineChildren.width = 0;
  p_private->maxPipelineChildren.unint64_t depth = 0;
  p_private->pipelineMemoryLength = 0;
  p_private->maxPipelineChildren.height = 0;
  do
  {

    p_private->objectBuffers->_descriptors[v8++] = 0;
  }
  while (v8 != 31);
  for (uint64_t j = 0; j != 31; ++j)
  {

    p_private->meshBuffers->_descriptors[j] = 0;
  }

  p_private->pluginData = 0;
  p_private->binaryArchives = 0;

  p_private->vertexLinkedFunctions = 0;
  p_private->fragmentLinkedFunctions = 0;

  p_private->objectLinkedFunctions = 0;
  p_private->meshLinkedFunctions = 0;

  p_private->vertexPreloadedLibraries = 0;
  p_private->fragmentPreloadedLibraries = 0;

  p_private->objectPreloadedLibraries = 0;
  p_private->meshPreloadedLibraries = 0;
  *(_WORD *)&p_private->supportAddingVertexBinaryFunctions = 0;
  p_private->maxVertexStackCallDepth = 1;
  p_private->maxFragmentStackCallDepth = 1;
  *(_WORD *)&p_private->supportAddingMeshBinaryFunctions = 0;
  *(int64x2_t *)&p_private->maxMeshStackCallDepth = vdupq_n_s64(1uLL);

  p_private->profileControl = 0;
  p_private->explicitVisibilityGroupID = -1;
  p_private->maxAccelerationStructureTraversalDepth = 0;
  p_private->shaderValidation = 0;
  p_private->shaderValidationState = 0;
}

- (uint64_t)fastBlendDescriptorAtIndex:(uint64_t)a3
{
  if (result)
  {
    uint64_t v9 = result;
    if (a2 >= 8) {
      MTLReportFailure(0, "-[MTLRenderPipelineDescriptorInternal fastBlendDescriptorAtIndex:]", 3524, @"index must be < %lu.", a5, a6, a7, a8, 8);
    }
    return *(void *)(*(void *)(v9 + 48) + 8 + 8 * a2);
  }
  return result;
}

- (void)setObjectFunction:(id)a3
{
  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB34AB8] & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setObjectFunction:]", 3586, @"objectFunction is not a MTLFunction.", v11, v12, v13, v14, v15);
    }
    if ([a3 functionType] != 8) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setObjectFunction:]", 3587, @"objectFunction functionType is not MTLFunctionTypeObject.", v5, v6, v7, v8, v15);
    }
  }
  id v9 = a3;
  p_private = &self->_private;

  p_private->objectFunction = (MTLFunction *)a3;
}

- (void)setMeshFunction:(id)a3
{
  if (a3)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB34AB8] & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setMeshFunction:]", 3603, @"meshFunction is not a MTLFunction.", v11, v12, v13, v14, v15);
    }
    if ([a3 functionType] != 7) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal setMeshFunction:]", 3604, @"meshFunction functionType is not MTLFunctionTypeMesh.", v5, v6, v7, v8, v15);
    }
  }
  id v9 = a3;
  p_private = &self->_private;

  p_private->meshFunction = (MTLFunction *)a3;
}

- (id)objectBuffers
{
  return self->_private.objectBuffers;
}

- (id)meshBuffers
{
  return self->_private.meshBuffers;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)objectThreadsPerThreadgroup
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 344);
  return self;
}

- (void)setObjectThreadsPerThreadgroup:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_private.objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.unint64_t depth = a3->var2;
  *(_OWORD *)&self->_private.objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width = v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)meshThreadsPerThreadgroup
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 368);
  return self;
}

- (void)setMeshThreadsPerThreadgroup:(id *)a3
{
  unint64_t var2 = a3->var2;
  *(_OWORD *)&self->_private.meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width = *(_OWORD *)&a3->var0;
  self->_private.meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.unint64_t depth = var2;
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  return self->_private.maxTotalThreadsPerObjectThreadgroup;
}

- (void)setMaxTotalThreadsPerObjectThreadgroup:(unint64_t)a3
{
  self->_private.maxTotalThreadsPerObjectThreadgroup = a3;
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  return self->_private.maxTotalThreadsPerMeshThreadgroup;
}

- (void)setMaxTotalThreadsPerMeshThreadgroup:(unint64_t)a3
{
  self->_private.unint64_t maxTotalThreadsPerMeshThreadgroup = a3;
}

- (BOOL)objectThreadgroupSizeIsMultipleOfThreadExecutionWidth
{
  return (*((unsigned __int8 *)&self->_private.var2.var0 + 4) >> 2) & 1;
}

- (void)setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.unint64_t var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)meshThreadgroupSizeIsMultipleOfThreadExecutionWidth
{
  return (*((unsigned __int8 *)&self->_private.var2.var0 + 4) >> 3) & 1;
}

- (void)setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.unint64_t var2 = ($65165931DE83DC9F336BFC9DC178100F)(*(void *)&self->_private.var2 & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (unint64_t)pipelineMemoryLength
{
  return self->_private.pipelineMemoryLength;
}

- (void)setPipelineMemoryLength:(unint64_t)a3
{
  self->_private.pipelineMemoryLength = a3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxPipelineChildren
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 392);
  return self;
}

- (void)setMaxPipelineChildren:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_private.maxPipelineChildren.unint64_t depth = a3->var2;
  *(_OWORD *)&self->_private.maxPipelineChildren.width = v3;
}

- (void)attachVertexDescriptor:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPipelineDescriptorInternal attachVertexDescriptor:]", 3730, @"vertexDescriptor is not a MTLVertexDescriptor.", v5, v6, v7, v8, v11);
    }
  }
  p_private = &self->_private;
  vertexDescriptor = p_private->vertexDescriptor;
  if (vertexDescriptor != a3)
  {

    p_private->vertexDescriptor = (MTLVertexDescriptorInternal *)a3;
  }
}

- (void)setDriverCompilerOptions:(id)a3
{
  p_private = &self->_private;
  driverCompilerOptions = self->_private.driverCompilerOptions;
  if (driverCompilerOptions != a3)
  {

    p_private->driverCompilerOptions = (NSDictionary *)[a3 copy];
  }
}

- (void)setGpuCompilerSPIOptions:(id)a3
{
  p_private = &self->_private;
  gpuCompilerSPIOptions = self->_private.gpuCompilerSPIOptions;
  if (gpuCompilerSPIOptions != a3)
  {

    p_private->gpuCompilerSPIOptions = (NSDictionary *)[a3 copy];
  }
}

- (unint64_t)hash
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  if (-[MTLRenderPipelineDescriptorInternal hash]::onceToken != -1) {
    dispatch_once(&-[MTLRenderPipelineDescriptorInternal hash]::onceToken, &__block_literal_global_18);
  }
  p_private = &self->_private;
  bzero(v36, 0x5C0uLL);
  uint64_t v4 = 0;
  uint64_t descriptors = (uint64_t)p_private->attachments->_descriptors;
  do
  {
    uint64_t v6 = *(void *)(descriptors + v4 * 4);
    if (v6) {
      uint64_t v7 = (uint64_t *)(v6 + 8);
    }
    else {
      uint64_t v7 = &_MTLDefaultRenderPipelineAttachmentPrivate;
    }
    *(void *)&v36[v4] = *v7;
    v4 += 2;
  }
  while (v4 != 16);
  int32x2_t v37 = vmovn_s64(*(int64x2_t *)&p_private->depthAttachmentPixelFormat);
  unint64_t maxTessellationFactor = p_private->maxTessellationFactor;
  char tessellationPartitionMode = p_private->tessellationPartitionMode;
  char v39 = maxTessellationFactor;
  BOOL tessellationFactorScaleEnabled = p_private->tessellationFactorScaleEnabled;
  int16x8_t v9 = *(int16x8_t *)&p_private->tessellationFactorFormat;
  int32x2_t v10 = vmovn_s64(*(int64x2_t *)&p_private->tessellationFactorStepFunction);
  *(int32x2_t *)v9.i8 = vmovn_s64((int64x2_t)v9);
  v9.i16[1] = v9.i16[2];
  v9.i16[2] = v10.i16[0];
  v9.i16[3] = v10.i16[2];
  unsigned __int32 v41 = vmovn_s16(v9).u32[0];
  BOOL supportIndirectCommandBuffers = p_private->supportIndirectCommandBuffers;
  label = p_private->label;
  unint64_t resourceIndex = p_private->resourceIndex;
  int textureWriteRoundingMode = p_private->textureWriteRoundingMode;
  char postVertexDumpBufferIndex = p_private->postVertexDumpBufferIndex;
  BOOL needsCustomBorderColorSamplers = p_private->needsCustomBorderColorSamplers;
  $65165931DE83DC9F336BFC9DC178100F var2 = p_private->var2;
  char colorSampleCount = p_private->colorSampleCount;
  uint64_t v48 = *(void *)&p_private->vertexDepthCompareClampMask;
  unint64_t v13 = LOBYTE(p_private->var0.sampleCount) | ((unint64_t)(unsigned __int16)LODWORD(p_private->sampleMask) << 8) | ((unint64_t)p_private->var1.sampleCoverageHash << 32);
  int v51 = 0;
  $65165931DE83DC9F336BFC9DC178100F v49 = var2;
  unint64_t v50 = v13;
  uint64_t v52 = [(NSString *)label hash];
  uint64_t v53 = [(MTLFunction *)p_private->vertexFunction hash];
  uint64_t v54 = [(MTLFunction *)p_private->fragmentFunction hash];
  vertexDescriptor = p_private->vertexDescriptor;
  if (vertexDescriptor) {
    uint64_t v15 = [(MTLVertexDescriptorInternal *)vertexDescriptor hash];
  }
  else {
    uint64_t v15 = -[MTLRenderPipelineDescriptorInternal hash]::defaultVertexDescriptorHash;
  }
  uint64_t v16 = 0;
  uint64_t v55 = v15;
  uint64_t v17 = (uint64_t)p_private->vertexBuffers->_descriptors;
  do
  {
    uint64_t v18 = *(void *)(v17 + v16);
    if (v18) {
      v19 = (uint64_t *)(v18 + 8);
    }
    else {
      v19 = &_MTLDefaultPipelineBufferPrivate;
    }
    *(void *)&v56[v16] = *v19;
    v16 += 8;
  }
  while (v16 != 248);
  uint64_t v20 = 0;
  uint64_t v21 = (uint64_t)p_private->fragmentBuffers->_descriptors;
  do
  {
    uint64_t v22 = *(void *)(v21 + v20);
    if (v22) {
      v23 = (uint64_t *)(v22 + 8);
    }
    else {
      v23 = &_MTLDefaultPipelineBufferPrivate;
    }
    *(void *)&v56[v20 + 248] = *v23;
    v20 += 8;
  }
  while (v20 != 248);
  uint64_t v57 = [(NSDictionary *)p_private->driverCompilerOptions hash];
  uint64_t v58 = [(NSDictionary *)p_private->gpuCompilerSPIOptions hash];
  unsigned int maxVertexAmplificationCount = p_private->maxVertexAmplificationCount;
  uint64_t v60 = [(NSDictionary *)p_private->pluginData hash];
  uint64_t v24 = MTLHashArray(p_private->binaryArchives, 1, 0);
  uint64_t v25 = 0;
  uint64_t v61 = v24;
  uint64_t v26 = (uint64_t)p_private->objectBuffers->_descriptors;
  do
  {
    uint64_t v27 = *(void *)(v26 + v25);
    if (v27) {
      uint64_t v28 = (uint64_t *)(v27 + 8);
    }
    else {
      uint64_t v28 = &_MTLDefaultPipelineBufferPrivate;
    }
    *(void *)&v62[v25] = *v28;
    v25 += 8;
  }
  while (v25 != 248);
  uint64_t v29 = 0;
  uint64_t v30 = (uint64_t)p_private->meshBuffers->_descriptors;
  do
  {
    uint64_t v31 = *(void *)(v30 + v29);
    if (v31) {
      v32 = (uint64_t *)(v31 + 8);
    }
    else {
      v32 = &_MTLDefaultPipelineBufferPrivate;
    }
    *(void *)&v62[v29 + 248] = *v32;
    v29 += 8;
  }
  while (v29 != 248);
  uint64_t v63 = [(MTLFunction *)p_private->objectFunction hash];
  uint64_t v64 = [(MTLFunction *)p_private->meshFunction hash];
  long long v65 = *(_OWORD *)&p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width;
  unint64_t depth = p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth;
  long long v67 = *(_OWORD *)&p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width;
  unint64_t v68 = p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth;
  unint64_t maxTotalThreadsPerMeshThreadgroup = p_private->maxTotalThreadsPerMeshThreadgroup;
  unint64_t maxTotalThreadsPerObjectThreadgroup = p_private->maxTotalThreadsPerObjectThreadgroup;
  unint64_t v73 = maxTotalThreadsPerMeshThreadgroup;
  long long v69 = *(_OWORD *)&p_private->maxPipelineChildren.width;
  unint64_t pipelineMemoryLength = p_private->pipelineMemoryLength;
  unint64_t v70 = p_private->maxPipelineChildren.depth;
  unint64_t v71 = pipelineMemoryLength;
  uint64_t v74 = [(MTLLinkedFunctions *)p_private->vertexLinkedFunctions hash];
  uint64_t v75 = [(MTLLinkedFunctions *)p_private->fragmentLinkedFunctions hash];
  uint64_t v76 = [(MTLLinkedFunctions *)p_private->objectLinkedFunctions hash];
  uint64_t v77 = [(MTLLinkedFunctions *)p_private->meshLinkedFunctions hash];
  uint64_t v78 = MTLHashArray(p_private->vertexPreloadedLibraries, 1, 1);
  uint64_t v79 = MTLHashArray(p_private->fragmentPreloadedLibraries, 1, 1);
  uint64_t v80 = MTLHashArray(p_private->objectPreloadedLibraries, 1, 1);
  uint64_t v81 = MTLHashArray(p_private->meshPreloadedLibraries, 1, 1);
  uint64_t v82 = -(uint64_t)p_private->supportAddingVertexBinaryFunctions;
  uint64_t v83 = -(uint64_t)p_private->supportAddingFragmentBinaryFunctions;
  unint64_t maxVertexStackCallDepth = p_private->maxVertexStackCallDepth;
  unint64_t maxFragmentStackCallDepth = p_private->maxFragmentStackCallDepth;
  uint64_t v86 = -(uint64_t)p_private->supportAddingMeshBinaryFunctions;
  uint64_t v87 = -(uint64_t)p_private->supportAddingObjectBinaryFunctions;
  long long v88 = *(_OWORD *)&p_private->maxMeshStackCallDepth;
  uint64_t v89 = [(MTLProfileControl *)p_private->profileControl hash];
  unsigned int explicitVisibilityGroupID = p_private->explicitVisibilityGroupID;
  unint64_t maxAccelerationStructureTraversalDepth = p_private->maxAccelerationStructureTraversalDepth;
  long long v92 = *(_OWORD *)&p_private->shaderValidation;
  return _MTLHashState(v36, 0x5C0uLL);
}

void __43__MTLRenderPipelineDescriptorInternal_hash__block_invoke()
{
  v0 = objc_alloc_init(MTLVertexDescriptor);
  -[MTLRenderPipelineDescriptorInternal hash]::defaultVertexDescriptorHash = [(MTLVertexDescriptor *)v0 hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      uint64_t v7 = 0;
      p_private = &self->_private;
      int16x8_t v9 = (char *)a3 + 48;
      while (1)
      {
        int32x2_t v10 = p_private->attachments->_descriptors[v7];
        uint64_t v11 = *(MTLRenderPipelineColorAttachmentDescriptorInternal **)(*(void *)v9 + 8 + v7 * 8);
        if (v10 != v11)
        {
          BOOL v12 = !v10 || v11 == 0;
          if (v12 || v10->_private.var0.var1.var0 != v11->_private.var0.var1.var0) {
            break;
          }
        }
        if (++v7 == 8)
        {
          uint64_t v13 = 0;
          while (1)
          {
            uint64_t v14 = p_private->vertexBuffers->_descriptors[v13];
            uint64_t v15 = *(MTLPipelineBufferDescriptorInternal **)(*((void *)v9 + 51) + 8 + v13 * 8);
            if (v14 != v15)
            {
              BOOL v16 = !v14 || v15 == 0;
              if (v16 || v14->_private.var0.var1.var0 != v15->_private.var0.var1.var0) {
                goto LABEL_3;
              }
            }
            if (++v13 == 31)
            {
              uint64_t v17 = 0;
              while (1)
              {
                uint64_t v18 = p_private->fragmentBuffers->_descriptors[v17];
                v19 = *(MTLPipelineBufferDescriptorInternal **)(*((void *)v9 + 52) + 8 + v17 * 8);
                if (v18 != v19)
                {
                  BOOL v20 = !v18 || v19 == 0;
                  if (v20 || v18->_private.var0.var1.var0 != v19->_private.var0.var1.var0) {
                    goto LABEL_3;
                  }
                }
                if (++v17 == 31)
                {
                  if (p_private->depthAttachmentPixelFormat != *((void *)v9 + 9)
                    || p_private->stencilAttachmentPixelFormat != *((void *)v9 + 10)
                    || p_private->tessellationPartitionMode != *((void *)v9 + 11)
                    || p_private->maxTessellationFactor != *((void *)v9 + 12)
                    || p_private->tessellationFactorScaleEnabled != v9[104]
                    || p_private->tessellationFactorFormat != *((void *)v9 + 14)
                    || p_private->tessellationControlPointIndexType != *((void *)v9 + 15)
                    || p_private->tessellationFactorStepFunction != *((void *)v9 + 16)
                    || p_private->tessellationOutputWindingOrder != *((void *)v9 + 17)
                    || p_private->supportIndirectCommandBuffers != v9[152]
                    || p_private->textureWriteRoundingMode != *((void *)v9 + 22)
                    || p_private->resourceIndex != *((void *)v9 + 30)
                    || p_private->postVertexDumpBufferIndex != *((void *)v9 + 18)
                    || p_private->vertexDepthCompareClampMask != *((_DWORD *)v9 + 58)
                    || p_private->fragmentDepthCompareClampMask != *((_DWORD *)v9 + 59)
                    || p_private->needsCustomBorderColorSamplers != v9[472]
                    || p_private->var0.sampleCount != *((void *)v9 + 23)
                    || p_private->sampleMask != *((void *)v9 + 24)
                    || p_private->var1.sampleCoverage != *((float *)v9 + 50)
                    || p_private->colorSampleCount != *((void *)v9 + 27)
                    || p_private->var2.miscHash[0] != *((_DWORD *)v9 + 56)
                    || p_private->var2.miscHash[1] != *((_DWORD *)v9 + 57))
                  {
                    goto LABEL_3;
                  }
                  label = p_private->label;
                  if (label == *((NSString **)v9 + 31) || (int v6 = -[NSString isEqual:](label, "isEqual:")) != 0)
                  {
                    vertexFunction = p_private->vertexFunction;
                    if (vertexFunction == *((MTLFunction **)v9 + 32)
                      || (int v6 = -[MTLFunction isEqual:](vertexFunction, "isEqual:")) != 0)
                    {
                      fragmentFunction = p_private->fragmentFunction;
                      if (fragmentFunction == *((MTLFunction **)v9 + 33)
                        || (int v6 = -[MTLFunction isEqual:](fragmentFunction, "isEqual:")) != 0)
                      {
                        int v6 = MTLVertexDescriptorEquivalent(p_private->vertexDescriptor, *((MTLVertexDescriptorInternal **)v9 + 34));
                        if (v6)
                        {
                          driverCompilerOptions = p_private->driverCompilerOptions;
                          if (driverCompilerOptions == *((NSDictionary **)v9 + 53)
                            || (int v6 = -[NSDictionary isEqual:](driverCompilerOptions, "isEqual:")) != 0)
                          {
                            gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
                            if (gpuCompilerSPIOptions == *((NSDictionary **)v9 + 54)
                              || (int v6 = -[NSDictionary isEqual:](gpuCompilerSPIOptions, "isEqual:")) != 0)
                            {
                              if (p_private->maxVertexAmplificationCount != *((_DWORD *)v9 + 119)) {
                                goto LABEL_3;
                              }
                              pluginData = p_private->pluginData;
                              if (pluginData == *((NSDictionary **)v9 + 58)
                                || (int v6 = -[NSDictionary isEqual:](pluginData, "isEqual:")) != 0)
                              {
                                int v27 = MTLCompareArray(p_private->binaryArchives, *((void **)v9 + 60), 1, 0);
                                LOBYTE(v6) = 0;
                                if (v27)
                                {
                                  objectFunction = p_private->objectFunction;
                                  if (objectFunction == *((MTLFunction **)v9 + 35)
                                    || (int v6 = -[MTLFunction isEqual:](objectFunction, "isEqual:")) != 0)
                                  {
                                    meshFunction = p_private->meshFunction;
                                    if (meshFunction == *((MTLFunction **)v9 + 36)
                                      || (int v6 = -[MTLFunction isEqual:](meshFunction, "isEqual:")) != 0)
                                    {
                                      uint64_t v30 = 0;
                                      while (1)
                                      {
                                        uint64_t v31 = p_private->objectBuffers->_descriptors[v30];
                                        v32 = *(MTLPipelineBufferDescriptorInternal **)(*((void *)v9 + 47)
                                                                                      + 8
                                                                                      + v30 * 8);
                                        if (v31 != v32)
                                        {
                                          BOOL v33 = !v31 || v32 == 0;
                                          if (v33 || v31->_private.var0.var1.var0 != v32->_private.var0.var1.var0) {
                                            goto LABEL_3;
                                          }
                                        }
                                        if (++v30 == 31)
                                        {
                                          uint64_t v34 = 0;
                                          while (1)
                                          {
                                            v35 = p_private->meshBuffers->_descriptors[v34];
                                            uint64_t v36 = *(MTLPipelineBufferDescriptorInternal **)(*((void *)v9 + 48)
                                                                                          + 8
                                                                                          + v34 * 8);
                                            if (v35 != v36)
                                            {
                                              BOOL v37 = !v35 || v36 == 0;
                                              if (v37 || v35->_private.var0.var1.var0 != v36->_private.var0.var1.var0) {
                                                goto LABEL_3;
                                              }
                                            }
                                            if (++v34 == 31)
                                            {
                                              if (p_private->pipelineMemoryLength == *((void *)v9 + 46)
                                                && p_private->maxTotalThreadsPerObjectThreadgroup == *((void *)v9 + 49)
                                                && p_private->maxTotalThreadsPerMeshThreadgroup == *((void *)v9 + 50))
                                              {
                                                BOOL v38 = p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width == *((void *)v9 + 37)
                                                   && p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.height == *((void *)v9 + 38);
                                                if (v38
                                                  && p_private->objectThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth == *((void *)v9 + 39))
                                                {
                                                  BOOL v40 = p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.width == *((void *)v9 + 40)
                                                     && p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.height == *((void *)v9 + 41);
                                                  if (v40
                                                    && p_private->meshThreadsPerThreadgroup_DO_NOT_USE_WILL_BE_REMOVED.depth == *((void *)v9 + 42))
                                                  {
                                                    BOOL v42 = p_private->maxPipelineChildren.width == *((void *)v9 + 43)
                                                       && p_private->maxPipelineChildren.height == *((void *)v9 + 44);
                                                    if (v42
                                                      && p_private->maxPipelineChildren.depth == *((void *)v9 + 45))
                                                    {
                                                      int v6 = MTLCompareFunctionList(p_private->vertexLinkedFunctions, *((void **)v9 + 61));
                                                      if (!v6) {
                                                        return v6;
                                                      }
                                                      int v6 = MTLCompareFunctionList(p_private->fragmentLinkedFunctions, *((void **)v9 + 62));
                                                      if (!v6) {
                                                        return v6;
                                                      }
                                                      int v6 = MTLCompareFunctionList(p_private->objectLinkedFunctions, *((void **)v9 + 63));
                                                      if (!v6) {
                                                        return v6;
                                                      }
                                                      int v6 = MTLCompareFunctionList(p_private->meshLinkedFunctions, *((void **)v9 + 64));
                                                      if (!v6) {
                                                        return v6;
                                                      }
                                                      int v6 = MTLCompareArray(p_private->vertexPreloadedLibraries, *((void **)v9 + 65), 1, 1);
                                                      if (!v6) {
                                                        return v6;
                                                      }
                                                      int v6 = MTLCompareArray(p_private->fragmentPreloadedLibraries, *((void **)v9 + 66), 1, 1);
                                                      if (!v6) {
                                                        return v6;
                                                      }
                                                      int v6 = MTLCompareArray(p_private->objectPreloadedLibraries, *((void **)v9 + 67), 1, 1);
                                                      if (!v6) {
                                                        return v6;
                                                      }
                                                      int v6 = MTLCompareArray(p_private->meshPreloadedLibraries, *((void **)v9 + 68), 1, 1);
                                                      if (!v6) {
                                                        return v6;
                                                      }
                                                      if (p_private->supportAddingVertexBinaryFunctions == v9[568]
                                                        && p_private->supportAddingFragmentBinaryFunctions == v9[569]
                                                        && p_private->maxVertexStackCallDepth == *((void *)v9 + 69)
                                                        && p_private->maxFragmentStackCallDepth == *((void *)v9 + 70)
                                                        && p_private->supportAddingMeshBinaryFunctions == v9[592]
                                                        && p_private->supportAddingObjectBinaryFunctions == v9[593]
                                                        && p_private->maxMeshStackCallDepth == *((void *)v9 + 72)
                                                        && p_private->maxObjectStackCallDepth == *((void *)v9 + 73))
                                                      {
                                                        profileControl = p_private->profileControl;
                                                        if (profileControl != *((MTLProfileControl **)v9 + 75))
                                                        {
                                                          int v6 = -[MTLProfileControl isEqual:](profileControl, "isEqual:");
                                                          if (!v6) {
                                                            return v6;
                                                          }
                                                        }
                                                        if (p_private->explicitVisibilityGroupID == *((_DWORD *)v9 + 152)
                                                          && p_private->maxAccelerationStructureTraversalDepth == *((void *)v9 + 77)
                                                          && p_private->shaderValidation == *((void *)v9 + 20))
                                                        {
                                                          LOBYTE(v6) = p_private->shaderValidationState == *((void *)v9 + 21);
                                                          return v6;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                              goto LABEL_3;
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  return v6;
                }
              }
            }
          }
        }
      }
    }
LABEL_3:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)depthAttachmentPixelFormat
{
  return self->_private.depthAttachmentPixelFormat;
}

- (unint64_t)stencilAttachmentPixelFormat
{
  return self->_private.stencilAttachmentPixelFormat;
}

- (void)validateWithDevice:(id)a3
{
  [a3 registerRenderPipelineDescriptor:self];

  validateWithDevice((id *)a3, (uint64_t)&self->_private);
}

- (id)serializeFragmentData
{
  return createSerializedFragmentData<MTLRenderPipelineDescriptorPrivate>(0, 0, (uint64_t)&self->_private);
}

- (id)newSerializedVertexDataWithFlags:(unint64_t)a3 error:(id *)a4
{
  return [(MTLRenderPipelineDescriptorInternal *)self newSerializedVertexDataWithFlags:a3 options:0 error:a4];
}

- (id)newSerializedObjectDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  id result = (id)newMeshSerializedObjectOrMeshData(0, a3, a4, &self->_private);
  if (a5) {
    *a5 = 0;
  }
  return result;
}

- (id)newSerializedMeshDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  id result = (id)newMeshSerializedObjectOrMeshData(0, a3, a4, &self->_private);
  if (a5) {
    *a5 = 0;
  }
  return result;
}

@end