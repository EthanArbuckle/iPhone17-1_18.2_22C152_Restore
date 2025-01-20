@interface MTLComputePipelineDescriptorInternal
- (BOOL)forceResourceIndex;
- (BOOL)internalPipeline;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsCustomBorderColorSamplers;
- (BOOL)openCLModeEnabled;
- (BOOL)openGLModeEnabled;
- (BOOL)supportAddingBinaryFunctions;
- (BOOL)supportIndirectCommandBuffers;
- (BOOL)threadGroupSizeIsMultipleOfThreadExecutionWidth;
- (BOOL)validateWithDevice:(id)a3 error:(id *)a4;
- (MTLComputePipelineDescriptorInternal)init;
- (const)_descriptorPrivate;
- (id)binaryArchives;
- (id)buffers;
- (id)computeFunction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)driverCompilerOptions;
- (id)formattedDescription:(unint64_t)a3;
- (id)functionPointers;
- (id)gpuCompilerSPIOptions;
- (id)insertLibraries;
- (id)label;
- (id)linkedFunctions;
- (id)newSerializedComputeData;
- (id)newSerializedComputeDataWithFlags:(unint64_t)a3 options:(unint64_t)a4;
- (id)pipelineLibrary;
- (id)pluginData;
- (id)preloadedLibraries;
- (id)profileControl;
- (id)stageInputDescriptor;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteFPRoundingMode;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)hash;
- (unint64_t)maxAccelerationStructureTraversalDepth;
- (unint64_t)maxCallStackDepth;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)resourceIndex;
- (void)dealloc;
- (void)reset;
- (void)setBinaryArchives:(id)a3;
- (void)setComputeFunction:(id)a3;
- (void)setDriverCompilerOptions:(id)a3;
- (void)setForceResourceIndex:(BOOL)a3;
- (void)setFunctionPointers:(id)a3;
- (void)setGpuCompilerSPIOptions:(id)a3;
- (void)setInsertLibraries:(id)a3;
- (void)setInternalPipeline:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLinkedFunctions:(id)a3;
- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3;
- (void)setMaxCallStackDepth:(unint64_t)a3;
- (void)setMaxTotalThreadsPerThreadgroup:(unint64_t)a3;
- (void)setNeedsCustomBorderColorSamplers:(BOOL)a3;
- (void)setOpenCLModeEnabled:(BOOL)a3;
- (void)setOpenGLModeEnabled:(BOOL)a3;
- (void)setPipelineLibrary:(id)a3;
- (void)setPluginData:(id)a3;
- (void)setPreloadedLibraries:(id)a3;
- (void)setProfileControl:(id)a3;
- (void)setResourceIndex:(unint64_t)a3;
- (void)setShaderValidation:(int64_t)a3;
- (void)setShaderValidationState:(int64_t)a3;
- (void)setStageInputDescriptor:(id)a3;
- (void)setSupportAddingBinaryFunctions:(BOOL)a3;
- (void)setSupportIndirectCommandBuffers:(BOOL)a3;
- (void)setTextureWriteFPRoundingMode:(int64_t)a3;
- (void)setTextureWriteRoundingMode:(int64_t)a3;
- (void)setThreadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a3;
- (void)validateWithDevice:(id)a3;
@end

@implementation MTLComputePipelineDescriptorInternal

- (id)gpuCompilerSPIOptions
{
  return self->_private.gpuCompilerSPIOptions;
}

- (id)newSerializedComputeDataWithFlags:(unint64_t)a3 options:(unint64_t)a4
{
  buffer_ptr = 0;
  size_t size_ptr = 0;
  uint64_t __src = 0;
  uint64_t v22 = 0;
  p_private = &self->_private;
  unsigned int v5 = (a4 >> 23) & 2 | (a3 >> 4) & 4 | (8 * (*((unsigned char *)&self->_private + 137) & 1)) & 0xEF | (16 * ((*((unsigned __int8 *)&self->_private + 137) >> 1) & 1));
  int v23 = 0;
  uint64_t v22 = v5;
  functionPointers = self->_private.functionPointers;
  if (functionPointers && [(NSArray *)functionPointers count])
  {
    v5 |= 0x20u;
    LODWORD(v22) = v5;
  }
  linkedFunctions = p_private->linkedFunctions;
  if (linkedFunctions
    && ([(MTLLinkedFunctions *)linkedFunctions functions]
     && [(NSArray *)[(MTLLinkedFunctions *)p_private->linkedFunctions functions] count]
     || [(MTLLinkedFunctions *)p_private->linkedFunctions privateFunctions]
     && [(NSArray *)[(MTLLinkedFunctions *)p_private->linkedFunctions privateFunctions] count]))
  {
    v5 |= 0x20u;
    LODWORD(v22) = v5;
  }
  if ((v5 & 0x20) != 0) {
    uint64_t v8 = 20;
  }
  else {
    uint64_t v8 = 12;
  }
  stageInputDescriptor = p_private->stageInputDescriptor;
  if (stageInputDescriptor
    && (v10 = [(MTLStageInputOutputDescriptor *)stageInputDescriptor newSerializedDescriptor]) != 0)
  {
    v11 = v10;
    v5 |= 1u;
    LODWORD(v22) = v5;
    v12 = dispatch_data_create_map(v10, (const void **)&buffer_ptr, &size_ptr);
    size_t v13 = size_ptr + v8;
    dispatch_release(v11);
  }
  else
  {
    v12 = 0;
    size_t v13 = v8;
  }
  uint64_t v14 = MTLSerializePluginDataDictionary(objc_msgSend((id)-[MTLFunction device](p_private->computeFunction, "device"), "pluginData"), 0);
  uint64_t v15 = v14;
  if (v14)
  {
    LODWORD(__src) = v13;
    uint64_t v16 = v13;
    v13 += v14;
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = MTLSerializePluginDataDictionary(p_private->pluginData, 0);
  uint64_t v18 = v17;
  if (v17)
  {
    HIDWORD(__src) = v13;
    v13 += v17;
  }
  if ((v5 & 0x20) != 0) {
    _MTLPopulateLinkedFunctionExtraData(p_private->linkedFunctions);
  }
  v19 = (char *)malloc_type_malloc(v13, 0xBFAD01F5uLL);
  memcpy(v19, &__src, v8);
  if (v12)
  {
    memcpy(&v19[v8], buffer_ptr, size_ptr);
    dispatch_release(v12);
  }
  if (v15) {
    MTLSerializePluginDataDictionary(objc_msgSend((id)-[MTLFunction device](p_private->computeFunction, "device"), "pluginData"), &v19[v16]);
  }
  if (v18) {
    MTLSerializePluginDataDictionary(p_private->pluginData, &v19[HIDWORD(__src)]);
  }
  return dispatch_data_create(v19, v13, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
}

- (id)linkedFunctions
{
  p_private = &self->_private;
  id result = self->_private.linkedFunctions;
  if (!result)
  {
    id result = objc_alloc_init(MTLLinkedFunctionsInternal);
    p_private->linkedFunctions = (MTLLinkedFunctions *)result;
  }
  return result;
}

- (id)computeFunction
{
  return self->_private.computeFunction;
}

- (unint64_t)maxCallStackDepth
{
  return self->_private.maxStackCallDepth;
}

- (BOOL)supportAddingBinaryFunctions
{
  return self->_private.supportAddingBinaryFunctions;
}

- (BOOL)needsCustomBorderColorSamplers
{
  return self->_private.needsCustomBorderColorSamplers;
}

- (BOOL)threadGroupSizeIsMultipleOfThreadExecutionWidth
{
  return self->_private.threadGroupSizeIsMultipleOfThreadExecutionWidth;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return self->_private.maxTotalThreadsPerThreadgroup;
}

- (BOOL)supportIndirectCommandBuffers
{
  return self->_private.supportIndirectCommandBuffers;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_private.textureWriteRoundingMode;
}

- (id)label
{
  return self->_private.label;
}

- (id)pipelineLibrary
{
  return self->_private.pipelineLibrary;
}

- (id)binaryArchives
{
  return self->_private.binaryArchives;
}

- (void)setLinkedFunctions:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLComputePipelineDescriptorInternal setLinkedFunctions:]", 889, @"linkedFunctions is not a MTLLinkedFunctions.", v5, v6, v7, v8, v11);
    }
  }
  p_private = &self->_private;
  linkedFunctions = p_private->linkedFunctions;
  if (linkedFunctions != a3)
  {

    p_private->linkedFunctions = (MTLLinkedFunctions *)[a3 copy];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(void *)(v5 + 16) = [(NSString *)self->_private.label copyWithZone:a3];
    *(void *)(v6 + 24) = self->_private.computeFunction;
    *(void *)(v6 + 48) = [(NSDictionary *)self->_private.driverCompilerOptions copy];
    *(void *)(v6 + 56) = [(NSDictionary *)self->_private.gpuCompilerSPIOptions copy];
    *(void *)(v6 + 160) = [(NSArray *)self->_private.functionPointers copy];
    uint64_t v7 = [(MTLLinkedFunctions *)self->_private.linkedFunctions copy];
    unint64_t maxStackCallDepth = self->_private.maxStackCallDepth;
    *(void *)(v6 + 168) = v7;
    *(void *)(v6 + 176) = maxStackCallDepth;
    *(unsigned char *)(v6 + 184) = self->_private.supportAddingBinaryFunctions;
    *(void *)(v6 + 40) = [(MTLStageInputOutputDescriptor *)self->_private.stageInputDescriptor copyWithZone:a3];
    *(void *)(v6 + 72) = [(NSArray *)self->_private.binaryArchives copy];
    *(void *)(v6 + 80) = [(NSArray *)self->_private.var0.preloadedLibraries copy];
    uint64_t v9 = 0;
    *(void *)(v6 + 88) = self->_private.pipelineLibrary;
    *(unsigned char *)(v6 + 32) = self->_private.threadGroupSizeIsMultipleOfThreadExecutionWidth;
    *(_WORD *)(v6 + 34) = self->_private.maxTotalThreadsPerThreadgroup;
    do
    {
      *(void *)(*(void *)(v6 + 64) + 8 + v9 * 8) = [(MTLPipelineBufferDescriptorInternal *)self->_private.buffers->_descriptors[v9] copyWithZone:a3];
      ++v9;
    }
    while (v9 != 31);
    *(unsigned char *)(v6 + 96) = self->_private.supportIndirectCommandBuffers;
    *(void *)(v6 + 120) = self->_private.textureWriteRoundingMode;
    *(unsigned char *)(v6 + 128) = self->_private.forceResourceIndex;
    *(void *)(v6 + 136) = self->_private.resourceIndex;
    char v10 = *(unsigned char *)(v6 + 153) & 0xFE | *((unsigned char *)&self->_private + 137) & 1;
    *(unsigned char *)(v6 + 153) = v10;
    *(unsigned char *)(v6 + 153) = v10 & 0xFD | *((unsigned char *)&self->_private + 137) & 2;
    *(void *)(v6 + 144) = self->_private.pluginData;
    *(unsigned char *)(v6 + 152) = self->_private.needsCustomBorderColorSamplers;
    uint64_t v11 = [(MTLProfileControl *)self->_private.profileControl copy];
    unint64_t maxAccelerationStructureTraversalDepth = self->_private.maxAccelerationStructureTraversalDepth;
    *(void *)(v6 + 192) = v11;
    *(void *)(v6 + 200) = maxAccelerationStructureTraversalDepth;
    *(_OWORD *)(v6 + 104) = *(_OWORD *)&self->_private.shaderValidation;
    *(unsigned char *)(v6 + 153) = *(unsigned char *)(v6 + 153) & 0xFB | *((unsigned char *)&self->_private + 137) & 4;
  }
  return (id)v6;
}

- (MTLComputePipelineDescriptorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLComputePipelineDescriptorInternal;
  v2 = [(MTLComputePipelineDescriptorInternal *)&v4 init];
  if (v2)
  {
    v2->_private.buffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v2->_private.supportAddingBinaryFunctions = 0;
    v2->_private.functionPointers = 0;
    v2->_private.linkedFunctions = 0;
    v2->_private.unint64_t maxStackCallDepth = 1;
    v2->_private.var0.preloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_private.shaderValidation = 0;
    v2->_private.shaderValidationState = 0;
    v2->_private.profileControl = 0;
    v2->_private.unint64_t maxAccelerationStructureTraversalDepth = 0;
  }
  return v2;
}

- (void)setComputeFunction:(id)a3
{
  if (!a3)
  {
    v12 = @"computeFunction must not be nil.";
    unint64_t v13 = 0;
    uint64_t v14 = 800;
LABEL_9:
    MTLReportFailure(v13, "-[MTLComputePipelineDescriptorInternal setComputeFunction:]", v14, (uint64_t)v12, v3, v4, v5, v6, v19);
    goto LABEL_4;
  }
  uint64_t v9 = MTLFunctionTypeString(3);
  if (MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB34AB8] & 1) == 0) {
    MTLReportFailure(1uLL, "-[MTLComputePipelineDescriptorInternal setComputeFunction:]", 804, @"computeFunction is not a MTLFunction.", v15, v16, v17, v18, v19);
  }
  if ([a3 functionType] != 3)
  {
    uint64_t v19 = (uint64_t)v9;
    v12 = @"computeFunction functionType is not a %@.";
    unint64_t v13 = 1;
    uint64_t v14 = 805;
    goto LABEL_9;
  }
LABEL_4:
  id v10 = a3;
  p_private = &self->_private;

  p_private->computeFunction = (MTLFunction *)a3;
}

- (void)dealloc
{
  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLComputePipelineDescriptorInternal;
  [(MTLComputePipelineDescriptorInternal *)&v4 dealloc];
}

- (id)newSerializedComputeData
{
  return [(MTLComputePipelineDescriptorInternal *)self newSerializedComputeDataWithFlags:0 options:0];
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return self->_private.maxAccelerationStructureTraversalDepth;
}

- (id)driverCompilerOptions
{
  return self->_private.driverCompilerOptions;
}

- (id)buffers
{
  return self->_private.buffers;
}

- (id)preloadedLibraries
{
  return self->_private.var0.preloadedLibraries;
}

- (id)profileControl
{
  return self->_private.profileControl;
}

- (void)setThreadGroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)a3
{
  self->_private.threadGroupSizeIsMultipleOfThreadExecutionWidth = a3;
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

- (BOOL)validateWithDevice:(id)a3 error:(id *)a4
{
  p_private = &self->_private;
  if ((*((unsigned char *)&self->_private + 137) & 4) == 0) {
    objc_msgSend(a3, "registerComputePipelineDescriptor:", self, a4);
  }
  validateWithDevice(a3, (uint64_t)p_private);
  return 1;
}

- (void)setLabel:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v10 = @"label is not a NSString.";
    unint64_t v11 = 1;
    uint64_t v12 = 777;
  }
  else
  {
    id v10 = @"label must not be nil.";
    unint64_t v11 = 0;
    uint64_t v12 = 774;
  }
  MTLReportFailure(v11, "-[MTLComputePipelineDescriptorInternal setLabel:]", v12, (uint64_t)v10, v3, v4, v5, v6, v13);
LABEL_3:
  label = self->_private.label;
  if (label != a3)
  {

    self->_private.label = (NSString *)[a3 copy];
  }
}

- (void)setTextureWriteRoundingMode:(int64_t)a3
{
  self->_private.textureWriteRoundingMode = a3;
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

- (void)setBinaryArchives:(id)a3
{
  p_private = &self->_private;
  binaryArchives = self->_private.binaryArchives;
  if (binaryArchives != a3)
  {

    p_private->binaryArchives = (NSArray *)[a3 copy];
  }
}

- (void)setStageInputDescriptor:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLComputePipelineDescriptorInternal setStageInputDescriptor:]", 821, @"stageInputDescriptor is not a MTLStageInputOutputDescriptor.", v5, v6, v7, v8, v11);
    }
  }
  p_private = &self->_private;
  stageInputDescriptor = p_private->stageInputDescriptor;
  if (stageInputDescriptor != a3)
  {

    p_private->stageInputDescriptor = (MTLStageInputOutputDescriptor *)[a3 copy];
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  unint64_t v6 = a3 + 8;
  [@"\n" stringByPaddingToLength:a3 + 8 withString:@" " startingAtIndex:0];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:31];
  uint64_t v8 = 0;
  v40 = self;
  p_private = &self->_private;
  do
  {
    id v10 = self->_private.buffers->_descriptors[v8];
    if (v10) {
      uint64_t v11 = MTLPipelineBufferDescriptorDescription(v10);
    }
    else {
      uint64_t v11 = MTLPipelineBufferDescriptorDefaultDescription();
    }
    [v7 addObject:v11];
    ++v8;
  }
  while (v8 != 31);
  v38 = v7;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  preloadedLibraries = self->_private.var0.preloadedLibraries;
  uint64_t v13 = [(NSArray *)preloadedLibraries countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(preloadedLibraries);
        }
        uint64_t v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if (v15) {
          [v15 appendString:v5];
        }
        else {
          id v15 = (id)objc_opt_new();
        }
        objc_msgSend(v15, "appendString:", objc_msgSend(v18, "formattedDescription:", v6));
      }
      uint64_t v14 = [(NSArray *)preloadedLibraries countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v14);
  }
  else
  {
    id v15 = 0;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v39 = p_private;
  binaryArchives = p_private->binaryArchives;
  uint64_t v20 = [(NSArray *)binaryArchives countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    id v22 = 0;
    uint64_t v23 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(binaryArchives);
        }
        v25 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        if (v22) {
          [v22 appendString:v5];
        }
        else {
          id v22 = (id)objc_opt_new();
        }
        objc_msgSend(v22, "appendString:", objc_msgSend(v25, "formattedDescription:", v6));
      }
      uint64_t v21 = [(NSArray *)binaryArchives countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v21);
  }
  else
  {
    id v22 = 0;
  }
  v26 = (void *)MEMORY[0x1E4F1CA48];
  v50[0] = v5;
  v50[1] = @"label =";
  label = @"<none>";
  computeFunction = v39->computeFunction;
  if (v39->label) {
    label = (__CFString *)v39->label;
  }
  v50[2] = label;
  v50[3] = v5;
  v50[4] = @"computeFunction =";
  uint64_t v29 = [(MTLFunction *)computeFunction formattedDescription:v6];
  if (!v29) {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v50[5] = v29;
  v50[6] = v5;
  v50[7] = @"threadGroupSizeIsMultipleOfThreadExecutionWidth =";
  v50[8] = [NSNumber numberWithBool:v39->threadGroupSizeIsMultipleOfThreadExecutionWidth];
  v50[9] = v5;
  v50[10] = @"maxTotalThreadsPerThreadgroup =";
  v50[11] = [NSNumber numberWithUnsignedShort:v39->maxTotalThreadsPerThreadgroup];
  v50[12] = v5;
  v50[13] = @"supportIndirectCommandBuffers =";
  v50[14] = [NSNumber numberWithBool:v39->supportIndirectCommandBuffers];
  v50[15] = v5;
  v50[16] = @"textureWriteRoundingMode =";
  v50[17] = MTLRoundingModeString(v39->textureWriteRoundingMode);
  v50[18] = v5;
  v50[19] = @"stageInputDescriptor =";
  uint64_t v30 = [(MTLStageInputOutputDescriptor *)v39->stageInputDescriptor formattedDescription:v6];
  if (!v30) {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v50[20] = v30;
  v50[21] = v5;
  v50[22] = @"linkedFunctions =";
  linkedFunctions = v39->linkedFunctions;
  if (linkedFunctions) {
    uint64_t v32 = [(MTLLinkedFunctions *)linkedFunctions formattedDescription:v6];
  }
  else {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v50[23] = v32;
  v50[24] = v5;
  v33 = @"NO";
  if (v39->supportAddingBinaryFunctions) {
    v33 = @"YES";
  }
  v50[25] = @"supportAddingBinaryFunctions =";
  v50[26] = v33;
  v50[27] = v5;
  v50[28] = @"maxCallStackDepth =";
  v50[29] = [NSNumber numberWithUnsignedInteger:v39->maxStackCallDepth];
  v50[30] = v5;
  v50[31] = @"pipelineLibrary =";
  uint64_t pipelineLibrary = (uint64_t)v39->pipelineLibrary;
  if (!pipelineLibrary) {
    uint64_t pipelineLibrary = [MEMORY[0x1E4F1CA98] null];
  }
  v50[32] = pipelineLibrary;
  v50[33] = v5;
  id v35 = (id)MEMORY[0x1E4F1CBF0];
  if (v15) {
    id v35 = v15;
  }
  v50[34] = @"preloadedLibraries =";
  v50[35] = v35;
  v50[36] = v5;
  v50[37] = @"binaryArchives =";
  if (!v22) {
    id v22 = (id)[MEMORY[0x1E4F1CA98] null];
  }
  v50[38] = v22;
  v50[39] = v5;
  v50[40] = @"Needs custom border color samplers = ";
  v50[41] = [NSNumber numberWithBool:v39->needsCustomBorderColorSamplers];
  v50[42] = v5;
  v50[43] = @"buffers = ";
  v50[44] = v38;
  v50[45] = v5;
  v50[46] = @"forceResourceIndex =";
  v50[47] = [NSNumber numberWithBool:v39->forceResourceIndex];
  v50[48] = v5;
  v50[49] = @"resourceIndex =";
  v50[50] = [NSNumber numberWithUnsignedLongLong:v39->resourceIndex];
  v50[51] = v5;
  v50[52] = @"maxAccelerationStructureTraversalDepth =";
  v50[53] = [NSNumber numberWithUnsignedInteger:v39->maxAccelerationStructureTraversalDepth];
  v50[54] = v5;
  v50[55] = @"shaderValidation =";
  v50[56] = [NSNumber numberWithInteger:v39->shaderValidation];
  v50[57] = v5;
  v50[58] = @"shaderValidationState =";
  v50[59] = [NSNumber numberWithInteger:v39->shaderValidationState];
  v36 = objc_msgSend(v26, "arrayWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v50, 60));
  v41.receiver = v40;
  v41.super_class = (Class)MTLComputePipelineDescriptorInternal;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLComputePipelineDescriptorInternal description](&v41, sel_description), objc_msgSend(v36, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLComputePipelineDescriptorInternal *)self formattedDescription:0];
}

- (void)reset
{
  p_private = &self->_private;

  uint64_t v3 = 0;
  p_private->label = 0;
  p_private->supportIndirectCommandBuffers = 0;
  p_private->textureWriteRoundingMode = 0;
  do
  {

    p_private->buffers->_descriptors[v3++] = 0;
  }
  while (v3 != 31);
  *((unsigned char *)p_private + 137) &= 0xFCu;
  p_private->needsCustomBorderColorSamplers = 0;

  p_private->binaryArchives = 0;
  p_private->var0.preloadedLibraries = 0;

  p_private->linkedFunctions = 0;
  p_private->forceResourceIndex = 0;
  p_private->resourceIndex = 0;

  p_private->pluginData = 0;
  p_private->supportAddingBinaryFunctions = 0;
  p_private->unint64_t maxStackCallDepth = 1;

  p_private->shaderValidation = 0;
  p_private->shaderValidationState = 0;
  p_private->profileControl = 0;
  p_private->unint64_t maxAccelerationStructureTraversalDepth = 0;
}

- (id)stageInputDescriptor
{
  p_private = &self->_private;
  id result = self->_private.stageInputDescriptor;
  if (!result)
  {
    id result = objc_alloc_init(MTLStageInputOutputDescriptorInternal);
    p_private->stageInputDescriptor = (MTLStageInputOutputDescriptor *)result;
  }
  return result;
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

- (id)functionPointers
{
  return self->_private.functionPointers;
}

- (void)setFunctionPointers:(id)a3
{
  p_private = &self->_private;
  functionPointers = self->_private.functionPointers;
  if (functionPointers != a3)
  {

    p_private->functionPointers = (NSArray *)[a3 copy];
  }
}

- (void)setSupportAddingBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingBinaryFunctions = a3;
}

- (void)setMaxCallStackDepth:(unint64_t)a3
{
  self->_private.unint64_t maxStackCallDepth = a3;
}

- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3
{
  self->_private.unint64_t maxAccelerationStructureTraversalDepth = a3;
}

- (void)setPreloadedLibraries:(id)a3
{
  p_private = &self->_private;
  preloadedLibraries = self->_private.var0.preloadedLibraries;
  if (preloadedLibraries != a3)
  {

    p_private->var0.preloadedLibraries = (NSArray *)[a3 copy];
  }
}

- (id)insertLibraries
{
  return self->_private.var0.preloadedLibraries;
}

- (void)setInsertLibraries:(id)a3
{
  if (!a3) {
    a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  [(MTLComputePipelineDescriptorInternal *)self setPreloadedLibraries:a3];
}

- (void)setMaxTotalThreadsPerThreadgroup:(unint64_t)a3
{
  unsigned __int16 v7 = a3;
  if (a3 >= 0x10000) {
    MTLReportFailure(0, "-[MTLComputePipelineDescriptorInternal setMaxTotalThreadsPerThreadgroup:]", 1022, @"max total threads must be less than or equal to %d.", v3, v4, v5, v6, 0xFFFFLL);
  }
  self->_private.maxTotalThreadsPerThreadgroup = v7;
}

- (void)setSupportIndirectCommandBuffers:(BOOL)a3
{
  self->_private.supportIndirectCommandBuffers = a3;
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

- (void)setTextureWriteFPRoundingMode:(int64_t)a3
{
  self->_private.textureWriteRoundingMode = a3;
}

- (int64_t)textureWriteFPRoundingMode
{
  return self->_private.textureWriteRoundingMode;
}

- (BOOL)forceResourceIndex
{
  return self->_private.forceResourceIndex;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  self->_private.forceResourceIndex = a3;
}

- (unint64_t)resourceIndex
{
  return self->_private.resourceIndex;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_private.resourceIndex = a3;
}

- (BOOL)openGLModeEnabled
{
  return *((unsigned char *)&self->_private + 137) & 1;
}

- (void)setOpenGLModeEnabled:(BOOL)a3
{
  *((unsigned char *)&self->_private + 137) = *((unsigned char *)&self->_private + 137) & 0xFE | a3;
}

- (BOOL)openCLModeEnabled
{
  return (*((unsigned __int8 *)&self->_private + 137) >> 1) & 1;
}

- (void)setOpenCLModeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_private + 137) = *((unsigned char *)&self->_private + 137) & 0xFD | v3;
}

- (BOOL)internalPipeline
{
  return (*((unsigned __int8 *)&self->_private + 137) >> 2) & 1;
}

- (void)setInternalPipeline:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_private + 137) = *((unsigned char *)&self->_private + 137) & 0xFB | v3;
}

- (void)setNeedsCustomBorderColorSamplers:(BOOL)a3
{
  self->_private.needsCustomBorderColorSamplers = a3;
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

- (const)_descriptorPrivate
{
  return &self->_private;
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

- (unint64_t)hash
{
  p_private = &self->_private;
  bzero(v13, 0x1A8uLL);
  v13[0] = [(NSString *)p_private->label hash];
  v13[1] = [(MTLFunction *)p_private->computeFunction hash];
  char v14 = v14 & 0xFE | p_private->threadGroupSizeIsMultipleOfThreadExecutionWidth;
  unsigned __int16 maxTotalThreadsPerThreadgroup = p_private->maxTotalThreadsPerThreadgroup;
  BOOL supportIndirectCommandBuffers = p_private->supportIndirectCommandBuffers;
  int textureWriteRoundingMode = p_private->textureWriteRoundingMode;
  uint64_t v16 = [(MTLStageInputOutputDescriptor *)p_private->stageInputDescriptor hash];
  uint64_t v17 = [(NSDictionary *)p_private->driverCompilerOptions hash];
  uint64_t v18 = [(NSDictionary *)p_private->gpuCompilerSPIOptions hash];
  uint64_t v19 = [(NSArray *)p_private->functionPointers hash];
  uint64_t v3 = [(MTLLinkedFunctions *)p_private->linkedFunctions hash];
  uint64_t v4 = 0;
  uint64_t v5 = -(uint64_t)p_private->supportAddingBinaryFunctions;
  uint64_t v20 = v3;
  uint64_t v21 = v5;
  unint64_t maxStackCallDepth = p_private->maxStackCallDepth;
  uint64_t descriptors = (uint64_t)p_private->buffers->_descriptors;
  do
  {
    uint64_t v7 = *(void *)(descriptors + v4);
    if (v7) {
      uint64_t v8 = (uint64_t *)(v7 + 8);
    }
    else {
      uint64_t v8 = &_MTLDefaultPipelineBufferPrivate;
    }
    *(void *)&v23[v4] = *v8;
    v4 += 8;
  }
  while (v4 != 248);
  BOOL forceResourceIndex = p_private->forceResourceIndex;
  pluginData = p_private->pluginData;
  unint64_t resourceIndex = p_private->resourceIndex;
  BOOL needsCustomBorderColorSamplers = p_private->needsCustomBorderColorSamplers;
  uint64_t v29 = [(NSDictionary *)pluginData hash];
  uint64_t v30 = MTLHashArray(p_private->var0.preloadedLibraries, 1, 1);
  uint64_t v31 = MTLHashArray(p_private->binaryArchives, 1, 0);
  uint64_t v10 = [(MTLProfileControl *)p_private->profileControl hash];
  unint64_t maxAccelerationStructureTraversalDepth = p_private->maxAccelerationStructureTraversalDepth;
  uint64_t v32 = v10;
  unint64_t v33 = maxAccelerationStructureTraversalDepth;
  long long v34 = *(_OWORD *)&p_private->shaderValidation;
  return _MTLHashState((int *)v13, 0x1A8uLL);
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
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    p_private = &self->_private;
    uint64_t v8 = (void **)((char *)a3 + 16);
    if (p_private->label == *v8 || (int v6 = -[NSString isEqual:](p_private->label, "isEqual:")) != 0)
    {
      computeFunction = p_private->computeFunction;
      if (computeFunction == v8[1] || (int v6 = -[MTLFunction isEqual:](computeFunction, "isEqual:")) != 0)
      {
        stageInputDescriptor = p_private->stageInputDescriptor;
        if (stageInputDescriptor == v8[3]
          || (int v6 = -[MTLStageInputOutputDescriptor isEqual:](stageInputDescriptor, "isEqual:")) != 0)
        {
          driverCompilerOptions = p_private->driverCompilerOptions;
          if (driverCompilerOptions == v8[4] || (int v6 = -[NSDictionary isEqual:](driverCompilerOptions, "isEqual:")) != 0)
          {
            gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
            if (gpuCompilerSPIOptions == v8[5]
              || (int v6 = -[NSDictionary isEqual:](gpuCompilerSPIOptions, "isEqual:")) != 0)
            {
              functionPointers = p_private->functionPointers;
              if (functionPointers == v8[18] || (int v6 = -[NSArray isEqual:](functionPointers, "isEqual:")) != 0)
              {
                int v6 = MTLCompareFunctionList(p_private->linkedFunctions, v8[19]);
                if (v6)
                {
                  if (p_private->supportAddingBinaryFunctions == *((unsigned __int8 *)v8 + 168)
                    && (void *)p_private->maxStackCallDepth == v8[20]
                    && p_private->threadGroupSizeIsMultipleOfThreadExecutionWidth == *((unsigned __int8 *)v8 + 16)
                    && p_private->maxTotalThreadsPerThreadgroup == *((unsigned __int16 *)v8 + 9)
                    && p_private->supportIndirectCommandBuffers == *((unsigned __int8 *)v8 + 80)
                    && (void *)p_private->textureWriteRoundingMode == v8[13])
                  {
                    uint64_t v14 = 0;
                    while (1)
                    {
                      id v15 = p_private->buffers->_descriptors[v14];
                      uint64_t v16 = *(MTLPipelineBufferDescriptorInternal **)((char *)v8[6] + v14 * 8 + 8);
                      if (v15 != v16)
                      {
                        BOOL v17 = !v15 || v16 == 0;
                        if (v17 || v15->_private.var0.var1.var0 != v16->_private.var0.var1.var0) {
                          break;
                        }
                      }
                      if (++v14 == 31)
                      {
                        if (p_private->forceResourceIndex != *((unsigned __int8 *)v8 + 112)
                          || (void *)p_private->resourceIndex != v8[15]
                          || p_private->needsCustomBorderColorSamplers != *((unsigned __int8 *)v8 + 136))
                        {
                          goto LABEL_3;
                        }
                        pluginData = p_private->pluginData;
                        if (pluginData == v8[16] || (int v6 = -[NSDictionary isEqual:](pluginData, "isEqual:")) != 0)
                        {
                          int v6 = MTLCompareArray(p_private->var0.preloadedLibraries, v8[8], 1, 1);
                          if (v6)
                          {
                            int v19 = MTLCompareArray(p_private->binaryArchives, v8[7], 1, 0);
                            LOBYTE(v6) = 0;
                            if (v19)
                            {
                              profileControl = p_private->profileControl;
                              if (profileControl == v8[22]
                                || (int v6 = -[MTLProfileControl isEqual:](profileControl, "isEqual:")) != 0)
                              {
                                if ((void *)p_private->maxAccelerationStructureTraversalDepth == v8[23]
                                  && (void *)p_private->shaderValidation == v8[11])
                                {
                                  LOBYTE(v6) = p_private->shaderValidationState == (void)v8[12];
                                  return v6;
                                }
                                goto LABEL_3;
                              }
                            }
                          }
                        }
                        return v6;
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
  return v6;
}

- (void)validateWithDevice:(id)a3
{
  [a3 registerComputePipelineDescriptor:self];

  validateWithDevice(a3, (uint64_t)&self->_private);
}

@end