@interface IOGPUMetalResource
- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasAnyResources:(const void *)a3 count:(unint64_t)a4;
- (BOOL)doesAliasResource:(id)a3;
- (BOOL)isAliasable;
- (BOOL)isComplete;
- (BOOL)isPurgeable;
- (IOGPUMetalResource)initWithDevice:(id)a3 options:(unint64_t)a4 args:(IOGPUNewResourceArgs *)a5 argsSize:(unsigned int)a6;
- (IOGPUMetalResource)initWithResource:(id)a3;
- (MTLDevice)device;
- (MTLHeap)heap;
- (NSString)label;
- (__CFArray)copyAnnotations;
- (__CFDictionary)copyAnnotationDictionary:(unint64_t)a3 obj_key_name:(__CFString *)a4 obj_dict:(__CFDictionary *)a5;
- (__IOGPUResource)resourceRef;
- (id)initMemoryless:(id)a3 descriptor:(id)a4;
- (id)initStandinWithDevice:(id)a3;
- (id)retainedLabel;
- (int)responsibleProcess;
- (int)setOwnerWithIdentity:(unsigned int)a3;
- (unint64_t)allocatedSize;
- (unint64_t)allocationID;
- (unint64_t)cpuCacheMode;
- (unint64_t)gpuAddress;
- (unint64_t)hazardTrackingMode;
- (unint64_t)heapOffset;
- (unint64_t)protectionOptions;
- (unint64_t)resourceOptions;
- (unint64_t)resourceSize;
- (unint64_t)setPurgeableState:(unint64_t)a3;
- (unint64_t)storageMode;
- (unint64_t)unfilteredResourceOptions;
- (unsigned)resourceID;
- (void)_setLabel:(id)a3;
- (void)annotateResource:(__CFDictionary *)a3;
- (void)dealloc;
- (void)makeAliasable;
- (void)setLabel:(id)a3;
- (void)setResponsibleProcess:(int)a3;
- (void)virtualAddress;
- (void)waitUntilComplete;
@end

@implementation IOGPUMetalResource

- (unint64_t)storageMode
{
  return *(void *)&self->_anon_50[96];
}

- (unint64_t)hazardTrackingMode
{
  unint64_t v2 = (*(void *)&self->_anon_50[88] >> 8) & 3;
  if (v2) {
    return v2;
  }
  v4 = [(IOGPUMetalResource *)self heap];
  if (!v4) {
    return 2;
  }
  return [(MTLHeap *)v4 hazardTrackingMode];
}

- (unint64_t)resourceOptions
{
  int v2 = *(_DWORD *)&self->_anon_50[96];
  uint64_t v3 = *(void *)&self->_anon_50[104];
  return v3 & 0xF | (16 * (v2 & 0xF)) | (([(IOGPUMetalResource *)self hazardTrackingMode] & 3) << 8);
}

- (MTLHeap)heap
{
  return *(MTLHeap **)&self->_anon_50[136];
}

- (void).cxx_destruct
{
}

- (void)setLabel:(id)a3
{
  p_res = &self->_res;
  if (*(id *)&self->_anon_50[40] != a3)
  {
    uint64_t v6 = [a3 copy];
    os_unfair_lock_lock((os_unfair_lock_t)&p_res[4].vendor.reserved[3] + 1);
    v7 = *(void **)&p_res[1].var0;
    [(IOGPUMetalResource *)self _setLabel:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)&p_res[4].vendor.reserved[3] + 1);

    if (*(_DWORD *)__globalGPUCommPage)
    {
      uint64_t v8 = [(__IOSurface *)p_res[1].info.iosurface deviceRef];
      uint64_t v9 = p_res[2].vendor.reserved[0];
      uint64_t v10 = p_res[2].vendor.reserved[1];
      [a3 cStringUsingEncoding:1];
      p_res[2].vendor.reserved[1] = IOGPUDeviceTraceObjectLabel(v8, 8, 0, v9, v10);
    }
  }
}

- (void)_setLabel:(id)a3
{
  *(void *)&self->_anon_50[40] = a3;
}

- (unint64_t)setPurgeableState:(unint64_t)a3
{
  p_res = &self->_res;
  if (!self->_anon_50[128]) {
    return 2;
  }
  if (a3 != 1 && a3 != 256) {
    *(void *)&self->_anon_50[120] = a3;
  }
  if (a3 == 256 || (iosurface = self->_res.info.iosurface) == 0)
  {
    int v12 = 0;
    if (a3 == 256) {
      int v7 = 5;
    }
    else {
      int v7 = 1;
    }
    if (a3 == 4) {
      unsigned int v8 = 4;
    }
    else {
      unsigned int v8 = v7;
    }
    if (a3 == 3) {
      unsigned int v9 = 3;
    }
    else {
      unsigned int v9 = 1;
    }
    if (a3 == 2) {
      unsigned int v9 = 2;
    }
    if ((uint64_t)a3 <= 3) {
      uintptr_t v10 = v9;
    }
    else {
      uintptr_t v10 = v8;
    }
    IOGPUResourceSetPurgeable(p_res[2].vendor.reserved[2], v10, &v12);
    uint64_t v11 = (v12 - 2);
    if (v11 >= 3) {
      return 1;
    }
    else {
      return v11 + 2;
    }
  }
  else
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
      return qword_21C736ED0[oldState];
    }
  }
}

- (IOGPUMetalResource)initWithResource:(id)a3
{
  if (!a3) {
    -[IOGPUMetalResource initWithResource:]();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalResource initWithResource:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)IOGPUMetalResource;
  uint32_t v5 = [(_MTLResource *)&v12 init];
  if (v5)
  {
    *((void *)v5 + 14) = (id)[a3 device];
    v5[208] = 0;
    uint64_t v6 = (char *)a3 + 32;
    CFRetain(*((CFTypeRef *)v6 + 14));
    int v7 = (void *)*((void *)v6 + 14);
    *((void *)v5 + 18) = v7;
    *((void *)v5 + 19) = IOGPUResourceGetClientShared(v7);
    long long v8 = *((_OWORD *)v6 + 2);
    uint64_t v9 = *((void *)v6 + 6);
    *((void *)v5 + 10) = v9;
    *((_OWORD *)v5 + 4) = v8;
    uint64_t v10 = *((void *)v5 + 18);
    if (v9 != *(_DWORD *)(v10 + 48)) {
      -[IOGPUMetalResource initWithResource:]();
    }
    *((void *)v5 + 20) = *((void *)v6 + 16);
    *((void *)v5 + 13) = IOGPUResourceGetGPUVirtualAddress(v10);
    *((void *)v5 + 23) = *((void *)v6 + 19);
    *(_OWORD *)(v5 + 168) = *(_OWORD *)(v6 + 136);
    *((_DWORD *)v5 + 48) = getpid();
    *((void *)v5 + 25) = *((void *)v6 + 21);
    *((void *)v5 + 16) = *((void *)v6 + 12);
    *(_OWORD *)(v5 + 88) = *(_OWORD *)(v6 + 56);
    objc_storeWeak((id *)v5 + 35, v5);
    [(id)_ioGPUMemoryInfo addResourceToList:v5];
    [*((id *)v5 + 14) _addResource:v5];
  }
  return (IOGPUMetalResource *)v5;
}

- (MTLDevice)device
{
  return *(MTLDevice **)&self->_anon_50[32];
}

- (void)dealloc
{
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [*(id *)&self->_anon_50[32] registryID];
    [*(id *)&self->_anon_50[32] currentAllocatedSize];
    IOGPUDeviceTraceEvent();
  }
  if (*(void *)&self->_anon_50[64])
  {
    [(id)_ioGPUMemoryInfo removeResourceFromList:self];
    objc_storeWeak((id *)&self->weakSelf, 0);
    [*(id *)&self->_anon_50[32] _removeResource:self];
    IOGPUResourceRelease(*(CFTypeRef *)&self->_anon_50[64]);
    *(void *)&self->_anon_50[64] = 0;
  }

  *(void *)&self->_anon_50[32] = 0;
  *(void *)&self->_anon_50[40] = 0;
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalResource;
  [(_MTLObjectWithLabel *)&v3 dealloc];
}

- (IOGPUMetalResource)initWithDevice:(id)a3 options:(unint64_t)a4 args:(IOGPUNewResourceArgs *)a5 argsSize:(unsigned int)a6
{
  if (!a3) {
    -[IOGPUMetalResource initWithDevice:options:args:argsSize:]();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalResource initWithDevice:options:args:argsSize:]();
  }
  v24.receiver = self;
  v24.super_class = (Class)IOGPUMetalResource;
  uint64_t v11 = [(_MTLResource *)&v24 init];
  if (v11)
  {
    *((void *)v11 + 14) = a3;
    v11[208] = 1;
    *((void *)v11 + 21) = a4;
    *((void *)v11 + 22) = a4 >> 4;
    *((void *)v11 + 23) = a4 & 0xF;
    *((_DWORD *)v11 + 48) = getpid();
    *((void *)v11 + 25) = 2;
    *(_OWORD *)(v11 + 216) = 0u;
    *(_OWORD *)(v11 + 232) = 0u;
    v11[248] = 1;
    *((_DWORD *)v11 + 63) = 0;
    if (*((void *)v11 + 22) == 3)
    {
      *((_DWORD *)v11 + 20) = 0;
      *((void *)v11 + 16) = 0;
      *((void *)v11 + 19) = 0;
      *((void *)v11 + 20) = 0;
      *((void *)v11 + 18) = 0;
      *((void *)v11 + 9) = (unint64_t)v11[79] << 56;
      v11[208] = 0;
      *((void *)v11 + 12) = 0;
      *((void *)v11 + 13) = 0;
      *((void *)v11 + 11) = 0;
    }
    else
    {
      if ((a4 & 0x300) == 0x100) {
        a5->var0.var10 |= 0x1000u;
      }
      if (initWithDevice_options_args_argsSize__once_token != -1) {
        dispatch_once(&initWithDevice_options_args_argsSize__once_token, &__block_literal_global_3);
      }
      uint64_t v12 = *((void *)v11 + 21);
      if ((v12 & 0x80000) != 0
        || (initWithDevice_options_args_argsSize__gAllowCPUMapping & 1) == 0
        && (a4 & 0x20000) == 0
        && *((void *)v11 + 22) == 2)
      {
        a5->var0.var10 |= 0x2000u;
      }
      unsigned int var10 = a5->var0.var10;
      unsigned int v14 = var10 & 0xFFFFFBCF | 0x10;
      int v15 = var10 | 0x30;
      if ((v12 & 0x1000000) != 0) {
        unsigned int v16 = v14;
      }
      else {
        unsigned int v16 = v15;
      }
      if ((a4 & 0x40000) != 0) {
        int v17 = 66560;
      }
      else {
        int v17 = 1024;
      }
      a5->var0.unsigned int var10 = v16 | v17;
      v18 = (void *)IOGPUResourceCreate((mach_port_t *)[*((id *)v11 + 14) deviceRef], a5, a6);
      *((void *)v11 + 18) = v18;
      ClientShared = IOGPUResourceGetClientShared(v18);
      *((void *)v11 + 19) = ClientShared;
      if (!ClientShared)
      {

        return 0;
      }
      uint64_t v20 = *((void *)v11 + 18);
      *((_DWORD *)v11 + 20) = *(_DWORD *)(v20 + 48);
      *((void *)v11 + 16) = IOGPUResourceGetGlobalTraceObjectID(v20);
      *((void *)v11 + 9) = IOGPUResourceGetResidentDataSize(*((void *)v11 + 18)) & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v11[79] << 56);
      uint64_t v21 = *((void *)v11 + 18);
      int v22 = *(_DWORD *)(v21 + 52);
      if (v22 == 130)
      {
        *((void *)v11 + 20) = 0;
      }
      else if ((v22 & 0x80) == 0 || (a5->var0.var10 & 0x200000) != 0)
      {
        *((void *)v11 + 20) = IOGPUResourceGetDataBytes((void *)v21);
        uint64_t v21 = *((void *)v11 + 18);
      }
      else
      {
        *((void *)v11 + 20) = a5->var0.var16.var0.var0;
      }
      *((void *)v11 + 13) = IOGPUResourceGetGPUVirtualAddress(v21);
      IOGPUResourceCreateAllocationIdentifierSet(*((void *)v11 + 18), (void *)v11 + 11, (void *)v11 + 12);
      [a3 _addResource:v11];
      objc_storeWeak((id *)v11 + 35, v11);
      [(id)_ioGPUMemoryInfo addResourceToList:v11];
    }
    if (*(_DWORD *)__globalGPUCommPage)
    {
      [a3 registryID];
      [a3 currentAllocatedSize];
      IOGPUDeviceTraceEvent();
    }
  }
  return (IOGPUMetalResource *)v11;
}

- (void)virtualAddress
{
  return *(void **)&self->_anon_50[80];
}

- (unint64_t)gpuAddress
{
  return *(void *)&self->_anon_50[24];
}

- (void)makeAliasable
{
  p_res = &self->_res;
  objc_super v3 = *(void **)&self->_anon_50[136];
  if (v3)
  {
    if (LOBYTE(p_res[4].vendor.reserved[3]))
    {
      [v3 unpinMemoryAtOffset:p_res[4].vendor.reserved[1] withLength:p_res[4].vendor.reserved[2]];
      LOBYTE(p_res[4].vendor.reserved[3]) = 0;
    }
  }
}

- (unint64_t)protectionOptions
{
  unint64_t result = *(void *)&self->_anon_50[64];
  if (result) {
    return IOGPUResourceGetProtectionOptions(result);
  }
  return result;
}

- (unint64_t)cpuCacheMode
{
  return *(void *)&self->_anon_50[104];
}

- (unint64_t)allocatedSize
{
  if (*(void *)&self->_anon_50[136]) {
    return *(void *)&self->_anon_50[160];
  }
  else {
    return [(IOGPUMetalResource *)self resourceSize];
  }
}

- (unint64_t)resourceSize
{
  return *(void *)&self->_res.var0 & 0xFFFFFFFFFFFFFFLL;
}

- (NSString)label
{
  id v2 = [(IOGPUMetalResource *)self retainedLabel];
  return (NSString *)v2;
}

- (id)retainedLabel
{
  p_res = &self->_res;
  objc_super v3 = (os_unfair_lock_s *)&self->_anon_50[172];
  os_unfair_lock_lock((os_unfair_lock_t)&self->_anon_50[172]);
  id v4 = *(id *)&p_res[1].var0;
  os_unfair_lock_unlock(v3);
  return v4;
}

const char *__59__IOGPUMetalResource_initWithDevice_options_args_argsSize___block_invoke()
{
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    initWithDevice_options_args_argsSize__gAllowCPUMapping = 1;
  }
  unint64_t result = getenv("MTL_PRIVATE_ALLOW_CPU_ACCESS");
  if (result)
  {
    unint64_t result = (const char *)strcmp(result, "1");
    if (!result) {
      initWithDevice_options_args_argsSize__gAllowCPUMapping = 1;
    }
  }
  return result;
}

- (unint64_t)unfilteredResourceOptions
{
  return *(void *)&self->_anon_50[88];
}

- (void)setResponsibleProcess:(int)a3
{
  *(_DWORD *)&self->_anon_50[112] = a3;
}

- (int)responsibleProcess
{
  return *(_DWORD *)&self->_anon_50[112];
}

- (__IOGPUResource)resourceRef
{
  return *(__IOGPUResource **)&self->_anon_50[64];
}

- (BOOL)isPurgeable
{
  return [(IOGPUMetalResource *)self setPurgeableState:1] > 2;
}

- (BOOL)isComplete
{
  return IOGPUResourceTestEvent(*(void *)&self->_anon_50[64], 0) != 0;
}

- (void)waitUntilComplete
{
}

- (id)initStandinWithDevice:(id)a3
{
  if (!a3) {
    -[IOGPUMetalResource initStandinWithDevice:]();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    -[IOGPUMetalResource initStandinWithDevice:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)IOGPUMetalResource;
  uint32_t v5 = [(_MTLResource *)&v7 init];
  if (v5)
  {
    *(void *)&v5->_anon_50[32] = a3;
    v5->_anon_50[128] = 1;
    *(void *)&v5->_anon_50[96] = 0;
    *(void *)&v5->_anon_50[104] = 0;
    *(void *)&v5->_anon_50[88] = 0;
    *(_DWORD *)&v5->_anon_50[112] = getpid();
    *(void *)&v5->_anon_50[120] = 2;
    *(_DWORD *)v5->_anon_50 = 0;
    *(void *)&v5->_anon_50[48] = 0;
    *(void *)&v5->_anon_50[72] = 0;
    *(void *)&v5->_anon_50[80] = 0;
    *(void *)&v5->_anon_50[64] = 0;
    *(void *)&v5->_res.var0 = (unint64_t)*((unsigned __int8 *)&v5->_res.var1 + 3) << 56;
    *(_DWORD *)&v5->_anon_50[172] = 0;
    *(void *)&v5->_anon_50[16] = 0;
    *(void *)&v5->_anon_50[24] = 0;
    *(void *)&v5->_anon_50[8] = 0;
  }
  return v5;
}

- (id)initMemoryless:(id)a3 descriptor:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)IOGPUMetalResource;
  uint64_t v6 = [(_MTLResource *)&v8 init];
  if (v6)
  {
    *((void *)v6 + 14) = a3;
    *(_OWORD *)(v6 + 168) = xmmword_21C736EC0;
    *((void *)v6 + 23) = [a4 cpuCacheMode];
    *((_DWORD *)v6 + 48) = getpid();
    *((void *)v6 + 25) = 1;
    *((_DWORD *)v6 + 20) = 0;
    *((void *)v6 + 19) = 0;
    *((void *)v6 + 20) = 0;
    *((void *)v6 + 18) = 0;
    *((void *)v6 + 9) = (unint64_t)v6[79] << 56;
    *((void *)v6 + 16) = 0;
    *((_DWORD *)v6 + 63) = 0;
    *((void *)v6 + 12) = 0;
    *((void *)v6 + 13) = 0;
    *((void *)v6 + 11) = 0;
    *(_OWORD *)(v6 + 216) = 0u;
    *(_OWORD *)(v6 + 232) = 0u;
    v6[248] = 0;
  }
  return v6;
}

- (unsigned)resourceID
{
  return *(_DWORD *)self->_anon_50;
}

- (__CFDictionary)copyAnnotationDictionary:(unint64_t)a3 obj_key_name:(__CFString *)a4 obj_dict:(__CFDictionary *)a5
{
  unint64_t v18 = a3;
  objc_super v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  objc_super v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableArrayRef v10 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
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
    CFMutableArrayRef v13 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    CFDictionaryAddValue(v11, a4, v13);
    CFRelease(v13);
    CFArrayAppendValue(v13, a5);
  }
  values = CFNumberCreate(0, kCFNumberSInt64Type, &v18);
  CFArrayRef v14 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  CFDictionaryAddValue(Mutable, @"AllocationIdentifiers", v14);
  CFRelease(v14);
  CFRelease(values);
  return Mutable;
}

- (void)annotateResource:(__CFDictionary *)a3
{
  p_res = &self->_res;
  int valuePtr = *(_DWORD *)(*(void *)&self->_anon_50[64] + 48);
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(a3, @"Name", v5);
  CFRelease(v5);
  int v7 = p_res[3].vendor.reserved[2];
  uint64_t v6 = &p_res[3].vendor.reserved[2];
  if (v7 != getpid())
  {
    CFNumberRef v8 = CFNumberCreate(0, kCFNumberIntType, v6);
    CFDictionaryAddValue(a3, @"ResponsiblePID", v8);
    CFRelease(v8);
  }
}

- (__CFArray)copyAnnotations
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  [(IOGPUMetalResource *)self annotateResource:Mutable];
  CFDictionaryAddValue(Mutable, @"Type", @"Buffer");
  id v4 = [(IOGPUMetalResource *)self retainedLabel];
  if (v4)
  {
    CFNumberRef v5 = v4;
    CFStringRef v6 = CFStringCreateWithCString(0, (const char *)[v4 UTF8String], 0x600u);
  }
  else
  {
    CFStringRef v6 = CFStringCreateWithCString(0, "IOGPUMetalResource", 0x600u);
  }
  CFDictionaryAddValue(Mutable, @"Description", v6);
  CFRelease(v6);
  int v7 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v8 = 0;
  long long v14 = *(_OWORD *)&self->_anon_50[8];
  char v9 = 1;
  do
  {
    char v10 = v9;
    uint64_t v11 = *((void *)&v14 + v8);
    if (v11)
    {
      CFNumberRef v12 = [(IOGPUMetalResource *)self copyAnnotationDictionary:v11, @"OpenGLObjects", Mutable, v14 obj_key_name obj_dict];
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

- (unint64_t)heapOffset
{
  p_res = &self->_res;
  unint64_t result = *(void *)&self->_anon_50[136];
  if (result)
  {
    if ([(id)result type] == 1) {
      return p_res[4].vendor.reserved[1];
    }
    else {
      return 0;
    }
  }
  return result;
}

- (BOOL)isAliasable
{
  return self->_anon_50[168] == 0;
}

- (BOOL)doesAliasResource:(id)a3
{
  p_res = &self->_res;
  uint64_t v4 = *(void *)&self->_anon_50[136];
  if (!v4) {
    return 0;
  }
  if (v4 != [a3 heap]) {
    return 0;
  }
  unint64_t v7 = p_res[4].vendor.reserved[2];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *((void *)a3 + 30);
  if (!v8) {
    return 0;
  }
  unint64_t v9 = p_res[4].vendor.reserved[1];
  unint64_t v10 = *((void *)a3 + 29);
  unint64_t v11 = v10 + v8;
  return v9 + v7 > v10 && v11 > v9;
}

- (BOOL)doesAliasAllResources:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v4 = *(void *)&self->_anon_50[136];
    CFNumberRef v5 = (char *)*a3 + 32;
    if (v4 == *((void *)*a3 + 27))
    {
      BOOL v6 = 0;
      uint64_t v8 = *(void *)&self->_anon_50[160];
      unint64_t v9 = 1;
      do
      {
        if (!v8) {
          break;
        }
        uint64_t v10 = *((void *)v5 + 26);
        if (!v10) {
          break;
        }
        unint64_t v11 = *(void *)&self->_anon_50[152];
        unint64_t v12 = *((void *)v5 + 25);
        unint64_t v13 = v12 + v10;
        if (v11 + v8 <= v12 || v13 <= v11) {
          break;
        }
        BOOL v6 = v9 >= a4;
        if (a4 == v9) {
          break;
        }
        CFNumberRef v5 = (char *)a3[v9] + 32;
        uint64_t v15 = *((void *)a3[v9++] + 27);
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
      uint64_t v9 = *(void *)&p_res[3].var0;
      if (v9 == [(id)a3[v6] heap])
      {
        unint64_t v10 = p_res[4].vendor.reserved[2];
        if (v10)
        {
          uint64_t v11 = *((void *)a3[v6] + 30);
          if (v11)
          {
            unint64_t v12 = p_res[4].vendor.reserved[1];
            unint64_t v13 = *((void *)a3[v6] + 29);
            unint64_t v14 = v13 + v11;
            if (v12 + v10 > v13 && v14 > v12) {
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

- (unint64_t)allocationID
{
  return *(void *)&self->_anon_50[8];
}

- (int)setOwnerWithIdentity:(unsigned int)a3
{
  uint64_t v3 = *(void *)&self->_anon_50[64];
  if (v3) {
    return IOGPUResourceSetOwnerIdentity(v3, a3);
  }
  else {
    return -536870206;
  }
}

- (void)initStandinWithDevice:.cold.1()
{
}

- (void)initStandinWithDevice:.cold.2()
{
}

- (void)initWithDevice:options:args:argsSize:.cold.1()
{
}

- (void)initWithDevice:options:args:argsSize:.cold.2()
{
}

- (void)initWithResource:.cold.1()
{
  __assert_rtn("-[IOGPUMetalResource initWithResource:]", "IOGPUMetalResource.m", 458, "resource != nil");
}

- (void)initWithResource:.cold.2()
{
  __assert_rtn("-[IOGPUMetalResource initWithResource:]", "IOGPUMetalResource.m", 479, "_res.info.resourceID == _res.resourceRef->resourceId");
}

- (void)initWithResource:.cold.3()
{
}

@end