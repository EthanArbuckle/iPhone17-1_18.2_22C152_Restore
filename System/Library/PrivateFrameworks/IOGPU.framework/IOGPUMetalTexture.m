@interface IOGPUMetalTexture
+ (void)initNewTextureDataWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9;
- ($14D77461FF5D83CAEC4252578BA76F85)swizzle;
- (BOOL)allowGPUOptimizedContents;
- (BOOL)isAliasable;
- (BOOL)isCompressed;
- (BOOL)isDrawable;
- (BOOL)isFramebufferOnly;
- (BOOL)isShareable;
- (BOOL)isSparse;
- (BOOL)rootResourceIsSuballocatedBuffer;
- (IOGPUMetalBuffer)buffer;
- (IOGPUMetalResource)rootResource;
- (IOGPUMetalTexture)initWithBuffer:(id)a3 descriptor:(id)a4 offset:(unint64_t)a5 bytesPerRow:(unint64_t)a6;
- (IOGPUMetalTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10;
- (IOGPUMetalTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 isStrideTexture:(BOOL)a11;
- (IOGPUMetalTexture)initWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7;
- (IOGPUMetalTexture)initWithDevice:(id)a3 descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unsigned int)a6 field:(unsigned int)a7 args:(IOGPUNewResourceArgs *)a8 argsSize:(unsigned int)a9;
- (IOGPUMetalTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemPointer:(void *)a5 sysMemSize:(unint64_t)a6 sysMemLength:(unint64_t)a7 sysMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)aBlock;
- (IOGPUMetalTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10;
- (IOGPUMetalTexture)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 device:(id)a7 descriptor:(id)a8;
- (IOGPUMetalTexture)initWithPrimaryBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 descriptor:(id)a8 sysMemRowBytes:(unint64_t)a9 vidMemSize:(unint64_t)a10 vidMemRowBytes:(unint64_t)a11 args:(IOGPUNewResourceArgs *)a12 argsSize:(unsigned int)a13;
- (IOGPUMetalTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4;
- (IOGPUMetalTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7;
- (IOGPUMetalTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8;
- (IOGPUMetalTexture)initWithTextureInternal:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 compressedView:(BOOL)a9;
- (IOGPUMetalTexture)parentTexture;
- (__CFArray)copyAnnotations;
- (__IOSurface)iosurface;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)newSharedTextureHandle;
- (int)setOwnerWithIdentity:(unsigned int)a3;
- (int64_t)compressionFeedback;
- (unint64_t)allocatedSize;
- (unint64_t)arrayLength;
- (unint64_t)bufferBytesPerRow;
- (unint64_t)bufferOffset;
- (unint64_t)depth;
- (unint64_t)hazardTrackingMode;
- (unint64_t)height;
- (unint64_t)iosurfacePlane;
- (unint64_t)mipmapLevelCount;
- (unint64_t)numFaces;
- (unint64_t)parentRelativeLevel;
- (unint64_t)parentRelativeSlice;
- (unint64_t)pixelFormat;
- (unint64_t)rotation;
- (unint64_t)sampleCount;
- (unint64_t)textureType;
- (unint64_t)usage;
- (unint64_t)width;
- (unsigned)swizzleKey;
- (void)_setLabel:(id)a3;
- (void)buffer;
- (void)copyFromPixels:(const void *)a3 rowBytes:(unint64_t)a4 imageBytes:(unint64_t)a5 toSlice:(unint64_t)a6 mipmapLevel:(unint64_t)a7 origin:(id *)a8 size:(id *)a9;
- (void)copyFromSlice:(unint64_t)a3 mipmapLevel:(unint64_t)a4 origin:(id *)a5 size:(id *)a6 toPixels:(void *)a7 rowBytes:(unint64_t)a8 imageBytes:(unint64_t)a9;
- (void)dealloc;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6;
- (void)makeAliasable;
- (void)parentTexture;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6;
@end

@implementation IOGPUMetalTexture

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (unint64_t)hazardTrackingMode
{
  unint64_t v2 = (*(void *)&self->super._anon_50[88] >> 8) & 3;
  if (v2) {
    return v2;
  }
  buffer = (MTLHeap *)self->_buffer;
  if (!buffer)
  {
    buffer = (MTLHeap *)self->_parentTexture;
    if (!buffer)
    {
      buffer = [(IOGPUMetalResource *)self heap];
      if (!buffer) {
        return 2;
      }
    }
  }
  return [(MTLHeap *)buffer hazardTrackingMode];
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)_setLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IOGPUMetalTexture;
  -[IOGPUMetalResource _setLabel:](&v5, sel__setLabel_);
  if (self->_shareable) {
    IOSurfaceSetValue(self->_iosurface, (CFStringRef)*MEMORY[0x263F0EE28], a3);
  }
}

- (void)dealloc
{
  deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
  if (deallocator)
  {
    deallocator[2](deallocator, self->_pointer, self->_length);
    _Block_release(self->_deallocator);
    self->_deallocator = 0;
  }
  if (*(void *)&self->super._anon_50[136])
  {
    if ((*(void *)&self->super._anon_50[88] & 0xF0) != 0x30)
    {
      [(IOGPUMetalTexture *)self makeAliasable];
      if (!self->_buffer && !self->_parentTexture) {
        [*(id *)&self->super._anon_50[136] deallocHeapSubResource];
      }
    }
  }

  if (self->_rootResourceIsSuballocatedBuffer) {
    [*(id *)&self->super._anon_50[32] deallocBufferSubData:self->_primaryBuffer heapIndex:self->_primaryHeapIndex bufferIndex:self->_primaryBufferIndex bufferOffset:self->_primaryBufferOffset length:self->_length];
  }
  iosurface = self->_iosurface;
  if (iosurface) {
    CFRelease(iosurface);
  }
  v5.receiver = self;
  v5.super_class = (Class)IOGPUMetalTexture;
  [(IOGPUMetalResource *)&v5 dealloc];
}

- (IOGPUMetalTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  uint64_t v17 = [a4 descriptorPrivate];
  unint64_t v23 = *(void *)v17;
  +[IOGPUMetalTexture initNewTextureDataWithDevice:a3 descriptor:a4 sysMemSize:a5 sysMemRowBytes:a6 vidMemSize:a7 vidMemRowBytes:a8 args:a9];
  v18 = [(IOGPUMetalResource *)self initWithDevice:a3 options:*(void *)(v17 + 112) args:a9 argsSize:a10];
  v19 = v18;
  if (v18)
  {
    v18->_textureType = *(void *)v17;
    unint64_t v20 = *(void *)(v17 + 8);
    v18->_width = *(void *)(v17 + 16);
    v18->_height = *(void *)(v17 + 24);
    v18->_depth = *(void *)(v17 + 32);
    v18->_mipmapLevelCount = *(void *)(v17 + 40);
    v18->_sampleCount = *(void *)(v17 + 48);
    v18->_arrayLength = *(void *)(v17 + 56);
    uint64_t v21 = 6;
    if (v23 - 5 >= 2) {
      uint64_t v21 = 1;
    }
    v18->_numFaces = v21;
    v18->_pixelFormat = v20;
    v18->_usage = *(void *)(v17 + 176);
    if (*(void *)(v17 + 72)) {
      -[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:]();
    }
    v18->_rotation = 0;
    v18->_swizzle = *(_DWORD *)(v17 + 84);
    v18->_writeSwizzleEnabled = *(unsigned char *)(v17 + 88);
    v18->_isCompressed = 0;
    v18->_shareable = 0;
    if (*(unsigned char *)(v17 + 80)) {
      -[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:]();
    }
    v18->_framebufferOnly = 0;
    v18->_isDrawable = *(unsigned char *)(v17 + 81);
    v18->_allowGPUOptimizedContents = *(unsigned char *)(v17 + 128);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [a3 deviceRef];
      [a3 registryID];
      IOGPUDeviceTraceEvent();
    }
  }
  return v19;
}

+ (void)initNewTextureDataWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9
{
  a9->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)(&a9->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  *(_OWORD *)&a9->var0.var12 = 0u;
  *(_OWORD *)&a9->var0.var0 = 0u;
  uint64_t v10 = [a4 descriptorPrivate];
  if (*(void *)(v10 + 72)) {
    MTLReportFailure();
  }
  int v11 = (*(void *)(v10 + 112) & 0xFLL) == 1;
  uint64_t v12 = *(void *)v10;
  int v13 = 6;
  if ((unint64_t)(*(void *)v10 - 5) >= 2) {
    int v13 = 1;
  }
  a9->var0.var0 = 0;
  a9->var0.var1 = v11 << 10;
  a9->var0.var2 = *(void *)(v10 + 16);
  a9->var0.var3 = *(void *)(v10 + 24);
  a9->var0.var11 = *(void *)(v10 + 144);
  if (v12 == 6)
  {
    LODWORD(v14) = *(_DWORD *)(v10 + 56) * v13;
LABEL_12:
    a9->var0.var4 = v14;
    goto LABEL_13;
  }
  if (v12 == 3)
  {
    uint64_t v14 = *(void *)(v10 + 56);
    goto LABEL_12;
  }
  if (v12 != 1)
  {
    uint64_t v14 = *(void *)(v10 + 32);
    goto LABEL_12;
  }
  a9->var0.var3 = *(void *)(v10 + 56);
LABEL_13:
  a9->var0.var6 = v13;
  a9->var0.var7 = *(void *)(v10 + 40);
  a9->var0.var9 = 1;
  MTLPixelFormatGetInfoForDevice();
  a9->var0.var9 = 0;
  a9->var0.var10 = *(unsigned __int8 *)(v10 + 64) << 6;
  *(_OWORD *)&a9->var0.var16.var0.var0 = 0uLL;
  a9->var0.var16.var0.var2 = a5;
}

- (void)makeAliasable
{
  if (!self->_buffer && !self->_parentTexture)
  {
    v2.receiver = self;
    v2.super_class = (Class)IOGPUMetalTexture;
    [(IOGPUMetalResource *)&v2 makeAliasable];
  }
}

- (IOGPUMetalTexture)parentTexture
{
  if (!self->_parentTexture) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalTexture parentTexture]();
  }
  return self->_parentTexture;
}

- (unint64_t)allocatedSize
{
  if (self->_primaryBuffer) {
    return self->_length;
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalTexture;
  return [(IOGPUMetalResource *)&v3 allocatedSize];
}

- (IOGPUMetalTexture)initWithPrimaryBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 descriptor:(id)a8 sysMemRowBytes:(unint64_t)a9 vidMemSize:(unint64_t)a10 vidMemRowBytes:(unint64_t)a11 args:(IOGPUNewResourceArgs *)a12 argsSize:(unsigned int)a13
{
  BYTE4(v19) = 0;
  LODWORD(v19) = a13;
  result = -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:](self, "initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:", a3, a8, a6, a9, a10, a11, a12, v19);
  if (result)
  {
    result->_rootResourceIsSuballocatedBuffer = 1;
    result->_primaryBuffer = (IOGPUMetalBuffer *)a3;
    result->_primaryHeapIndex = a4;
    result->_primaryBufferIndex = a5;
    result->_primaryBufferOffset = a6;
    result->_length = a7;
  }
  return result;
}

- (IOGPUMetalTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 isStrideTexture:(BOOL)a11
{
  if (!a3) {
    -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:].cold.4();
  }
  unint64_t v35 = a6;
  uint64_t v17 = [a3 device];
  *(_OWORD *)&a9->var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  *(_OWORD *)&a9->var0.var12 = 0u;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)(&a9->var0.var16.var3 + 2) = 0u;
  a9->var0.var16.var0.var3.var1 = 0;
  v18 = (void *)[a4 descriptorPrivate];
  uint64_t v19 = v18;
  uint64_t v20 = *v18;
  if ((unint64_t)(*v18 - 5) >= 2) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = 6;
  }
  if (a11)
  {
    unint64_t v22 = v35;
    _mtlValidateStrideTextureParameters();
    unint64_t v23 = [(IOGPUMetalResource *)self initWithResource:a3];
    v24 = v23;
    if (!v23) {
      return v24;
    }
    *(void *)&v23->super._anon_50[24] += a5;
    goto LABEL_24;
  }
  if (v18[9])
  {
    uint64_t v34 = v18[9];
    MTLReportFailure();
    uint64_t v20 = *v19;
  }
  a9->var0.var0 = (v19[24] != 2) << 7;
  a9->var0.var1 = 0;
  a9->var0.var2 = v19[2];
  a9->var0.var3 = v19[3];
  switch(v20)
  {
    case 6:
      LODWORD(v25) = *((_DWORD *)v19 + 14) * v21;
      break;
    case 3:
      uint64_t v25 = v19[7];
      break;
    case 1:
      a9->var0.var3 = v19[7];
      goto LABEL_19;
    default:
      uint64_t v25 = v19[4];
      break;
  }
  a9->var0.var4 = v25;
LABEL_19:
  a9->var0.var6 = v21;
  a9->var0.var7 = v19[5];
  a9->var0.var9 = 1;
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  MTLPixelFormatGetInfoForDevice();
  a9->var0.var9 = 0;
  a9->var0.var10 = *((unsigned __int8 *)v19 + 64) << 6;
  unint64_t v26 = *((void *)a3 + 20);
  a9->var0.var16.var0.var0 = v26 + a5;
  a9->var0.var16.var0.var1 = v26;
  a9->var0.var16.var0.var2 = [a3 resourceSize];
  unsigned int v27 = *((_DWORD *)a3 + 20);
  if (v27)
  {
    a9->var0.var16.var0.var3.var0 = v27;
    a9->var0.var10 |= 0x800u;
  }
  uint64_t v28 = *((void *)a3 + 23) | (16 * *((void *)a3 + 22)) | *((void *)a3 + 21) & 0x300;
  v36.receiver = self;
  v36.super_class = (Class)IOGPUMetalTexture;
  v29 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](&v36, sel_initWithDevice_options_args_argsSize_, v17, v28, a9, a10, v34);
  v24 = v29;
  if (v29)
  {
    v29->super._anon_50[128] = 0;
    if (!a7)
    {
      v30 = 0;
      unint64_t v22 = v35;
      goto LABEL_25;
    }
    unint64_t v22 = v35;
LABEL_24:
    v30 = (IOGPUMetalBuffer *)a3;
LABEL_25:
    v24->_buffer = v30;
    v24->_bufferOffset = a5;
    v24->_bufferBytesPerRow = v22;
    v24->_textureType = *v19;
    v24->_width = v19[2];
    v24->_height = v19[3];
    v24->_depth = v19[4];
    v24->_mipmapLevelCount = v19[5];
    v24->_sampleCount = v19[6];
    v24->_arrayLength = v19[7];
    v24->_numFaces = v21;
    v24->_pixelFormat = v19[1];
    v24->_usage = v19[22];
    if (v19[9]) {
      -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]();
    }
    v24->_rotation = 0;
    v24->_swizzle = *((_DWORD *)v19 + 21);
    v24->_writeSwizzleEnabled = *((unsigned char *)v19 + 88);
    v24->_shareable = 0;
    if (*((unsigned char *)v19 + 80)) {
      -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]();
    }
    v24->_framebufferOnly = 0;
    v24->_isDrawable = *((unsigned char *)v19 + 81);
    v24->_allowGPUOptimizedContents = *((unsigned char *)v19 + 128);
    v31 = (char *)a3 + 32;
    id v32 = *((id *)v31 + 23);
    *(void *)&v24->super._anon_50[136] = v32;
    *(void *)&v24->super._anon_50[144] = *((void *)v31 + 24);
    *(_OWORD *)&v24->super._anon_50[152] = *(_OWORD *)(v31 + 200);
    v24->super._anon_50[168] = v31[216];
    if (a11 && v32) {
      *(void *)&v24->super._anon_50[24] = *((void *)v31 + 9) + a5;
    }
    *(void *)&v24->super._anon_50[80] = *((void *)v31 + 16) + a5;
  }
  return v24;
}

- (IOGPUMetalTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  LOBYTE(v8) = 0;
  return -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, [a3 swizzle], v8);
}

- ($14D77461FF5D83CAEC4252578BA76F85)swizzle
{
  return ($14D77461FF5D83CAEC4252578BA76F85)MEMORY[0x270EF5FA0](self->_swizzle, a2);
}

- (IOGPUMetalTexture)initWithTextureInternal:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 compressedView:(BOOL)a9
{
  if (!a3) {
    -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]();
  }
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:].cold.6();
  }
  unsigned int v15 = MTLTextureSwizzleChannelsToKey();
  _mtlValidateMTLTextureSwizzleKey();
  [a3 device];
  LOBYTE(v26) = a9;
  _mtlValidateArgumentsForTextureViewOnDevice();
  v16 = -[IOGPUMetalResource initWithResource:](self, "initWithResource:", a3, v26);
  if (v16)
  {
    v16->_parentTexture = (IOGPUMetalTexture *)a3;
    v16->_buffer = (IOGPUMetalBuffer *)(id)[a3 buffer];
    v16->_parentRelativeLevel = location;
    v16->_parentRelativeSlice = a7.location;
    if (v16->_buffer)
    {
      if (length != 1) {
        -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:].cold.5();
      }
      if (a7.length != 1) {
        -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:].cold.4();
      }
    }
    v16->_bufferOffset = [a3 bufferOffset];
    v16->_bufferBytesPerRow = [a3 bufferBytesPerRow];
    v16->_textureType = a5;
    unint64_t v17 = *((void *)a3 + 48) >> location;
    if (v17 <= 1) {
      unint64_t v17 = 1;
    }
    v16->_width = v17;
    unint64_t v18 = *((void *)a3 + 49) >> location;
    if (v18 <= 1) {
      unint64_t v18 = 1;
    }
    v16->_height = v18;
    unint64_t v19 = *((void *)a3 + 50) >> location;
    if (v19 <= 1) {
      unint64_t v19 = 1;
    }
    v16->_depth = v19;
    v16->_pixelFormat = a4;
    v16->_usage = *((void *)a3 + 46);
    unint64_t v20 = 6;
    if (a5 - 5 >= 2) {
      unint64_t v20 = 1;
    }
    v16->_numFaces = v20;
    v16->_arrayLength = a7.length / v20;
    v16->_mipmapLevelCount = length;
    v16->_sampleCount = *((void *)a3 + 52);
    v16->_rotation = *((void *)a3 + 47);
    v16->_swizzle = v15;
    v16->_writeSwizzleEnabled = *((unsigned char *)a3 + 324);
    if (objc_msgSend((id)objc_msgSend(a3, "device"), "supportsTextureSwizzle")
      && v16->_swizzle != 84148994)
    {
      if (!v16->_usage) {
        -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]();
      }
      [a3 device];
      v16->_usage &= ~MTLGetDisallowedTextureUsagesWhenSwizzling();
      _mtlValidateTextureUsage();
    }
    v16->_shareable = 0;
    v16->_framebufferOnly = *((unsigned char *)a3 + 441);
    v16->_iosurface = (__IOSurface *)*((void *)a3 + 42);
    v16->_iosurfacePlane = *((void *)a3 + 43);
    v16->_isDrawable = *((unsigned char *)a3 + 442);
    v16->_allowGPUOptimizedContents = *((unsigned char *)a3 + 496);
    uint64_t v21 = (char *)a3 + 32;
    id v22 = *((id *)v21 + 23);
    uint64_t v23 = *((void *)v21 + 24);
    *(void *)&v16->super._anon_50[136] = v22;
    *(void *)&v16->super._anon_50[144] = v23;
    *(_OWORD *)&v16->super._anon_50[152] = *(_OWORD *)(v21 + 200);
    v16->super._anon_50[168] = v21[216];
    *(void *)&v16->super._anon_50[80] = *((void *)v21 + 16);
    *(void *)&v16->super._anon_50[24] = *((void *)v21 + 9);
    iosurface = v16->_iosurface;
    if (iosurface != v16->super._res.info.iosurface) {
      -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]();
    }
    if (iosurface) {
      CFRetain(iosurface);
    }
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [*(id *)&v16->super._anon_50[32] deviceRef];
      [*(id *)&v16->super._anon_50[32] registryID];
      IOGPUDeviceTraceEvent();
    }
  }
  return v16;
}

- (IOGPUMetalBuffer)buffer
{
  if (!self->_buffer) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalTexture buffer]();
  }
  return self->_buffer;
}

- (IOGPUMetalTexture)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 device:(id)a7 descriptor:(id)a8
{
  if (!a3) {
    -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]();
  }
  uint64_t v15 = [a8 descriptorPrivate];
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:].cold.4();
    }
    v16 = [(IOGPUMetalResource *)self initWithResource:a4];
  }
  else
  {
    v16 = [(IOGPUMetalResource *)self initMemoryless:a7 descriptor:a8];
  }
  unint64_t v17 = v16;
  if (v16)
  {
    v16->_textureType = *(void *)v15;
    v16->_width = *(void *)(v15 + 16);
    v16->_height = *(void *)(v15 + 24);
    v16->_depth = *(void *)(v15 + 32);
    v16->_mipmapLevelCount = *(void *)(v15 + 40);
    v16->_sampleCount = *(void *)(v15 + 48);
    v16->_arrayLength = *(void *)(v15 + 56);
    unint64_t v18 = *(void *)(v15 + 8);
    uint64_t v19 = 6;
    if ((unint64_t)(*(void *)v15 - 5) >= 2) {
      uint64_t v19 = 1;
    }
    v16->_numFaces = v19;
    v16->_pixelFormat = v18;
    v16->_usage = *(void *)(v15 + 176);
    if (*(void *)(v15 + 72)) {
      -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]();
    }
    v16->_rotation = 0;
    v16->_swizzle = *(_DWORD *)(v15 + 84);
    v16->_writeSwizzleEnabled = *(unsigned char *)(v15 + 88);
    v16->_shareable = 0;
    if (*(unsigned char *)(v15 + 80)) {
      -[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]();
    }
    v16->_framebufferOnly = 0;
    v16->_isDrawable = *(unsigned char *)(v15 + 81);
    v16->_allowGPUOptimizedContents = *(unsigned char *)(v15 + 128);
    *(void *)&v16->super._anon_50[136] = a3;
    *(void *)&v17->super._anon_50[144] = a4;
    if (a4) {
      unint64_t v20 = a6;
    }
    else {
      unint64_t v20 = 0;
    }
    *(void *)&v17->super._anon_50[152] = a5;
    *(void *)&v17->super._anon_50[160] = v20;
    v17->super._anon_50[168] = 1;
    if ([a3 type] == 1) {
      v17->super._anon_50[168] = 0;
    }
    if (a4)
    {
      *(void *)&v17->super._anon_50[80] = *((void *)a4 + 20) + a5;
      *(void *)&v17->super._anon_50[24] += a5;
    }
  }
  return v17;
}

- (IOGPUMetalTexture)initWithBuffer:(id)a3 descriptor:(id)a4 offset:(unint64_t)a5 bytesPerRow:(unint64_t)a6
{
  if (!a3) {
    -[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:].cold.4();
  }
  [a3 device];
  uint64_t v11 = [a4 descriptorPrivate];
  _mtlValidateStrideTextureParameters();
  uint64_t v12 = [(IOGPUMetalResource *)self initWithResource:a3];
  if (v12)
  {
    v12->_buffer = (IOGPUMetalBuffer *)a3;
    v12->_bufferOffset = a5;
    v12->_bufferBytesPerRow = a6;
    v12->_textureType = *(void *)v11;
    v12->_width = *(void *)(v11 + 16);
    v12->_height = *(void *)(v11 + 24);
    v12->_depth = *(void *)(v11 + 32);
    v12->_mipmapLevelCount = *(void *)(v11 + 40);
    v12->_sampleCount = *(void *)(v11 + 48);
    v12->_arrayLength = *(void *)(v11 + 56);
    unint64_t v13 = *(void *)(v11 + 8);
    uint64_t v14 = 6;
    if ((unint64_t)(*(void *)v11 - 5) >= 2) {
      uint64_t v14 = 1;
    }
    v12->_numFaces = v14;
    v12->_pixelFormat = v13;
    v12->_usage = *(void *)(v11 + 176);
    if (*(void *)(v11 + 72)) {
      -[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]();
    }
    v12->_rotation = 0;
    v12->_swizzle = *(_DWORD *)(v11 + 84);
    v12->_writeSwizzleEnabled = *(unsigned char *)(v11 + 88);
    v12->_shareable = 0;
    if (*(unsigned char *)(v11 + 80)) {
      -[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]();
    }
    v12->_framebufferOnly = 0;
    v12->_isDrawable = *(unsigned char *)(v11 + 81);
    v12->_allowGPUOptimizedContents = *(unsigned char *)(v11 + 128);
    id v15 = *((id *)a3 + 27);
    uint64_t v16 = *((void *)a3 + 28);
    *(void *)&v12->super._anon_50[136] = v15;
    *(void *)&v12->super._anon_50[144] = v16;
    *(_OWORD *)&v12->super._anon_50[152] = *(_OWORD *)((char *)a3 + 232);
    v12->super._anon_50[168] = *((unsigned char *)a3 + 248);
    if (v15) {
      uint64_t v17 = *((void *)a3 + 13);
    }
    else {
      uint64_t v17 = *(void *)&v12->super._anon_50[24];
    }
    *(void *)&v12->super._anon_50[24] = v17 + a5;
    *(void *)&v12->super._anon_50[80] = *((void *)a3 + 20) + a5;
  }
  return v12;
}

- (unint64_t)bufferOffset
{
  if (self->_buffer) {
    return self->_bufferOffset;
  }
  else {
    return 0;
  }
}

- (unint64_t)bufferBytesPerRow
{
  if (self->_buffer) {
    return self->_bufferBytesPerRow;
  }
  else {
    return 0;
  }
}

- (unint64_t)textureType
{
  return self->_textureType;
}

- (unint64_t)arrayLength
{
  return self->_arrayLength;
}

- (unint64_t)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (unint64_t)numFaces
{
  return self->_numFaces;
}

- (__IOSurface)iosurface
{
  result = self->_iosurface;
  if (!result || self->_shareable) {
    return 0;
  }
  return result;
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  long long v6 = *(_OWORD *)&a3->var0.var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  [(IOGPUMetalTexture *)self replaceRegion:v7 mipmapLevel:a4 slice:0 withBytes:a5 bytesPerRow:a6 bytesPerImage:0];
}

- (IOGPUMetalTexture)initWithDevice:(id)a3 descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unsigned int)a6 field:(unsigned int)a7 args:(IOGPUNewResourceArgs *)a8 argsSize:(unsigned int)a9
{
  uint64_t v35 = *(void *)&a6;
  a8->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a8->var0.var14 = 0u;
  *(_OWORD *)(&a8->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a8->var0.var6 = 0u;
  *(_OWORD *)&a8->var0.var12 = 0u;
  *(_OWORD *)&a8->var0.var0 = 0u;
  uint64_t v14 = [a4 descriptorPrivate];
  uint64_t v15 = v14;
  if (*(void *)(v14 + 72) >= 5uLL)
  {
    uint64_t v32 = *(void *)(v14 + 72);
    MTLReportFailure();
  }
  uint64_t v16 = (void *)IOSurfaceCopyValue(a5, (CFStringRef)*MEMORY[0x263F0EDA8]);
  if (v16)
  {
    uint64_t v17 = v16;
    BOOL v18 = [v16 objectForKeyedSubscript:*MEMORY[0x263F12CA8]] != 0;
  }
  else
  {
    BOOL v18 = 0;
  }
  MTLPixelFormatGetInfoForDevice();
  unint64_t v19 = *(void *)(v15 + 72);
  id v34 = a3;
  if (v19 <= 4 && ((1 << v19) & 0x1A) != 0)
  {
    unint64_t v20 = (void *)(v15 + 16);
    uint64_t v21 = (void *)(v15 + 24);
  }
  else
  {
    uint64_t v21 = (void *)(v15 + 24);
    unint64_t v20 = (void *)(v15 + 16);
  }
  if (!a5) {
    MTLReportFailure();
  }
  if (IOSurfaceGetPlaneCount(a5)) {
    char v22 = 1;
  }
  else {
    char v22 = v18;
  }
  if ((v22 & 1) == 0)
  {
    IOSurfaceGetBaseAddress(a5);
    IOSurfaceGetBytesPerRow(a5);
    _mtlValidateStrideTextureParameters();
    if (v35)
    {
      uint64_t v32 = v35;
      MTLReportFailure();
    }
    objc_msgSend(a4, "pixelFormat", v32);
    MTLGetTextureLevelInfoForDeviceWithOptions();
    IOSurfaceGetBytesPerRow(a5);
    IOSurfaceGetAllocSize(a5);
    IOSurfaceGetBytesPerRow(a5);
    IOSurfaceGetHeight(a5);
    IOSurfaceGetElementHeight(a5);
    if (!IOSurfaceAllowsPixelSizeCasting(a5) && IOSurfaceGetBytesPerElement(a5)) {
      MTLReportFailure();
    }
  }
  unint64_t v23 = *(void *)v15;
  if ((unint64_t)(*(void *)v15 - 7) < 0xFFFFFFFFFFFFFFFELL) {
    uint64_t v24 = 1;
  }
  else {
    uint64_t v24 = 6;
  }
  char v25 = (unint64_t)(*(void *)v15 - 7) < 0xFFFFFFFFFFFFFFFELL || v18;
  if ((v25 & 1) == 0) {
    -[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]();
  }
  *(void *)&a8->var0.var0 = 130;
  a8->var0.var2 = *v20;
  a8->var0.var3 = *v21;
  if (v23 == 6)
  {
    a8->var0.var4 = *(_WORD *)(v15 + 56) * v24;
    uint64_t v26 = v34;
  }
  else
  {
    uint64_t v26 = v34;
    if (v23 == 3)
    {
      uint64_t v27 = *(void *)(v15 + 56);
    }
    else
    {
      if (v23 == 1)
      {
        a8->var0.var3 = *(void *)(v15 + 56);
        goto LABEL_36;
      }
      uint64_t v27 = *(void *)(v15 + 32);
    }
    a8->var0.var4 = v27;
  }
LABEL_36:
  a8->var0.var6 = v24;
  a8->var0.var7 = *(void *)(v15 + 40);
  a8->var0.var9 = 0;
  a8->var0.var10 = 0;
  a8->var0.var16.var1.var0 = IOSurfaceGetID(a5);
  a8->var0.var16.var1.var1 = v35;
  a8->var0.var16.var1.var2 = a7;
  a8->var0.var16.var1.var3 = 0;
  uint64_t v28 = [(IOGPUMetalResource *)self initWithDevice:v26 options:*(void *)(v15 + 112) args:a8 argsSize:a9];
  v29 = v28;
  if (v28)
  {
    v28->_textureType = *(void *)v15;
    v28->_width = *(void *)(v15 + 16);
    v28->_height = *(void *)(v15 + 24);
    v28->_depth = *(void *)(v15 + 32);
    v28->_mipmapLevelCount = *(void *)(v15 + 40);
    v28->_sampleCount = *(void *)(v15 + 48);
    v28->_arrayLength = *(void *)(v15 + 56);
    v28->_numFaces = v24;
    v28->_pixelFormat = *(void *)(v15 + 8);
    v28->_usage = *(void *)(v15 + 176);
    unint64_t v30 = *(void *)(v15 + 72);
    if (v30 && !*(unsigned char *)(v15 + 80)) {
      -[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]();
    }
    v28->_rotation = v30;
    v28->_swizzle = *(_DWORD *)(v15 + 84);
    v28->_writeSwizzleEnabled = *(unsigned char *)(v15 + 88);
    v28->_shareable = v18;
    if (v18) {
      *(void *)&v28->super._anon_50[40] = IOSurfaceCopyValue(a5, (CFStringRef)*MEMORY[0x263F0EE28]);
    }
    v29->_framebufferOnly = *(unsigned char *)(v15 + 80);
    CFRetain(a5);
    v29->_iosurface = a5;
    v29->_iosurfacePlane = v35;
    v29->_isDrawable = *(unsigned char *)(v15 + 81);
    v29->super._res.info.iosurface = a5;
    *((unsigned char *)&v29->super._res.var1 + 3) = a7;
    *(void *)&v29->super._res.var0 = IOSurfaceGetAllocSize(a5) & 0xFFFFFFFFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&v29->super._res.var1 + 3) << 56);
    v29->_allowGPUOptimizedContents = *(unsigned char *)(v15 + 128);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [v26 deviceRef];
      [v26 registryID];
      IOGPUDeviceTraceEvent();
    }
  }
  return v29;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (BOOL)allowGPUOptimizedContents
{
  return self->_allowGPUOptimizedContents;
}

- (unint64_t)iosurfacePlane
{
  return self->_iosurfacePlane;
}

- (IOGPUMetalTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemPointer:(void *)a5 sysMemSize:(unint64_t)a6 sysMemLength:(unint64_t)a7 sysMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)aBlock
{
  uint64_t v17 = [a4 descriptorPrivate];
  uint64_t v18 = *(void *)(v17 + 112);
  unint64_t v25 = *(void *)v17;
  +[IOGPUMetalTexture initNewTextureDataWithDevice:a3 descriptor:a4 sysMemSize:a6 sysMemRowBytes:a8 vidMemSize:0 vidMemRowBytes:0 args:a9];
  a9->var0.var0 = 128;
  a9->var0.var16.var0.var0 = (unint64_t)a5;
  a9->var0.var16.var0.var1 = (unint64_t)a5;
  unint64_t v19 = [(IOGPUMetalResource *)self initWithDevice:a3 options:v18 args:a9 argsSize:a10];
  unint64_t v20 = v19;
  if (v19)
  {
    v19->_textureType = *(void *)v17;
    unint64_t v21 = *(void *)(v17 + 8);
    v19->_width = *(void *)(v17 + 16);
    v19->_height = *(void *)(v17 + 24);
    v19->_depth = *(void *)(v17 + 32);
    v19->_mipmapLevelCount = *(void *)(v17 + 40);
    v19->_sampleCount = *(void *)(v17 + 48);
    v19->_arrayLength = *(void *)(v17 + 56);
    uint64_t v22 = 6;
    if (v25 - 5 >= 2) {
      uint64_t v22 = 1;
    }
    v19->_numFaces = v22;
    v19->_pixelFormat = v21;
    v19->_usage = *(void *)(v17 + 176);
    if (*(void *)(v17 + 72)) {
      -[IOGPUMetalTexture initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:]();
    }
    v19->_rotation = 0;
    v19->_swizzle = *(_DWORD *)(v17 + 84);
    v19->_writeSwizzleEnabled = *(unsigned char *)(v17 + 88);
    v19->_shareable = 0;
    if (*(unsigned char *)(v17 + 80)) {
      -[IOGPUMetalTexture initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:]();
    }
    v19->_framebufferOnly = 0;
    v19->_isDrawable = *(unsigned char *)(v17 + 81);
    if (aBlock)
    {
      v19->_NSUInteger length = a7;
      v19->_pointer = a5;
      v19->_deallocator = _Block_copy(aBlock);
    }
    v20->_allowGPUOptimizedContents = *(unsigned char *)(v17 + 128);
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [a3 deviceRef];
      [a3 registryID];
      IOGPUDeviceTraceEvent();
    }
  }
  return v20;
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
}

- (void)initWithHeap:resource:offset:length:device:descriptor:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]", "IOGPUMetalTexture.m", 1263, "descriptorPrivate->framebufferOnly == NO");
}

- (id)formattedDescription:(unint64_t)a3
{
  v18[84] = *MEMORY[0x263EF8340];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  long long v6 = [(IOGPUMetalResource *)self retainedLabel];
  v7 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)IOGPUMetalTexture;
  id v8 = [(IOGPUMetalTexture *)&v17 description];
  v18[0] = v5;
  v18[1] = @"label =";
  if (v6) {
    v9 = v6;
  }
  else {
    v9 = @"<none>";
  }
  v18[2] = v9;
  v18[3] = v5;
  v18[4] = @"textureType =";
  v18[5] = MTLTextureTypeString();
  v18[6] = v5;
  v18[7] = @"pixelFormat =";
  v18[8] = [NSString stringWithUTF8String:MTLPixelFormatGetName()];
  v18[9] = v5;
  v18[10] = @"width =";
  v18[11] = [NSNumber numberWithUnsignedInteger:self->_width];
  v18[12] = v5;
  v18[13] = @"height =";
  v18[14] = [NSNumber numberWithUnsignedInteger:self->_height];
  v18[15] = v5;
  v18[16] = @"depth =";
  v18[17] = [NSNumber numberWithUnsignedInteger:self->_depth];
  v18[18] = v5;
  v18[19] = @"arrayLength =";
  v18[20] = [NSNumber numberWithUnsignedInteger:self->_arrayLength];
  v18[21] = v5;
  v18[22] = @"mipmapLevelCount =";
  v18[23] = [NSNumber numberWithUnsignedInteger:self->_mipmapLevelCount];
  v18[24] = v5;
  v18[25] = @"sampleCount =";
  v18[26] = [NSNumber numberWithUnsignedInteger:self->_sampleCount];
  v18[27] = v5;
  v18[28] = @"cpuCacheMode =";
  v18[29] = MTLCPUCacheModeString();
  v18[30] = v5;
  v18[31] = @"storageMode =";
  v18[32] = MTLStorageModeString();
  v18[33] = v5;
  v18[34] = @"hazardTrackingMode =";
  [(IOGPUMetalTexture *)self hazardTrackingMode];
  v18[35] = MTLHazardTrackingModeString();
  v18[36] = v5;
  v18[37] = @"resourceOptions =";
  [(IOGPUMetalResource *)self resourceOptions];
  v18[38] = MTLResourceOptionsString();
  v18[39] = v5;
  v18[40] = @"usage =";
  v18[41] = MTLTextureUsageString();
  v18[42] = v5;
  v18[43] = @"shareable =";
  v18[44] = [NSNumber numberWithBool:self->_shareable];
  v18[45] = v5;
  v18[46] = @"framebufferOnly =";
  v18[47] = [NSNumber numberWithBool:self->_framebufferOnly];
  v18[48] = v5;
  v18[49] = @"purgeableState =";
  v18[50] = MTLPurgeableStateString();
  v18[51] = v5;
  v18[52] = @"swizzle =";
  v18[53] = MTLTextureSwizzleString();
  v18[54] = v5;
  v18[55] = @"isCompressed =";
  v18[56] = [NSNumber numberWithBool:self->_isCompressed];
  v18[57] = v5;
  v18[58] = @"parentTexture =";
  parentTexture = self->_parentTexture;
  if (parentTexture) {
    uint64_t v11 = [(IOGPUMetalTexture *)parentTexture formattedDescription:v4];
  }
  else {
    uint64_t v11 = @"<null>";
  }
  v18[59] = v11;
  v18[60] = v5;
  v18[61] = @"parentRelativeLevel =";
  v18[62] = [NSNumber numberWithUnsignedInteger:self->_parentRelativeLevel];
  v18[63] = v5;
  v18[64] = @"parentRelativeSlice =";
  v18[65] = [NSNumber numberWithUnsignedInteger:self->_parentRelativeSlice];
  v18[66] = v5;
  v18[67] = @"buffer =";
  uint64_t v12 = [(IOGPUMetalTexture *)self buffer];
  if (!v12) {
    uint64_t v12 = (IOGPUMetalBuffer *)[MEMORY[0x263EFF9D0] null];
  }
  v18[68] = v12;
  v18[69] = v5;
  v18[70] = @"bufferOffset =";
  v18[71] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IOGPUMetalTexture bufferOffset](self, "bufferOffset"));
  v18[72] = v5;
  v18[73] = @"bufferBytesPerRow =";
  v18[74] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IOGPUMetalTexture bufferBytesPerRow](self, "bufferBytesPerRow"));
  v18[75] = v5;
  v18[76] = @"iosurface =";
  v18[77] = objc_msgSend(NSString, "stringWithFormat:", @"%p", self->_iosurface);
  v18[78] = v5;
  v18[79] = @"iosurfacePlane =";
  v18[80] = [NSNumber numberWithUnsignedInteger:self->_iosurfacePlane];
  v18[81] = v5;
  BOOL allowGPUOptimizedContents = self->_allowGPUOptimizedContents;
  v18[82] = @"allowGPUOptimizedContents =";
  if (allowGPUOptimizedContents) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  v18[83] = v14;
  uint64_t v15 = (void *)[v7 stringWithFormat:@"%@%@", v8, objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v18, 84), "componentsJoinedByString:", @" "];

  return v15;
}

- (id)description
{
  return [(IOGPUMetalTexture *)self formattedDescription:0];
}

- (IOGPUMetalResource)rootResource
{
  parentTexture = self->_parentTexture;
  if (!parentTexture) {
    return &self->_buffer->super;
  }
  return &parentTexture->super;
}

- (BOOL)isAliasable
{
  buffer = self->_buffer;
  if (buffer) {
    return [buffer isAliasable];
  }
  buffer = self->_parentTexture;
  if (buffer) {
    return [buffer isAliasable];
  }
  else {
    return self->super._anon_50[168] == 0;
  }
}

- (id)newSharedTextureHandle
{
  if (!self->_shareable) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x263F12A08]);
  iosurface = self->_iosurface;
  uint64_t v5 = [(IOGPUMetalResource *)self label];
  return (id)[v3 initWithIOSurface:iosurface label:v5];
}

- (BOOL)isShareable
{
  return self->_shareable;
}

- (IOGPUMetalTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  LOBYTE(v5) = 0;
  return -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, *((void *)a3 + 44), 0, *((void *)a3 + 51), 0, *((void *)a3 + 53) * *((void *)a3 + 54), [a3 swizzle], v5);
}

- (IOGPUMetalTexture)initWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  LOBYTE(v8) = 1;
  return -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6, 1, a7, 1, [a3 swizzle], v8);
}

- (IOGPUMetalTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8
{
  LOBYTE(v9) = 0;
  return -[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, *(unsigned int *)&a8, v9);
}

- (IOGPUMetalTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  BYTE4(v11) = 1;
  LODWORD(v11) = a10;
  return -[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:](self, "initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:", a3, a4, a5, a6, a7, a8, a9, v11);
}

- (unsigned)swizzleKey
{
  return self->_swizzle;
}

- (void)copyFromSlice:(unint64_t)a3 mipmapLevel:(unint64_t)a4 origin:(id *)a5 size:(id *)a6 toPixels:(void *)a7 rowBytes:(unint64_t)a8 imageBytes:(unint64_t)a9
{
  *(void *)uint64_t v11 = a5->var2;
  long long v9 = *(_OWORD *)&a5->var0;
  *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)&v11[8] = *a6;
  v10[0] = v9;
  v10[1] = *(_OWORD *)v11;
  v10[2] = *(_OWORD *)&v11[16];
  v10[3] = v9;
  [(IOGPUMetalTexture *)self getBytes:a7 bytesPerRow:a8 bytesPerImage:a9 fromRegion:v10 mipmapLevel:a4 slice:a3];
}

- (void)copyFromPixels:(const void *)a3 rowBytes:(unint64_t)a4 imageBytes:(unint64_t)a5 toSlice:(unint64_t)a6 mipmapLevel:(unint64_t)a7 origin:(id *)a8 size:(id *)a9
{
  *(void *)uint64_t v11 = a8->var2;
  long long v9 = *(_OWORD *)&a8->var0;
  *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)&v11[8] = *a9;
  v10[0] = v9;
  v10[1] = *(_OWORD *)v11;
  v10[2] = *(_OWORD *)&v11[16];
  v10[3] = v9;
  [(IOGPUMetalTexture *)self replaceRegion:v10 mipmapLevel:a7 slice:a6 withBytes:a3 bytesPerRow:a4 bytesPerImage:a5];
}

- (__CFArray)copyAnnotations
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  [(IOGPUMetalResource *)self annotateResource:Mutable];
  if (self->_framebufferOnly) {
    unint64_t v4 = @"Renderbuffer";
  }
  else {
    unint64_t v4 = @"Texture";
  }
  CFDictionaryAddValue(Mutable, @"Type", v4);
  uint64_t v5 = (void *)MEMORY[0x21D4AEE90]();
  long long v6 = CFStringCreateMutable(0, 512);
  CFStringAppendFormat(v6, 0, @"%s", "IOGPUMetalTexture");
  unint64_t textureType = self->_textureType;
  if (textureType >= 0xA)
  {
    while (1)
LABEL_60:
      MTLReleaseAssertionFailure();
  }
  CFStringAppendFormat(v6, 0, @", %s", off_26441A840[textureType]);
  switch(self->_textureType)
  {
    case 0uLL:
    case 1uLL:
    case 9uLL:
      CFStringAppendFormat(v6, 0, @", %ld", self->_width);
      goto LABEL_11;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      CFStringAppendFormat(v6, 0, @", %ld x %ld", self->_width, self->_height);
      goto LABEL_11;
    case 7uLL:
      unint64_t depth = self->_depth;
      goto LABEL_10;
    case 8uLL:
      unint64_t depth = self->_arrayLength;
LABEL_10:
      CFStringAppendFormat(v6, 0, @", %ld x %ld x %ld", self->_width, self->_height, depth);
LABEL_11:
      uint64_t Name = MTLPixelFormatGetName();
      CFStringAppendFormat(v6, 0, @", %s", Name + 14);
      if (self->_mipmapLevelCount >= 2) {
        CFStringAppendFormat(v6, 0, @", %d mipmaps", self->_mipmapLevelCount);
      }
      if (self->_arrayLength >= 2)
      {
        if (self->_textureType - 2 >= 6) {
          p_unint64_t depth = &self->_depth;
        }
        else {
          p_unint64_t depth = &self->_height;
        }
        CFStringAppendFormat(v6, 0, @", %d array slices", *p_depth);
      }
      if (self->_sampleCount >= 2) {
        CFStringAppendFormat(v6, 0, @", %d samples", self->_sampleCount);
      }
      uint64_t v11 = (void *)[MEMORY[0x263F089D8] string];
      uint64_t v12 = v11;
      unint64_t usage = self->_usage;
      if (!usage)
      {
        [v11 appendString:@" none"];
        unint64_t usage = self->_usage;
      }
      if ((~(_BYTE)usage & 3) == 0)
      {
        uint64_t v14 = @" srw";
LABEL_28:
        [v12 appendString:v14];
        goto LABEL_29;
      }
      if (usage)
      {
        [v12 appendString:@" sr"];
        unint64_t usage = self->_usage;
      }
      if ((usage & 2) != 0)
      {
        uint64_t v14 = @" sw";
        goto LABEL_28;
      }
LABEL_29:
      unint64_t v15 = self->_usage;
      if ((v15 & 4) != 0)
      {
        [v12 appendString:@" rt"];
        unint64_t v15 = self->_usage;
        if ((v15 & 0x10) == 0)
        {
LABEL_31:
          if ((v15 & 0x4000) == 0) {
            goto LABEL_32;
          }
          goto LABEL_38;
        }
      }
      else if ((v15 & 0x10) == 0)
      {
        goto LABEL_31;
      }
      [v12 appendString:@" pfv"];
      unint64_t v15 = self->_usage;
      if ((v15 & 0x4000) == 0)
      {
LABEL_32:
        if ((v15 & 0x10000) == 0) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
LABEL_38:
      [v12 appendString:@" nca"];
      unint64_t v15 = self->_usage;
      if ((v15 & 0x10000) != 0)
      {
LABEL_33:
        [v12 appendString:@" bwo"];
        unint64_t v15 = self->_usage;
      }
LABEL_34:
      CFStringAppendFormat(v6, 0, @", usage (%05x)%@", v15, v12);
      if (objc_loadWeak((id *)&self->super.weakSelf)) {
        CFStringAppendFormat(v6, 0, @", handle (%05llx)", [(IOGPUMetalTexture *)self gpuResourceID]);
      }
      else {
        CFStringAppend(v6, @", dead");
      }
      if (self->_length) {
        CFStringAppendFormat(v6, 0, @", size %lluB", self->_length);
      }
      if (*(void *)&self->super._anon_50[136]) {
        CFStringAppendFormat(v6, 0, @", heap (+%llx)", *(void *)&self->super._anon_50[152]);
      }
      if (self->_primaryBuffer) {
        CFStringAppendFormat(v6, 0, @", suballoc (+%llx)", self->_primaryBufferOffset);
      }
      unsigned int swizzle = self->_swizzle;
      if (swizzle != 84148994) {
        CFStringAppendFormat(v6, 0, @", swizzle %c%c%c%c", copyAnnotations_kLetter[swizzle % 6u], copyAnnotations_kLetter[BYTE1(swizzle) % 6u], copyAnnotations_kLetter[BYTE2(swizzle) % 6u], copyAnnotations_kLetter[(HIBYTE(swizzle) - 6 * ((171 * HIBYTE(swizzle)) >> 10))]);
      }
      parentTexture = self->_parentTexture;
      if (parentTexture)
      {
        uint64_t parentRelativeSlice_low = LODWORD(self->_parentRelativeSlice);
        uint64_t parentRelativeLevel_low = LODWORD(self->_parentRelativeLevel);
        id Weak = objc_loadWeak((id *)&parentTexture->super.weakSelf);
        if (Weak) {
          CFStringAppendFormat(v6, 0, @", view (parent %05llx, slice %d, level %d)", [Weak gpuResourceID], parentRelativeSlice_low, parentRelativeLevel_low);
        }
        else {
          CFStringAppendFormat(v6, 0, @", view (parent dead, slice %d, level %d)", parentRelativeSlice_low, parentRelativeLevel_low, v28);
        }
      }
      buffer = self->_buffer;
      if (buffer)
      {
        id v22 = objc_loadWeak((id *)&buffer->super.weakSelf);
        if (v22) {
          CFStringAppendFormat(v6, 0, @", buffer (parent %012llx, offset %lluB, stride %lluB)", [v22 gpuAddress], self->_bufferOffset, self->_bufferBytesPerRow);
        }
        else {
          CFStringAppendFormat(v6, 0, @", buffer (parent dead, offset %lluB, stride %lluB)", self->_bufferOffset, self->_bufferBytesPerRow, v28);
        }
      }
      id v23 = [(IOGPUMetalResource *)self retainedLabel];
      if (v23)
      {
        uint64_t v24 = v23;
        CFStringAppendFormat(v6, 0, @", \"%s\"", [v23 UTF8String]);
      }
      CFDictionaryAddValue(Mutable, @"Description", v6);
      CFRelease(v6);
      unint64_t v25 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      uint64_t v26 = [(IOGPUMetalResource *)self copyAnnotationDictionary:*(void *)&self->super._anon_50[8] obj_key_name:@"OpenGLObjects" obj_dict:Mutable];
      CFArrayAppendValue(v25, v26);
      CFRelease(v26);
      CFRelease(Mutable);
      return v25;
    default:
      goto LABEL_60;
  }
}

- (BOOL)isSparse
{
  objc_super v2 = [(IOGPUMetalResource *)self heap];
  if (v2) {
    LOBYTE(v2) = [(MTLHeap *)v2 type] == 2;
  }
  return (char)v2;
}

- (int64_t)compressionFeedback
{
  return 0;
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  if (self->_iosurface)
  {
    return MEMORY[0x270EF4E60]();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)IOGPUMetalTexture;
    return [(IOGPUMetalResource *)&v4 setOwnerWithIdentity:*(void *)&a3];
  }
}

- (unint64_t)parentRelativeLevel
{
  return self->_parentRelativeLevel;
}

- (unint64_t)parentRelativeSlice
{
  return self->_parentRelativeSlice;
}

- (unint64_t)rotation
{
  return self->_rotation;
}

- (BOOL)isCompressed
{
  return self->_isCompressed;
}

- (BOOL)isFramebufferOnly
{
  return self->_framebufferOnly;
}

- (BOOL)isDrawable
{
  return self->_isDrawable;
}

- (BOOL)rootResourceIsSuballocatedBuffer
{
  return self->_rootResourceIsSuballocatedBuffer;
}

- (void)parentTexture
{
  __assert_rtn("-[IOGPUMetalTexture parentTexture]", "IOGPUMetalTexture.m", 136, "(_parentTexture == nil) || [_parentTexture isKindOfClass:[IOGPUMetalTexture class]]");
}

- (void)buffer
{
  __assert_rtn("-[IOGPUMetalTexture buffer]", "IOGPUMetalTexture.m", 142, "(_buffer == nil) || [_buffer isKindOfClass:[IOGPUMetalBuffer class]]");
}

- (void)initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:]", "IOGPUMetalTexture.m", 491, "descriptorPrivate->framebufferOnly == NO");
}

- (void)initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:]", "IOGPUMetalTexture.m", 478, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:]", "IOGPUMetalTexture.m", 561, "descriptorPrivate->framebufferOnly == NO");
}

- (void)initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:sysMemPointer:sysMemSize:sysMemLength:sysMemRowBytes:args:argsSize:deallocator:]", "IOGPUMetalTexture.m", 551, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithDevice:descriptor:iosurface:plane:field:args:argsSize:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", "IOGPUMetalTexture.m", 736, "descriptorPrivate->rotation == MTLTextureRotation0Degrees || descriptorPrivate->framebufferOnly");
}

- (void)initWithDevice:descriptor:iosurface:plane:field:args:argsSize:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", "IOGPUMetalTexture.m", 681, "carriesComplexTexture || numFaces == 1");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 855, "texture != nil");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 935, "_iosurface == _res.info.iosurface");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.3()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 902, "_usage != MTLTextureUsageUnknown");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.4()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 876, "sliceRange.length == 1");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.5()
{
  __assert_rtn("-[IOGPUMetalTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:]", "IOGPUMetalTexture.m", 875, "levelRange.length == 1");
}

- (void)initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:.cold.6()
{
}

- (void)initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]", "IOGPUMetalTexture.m", 966, "buffer != nil");
}

- (void)initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]", "IOGPUMetalTexture.m", 1094, "descriptorPrivate->framebufferOnly == NO");
}

- (void)initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:.cold.3()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]", "IOGPUMetalTexture.m", 1084, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:.cold.4()
{
}

- (void)initWithBuffer:descriptor:offset:bytesPerRow:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]", "IOGPUMetalTexture.m", 1144, "buffer != nil");
}

- (void)initWithBuffer:descriptor:offset:bytesPerRow:.cold.2()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]", "IOGPUMetalTexture.m", 1182, "descriptorPrivate->framebufferOnly == NO");
}

- (void)initWithBuffer:descriptor:offset:bytesPerRow:.cold.3()
{
  __assert_rtn("-[IOGPUMetalTexture initWithBuffer:descriptor:offset:bytesPerRow:]", "IOGPUMetalTexture.m", 1172, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithBuffer:descriptor:offset:bytesPerRow:.cold.4()
{
}

- (void)initWithHeap:resource:offset:length:device:descriptor:.cold.1()
{
  __assert_rtn("-[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]", "IOGPUMetalTexture.m", 1219, "heap != nil");
}

- (void)initWithHeap:resource:offset:length:device:descriptor:.cold.3()
{
  __assert_rtn("-[IOGPUMetalTexture initWithHeap:resource:offset:length:device:descriptor:]", "IOGPUMetalTexture.m", 1253, "descriptorPrivate->rotation == MTLTextureRotation0Degrees");
}

- (void)initWithHeap:resource:offset:length:device:descriptor:.cold.4()
{
}

@end