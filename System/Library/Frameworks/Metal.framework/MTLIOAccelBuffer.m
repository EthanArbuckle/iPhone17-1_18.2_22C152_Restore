@interface MTLIOAccelBuffer
- (MTLIOAccelBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 args:(IOAccelNewResourceArgs *)a5 argsSize:(unsigned int)a6;
- (MTLIOAccelBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 vidMemSize:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)a11;
- (MTLIOAccelBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 vidMemSize:(unint64_t)a8 gpuAddress:(unint64_t)a9 args:(IOAccelNewResourceArgs *)a10 argsSize:(unsigned int)a11 deallocator:(id)aBlock;
- (MTLIOAccelBuffer)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6;
- (MTLIOAccelBuffer)initWithMasterBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 args:(IOAccelNewResourceArgs *)a8 argsSize:(unsigned int)a9;
- (__CFArray)copyAnnotations;
- (__IOSurface)_aneIOSurface;
- (__IOSurface)iosurface;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6;
- (int)setOwnerWithIdentity:(unsigned int)a3;
- (unint64_t)allocatedSize;
- (unint64_t)length;
- (void)dealloc;
- (void)didModifyRange:(_NSRange)a3;
@end

@implementation MTLIOAccelBuffer

- (id)formattedDescription:(unint64_t)a3
{
  v12[21] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = [(MTLIOAccelResource *)self retainedLabel];
  v6 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)MTLIOAccelBuffer;
  id v7 = [(MTLIOAccelBuffer *)&v11 description];
  v12[0] = v4;
  v12[1] = @"label =";
  v8 = @"<none>";
  if (v5) {
    v8 = v5;
  }
  v12[2] = v8;
  v12[3] = v4;
  v12[4] = @"length =";
  v12[5] = [NSNumber numberWithUnsignedLongLong:self->_length];
  v12[6] = v4;
  v12[7] = @"cpuCacheMode =";
  v12[8] = MTLCPUCacheModeString(*(void *)&self->super._anon_50[112]);
  v12[9] = v4;
  v12[10] = @"storageMode =";
  v12[11] = MTLStorageModeString(*(void *)&self->super._anon_50[104]);
  v12[12] = v4;
  v12[13] = @"hazardTrackingMode =";
  v12[14] = MTLHazardTrackingModeString([(MTLIOAccelResource *)self hazardTrackingMode]);
  v12[15] = v4;
  v12[16] = @"resourceOptions =";
  v12[17] = MTLResourceOptionsString([(MTLIOAccelResource *)self resourceOptions]);
  v12[18] = v4;
  v12[19] = @"purgeableState =";
  v12[20] = MTLPurgeableStateString(*(void *)&self->super._anon_50[128]);
  v9 = (void *)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 21), "componentsJoinedByString:", @" "];

  return v9;
}

- (id)description
{
  return [(MTLIOAccelBuffer *)self formattedDescription:0];
}

- (unint64_t)allocatedSize
{
  if (self->_masterBuffer) {
    return self->_length;
  }
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelBuffer;
  return [(MTLIOAccelResource *)&v3 allocatedSize];
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(void *)(StatusReg + 288) = 7085;
  id result = (id)-[MTLIOAccelBuffer newTextureWithDescriptor:offset:bytesPerRow:](self, "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5, a6);
  *(void *)(StatusReg + 288) = 0;
  return result;
}

- (MTLIOAccelBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 vidMemSize:(unint64_t)a8 args:(IOAccelNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)a11
{
  LODWORD(v12) = a10;
  return [(MTLIOAccelBuffer *)self initWithDevice:a3 pointer:a4 length:a5 options:a6 sysMemSize:a7 vidMemSize:a8 gpuAddress:0 args:a9 argsSize:v12 deallocator:a11];
}

- (MTLIOAccelBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 vidMemSize:(unint64_t)a8 gpuAddress:(unint64_t)a9 args:(IOAccelNewResourceArgs *)a10 argsSize:(unsigned int)a11 deallocator:(id)aBlock
{
  *((void *)&a10->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a10->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a10->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a10->var0.var8 = 0u;
  *(_OWORD *)&a10->var0.var14 = 0u;
  *(_OWORD *)&a10->var0.var0 = 0u;
  *(_OWORD *)&a10->var0.var6 = 0u;
  if (a4)
  {
    if ((a6 & 0xF0) == 0x20)
    {
      v26 = @"storageModePrivate incompatible with ...WithBytes variant of newBuffer";
      uint64_t v27 = 121;
    }
    else
    {
      if ((a6 & 0xF0) != 0x30) {
        goto LABEL_4;
      }
      v26 = @"storageModeMemoryless incompatible with ...WithBytes variant of newBuffer";
      uint64_t v27 = 123;
    }
    MTLReportFailure(0, "-[MTLIOAccelBuffer initWithDevice:pointer:length:options:sysMemSize:vidMemSize:gpuAddress:args:argsSize:deallocator:]", v27, (uint64_t)v26, a5, a6, a7, a8, v28);
  }
LABEL_4:
  if (a7 >= a5)
  {
    id v29 = a3;
    if ((a6 & 0xF) >= 2) {
      MTLReportFailure(0, "-[MTLIOAccelBuffer initWithDevice:pointer:length:options:sysMemSize:vidMemSize:gpuAddress:args:argsSize:deallocator:]", 147, @"Invalid cacheMode %u", a5, a6, a7, a8, a6 & 0xF);
    }
    if (a4) {
      unint64_t v20 = 0;
    }
    else {
      unint64_t v20 = a6 & 0xF;
    }
    if (((a6 >> 4) | 2) != 2) {
      MTLReportFailure(0, "-[MTLIOAccelBuffer initWithDevice:pointer:length:options:sysMemSize:vidMemSize:gpuAddress:args:argsSize:deallocator:]", 157, @"Invalid storageMode %u", a5, a6, a7, a8, a6 >> 4);
    }
    if (a6 >> 4) {
      unint64_t v21 = a8;
    }
    else {
      unint64_t v21 = 0;
    }
    unsigned int v22 = (v21 != 0) << 6;
    if (v21) {
      int v23 = 192;
    }
    else {
      int v23 = 128;
    }
    if (a4) {
      unsigned int v22 = v23;
    }
    a10->var0.var0 = v22;
    a10->var0.var1 = (v20 == 1) << 10;
    *(_DWORD *)&a10->var0.var2 = 65537;
    a10->var0.var4 = 1;
    a10->var0.var6 = v21;
    a10->var0.var7 = a7;
    *(void *)&a10->var0.var8 = 16777473;
    if (a9)
    {
      if (v21) {
        unint64_t v24 = v21;
      }
      else {
        unint64_t v24 = a7;
      }
      a10->var0.var14 = a9;
      a10->var0.var15 = v24;
    }
    a10->var0.var16.var0.var0 = (unint64_t)a4;
    a10->var0.var16.var0.var1 = (unint64_t)a4;
    a10->var0.var16.var0.var2 = v21;
    a10->var0.var16.var0.var3 = a7;
    if ((a6 & 0x10000) == 0) {
      a10->var0.var12 = 64;
    }
    v19 = [(MTLIOAccelResource *)self initWithDevice:v29 options:a6 args:a10 argsSize:a11];
    if (v19)
    {
      v19->_length = a5;
      if (aBlock)
      {
        v19->_pointer = a4;
        v19->_deallocator = _Block_copy(aBlock);
      }
      if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
      {
        [v29 deviceRef];
        [v29 registryID];
        IOAccelDeviceTraceEvent();
      }
    }
  }
  else
  {

    return 0;
  }
  return v19;
}

- (MTLIOAccelBuffer)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6
{
  v10 = [(MTLIOAccelResource *)self initWithResource:a4];
  objc_super v11 = v10;
  if (v10)
  {
    v10->_length = a6;
    *(void *)&v10->super._anon_50[160] = a3;
    *(void *)&v11->super._anon_50[168] = a4;
    *(void *)&v11->super._anon_50[176] = a5;
    *(void *)&v11->super._anon_50[184] = a6;
    v11->super._anon_50[192] = 1;
    if ([a3 type] == 1) {
      v11->super._anon_50[192] = 0;
    }
    *(void *)&v11->super._anon_50[88] += a5;
    *(void *)&v11->super._anon_50[24] += a5;
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [*(id *)&v11->super._anon_50[32] deviceRef];
      [*(id *)&v11->super._anon_50[32] registryID];
      IOAccelDeviceTraceEvent();
    }
  }
  return v11;
}

- (MTLIOAccelBuffer)initWithMasterBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 args:(IOAccelNewResourceArgs *)a8 argsSize:(unsigned int)a9
{
  self->_masterBuffer = (MTLIOAccelBuffer *)a3;
  self->_masterHeapIndex = a4;
  self->_masterBufferIndex = a5;
  self->_masterBufferOffset = a6;
  self->_length = a7;
  *(_OWORD *)&a8->var0.var0 = 0u;
  *(_OWORD *)&a8->var0.var6 = 0u;
  *((void *)&a8->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a8->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a8->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a8->var0.var8 = 0u;
  *(_OWORD *)&a8->var0.var14 = 0u;
  int v9 = *(_DWORD *)(*((void *)a3 + 19) + 260);
  a8->var0.var0 = v9 | 0x80;
  *(_DWORD *)&a8->var0.var2 = 65537;
  a8->var0.var4 = 1;
  if ((v9 & 0x40) != 0)
  {
    unint64_t v11 = 0;
    unint64_t v10 = *((void *)a3 + 9) & 0xFFFFFFFFFFFFFFLL;
    a8->var0.var6 = v10;
  }
  else
  {
    unint64_t v10 = 0;
    a8->var0.var6 = 0;
    unint64_t v11 = *((void *)a3 + 43);
  }
  a8->var0.var7 = v11;
  *(_DWORD *)&a8->var0.var8 = 16777473;
  a8->var0.var16.var0.var0 = *((void *)a3 + 21) + a6;
  a8->var0.var16.var0.var1 = *((void *)a3 + 21);
  a8->var0.var16.var0.var2 = v10;
  a8->var0.var16.var0.var3 = v11;
  a8->var0.var16.var0.var4 = *(_DWORD *)(*((void *)a3 + 19) + 256);
  a8->var0.var12 = 2048;
  uint64_t v12 = -[MTLIOAccelResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", [a3 device], *((void *)a3 + 22), a8, a9);
  v13 = v12;
  if (v12)
  {
    p_res = &v12->super._res;
    v12->super._anon_50[136] = 0;
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [*(id *)&v12->super._anon_50[32] deviceRef];
      [(__IOSurface *)p_res[1].info.iosurface registryID];
      IOAccelDeviceTraceEvent();
    }
  }
  return v13;
}

- (MTLIOAccelBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 args:(IOAccelNewResourceArgs *)a5 argsSize:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  *(_OWORD *)&a5->var0.var0 = 0u;
  *(_OWORD *)&a5->var0.var6 = 0u;
  *((void *)&a5->var0.var16.var3 + 4) = 0;
  *(_OWORD *)&a5->var0.var16.var0.var0 = 0u;
  *(_OWORD *)&a5->var0.var16.var3.var2[1] = 0u;
  *(_OWORD *)&a5->var0.var8 = 0u;
  *(_OWORD *)&a5->var0.var14 = 0u;
  *(void *)&a5->var0.var0 = 130;
  *(_DWORD *)&a5->var0.var2 = 65537;
  a5->var0.var4 = 1;
  a5->var0.var6 = 0;
  a5->var0.var7 = 0;
  *(void *)&a5->var0.var8 = 16777473;
  a5->var0.var16.var1.var0 = IOSurfaceGetID(a4);
  a5->var0.var16.var1.var1 = 0;
  a5->var0.var16.var0.var1 = 0;
  unint64_t v11 = [(MTLIOAccelResource *)self initWithDevice:a3 options:0 args:a5 argsSize:v6];
  if (v11)
  {
    CFRetain(a4);
    v11->_iosurface = a4;
    v11->_length = IOSurfaceGetAllocSize(a4);
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [a3 deviceRef];
      [a3 registryID];
      IOAccelDeviceTraceEvent();
    }
  }
  return v11;
}

- (void)dealloc
{
  p_res = &self->super._res;
  uint64_t v4 = *(void **)&self->super._anon_50[160];
  if (v4)
  {
    [(MTLIOAccelResource *)self makeAliasable];
    [(id)p_res[4].vendor.reserved[2] deallocHeapSubResource];
    uint64_t v4 = (void *)p_res[4].vendor.reserved[2];
  }

  masterBuffer = self->_masterBuffer;
  if (masterBuffer) {
    [(__IOSurface *)p_res[1].info.iosurface deallocBufferSubData:masterBuffer heapIndex:self->_masterHeapIndex bufferIndex:self->_masterBufferIndex bufferOffset:self->_masterBufferOffset length:self->_length];
  }
  deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
  if (deallocator)
  {
    deallocator[2](deallocator, self->_pointer, [(MTLIOAccelBuffer *)self length]);
    _Block_release(self->_deallocator);
    self->_deallocator = 0;
  }
  iosurface = self->_iosurface;
  if (iosurface) {
    CFRelease(iosurface);
  }
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelBuffer;
  [(MTLIOAccelResource *)&v8 dealloc];
}

- (void)didModifyRange:(_NSRange)a3
{
  MTLReportFailure(0, "-[MTLIOAccelBuffer didModifyRange:]", 515, @"didModifyRange: is not supported on this platform.", v3, v4, v5, v6, v7);
}

- (__CFArray)copyAnnotations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  [(MTLIOAccelResource *)self annotateResource:Mutable];
  CFDictionaryAddValue(Mutable, @"Type", @"Buffer");
  uint64_t v4 = CFStringCreateMutable(0, 512);
  CFStringAppendFormat(v4, 0, @"%s", "MTLIOAccelBuffer");
  uint64_t v5 = MTLResourceOptionsString(*(void *)&self->super._anon_50[96]);
  CFStringAppendFormat(v4, 0, @", %@", v5);
  id v6 = [(MTLIOAccelResource *)self retainedLabel];
  if (v6)
  {
    uint64_t v7 = v6;
    CFStringAppendFormat(v4, 0, @", \"%s\"", [v6 UTF8String]);
  }
  CFDictionaryAddValue(Mutable, @"Description", v4);
  CFRelease(v4);
  objc_super v8 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  uint64_t v9 = 0;
  long long v15 = *(_OWORD *)&self->super._anon_50[8];
  char v10 = 1;
  do
  {
    char v11 = v10;
    uint64_t v12 = *((void *)&v15 + v9);
    if (v12)
    {
      v13 = [(MTLIOAccelResource *)self copyAnnotationDictionary:v12 obj_key_name:@"OpenGLObjects" obj_dict:Mutable];
      CFArrayAppendValue(v8, v13);
      CFRelease(v13);
    }
    char v10 = 0;
    uint64_t v9 = 1;
  }
  while ((v11 & 1) != 0);
  CFRelease(Mutable);
  return v8;
}

- (unint64_t)length
{
  return self->_length;
}

- (__IOSurface)_aneIOSurface
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
    v4.super_class = (Class)MTLIOAccelBuffer;
    return [(MTLIOAccelResource *)&v4 setOwnerWithIdentity:*(void *)&a3];
  }
}

- (__IOSurface)iosurface
{
  return self->_iosurface;
}

@end