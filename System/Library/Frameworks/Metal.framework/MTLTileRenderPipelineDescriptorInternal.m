@interface MTLTileRenderPipelineDescriptorInternal
- (BOOL)isEqual:(id)a3;
- (BOOL)supportAddingBinaryFunctions;
- (BOOL)threadgroupSizeMatchesTileSize;
- (BOOL)validateWithDevice:(id)a3 error:(id *)a4;
- (MTLTileRenderPipelineDescriptorInternal)init;
- (const)_descriptorPrivate;
- (id)binaryArchives;
- (id)colorAttachments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)gpuCompilerSPIOptions;
- (id)insertLibraries;
- (id)label;
- (id)linkedFunctions;
- (id)newSerializedTileDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)pluginData;
- (id)preloadedLibraries;
- (id)profileControl;
- (id)tileBuffers;
- (id)tileFunction;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteRoundingMode;
- (uint64_t)setTextureWriteFPRoundingMode:(uint64_t)result;
- (uint64_t)textureWriteFPRoundingMode;
- (unint64_t)colorSampleCount;
- (unint64_t)hash;
- (unint64_t)maxAccelerationStructureTraversalDepth;
- (unint64_t)maxCallStackDepth;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)rasterSampleCount;
- (void)dealloc;
- (void)reset;
- (void)setBinaryArchives:(id)a3;
- (void)setColorSampleCount:(unint64_t)a3;
- (void)setGpuCompilerSPIOptions:(id)a3;
- (void)setInsertLibraries:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLinkedFunctions:(id)a3;
- (void)setMaxAccelerationStructureTraversalDepth:(unint64_t)a3;
- (void)setMaxCallStackDepth:(unint64_t)a3;
- (void)setMaxTotalThreadsPerThreadgroup:(unint64_t)a3;
- (void)setPluginData:(id)a3;
- (void)setPreloadedLibraries:(id)a3;
- (void)setProfileControl:(id)a3;
- (void)setRasterSampleCount:(unint64_t)a3;
- (void)setShaderValidation:(int64_t)a3;
- (void)setShaderValidationState:(int64_t)a3;
- (void)setSupportAddingBinaryFunctions:(BOOL)a3;
- (void)setTextureWriteRoundingMode:(int64_t)a3;
- (void)setThreadgroupSizeMatchesTileSize:(BOOL)a3;
- (void)setTileFunction:(id)a3;
- (void)validateWithDevice:(id)a3;
@end

@implementation MTLTileRenderPipelineDescriptorInternal

- (id)newSerializedTileDataWithFlags:(unint64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  unsigned int v5 = a4;
  p_private = &self->_private;
  uint64_t v7 = [(MTLFunction *)self->_private.tileFunction functionType];
  if (v7 == 3)
  {
    linkedFunctions = p_private->linkedFunctions;
    unsigned int v45 = v5;
    if (linkedFunctions
      && ([(MTLLinkedFunctions *)linkedFunctions functions]
       && [(NSArray *)[(MTLLinkedFunctions *)p_private->linkedFunctions functions] count]
       || [(MTLLinkedFunctions *)p_private->linkedFunctions privateFunctions]
       && [(NSArray *)[(MTLLinkedFunctions *)p_private->linkedFunctions privateFunctions] count]))
    {
      int v11 = 1;
      uint64_t v12 = 20;
    }
    else
    {
      int v11 = 0;
      uint64_t v12 = 12;
    }
    uint64_t v23 = MTLSerializePluginDataDictionary(objc_msgSend((id)-[MTLFunction device](p_private->tileFunction, "device"), "pluginData"), 0);
    uint64_t v24 = v23 + v12;
    uint64_t v25 = MTLSerializePluginDataDictionary(p_private->pluginData, 0);
    uint64_t v26 = v25;
    if (v11) {
      _MTLPopulateLinkedFunctionExtraData(p_private->linkedFunctions);
    }
    size_t v38 = v25 + v24;
    v39 = malloc_type_calloc(1uLL, v25 + v24, 0x875B66ABuLL);
    v40 = v39;
    v39[2] = v39[2] & 0xFFFFFFFD | (2 * (HIBYTE(v45) & 1));
    if (v23) {
      int v41 = v12;
    }
    else {
      int v41 = 0;
    }
    if (v26) {
      int v42 = v23 + v12;
    }
    else {
      int v42 = 0;
    }
    _DWORD *v39 = v41;
    v39[1] = v42;
    if (v23) {
      MTLSerializePluginDataDictionary(objc_msgSend((id)-[MTLFunction device](p_private->tileFunction, "device"), "pluginData"), &v39[(unint64_t)v12 / 4]);
    }
    if (v26) {
      MTLSerializePluginDataDictionary(p_private->pluginData, (unsigned char *)v40 + v24);
    }
    v35 = (void *)*MEMORY[0x1E4F143F0];
    v36 = v40;
    size_t v37 = v38;
  }
  else
  {
    if (v7 != 2) {
      return 0;
    }
    v8 = p_private->linkedFunctions;
    BOOL v9 = v8
      && ([(MTLLinkedFunctions *)v8 functions]
       && [(NSArray *)[(MTLLinkedFunctions *)p_private->linkedFunctions functions] count]
       || [(MTLLinkedFunctions *)p_private->linkedFunctions privateFunctions]
       && [(NSArray *)[(MTLLinkedFunctions *)p_private->linkedFunctions privateFunctions] count]);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    do
    {
      v16 = p_private->attachments->_descriptors[v14];
      if (v16 && v16->_private.var0.var0.pixelFormat) {
        ++v15;
      }
      ++v14;
    }
    while (v14 != 8);
    uint64_t v17 = 16;
    if (v9) {
      uint64_t v17 = 24;
    }
    uint64_t v18 = v17 + 2 * v15;
    uint64_t v19 = MTLSerializePluginDataDictionary(objc_msgSend((id)-[MTLFunction device](p_private->tileFunction, "device"), "pluginData"), 0);
    uint64_t v20 = v19 + v18;
    uint64_t v21 = MTLSerializePluginDataDictionary(p_private->pluginData, 0);
    uint64_t v22 = v21;
    uint64_t v43 = v18;
    if (v9) {
      _MTLPopulateLinkedFunctionExtraData(p_private->linkedFunctions);
    }
    size_t v44 = v21 + v20;
    v27 = malloc_type_calloc(1uLL, v21 + v20, 0x7A26F777uLL);
    v28 = v27;
    uint64_t v29 = 0;
    int v30 = 0;
    v27[2] = (v5 << 6) & 0x40000000 | v15 | v27[2] & 0xBFFFFF00;
    uint64_t v31 = 4;
    if (v9) {
      uint64_t v31 = 6;
    }
    v32 = &v27[v31];
    do
    {
      v33 = p_private->attachments->_descriptors[v29];
      if (v33)
      {
        unsigned int pixelFormat = v33->_private.var0.var0.pixelFormat;
        if (pixelFormat) {
          *((_WORD *)v32 + v30++) = v29 | (16 * pixelFormat);
        }
      }
      ++v29;
    }
    while (v29 != 8);
    if (v19)
    {
      _DWORD *v27 = v43;
      MTLSerializePluginDataDictionary(objc_msgSend((id)-[MTLFunction device](p_private->tileFunction, "device"), "pluginData"), (unsigned char *)v27 + v43);
    }
    if (v22)
    {
      v28[1] = v20;
      MTLSerializePluginDataDictionary(p_private->pluginData, (unsigned char *)v28 + v20);
    }
    if (v9)
    {
      v28[2] |= 0x80000000;
      v28[4] = 0;
      v28[5] = 0;
      free(MEMORY[0]);
      MEMORY[0x18530C140](0, 0x1010C40113C0ABBLL);
    }
    v35 = (void *)*MEMORY[0x1E4F143F0];
    v36 = v28;
    size_t v37 = v44;
  }

  return dispatch_data_create(v36, v37, 0, v35);
}

- (void)setTileFunction:(id)a3
{
  if (a3 && MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB34AB8] & 1) == 0) {
    MTLReportFailure(1uLL, "-[MTLTileRenderPipelineDescriptorInternal setTileFunction:]", 648, @"tileFunction is not a MTLFunction.", v7, v8, v9, v10, v11);
  }
  id v5 = a3;
  p_private = &self->_private;

  p_private->tileFunction = (MTLFunction *)a3;
}

- (id)linkedFunctions
{
  p_private = &self->_private;
  id result = self->_private.linkedFunctions;
  if (!result)
  {
    id result = objc_alloc_init(MTLLinkedFunctions);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&p_private->linkedFunctions, (unint64_t *)&v4, (unint64_t)result);
    if (v4)
    {

      return p_private->linkedFunctions;
    }
    else
    {
      p_private->linkedFunctions = (MTLLinkedFunctions *)result;
    }
  }
  return result;
}

- (id)tileFunction
{
  return self->_private.tileFunction;
}

- (BOOL)supportAddingBinaryFunctions
{
  return self->_private.supportAddingBinaryFunctions;
}

- (BOOL)threadgroupSizeMatchesTileSize
{
  return self->_private.threadgroupSizeMatchesTileSize;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_private.textureWriteRoundingMode;
}

- (unint64_t)rasterSampleCount
{
  return self->_private.var0.sampleCount;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return self->_private.maxTotalThreadsPerThreadgroup;
}

- (unint64_t)colorSampleCount
{
  return self->_private.colorSampleCount;
}

- (id)gpuCompilerSPIOptions
{
  return self->_private.gpuCompilerSPIOptions;
}

- (id)colorAttachments
{
  return self->_private.attachments;
}

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (id)binaryArchives
{
  return self->_private.binaryArchives;
}

- (id)tileBuffers
{
  return self->_private.tileBuffers;
}

- (void)setThreadgroupSizeMatchesTileSize:(BOOL)a3
{
  self->_private.threadgroupSizeMatchesTileSize = a3;
}

- (id)preloadedLibraries
{
  return self->_private.preloadedLibraries;
}

- (unint64_t)maxCallStackDepth
{
  return self->_private.maxStackCallDepth;
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
    uint64_t v13 = 635;
  }
  else
  {
    uint64_t v11 = @"label must not be nil.";
    unint64_t v12 = 0;
    uint64_t v13 = 632;
  }
  MTLReportFailure(v12, "-[MTLTileRenderPipelineDescriptorInternal setLabel:]", v13, (uint64_t)v11, v3, v4, v5, v6, v14);
LABEL_3:
  p_private = &self->_private;
  label = p_private->label;
  if (label != a3)
  {

    p_private->label = (NSString *)[a3 copy];
  }
}

- (MTLTileRenderPipelineDescriptorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLTileRenderPipelineDescriptorInternal;
  v2 = [(MTLTileRenderPipelineDescriptorInternal *)&v4 init];
  if (v2)
  {
    v2->_private.attachments = objc_alloc_init(MTLTileRenderPipelineColorAttachmentDescriptorArrayInternal);
    v2->_private.var0.sampleCount = 1;
    v2->_private.threadgroupSizeMatchesTileSize = 0;
    v2->_private.colorSampleCount = 0;
    v2->_private.tileBuffers = objc_alloc_init(MTLPipelineBufferDescriptorArrayInternal);
    v2->_private.maxTotalThreadsPerThreadgroup = 0;
    v2->_private.textureWriteRoundingMode = 0;
    v2->_private.linkedFunctions = 0;
    v2->_private.supportAddingBinaryFunctions = 0;
    v2->_private.maxStackCallDepth = 1;
    v2->_private.profileControl = 0;
    v2->_private.preloadedLibraries = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2->_private.maxAccelerationStructureTraversalDepth = 0;
    v2->_private.shaderValidation = 0;
    v2->_private.shaderValidationState = 0;
  }
  return v2;
}

- (BOOL)validateWithDevice:(id)a3 error:(id *)a4
{
  p_private = &self->_private;
  if (self->_private.var0.sampleCount || ([a3 supportsTextureSampleCount:0] & 1) != 0)
  {
    objc_msgSend(a3, "registerTileRenderPipelineDescriptor:", self, a4);
    validateWithDevice(a3, (uint64_t)p_private);
    return 1;
  }
  else
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"rasterSampleCount (%lu) is not supported by device.", p_private->var0.sampleCount);
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v9 forKey:*MEMORY[0x1E4F28568]];
    id v11 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PipelineError" code:1 userInfo:v10];
    BOOL result = 0;
    *a4 = v11;
  }
  return result;
}

- (id)profileControl
{
  return self->_private.profileControl;
}

- (unint64_t)maxAccelerationStructureTraversalDepth
{
  return self->_private.maxAccelerationStructureTraversalDepth;
}

- (id)label
{
  return self->_private.label;
}

- (void)dealloc
{
  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLTileRenderPipelineDescriptorInternal;
  [(MTLTileRenderPipelineDescriptorInternal *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = 0;
    p_private = &self->_private;
    uint64_t v9 = (void *)(v5 + 32);
    do
    {
      *(void *)(*v9 + 8 + v7 * 8) = [(MTLTileRenderPipelineColorAttachmentDescriptorInternal *)p_private->attachments->_descriptors[v7] copyWithZone:a3];
      ++v7;
    }
    while (v7 != 8);
    *(void *)(v6 + 40) = p_private->var0.sampleCount;
    *(void *)(v6 + 80) = p_private->colorSampleCount;
    *(void *)(v6 + 48) = [(NSString *)p_private->label copyWithZone:a3];
    uint64_t v10 = 0;
    *(void *)(v6 + 56) = p_private->tileFunction;
    *(unsigned char *)(v6 + 64) = p_private->threadgroupSizeMatchesTileSize;
    do
    {
      *(void *)(*(void *)(v6 + 88) + 8 + v10 * 8) = [(MTLPipelineBufferDescriptorInternal *)p_private->tileBuffers->_descriptors[v10] copyWithZone:a3];
      ++v10;
    }
    while (v10 != 31);
    *(_WORD *)(v6 + 96) = p_private->maxTotalThreadsPerThreadgroup;
    pluginData = p_private->pluginData;
    *(void *)(v6 + 104) = p_private->textureWriteRoundingMode;
    *(void *)(v6 + 112) = pluginData;
    *(void *)(v6 + 120) = [(NSArray *)p_private->binaryArchives copy];
    *(void *)(v6 + 128) = [(MTLLinkedFunctions *)p_private->linkedFunctions copy];
    uint64_t v12 = [(NSArray *)p_private->preloadedLibraries copy];
    unint64_t maxStackCallDepth = p_private->maxStackCallDepth;
    *(void *)(v6 + 136) = v12;
    *(void *)(v6 + 144) = maxStackCallDepth;
    *(unsigned char *)(v6 + 152) = p_private->supportAddingBinaryFunctions;
    uint64_t v14 = [(MTLProfileControl *)p_private->profileControl copy];
    unint64_t maxAccelerationStructureTraversalDepth = p_private->maxAccelerationStructureTraversalDepth;
    gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
    *(void *)(v6 + 160) = v14;
    *(void *)(v6 + 168) = maxAccelerationStructureTraversalDepth;
    *(void *)(v6 + 176) = [(NSDictionary *)gpuCompilerSPIOptions copy];
    *(_OWORD *)(v6 + 184) = *(_OWORD *)&p_private->shaderValidation;
  }
  return (id)v6;
}

- (id)formattedDescription:(unint64_t)a3
{
  v49[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = a3 + 8;
  [@"\n" stringByPaddingToLength:a3 + 8 withString:@" " startingAtIndex:0];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:128];
  v48[0] = v5;
  v48[1] = @"label =";
  size_t v37 = self;
  p_private = &self->_private;
  unint64_t sampleCount = self->_private.var0.sampleCount;
  label = (__CFString *)self->_private.label;
  if (!label) {
    label = @"<none>";
  }
  v48[2] = label;
  v48[3] = v5;
  v48[4] = @"Raster Sample Count =";
  v48[5] = [NSNumber numberWithUnsignedInteger:sampleCount];
  v48[6] = v5;
  v48[7] = @"Tile Function =";
  tileFunction = self->_private.tileFunction;
  if (tileFunction) {
    uint64_t v12 = [(MTLFunction *)tileFunction formattedDescription:a3 + 8];
  }
  else {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v48[8] = v12;
  v48[9] = v5;
  uint64_t v13 = @"false";
  if (self->_private.threadgroupSizeMatchesTileSize) {
    uint64_t v13 = @"true";
  }
  v48[10] = @"threadgroupSizeMatchesTileSize =";
  v48[11] = v13;
  v48[12] = v5;
  v48[13] = @"colorSampleCount =";
  v48[14] = [NSNumber numberWithUnsignedInteger:self->_private.colorSampleCount];
  v48[15] = v5;
  v48[16] = @"maxTotalThreadsPerThreadgroup =";
  v48[17] = [NSNumber numberWithUnsignedShort:self->_private.maxTotalThreadsPerThreadgroup];
  v48[18] = v5;
  v48[19] = @"textureWriteRoundingMode =";
  v48[20] = MTLRoundingModeString(self->_private.textureWriteRoundingMode);
  unint64_t v14 = 0x1E4F1C000uLL;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 21));
  uint64_t v15 = 0;
  unint64_t v38 = a3 + 12;
  unint64_t v16 = 0x1E4F29000uLL;
  uint64_t v17 = @"Color Attachment %u:";
  do
  {
    if (p_private->attachments->_descriptors[v15])
    {
      v47[0] = v5;
      v47[1] = objc_msgSend(*(id *)(v16 + 24), "stringWithFormat:", v17, v15);
      v47[2] = tileColorAttachmentFormattedDescription(v6, &p_private->attachments->_descriptors[v15]->super);
      uint64_t v18 = v47;
    }
    else
    {
      v46[0] = v5;
      v46[1] = objc_msgSend(*(id *)(v16 + 24), "stringWithFormat:", v17, v15);
      uint64_t v19 = v5;
      uint64_t v20 = v6;
      uint64_t v21 = v17;
      unint64_t v22 = v16;
      v49[0] = [@"\n" stringByPaddingToLength:v38 withString:@" " startingAtIndex:0];
      v49[1] = @"pixelFormat =";
      uint64_t v23 = v7;
      uint64_t v24 = p_private;
      unint64_t v25 = v14;
      uint64_t v26 = *(void **)(v22 + 24);
      uint64_t Name = MTLPixelFormatGetName(0);
      v28 = v26;
      unint64_t v14 = v25;
      p_private = v24;
      uint64_t v7 = v23;
      v49[2] = [v28 stringWithUTF8String:Name];
      unint64_t v16 = v22;
      uint64_t v17 = v21;
      uint64_t v6 = v20;
      uint64_t v5 = v19;
      v46[2] = objc_msgSend((id)objc_msgSend(*(id *)(v14 + 2424), "arrayWithObjects:count:", v49, 3), "componentsJoinedByString:", @" ");
      uint64_t v18 = v46;
    }
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 2424), "arrayWithObjects:count:", v18, 3));
    ++v15;
  }
  while (v15 != 8);
  for (uint64_t i = 0; i != 31; ++i)
  {
    [v7 addObject:v5];
    [v7 addObject:objc_msgSend(*(id *)(v16 + 24), "stringWithFormat:", @"Buffer %u:", i)];
    int v30 = p_private->tileBuffers->_descriptors[i];
    if (v30) {
      uint64_t v31 = pipelineBufferFormattedDescription(v6, v30);
    }
    else {
      uint64_t v31 = pipelineBufferDefaultFormattedDescription(v6);
    }
    [v7 addObject:v31];
  }
  v45[0] = v5;
  v45[1] = @"linkedFunction =:";
  linkedFunctions = p_private->linkedFunctions;
  if (linkedFunctions) {
    uint64_t v33 = [(MTLLinkedFunctions *)linkedFunctions formattedDescription:v6];
  }
  else {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v45[2] = v33;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 2424), "arrayWithObjects:count:", v45, 3));
  v44[0] = v5;
  v44[1] = @"supportAddingBinaryFunctions =";
  if (p_private->supportAddingBinaryFunctions) {
    v34 = @"YES";
  }
  else {
    v34 = @"NO";
  }
  v44[2] = v34;
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 2424), "arrayWithObjects:count:", v44, 3));
  v43[0] = v5;
  v43[1] = @"maxCallStackDepth =";
  v43[2] = [NSNumber numberWithUnsignedInteger:p_private->maxStackCallDepth];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 2424), "arrayWithObjects:count:", v43, 3));
  v42[0] = v5;
  v42[1] = @"maxAccelerationStructureTraversalDepth =";
  v42[2] = [NSNumber numberWithUnsignedInteger:p_private->maxAccelerationStructureTraversalDepth];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 2424), "arrayWithObjects:count:", v42, 3));
  v41[0] = v5;
  v41[1] = @"shaderValidation =";
  v41[2] = [NSNumber numberWithInteger:p_private->shaderValidation];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 2424), "arrayWithObjects:count:", v41, 3));
  v40[0] = v5;
  v40[1] = @"shaderValidationState =";
  v40[2] = [NSNumber numberWithInteger:p_private->shaderValidationState];
  objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(v14 + 2424), "arrayWithObjects:count:", v40, 3));
  v35 = *(void **)(v16 + 24);
  v39.receiver = v37;
  v39.super_class = (Class)MTLTileRenderPipelineDescriptorInternal;
  return (id)[v35 stringWithFormat:@"%@%@", -[MTLTileRenderPipelineDescriptorInternal description](&v39, sel_description), objc_msgSend(v7, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLTileRenderPipelineDescriptorInternal *)self formattedDescription:0];
}

- (void)setRasterSampleCount:(unint64_t)a3
{
  self->_private.var0.unint64_t sampleCount = a3;
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

- (void)setColorSampleCount:(unint64_t)a3
{
  self->_private.colorSampleCount = a3;
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
  self->_private.unint64_t maxAccelerationStructureTraversalDepth = a3;
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

- (void)reset
{
  uint64_t v2 = 0;
  p_private = &self->_private;
  do
  {

    p_private->attachments->_descriptors[v2++] = 0;
  }
  while (v2 != 8);
  p_private->threadgroupSizeMatchesTileSize = 0;
  p_private->var0.unint64_t sampleCount = 1;
  p_private->colorSampleCount = 0;

  p_private->label = 0;
  uint64_t v4 = 0;
  p_private->tileFunction = 0;
  do

  while (v4 != 31);
  p_private->maxTotalThreadsPerThreadgroup = 0;
  p_private->textureWriteRoundingMode = 0;

  p_private->pluginData = 0;
  p_private->binaryArchives = 0;

  p_private->linkedFunctions = 0;
  p_private->supportAddingBinaryFunctions = 0;
  p_private->preloadedLibraries = 0;
  p_private->unint64_t maxStackCallDepth = 1;

  p_private->profileControl = 0;
  p_private->unint64_t maxAccelerationStructureTraversalDepth = 0;
  p_private->shaderValidation = 0;
  p_private->shaderValidationState = 0;
}

- (void)setMaxTotalThreadsPerThreadgroup:(unint64_t)a3
{
  unsigned __int16 v7 = a3;
  if (a3 >= 0x10000) {
    MTLReportFailure(0, "-[MTLTileRenderPipelineDescriptorInternal setMaxTotalThreadsPerThreadgroup:]", 679, @"max total threads must be less than or equal to %d.", v3, v4, v5, v6, 0xFFFFLL);
  }
  self->_private.maxTotalThreadsPerThreadgroup = v7;
}

- (void)setTextureWriteRoundingMode:(int64_t)a3
{
  self->_private.textureWriteRoundingMode = a3;
}

- (uint64_t)setTextureWriteFPRoundingMode:(uint64_t)result
{
  if (result) {
    *(void *)(result + 104) = a2;
  }
  return result;
}

- (uint64_t)textureWriteFPRoundingMode
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
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

- (void)setLinkedFunctions:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLTileRenderPipelineDescriptorInternal setLinkedFunctions:]", 748, @"linkedFunctions is not a MTLLinkedFunctions.", v5, v6, v7, v8, v10);
    }
  }
  p_private = &self->_private;
  if (p_private->linkedFunctions != a3)
  {
    linkedFunctions = p_private->linkedFunctions;
    p_private->linkedFunctions = (MTLLinkedFunctions *)[a3 copy];
  }
}

- (void)setPreloadedLibraries:(id)a3
{
  p_private = &self->_private;
  preloadedLibraries = self->_private.preloadedLibraries;
  if (preloadedLibraries != a3)
  {

    p_private->preloadedLibraries = (NSArray *)[a3 copy];
  }
}

- (id)insertLibraries
{
  return self->_private.preloadedLibraries;
}

- (void)setInsertLibraries:(id)a3
{
  if (!a3) {
    a3 = (id)MEMORY[0x1E4F1CBF0];
  }
  [(MTLTileRenderPipelineDescriptorInternal *)self setPreloadedLibraries:a3];
}

- (void)setSupportAddingBinaryFunctions:(BOOL)a3
{
  self->_private.supportAddingBinaryFunctions = a3;
}

- (void)setMaxCallStackDepth:(unint64_t)a3
{
  self->_private.unint64_t maxStackCallDepth = a3;
}

- (unint64_t)hash
{
  p_private = &self->_private;
  bzero(v20, 0x1B0uLL);
  uint64_t v3 = 0;
  uint64_t descriptors = (uint64_t)p_private->attachments->_descriptors;
  uint64_t v5 = _MTLDefaultRenderPipelineAttachmentPrivate;
  do
  {
    uint64_t v6 = *(void *)(descriptors + v3 * 4);
    uint64_t v7 = v5;
    if (v6) {
      uint64_t v7 = *(unsigned int *)(v6 + 8);
    }
    *(void *)&v20[v3] = v7;
    v3 += 2;
  }
  while (v3 != 16);
  char colorSampleCount = p_private->colorSampleCount;
  int v22 = LOBYTE(p_private->var0.sampleCount) | (p_private->threadgroupSizeMatchesTileSize << 8);
  uint64_t v23 = [(NSString *)p_private->label hash];
  uint64_t v8 = [(MTLFunction *)p_private->tileFunction hash];
  uint64_t v9 = 0;
  uint64_t v24 = v8;
  uint64_t v10 = (uint64_t)p_private->tileBuffers->_descriptors;
  do
  {
    uint64_t v11 = *(void *)(v10 + v9);
    if (v11) {
      uint64_t v12 = (uint64_t *)(v11 + 8);
    }
    else {
      uint64_t v12 = &_MTLDefaultPipelineBufferPrivate;
    }
    *(void *)&v25[v9] = *v12;
    v9 += 8;
  }
  while (v9 != 248);
  unsigned __int16 maxTotalThreadsPerThreadgroup = p_private->maxTotalThreadsPerThreadgroup;
  pluginData = p_private->pluginData;
  int textureWriteRoundingMode = p_private->textureWriteRoundingMode;
  uint64_t v28 = [(NSDictionary *)pluginData hash];
  uint64_t v29 = MTLHashArray(p_private->binaryArchives, 1, 0);
  uint64_t v30 = [(MTLLinkedFunctions *)p_private->linkedFunctions hash];
  uint64_t v14 = MTLHashArray(p_private->preloadedLibraries, 1, 1);
  uint64_t v15 = -(uint64_t)p_private->supportAddingBinaryFunctions;
  uint64_t v31 = v14;
  uint64_t v32 = v15;
  unint64_t maxStackCallDepth = p_private->maxStackCallDepth;
  uint64_t v16 = [(MTLProfileControl *)p_private->profileControl hash];
  unint64_t maxAccelerationStructureTraversalDepth = p_private->maxAccelerationStructureTraversalDepth;
  gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
  uint64_t v34 = v16;
  unint64_t v35 = maxAccelerationStructureTraversalDepth;
  uint64_t v36 = [(NSDictionary *)gpuCompilerSPIOptions hash];
  long long v37 = *(_OWORD *)&p_private->shaderValidation;
  return _MTLHashState(v20, 0x1B0uLL);
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
      uint64_t v9 = (char *)a3 + 32;
      while (1)
      {
        uint64_t v10 = p_private->attachments->_descriptors[v7];
        uint64_t v11 = *(MTLTileRenderPipelineColorAttachmentDescriptorInternal **)(*(void *)v9 + 8 + v7 * 8);
        if (v10 != v11)
        {
          BOOL v12 = !v10 || v11 == 0;
          if (v12 || v10->_private.var0.var0.pixelFormat != v11->_private.var0.var0.pixelFormat) {
            break;
          }
        }
        if (++v7 == 8)
        {
          if (p_private->threadgroupSizeMatchesTileSize != v9[32]
            || p_private->var0.sampleCount != *((void *)v9 + 1)
            || p_private->colorSampleCount != *((void *)v9 + 6))
          {
            break;
          }
          label = p_private->label;
          if (label == *((NSString **)v9 + 2) || (int v6 = -[NSString isEqual:](label, "isEqual:")) != 0)
          {
            tileFunction = p_private->tileFunction;
            if (tileFunction == *((MTLFunction **)v9 + 3)
              || (int v6 = -[MTLFunction isEqual:](tileFunction, "isEqual:")) != 0)
            {
              uint64_t v15 = 0;
              while (1)
              {
                uint64_t v16 = p_private->tileBuffers->_descriptors[v15];
                uint64_t v17 = *(MTLPipelineBufferDescriptorInternal **)(*((void *)v9 + 7) + 8 + v15 * 8);
                if (v16 != v17)
                {
                  BOOL v18 = !v16 || v17 == 0;
                  if (v18 || v16->_private.var0.var1.var0 != v17->_private.var0.var1.var0) {
                    goto LABEL_3;
                  }
                }
                if (++v15 == 31)
                {
                  if (p_private->maxTotalThreadsPerThreadgroup != *((unsigned __int16 *)v9 + 32)
                    || p_private->textureWriteRoundingMode != *((void *)v9 + 9))
                  {
                    goto LABEL_3;
                  }
                  pluginData = p_private->pluginData;
                  if (pluginData == *((NSDictionary **)v9 + 10)
                    || (int v6 = -[NSDictionary isEqual:](pluginData, "isEqual:")) != 0)
                  {
                    int v20 = MTLCompareArray(p_private->binaryArchives, *((void **)v9 + 11), 1, 0);
                    LOBYTE(v6) = 0;
                    if (v20)
                    {
                      int v6 = MTLCompareFunctionList(p_private->linkedFunctions, *((void **)v9 + 12));
                      if (v6)
                      {
                        int v6 = MTLCompareArray(p_private->preloadedLibraries, *((void **)v9 + 13), 1, 1);
                        if (v6)
                        {
                          if (p_private->supportAddingBinaryFunctions != v9[120]
                            || p_private->maxStackCallDepth != *((void *)v9 + 14))
                          {
                            goto LABEL_3;
                          }
                          profileControl = p_private->profileControl;
                          if (profileControl == *((MTLProfileControl **)v9 + 16)
                            || (int v6 = -[MTLProfileControl isEqual:](profileControl, "isEqual:")) != 0)
                          {
                            if (p_private->maxAccelerationStructureTraversalDepth != *((void *)v9 + 17)) {
                              goto LABEL_3;
                            }
                            gpuCompilerSPIOptions = p_private->gpuCompilerSPIOptions;
                            if (gpuCompilerSPIOptions == *((NSDictionary **)v9 + 18)
                              || (int v6 = -[NSDictionary isEqual:](gpuCompilerSPIOptions, "isEqual:")) != 0)
                            {
                              if (p_private->shaderValidation != *((void *)v9 + 19)) {
                                goto LABEL_3;
                              }
                              LOBYTE(v6) = p_private->shaderValidationState == *((void *)v9 + 20);
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
          return v6;
        }
      }
    }
LABEL_3:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)validateWithDevice:(id)a3
{
  [a3 registerTileRenderPipelineDescriptor:self];

  validateWithDevice(a3, (uint64_t)&self->_private);
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

@end