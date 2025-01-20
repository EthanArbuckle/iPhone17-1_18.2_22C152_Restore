@interface MTLMeshRenderPipelineDescriptor
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadgroupsPerMeshGrid;
- (BOOL)forceResourceIndex;
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
- (BOOL)isTwoSideEnabled;
- (BOOL)meshThreadgroupSizeIsMultipleOfThreadExecutionWidth;
- (BOOL)needsCustomBorderColorSamplers;
- (BOOL)objectThreadgroupSizeIsMultipleOfThreadExecutionWidth;
- (BOOL)openGLModeEnabled;
- (BOOL)sampleCoverageInvert;
- (BOOL)supportAddingFragmentBinaryFunctions;
- (BOOL)supportAddingMeshBinaryFunctions;
- (BOOL)supportAddingObjectBinaryFunctions;
- (BOOL)supportIndirectCommandBuffers;
- (BOOL)validateWithDevice:(id)a3 error:(id *)a4;
- (MTLLinkedFunctions)fragmentLinkedFunctions;
- (MTLLinkedFunctions)meshLinkedFunctions;
- (MTLLinkedFunctions)objectLinkedFunctions;
- (MTLMeshRenderPipelineDescriptor)init;
- (MTLPipelineBufferDescriptorArray)fragmentBuffers;
- (MTLPipelineBufferDescriptorArray)meshBuffers;
- (MTLPipelineBufferDescriptorArray)objectBuffers;
- (MTLPixelFormat)depthAttachmentPixelFormat;
- (MTLPixelFormat)stencilAttachmentPixelFormat;
- (MTLRenderPipelineColorAttachmentDescriptorArray)colorAttachments;
- (NSArray)binaryArchives;
- (NSString)label;
- (NSUInteger)maxTotalThreadgroupsPerMeshGrid;
- (NSUInteger)maxTotalThreadsPerMeshThreadgroup;
- (NSUInteger)maxTotalThreadsPerObjectThreadgroup;
- (NSUInteger)maxVertexAmplificationCount;
- (NSUInteger)payloadMemoryLength;
- (NSUInteger)rasterSampleCount;
- (const)_descriptorPrivate;
- (float)sampleCoverage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)driverCompilerOptions;
- (id)formattedDescription:(unint64_t)a3;
- (id)fragmentFunction;
- (id)fragmentPreloadedLibraries;
- (id)gpuCompilerSPIOptions;
- (id)insertFragmentLibraries;
- (id)insertMeshLibraries;
- (id)insertObjectLibraries;
- (id)meshFunction;
- (id)meshPreloadedLibraries;
- (id)newRenderPipelineDescriptor;
- (id)newRenderPipelineDescriptorWithDevice:(id)a3 error:(id *)a4;
- (id)newSerializedFragmentDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newSerializedMeshDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newSerializedObjectDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)objectFunction;
- (id)objectPreloadedLibraries;
- (id)pipelineLibrary;
- (id)pluginData;
- (id)profileControl;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)alphaTestFunction;
- (unint64_t)colorSampleCount;
- (unint64_t)hash;
- (unint64_t)logicOperation;
- (unint64_t)maxAccelerationStructureTraversalDepth;
- (unint64_t)maxFragmentCallStackDepth;
- (unint64_t)maxMeshCallStackDepth;
- (unint64_t)maxObjectCallStackDepth;
- (unint64_t)resourceIndex;
- (unint64_t)sampleMask;
- (unint64_t)vertexAmplificationMode;
- (unsigned)clipDistanceEnableMask;
- (unsigned)explicitVisibilityGroupID;
- (unsigned)fragmentDepthCompareClampMask;
- (void)_initMembers;
- (void)_releaseMembers;
- (void)dealloc;
- (void)reset;
- (void)setAlphaTestEnabled:(BOOL)a3;
- (void)setAlphaTestFunction:(unint64_t)a3;
- (void)setAlphaToCoverageEnabled:(BOOL)alphaToCoverageEnabled;
- (void)setAlphaToOneEnabled:(BOOL)alphaToOneEnabled;
- (void)setBinaryArchives:(id)a3;
- (void)setClipDistanceEnableMask:(unsigned __int8)a3;
- (void)setColorSampleCount:(unint64_t)a3;
- (void)setDepthAttachmentPixelFormat:(MTLPixelFormat)depthAttachmentPixelFormat;
- (void)setDepthStencilWriteDisabled:(BOOL)a3;
- (void)setDriverCompilerOptions:(id)a3;
- (void)setExplicitVisibilityGroupID:(unsigned int)a3;
- (void)setForceResourceIndex:(BOOL)a3;
- (void)setFragmentDepthCompareClampMask:(unsigned int)a3;
- (void)setFragmentFunction:(id)fragmentFunction;
- (void)setFragmentLinkedFunctions:(MTLLinkedFunctions *)fragmentLinkedFunctions;
- (void)setFragmentPreloadedLibraries:(id)a3;
- (void)setGpuCompilerSPIOptions:(id)a3;
- (void)setInsertFragmentLibraries:(id)a3;
- (void)setInsertMeshLibraries:(id)a3;
- (void)setInsertObjectLibraries:(id)a3;
- (void)setLabel:(NSString *)label;
- (void)setLogicOperation:(unint64_t)a3;
- (void)setLogicOperationEnabled:(BOOL)a3;
- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3;
- (void)setMaxFragmentCallStackDepth:(unint64_t)a3;
- (void)setMaxMeshCallStackDepth:(unint64_t)a3;
- (void)setMaxObjectCallStackDepth:(unint64_t)a3;
- (void)setMaxThreadgroupsPerMeshGrid:(id *)a3;
- (void)setMaxTotalThreadgroupsPerMeshGrid:(NSUInteger)maxTotalThreadgroupsPerMeshGrid;
- (void)setMaxTotalThreadsPerMeshThreadgroup:(NSUInteger)maxTotalThreadsPerMeshThreadgroup;
- (void)setMaxTotalThreadsPerObjectThreadgroup:(NSUInteger)maxTotalThreadsPerObjectThreadgroup;
- (void)setMaxVertexAmplificationCount:(NSUInteger)maxVertexAmplificationCount;
- (void)setMeshFunction:(id)meshFunction;
- (void)setMeshLinkedFunctions:(MTLLinkedFunctions *)meshLinkedFunctions;
- (void)setMeshPreloadedLibraries:(id)a3;
- (void)setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)meshThreadgroupSizeIsMultipleOfThreadExecutionWidth;
- (void)setNeedsCustomBorderColorSamplers:(BOOL)a3;
- (void)setObjectFunction:(id)objectFunction;
- (void)setObjectLinkedFunctions:(MTLLinkedFunctions *)objectLinkedFunctions;
- (void)setObjectPreloadedLibraries:(id)a3;
- (void)setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)objectThreadgroupSizeIsMultipleOfThreadExecutionWidth;
- (void)setOpenGLModeEnabled:(BOOL)a3;
- (void)setPayloadMemoryLength:(NSUInteger)payloadMemoryLength;
- (void)setPipelineLibrary:(id)a3;
- (void)setPluginData:(id)a3;
- (void)setPointCoordLowerLeft:(BOOL)a3;
- (void)setPointSizeOutputVS:(BOOL)a3;
- (void)setPointSmoothEnabled:(BOOL)a3;
- (void)setProfileControl:(id)a3;
- (void)setRasterSampleCount:(NSUInteger)rasterSampleCount;
- (void)setRasterizationEnabled:(BOOL)rasterizationEnabled;
- (void)setResourceIndex:(unint64_t)a3;
- (void)setSampleCoverage:(float)a3;
- (void)setSampleCoverageInvert:(BOOL)a3;
- (void)setSampleMask:(unint64_t)a3;
- (void)setShaderValidation:(int64_t)a3;
- (void)setShaderValidationState:(int64_t)a3;
- (void)setStencilAttachmentPixelFormat:(MTLPixelFormat)stencilAttachmentPixelFormat;
- (void)setSupportAddingFragmentBinaryFunctions:(BOOL)a3;
- (void)setSupportAddingMeshBinaryFunctions:(BOOL)a3;
- (void)setSupportAddingObjectBinaryFunctions:(BOOL)a3;
- (void)setSupportIndirectCommandBuffers:(BOOL)supportIndirectCommandBuffers;
- (void)setTextureWriteRoundingMode:(int64_t)a3;
- (void)setTwoSideEnabled:(BOOL)a3;
- (void)setVertexAmplificationMode:(unint64_t)a3;
@end

@implementation MTLMeshRenderPipelineDescriptor

- (void)_initMembers
{
  self->_private.attachments = objc_alloc_init(MTLRenderPipelineColorAttachmentDescriptorArrayInternal);
  self->_private.rasterSampleCount = 1;
  self->_private.sampleMask = -1;
  self->_private.var0.sampleCoverageHash = 1065353216;
  *(void *)&self->_private.var1 |= 0xFF004uLL;
  self->_private.objectBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
  self->_private.meshBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
  self->_private.fragmentBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
  self->_private.var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFF87FFFFFFFFLL | 0x800000000);
  self->_private.maxObjectStackCallDepth = 1;
  *(int64x2_t *)&self->_private.maxMeshStackCallDepth = vdupq_n_s64(1uLL);
  self->_private.objectPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  self->_private.meshPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  self->_private.fragmentPreloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
  self->_private.explicitVisibilityGroupID = -1;
  self->_private.profileControl = 0;
  self->_private.shaderValidation = 0;
  self->_private.shaderValidationState = 0;
  self->_private.maxAccelerationStructureTraversalDepth = 0;
}

- (void)_releaseMembers
{
  profileControl = self->_private.profileControl;
}

- (void)reset
{
  [(MTLMeshRenderPipelineDescriptor *)self _releaseMembers];
  *(_OWORD *)&self->_private.meshPreloadedLibraries = 0u;
  *(_OWORD *)&self->_private.fragmentLinkedFunctions = 0u;
  *(_OWORD *)&self->_private.objectLinkedFunctions = 0u;
  *(_OWORD *)&self->_private.binaryArchives = 0u;
  *(_OWORD *)&self->_private.gpuCompilerSPIOptions = 0u;
  *(_OWORD *)&self->_private.fragmentBuffers = 0u;
  *(_OWORD *)&self->_private.objectBuffers = 0u;
  *(_OWORD *)&self->_private.maxTotalThreadgroupsPerMeshGrid = 0u;
  *(_OWORD *)&self->_private.maxTotalThreadsPerObjectThreadgroup = 0u;
  *(_OWORD *)&self->_private.meshFunction = 0u;
  *(_OWORD *)&self->_private.label = 0u;
  *(_OWORD *)((char *)&self->_private.var1.var0 + 4) = 0u;
  *(_OWORD *)&self->_private.sampleMask = 0u;
  *(_OWORD *)&self->_private.rasterSampleCount = 0u;
  *(_OWORD *)&self->_private.attachments = 0u;
  *(_OWORD *)&self->_private.stencilAttachmentPixelFormat = 0u;
  *(_OWORD *)&self->_private.explicitVisibilityGroupID = 0u;
  *(_OWORD *)&self->_private.shaderValidation = 0u;
  *(_OWORD *)&self->_private.maxObjectStackCallDepth = 0u;
  *(_OWORD *)&self->_private.maxFragmentStackCallDepth = 0u;

  [(MTLMeshRenderPipelineDescriptor *)self _initMembers];
}

- (MTLMeshRenderPipelineDescriptor)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTLMeshRenderPipelineDescriptor;
  v2 = [(MTLMeshRenderPipelineDescriptor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MTLMeshRenderPipelineDescriptor *)v2 _initMembers];
  }
  return v3;
}

- (void)dealloc
{
  [(MTLMeshRenderPipelineDescriptor *)self _releaseMembers];
  v3.receiver = self;
  v3.super_class = (Class)MTLMeshRenderPipelineDescriptor;
  [(MTLMeshRenderPipelineDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = [+[MTLMeshRenderPipelineDescriptor allocWithZone:](MTLMeshRenderPipelineDescriptor, "allocWithZone:") init];
  if (v5)
  {
    for (uint64_t i = 0; i != 8; ++i)
      v5->_private.attachments->_descriptors[i] = (MTLRenderPipelineColorAttachmentDescriptorInternal *)[(MTLRenderPipelineColorAttachmentDescriptorInternal *)self->_private.attachments->_descriptors[i] copyWithZone:a3];
    *(_OWORD *)&v5->_private.depthAttachmentPixelFormat = *(_OWORD *)&self->_private.depthAttachmentPixelFormat;
    v5->_private.resourceIndex = self->_private.resourceIndex;
    v5->_private.explicitVisibilityGroupID = self->_private.explicitVisibilityGroupID;
    v5->_private.fragmentDepthCompareClampMasuint64_t k = self->_private.fragmentDepthCompareClampMask;
    *(_OWORD *)&v5->_private.textureWriteRoundingMode = *(_OWORD *)&self->_private.textureWriteRoundingMode;
    v5->_private.sampleMasuint64_t k = self->_private.sampleMask;
    v5->_private.var0.sampleCoverageHash = self->_private.var0.sampleCoverageHash;
    v5->_private.colorSampleCount = self->_private.colorSampleCount;
    v5->_private.var1.miscHash[0] = self->_private.var1.miscHash[0];
    v5->_private.var1.miscHash[1] = self->_private.var1.miscHash[1];
    v5->_private.label = (NSString *)[(NSString *)self->_private.label copyWithZone:a3];
    v5->_private.pipelineLibrary = self->_private.pipelineLibrary;
    v5->_private.objectFunction = self->_private.objectFunction;
    v5->_private.meshFunction = self->_private.meshFunction;
    uint64_t v7 = 0;
    v5->_private.fragmentFunction = self->_private.fragmentFunction;
    do
    {
      v5->_private.objectBuffers->_descriptors[v7] = (MTLPipelineBufferDescriptorInternal *)[(MTLPipelineBufferDescriptorInternal *)self->_private.objectBuffers->_descriptors[v7] copyWithZone:a3];
      ++v7;
    }
    while (v7 != 31);
    for (uint64_t j = 0; j != 31; ++j)
      v5->_private.meshBuffers->_descriptors[j] = (MTLPipelineBufferDescriptorInternal *)[(MTLPipelineBufferDescriptorInternal *)self->_private.meshBuffers->_descriptors[j] copyWithZone:a3];
    for (uint64_t k = 0; k != 31; ++k)
      v5->_private.fragmentBuffers->_descriptors[k] = (MTLPipelineBufferDescriptorInternal *)[(MTLPipelineBufferDescriptorInternal *)self->_private.fragmentBuffers->_descriptors[k] copyWithZone:a3];
    v5->_private.driverCompilerOptions = (NSDictionary *)[(NSDictionary *)self->_private.driverCompilerOptions copy];
    v5->_private.gpuCompilerSPIOptions = (NSDictionary *)[(NSDictionary *)self->_private.gpuCompilerSPIOptions copy];
    v5->_private.pluginData = self->_private.pluginData;
    v5->_private.binaryArchives = (NSArray *)[(NSArray *)self->_private.binaryArchives copy];
    *(_OWORD *)&v5->_private.maxTotalThreadsPerObjectThreadgroup = *(_OWORD *)&self->_private.maxTotalThreadsPerObjectThreadgroup;
    *(_OWORD *)&v5->_private.maxTotalThreadgroupsPerMeshGrid = *(_OWORD *)&self->_private.maxTotalThreadgroupsPerMeshGrid;
    v5->_private.objectLinkedFunctions = (MTLLinkedFunctions *)[(MTLLinkedFunctions *)self->_private.objectLinkedFunctions copy];
    v5->_private.meshLinkedFunctions = (MTLLinkedFunctions *)[(MTLLinkedFunctions *)self->_private.meshLinkedFunctions copy];
    v5->_private.fragmentLinkedFunctions = (MTLLinkedFunctions *)[(MTLLinkedFunctions *)self->_private.fragmentLinkedFunctions copy];
    v5->_private.objectPreloadedLibraries = (NSArray *)[(NSArray *)self->_private.objectPreloadedLibraries copy];
    v5->_private.meshPreloadedLibraries = (NSArray *)[(NSArray *)self->_private.meshPreloadedLibraries copy];
    uint64_t v10 = [(NSArray *)self->_private.fragmentPreloadedLibraries copy];
    unint64_t maxObjectStackCallDepth = self->_private.maxObjectStackCallDepth;
    v5->_private.fragmentPreloadedLibraries = (NSArray *)v10;
    v5->_private.unint64_t maxObjectStackCallDepth = maxObjectStackCallDepth;
    *(_OWORD *)&v5->_private.maxMeshStackCallDepth = *(_OWORD *)&self->_private.maxMeshStackCallDepth;
    v5->_private.profileControl = (MTLProfileControl *)[(MTLProfileControl *)self->_private.profileControl copy];
    *(_OWORD *)&v5->_private.maxAccelerationStructureTraversalDepth = *(_OWORD *)&self->_private.maxAccelerationStructureTraversalDepth;
    v5->_private.shaderValidationState = self->_private.shaderValidationState;
  }
  return v5;
}

- (unint64_t)hash
{
  bzero(v26, 0x420uLL);
  unint64_t v3 = 0;
  descriptors = self->_private.attachments->_descriptors;
  do
  {
    objc_super v5 = descriptors[v3 / 2];
    if (v5) {
      p_private = (uint64_t *)&v5->_private;
    }
    else {
      p_private = &_MTLDefaultRenderPipelineAttachmentPrivate;
    }
    *(void *)&v26[v3] = *p_private;
    v3 += 2;
  }
  while (v3 != 16);
  label = self->_private.label;
  unint64_t resourceIndex = self->_private.resourceIndex;
  unsigned int explicitVisibilityGroupID = self->_private.explicitVisibilityGroupID;
  unint64_t rasterSampleCount = self->_private.rasterSampleCount;
  int textureWriteRoundingMode = self->_private.textureWriteRoundingMode;
  sampleMasuint64_t k = self->_private.sampleMask;
  char colorSampleCount = self->_private.colorSampleCount;
  fragmentDepthCompareClampMasuint64_t k = self->_private.fragmentDepthCompareClampMask;
  char v55 = rasterSampleCount;
  __int16 v54 = sampleMask;
  unsigned int sampleCoverageHash = self->_private.var0.sampleCoverageHash;
  int32x2_t v48 = vmovn_s64(*(int64x2_t *)&self->_private.depthAttachmentPixelFormat);
  $B06BB717815CF97A56C090CBE4612AE0 var1 = self->_private.var1;
  uint64_t v44 = [(NSString *)label hash];
  uint64_t v45 = [(MTLFunction *)self->_private.objectFunction hash];
  uint64_t v46 = [(MTLFunction *)self->_private.meshFunction hash];
  uint64_t v10 = [(MTLFunction *)self->_private.fragmentFunction hash];
  uint64_t v11 = 0;
  uint64_t v47 = v10;
  v12 = self->_private.objectBuffers->_descriptors;
  do
  {
    v13 = v12[v11];
    if (v13) {
      v14 = (uint64_t *)&v13->_private;
    }
    else {
      v14 = &_MTLDefaultPipelineBufferPrivate;
    }
    *(void *)&v28[v11 * 8] = *v14;
    ++v11;
  }
  while (v11 != 31);
  uint64_t v15 = 0;
  v16 = self->_private.meshBuffers->_descriptors;
  do
  {
    v17 = v16[v15];
    if (v17) {
      v18 = (uint64_t *)&v17->_private;
    }
    else {
      v18 = &_MTLDefaultPipelineBufferPrivate;
    }
    *(void *)&v28[v15 * 8 + 248] = *v18;
    ++v15;
  }
  while (v15 != 31);
  uint64_t v19 = 0;
  v20 = self->_private.fragmentBuffers->_descriptors;
  do
  {
    v21 = v20[v19];
    if (v21) {
      v22 = (uint64_t *)&v21->_private;
    }
    else {
      v22 = &_MTLDefaultPipelineBufferPrivate;
    }
    *(void *)&v28[v19 * 8 + 496] = *v22;
    ++v19;
  }
  while (v19 != 31);
  uint64_t v29 = [(NSDictionary *)self->_private.driverCompilerOptions hash];
  uint64_t v30 = [(NSDictionary *)self->_private.gpuCompilerSPIOptions hash];
  uint64_t v33 = [(NSDictionary *)self->_private.pluginData hash];
  uint64_t v34 = MTLHashArray(self->_private.binaryArchives, 1, 0);
  long long v31 = *(_OWORD *)&self->_private.maxTotalThreadsPerObjectThreadgroup;
  unint64_t pipelineMemoryLength = self->_private.pipelineMemoryLength;
  unint64_t maxTotalThreadgroupsPerMeshGrid = self->_private.maxTotalThreadgroupsPerMeshGrid;
  unint64_t v35 = pipelineMemoryLength;
  uint64_t v36 = [(MTLLinkedFunctions *)self->_private.objectLinkedFunctions hash];
  uint64_t v37 = [(MTLLinkedFunctions *)self->_private.meshLinkedFunctions hash];
  uint64_t v38 = [(MTLLinkedFunctions *)self->_private.fragmentLinkedFunctions hash];
  uint64_t v39 = MTLHashArray(self->_private.objectPreloadedLibraries, 1, 1);
  uint64_t v40 = MTLHashArray(self->_private.meshPreloadedLibraries, 1, 1);
  uint64_t v41 = MTLHashArray(self->_private.fragmentPreloadedLibraries, 1, 1);
  long long v42 = *(_OWORD *)&self->_private.maxObjectStackCallDepth;
  profileControl = self->_private.profileControl;
  unint64_t maxFragmentStackCallDepth = self->_private.maxFragmentStackCallDepth;
  uint64_t v57 = [(MTLProfileControl *)profileControl hash];
  long long v58 = *(_OWORD *)&self->_private.maxAccelerationStructureTraversalDepth;
  int64_t shaderValidationState = self->_private.shaderValidationState;
  return _MTLHashState(v26, 0x420uLL);
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
      while (1)
      {
        v8 = self->_private.attachments->_descriptors[v7];
        v9 = *(MTLRenderPipelineColorAttachmentDescriptorInternal **)(*((void *)a3 + 1) + 8 + v7 * 8);
        if (v8 != v9)
        {
          BOOL v10 = !v8 || v9 == 0;
          if (v10 || v8->_private.var0.var1.var0 != v9->_private.var0.var1.var0) {
            break;
          }
        }
        if (++v7 == 8)
        {
          uint64_t v11 = 0;
          while (1)
          {
            v12 = self->_private.objectBuffers->_descriptors[v11];
            v13 = *(MTLPipelineBufferDescriptorInternal **)(*((void *)a3 + 19) + 8 + v11 * 8);
            if (v12 != v13)
            {
              BOOL v14 = !v12 || v13 == 0;
              if (v14 || v12->_private.var0.var1.var0 != v13->_private.var0.var1.var0) {
                goto LABEL_3;
              }
            }
            if (++v11 == 31)
            {
              uint64_t v15 = 0;
              while (1)
              {
                v16 = self->_private.meshBuffers->_descriptors[v15];
                v17 = *(MTLPipelineBufferDescriptorInternal **)(*((void *)a3 + 20) + 8 + v15 * 8);
                if (v16 != v17)
                {
                  BOOL v18 = !v16 || v17 == 0;
                  if (v18 || v16->_private.var0.var1.var0 != v17->_private.var0.var1.var0) {
                    goto LABEL_3;
                  }
                }
                if (++v15 == 31)
                {
                  uint64_t v19 = 0;
                  while (1)
                  {
                    v20 = self->_private.fragmentBuffers->_descriptors[v19];
                    v21 = *(MTLPipelineBufferDescriptorInternal **)(*((void *)a3 + 21) + 8 + v19 * 8);
                    if (v20 != v21)
                    {
                      BOOL v22 = !v20 || v21 == 0;
                      if (v22 || v20->_private.var0.var1.var0 != v21->_private.var0.var1.var0) {
                        goto LABEL_3;
                      }
                    }
                    if (++v19 == 31)
                    {
                      if (self->_private.depthAttachmentPixelFormat != *((void *)a3 + 2)
                        || self->_private.stencilAttachmentPixelFormat != *((void *)a3 + 3)
                        || self->_private.textureWriteRoundingMode != *((void *)a3 + 4)
                        || self->_private.resourceIndex != *((void *)a3 + 10)
                        || self->_private.explicitVisibilityGroupID != *((_DWORD *)a3 + 74)
                        || self->_private.fragmentDepthCompareClampMask != *((_DWORD *)a3 + 19)
                        || self->_private.rasterSampleCount != *((void *)a3 + 5)
                        || self->_private.sampleMask != *((void *)a3 + 7)
                        || self->_private.var0.sampleCoverage != *((float *)a3 + 16)
                        || self->_private.colorSampleCount != *((void *)a3 + 6)
                        || self->_private.var1.miscHash[0] != *((_DWORD *)a3 + 17)
                        || self->_private.var1.miscHash[1] != *((_DWORD *)a3 + 18))
                      {
                        goto LABEL_3;
                      }
                      label = self->_private.label;
                      if (label == *((NSString **)a3 + 11) || (int v6 = -[NSString isEqual:](label, "isEqual:")) != 0)
                      {
                        objectFunction = self->_private.objectFunction;
                        if (objectFunction == *((MTLFunction **)a3 + 12)
                          || (int v6 = -[MTLFunction isEqual:](objectFunction, "isEqual:")) != 0)
                        {
                          meshFunction = self->_private.meshFunction;
                          if (meshFunction == *((MTLFunction **)a3 + 13)
                            || (int v6 = -[MTLFunction isEqual:](meshFunction, "isEqual:")) != 0)
                          {
                            fragmentFunction = self->_private.fragmentFunction;
                            if (fragmentFunction == *((MTLFunction **)a3 + 14)
                              || (int v6 = -[MTLFunction isEqual:](fragmentFunction, "isEqual:")) != 0)
                            {
                              driverCompilerOptions = self->_private.driverCompilerOptions;
                              if (driverCompilerOptions == *((NSDictionary **)a3 + 22)
                                || (int v6 = -[NSDictionary isEqual:](driverCompilerOptions, "isEqual:")) != 0)
                              {
                                gpuCompilerSPIOptions = self->_private.gpuCompilerSPIOptions;
                                if (gpuCompilerSPIOptions == *((NSDictionary **)a3 + 23)
                                  || (int v6 = -[NSDictionary isEqual:](gpuCompilerSPIOptions, "isEqual:")) != 0)
                                {
                                  pluginData = self->_private.pluginData;
                                  if (pluginData == *((NSDictionary **)a3 + 24)
                                    || (int v6 = -[NSDictionary isEqual:](pluginData, "isEqual:")) != 0)
                                  {
                                    int v30 = MTLCompareArray(self->_private.binaryArchives, *((void **)a3 + 25), 1, 0);
                                    LOBYTE(v6) = 0;
                                    if (v30)
                                    {
                                      if (self->_private.pipelineMemoryLength == *((void *)a3 + 18)
                                        && self->_private.maxTotalThreadsPerObjectThreadgroup == *((void *)a3 + 15)
                                        && self->_private.maxTotalThreadsPerMeshThreadgroup == *((void *)a3 + 16)
                                        && self->_private.maxTotalThreadgroupsPerMeshGrid == *((void *)a3 + 17))
                                      {
                                        int v6 = MTLCompareFunctionList(self->_private.objectLinkedFunctions, *((void **)a3 + 27));
                                        if (!v6) {
                                          return v6;
                                        }
                                        int v6 = MTLCompareFunctionList(self->_private.meshLinkedFunctions, *((void **)a3 + 28));
                                        if (!v6) {
                                          return v6;
                                        }
                                        int v6 = MTLCompareFunctionList(self->_private.fragmentLinkedFunctions, *((void **)a3 + 29));
                                        if (!v6) {
                                          return v6;
                                        }
                                        int v6 = MTLCompareArray(self->_private.objectPreloadedLibraries, *((void **)a3 + 30), 1, 1);
                                        if (!v6) {
                                          return v6;
                                        }
                                        int v6 = MTLCompareArray(self->_private.meshPreloadedLibraries, *((void **)a3 + 31), 1, 1);
                                        if (!v6) {
                                          return v6;
                                        }
                                        int v6 = MTLCompareArray(self->_private.fragmentPreloadedLibraries, *((void **)a3 + 32), 1, 1);
                                        if (!v6) {
                                          return v6;
                                        }
                                        if (self->_private.maxObjectStackCallDepth == *((void *)a3 + 33)
                                          && self->_private.maxMeshStackCallDepth == *((void *)a3 + 34)
                                          && self->_private.maxFragmentStackCallDepth == *((void *)a3 + 35))
                                        {
                                          profileControl = self->_private.profileControl;
                                          if (profileControl != *((MTLProfileControl **)a3 + 36))
                                          {
                                            int v6 = -[MTLProfileControl isEqual:](profileControl, "isEqual:");
                                            if (!v6) {
                                              return v6;
                                            }
                                          }
                                          if (self->_private.maxAccelerationStructureTraversalDepth == *((void *)a3 + 38)
                                            && self->_private.shaderValidation == *((void *)a3 + 39))
                                          {
                                            LOBYTE(v6) = self->_private.shaderValidationState == *((void *)a3 + 40);
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
                  }
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

- (id)formattedDescription:(unint64_t)a3
{
  v40[57] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = a3 + 8;
  [@"\n" stringByPaddingToLength:v6 withString:@" " startingAtIndex:0];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:128];
  v40[0] = v5;
  v40[1] = @"label =";
  label = @"<none>";
  objectFunction = self->_private.objectFunction;
  if (self->_private.label) {
    label = (__CFString *)self->_private.label;
  }
  v40[2] = label;
  v40[3] = v5;
  v40[4] = @"objectFunction =";
  if (objectFunction) {
    uint64_t v10 = [(MTLFunction *)objectFunction formattedDescription:v6];
  }
  else {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[5] = v10;
  v40[6] = v5;
  v40[7] = @"meshFunction =";
  meshFunction = self->_private.meshFunction;
  if (meshFunction) {
    uint64_t v12 = [(MTLFunction *)meshFunction formattedDescription:v6];
  }
  else {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[8] = v12;
  v40[9] = v5;
  v40[10] = @"fragmentFunction =";
  fragmentFunction = self->_private.fragmentFunction;
  if (fragmentFunction) {
    uint64_t v14 = [(MTLFunction *)fragmentFunction formattedDescription:v6];
  }
  else {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[11] = v14;
  v40[12] = v5;
  v40[13] = @"maxTotalThreadsPerObjectThreadgroup =";
  v40[14] = [NSNumber numberWithUnsignedInteger:self->_private.maxTotalThreadsPerObjectThreadgroup];
  v40[15] = v5;
  v40[16] = @"maxTotalThreadsPerMeshThreadgroup =";
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:self->_private.maxTotalThreadsPerMeshThreadgroup];
  $B06BB717815CF97A56C090CBE4612AE0 var1 = self->_private.var1;
  if ((*(void *)&var1 & 0x8000000000) != 0) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  v40[19] = @"objectThreadgroupSizeIsMultipleOfThreadExecutionWidth =";
  v40[20] = v17;
  v40[17] = v15;
  v40[18] = v5;
  v40[21] = v5;
  v40[22] = @"meshThreadgroupSizeIsMultipleOfThreadExecutionWidth =";
  if ((*(void *)&var1 & 0x10000000000) != 0) {
    BOOL v18 = @"YES";
  }
  else {
    BOOL v18 = @"NO";
  }
  v40[23] = v18;
  v40[24] = v5;
  v40[25] = @"payloadMemoryLength =";
  v40[26] = [NSNumber numberWithUnsignedInteger:self->_private.pipelineMemoryLength];
  v40[27] = v5;
  v40[28] = @"maxTotalThreadgroupsPerMeshGrid =";
  v40[29] = [NSNumber numberWithUnsignedInteger:self->_private.maxTotalThreadgroupsPerMeshGrid];
  v40[30] = v5;
  v40[31] = @"rasterSampleCount =";
  v40[32] = [NSNumber numberWithUnsignedInteger:self->_private.rasterSampleCount];
  v40[33] = v5;
  v40[34] = @"alphaToCoverageEnabled =";
  v40[35] = [NSNumber numberWithUnsignedInt:self->_private.var1.miscHash[0] & 1];
  v40[36] = v5;
  v40[37] = @"alphaToOneEnabled =";
  v40[38] = [NSNumber numberWithUnsignedInt:(self->_private.var1.miscHash[0] >> 1) & 1];
  v40[39] = v5;
  v40[40] = @"rasterizationEnabled =";
  v40[41] = [NSNumber numberWithUnsignedInt:(self->_private.var1.miscHash[0] >> 2) & 1];
  v40[42] = v5;
  v40[43] = @"maxVertexAmplificationCount =";
  v40[44] = [NSNumber numberWithUnsignedInt:(*(void *)&self->_private.var1 >> 35) & 0xFLL];
  v40[45] = v5;
  v40[46] = @"supportIndirectCommandBuffers =";
  v40[47] = [NSNumber numberWithUnsignedInt:self->_private.var1.miscHash[0] >> 31];
  v40[48] = v5;
  v40[49] = @"maxAccelerationStructureTraversalDepth =";
  v40[50] = [NSNumber numberWithUnsignedInteger:self->_private.maxAccelerationStructureTraversalDepth];
  v40[51] = v5;
  v40[52] = @"shaderValidation =";
  v40[53] = [NSNumber numberWithInteger:self->_private.shaderValidation];
  v40[54] = v5;
  v40[55] = @"shaderValidationState =";
  v40[56] = [NSNumber numberWithInteger:self->_private.shaderValidationState];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v40, 57));
  v39[0] = v5;
  v39[1] = @"objectLinkedFunctions =";
  objectLinkedFunctions = self->_private.objectLinkedFunctions;
  if (objectLinkedFunctions) {
    uint64_t v20 = [(MTLLinkedFunctions *)objectLinkedFunctions formattedDescription:v6];
  }
  else {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v39[2] = v20;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v39, 3));
  v38[0] = v5;
  v38[1] = @"meshLinkedFunctions =";
  meshLinkedFunctions = self->_private.meshLinkedFunctions;
  if (meshLinkedFunctions) {
    uint64_t v22 = [(MTLLinkedFunctions *)meshLinkedFunctions formattedDescription:v6];
  }
  else {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[2] = v22;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v38, 3));
  v37[0] = v5;
  v37[1] = @"fragmentLinkedFunctions =";
  fragmentLinkedFunctions = self->_private.fragmentLinkedFunctions;
  if (fragmentLinkedFunctions) {
    uint64_t v24 = [(MTLLinkedFunctions *)fragmentLinkedFunctions formattedDescription:v6];
  }
  else {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[2] = v24;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v37, 3));
  v36[0] = v5;
  v36[1] = @"depthAttachmentPixelFormat =";
  v36[2] = [NSString stringWithUTF8String:MTLPixelFormatGetName(self->_private.depthAttachmentPixelFormat)];
  v36[3] = v5;
  v36[4] = @"stencilAttachmentPixelFormat =";
  v36[5] = [NSString stringWithUTF8String:MTLPixelFormatGetName(self->_private.stencilAttachmentPixelFormat)];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v36, 6));
  for (uint64_t i = 0; i != 8; ++i)
  {
    v26 = self->_private.attachments->_descriptors[i];
    if (v26 && v26->_private.var0.var1.var0 >> 36)
    {
      v35[0] = v5;
      v35[1] = objc_msgSend(NSString, "stringWithFormat:", @"Color Attachment %u:", i);
      v35[2] = pipelineColorAttachmentFormattedDescription(v6, v26);
      objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 3));
    }
  }
  for (uint64_t j = 0; j != 31; ++j)
  {
    v28 = self->_private.objectBuffers->_descriptors[j];
    if (v28 && (*(unsigned char *)&v28->_private.var0.var0 & 3) != 0)
    {
      [v7 addObject:v5];
      [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"Object Buffer %u:", j)];
      objc_msgSend(v7, "addObject:", pipelineBufferFormattedDescription(v6, v28));
    }
  }
  for (uint64_t k = 0; k != 31; ++k)
  {
    int v30 = self->_private.meshBuffers->_descriptors[k];
    if (v30 && (*(unsigned char *)&v30->_private.var0.var0 & 3) != 0)
    {
      [v7 addObject:v5];
      [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"Mesh Buffer %u:", k)];
      objc_msgSend(v7, "addObject:", pipelineBufferFormattedDescription(v6, v30));
    }
  }
  for (uint64_t m = 0; m != 31; ++m)
  {
    v32 = self->_private.fragmentBuffers->_descriptors[m];
    if (v32 && (*(unsigned char *)&v32->_private.var0.var0 & 3) != 0)
    {
      [v7 addObject:v5];
      [v7 addObject:objc_msgSend(NSString, "stringWithFormat:", @"Fragment Buffer %u:", m)];
      objc_msgSend(v7, "addObject:", pipelineBufferFormattedDescription(v6, v32));
    }
  }
  v34.receiver = self;
  v34.super_class = (Class)MTLMeshRenderPipelineDescriptor;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLMeshRenderPipelineDescriptor description](&v34, sel_description), objc_msgSend(v7, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLMeshRenderPipelineDescriptor *)self formattedDescription:0];
}

- (BOOL)supportIndirectCommandBuffers
{
  return *((unsigned __int8 *)&self->_private.var1.var0 + 3) >> 7;
}

- (void)setSupportIndirectCommandBuffers:(BOOL)supportIndirectCommandBuffers
{
  uint64_t v3 = 0x80000000;
  if (!supportIndirectCommandBuffers) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)setTextureWriteRoundingMode:(int64_t)a3
{
  self->_private.int textureWriteRoundingMode = a3;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_private.textureWriteRoundingMode;
}

- (BOOL)forceResourceIndex
{
  return (*((unsigned __int8 *)&self->_private.var1.var0 + 3) >> 5) & 1;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (unint64_t)resourceIndex
{
  return self->_private.resourceIndex;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_private.unint64_t resourceIndex = a3;
}

- (NSUInteger)rasterSampleCount
{
  return self->_private.rasterSampleCount;
}

- (void)setRasterSampleCount:(NSUInteger)rasterSampleCount
{
  self->_private.unint64_t rasterSampleCount = rasterSampleCount;
}

- (unint64_t)sampleMask
{
  return self->_private.sampleMask;
}

- (void)setSampleMask:(unint64_t)a3
{
  self->_private.sampleMasuint64_t k = a3;
}

- (float)sampleCoverage
{
  return self->_private.var0.sampleCoverage;
}

- (void)setSampleCoverage:(float)a3
{
  self->_private.var0.sampleCoverage = a3;
}

- (BOOL)isAlphaToCoverageEnabled
{
  return self->_private.var1.miscHash[0] & 1;
}

- (void)setAlphaToCoverageEnabled:(BOOL)alphaToCoverageEnabled
{
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFFFELL | alphaToCoverageEnabled);
}

- (BOOL)isAlphaToOneEnabled
{
  return (LOBYTE(self->_private.var1.miscHash[0]) >> 1) & 1;
}

- (void)setAlphaToOneEnabled:(BOOL)alphaToOneEnabled
{
  uint64_t v3 = 2;
  if (!alphaToOneEnabled) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)isRasterizationEnabled
{
  return (LOBYTE(self->_private.var1.miscHash[0]) >> 2) & 1;
}

- (void)setRasterizationEnabled:(BOOL)rasterizationEnabled
{
  uint64_t v3 = 4;
  if (!rasterizationEnabled) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (unint64_t)vertexAmplificationMode
{
  return (*(void *)&self->_private.var1 >> 7) & 1;
}

- (void)setVertexAmplificationMode:(unint64_t)a3
{
  if (!isVertexAmplificationModeValid(a3)) {
    MTLReportFailure(0, "-[MTLMeshRenderPipelineDescriptor setVertexAmplificationMode:]", 1007, @"vertexAmplificationMode value %lu is invalid", v5, v6, v7, v8, a3);
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFF7FLL | ((a3 & 1) << 7));
}

- (NSUInteger)maxVertexAmplificationCount
{
  return (*(void *)&self->_private.var1 >> 35) & 0xFLL;
}

- (void)setMaxVertexAmplificationCount:(NSUInteger)maxVertexAmplificationCount
{
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFF87FFFFFFFFLL | ((maxVertexAmplificationCount & 0xF) << 35));
}

- (unint64_t)colorSampleCount
{
  return self->_private.colorSampleCount;
}

- (void)setColorSampleCount:(unint64_t)a3
{
  self->_private.char colorSampleCount = a3;
}

- (BOOL)isLogicOperationEnabled
{
  return (*((unsigned __int8 *)&self->_private.var1.var0 + 3) >> 4) & 1;
}

- (void)setLogicOperationEnabled:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (unint64_t)logicOperation
{
  return (*(void *)&self->_private.var1 >> 24) & 0xFLL;
}

- (void)setLogicOperation:(unint64_t)a3
{
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFF0FFFFFFLL | ((a3 & 0xF) << 24));
}

- (BOOL)isAlphaTestEnabled
{
  return *((unsigned __int8 *)&self->_private.var1.var0 + 2) >> 7;
}

- (void)setAlphaTestEnabled:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (unint64_t)alphaTestFunction
{
  return (*(void *)&self->_private.var1 >> 20) & 7;
}

- (void)setAlphaTestFunction:(unint64_t)a3
{
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFF8FFFFFLL | ((a3 & 7) << 20));
}

- (void)setClipDistanceEnableMask:(unsigned __int8)a3
{
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFF00FFFLL | ((unint64_t)a3 << 12));
}

- (unsigned)clipDistanceEnableMask
{
  return self->_private.var1.miscHash[0] >> 12;
}

- (BOOL)isPointSmoothEnabled
{
  return (BYTE1(self->_private.var1.miscHash[0]) >> 3) & 1;
}

- (void)setPointSmoothEnabled:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)isPointCoordLowerLeft
{
  return (BYTE1(self->_private.var1.miscHash[0]) >> 2) & 1;
}

- (void)setPointCoordLowerLeft:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)isPointSizeOutputVS
{
  return (BYTE1(self->_private.var1.miscHash[0]) >> 1) & 1;
}

- (void)setPointSizeOutputVS:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)isTwoSideEnabled
{
  return BYTE1(self->_private.var1.miscHash[0]) & 1;
}

- (void)setTwoSideEnabled:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (unsigned)fragmentDepthCompareClampMask
{
  return self->_private.fragmentDepthCompareClampMask;
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
  pluginData = self->_private.pluginData;
  if (pluginData != a3)
  {

    self->_private.pluginData = (NSDictionary *)a3;
  }
}

- (BOOL)openGLModeEnabled
{
  return (LOBYTE(self->_private.var1.miscHash[0]) >> 4) & 1;
}

- (void)setOpenGLModeEnabled:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)needsCustomBorderColorSamplers
{
  return (*((unsigned __int8 *)&self->_private.var1.var0 + 3) >> 6) & 1;
}

- (void)setNeedsCustomBorderColorSamplers:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)sampleCoverageInvert
{
  return (LOBYTE(self->_private.var1.miscHash[0]) >> 5) & 1;
}

- (void)setSampleCoverageInvert:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)isDepthStencilWriteDisabled
{
  return (LOBYTE(self->_private.var1.miscHash[0]) >> 3) & 1;
}

- (void)setDepthStencilWriteDisabled:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (void)setBinaryArchives:(id)a3
{
  binaryArchives = self->_private.binaryArchives;
  if (binaryArchives != a3)
  {

    self->_private.binaryArchives = (NSArray *)[a3 copy];
  }
}

- (NSArray)binaryArchives
{
  return self->_private.binaryArchives;
}

- (MTLLinkedFunctions)objectLinkedFunctions
{
  result = self->_private.objectLinkedFunctions;
  if (!result)
  {
    result = objc_alloc_init(MTLLinkedFunctions);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_private.objectLinkedFunctions, (unint64_t *)&v4, (unint64_t)result);
    if (v4)
    {

      return self->_private.objectLinkedFunctions;
    }
    else
    {
      self->_private.objectLinkedFunctions = result;
    }
  }
  return result;
}

- (void)setObjectLinkedFunctions:(MTLLinkedFunctions *)objectLinkedFunctions
{
  if (objectLinkedFunctions)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setObjectLinkedFunctions:]", 1219, @"linkedFunctions is not a MTLLinkedFunctions.", v5, v6, v7, v8, v9);
    }
  }
  if (self->_private.objectLinkedFunctions != objectLinkedFunctions)
  {
    uint64_t v10 = self->_private.objectLinkedFunctions;
    self->_private.objectLinkedFunctions = (MTLLinkedFunctions *)[(MTLLinkedFunctions *)objectLinkedFunctions copy];
  }
}

- (MTLLinkedFunctions)meshLinkedFunctions
{
  result = self->_private.meshLinkedFunctions;
  if (!result)
  {
    result = objc_alloc_init(MTLLinkedFunctions);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_private.meshLinkedFunctions, (unint64_t *)&v4, (unint64_t)result);
    if (v4)
    {

      return self->_private.meshLinkedFunctions;
    }
    else
    {
      self->_private.meshLinkedFunctions = result;
    }
  }
  return result;
}

- (void)setMeshLinkedFunctions:(MTLLinkedFunctions *)meshLinkedFunctions
{
  if (meshLinkedFunctions)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setMeshLinkedFunctions:]", 1247, @"linkedFunctions is not a MTLLinkedFunctions.", v5, v6, v7, v8, v9);
    }
  }
  if (self->_private.meshLinkedFunctions != meshLinkedFunctions)
  {
    uint64_t v10 = self->_private.meshLinkedFunctions;
    self->_private.meshLinkedFunctions = (MTLLinkedFunctions *)[(MTLLinkedFunctions *)meshLinkedFunctions copy];
  }
}

- (MTLLinkedFunctions)fragmentLinkedFunctions
{
  result = self->_private.fragmentLinkedFunctions;
  if (!result)
  {
    result = objc_alloc_init(MTLLinkedFunctions);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_private.fragmentLinkedFunctions, (unint64_t *)&v4, (unint64_t)result);
    if (v4)
    {

      return self->_private.fragmentLinkedFunctions;
    }
    else
    {
      self->_private.fragmentLinkedFunctions = result;
    }
  }
  return result;
}

- (void)setFragmentLinkedFunctions:(MTLLinkedFunctions *)fragmentLinkedFunctions
{
  if (fragmentLinkedFunctions)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setFragmentLinkedFunctions:]", 1275, @"linkedFunctions is not a MTLLinkedFunctions.", v5, v6, v7, v8, v9);
    }
  }
  if (self->_private.fragmentLinkedFunctions != fragmentLinkedFunctions)
  {
    uint64_t v10 = self->_private.fragmentLinkedFunctions;
    self->_private.fragmentLinkedFunctions = (MTLLinkedFunctions *)[(MTLLinkedFunctions *)fragmentLinkedFunctions copy];
  }
}

- (id)objectPreloadedLibraries
{
  return self->_private.objectPreloadedLibraries;
}

- (void)setObjectPreloadedLibraries:(id)a3
{
  objectPreloadedLibraries = self->_private.objectPreloadedLibraries;
  if (objectPreloadedLibraries != a3)
  {

    self->_private.objectPreloadedLibraries = (NSArray *)[a3 copy];
  }
}

- (id)meshPreloadedLibraries
{
  return self->_private.meshPreloadedLibraries;
}

- (void)setMeshPreloadedLibraries:(id)a3
{
  meshPreloadedLibraries = self->_private.meshPreloadedLibraries;
  if (meshPreloadedLibraries != a3)
  {

    self->_private.meshPreloadedLibraries = (NSArray *)[a3 copy];
  }
}

- (id)fragmentPreloadedLibraries
{
  return self->_private.fragmentPreloadedLibraries;
}

- (void)setFragmentPreloadedLibraries:(id)a3
{
  fragmentPreloadedLibraries = self->_private.fragmentPreloadedLibraries;
  if (fragmentPreloadedLibraries != a3)
  {

    self->_private.fragmentPreloadedLibraries = (NSArray *)[a3 copy];
  }
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
  [(MTLMeshRenderPipelineDescriptor *)self setObjectPreloadedLibraries:a3];
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
  [(MTLMeshRenderPipelineDescriptor *)self setMeshPreloadedLibraries:a3];
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
  [(MTLMeshRenderPipelineDescriptor *)self setFragmentPreloadedLibraries:a3];
}

- (BOOL)supportAddingObjectBinaryFunctions
{
  return *((unsigned char *)&self->_private.var1.var0 + 4) & 1;
}

- (void)setSupportAddingObjectBinaryFunctions:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)supportAddingMeshBinaryFunctions
{
  return (*((unsigned __int8 *)&self->_private.var1.var0 + 4) >> 1) & 1;
}

- (void)setSupportAddingMeshBinaryFunctions:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)supportAddingFragmentBinaryFunctions
{
  return (*((unsigned __int8 *)&self->_private.var1.var0 + 4) >> 2) & 1;
}

- (void)setSupportAddingFragmentBinaryFunctions:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (unint64_t)maxObjectCallStackDepth
{
  return self->_private.maxObjectStackCallDepth;
}

- (void)setMaxObjectCallStackDepth:(unint64_t)a3
{
  self->_private.unint64_t maxObjectStackCallDepth = a3;
}

- (unint64_t)maxMeshCallStackDepth
{
  return self->_private.maxMeshStackCallDepth;
}

- (void)setMaxMeshCallStackDepth:(unint64_t)a3
{
  self->_private.maxMeshStackCallDepth = a3;
}

- (unint64_t)maxFragmentCallStackDepth
{
  return self->_private.maxFragmentStackCallDepth;
}

- (void)setMaxFragmentCallStackDepth:(unint64_t)a3
{
  self->_private.unint64_t maxFragmentStackCallDepth = a3;
}

- (unsigned)explicitVisibilityGroupID
{
  return self->_private.explicitVisibilityGroupID;
}

- (void)setExplicitVisibilityGroupID:(unsigned int)a3
{
  self->_private.unsigned int explicitVisibilityGroupID = a3;
}

- (MTLPipelineBufferDescriptorArray)objectBuffers
{
  return &self->_private.objectBuffers->super;
}

- (MTLPipelineBufferDescriptorArray)meshBuffers
{
  return &self->_private.meshBuffers->super;
}

- (MTLPipelineBufferDescriptorArray)fragmentBuffers
{
  return &self->_private.fragmentBuffers->super;
}

- (NSString)label
{
  return self->_private.label;
}

- (void)setLabel:(NSString *)label
{
  if (label)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setLabel:]", 1452, @"label is not a NSString.", v5, v6, v7, v8, v10);
    }
  }
  uint64_t v9 = self->_private.label;
  if (v9 != label)
  {

    self->_private.label = (NSString *)[(NSString *)label copy];
  }
}

- (void)setObjectFunction:(id)objectFunction
{
  if (objectFunction)
  {
    if (MTLFailureTypeGetEnabled(1uLL)
      && ([objectFunction conformsToProtocol:&unk_1ECB34AB8] & 1) == 0)
    {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setObjectFunction:]", 1465, @"objectFunction is not a MTLFunction.", v10, v11, v12, v13, v14);
    }
    if ([objectFunction functionType] != 8) {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setObjectFunction:]", 1466, @"objectFunction functionType is not MTLFunctionTypeObject.", v5, v6, v7, v8, v14);
    }
  }
  id v9 = objectFunction;

  self->_private.objectFunction = (MTLFunction *)objectFunction;
}

- (id)objectFunction
{
  return self->_private.objectFunction;
}

- (void)setMeshFunction:(id)meshFunction
{
  if (meshFunction)
  {
    if (MTLFailureTypeGetEnabled(1uLL) && ([meshFunction conformsToProtocol:&unk_1ECB34AB8] & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setMeshFunction:]", 1482, @"meshFunction is not a MTLFunction.", v10, v11, v12, v13, v14);
    }
    if ([meshFunction functionType] != 7) {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setMeshFunction:]", 1483, @"meshFunction functionType is not MTLFunctionTypeMesh.", v5, v6, v7, v8, v14);
    }
  }
  id v9 = meshFunction;

  self->_private.meshFunction = (MTLFunction *)meshFunction;
}

- (id)meshFunction
{
  return self->_private.meshFunction;
}

- (void)setFragmentFunction:(id)fragmentFunction
{
  if (fragmentFunction)
  {
    if (MTLFailureTypeGetEnabled(1uLL)
      && ([fragmentFunction conformsToProtocol:&unk_1ECB34AB8] & 1) == 0)
    {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setFragmentFunction:]", 1499, @"fragmentFunction is not a MTLFunction.", v10, v11, v12, v13, v14);
    }
    if ([fragmentFunction functionType] != 2) {
      MTLReportFailure(1uLL, "-[MTLMeshRenderPipelineDescriptor setFragmentFunction:]", 1500, @"fragmentFunction functionType is not a MTLFunctionTypeFragment.", v5, v6, v7, v8, v14);
    }
  }
  id v9 = fragmentFunction;

  self->_private.fragmentFunction = (MTLFunction *)fragmentFunction;
}

- (id)fragmentFunction
{
  return self->_private.fragmentFunction;
}

- (NSUInteger)maxTotalThreadsPerObjectThreadgroup
{
  return self->_private.maxTotalThreadsPerObjectThreadgroup;
}

- (void)setMaxTotalThreadsPerObjectThreadgroup:(NSUInteger)maxTotalThreadsPerObjectThreadgroup
{
  self->_private.maxTotalThreadsPerObjectThreadgroup = maxTotalThreadsPerObjectThreadgroup;
}

- (NSUInteger)maxTotalThreadsPerMeshThreadgroup
{
  return self->_private.maxTotalThreadsPerMeshThreadgroup;
}

- (void)setMaxTotalThreadsPerMeshThreadgroup:(NSUInteger)maxTotalThreadsPerMeshThreadgroup
{
  self->_private.maxTotalThreadsPerMeshThreadgroup = maxTotalThreadsPerMeshThreadgroup;
}

- (BOOL)objectThreadgroupSizeIsMultipleOfThreadExecutionWidth
{
  return *((unsigned __int8 *)&self->_private.var1.var0 + 4) >> 7;
}

- (void)setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)objectThreadgroupSizeIsMultipleOfThreadExecutionWidth
{
  uint64_t v3 = 0x8000000000;
  if (!objectThreadgroupSizeIsMultipleOfThreadExecutionWidth) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)meshThreadgroupSizeIsMultipleOfThreadExecutionWidth
{
  return *((unsigned char *)&self->_private.var1.var0 + 5) & 1;
}

- (void)setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:(BOOL)meshThreadgroupSizeIsMultipleOfThreadExecutionWidth
{
  uint64_t v3 = 0x10000000000;
  if (!meshThreadgroupSizeIsMultipleOfThreadExecutionWidth) {
    uint64_t v3 = 0;
  }
  self->_private.$B06BB717815CF97A56C090CBE4612AE0 var1 = ($B06BB717815CF97A56C090CBE4612AE0)(*(void *)&self->_private.var1 & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (NSUInteger)payloadMemoryLength
{
  return self->_private.pipelineMemoryLength;
}

- (void)setPayloadMemoryLength:(NSUInteger)payloadMemoryLength
{
  self->_private.unint64_t pipelineMemoryLength = payloadMemoryLength;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxThreadgroupsPerMeshGrid
{
  unint64_t var2 = self[5].var2;
  unint64_t v4 = var2 != 0;
  retstr->var0 = var2;
  retstr->$B06BB717815CF97A56C090CBE4612AE0 var1 = v4;
  retstr->unint64_t var2 = v4;
  return self;
}

- (void)setMaxThreadgroupsPerMeshGrid:(id *)a3
{
  self->_private.unint64_t maxTotalThreadgroupsPerMeshGrid = a3->var1 * a3->var0 * a3->var2;
}

- (NSUInteger)maxTotalThreadgroupsPerMeshGrid
{
  return self->_private.maxTotalThreadgroupsPerMeshGrid;
}

- (void)setMaxTotalThreadgroupsPerMeshGrid:(NSUInteger)maxTotalThreadgroupsPerMeshGrid
{
  self->_private.unint64_t maxTotalThreadgroupsPerMeshGrid = maxTotalThreadgroupsPerMeshGrid;
}

- (void)setPipelineLibrary:(id)a3
{
  pipelineLibrary = self->_private.pipelineLibrary;
  if (pipelineLibrary != a3)
  {

    self->_private.pipelineLibrary = (MTLPipelineLibrary *)a3;
  }
}

- (id)pipelineLibrary
{
  return self->_private.pipelineLibrary;
}

- (void)setDriverCompilerOptions:(id)a3
{
  driverCompilerOptions = self->_private.driverCompilerOptions;
  if (driverCompilerOptions != a3)
  {

    self->_private.driverCompilerOptions = (NSDictionary *)[a3 copy];
  }
}

- (id)driverCompilerOptions
{
  return self->_private.driverCompilerOptions;
}

- (void)setGpuCompilerSPIOptions:(id)a3
{
  gpuCompilerSPIOptions = self->_private.gpuCompilerSPIOptions;
  if (gpuCompilerSPIOptions != a3)
  {

    self->_private.gpuCompilerSPIOptions = (NSDictionary *)[a3 copy];
  }
}

- (id)gpuCompilerSPIOptions
{
  return self->_private.gpuCompilerSPIOptions;
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
  self->_private.int64_t shaderValidationState = a3;
}

- (int64_t)shaderValidationState
{
  return self->_private.shaderValidationState;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (MTLRenderPipelineColorAttachmentDescriptorArray)colorAttachments
{
  return &self->_private.attachments->super;
}

- (MTLPixelFormat)depthAttachmentPixelFormat
{
  return self->_private.depthAttachmentPixelFormat;
}

- (void)setDepthAttachmentPixelFormat:(MTLPixelFormat)depthAttachmentPixelFormat
{
  self->_private.depthAttachmentPixelFormat = depthAttachmentPixelFormat;
}

- (MTLPixelFormat)stencilAttachmentPixelFormat
{
  return self->_private.stencilAttachmentPixelFormat;
}

- (void)setStencilAttachmentPixelFormat:(MTLPixelFormat)stencilAttachmentPixelFormat
{
  self->_private.stencilAttachmentPixelFormat = stencilAttachmentPixelFormat;
}

- (BOOL)validateWithDevice:(id)a3 error:(id *)a4
{
  char v7 = [a3 supportsTextureSampleCount:self->_private.rasterSampleCount];
  if (v7)
  {
    [a3 registerMeshRenderPipelineDescriptor:self];
    uint64_t v42 = 0;
    memset(v41, 0, sizeof(v41));
    _MTLMessageContextBegin_((uint64_t)v41, (uint64_t)"validateWithDevice", 1721, (uint64_t)a3, 3, (uint64_t)"Mesh Render Pipeline Descriptor Validation");
    if ((self->_private.var1.miscHash[0] & 4) != 0)
    {
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = self->_private.attachments->_descriptors[v11];
        if (v12)
        {
          if (v12->_private.var0.var1.var0 >> 36) {
            break;
          }
        }
        if (++v11 == 8) {
          goto LABEL_7;
        }
      }
      uint64_t v13 = 1;
    }
    else
    {
LABEL_7:
      uint64_t v13 = 0;
    }
    validateFunction((uint64_t)v41, (uint64_t)a3, self->_private.fragmentFunction, (uint64_t)"fragmentFunction", v13, v8, v9, v10);
    validateFunction((uint64_t)v41, (uint64_t)a3, self->_private.objectFunction, (uint64_t)"objectFunction", 0, v14, v15, v16);
    validateFunction((uint64_t)v41, (uint64_t)a3, self->_private.meshFunction, (uint64_t)"meshFunction", 1, v17, v18, v19);
    validateMeshRenderPipelinePostMeshShader(v41, a3, &self->_private);
    if ([(NSArray *)[(MTLLinkedFunctions *)self->_private.objectLinkedFunctions binaryFunctions] count]|| [(NSArray *)[(MTLLinkedFunctions *)self->_private.meshLinkedFunctions binaryFunctions] count])
    {
      _MTLMessageContextPush_((uint64_t)v41, 4, @"Binary linked functions are not supported for object and mesh shaders", v20, v21, v22, v23, v24, v40);
    }
    if ((*((unsigned char *)&self->_private.var1.var0 + 3) & 0x80) != 0
      && ([a3 supportsMeshShadersInICB] & 1) == 0)
    {
      _MTLMessageContextPush_((uint64_t)v41, 4, @"Use of mesh shader pipelines in indirect command buffers is not supported by this device.", v25, v26, v27, v28, v29, v40);
    }
    unint64_t maxAccelerationStructureTraversalDepth = self->_private.maxAccelerationStructureTraversalDepth;
    if (maxAccelerationStructureTraversalDepth > [a3 maxAccelerationStructureTraversalDepth])
    {
      unint64_t v34 = self->_private.maxAccelerationStructureTraversalDepth;
      [a3 maxAccelerationStructureTraversalDepth];
      _MTLMessageContextPush_((uint64_t)v41, 4, @"maxAccelerationStructureTraversalDepth (%lu) must be less than or equal to %lu", v35, v36, v37, v38, v39, v34);
    }
    _MTLMessageContextEnd((uint64_t)v41);
  }
  else
  {
    uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"rasterSampleCount (%lu) is not supported by device.", self->_private.rasterSampleCount);
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v31 forKey:*MEMORY[0x1E4F28568]];
    *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PipelineError" code:1 userInfo:v32];
  }
  return v7;
}

- (id)newSerializedFragmentDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  id result = (id)newMeshSerializedFragmentData(a3, a4, &self->_private);
  if (a5) {
    *a5 = 0;
  }
  return result;
}

- (id)newSerializedObjectDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  id result = newMeshSerializedObjectOrMeshData<MTLMeshRenderPipelineDescriptorPrivate>(0, a3, a4, (uint64_t)&self->_private);
  if (a5) {
    *a5 = 0;
  }
  return result;
}

- (id)newSerializedMeshDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  id result = newMeshSerializedObjectOrMeshData<MTLMeshRenderPipelineDescriptorPrivate>(1, a3, a4, (uint64_t)&self->_private);
  if (a5) {
    *a5 = 0;
  }
  return result;
}

- (id)newRenderPipelineDescriptor
{
  return [(MTLMeshRenderPipelineDescriptor *)self newRenderPipelineDescriptorWithDevice:0 error:0];
}

- (id)newRenderPipelineDescriptorWithDevice:(id)a3 error:(id *)a4
{
  if (a3 && ![(MTLMeshRenderPipelineDescriptor *)self validateWithDevice:a3 error:a4]) {
    return 0;
  }
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = 0;
  descriptors = self->_private.objectBuffers->_descriptors;
  uint64_t v8 = *(void *)(v5 + 424) + 8;
  do
  {
    uint64_t v9 = descriptors[v6];
    if (v9)
    {
      unint64_t var0 = v9->_private.var0.var1.var0;
      uint64_t v11 = objc_opt_new();
      *(void *)(v8 + v6 * 8) = v11;
      *(void *)(v11 + 8) = var0;
    }
    ++v6;
  }
  while (v6 != 31);
  uint64_t v12 = 0;
  uint64_t v13 = self->_private.meshBuffers->_descriptors;
  uint64_t v14 = *(void *)(v5 + 432) + 8;
  do
  {
    uint64_t v15 = v13[v12];
    if (v15)
    {
      unint64_t v16 = v15->_private.var0.var1.var0;
      uint64_t v17 = objc_opt_new();
      *(void *)(v14 + v12 * 8) = v17;
      *(void *)(v17 + 8) = v16;
    }
    ++v12;
  }
  while (v12 != 31);
  uint64_t v18 = 0;
  uint64_t v19 = self->_private.fragmentBuffers->_descriptors;
  uint64_t v20 = *(void *)(v5 + 464) + 8;
  do
  {
    uint64_t v21 = v19[v18];
    if (v21)
    {
      unint64_t v22 = v21->_private.var0.var1.var0;
      uint64_t v23 = objc_opt_new();
      *(void *)(v20 + v18 * 8) = v23;
      *(void *)(v23 + 8) = v22;
    }
    ++v18;
  }
  while (v18 != 31);
  uint64_t v24 = 0;
  uint64_t v25 = self->_private.attachments->_descriptors;
  uint64_t v26 = *(void *)(v5 + 48) + 8;
  do
  {
    uint64_t v27 = v25[v24];
    if (v27)
    {
      unint64_t v28 = v27->_private.var0.var1.var0;
      uint64_t v29 = objc_alloc_init(MTLRenderPipelineColorAttachmentDescriptorInternal);
      *(void *)(v26 + v24 * 8) = v29;
      v29->_private.var0.var1.unint64_t var0 = v28;
    }
    ++v24;
  }
  while (v24 != 8);
  *(_OWORD *)(v5 + 120) = *(_OWORD *)&self->_private.depthAttachmentPixelFormat;
  *(_OWORD *)(v5 + 224) = *(_OWORD *)&self->_private.textureWriteRoundingMode;
  sampleMasuint64_t k = self->_private.sampleMask;
  *(void *)(v5 + 264) = self->_private.colorSampleCount;
  *(void *)(v5 + 240) = sampleMask;
  *(_DWORD *)(v5 + 248) = self->_private.var0.sampleCoverageHash;
  unint64_t v31 = *(void *)(v5 + 272) & 0xFFFFFFFFFFFFFFFELL | *(void *)&self->_private.var1 & 1;
  *(void *)(v5 + 272) = v31;
  unint64_t v32 = v31 & 0xFFFFFFFFFFFFFFFDLL | (2 * ((*(void *)&self->_private.var1 >> 1) & 1));
  *(void *)(v5 + 272) = v32;
  unint64_t v33 = v32 & 0xFFFFFFFFFFFFFFFBLL | (4 * ((*(void *)&self->_private.var1 >> 2) & 1));
  *(void *)(v5 + 272) = v33;
  unint64_t v34 = v33 & 0xFFFFFFFFFFFFFFBFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 3) & 1) << 6);
  *(void *)(v5 + 272) = v34;
  unint64_t v35 = v34 & 0xFFFFFFFFFFFFFF7FLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 4) & 1) << 7);
  *(void *)(v5 + 272) = v35;
  unint64_t v36 = v35 & 0xFFFFFFFFFFFFFEFFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 5) & 1) << 8);
  *(void *)(v5 + 272) = v36;
  unint64_t v37 = v36 & 0xFFFFFFFFFFFFFBFFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 7) & 1) << 10);
  *(void *)(v5 + 272) = v37;
  unint64_t v38 = v37 & 0xFFFFFFFFFFFFF7FFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 8) & 1) << 11);
  *(void *)(v5 + 272) = v38;
  unint64_t v39 = v38 & 0xFFFFFFFFFFFFEFFFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 9) & 1) << 12);
  *(void *)(v5 + 272) = v39;
  unint64_t v40 = v39 & 0xFFFFFFFFFFFFDFFFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 10) & 1) << 13);
  *(void *)(v5 + 272) = v40;
  unint64_t v41 = v40 & 0xFFFFFFFFFFFFBFFFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 11) & 1) << 14);
  *(void *)(v5 + 272) = v41;
  unint64_t v42 = v41 & 0xFFFFFFFFFF807FFFLL | ((unint64_t)((unint64_t)self->_private.var1.miscHash[0] >> 12) << 15);
  *(void *)(v5 + 272) = v42;
  unint64_t v43 = v42 & 0xFFFFFFFFFC7FFFFFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 20) & 7) << 23);
  *(void *)(v5 + 272) = v43;
  unint64_t v44 = v43 & 0xFFFFFFFFFBFFFFFFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 23) & 1) << 26);
  *(void *)(v5 + 272) = v44;
  unint64_t v45 = v44 & 0xFFFFFFFF87FFFFFFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 24) & 0xF) << 27);
  *(void *)(v5 + 272) = v45;
  unint64_t v46 = v45 & 0xFFFFFFFF7FFFFFFFLL | ((((unint64_t)self->_private.var1.miscHash[0] >> 28) & 1) << 31);
  *(void *)(v5 + 272) = v46;
  *(void *)(v5 + 272) = v46 & 0xFFFFFFFEFFFFFFFFLL | (((*(void *)&self->_private.var1 >> 29) & 1) << 32);
  *(unsigned char *)(v5 + 520) = (self->_private.var1.miscHash[0] & 0x40000000) != 0;
  *(unsigned char *)(v5 + 200) = (self->_private.var1.miscHash[0] & 0x80000000) != 0;
  *(_DWORD *)(v5 + 524) = (*(void *)&self->_private.var1 >> 35) & 0xF;
  *(_DWORD *)(v5 + 284) = self->_private.fragmentDepthCompareClampMask;
  label = self->_private.label;
  *(void *)(v5 + 288) = self->_private.resourceIndex;
  *(void *)(v5 + 296) = [(NSString *)label copy];
  *(void *)(v5 + 328) = self->_private.objectFunction;
  *(void *)(v5 + 336) = self->_private.meshFunction;
  *(void *)(v5 + 312) = self->_private.fragmentFunction;
  *(_OWORD *)(v5 + 440) = *(_OWORD *)&self->_private.maxTotalThreadsPerObjectThreadgroup;
  unint64_t v48 = *(void *)(v5 + 272) & 0xFFFFFFFBFFFFFFFFLL | (((*(void *)&self->_private.var1 >> 39) & 1) << 34);
  *(void *)(v5 + 272) = v48;
  *(void *)(v5 + 272) = v48 & 0xFFFFFFF7FFFFFFFFLL | (((*(void *)&self->_private.var1 >> 40) & 1) << 35);
  *(void *)(v5 + 392) = self->_private.maxTotalThreadgroupsPerMeshGrid;
  *(int64x2_t *)(v5 + 400) = vdupq_n_s64(1uLL);
  *(void *)(v5 + 416) = self->_private.pipelineMemoryLength;
  *(void *)(v5 + 472) = [(NSDictionary *)self->_private.driverCompilerOptions copy];
  *(void *)(v5 + 480) = [(NSDictionary *)self->_private.gpuCompilerSPIOptions copy];
  *(void *)(v5 + 512) = [(NSDictionary *)self->_private.pluginData copy];
  *(void *)(v5 + 528) = [(NSArray *)self->_private.binaryArchives copy];
  *(void *)(v5 + 488) = self->_private.pipelineLibrary;
  *(void *)(v5 + 552) = [(MTLLinkedFunctions *)self->_private.objectLinkedFunctions copy];
  *(void *)(v5 + 560) = [(MTLLinkedFunctions *)self->_private.meshLinkedFunctions copy];
  *(void *)(v5 + 544) = [(MTLLinkedFunctions *)self->_private.fragmentLinkedFunctions copy];
  *(void *)(v5 + 584) = [(NSArray *)self->_private.objectPreloadedLibraries copy];
  *(void *)(v5 + 592) = [(NSArray *)self->_private.meshPreloadedLibraries copy];
  *(void *)(v5 + 576) = [(NSArray *)self->_private.fragmentPreloadedLibraries copy];
  *(unsigned char *)(v5 + 641) = *((unsigned char *)&self->_private.var1.var0 + 4) & 1;
  *(unsigned char *)(v5 + 640) = (*(void *)&self->_private.var1 & 0x200000000) != 0;
  *(unsigned char *)(v5 + 617) = (*(void *)&self->_private.var1 & 0x400000000) != 0;
  unint64_t maxMeshStackCallDepth = self->_private.maxMeshStackCallDepth;
  *(void *)(v5 + 632) = self->_private.maxObjectStackCallDepth;
  *(void *)(v5 + 624) = maxMeshStackCallDepth;
  profileControl = self->_private.profileControl;
  *(void *)(v5 + 608) = self->_private.maxFragmentStackCallDepth;
  *(_DWORD *)(v5 + 656) = self->_private.explicitVisibilityGroupID;
  *(void *)(v5 + 648) = [(MTLProfileControl *)profileControl copy];
  return (id)v5;
}

- (id)profileControl
{
  return self->_private.profileControl;
}

- (void)setProfileControl:(id)a3
{
  profileControl = self->_private.profileControl;
  if (profileControl != a3)
  {

    self->_private.profileControl = (MTLProfileControl *)[a3 copy];
  }
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return self->_private.maxAccelerationStructureTraversalDepth;
}

- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3
{
  self->_private.unint64_t maxAccelerationStructureTraversalDepth = a3;
}

@end