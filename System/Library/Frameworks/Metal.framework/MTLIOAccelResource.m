@interface MTLIOAccelResource
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (MTLDevice)device;
- (MTLHeap)heap;
- (MTLIOAccelResource)initWithDevice:(id)a3 options:(unint64_t)a4 args:(IOAccelNewResourceArgs *)a5 argsSize:(unsigned int)a6;
- (MTLIOAccelResource)initWithResource:(id)a3;
- (NSString)label;
- (__CFArray)copyAnnotations;
- (__CFDictionary)copyAnnotationDictionary:(unint64_t)a3 obj_key_name:(__CFString *)a4 obj_dict:(__CFDictionary *)a5;
- (__IOAccelResource)resourceRef;
- (id)initMemoryless:(id)a3 descriptor:(id)a4;
- (id)initStandinWithDevice:(id)a3;
- (id)retainedLabel;
- (int)responsibleProcess;
- (int)setOwnerWithIdentity:(unsigned int)a3;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)protectionOptions;
- (unint64_t)resourceOptions;
- (unint64_t)resourceSize;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)storageMode;
- (unint64_t)unfilteredResourceOptions;
- (unsigned)resourceID;
- (void)annotateResource:(__CFDictionary *)a3;
- (void)dealloc;
- (void)makeAliasable;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)virtualAddress;
- (void)waitUntilComplete;
@end

@implementation MTLIOAccelResource

- (MTLIOAccelResource)initWithDevice:(id)a3 options:(unint64_t)a4 args:(IOAccelNewResourceArgs *)a5 argsSize:(unsigned int)a6
{
  v15.receiver = self;
  v15.super_class = (Class)MTLIOAccelResource;
  v9 = [(_MTLResource *)&v15 init];
  if (v9)
  {
    *((void *)v9 + 14) = a3;
    v9[216] = 1;
    *((void *)v9 + 22) = a4;
    *((void *)v9 + 23) = a4 >> 4;
    *((void *)v9 + 24) = a4 & 0xF;
    *((_DWORD *)v9 + 50) = getpid();
    *((void *)v9 + 26) = 2;
    *((_OWORD *)v9 + 15) = 0u;
    *((_OWORD *)v9 + 16) = 0u;
    v9[272] = 1;
    *((_DWORD *)v9 + 69) = 0;
    if (*((void *)v9 + 23) == 3)
    {
      *((_DWORD *)v9 + 20) = 0;
      *((void *)v9 + 16) = 0;
      *((void *)v9 + 18) = 0;
      *((void *)v9 + 19) = 0;
      *((void *)v9 + 20) = 0;
      *((void *)v9 + 21) = 0;
      *((void *)v9 + 9) = (unint64_t)v9[79] << 56;
      v9[216] = 0;
      *((void *)v9 + 12) = 0;
      *((void *)v9 + 13) = 0;
      *((void *)v9 + 11) = 0;
      *((void *)v9 + 28) = 0;
      *((void *)v9 + 29) = 0;
    }
    else
    {
      if ((a4 & 0x300) == 0x100) {
        a5->var0.var12 |= 0x1000u;
      }
      if ((a4 & 0x40000) != 0) {
        int v10 = 66608;
      }
      else {
        int v10 = 1072;
      }
      a5->var0.var12 |= (*((_DWORD *)v9 + 44) >> 6) & 0x2000 | v10;
      [*((id *)v9 + 14) sharedRef];
      *((void *)v9 + 18) = IOAccelResourceCreate();
      uint64_t ClientShared = IOAccelResourceGetClientShared();
      *((void *)v9 + 19) = ClientShared;
      if (!ClientShared)
      {

        return 0;
      }
      *((_DWORD *)v9 + 20) = *(_DWORD *)(ClientShared + 256);
      *((void *)v9 + 16) = IOAccelResourceGetGlobalTraceObjectID();
      *((void *)v9 + 9) = IOAccelResourceGetResidentDataSize() & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v9[79] << 56);
      int v12 = *(_DWORD *)(*((void *)v9 + 19) + 260);
      if (v12 == 130)
      {
        unint64_t var0 = 0;
      }
      else if ((v12 & 0x80) != 0)
      {
        unint64_t var0 = a5->var0.var16.var0.var0;
      }
      else
      {
        unint64_t var0 = IOAccelResourceGetDataBytes();
      }
      *((void *)v9 + 21) = var0;
      *((void *)v9 + 13) = IOAccelResourceGetGPUVirtualAddress();
      IOAccelResourceCreateAllocationIdentifierSet();
      [(id)_memoryInfo addResourceToList:v9];
      [a3 _addResource:v9];
    }
    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [a3 registryID];
      [a3 currentAllocatedSize];
      IOAccelDeviceTraceEvent();
    }
  }
  return (MTLIOAccelResource *)v9;
}

- (void)setLabel:(id)a3
{
  p_res = &self->_res;
  if (*(id *)&self->_anon_50[40] != a3)
  {
    uint64_t v5 = [a3 copy];
    os_unfair_lock_lock((os_unfair_lock_t)p_res[5].vendor.reserved + 1);
    v6 = *(void **)&p_res[1].var0;
    *(void *)&p_res[1].unint64_t var0 = v5;
    os_unfair_lock_unlock((os_unfair_lock_t)p_res[5].vendor.reserved + 1);

    if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
    {
      [(__IOSurface *)p_res[1].info.iosurface deviceRef];
      [a3 cStringUsingEncoding:1];
      p_res[2].vendor.reserved[1] = IOAccelDeviceTraceObjectLabel();
    }
  }
}

- (id)retainedLabel
{
  p_res = &self->_res;
  v3 = (os_unfair_lock_s *)&self->_anon_50[196];
  os_unfair_lock_lock((os_unfair_lock_t)&self->_anon_50[196]);
  id v4 = *(id *)&p_res[1].var0;
  os_unfair_lock_unlock(v3);
  return v4;
}

- (NSString)label
{
  id v2 = [(MTLIOAccelResource *)self retainedLabel];

  return (NSString *)v2;
}

- (unint64_t)cpuCacheMode
{
  return *(void *)&self->_anon_50[112];
}

- (unint64_t)storageMode
{
  return *(void *)&self->_anon_50[104];
}

- (unint64_t)resourceOptions
{
  int v2 = *(_DWORD *)&self->_anon_50[104];
  uint64_t v3 = *(void *)&self->_anon_50[112];
  return v3 & 0xF | (16 * (v2 & 0xF)) | (([(MTLIOAccelResource *)self hazardTrackingMode] & 3) << 8);
}

- (unint64_t)unfilteredResourceOptions
{
  return *(void *)&self->_anon_50[96];
}

- (unint64_t)hazardTrackingMode
{
  unint64_t v2 = (*(void *)&self->_anon_50[96] >> 8) & 3;
  if (v2) {
    return v2;
  }
  id v4 = [(MTLIOAccelResource *)self heap];
  if (!v4) {
    return 2;
  }

  return [(MTLHeap *)v4 hazardTrackingMode];
}

- (void)setResponsibleProcess:(int)a3
{
  *(_DWORD *)&self->_anon_50[120] = a3;
}

- (int)responsibleProcess
{
  return *(_DWORD *)&self->_anon_50[120];
}

- (__IOAccelResource)resourceRef
{
  return *(__IOAccelResource **)&self->_anon_50[64];
}

- (BOOL)isPurgeable
{
  return [(MTLIOAccelResource *)self setPurgeableState:1] > 2;
}

- (BOOL)isComplete
{
  return IOAccelResourceTestEvent() != 0;
}

- (void)waitUntilComplete
{
}

- (id)initStandinWithDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelResource;
  id v4 = [(_MTLResource *)&v6 init];
  if (v4)
  {
    *(void *)&v4->_anon_50[32] = a3;
    v4->_anon_50[136] = 1;
    *(void *)&v4->_anon_50[104] = 0;
    *(void *)&v4->_anon_50[112] = 0;
    *(void *)&v4->_anon_50[96] = 0;
    *(_DWORD *)&v4->_anon_50[120] = getpid();
    *(void *)&v4->_anon_50[128] = 2;
    *(_DWORD *)v4->_anon_50 = 0;
    *(void *)&v4->_anon_50[48] = 0;
    *(void *)&v4->_anon_50[64] = 0;
    *(void *)&v4->_anon_50[72] = 0;
    *(void *)&v4->_anon_50[80] = 0;
    *(void *)&v4->_anon_50[88] = 0;
    *(void *)&v4->_res.unint64_t var0 = (unint64_t)*((unsigned __int8 *)&v4->_res.var1 + 3) << 56;
    *(_DWORD *)&v4->_anon_50[196] = 0;
    *(void *)&v4->_anon_50[16] = 0;
    *(void *)&v4->_anon_50[24] = 0;
    *(void *)&v4->_anon_50[8] = 0;
    *(void *)&v4->_anon_50[144] = 0;
    *(void *)&v4->_anon_50[152] = 0;
  }
  return v4;
}

- (id)initMemoryless:(id)a3 descriptor:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelResource;
  objc_super v6 = [(_MTLResource *)&v8 init];
  if (v6)
  {
    *(void *)&v6->_anon_50[32] = a3;
    *(_OWORD *)&v6->_anon_50[96] = xmmword_1828F0CA0;
    *(void *)&v6->_anon_50[112] = [a4 cpuCacheMode];
    *(_DWORD *)&v6->_anon_50[120] = getpid();
    *(void *)&v6->_anon_50[128] = 1;
    *(_DWORD *)v6->_anon_50 = 0;
    *(void *)&v6->_anon_50[64] = 0;
    *(void *)&v6->_anon_50[72] = 0;
    *(void *)&v6->_anon_50[80] = 0;
    *(void *)&v6->_anon_50[88] = 0;
    *(void *)&v6->_res.unint64_t var0 = (unint64_t)*((unsigned __int8 *)&v6->_res.var1 + 3) << 56;
    *(void *)&v6->_anon_50[48] = 0;
    *(_DWORD *)&v6->_anon_50[196] = 0;
    *(void *)&v6->_anon_50[16] = 0;
    *(void *)&v6->_anon_50[24] = 0;
    *(void *)&v6->_anon_50[8] = 0;
    *(_OWORD *)&v6->_anon_50[144] = 0u;
    *(_OWORD *)&v6->_anon_50[160] = 0u;
    *(_OWORD *)&v6->_anon_50[176] = 0u;
    v6->_anon_50[192] = 0;
  }
  return v6;
}

- (MTLIOAccelResource)initWithResource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelResource;
  id v4 = [(_MTLResource *)&v8 init];
  if (v4)
  {
    *((void *)v4 + 14) = (id)[a3 device];
    v4[216] = 0;
    uint64_t v5 = (char *)a3 + 32;
    CFRetain(*((CFTypeRef *)v5 + 14));
    *((void *)v4 + 18) = *((void *)v5 + 14);
    *((void *)v4 + 19) = IOAccelResourceGetClientShared();
    long long v6 = *((_OWORD *)v5 + 2);
    *((void *)v4 + 10) = *((void *)v5 + 6);
    *((_OWORD *)v4 + 4) = v6;
    *((void *)v4 + 21) = *((void *)v5 + 17);
    *((void *)v4 + 13) = IOAccelResourceGetGPUVirtualAddress();
    *((void *)v4 + 24) = *((void *)v5 + 20);
    *((_OWORD *)v4 + 11) = *((_OWORD *)v5 + 9);
    *((_DWORD *)v4 + 50) = getpid();
    *((void *)v4 + 26) = *((void *)v5 + 22);
    *((void *)v4 + 16) = *((void *)v5 + 12);
    *(_OWORD *)(v4 + 88) = *(_OWORD *)(v5 + 56);
    [(id)_memoryInfo addResourceToList:v4];
    [*((id *)v4 + 14) _addResource:v4];
  }
  return (MTLIOAccelResource *)v4;
}

- (void)dealloc
{
  if (*(_DWORD *)*MEMORY[0x1E4F6EC08])
  {
    [*(id *)&self->_anon_50[32] registryID];
    [*(id *)&self->_anon_50[32] currentAllocatedSize];
    IOAccelDeviceTraceEvent();
  }
  if (*(void *)&self->_anon_50[64])
  {
    [(id)_memoryInfo removeResourceFromList:self];
    [*(id *)&self->_anon_50[32] _removeResource:self];
    IOAccelResourceRelease();
    *(void *)&self->_anon_50[64] = 0;
  }

  *(void *)&self->_anon_50[32] = 0;
  *(void *)&self->_anon_50[40] = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelResource;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

- (MTLDevice)device
{
  return *(MTLDevice **)&self->_anon_50[32];
}

- (void)virtualAddress
{
  return *(void **)&self->_anon_50[88];
}

- (unint64_t)gpuAddress
{
  return *(void *)&self->_anon_50[24];
}

- (unsigned)resourceID
{
  return *(_DWORD *)self->_anon_50;
}

- (unint64_t)resourceSize
{
  return *(void *)&self->_res.var0 & 0xFFFFFFFFFFFFFFLL;
}

- (unint64_t)protectionOptions
{
  unint64_t result = *(void *)&self->_anon_50[64];
  if (result) {
    return MEMORY[0x1F4124908](result, a2);
  }
  return result;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  if (!self->_anon_50[136]) {
    return 2;
  }
  if (a3 != 1)
  {
    if (a3 == 256) {
      return *(void *)&self->_anon_50[128];
    }
    *(void *)&self->_anon_50[128] = a3;
  }
  iosurface = self->_res.info.iosurface;
  if (iosurface)
  {
    uint32_t oldState = 0;
    if (a3 - 2 >= 3) {
      uint32_t v5 = 3;
    }
    else {
      uint32_t v5 = a3 - 2;
    }
    IOSurfaceSetPurgeable(iosurface, v5, &oldState);
    if (oldState > 3) {
      return 4;
    }
    else {
      return qword_1828F0CB0[oldState];
    }
  }
  else
  {
    IOAccelResourceSetPurgeable();
    return 1;
  }
}

- (__CFDictionary)copyAnnotationDictionary:(unint64_t)a3 obj_key_name:(__CFString *)a4 obj_dict:(__CFDictionary *)a5
{
  unint64_t v18 = a3;
  v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  objc_super v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFMutableArrayRef v10 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  CFDictionaryAddValue(Mutable, @"Processes", v10);
  CFRelease(v10);
  CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(0, 0, v7, v8);
  CFArrayAppendValue(v10, v11);
  CFRelease(v11);
  pid_t valuePtr = getpid();
  CFNumberRef v12 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(v11, @"PID", v12);
  CFRelease(v12);
  if (a4 && a5)
  {
    CFMutableArrayRef v13 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    CFDictionaryAddValue(v11, a4, v13);
    CFRelease(v13);
    CFArrayAppendValue(v13, a5);
  }
  values = CFNumberCreate(0, kCFNumberSInt64Type, &v18);
  CFArrayRef v14 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
  CFDictionaryAddValue(Mutable, @"AllocationIdentifiers", v14);
  CFRelease(v14);
  CFRelease(values);
  return Mutable;
}

- (void)annotateResource:(__CFDictionary *)a3
{
  p_res = &self->_res;
  int valuePtr = *(_DWORD *)(*(void *)&self->_anon_50[72] + 256);
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(a3, @"Name", v5);
  CFRelease(v5);
  int v7 = p_res[3].vendor.reserved[3];
  long long v6 = &p_res[3].vendor.reserved[3];
  if (v7 != getpid())
  {
    CFNumberRef v8 = CFNumberCreate(0, kCFNumberIntType, v6);
    CFDictionaryAddValue(a3, @"ResponsiblePID", v8);
    CFRelease(v8);
  }
}

- (__CFArray)copyAnnotations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  [(MTLIOAccelResource *)self annotateResource:Mutable];
  CFDictionaryAddValue(Mutable, @"Type", @"Buffer");
  id v4 = [(MTLIOAccelResource *)self retainedLabel];
  if (v4)
  {
    CFNumberRef v5 = v4;
    CFStringRef v6 = CFStringCreateWithCString(0, (const char *)[v4 UTF8String], 0x600u);
  }
  else
  {
    CFStringRef v6 = CFStringCreateWithCString(0, "MTLIOAccelResource", 0x600u);
  }
  CFDictionaryAddValue(Mutable, @"Description", v6);
  CFRelease(v6);
  int v7 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  uint64_t v8 = 0;
  long long v14 = *(_OWORD *)&self->_anon_50[8];
  char v9 = 1;
  do
  {
    char v10 = v9;
    uint64_t v11 = *((void *)&v14 + v8);
    if (v11)
    {
      CFNumberRef v12 = [(MTLIOAccelResource *)self copyAnnotationDictionary:v11, @"OpenGLObjects", Mutable, v14 obj_key_name obj_dict];
      CFArrayAppendValue(v7, v12);
      CFRelease(v12);
    }
    char v9 = 0;
    uint64_t v8 = 1;
  }
  while ((v10 & 1) != 0);
  CFRelease(Mutable);
  return v7;
}

- (MTLHeap)heap
{
  return *(MTLHeap **)&self->_anon_50[160];
}

- (unint64_t)heapOffset
{
  p_res = &self->_res;
  unint64_t result = *(void *)&self->_anon_50[160];
  if (result)
  {
    if ([(id)result type] == 1) {
      return (unint64_t)p_res[4].info.iosurface;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (BOOL)isAliasable
{
  return self->_anon_50[192] == 0;
}

- (void)makeAliasable
{
  p_res = &self->_res;
  objc_super v3 = *(void **)&self->_anon_50[160];
  if (v3)
  {
    if (LOBYTE(p_res[5].vendor.reserved[0]))
    {
      [v3 unpinMemoryAtOffset:p_res[4].info.iosurface withLength:*(void *)&p_res[4].var0];
      LOBYTE(p_res[5].vendor.reserved[0]) = 0;
    }
  }
}

- (BOOL)doesAliasResource:(id)a3
{
  p_res = &self->_res;
  uint64_t v4 = *(void *)&self->_anon_50[160];
  if (!v4) {
    return 0;
  }
  if (v4 != [a3 heap]) {
    return 0;
  }
  uint64_t v7 = *(void *)&p_res[4].var0;
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *((void *)a3 + 33);
  if (!v8) {
    return 0;
  }
  iosurface = p_res[4].info.iosurface;
  unint64_t v10 = *((void *)a3 + 32);
  unint64_t v11 = v10 + v8;
  return (unint64_t)iosurface + v7 > v10 && v11 > (unint64_t)iosurface;
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v4 = *(void *)&self->_anon_50[160];
    CFNumberRef v5 = (char *)*a3 + 32;
    if (v4 == *((void *)*a3 + 30))
    {
      BOOL v6 = 0;
      uint64_t v8 = *(void *)&self->_anon_50[184];
      unint64_t v9 = 1;
      do
      {
        if (!v8) {
          break;
        }
        uint64_t v10 = *((void *)v5 + 29);
        if (!v10) {
          break;
        }
        unint64_t v11 = *(void *)&self->_anon_50[176];
        unint64_t v12 = *((void *)v5 + 28);
        unint64_t v13 = v12 + v10;
        if (v11 + v8 <= v12 || v13 <= v11) {
          break;
        }
        BOOL v6 = v9 >= a4;
        if (a4 == v9) {
          break;
        }
        CFNumberRef v5 = (char *)a3[v9] + 32;
        uint64_t v15 = *((void *)a3[v9++] + 30);
      }
      while (v4 == v15);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 1;
  }
  return v6;
}

- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v6 = 0;
    p_res = &self->_res;
    BOOL v8 = 1;
    do
    {
      unint64_t v9 = p_res[4].vendor.reserved[2];
      if (v9 == [(id)a3[v6] heap])
      {
        uint64_t v10 = *(void *)&p_res[4].var0;
        if (v10)
        {
          uint64_t v11 = *((void *)a3[v6] + 33);
          if (v11)
          {
            iosurface = p_res[4].info.iosurface;
            unint64_t v13 = *((void *)a3[v6] + 32);
            unint64_t v14 = v13 + v11;
            if ((unint64_t)iosurface + v10 > v13 && v14 > (unint64_t)iosurface) {
              break;
            }
          }
        }
      }
      BOOL v8 = ++v6 < a4;
    }
    while (a4 != v6);
  }
  else
  {
    return 0;
  }
  return v8;
}

- (unint64_t)allocatedSize
{
  if (*(void *)&self->_anon_50[160]) {
    return *(void *)&self->_anon_50[184];
  }
  else {
    return [(MTLIOAccelResource *)self resourceSize];
  }
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  return -536870201;
}

- (unint64_t)allocationID
{
  return *(void *)&self->_anon_50[8];
}

- (unint64_t)gpuHandle
{
  return 0;
}

@end