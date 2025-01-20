@interface IOGPUMetalBuffer
- (BOOL)detachBacking;
- (BOOL)replaceBackingWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5;
- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4;
- (IOGPUMetalBuffer)initWithDevice:(id)a3 addressRanges:(IOGPUAddressRange *)a4 addressRangeCount:(unint64_t)a5 length:(unint64_t)a6 options:(unint64_t)a7 gpuAddress:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10;
- (IOGPUMetalBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 args:(IOGPUNewResourceArgs *)a5 argsSize:(unsigned int)a6;
- (IOGPUMetalBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 gpuAddress:(unint64_t)a5 args:(IOGPUNewResourceArgs *)a6 argsSize:(unsigned int)a7;
- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 options:(unint64_t)a7 sysMemSize:(unint64_t)a8 gpuAddress:(unint64_t)a9 args:(IOGPUNewResourceArgs *)a10 argsSize:(unsigned int)a11 deallocator:(id)a12;
- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 options:(unint64_t)a7 sysMemSize:(unint64_t)a8 gpuAddress:(unint64_t)a9 gpuTag:(unint64_t)a10 args:(IOGPUNewResourceArgs *)a11 argsSize:(unsigned int)a12 deallocator:(id)aBlock;
- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 gpuAddress:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)a11;
- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 vidMemSize:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)a11;
- (IOGPUMetalBuffer)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6;
- (IOGPUMetalBuffer)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 gpuTag:(unint64_t)a7;
- (IOGPUMetalBuffer)initWithPrimaryBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 args:(IOGPUNewResourceArgs *)a8 argsSize:(unsigned int)a9;
- (IOGPUMetalBuffer)initWithPrimaryBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 args:(IOGPUNewResourceArgs *)a8 argsSize:(unsigned int)a9 gpuTag:(unint64_t)a10;
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

@implementation IOGPUMetalBuffer

- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 vidMemSize:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)a11
{
  LODWORD(v12) = a10;
  return [(IOGPUMetalBuffer *)self initWithDevice:a3 pointer:a4 length:a5 alignment:1 options:a6 sysMemSize:a7 gpuAddress:0 gpuTag:0 args:a9 argsSize:v12 deallocator:a11];
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 options:(unint64_t)a7 sysMemSize:(unint64_t)a8 gpuAddress:(unint64_t)a9 gpuTag:(unint64_t)a10 args:(IOGPUNewResourceArgs *)a11 argsSize:(unsigned int)a12 deallocator:(id)aBlock
{
  a11->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a11->var0.var14 = 0u;
  *(_OWORD *)(&a11->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a11->var0.var6 = 0u;
  *(_OWORD *)&a11->var0.var12 = 0u;
  *(_OWORD *)&a11->var0.var0 = 0u;
  if (a4 && ((a7 & 0xF0) == 0x20 || (a7 & 0xF0) == 0x30)) {
    MTLReportFailure();
  }
  if (a8 >= a5)
  {
    unint64_t v21 = a7 & 0xF;
    if (v21 >= 2)
    {
      unint64_t v23 = a7 & 0xF;
      MTLReportFailure();
    }
    if (a4) {
      unint64_t v21 = 0;
    }
    if ((a7 & 0xD0) != 0)
    {
      unint64_t v23 = a7 >> 4;
      MTLReportFailure();
    }
    a11->var0.var0 = (a4 != 0) << 7;
    a11->var0.var1 = (v21 == 1) << 10;
    *(_DWORD *)&a11->var0.var2 = 65537;
    a11->var0.var4 = 1;
    *(void *)&a11->var0.var6 = 16777473;
    a11->var0.var14 = a6;
    if (a9)
    {
      a11->var0.var12 = a9;
      a11->var0.var13 = a5;
    }
    a11->var0.var15 = HIDWORD(a10);
    a11->var0.var16.var0.var0 = (unint64_t)a4;
    a11->var0.var16.var0.var1 = (unint64_t)a4;
    a11->var0.var16.var0.var2 = a8;
    if ((a7 & 0x10000) == 0) {
      a11->var0.var10 = 64;
    }
    v20 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", a3, a7, a11, a12, v23);
    if (v20)
    {
      v20->_length = a5;
      if (aBlock)
      {
        v20->_pointer = a4;
        v20->_deallocator = _Block_copy(aBlock);
      }
      if (*(_DWORD *)__globalGPUCommPage)
      {
        [a3 deviceRef];
        [a3 registryID];
        IOGPUDeviceTraceEvent();
      }
    }
  }
  else
  {

    return 0;
  }
  return v20;
}

- (__IOSurface)iosurface
{
  return self->_iosurface;
}

- (id)newLinearTextureWithDescriptor:(id)a3 offset:(unint64_t)a4 bytesPerRow:(unint64_t)a5 bytesPerImage:(unint64_t)a6
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *(void *)(StatusReg + 288) = 7085;
  id result = (id)-[IOGPUMetalBuffer newTextureWithDescriptor:offset:bytesPerRow:](self, "newTextureWithDescriptor:offset:bytesPerRow:", a3, a4, a5, a6);
  *(void *)(StatusReg + 288) = 0;
  return result;
}

- (IOGPUMetalBuffer)initWithPrimaryBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 args:(IOGPUNewResourceArgs *)a8 argsSize:(unsigned int)a9 gpuTag:(unint64_t)a10
{
  self->_primaryBuffer = (IOGPUMetalBuffer *)a3;
  self->_primaryHeapIndex = a4;
  self->_primaryBufferIndex = a5;
  self->_primaryBufferOffset = a6;
  self->_length = a7;
  a8->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a8->var0.var14 = 0u;
  *(_OWORD *)(&a8->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a8->var0.var6 = 0u;
  *(_OWORD *)&a8->var0.var12 = 0u;
  *(_OWORD *)&a8->var0.var0 = 0u;
  uint64_t v12 = (char *)a3 + 32;
  a8->var0.var0 = *(_DWORD *)(*((void *)a3 + 18) + 52) | 0x80;
  *(_DWORD *)&a8->var0.var2 = 65537;
  a8->var0.var4 = 1;
  *(_DWORD *)&a8->var0.var6 = 16777473;
  a8->var0.var16.var0.var0 = *((void *)a3 + 20) + a6;
  a8->var0.var16.var0.var1 = *((void *)a3 + 20);
  a8->var0.var16.var0.var2 = *((void *)a3 + 41);
  a8->var0.var16.var0.var3.var0 = *((_DWORD *)a3 + 20);
  a8->var0.var10 = 2048;
  a8->var0.var15 = HIDWORD(a10);
  v13 = -[IOGPUMetalResource initWithDevice:options:args:argsSize:](self, "initWithDevice:options:args:argsSize:", [a3 device], *((void *)a3 + 21), a8, a9);
  v14 = v13;
  if (v13)
  {
    p_res = &v13->super._res;
    v13->super._anon_50[128] = 0;
    if (a8->var0.var16.var0.var0 != *(void *)&v13->super._anon_50[80]) {
      -[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:]();
    }
    if (*(void *)&v13->super._anon_50[24] != ((*((void *)v12 + 9) + a6) | a10)) {
      -[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:]();
    }
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [*(id *)&v13->super._anon_50[32] deviceRef];
      [(__IOSurface *)p_res[1].info.iosurface registryID];
      IOGPUDeviceTraceEvent();
    }
  }
  return v14;
}

- (IOGPUMetalBuffer)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 gpuTag:(unint64_t)a7
{
  if (!a3) {
    -[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:]();
  }
  if (!a4) {
    -[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:]();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:]();
  }
  v13 = [(IOGPUMetalResource *)self initWithResource:a4];
  v14 = v13;
  if (v13)
  {
    v13->_length = a6;
    *(void *)&v13->super._anon_50[136] = a3;
    *(void *)&v14->super._anon_50[144] = a4;
    *(void *)&v14->super._anon_50[152] = a5;
    *(void *)&v14->super._anon_50[160] = a6;
    v14->super._anon_50[168] = 1;
    if ([a3 type] == 1) {
      v14->super._anon_50[168] = 0;
    }
    *(void *)&v14->super._anon_50[80] += a5;
    *(void *)&v14->super._anon_50[24] = (*(void *)&v14->super._anon_50[24] + a5) | a7;
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [*(id *)&v14->super._anon_50[32] deviceRef];
      [*(id *)&v14->super._anon_50[32] registryID];
      IOGPUDeviceTraceEvent();
    }
  }
  return v14;
}

- (void)dealloc
{
  p_res = &self->super._res;
  v4 = *(void **)&self->super._anon_50[136];
  if (v4)
  {
    [(IOGPUMetalResource *)self makeAliasable];
    [*(id *)&p_res[3].var0 deallocHeapSubResource];
    v4 = *(void **)&p_res[3].var0;
  }

  primaryBuffer = self->_primaryBuffer;
  if (primaryBuffer) {
    [(__IOSurface *)p_res[1].info.iosurface deallocBufferSubData:primaryBuffer heapIndex:self->_primaryHeapIndex bufferIndex:self->_primaryBufferIndex bufferOffset:self->_primaryBufferOffset length:self->_length];
  }
  deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
  if (deallocator)
  {
    deallocator[2](deallocator, self->_pointer, [(IOGPUMetalBuffer *)self length]);
    _Block_release(self->_deallocator);
    self->_deallocator = 0;
  }
  iosurface = self->_iosurface;
  if (iosurface) {
    CFRelease(iosurface);
  }
  aneIOSurface = self->_aneIOSurface;
  if (aneIOSurface) {
    CFRelease(aneIOSurface);
  }
  v9.receiver = self;
  v9.super_class = (Class)IOGPUMetalBuffer;
  [(IOGPUMetalResource *)&v9 dealloc];
}

- (unint64_t)length
{
  return self->_length;
}

- (id)formattedDescription:(unint64_t)a3
{
  v12[21] = *MEMORY[0x263EF8340];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = [(IOGPUMetalResource *)self retainedLabel];
  v6 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)IOGPUMetalBuffer;
  id v7 = [(IOGPUMetalBuffer *)&v11 description];
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
  v12[8] = MTLCPUCacheModeString();
  v12[9] = v4;
  v12[10] = @"storageMode =";
  v12[11] = MTLStorageModeString();
  v12[12] = v4;
  v12[13] = @"hazardTrackingMode =";
  [(IOGPUMetalResource *)self hazardTrackingMode];
  v12[14] = MTLHazardTrackingModeString();
  v12[15] = v4;
  v12[16] = @"resourceOptions =";
  [(IOGPUMetalResource *)self resourceOptions];
  v12[17] = MTLResourceOptionsString();
  v12[18] = v4;
  v12[19] = @"purgeableState =";
  v12[20] = MTLPurgeableStateString();
  objc_super v9 = (void *)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v12, 21), "componentsJoinedByString:", @" "];

  return v9;
}

- (id)description
{
  return [(IOGPUMetalBuffer *)self formattedDescription:0];
}

- (unint64_t)allocatedSize
{
  if (self->_primaryBuffer) {
    return self->_length;
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalBuffer;
  return [(IOGPUMetalResource *)&v3 allocatedSize];
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 options:(unint64_t)a6 sysMemSize:(unint64_t)a7 gpuAddress:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10 deallocator:(id)a11
{
  LODWORD(v12) = a10;
  return [(IOGPUMetalBuffer *)self initWithDevice:a3 pointer:a4 length:a5 alignment:1 options:a6 sysMemSize:a7 gpuAddress:a8 gpuTag:0 args:a9 argsSize:v12 deallocator:a11];
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 pointer:(void *)a4 length:(unint64_t)a5 alignment:(unsigned int)a6 options:(unint64_t)a7 sysMemSize:(unint64_t)a8 gpuAddress:(unint64_t)a9 args:(IOGPUNewResourceArgs *)a10 argsSize:(unsigned int)a11 deallocator:(id)a12
{
  LODWORD(v13) = a11;
  return [(IOGPUMetalBuffer *)self initWithDevice:a3 pointer:a4 length:a5 alignment:1 options:a7 sysMemSize:a8 gpuAddress:a9 gpuTag:0 args:a10 argsSize:v13 deallocator:a12];
}

- (IOGPUMetalBuffer)initWithHeap:(id)a3 resource:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6
{
  return [(IOGPUMetalBuffer *)self initWithHeap:a3 resource:a4 offset:a5 length:a6 gpuTag:0];
}

- (IOGPUMetalBuffer)initWithPrimaryBuffer:(id)a3 heapIndex:(signed __int16)a4 bufferIndex:(signed __int16)a5 bufferOffset:(unint64_t)a6 length:(unint64_t)a7 args:(IOGPUNewResourceArgs *)a8 argsSize:(unsigned int)a9
{
  LODWORD(v10) = a9;
  return [(IOGPUMetalBuffer *)self initWithPrimaryBuffer:a3 heapIndex:a4 bufferIndex:a5 bufferOffset:a6 length:a7 args:a8 argsSize:v10 gpuTag:0];
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 args:(IOGPUNewResourceArgs *)a5 argsSize:(unsigned int)a6
{
  return [(IOGPUMetalBuffer *)self initWithDevice:a3 iosurface:a4 gpuAddress:0 args:a5 argsSize:*(void *)&a6];
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 iosurface:(__IOSurface *)a4 gpuAddress:(unint64_t)a5 args:(IOGPUNewResourceArgs *)a6 argsSize:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  *(_OWORD *)&a6->var0.var0 = 0u;
  *(_OWORD *)&a6->var0.var6 = 0u;
  a6->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a6->var0.var14 = 0u;
  *(_OWORD *)(&a6->var0.var16.var3 + 2) = 0u;
  *(_OWORD *)&a6->var0.var12 = 0u;
  *(void *)&a6->var0.var0 = 130;
  *(_DWORD *)&a6->var0.var2 = 65537;
  a6->var0.var4 = 1;
  *(void *)&a6->var0.var6 = 16777473;
  a6->var0.var16.var1.var0 = IOSurfaceGetID(a4);
  a6->var0.var16.var1.var1 = 0;
  a6->var0.var16.var0.var1 = 0;
  size_t AllocSize = IOSurfaceGetAllocSize(a4);
  size_t v14 = AllocSize;
  if (a5)
  {
    a6->var0.var12 = a5;
    a6->var0.var13 = AllocSize;
  }
  v15 = [(IOGPUMetalResource *)self initWithDevice:a3 options:0 args:a6 argsSize:v7];
  if (v15)
  {
    CFRetain(a4);
    v15->_iosurface = a4;
    v15->_length = v14;
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [a3 deviceRef];
      [a3 registryID];
      IOGPUDeviceTraceEvent();
    }
  }
  return v15;
}

- (IOGPUMetalBuffer)initWithDevice:(id)a3 addressRanges:(IOGPUAddressRange *)a4 addressRangeCount:(unint64_t)a5 length:(unint64_t)a6 options:(unint64_t)a7 gpuAddress:(unint64_t)a8 args:(IOGPUNewResourceArgs *)a9 argsSize:(unsigned int)a10
{
  *(_OWORD *)&a9->var0.var0 = 0u;
  *(_OWORD *)&a9->var0.var6 = 0u;
  *(_OWORD *)&a9->var0.var14 = 0u;
  *(_OWORD *)(&a9->var0.var16.var3 + 2) = 0u;
  a9->var0.var16.var0.var3.var1 = 0;
  *(_OWORD *)&a9->var0.var12 = 0u;
  *(void *)&a9->var0.var0 = 128;
  *(_DWORD *)&a9->var0.var2 = 65537;
  a9->var0.var4 = 1;
  *(_DWORD *)&a9->var0.var6 = 16777473;
  a9->var0.var16.var0.var0 = (unint64_t)a4;
  a9->var0.var16.var0.var1 = a5;
  a9->var0.var10 |= 0x200000u;
  v15.receiver = self;
  v15.super_class = (Class)IOGPUMetalBuffer;
  uint64_t v12 = [(IOGPUMetalResource *)&v15 initWithDevice:a3 options:a7 args:a9 argsSize:a10];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_length = a6;
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [a3 deviceRef];
      [a3 registryID];
      IOGPUDeviceTraceEvent();
    }
  }
  return v13;
}

- (void)didModifyRange:(_NSRange)a3
{
}

- (__CFArray)copyAnnotations
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  [(IOGPUMetalResource *)self annotateResource:Mutable];
  CFDictionaryAddValue(Mutable, @"Type", @"Buffer");
  uint64_t v4 = CFStringCreateMutable(0, 512);
  CFStringAppendFormat(v4, 0, @"%s", "IOGPUMetalBuffer ");
  v5 = (void *)MEMORY[0x21D4AEE90]();
  CFStringRef v6 = (const __CFString *)objc_msgSend((id)objc_msgSend((id)MTLResourceOptionsString(), "stringByReplacingOccurrencesOfString:withString:", @"MTLResource", &stru_26CCFD6A8), "stringByReplacingOccurrencesOfString:withString:", @"Mode", &stru_26CCFD6A8);
  CFStringAppend(v4, v6);
  if (objc_loadWeak((id *)&self->super.weakSelf)) {
    CFStringAppendFormat(v4, 0, @", handle (%012llx)", [(IOGPUMetalResource *)self gpuAddress]);
  }
  else {
    CFStringAppend(v4, @", dead");
  }
  CFStringAppendFormat(v4, 0, @", size %lluB", self->_length);
  if (*(void *)&self->super._anon_50[136]) {
    CFStringAppendFormat(v4, 0, @", heap (+%llx)", *(void *)&self->super._anon_50[152]);
  }
  if (self->_primaryBuffer) {
    CFStringAppendFormat(v4, 0, @", suballoc (+%llx)", self->_primaryBufferOffset);
  }
  id v7 = [(IOGPUMetalResource *)self retainedLabel];
  if (v7)
  {
    v8 = v7;
    CFStringAppendFormat(v4, 0, @", \"%s\"", [v7 UTF8String]);
  }
  CFDictionaryAddValue(Mutable, @"Description", v4);
  CFRelease(v4);
  objc_super v9 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v10 = 0;
  long long v16 = *(_OWORD *)&self->super._anon_50[8];
  char v11 = 1;
  do
  {
    char v12 = v11;
    uint64_t v13 = *((void *)&v16 + v10);
    if (v13)
    {
      size_t v14 = [(IOGPUMetalResource *)self copyAnnotationDictionary:v13 obj_key_name:@"OpenGLObjects" obj_dict:Mutable];
      CFArrayAppendValue(v9, v14);
      CFRelease(v14);
    }
    char v11 = 0;
    uint64_t v10 = 1;
  }
  while ((v12 & 1) != 0);
  CFRelease(Mutable);
  return v9;
}

- (__IOSurface)_aneIOSurface
{
  p_res = &self->super._res;
  uint64_t v4 = (os_unfair_lock_s *)&self->super._anon_50[172];
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._anon_50[172]);
  aneIOSurface = self->_aneIOSurface;
  if (!aneIOSurface)
  {
    if (self->_primaryBuffer) {
      p_primaryBufferOffset = &self->_primaryBufferOffset;
    }
    else {
      p_primaryBufferOffset = &p_res[4].vendor.reserved[1];
    }
    aneIOSurface = IOGPUResourceCreateIOSurface((uint64_t)[(IOGPUMetalResource *)self resourceRef], *p_primaryBufferOffset, self->_length);
    self->_aneIOSurface = aneIOSurface;
  }
  os_unfair_lock_unlock(v4);
  return aneIOSurface;
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
    v4.super_class = (Class)IOGPUMetalBuffer;
    return [(IOGPUMetalResource *)&v4 setOwnerWithIdentity:*(void *)&a3];
  }
}

- (BOOL)detachBacking
{
  return IOGPUResourceDetachBacking((uint64_t)[(IOGPUMetalResource *)self resourceRef]) == 0;
}

- (BOOL)replaceBackingWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  int v8 = IOGPUResourceReplaceBackingWithBytes((uint64_t)[(IOGPUMetalResource *)self resourceRef], (uint64_t)a3, a4);
  if (!v8)
  {
    deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
    if (deallocator)
    {
      deallocator[2](deallocator, self->_pointer, [(IOGPUMetalBuffer *)self length]);
      _Block_release(self->_deallocator);
      self->_deallocator = 0;
    }
    if (a5) {
      self->_deallocator = _Block_copy(a5);
    }
    self->_pointer = a3;
    *(void *)&self->super._anon_50[80] = a3;
  }
  return v8 == 0;
}

- (BOOL)replaceBackingWithRanges:(id)a3 readOnly:(BOOL)a4
{
  uint64_t v8 = 0;
  int v5 = IOGPUResourceReplaceBackingWithRanges((uint64_t)-[IOGPUMetalResource resourceRef](self, "resourceRef"), [a3 ranges], objc_msgSend(a3, "count"), a4, 1, &v8);
  if (!v5)
  {
    deallocator = (void (**)(id, void *, unint64_t))self->_deallocator;
    if (deallocator)
    {
      deallocator[2](deallocator, self->_pointer, [(IOGPUMetalBuffer *)self length]);
      _Block_release(self->_deallocator);
      self->_deallocator = 0;
    }
    self->_pointer = 0;
    *(void *)&self->super._anon_50[80] = v8;
  }
  return v5 == 0;
}

- (void)initWithHeap:resource:offset:length:gpuTag:.cold.1()
{
  __assert_rtn("-[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:]", "IOGPUMetalBuffer.m", 251, "heap != nil");
}

- (void)initWithHeap:resource:offset:length:gpuTag:.cold.2()
{
  __assert_rtn("-[IOGPUMetalBuffer initWithHeap:resource:offset:length:gpuTag:]", "IOGPUMetalBuffer.m", 252, "resource != nil");
}

- (void)initWithHeap:resource:offset:length:gpuTag:.cold.3()
{
}

- (void)initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:.cold.1()
{
  __assert_rtn("-[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:]", "IOGPUMetalBuffer.m", 355, "(uint64_t)_res.gpuAddress == (((uint64_t)primaryBuffer->_res.gpuAddress + bufferOffset) | gpuTag)");
}

- (void)initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:.cold.2()
{
  __assert_rtn("-[IOGPUMetalBuffer initWithPrimaryBuffer:heapIndex:bufferIndex:bufferOffset:length:args:argsSize:gpuTag:]", "IOGPUMetalBuffer.m", 354, "(uintptr_t)_res.virtualAddress == (uintptr_t)args->comm.opt.standard.texture_address");
}

@end