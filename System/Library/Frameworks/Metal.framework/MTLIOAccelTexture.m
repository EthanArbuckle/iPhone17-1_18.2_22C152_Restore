@interface MTLIOAccelTexture
+ (void)initNewTextureDataWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9;
- ($14D77461FF5D83CAEC4252578BA76F85)swizzle;
- (BOOL)allowGPUOptimizedContents;
- (BOOL)isAliasable;
- (BOOL)isCompressed;
- (BOOL)isDrawable;
- (BOOL)isFramebufferOnly;
- (BOOL)isShareable;
- (BOOL)isSparse;
- (BOOL)rootResourceIsSuballocatedBuffer;
- (MTLBuffer)buffer;
- (MTLIOAccelTexture)initWithBuffer:(id)a3 descriptor:(id)a4 offset:(unint64_t)a5 bytesPerRow:(unint64_t)a6;
- (MTLIOAccelTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10;
- (MTLIOAccelTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10 isStrideTexture:(BOOL)a11;
- (MTLIOAccelTexture)initWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7;
- (MTLIOAccelTexture)initWithDevice:(id)a3 descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unsigned int)a6 field:(unsigned int)a7 args:(IOAccelNewResourceArgs *)a8 argsSize:(unsigned int)a9;
- (MTLIOAccelTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemPointer:(void *)a5 sysMemSize:(unint64_t)a6 sysMemLength:(unint64_t)a7 sysMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)aBlock;
- (MTLIOAccelTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10;
- (MTLIOAccelTexture)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 device:(id)a7 descriptor:(id)a8;
- (MTLIOAccelTexture)initWithMasterBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 descriptor:(id)a8 sysMemRowBytes:(unint64_t)a9 vidMemSize:(unint64_t)a10 vidMemRowBytes:(unint64_t)a11 args:(IOAccelNewResourceArgs *)a12 argsSize:(unsigned int)a13;
- (MTLIOAccelTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4;
- (MTLIOAccelTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7;
- (MTLIOAccelTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8;
- (MTLIOAccelTexture)initWithTextureInternal:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 compressedView:(BOOL)a9;
- (MTLResource)rootResource;
- (MTLTexture)parentTexture;
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
- (void)copyFromPixels:(const void *)a3 rowBytes:(unint64_t)a4 imageBytes:(unint64_t)a5 toSlice:(unint64_t)a6 mipmapLevel:(unint64_t)a7 origin:(id *)a8 size:(id *)a9;
- (void)copyFromSlice:(unint64_t)a3 mipmapLevel:(unint64_t)a4 origin:(id *)a5 size:(id *)a6 toPixels:(void *)a7 rowBytes:(unint64_t)a8 imageBytes:(unint64_t)a9;
- (void)dealloc;
- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6;
- (void)makeAliasable;
- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6;
@end

@implementation MTLIOAccelTexture

- (id)formattedDescription:(unint64_t)a3
{
  v18[84] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = [(MTLIOAccelResource *)self retainedLabel];
  v7 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)MTLIOAccelTexture;
  id v8 = [(MTLIOAccelTexture *)&v17 description];
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
  v18[5] = MTLTextureTypeString(self->_textureType);
  v18[6] = v5;
  v18[7] = @"pixelFormat =";
  v18[8] = [NSString stringWithUTF8String:MTLPixelFormatGetName(self->_pixelFormat)];
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
  v18[29] = MTLCPUCacheModeString(*(void *)&self->super._anon_50[112]);
  v18[30] = v5;
  v18[31] = @"storageMode =";
  v18[32] = MTLStorageModeString(*(void *)&self->super._anon_50[104]);
  v18[33] = v5;
  v18[34] = @"hazardTrackingMode =";
  v18[35] = MTLHazardTrackingModeString([(MTLIOAccelTexture *)self hazardTrackingMode]);
  v18[36] = v5;
  v18[37] = @"resourceOptions =";
  v18[38] = MTLResourceOptionsString([(MTLIOAccelResource *)self resourceOptions]);
  v18[39] = v5;
  v18[40] = @"usage =";
  v18[41] = MTLTextureUsageString(self->_usage);
  v18[42] = v5;
  v18[43] = @"shareable =";
  v18[44] = [NSNumber numberWithBool:self->_shareable];
  v18[45] = v5;
  v18[46] = @"framebufferOnly =";
  v18[47] = [NSNumber numberWithBool:self->_framebufferOnly];
  v18[48] = v5;
  v18[49] = @"purgeableState =";
  v18[50] = MTLPurgeableStateString(*(void *)&self->super._anon_50[128]);
  v18[51] = v5;
  v18[52] = @"swizzle =";
  v18[53] = MTLTextureSwizzleString(self->_swizzle);
  v18[54] = v5;
  v18[55] = @"isCompressed =";
  v18[56] = [NSNumber numberWithBool:self->_isCompressed];
  v18[57] = v5;
  v18[58] = @"parentTexture =";
  parentTexture = self->_parentTexture;
  if (parentTexture) {
    v11 = [(MTLIOAccelTexture *)parentTexture formattedDescription:v4];
  }
  else {
    v11 = @"<null>";
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
  v12 = [(MTLIOAccelTexture *)self buffer];
  if (!v12) {
    v12 = (MTLBuffer *)[MEMORY[0x1E4F1CA98] null];
  }
  v18[68] = v12;
  v18[69] = v5;
  v18[70] = @"bufferOffset =";
  v18[71] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MTLIOAccelTexture bufferOffset](self, "bufferOffset"));
  v18[72] = v5;
  v18[73] = @"bufferBytesPerRow =";
  v18[74] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MTLIOAccelTexture bufferBytesPerRow](self, "bufferBytesPerRow"));
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
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  v18[83] = v14;
  v15 = (void *)[v7 stringWithFormat:@"%@%@", v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 84), "componentsJoinedByString:", @" "];

  return v15;
}

- (id)description
{
  return [(MTLIOAccelTexture *)self formattedDescription:0];
}

- (MTLTexture)parentTexture
{
  return (MTLTexture *)self->_parentTexture;
}

- (MTLBuffer)buffer
{
  return (MTLBuffer *)self->_buffer;
}

- (MTLResource)rootResource
{
  parentTexture = self->_parentTexture;
  if (!parentTexture) {
    return (MTLResource *)self->_buffer;
  }
  return (MTLResource *)parentTexture;
}

- (unint64_t)allocatedSize
{
  if (self->_masterBuffer) {
    return self->_length;
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelTexture;
  return [(MTLIOAccelResource *)&v3 allocatedSize];
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
    return self->super._anon_50[192] == 0;
  }
}

- (void)makeAliasable
{
  if (!self->_buffer && !self->_parentTexture)
  {
    v2.receiver = self;
    v2.super_class = (Class)MTLIOAccelTexture;
    [(MTLIOAccelResource *)&v2 makeAliasable];
  }
}

- (id)newSharedTextureHandle
{
  if (!self->_shareable) {
    return 0;
  }
  objc_super v3 = [MTLSharedTextureHandle alloc];
  iosurface = self->_iosurface;
  uint64_t v5 = [(MTLIOAccelResource *)self label];

  return [(MTLSharedTextureHandle *)v3 initWithIOSurface:iosurface label:v5];
}

- (__IOSurface)iosurface
{
  result = self->_iosurface;
  if (!result || self->_shareable) {
    return 0;
  }
  return result;
}

- (BOOL)isShareable
{
  return self->_shareable;
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
  if (*(void *)&self->super._anon_50[160])
  {
    if ((*(void *)&self->super._anon_50[96] & 0xF0) != 0x30)
    {
      [(MTLIOAccelTexture *)self makeAliasable];
      if (!self->_buffer && !self->_parentTexture) {
        [*(id *)&self->super._anon_50[160] deallocHeapSubResource];
      }
    }
  }

  if (self->_rootResourceIsSuballocatedBuffer) {
    [*(id *)&self->super._anon_50[32] deallocBufferSubData:self->_masterBuffer heapIndex:self->_masterHeapIndex bufferIndex:self->_masterBufferIndex bufferOffset:self->_masterBufferOffset length:self->_length];
  }
  iosurface = self->_iosurface;
  if (iosurface) {
    CFRelease(iosurface);
  }
  v5.receiver = self;
  v5.super_class = (Class)MTLIOAccelTexture;
  [(MTLIOAccelResource *)&v5 dealloc];
}

+ (void)initNewTextureDataWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9
{
  *((void *)&a9->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a9->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a9->var0.var8 = 0u;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)&a9->var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  uint64_t v14 = [a4 descriptorPrivate];
  uint64_t v19 = v14;
  if (*(void *)(v14 + 72)) {
    MTLReportFailure(0, "+[MTLIOAccelTexture initNewTextureDataWithDevice:descriptor:sysMemSize:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:]", 400, @"Non IOSurface texture has invalid rotation %u", v15, v16, v17, v18, *(void *)(v14 + 72));
  }
  int v20 = (*(void *)(v19 + 112) & 0xFLL) == 1;
  uint64_t v21 = *(void *)v19;
  int v22 = 6;
  if ((unint64_t)(*(void *)v19 - 5) >= 2) {
    int v22 = 1;
  }
  a9->var0.var0 = (a7 != 0) << 6;
  a9->var0.var1 = v20 << 10;
  a9->var0.var2 = *(void *)(v19 + 16);
  a9->var0.var3 = *(void *)(v19 + 24);
  a9->var0.var13 = *(void *)(v19 + 144);
  if (v21 == 6)
  {
    LODWORD(v23) = *(_DWORD *)(v19 + 56) * v22;
LABEL_12:
    a9->var0.var4 = v23;
    goto LABEL_13;
  }
  if (v21 == 3)
  {
    uint64_t v23 = *(void *)(v19 + 56);
    goto LABEL_12;
  }
  if (v21 != 1)
  {
    uint64_t v23 = *(void *)(v19 + 32);
    goto LABEL_12;
  }
  a9->var0.var3 = *(void *)(v19 + 56);
LABEL_13:
  a9->var0.var6 = a8;
  a9->var0.var7 = a6;
  a9->var0.var8 = v22;
  a9->var0.var9 = *(void *)(v19 + 40);
  a9->var0.var11 = 1;
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  MTLPixelFormatGetInfoForDevice(a3, *(void *)(v19 + 8), (uint64_t)&v24);
  a9->var0.var11 = BYTE8(v25);
  a9->var0.var12 = *(unsigned __int8 *)(v19 + 64) << 6;
  *(_OWORD *)&a9->var0.var16.var0.var0 = 0uLL;
  a9->var0.var16.var0.var2 = a7;
  a9->var0.var16.var0.var3 = a5;
}

- (MTLIOAccelTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemSize:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  uint64_t v17 = [a4 descriptorPrivate];
  unint64_t v23 = *(void *)v17;
  +[MTLIOAccelTexture initNewTextureDataWithDevice:a3 descriptor:a4 sysMemSize:a5 sysMemRowBytes:a6 vidMemSize:a7 vidMemRowBytes:a8 args:a9];
  uint64_t v18 = [(MTLIOAccelResource *)self initWithDevice:a3 options:*(void *)(v17 + 112) args:a9 argsSize:a10];
  uint64_t v19 = v18;
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
    v18->_rotation = 0;
    v18->_swizzle = *(_DWORD *)(v17 + 84);
    v18->_writeSwizzleEnabled = *(unsigned char *)(v17 + 88);
    v18->_isCompressed = 0;
    v18->_shareable = 0;
    v18->_framebufferOnly = 0;
    v18->_isDrawable = *(unsigned char *)(v17 + 81);
    v18->_BOOL allowGPUOptimizedContents = *(unsigned char *)(v17 + 128);
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [a3 deviceRef];
      [a3 registryID];
      IOAccelDeviceTraceEvent();
    }
  }
  return v19;
}

- (MTLIOAccelTexture)initWithDevice:(id)a3 descriptor:(id)a4 sysMemPointer:(void *)a5 sysMemSize:(unint64_t)a6 sysMemLength:(unint64_t)a7 sysMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)aBlock
{
  uint64_t v17 = [a4 descriptorPrivate];
  uint64_t v18 = *(void *)(v17 + 112);
  unint64_t v25 = *(void *)v17;
  +[MTLIOAccelTexture initNewTextureDataWithDevice:a3 descriptor:a4 sysMemSize:a6 sysMemRowBytes:a8 vidMemSize:0 vidMemRowBytes:0 args:a9];
  a9->var0.var0 = 128;
  a9->var0.var16.var0.var0 = (unint64_t)a5;
  a9->var0.var16.var0.var1 = (unint64_t)a5;
  uint64_t v19 = [(MTLIOAccelResource *)self initWithDevice:a3 options:v18 args:a9 argsSize:a10];
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
    uint64_t v22 = 6;
    v19->_arrayLength = *(void *)(v17 + 56);
    if (v25 - 5 >= 2) {
      uint64_t v22 = 1;
    }
    v19->_numFaces = v22;
    v19->_pixelFormat = v21;
    v19->_usage = *(void *)(v17 + 176);
    v19->_rotation = 0;
    v19->_swizzle = *(_DWORD *)(v17 + 84);
    v19->_writeSwizzleEnabled = *(unsigned char *)(v17 + 88);
    v19->_shareable = 0;
    v19->_framebufferOnly = 0;
    v19->_isDrawable = *(unsigned char *)(v17 + 81);
    if (aBlock)
    {
      v19->_length = a7;
      v19->_pointer = a5;
      v19->_deallocator = _Block_copy(aBlock);
    }
    v20->_BOOL allowGPUOptimizedContents = *(unsigned char *)(v17 + 128);
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [a3 deviceRef];
      [a3 registryID];
      IOAccelDeviceTraceEvent();
    }
  }
  return v20;
}

- (MTLIOAccelTexture)initWithDevice:(id)a3 descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unsigned int)a6 field:(unsigned int)a7 args:(IOAccelNewResourceArgs *)a8 argsSize:(unsigned int)a9
{
  uint64_t v10 = *(void *)&a6;
  *((void *)&a8->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a8->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a8->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a8->var0.var8 = 0u;
  *(_OWORD *)&a8->var0.var14 = 0u;
  *(_OWORD *)&a8->var0.var0 = 0u;
  *(_OWORD *)&a8->var0.var6 = 0u;
  uint64_t v14 = [a4 descriptorPrivate];
  uint64_t v19 = v14;
  if (*(void *)(v14 + 72) >= 5uLL) {
    MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 630, @"IOSurface texture has invalid rotation %u", v15, v16, v17, v18, *(void *)(v14 + 72));
  }
  unint64_t v20 = (void *)IOSurfaceCopyValue(a5, (CFStringRef)*MEMORY[0x1E4F2F080]);
  if (v20)
  {
    unint64_t v21 = v20;
    BOOL v22 = [v20 objectForKeyedSubscript:kMetalRegistryID] != 0;
  }
  else
  {
    BOOL v22 = 0;
  }
  uint64_t v76 = 0;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v73 = 0u;
  MTLPixelFormatGetInfoForDevice(a3, *(void *)(v19 + 8), (uint64_t)&v73);
  unint64_t v27 = *(void *)(v19 + 72);
  if (v27 <= 4 && ((1 << v27) & 0x1A) != 0)
  {
    v28 = (unint64_t *)(v19 + 16);
    v29 = (unint64_t *)(v19 + 24);
  }
  else
  {
    v29 = (unint64_t *)(v19 + 16);
    v28 = (unint64_t *)(v19 + 24);
  }
  unint64_t v30 = *v29;
  unint64_t v31 = *v28;
  if (!a5) {
    MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 666, @"IOSurface argument must not be NULL", v23, v24, v25, v26, v63);
  }
  BOOL v64 = v22;
  if (IOSurfaceGetPlaneCount(a5)) {
    char v32 = 1;
  }
  else {
    char v32 = v22;
  }
  if ((v32 & 1) == 0)
  {
    BaseAddress = IOSurfaceGetBaseAddress(a5);
    size_t BytesPerRow = IOSurfaceGetBytesPerRow(a5);
    _mtlValidateStrideTextureParameters(a3, a4, v30, (uint64_t)BaseAddress, BytesPerRow, 1);
    if (v10) {
      MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 672, @"IOSurface is non-planar, but plane %u specified", v35, v36, v37, v38, v10);
    }
    uint64_t v72 = 0;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v69 = 0u;
    memset(v68, 0, sizeof(v68));
    MTLGetTextureLevelInfoForDeviceWithOptions(a3, [a4 pixelFormat], v30, v31, 1uLL, 1, 0, 0, (uint64_t *)v68);
    size_t v39 = v71;
    if (v39 > IOSurfaceGetBytesPerRow(a5)) {
      MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 682, @"Descriptor rowBytes (%lu) > IOSurface rowBytes (%lu)", v40, v41, v42, v43, v39);
    }
    size_t v44 = *(void *)(v19 + 56) * *((void *)&v69 + 1);
    size_t Height = IOSurfaceGetHeight(a5);
    if (v44 > IOSurfaceGetElementHeight(a5) * Height) {
      MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 685, @"Descriptor height*arrayLength > IOSurface height", v46, v47, v48, v49, v63);
    }
    if (!IOSurfaceAllowsPixelSizeCasting(a5))
    {
      size_t BytesPerElement = IOSurfaceGetBytesPerElement(a5);
      if (*((void *)&v70 + 1) != BytesPerElement) {
        MTLReportFailure(0, "-[MTLIOAccelTexture initWithDevice:descriptor:iosurface:plane:field:args:argsSize:]", 690, @"Pixel format bytes per pixel doesn't match IOSurface bytes per pixel (size casting disallowed by this IOSurface)", v51, v52, v53, v54, v63);
      }
    }
  }
  id v67 = a3;
  unsigned int v55 = v10;
  unint64_t v56 = *(void *)v19;
  if ((unint64_t)(*(void *)v19 - 5) >= 2) {
    uint64_t v57 = 1;
  }
  else {
    uint64_t v57 = 6;
  }
  *(void *)&a8->var0.var0 = 130;
  a8->var0.var2 = *(void *)(v19 + 16);
  a8->var0.var3 = *(void *)(v19 + 24);
  if (v56 == 6)
  {
    a8->var0.var4 = *(_WORD *)(v19 + 56) * v57;
    unsigned int v58 = a7;
    goto LABEL_36;
  }
  unsigned int v58 = a7;
  if (v56 == 3)
  {
    uint64_t v59 = *(void *)(v19 + 56);
LABEL_35:
    a8->var0.var4 = v59;
    goto LABEL_36;
  }
  if (v56 != 1)
  {
    uint64_t v59 = *(void *)(v19 + 32);
    goto LABEL_35;
  }
  a8->var0.var3 = *(void *)(v19 + 56);
LABEL_36:
  a8->var0.var6 = 0;
  a8->var0.var7 = 0;
  a8->var0.var8 = v57;
  a8->var0.var9 = *(void *)(v19 + 40);
  a8->var0.var11 = BYTE8(v74);
  a8->var0.var12 = 0;
  a8->var0.var16.var1.var0 = IOSurfaceGetID(a5);
  a8->var0.var16.var1.var1 = v55;
  a8->var0.var16.var2.var2 = v58;
  a8->var0.var16.var2.var3 = 0;
  v60 = [(MTLIOAccelResource *)self initWithDevice:v67 options:*(void *)(v19 + 112) args:a8 argsSize:a9];
  v61 = v60;
  if (v60)
  {
    v60->_textureType = *(void *)v19;
    v60->_width = *(void *)(v19 + 16);
    v60->_height = *(void *)(v19 + 24);
    v60->_depth = *(void *)(v19 + 32);
    v60->_mipmapLevelCount = *(void *)(v19 + 40);
    v60->_sampleCount = *(void *)(v19 + 48);
    v60->_arrayLength = *(void *)(v19 + 56);
    v60->_numFaces = v57;
    v60->_pixelFormat = *(void *)(v19 + 8);
    v60->_usage = *(void *)(v19 + 176);
    v60->_rotation = *(void *)(v19 + 72);
    v60->_swizzle = *(_DWORD *)(v19 + 84);
    v60->_writeSwizzleEnabled = *(unsigned char *)(v19 + 88);
    v60->_shareable = v64;
    v60->_framebufferOnly = *(unsigned char *)(v19 + 80);
    CFRetain(a5);
    v61->_iosurface = a5;
    v61->_iosurfacePlane = v55;
    v61->_isDrawable = *(unsigned char *)(v19 + 81);
    v61->super._res.info.iosurface = a5;
    *((unsigned char *)&v61->super._res.var1 + 3) = v58;
    *(void *)&v61->super._res.var0 = IOSurfaceGetAllocSize(a5) & 0xFFFFFFFFFFFFFFLL | ((unint64_t)*((unsigned __int8 *)&v61->super._res.var1 + 3) << 56);
    v61->_BOOL allowGPUOptimizedContents = *(unsigned char *)(v19 + 128);
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [v67 deviceRef];
      [v67 registryID];
      IOAccelDeviceTraceEvent();
    }
  }
  return v61;
}

- (MTLIOAccelTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  LOBYTE(v5) = 0;
  return -[MTLIOAccelTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, *((void *)a3 + 46), 0, *((void *)a3 + 53), 0, *((void *)a3 + 55) * *((void *)a3 + 56), [a3 swizzle], v5);
}

- (MTLIOAccelTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  LOBYTE(v8) = 0;
  return -[MTLIOAccelTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, [a3 swizzle], v8);
}

- (MTLIOAccelTexture)initWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  LOBYTE(v8) = 1;
  return -[MTLIOAccelTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6, 1, a7, 1, [a3 swizzle], v8);
}

- (MTLIOAccelTexture)initWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8
{
  LOBYTE(v9) = 0;
  return -[MTLIOAccelTexture initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:](self, "initWithTextureInternal:pixelFormat:textureType:levels:slices:swizzle:compressedView:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, *(unsigned int *)&a8, v9);
}

- (MTLIOAccelTexture)initWithTextureInternal:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(id)a8 compressedView:(BOOL)a9
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unsigned int v15 = MTLTextureSwizzleChannelsToKey(*(unsigned int *)&a8);
  _mtlValidateMTLTextureSwizzleKey(v15, v16, v17, v18, v19, v20, v21, v22);
  _mtlValidateArgumentsForTextureViewOnDevice((void *)[a3 device], a3, a4, a5, location, length, a7.location, a7.length, a9);
  uint64_t v23 = [(MTLIOAccelResource *)self initWithResource:a3];
  if (v23)
  {
    v23->_parentTexture = (MTLIOAccelTexture *)a3;
    v23->_buffer = (MTLIOAccelBuffer *)*((id *)a3 + 41);
    v23->_parentRelativeLevel = location;
    v23->_parentRelativeSlice = a7.location;
    v23->_bufferOffset = [a3 bufferOffset];
    v23->_buffersize_t BytesPerRow = [a3 bufferBytesPerRow];
    v23->_textureType = a5;
    unint64_t v24 = *((void *)a3 + 50) >> location;
    if (v24 <= 1) {
      unint64_t v24 = 1;
    }
    v23->_width = v24;
    unint64_t v25 = *((void *)a3 + 51) >> location;
    if (v25 <= 1) {
      unint64_t v25 = 1;
    }
    v23->_height = v25;
    unint64_t v26 = *((void *)a3 + 52) >> location;
    if (v26 <= 1) {
      unint64_t v26 = 1;
    }
    v23->_depth = v26;
    v23->_pixelFormat = a4;
    v23->_usage = *((void *)a3 + 48);
    unint64_t v27 = 6;
    if (a5 - 5 >= 2) {
      unint64_t v27 = 1;
    }
    v23->_numFaces = v27;
    v23->_arrayLength = a7.length / v27;
    v23->_mipmapLevelCount = length;
    v23->_sampleCount = *((void *)a3 + 54);
    v23->_rotation = *((void *)a3 + 49);
    v23->_swizzle = v15;
    v23->_writeSwizzleEnabled = *((unsigned char *)a3 + 340);
    if (objc_msgSend((id)objc_msgSend(a3, "device"), "supportsTextureSwizzle")
      && v23->_swizzle != 84148994)
    {
      uint64_t v28 = v23->_usage & ~MTLGetDisallowedTextureUsagesWhenSwizzling([a3 device], v23->_writeSwizzleEnabled);
      v23->_usage = v28;
      _mtlValidateTextureUsage(v28, v29, v30, v31, v32, v33, v34, v35);
    }
    v23->_shareable = 0;
    v23->_framebufferOnly = *((unsigned char *)a3 + 457);
    v23->_iosurface = (__IOSurface *)*((void *)a3 + 44);
    v23->_iosurfacePlane = *((void *)a3 + 45);
    v23->_isDrawable = *((unsigned char *)a3 + 458);
    v23->_BOOL allowGPUOptimizedContents = *((unsigned char *)a3 + 512);
    uint64_t v36 = (id *)((char *)a3 + 32);
    id v37 = v36[26];
    id v38 = v36[27];
    *(void *)&v23->super._anon_50[160] = v37;
    *(void *)&v23->super._anon_50[168] = v38;
    *(_OWORD *)&v23->super._anon_50[176] = *((_OWORD *)v36 + 14);
    v23->super._anon_50[192] = *((unsigned char *)v36 + 240);
    *(void *)&v23->super._anon_50[88] = v36[17];
    *(void *)&v23->super._anon_50[24] = v36[9];
    iosurface = v23->_iosurface;
    if (iosurface) {
      CFRetain(iosurface);
    }
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [*(id *)&v23->super._anon_50[32] deviceRef];
      [*(id *)&v23->super._anon_50[32] registryID];
      IOAccelDeviceTraceEvent();
    }
  }
  return v23;
}

- (MTLIOAccelTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10 isStrideTexture:(BOOL)a11
{
  unsigned int v15 = a3;
  uint64_t v17 = (void *)[a3 device];
  *(_OWORD *)&a9->var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  *(_OWORD *)&a9->var0.var8 = 0u;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)&a9->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var16.var3.var2[1] = 0u;
  *((void *)&a9->var0.var16.var3 + 4) = 0;
  uint64_t v18 = (void *)[a4 descriptorPrivate];
  uint64_t v23 = v18;
  uint64_t v24 = *v18;
  if ((unint64_t)(*v18 - 5) >= 2) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 6;
  }
  uint64_t v45 = v25;
  if (a11)
  {
    _mtlValidateStrideTextureParameters(v17, a4, v18[2], v15[21] + a5, a6, 0);
    unint64_t v26 = [(MTLIOAccelResource *)self initWithResource:v15];
    unint64_t v27 = v26;
    if (!v26) {
      return v27;
    }
    *(void *)&v26->super._anon_50[24] += a5;
    goto LABEL_24;
  }
  uint64_t v28 = v15;
  uint64_t v29 = v17;
  if (v18[9])
  {
    __int16 v43 = v25;
    MTLReportFailure(0, "-[MTLIOAccelTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:]", 1102, @"Buffer texture has invalid rotation %u", v19, v20, v21, v22, v18[9]);
    LOWORD(v25) = v43;
    uint64_t v24 = *v23;
  }
  if (a7) {
    unsigned int v30 = 192;
  }
  else {
    unsigned int v30 = 128;
  }
  a9->var0.var0 = v30;
  a9->var0.var1 = 0;
  a9->var0.var2 = v23[2];
  a9->var0.var3 = v23[3];
  if (v24 == 6)
  {
    a9->var0.var4 = *((_WORD *)v23 + 28) * v25;
    uint64_t v31 = self;
LABEL_18:
    uint64_t v32 = v29;
    goto LABEL_20;
  }
  uint64_t v31 = self;
  if (v24 == 3)
  {
    a9->var0.var4 = v23[7];
    goto LABEL_18;
  }
  uint64_t v32 = v29;
  if (v24 == 1) {
    a9->var0.var3 = v23[7];
  }
  else {
    a9->var0.var4 = v23[4];
  }
LABEL_20:
  unsigned int v15 = v28;
  a9->var0.var6 = a8;
  a9->var0.var7 = a6;
  a9->var0.var8 = v25;
  a9->var0.var9 = v23[5];
  a9->var0.var11 = 1;
  uint64_t v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  MTLPixelFormatGetInfoForDevice(v32, v23[1], (uint64_t)&v47);
  a9->var0.var11 = BYTE8(v48);
  a9->var0.var12 = *((unsigned __int8 *)v23 + 64) << 6;
  uint64_t v33 = v28 + 4;
  unint64_t v34 = v33[17];
  a9->var0.var16.var0.var0 = v34 + a5;
  a9->var0.var16.var0.var1 = v34;
  a9->var0.var16.var0.var2 = a7;
  a9->var0.var16.var0.var3 = [v15 resourceSize];
  unsigned int v35 = *((_DWORD *)v33 + 12);
  if (v35)
  {
    a9->var0.var16.var0.var4 = v35;
    a9->var0.var12 |= 0x800u;
  }
  uint64_t v36 = v33[20] | (16 * v33[19]) | v33[18] & 0x300;
  v46.receiver = v31;
  v46.super_class = (Class)MTLIOAccelTexture;
  id v37 = [(MTLIOAccelResource *)&v46 initWithDevice:v32 options:v36 args:a9 argsSize:a10];
  unint64_t v27 = v37;
  if (v37)
  {
    v37->super._anon_50[136] = 0;
    if (!a7)
    {
      id v38 = 0;
      BOOL v39 = 0;
LABEL_25:
      v27->_buffer = v38;
      v27->_bufferOffset = a5;
      v27->_buffersize_t BytesPerRow = a6;
      v27->_textureType = *v23;
      v27->_width = v23[2];
      v27->_height = v23[3];
      v27->_depth = v23[4];
      v27->_mipmapLevelCount = v23[5];
      v27->_sampleCount = v23[6];
      v27->_arrayLength = v23[7];
      v27->_numFaces = v45;
      v27->_pixelFormat = v23[1];
      v27->_usage = v23[22];
      v27->_rotation = 0;
      v27->_swizzle = *((_DWORD *)v23 + 21);
      v27->_writeSwizzleEnabled = *((unsigned char *)v23 + 88);
      v27->_shareable = 0;
      v27->_framebufferOnly = 0;
      v27->_isDrawable = *((unsigned char *)v23 + 81);
      v27->_BOOL allowGPUOptimizedContents = *((unsigned char *)v23 + 128);
      uint64_t v40 = v15 + 4;
      id v41 = (id)v40[26];
      *(void *)&v27->super._anon_50[160] = v41;
      *(void *)&v27->super._anon_50[168] = v40[27];
      *(_OWORD *)&v27->super._anon_50[176] = *((_OWORD *)v40 + 14);
      v27->super._anon_50[192] = *((unsigned char *)v40 + 240);
      if (v39 && v41) {
        *(void *)&v27->super._anon_50[24] = v40[9] + a5;
      }
      *(void *)&v27->super._anon_50[88] = v40[17] + a5;
      return v27;
    }
LABEL_24:
    id v38 = v15;
    BOOL v39 = a11;
    goto LABEL_25;
  }
  return v27;
}

- (MTLIOAccelTexture)initWithBuffer:(id)a3 descriptor:(id)a4 sysMemOffset:(unint64_t)a5 sysMemRowBytes:(unint64_t)a6 vidMemSize:(unint64_t)a7 vidMemRowBytes:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  BYTE4(v11) = 1;
  LODWORD(v11) = a10;
  return -[MTLIOAccelTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:](self, "initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:", a3, a4, a5, a6, a7, a8, a9, v11);
}

- (MTLIOAccelTexture)initWithBuffer:(id)a3 descriptor:(id)a4 offset:(unint64_t)a5 bytesPerRow:(unint64_t)a6
{
  uint64_t v11 = (void *)[a3 device];
  uint64_t v12 = [a4 descriptorPrivate];
  _mtlValidateStrideTextureParameters(v11, a4, *(void *)(v12 + 16), *((void *)a3 + 21) + a5, a6, 0);
  v13 = [(MTLIOAccelResource *)self initWithResource:a3];
  if (v13)
  {
    v13->_buffer = (MTLIOAccelBuffer *)a3;
    v13->_bufferOffset = a5;
    v13->_buffersize_t BytesPerRow = a6;
    v13->_textureType = *(void *)v12;
    v13->_width = *(void *)(v12 + 16);
    v13->_height = *(void *)(v12 + 24);
    v13->_depth = *(void *)(v12 + 32);
    v13->_mipmapLevelCount = *(void *)(v12 + 40);
    v13->_sampleCount = *(void *)(v12 + 48);
    v13->_arrayLength = *(void *)(v12 + 56);
    unint64_t v14 = *(void *)(v12 + 8);
    uint64_t v15 = 6;
    if ((unint64_t)(*(void *)v12 - 5) >= 2) {
      uint64_t v15 = 1;
    }
    v13->_numFaces = v15;
    v13->_pixelFormat = v14;
    v13->_usage = *(void *)(v12 + 176);
    v13->_rotation = 0;
    v13->_swizzle = *(_DWORD *)(v12 + 84);
    v13->_writeSwizzleEnabled = *(unsigned char *)(v12 + 88);
    v13->_shareable = 0;
    v13->_framebufferOnly = 0;
    v13->_isDrawable = *(unsigned char *)(v12 + 81);
    v13->_BOOL allowGPUOptimizedContents = *(unsigned char *)(v12 + 128);
    id v16 = *((id *)a3 + 30);
    uint64_t v17 = *((void *)a3 + 31);
    *(void *)&v13->super._anon_50[160] = v16;
    *(void *)&v13->super._anon_50[168] = v17;
    *(_OWORD *)&v13->super._anon_50[176] = *((_OWORD *)a3 + 16);
    v13->super._anon_50[192] = *((unsigned char *)a3 + 272);
    if (v16) {
      uint64_t v18 = *((void *)a3 + 13);
    }
    else {
      uint64_t v18 = *(void *)&v13->super._anon_50[24];
    }
    *(void *)&v13->super._anon_50[24] = v18 + a5;
    *(void *)&v13->super._anon_50[88] = *((void *)a3 + 21) + a5;
  }
  return v13;
}

- (MTLIOAccelTexture)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 device:(id)a7 descriptor:(id)a8
{
  uint64_t v15 = [a8 descriptorPrivate];
  if (a4) {
    id v16 = [(MTLIOAccelResource *)self initWithResource:a4];
  }
  else {
    id v16 = [(MTLIOAccelResource *)self initMemoryless:a7 descriptor:a8];
  }
  uint64_t v17 = v16;
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
    v16->_rotation = 0;
    v16->_swizzle = *(_DWORD *)(v15 + 84);
    v16->_writeSwizzleEnabled = *(unsigned char *)(v15 + 88);
    v16->_shareable = 0;
    v16->_framebufferOnly = 0;
    v16->_isDrawable = *(unsigned char *)(v15 + 81);
    v16->_BOOL allowGPUOptimizedContents = *(unsigned char *)(v15 + 128);
    *(void *)&v16->super._anon_50[160] = a3;
    *(void *)&v17->super._anon_50[168] = a4;
    if (a4) {
      unint64_t v20 = a6;
    }
    else {
      unint64_t v20 = 0;
    }
    *(void *)&v17->super._anon_50[176] = a5;
    *(void *)&v17->super._anon_50[184] = v20;
    v17->super._anon_50[192] = 1;
    if ([a3 type] == 1) {
      v17->super._anon_50[192] = 0;
    }
    if (a4)
    {
      *(void *)&v17->super._anon_50[88] = *((void *)a4 + 21) + a5;
      *(void *)&v17->super._anon_50[24] += a5;
    }
  }
  return v17;
}

- (MTLIOAccelTexture)initWithMasterBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 descriptor:(id)a8 sysMemRowBytes:(unint64_t)a9 vidMemSize:(unint64_t)a10 vidMemRowBytes:(unint64_t)a11 args:(IOAccelNewResourceArgs *)a12 argsSize:(unsigned int)a13
{
  BYTE4(v19) = 0;
  LODWORD(v19) = a13;
  result = -[MTLIOAccelTexture initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:](self, "initWithBuffer:descriptor:sysMemOffset:sysMemRowBytes:vidMemSize:vidMemRowBytes:args:argsSize:isStrideTexture:", a3, a8, a6, a9, a10, a11, a12, v19);
  if (result)
  {
    result->_rootResourceIsSuballocatedBuffer = 1;
    result->_masterBuffer = (MTLIOAccelBuffer *)a3;
    result->_masterHeapIndex = a4;
    result->_masterBufferIndex = a5;
    result->_masterBufferOffset = a6;
    result->_NSUInteger length = a7;
  }
  return result;
}

- ($14D77461FF5D83CAEC4252578BA76F85)swizzle
{
  return ($14D77461FF5D83CAEC4252578BA76F85)MTLTextureSwizzleKeyToChannels(self->_swizzle, a2);
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
  [(MTLIOAccelTexture *)self getBytes:a7 bytesPerRow:a8 bytesPerImage:a9 fromRegion:v10 mipmapLevel:a4 slice:a3];
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
  [(MTLIOAccelTexture *)self replaceRegion:v10 mipmapLevel:a7 slice:a6 withBytes:a3 bytesPerRow:a4 bytesPerImage:a5];
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 fromRegion:(id *)a5 mipmapLevel:(unint64_t)a6
{
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 withBytes:(const void *)a5 bytesPerRow:(unint64_t)a6
{
  long long v6 = *(_OWORD *)&a3->var0.var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->var1.var1;
  [(MTLIOAccelTexture *)self replaceRegion:v7 mipmapLevel:a4 slice:0 withBytes:a5 bytesPerRow:a6 bytesPerImage:0];
}

- (__CFArray)copyAnnotations
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  [(MTLIOAccelResource *)self annotateResource:Mutable];
  if (self->_framebufferOnly) {
    unint64_t v4 = @"Renderbuffer";
  }
  else {
    unint64_t v4 = @"Texture";
  }
  CFDictionaryAddValue(Mutable, @"Type", v4);
  uint64_t v5 = CFStringCreateMutable(0, 512);
  uint64_t v25 = "MTLIOAccelTexture";
  CFStringAppendFormat(v5, 0, @"%s");
  unint64_t textureType = self->_textureType;
  if (textureType >= 0xA)
  {
    uint64_t v22 = "getTargetString";
    uint64_t v23 = "!\"INVALID TEXTURE TYPE\"";
    uint64_t v24 = 1530;
    goto LABEL_38;
  }
  uint64_t v25 = off_1E5220A48[textureType];
  CFStringAppendFormat(v5, 0, @", %s");
  unint64_t v11 = self->_textureType;
  if (v11 > 9) {
    goto LABEL_39;
  }
  if (((1 << v11) & 0x7C) != 0)
  {
    CFStringAppendFormat(v5, 0, @", %ld x %ld", self->_width, self->_height);
    goto LABEL_12;
  }
  if (((1 << v11) & 0x203) != 0)
  {
    CFStringAppendFormat(v5, 0, @", %ld", self->_width);
    goto LABEL_12;
  }
  if (v11 != 7)
  {
LABEL_39:
    uint64_t v22 = "appendDimensionString";
    uint64_t v23 = "0";
    uint64_t v24 = 1467;
LABEL_38:
    MTLReleaseAssertionFailure((uint64_t)v22, v24, (uint64_t)v23, 0, v6, v7, v8, v9, (uint64_t)v25);
  }
  CFStringAppendFormat(v5, 0, @", %ld x %ld x %ld", self->_width, self->_height, self->_depth);
LABEL_12:
  uint64_t Name = MTLPixelFormatGetName(self->_pixelFormat);
  CFStringAppendFormat(v5, 0, @", %s", Name);
  if (self->_mipmapLevelCount >= 2) {
    CFStringAppendFormat(v5, 0, @", %d mipmap levels", self->_mipmapLevelCount);
  }
  if (self->_arrayLength >= 2)
  {
    if (self->_textureType - 2 >= 6) {
      p_depth = &self->_depth;
    }
    else {
      p_depth = &self->_height;
    }
    CFStringAppendFormat(v5, 0, @", %d array slices", *p_depth);
  }
  if (self->_sampleCount) {
    CFStringAppendFormat(v5, 0, @", %d samples", self->_sampleCount);
  }
  unint64_t v14 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v15 = v14;
  unint64_t usage = self->_usage;
  if (usage)
  {
    [v14 appendString:@"shaderRead "];
    unint64_t usage = self->_usage;
    if ((usage & 2) == 0)
    {
LABEL_23:
      if ((usage & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_33;
    }
  }
  else if ((usage & 2) == 0)
  {
    goto LABEL_23;
  }
  [v15 appendString:@"shaderWrite "];
  unint64_t usage = self->_usage;
  if ((usage & 4) == 0)
  {
LABEL_24:
    if ((usage & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v15 appendString:@"renderTarget "];
  unint64_t usage = self->_usage;
  if ((usage & 0x10) == 0)
  {
LABEL_25:
    if ((usage & 0x4000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v15 appendString:@"pixelFormatView "];
  unint64_t usage = self->_usage;
  if ((usage & 0x4000) == 0)
  {
LABEL_26:
    if ((usage & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_35:
  [v15 appendString:@"noConcurrentAccess "];
  unint64_t usage = self->_usage;
  if ((usage & 0x10000) != 0)
  {
LABEL_27:
    [v15 appendString:@"blockWritesOnly "];
    unint64_t usage = self->_usage;
  }
LABEL_28:
  CFStringAppendFormat(v5, 0, @", usage (%08x) %@", usage, v15);
  id v17 = [(MTLIOAccelResource *)self retainedLabel];
  if (v17)
  {
    unint64_t v18 = v17;
    CFStringAppendFormat(v5, 0, @", \"%s\"", [v17 UTF8String]);
  }
  CFDictionaryAddValue(Mutable, @"Description", v5);
  CFRelease(v5);
  uint64_t v19 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  unint64_t v20 = [(MTLIOAccelResource *)self copyAnnotationDictionary:*(void *)&self->super._anon_50[8] obj_key_name:@"OpenGLObjects" obj_dict:Mutable];
  CFArrayAppendValue(v19, v20);
  CFRelease(v20);
  CFRelease(Mutable);
  return v19;
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

- (unint64_t)hazardTrackingMode
{
  unint64_t v2 = (*(void *)&self->super._anon_50[96] >> 8) & 3;
  if (v2) {
    return v2;
  }
  buffer = (MTLHeap *)self->_buffer;
  if (!buffer)
  {
    buffer = (MTLHeap *)self->_parentTexture;
    if (!buffer)
    {
      buffer = [(MTLIOAccelResource *)self heap];
      if (!buffer) {
        return 2;
      }
    }
  }

  return [(MTLHeap *)buffer hazardTrackingMode];
}

- (BOOL)isSparse
{
  unint64_t v2 = [(MTLIOAccelResource *)self heap];
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
    return MEMORY[0x1F40E95D0]();
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)MTLIOAccelTexture;
    return [(MTLIOAccelResource *)&v4 setOwnerWithIdentity:*(void *)&a3];
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

- (unint64_t)iosurfacePlane
{
  return self->_iosurfacePlane;
}

- (unint64_t)rotation
{
  return self->_rotation;
}

- (BOOL)isCompressed
{
  return self->_isCompressed;
}

- (unint64_t)textureType
{
  return self->_textureType;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (unint64_t)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (unint64_t)sampleCount
{
  return self->_sampleCount;
}

- (unint64_t)arrayLength
{
  return self->_arrayLength;
}

- (unint64_t)numFaces
{
  return self->_numFaces;
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

- (BOOL)allowGPUOptimizedContents
{
  return self->_allowGPUOptimizedContents;
}

@end