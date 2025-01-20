@interface MTLRenderPassDescriptorInternal
+ (id)renderPassDescriptor;
- (BOOL)ditherEnabled;
- (BOOL)fineGrainedBackgroundVisibilityEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)openGLModeEnabled;
- (BOOL)pointCoordYFlipEnabled;
- (BOOL)skipEmptyTilesOnClearEnabled;
- (BOOL)validate:(id)a3 width:(unint64_t *)a4 height:(unint64_t *)a5;
- (MTLRenderPassDescriptorInternal)init;
- (const)_descriptorPrivate;
- (id)binaryArchives;
- (id)colorAttachments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)depthAttachment;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)rasterizationRateMap;
- (id)sampleBufferAttachments;
- (id)stencilAttachment;
- (id)visibilityResultBuffer;
- (unint64_t)defaultColorSampleCount;
- (unint64_t)defaultRasterSampleCount;
- (unint64_t)getSamplePositions:(id *)a3 count:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)imageblockSampleLength;
- (unint64_t)renderTargetArrayLength;
- (unint64_t)renderTargetHeight;
- (unint64_t)renderTargetWidth;
- (unint64_t)threadgroupMemoryLength;
- (unint64_t)tileHeight;
- (unint64_t)tileWidth;
- (void)dealloc;
- (void)setBinaryArchives:(id)a3;
- (void)setDefaultColorSampleCount:(unint64_t)a3;
- (void)setDefaultRasterSampleCount:(unint64_t)a3;
- (void)setDepthAttachment:(id)a3;
- (void)setDitherEnabled:(BOOL)a3;
- (void)setFineGrainedBackgroundVisibilityEnabled:(BOOL)a3;
- (void)setImageblockSampleLength:(unint64_t)a3;
- (void)setOpenGLModeEnabled:(BOOL)a3;
- (void)setPointCoordYFlipEnabled:(BOOL)a3;
- (void)setRasterizationRateMap:(id)a3;
- (void)setRenderTargetArrayLength:(unint64_t)a3;
- (void)setRenderTargetHeight:(unint64_t)a3;
- (void)setRenderTargetWidth:(unint64_t)a3;
- (void)setSamplePositions:(id *)a3 count:(unint64_t)a4;
- (void)setSkipEmptyTilesOnClearEnabled:(BOOL)a3;
- (void)setStencilAttachment:(id)a3;
- (void)setThreadgroupMemoryLength:(unint64_t)a3;
- (void)setTileHeight:(unint64_t)a3;
- (void)setTileWidth:(unint64_t)a3;
- (void)setVisibilityResultBuffer:(id)a3;
@end

@implementation MTLRenderPassDescriptorInternal

- (const)_descriptorPrivate
{
  return &self->_private;
}

- (id)rasterizationRateMap
{
  return self->_private.rasterizationRateMap;
}

- (void)setRenderTargetWidth:(unint64_t)a3
{
  self->_private.renderTargetWidth = a3;
}

- (void)setRenderTargetHeight:(unint64_t)a3
{
  self->_private.renderTargetHeight = a3;
}

- (unint64_t)threadgroupMemoryLength
{
  return self->_private.threadgroupMemoryLength;
}

- (id)sampleBufferAttachments
{
  return self->_private.sampleBufferAttachments;
}

- (unint64_t)renderTargetArrayLength
{
  return self->_private.renderTargetArrayLength;
}

- (BOOL)pointCoordYFlipEnabled
{
  return self->_private.pointCoordYFlipEnabled;
}

- (void)setFineGrainedBackgroundVisibilityEnabled:(BOOL)a3
{
  self->_private.fineGrainedBackgroundVisibilityEnabled = a3;
}

- (BOOL)validate:(id)a3 width:(unint64_t *)a4 height:(unint64_t *)a5
{
  uint64_t v98 = 0;
  memset(v97, 0, sizeof(v97));
  _MTLMessageContextBegin_((uint64_t)v97, (uint64_t)"-[MTLRenderPassDescriptorInternal validate:width:height:]", 2065, (uint64_t)a3, 11, (uint64_t)"Render Pass Descriptor Validation");
  unint64_t renderTargetWidth = self->_private.renderTargetWidth;
  unint64_t renderTargetHeight = self->_private.renderTargetHeight;
  p_private = &self->_private;
  rasterizationRateMap = self->_private.rasterizationRateMap;
  v92 = a5;
  id v93 = a3;
  v91 = a4;
  if (rasterizationRateMap)
  {
    if (renderTargetWidth) {
      BOOL v17 = renderTargetHeight == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {
      [(MTLRasterizationRateMap *)rasterizationRateMap screenSize];
      unint64_t renderTargetWidth = 0;
      unint64_t renderTargetHeight = 0;
    }
    uint64_t v18 = [(MTLRasterizationRateMap *)rasterizationRateMap layerCount];
    float v19 = (float)renderTargetWidth;
    if ([(MTLRasterizationRateMap *)rasterizationRateMap mutability] == 1)
    {
      float v22 = (float)renderTargetWidth;
      float v23 = (float)renderTargetHeight;
    }
    else if (v18)
    {
      uint64_t v24 = 0;
      float v23 = 0.0;
      float v22 = 0.0;
      do
      {
        *(float *)&double v20 = v19;
        *(float *)&double v21 = (float)renderTargetHeight;
        -[MTLRasterizationRateMap mapScreenToPhysicalCoordinates:forLayer:](rasterizationRateMap, "mapScreenToPhysicalCoordinates:forLayer:", v24, v20, v21);
        if (v22 <= *(float *)&v20) {
          float v22 = *(float *)&v20;
        }
        if (v23 <= *(float *)&v21) {
          float v23 = *(float *)&v21;
        }
        ++v24;
      }
      while (v18 != v24);
    }
    else
    {
      float v22 = 0.0;
      float v23 = 0.0;
    }
    unint64_t renderTargetWidth = vcvtas_u32_f32(v22);
    unint64_t renderTargetHeight = vcvtas_u32_f32(v23);
  }
  uint64_t v25 = 0;
  uint64_t defaultSampleCount = 0;
  uint64_t v27 = 0;
  unint64_t v94 = renderTargetHeight;
  unint64_t v95 = renderTargetWidth;
  if (renderTargetWidth) {
    unint64_t v28 = renderTargetWidth;
  }
  else {
    unint64_t v28 = -1;
  }
  if (renderTargetHeight) {
    unint64_t v29 = renderTargetHeight;
  }
  else {
    unint64_t v29 = -1;
  }
  v30 = &OBJC_IVAR___MTLBinaryEntry__airScript;
  v31 = &OBJC_IVAR___MTLBinaryEntry__airScript;
  v32 = p_private;
  do
  {
    uint64_t v33 = *(uint64_t *)((char *)&v32->attachments->super.super.isa + v30[756] + v25);
    if (v33)
    {
      uint64_t v34 = v31[753];
      if (*(void *)(v33 + v34 + 32) >= 3uLL)
      {
        _MTLMessageContextPush_((uint64_t)v97, 4, @"loadAction is not a valid MTLLoadAction.", v9, v10, v11, v12, v13, v90);
        uint64_t v34 = v31[753];
      }
      if (*(void *)(v33 + v34 + 40) >= 5uLL)
      {
        _MTLMessageContextPush_((uint64_t)v97, 4, @"storeAction is not a valid MTLStoreAction.", v9, v10, v11, v12, v13, v90);
        uint64_t v34 = v31[753];
      }
      if ((*(void *)(v33 + v34 + 48) & 0xFFFFFFFFFFFFFFFELL) != 0)
      {
        _MTLMessageContextPush_((uint64_t)v97, 4, @"storeActionOptions contains unrecognized bits (%#x)", v9, v10, v11, v12, v13, *(void *)(v33 + v34 + 48) & 0xFFFFFFFFFFFFFFFELL);
        uint64_t v34 = v31[753];
      }
      uint64_t v35 = v33 + v34;
      v36 = *(void **)(v33 + v34);
      if (v36)
      {
        v37 = v30;
        uint64_t v38 = *(void *)(v35 + 8);
        unint64_t v39 = v29;
        unint64_t v40 = v28;
        uint64_t v41 = v27;
        uint64_t v42 = defaultSampleCount;
        unint64_t v43 = [v36 width];
        unint64_t v44 = [v36 height];
        unint64_t v45 = v43 >> v38;
        uint64_t defaultSampleCount = v42;
        uint64_t v46 = v41;
        unint64_t v28 = v40;
        unint64_t v47 = v44 >> v38;
        if (v45 <= 1) {
          unint64_t v45 = 1;
        }
        if (v47 <= 1) {
          unint64_t v47 = 1;
        }
        *(void *)(v35 + 152) = v45;
        *(void *)(v35 + 160) = v47;
        if (v45 < v40) {
          unint64_t v28 = v45;
        }
        if (v47 >= v39) {
          unint64_t v29 = v39;
        }
        else {
          unint64_t v29 = v47;
        }
        uint64_t v27 = v46 + 1;
        if (!defaultSampleCount) {
          uint64_t defaultSampleCount = [*(id *)v35 sampleCount];
        }
        v32 = p_private;
        v30 = v37;
        v31 = &OBJC_IVAR___MTLBinaryEntry__airScript;
      }
    }
    v25 += 8;
  }
  while (v25 != 64);
  depth_descriptor = v32->attachments->_depth_descriptor;
  if (depth_descriptor)
  {
    texture = depth_descriptor->_private.texture;
    if (texture)
    {
      unint64_t level = depth_descriptor->_private.level;
      unint64_t v51 = [(MTLTextureImplementation *)depth_descriptor->_private.texture width];
      unint64_t v52 = [(MTLTextureImplementation *)texture height];
      unint64_t v53 = v51 >> level;
      unint64_t v54 = v52 >> level;
      if (v51 >> level <= 1) {
        unint64_t v53 = 1;
      }
      if (v54 <= 1) {
        unint64_t v54 = 1;
      }
      depth_descriptor->_private.width = v53;
      depth_descriptor->_private.height = v54;
      if (v53 < v28) {
        unint64_t v28 = v53;
      }
      if (v54 < v29) {
        unint64_t v29 = v54;
      }
      ++v27;
    }
    if (depth_descriptor->_private.loadAction >= 3) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"loadAction is not a valid MTLLoadAction.", v9, v10, v11, v12, v13, v90);
    }
    v32 = p_private;
    if (depth_descriptor->_private.storeAction >= 6) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"storeAction is not a valid MTLStoreAction.", v9, v10, v11, v12, v13, v90);
    }
    if ((depth_descriptor->_private.storeActionOptions & 0xFFFFFFFFFFFFFFFELL) != 0) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"storeActionOptions contains unrecognized bits (%#x)", v9, v10, v11, v12, v13, depth_descriptor->_private.storeActionOptions & 0xFFFFFFFFFFFFFFFELL);
    }
    if (depth_descriptor->_private.resolveFilter >= 3) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"resolveFilter is not a valid MTLMultisampleDepthResolveFilter.", v9, v10, v11, v12, v13, v90);
    }
  }
  stencil_descriptor = v32->attachments->_stencil_descriptor;
  if (stencil_descriptor)
  {
    v56 = stencil_descriptor->_private.texture;
    if (v56)
    {
      unint64_t v57 = stencil_descriptor->_private.level;
      unint64_t v58 = [(MTLTextureImplementation *)stencil_descriptor->_private.texture width];
      unint64_t v59 = [(MTLTextureImplementation *)v56 height];
      unint64_t v60 = v58 >> v57;
      unint64_t v61 = v59 >> v57;
      if (v58 >> v57 <= 1) {
        unint64_t v60 = 1;
      }
      if (v61 <= 1) {
        unint64_t v61 = 1;
      }
      stencil_descriptor->_private.width = v60;
      stencil_descriptor->_private.height = v61;
      if (v60 < v28) {
        unint64_t v28 = v60;
      }
      if (v61 < v29) {
        unint64_t v29 = v61;
      }
      ++v27;
    }
    if (stencil_descriptor->_private.stencilResolveFilter >= 2) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"resolveFilter is not a valid MTLMultisampleStencilResolveFilter.", v9, v10, v11, v12, v13, v90);
    }
    if (stencil_descriptor->_private.storeAction >= 5) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"storeAction is not a valid MTLStoreAction.", v9, v10, v11, v12, v13, v90);
    }
    uint64_t storeActionOptions = stencil_descriptor->_private.storeActionOptions;
    if ((storeActionOptions & 0xFFFFFFFFFFFFFFFELL) != 0) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"storeActionOptions contains unrecognized bits: %#x", v9, v10, v11, v12, v13, storeActionOptions & 0xFFFFFFFFFFFFFFFELL);
    }
    v64 = v92;
    v63 = v93;
    v65 = v91;
    if (storeActionOptions) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"Stencil attachment storeActionOptions (%#x) contains options incompatible with this attachment type: %@", v9, v10, v11, v12, v13, storeActionOptions);
    }
  }
  else
  {
    v64 = v92;
    v63 = v93;
    v65 = v91;
  }
  if (v27) {
    unint64_t v66 = v28;
  }
  else {
    unint64_t v66 = v95;
  }
  if (v27) {
    unint64_t v67 = v29;
  }
  else {
    unint64_t v67 = v94;
  }
  unint64_t tileWidth = p_private->tileWidth;
  if (tileWidth)
  {
    uint64_t v69 = p_private->tileHeight * tileWidth;
    if (defaultSampleCount) {
      goto LABEL_96;
    }
    goto LABEL_95;
  }
  uint64_t v69 = [v63 minTilePixels];
  if (!defaultSampleCount) {
LABEL_95:
  }
    uint64_t defaultSampleCount = p_private->var0.defaultSampleCount;
LABEL_96:
  unint64_t v70 = p_private->threadgroupMemoryLength + defaultSampleCount * v69 * p_private->imageBlockSampleLength;
  unint64_t v71 = [v63 maxThreadgroupMemoryLength];
  if (v70 <= v71) {
    unint64_t v72 = v66;
  }
  else {
    unint64_t v72 = 0;
  }
  if (v70 <= v71) {
    unint64_t v73 = v67;
  }
  else {
    unint64_t v73 = 0;
  }
  unint64_t *v65 = v72;
  unint64_t *v64 = v73;
  if (p_private->numCustomSamplePositions)
  {
    if (([v63 areProgrammableSamplePositionsSupported] & 1) == 0) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"Custom sample positions were specified, but Programmable Sample Positions is not supported on this device.", v74, v75, v76, v77, v78, v90);
    }
    if (p_private->numCustomSamplePositions && (objc_msgSend(v63, "supportsTextureSampleCount:") & 1) == 0) {
      _MTLMessageContextPush_((uint64_t)v97, 4, @"Custom sample positions were specified, but the device does not support the number of samples supplied.", v79, v80, v81, v82, v83, v90);
    }
  }
  if (p_private->renderTargetArrayLength && ([v63 supportsLayeredRendering] & 1) == 0) {
    _MTLMessageContextPush_((uint64_t)v97, 4, @"renderTargetArrayLength > 0 specified, but Layered Rendering is not supported on this device.", v84, v85, v86, v87, v88, v90);
  }
  _MTLMessageContextEnd((uint64_t)v97);
  return 1;
}

- (id)colorAttachments
{
  return self->_private.attachments;
}

- (void)setVisibilityResultBuffer:(id)a3
{
  if (a3 && MTLFailureTypeGetEnabled(1uLL) && ([a3 conformsToProtocol:&unk_1ECB41AB8] & 1) == 0) {
    MTLReportFailure(1uLL, "-[MTLRenderPassDescriptorInternal setVisibilityResultBuffer:]", 1821, @"buffer is not a MTLBuffer.", v7, v8, v9, v10, v11);
  }
  p_private = &self->_private;
  if (p_private->visibilityResultBuffer != a3)
  {
    v6 = (MTLBuffer *)a3;

    p_private->visibilityResultBuffer = v6;
  }
}

- (id)depthAttachment
{
  if (!self->_private.attachments->_depth_descriptor)
  {
    v3 = objc_alloc_init(MTLRenderPassDepthAttachmentDescriptorInternal);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_private.attachments->_depth_descriptor, (unint64_t *)&v4, (unint64_t)v3);
    if (v4) {

    }
    else {
      self->_private.attachments->_depth_descriptor = v3;
    }
  }
  return self->_private.attachments->_depth_descriptor;
}

- (id)stencilAttachment
{
  if (!self->_private.attachments->_stencil_descriptor)
  {
    v3 = objc_alloc_init(MTLRenderPassStencilAttachmentDescriptorInternal);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_private.attachments->_stencil_descriptor, (unint64_t *)&v4, (unint64_t)v3);
    if (v4) {

    }
    else {
      self->_private.attachments->_stencil_descriptor = v3;
    }
  }
  return self->_private.attachments->_stencil_descriptor;
}

- (void)setRenderTargetArrayLength:(unint64_t)a3
{
  self->_private.renderTargetArrayLength = a3;
}

- (MTLRenderPassDescriptorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPassDescriptorInternal;
  v2 = [(MTLRenderPassDescriptorInternal *)&v4 init];
  if (v2)
  {
    *((void *)v2 + 5) = objc_alloc_init(MTLRenderPassColorAttachmentDescriptorArrayInternal);
    *((void *)v2 + 8) = 0;
    *((void *)v2 + 9) = 0;
    *((void *)v2 + 7) = 0;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 152) = 0u;
    *((void *)v2 + 21) = 0;
    *((void *)v2 + 23) = objc_alloc_init(MTLRenderPassSampleBufferAttachmentDescriptorArrayInternal);
    *((void *)v2 + 25) = 0;
  }
  return (MTLRenderPassDescriptorInternal *)v2;
}

- (void)dealloc
{
  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLRenderPassDescriptorInternal;
  [(MTLRenderPassDescriptorInternal *)&v4 dealloc];
}

- (void)setRasterizationRateMap:(id)a3
{
  p_private = &self->_private;
  rasterizationRateMap = self->_private.rasterizationRateMap;
  if (rasterizationRateMap != a3)
  {
    v5 = rasterizationRateMap;
    p_private->rasterizationRateMap = (MTLRasterizationRateMap *)a3;
  }
}

+ (id)renderPassDescriptor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (void)setDepthAttachment:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPassDescriptorInternal setDepthAttachment:]", 1362, @"depthAttachment is not a MTLRenderPassDepthAttachmentDescriptor.", v5, v6, v7, v8, v10);
    }
  }
  attachments = self->_private.attachments;
  if (attachments->_depth_descriptor != a3)
  {
    depth_descriptor = attachments->_depth_descriptor;
    self->_private.attachments->_depth_descriptor = (MTLRenderPassDepthAttachmentDescriptorInternal *)[a3 copy];
  }
}

- (void)setStencilAttachment:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      MTLReportFailure(1uLL, "-[MTLRenderPassDescriptorInternal setStencilAttachment:]", 1389, @"stencilAttachment is not a MTLRenderPassStencilAttachmentDescriptor.", v5, v6, v7, v8, v10);
    }
  }
  attachments = self->_private.attachments;
  if (attachments->_stencil_descriptor != a3)
  {
    stencil_descriptor = attachments->_stencil_descriptor;
    self->_private.attachments->_stencil_descriptor = (MTLRenderPassStencilAttachmentDescriptorInternal *)[a3 copy];
  }
}

- (unint64_t)hash
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  p_private = &self->_private;
  do
  {
    uint64_t v5 = p_private->attachments->_color_descriptors[v2];
    if (v5) {
      v3 ^= (unint64_t)_MTLHashState((int *)&v5->_private, 0xB0uLL) << v2;
    }
    ++v2;
  }
  while (v2 != 8);
  attachments = p_private->attachments;
  depth_descriptor = p_private->attachments->_depth_descriptor;
  if (depth_descriptor)
  {
    v3 ^= (unint64_t)_MTLHashState((int *)&depth_descriptor->_private, 0xB0uLL) << 8;
    attachments = p_private->attachments;
  }
  stencil_descriptor = attachments->_stencil_descriptor;
  if (stencil_descriptor) {
    v3 ^= (unint64_t)_MTLHashState((int *)&stencil_descriptor->_private, 0xB0uLL) << 8;
  }
  uint64_t v9 = [(MTLBuffer *)p_private->visibilityResultBuffer hash];
  v10.i64[0] = p_private->defaultColorSampleCount;
  v10.i64[1] = p_private->renderTargetArrayLength;
  int8x16_t v11 = veorq_s8(veorq_s8(*(int8x16_t *)&p_private->renderTargetWidth, *(int8x16_t *)&p_private->tileWidth), veorq_s8(v10, *(int8x16_t *)&p_private->imageBlockSampleLength));
  unint64_t v12 = *(void *)&veor_s8(*(int8x8_t *)v11.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL)) ^ p_private->var0.defaultSampleCount ^ p_private->fineGrainedBackgroundVisibilityEnabled ^ p_private->skipEmptyTilesOnClearEnabled ^ v9 ^ p_private->pointCoordYFlipEnabled ^ p_private->ditherEnabled ^ p_private->openGLModeEnabled ^ v3;
  rasterizationRateMap = p_private->rasterizationRateMap;
  if (rasterizationRateMap) {
    v12 ^= [(MTLRasterizationRateMap *)rasterizationRateMap hash];
  }
  unint64_t numCustomSamplePositions = p_private->numCustomSamplePositions;
  if (numCustomSamplePositions) {
    v12 ^= _MTLHashState((int *)p_private->customSamplePositions, 8 * numCustomSamplePositions);
  }
  for (uint64_t i = 0; i != 4; ++i)
  {
    v16 = p_private->sampleBufferAttachments->_sampleDescriptors[i];
    if (v16) {
      v12 ^= (unint64_t)_MTLHashState((int *)&v16->_private, 0x28uLL) << i;
    }
  }
  return MTLHashArray(p_private->binaryArchives, 1, 0) ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  p_private = &self->_private;
  v50 = (char *)a3;
  uint64_t v9 = (MTLRenderPassDescriptorPrivate *)((char *)a3 + 40);
  do
  {
    int8x16_t v10 = p_private->attachments->_color_descriptors[v7];
    int8x16_t v11 = v9->attachments->_color_descriptors[v7];
    if (v10 == v11) {
      goto LABEL_24;
    }
    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      v14 = objc_alloc_init(MTLRenderPassColorAttachmentDescriptorInternal);
      v15 = v9;
      int8x16_t v11 = v14;
    }
    else
    {
      if (v10) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v11 == 0;
      }
      if (v13) {
        goto LABEL_19;
      }
      v14 = objc_alloc_init(MTLRenderPassColorAttachmentDescriptorInternal);
      v15 = &self->_private;
      int8x16_t v10 = v14;
    }
    v15->attachments->_color_descriptors[v7] = v14;
LABEL_19:
    if (v11) {
      BOOL v16 = v10 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16) {
      goto LABEL_3;
    }
    int v6 = equalAttachmentPrivate(&v10->_private, &v11->_private);
    if (!v6) {
      return v6;
    }
LABEL_24:
    ++v7;
  }
  while (v7 != 8);
  attachments = p_private->attachments;
  depth_descriptor = p_private->attachments->_depth_descriptor;
  float v19 = v9->attachments;
  double v20 = v9->attachments->_depth_descriptor;
  if (depth_descriptor == v20) {
    goto LABEL_43;
  }
  if (depth_descriptor) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  if (v21)
  {
    float v23 = objc_alloc_init(MTLRenderPassDepthAttachmentDescriptorInternal);
    uint64_t v24 = v9;
    double v20 = v23;
LABEL_36:
    v24->attachments->_depth_descriptor = v23;
  }
  else
  {
    if (depth_descriptor) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = v20 == 0;
    }
    if (!v22)
    {
      float v23 = objc_alloc_init(MTLRenderPassDepthAttachmentDescriptorInternal);
      uint64_t v24 = &self->_private;
      depth_descriptor = v23;
      goto LABEL_36;
    }
  }
  if (v20) {
    BOOL v25 = depth_descriptor == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (v25) {
    goto LABEL_3;
  }
  int v6 = equalAttachmentPrivate(&depth_descriptor->_private, &v20->_private);
  if (!v6) {
    return v6;
  }
  attachments = p_private->attachments;
  float v19 = v9->attachments;
LABEL_43:
  stencil_descriptor = attachments->_stencil_descriptor;
  uint64_t v27 = v19->_stencil_descriptor;
  if (stencil_descriptor != v27)
  {
    if (stencil_descriptor) {
      BOOL v28 = v27 == 0;
    }
    else {
      BOOL v28 = 0;
    }
    if (v28)
    {
      v30 = objc_alloc_init(MTLRenderPassStencilAttachmentDescriptorInternal);
      v31 = v9;
      uint64_t v27 = v30;
LABEL_54:
      v31->attachments->_stencil_descriptor = v30;
    }
    else
    {
      if (stencil_descriptor) {
        BOOL v29 = 1;
      }
      else {
        BOOL v29 = v27 == 0;
      }
      if (!v29)
      {
        v30 = objc_alloc_init(MTLRenderPassStencilAttachmentDescriptorInternal);
        v31 = &self->_private;
        stencil_descriptor = v30;
        goto LABEL_54;
      }
    }
    if (v27) {
      BOOL v32 = stencil_descriptor == 0;
    }
    else {
      BOOL v32 = 1;
    }
    if (!v32)
    {
      int v6 = equalAttachmentPrivate(&stencil_descriptor->_private, &v27->_private);
      if (!v6) {
        return v6;
      }
      goto LABEL_60;
    }
LABEL_3:
    LOBYTE(v6) = 0;
    return v6;
  }
LABEL_60:
  visibilityResultBuffer = self->_private.visibilityResultBuffer;
  if (visibilityResultBuffer != v9->visibilityResultBuffer)
  {
    int v6 = -[MTLBuffer isEqual:](visibilityResultBuffer, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  if (self->_private.ditherEnabled != v9->ditherEnabled) {
    goto LABEL_3;
  }
  if (self->_private.renderTargetWidth != v9->renderTargetWidth) {
    goto LABEL_3;
  }
  if (self->_private.renderTargetHeight != v9->renderTargetHeight) {
    goto LABEL_3;
  }
  if (self->_private.defaultColorSampleCount != v9->defaultColorSampleCount) {
    goto LABEL_3;
  }
  if (self->_private.fineGrainedBackgroundVisibilityEnabled != v9->fineGrainedBackgroundVisibilityEnabled) {
    goto LABEL_3;
  }
  if (self->_private.skipEmptyTilesOnClearEnabled != v9->skipEmptyTilesOnClearEnabled) {
    goto LABEL_3;
  }
  if (self->_private.openGLModeEnabled != v9->openGLModeEnabled) {
    goto LABEL_3;
  }
  if (self->_private.pointCoordYFlipEnabled != v9->pointCoordYFlipEnabled) {
    goto LABEL_3;
  }
  if (self->_private.renderTargetArrayLength != v9->renderTargetArrayLength) {
    goto LABEL_3;
  }
  if (self->_private.tileWidth != v9->tileWidth) {
    goto LABEL_3;
  }
  if (self->_private.tileHeight != v9->tileHeight) {
    goto LABEL_3;
  }
  if (self->_private.imageBlockSampleLength != v9->imageBlockSampleLength) {
    goto LABEL_3;
  }
  if (self->_private.threadgroupMemoryLength != v9->threadgroupMemoryLength) {
    goto LABEL_3;
  }
  if (self->_private.var0.defaultSampleCount != v9->var0.defaultSampleCount) {
    goto LABEL_3;
  }
  unint64_t numCustomSamplePositions = self->_private.numCustomSamplePositions;
  if (numCustomSamplePositions != v9->numCustomSamplePositions) {
    goto LABEL_3;
  }
  if (numCustomSamplePositions)
  {
    p_y = &self->_private.customSamplePositions[0].y;
    v36 = (float *)(v50 + 140);
    while (*(p_y - 1) == *(v36 - 1) && *p_y == *v36)
    {
      p_y += 2;
      v36 += 2;
      if (!--numCustomSamplePositions) {
        goto LABEL_82;
      }
    }
    goto LABEL_3;
  }
LABEL_82:
  rasterizationRateMap = self->_private.rasterizationRateMap;
  if (rasterizationRateMap != v9->rasterizationRateMap)
  {
    int v6 = -[MTLRasterizationRateMap isEqual:](rasterizationRateMap, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  uint64_t v38 = 0;
  p_sampleBufferAttachments = &self->_private.sampleBufferAttachments;
  while (2)
  {
    unint64_t v40 = (*p_sampleBufferAttachments)->_sampleDescriptors[v38];
    uint64_t v41 = v9->sampleBufferAttachments->_sampleDescriptors[v38];
    if (v40 != v41)
    {
      if (v40) {
        BOOL v42 = v41 == 0;
      }
      else {
        BOOL v42 = 0;
      }
      if (v42)
      {
        unint64_t v44 = objc_alloc_init(MTLRenderPassSampleBufferAttachmentDescriptorInternal);
        unint64_t v45 = &v9->sampleBufferAttachments;
        uint64_t v41 = v44;
LABEL_96:
        (*v45)->_sampleDescriptors[v38] = v44;
      }
      else
      {
        if (v40) {
          BOOL v43 = 1;
        }
        else {
          BOOL v43 = v41 == 0;
        }
        if (!v43)
        {
          unint64_t v44 = objc_alloc_init(MTLRenderPassSampleBufferAttachmentDescriptorInternal);
          unint64_t v45 = &p_private->sampleBufferAttachments;
          unint64_t v40 = v44;
          goto LABEL_96;
        }
      }
      if (v41) {
        BOOL v46 = v40 == 0;
      }
      else {
        BOOL v46 = 1;
      }
      if (v46) {
        goto LABEL_3;
      }
      int v6 = equalSampleBufferPrivate(&v40->_private, &v41->_private);
      if (!v6) {
        return v6;
      }
    }
    if (++v38 != 4) {
      continue;
    }
    break;
  }
  binaryArchives = p_private->binaryArchives;
  v48 = v9->binaryArchives;

  LOBYTE(v6) = MTLCompareArray(binaryArchives, v48, 1, 0);
  return v6;
}

- (id)formattedDescription:(unint64_t)a3
{
  v32[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a3 + 4;
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  for (uint64_t i = 0; i != 8; ++i)
  {
    v30[0] = v4;
    v30[1] = objc_msgSend(NSString, "stringWithFormat:", @"Color Attachment %u", i);
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v30, 2));
    uint64_t v7 = self->_private.attachments->_color_descriptors[i];
    if (v7) {
      p_private = &v7->_private;
    }
    else {
      p_private = (const MTLRenderPassAttachmentDescriptorPrivate *)&defaultColorAttachmentPrivate;
    }
    objc_msgSend(v5, "addObject:", colorAttachmentFormattedDescription(v3, p_private));
  }
  v29[0] = v4;
  v29[1] = @"Depth Attachment:";
  depth_descriptor = self->_private.attachments->_depth_descriptor;
  if (depth_descriptor) {
    int8x16_t v10 = &depth_descriptor->_private;
  }
  else {
    int8x16_t v10 = (const MTLRenderPassAttachmentDescriptorPrivate *)&defaultDepthAttachmentPrivate;
  }
  v29[2] = depthAttachmentFormattedDescription(v3, v10);
  v29[3] = v4;
  v29[4] = @"Stencil Attachment:";
  stencil_descriptor = self->_private.attachments->_stencil_descriptor;
  if (stencil_descriptor) {
    BOOL v12 = &stencil_descriptor->_private;
  }
  else {
    BOOL v12 = (const MTLRenderPassAttachmentDescriptorPrivate *)&defaultStencilAttachmentPrivate;
  }
  v29[5] = stencilAttachmentFormattedDescription(v3, v12);
  v29[6] = v4;
  v29[7] = @"visibilityResultBuffer =";
  visibilityResultBuffer = self->_private.visibilityResultBuffer;
  if (visibilityResultBuffer) {
    v14 = (__CFString *)[(MTLBuffer *)visibilityResultBuffer formattedDescription:v3];
  }
  else {
    v14 = @"<null>";
  }
  v29[8] = v14;
  v29[9] = v4;
  v29[10] = @"renderTargetArrayLength =";
  v29[11] = [NSNumber numberWithUnsignedInteger:self->_private.renderTargetArrayLength];
  v29[12] = v4;
  v29[13] = @"renderTargetWidth =";
  v29[14] = [NSNumber numberWithUnsignedInteger:self->_private.renderTargetWidth];
  v29[15] = v4;
  v29[16] = @"renderTargetHeight =";
  v29[17] = [NSNumber numberWithUnsignedInteger:self->_private.renderTargetHeight];
  v29[18] = v4;
  v29[19] = @"rasterizationRateMap =";
  rasterizationRateMap = self->_private.rasterizationRateMap;
  if (rasterizationRateMap) {
    BOOL v16 = (__CFString *)[(MTLRasterizationRateMap *)rasterizationRateMap formattedDescription:v3];
  }
  else {
    BOOL v16 = @"<null>";
  }
  v29[20] = v16;
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 21));
  uint64_t v17 = [@"\n" stringByPaddingToLength:v3 withString:@" " startingAtIndex:0];
  uint64_t v18 = [@"\n" stringByPaddingToLength:a3 + 8 withString:@" " startingAtIndex:0];
  float v19 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:37];
  v32[0] = v17;
  v32[1] = @"Custom Sample Positions:";
  v32[2] = v18;
  v32[3] = @"number of positions = ";
  v32[4] = [NSNumber numberWithUnsignedInteger:self->_private.numCustomSamplePositions];
  objc_msgSend(v19, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v32, 5));
  if (self->_private.numCustomSamplePositions)
  {
    unint64_t v20 = 0;
    p_y = &self->_private.customSamplePositions[0].y;
    do
    {
      v31[0] = v18;
      v31[1] = @"sample ";
      v31[2] = [NSNumber numberWithInt:v20];
      v31[3] = @": <";
      *(float *)&double v22 = *(p_y - 1);
      v31[4] = [NSNumber numberWithFloat:v22];
      v31[5] = @",";
      int v23 = *(_DWORD *)p_y;
      p_y += 2;
      LODWORD(v24) = v23;
      v31[6] = [NSNumber numberWithFloat:v24];
      v31[7] = @">";
      objc_msgSend(v19, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v31, 8));
      ++v20;
    }
    while (self->_private.numCustomSamplePositions > v20);
  }
  [v5 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@\n", objc_msgSend(v19, "componentsJoinedByString:", &stru_1ECAC84A8))];
  v28.receiver = self;
  v28.super_class = (Class)MTLRenderPassDescriptorInternal;
  return (id)[NSString stringWithFormat:@"%@%@", -[MTLRenderPassDescriptorInternal description](&v28, sel_description), objc_msgSend(v5, "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLRenderPassDescriptorInternal *)self formattedDescription:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = 0;
  p_private = &self->_private;
  uint64_t v8 = v5 + 40;
  do
  {
    uint64_t v9 = p_private->attachments->_color_descriptors[v6];
    if (v9) {
      *(void *)(*(void *)v8 + 8 + v6 * 8) = [(MTLRenderPassColorAttachmentDescriptorInternal *)v9 copyWithZone:a3];
    }
    ++v6;
  }
  while (v6 != 8);
  attachments = p_private->attachments;
  depth_descriptor = p_private->attachments->_depth_descriptor;
  if (depth_descriptor)
  {
    *(void *)(*(void *)v8 + 72) = [(MTLRenderPassDepthAttachmentDescriptorInternal *)depth_descriptor copyWithZone:a3];
    attachments = p_private->attachments;
  }
  stencil_descriptor = attachments->_stencil_descriptor;
  if (stencil_descriptor) {
    *(void *)(*(void *)v8 + 80) = [(MTLRenderPassStencilAttachmentDescriptorInternal *)stencil_descriptor copyWithZone:a3];
  }
  *(void *)(v5 + 48) = self->_private.visibilityResultBuffer;
  *(_OWORD *)(v5 + 56) = *(_OWORD *)&self->_private.renderTargetWidth;
  *(void *)(v5 + 72) = self->_private.defaultColorSampleCount;
  *(_DWORD *)(v5 + 80) = *(_DWORD *)&self->_private.fineGrainedBackgroundVisibilityEnabled;
  *(unsigned char *)(v5 + 192) = self->_private.pointCoordYFlipEnabled;
  *(_OWORD *)(v5 + 88) = *(_OWORD *)&self->_private.renderTargetArrayLength;
  *(void *)(v5 + 104) = self->_private.tileHeight;
  *(_OWORD *)(v5 + 120) = *(_OWORD *)&self->_private.imageBlockSampleLength;
  *(void *)(v5 + 112) = self->_private.var0.defaultSampleCount;
  *(void *)(v5 + 168) = self->_private.numCustomSamplePositions;
  if (self->_private.numCustomSamplePositions)
  {
    unint64_t v13 = 0;
    do
    {
      *($38C3DEC81229B66F67FB6D350D75FF5A *)(v5 + 136 + 8 * v13) = self->_private.customSamplePositions[v13];
      ++v13;
    }
    while (self->_private.numCustomSamplePositions > v13);
  }
  for (uint64_t i = 0; i != 4; ++i)
  {
    v15 = p_private->sampleBufferAttachments->_sampleDescriptors[i];
    if (v15) {
      *(void *)(*(void *)(v5 + 184) + 8 + i * 8) = [(MTLRenderPassSampleBufferAttachmentDescriptorInternal *)v15 copyWithZone:a3];
    }
  }
  *(void *)(v5 + 176) = p_private->rasterizationRateMap;
  *(void *)(v5 + 200) = [(NSArray *)p_private->binaryArchives copy];
  return (id)v5;
}

- (id)visibilityResultBuffer
{
  return self->_private.visibilityResultBuffer;
}

- (unint64_t)renderTargetWidth
{
  return self->_private.renderTargetWidth;
}

- (unint64_t)renderTargetHeight
{
  return self->_private.renderTargetHeight;
}

- (void)setDefaultColorSampleCount:(unint64_t)a3
{
  self->_private.defaultColorSampleCount = a3;
}

- (unint64_t)defaultColorSampleCount
{
  return self->_private.defaultColorSampleCount;
}

- (BOOL)fineGrainedBackgroundVisibilityEnabled
{
  return self->_private.fineGrainedBackgroundVisibilityEnabled;
}

- (void)setSkipEmptyTilesOnClearEnabled:(BOOL)a3
{
  self->_private.skipEmptyTilesOnClearEnabled = a3;
}

- (BOOL)skipEmptyTilesOnClearEnabled
{
  return self->_private.skipEmptyTilesOnClearEnabled;
}

- (void)setDitherEnabled:(BOOL)a3
{
  self->_private.ditherEnabled = a3;
}

- (BOOL)ditherEnabled
{
  return self->_private.ditherEnabled;
}

- (void)setOpenGLModeEnabled:(BOOL)a3
{
  self->_private.openGLModeEnabled = a3;
}

- (BOOL)openGLModeEnabled
{
  return self->_private.openGLModeEnabled;
}

- (void)setPointCoordYFlipEnabled:(BOOL)a3
{
  self->_private.pointCoordYFlipEnabled = a3;
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

- (id)binaryArchives
{
  return self->_private.binaryArchives;
}

- (void)setImageblockSampleLength:(unint64_t)a3
{
  self->_private.imageBlockSampleLength = a3;
}

- (unint64_t)imageblockSampleLength
{
  return self->_private.imageBlockSampleLength;
}

- (void)setThreadgroupMemoryLength:(unint64_t)a3
{
  self->_private.threadgroupMemoryLength = a3;
}

- (void)setTileWidth:(unint64_t)a3
{
  self->_private.unint64_t tileWidth = a3;
}

- (unint64_t)tileWidth
{
  return self->_private.tileWidth;
}

- (void)setTileHeight:(unint64_t)a3
{
  self->_private.tileHeight = a3;
}

- (unint64_t)tileHeight
{
  return self->_private.tileHeight;
}

- (void)setDefaultRasterSampleCount:(unint64_t)a3
{
  self->_private.var0.uint64_t defaultSampleCount = a3;
}

- (unint64_t)defaultRasterSampleCount
{
  return self->_private.var0.defaultSampleCount;
}

- (void)setSamplePositions:(id *)a3 count:(unint64_t)a4
{
  uint64_t v9 = a3;
  if (a4 <= 4 && ((1 << a4) & 0x15) != 0)
  {
    if (a3) {
      goto LABEL_7;
    }
  }
  else
  {
    MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal setSamplePositions:count:]", 2030, @"count (%lu) is not a supported sample count for custom positions.", v4, v5, v6, v7, a4);
    if (v9) {
      goto LABEL_7;
    }
  }
  if (a4)
  {
    MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal setSamplePositions:count:]", 2032, @"Non-zero count (%lu) provided with a NULL positions parameter.", v4, v5, v6, v7, a4);
    return;
  }
LABEL_7:
  if (v9 && a4 <= 4)
  {
    if (a4)
    {
      uint64_t v11 = 0;
      do
      {
        float var0 = v9->var0;
        if (v9->var0 < 0.0 || var0 >= 1.0) {
          MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal setSamplePositions:count:]", 2038, @"Provided sample position x-coodinate (%f) at index %u is not within the range [0,1."), v4, v5, v6, v7, COERCE__INT64(var0));
        }
        float var1 = v9->var1;
        if (var1 < 0.0 || var1 >= 1.0) {
          MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal setSamplePositions:count:]", 2039, @"Provided sample position y-coodinate (%f) at index %u is not within the range [0,1."), v4, v5, v6, v7, COERCE__INT64(var1));
        }
        $38C3DEC81229B66F67FB6D350D75FF5A v16 = ($38C3DEC81229B66F67FB6D350D75FF5A)*v9++;
        self->_private.customSamplePositions[v11++] = v16;
      }
      while (a4 != v11);
    }
    self->_private.unint64_t numCustomSamplePositions = a4;
  }
}

- (unint64_t)getSamplePositions:(id *)a3 count:(unint64_t)a4
{
  if (!a3 && a4)
  {
    MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal getSamplePositions:count:]", 2048, @"Non-zero count (%lu) provided with a NULL positions parameter.", v4, v5, v6, v7, a4);
  }
  else if (!a4)
  {
    goto LABEL_6;
  }
  if (self->_private.numCustomSamplePositions != a4) {
    MTLReportFailure(0, "-[MTLRenderPassDescriptorInternal getSamplePositions:count:]", 2049, @"Non-zero count (%lu) does not match the number of programmed custom sample positions (%lu).", v4, v5, v6, v7, a4);
  }
LABEL_6:
  unint64_t result = self->_private.numCustomSamplePositions;
  if (a3 && result == a4)
  {
    if (a4)
    {
      unint64_t v12 = 0;
      do
      {
        a3[v12] = ($94F468A8D4C62B317260615823C2B210)self->_private.customSamplePositions[v12];
        ++v12;
        unint64_t result = self->_private.numCustomSamplePositions;
      }
      while (result > v12);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end