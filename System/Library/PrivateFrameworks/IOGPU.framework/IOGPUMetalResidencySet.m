@interface IOGPUMetalResidencySet
- (BOOL)_commitAddedAllocations:(const void *)a3 count:(unint64_t)a4 removedAllocations:(const void *)a5 count:(unint64_t)a6;
- (BOOL)_commitAddedHeaps:(const void *)a3 count:(unint64_t)a4 removedHeaps:(const void *)a5 count:(unint64_t)a6;
- (BOOL)_commitAddedResources:(const void *)a3 count:(unint64_t)a4 removedResources:(const void *)a5 count:(unint64_t)a6;
- (BOOL)containsAllocation:(id)a3;
- (IOGPUMetalResidencySet)initWithDevice:(id)a3 descriptor:(id)a4 args:(IOGPUNewResourceArgs *)a5 argsSize:(unint64_t)a6;
- (MTLDevice)device;
- (NSArray)allAllocations;
- (NSArray)allCommittedAllocations;
- (id).cxx_construct;
- (unint64_t)allocatedSize;
- (unint64_t)allocationCount;
- (unint64_t)countForAllocation:(id)a3;
- (unint64_t)currentGeneration;
- (unint64_t)expiredGeneration;
- (unint64_t)generationForAllocation:(id)a3;
- (void)addAllocation:(id)a3;
- (void)addAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)commit;
- (void)dealloc;
- (void)endResidency;
- (void)removeAllAllocations;
- (void)removeAllocation:(id)a3;
- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4;
- (void)requestResidency;
- (void)setCurrentGeneration:(unint64_t)a3;
- (void)setExpiredGeneration:(unint64_t)a3;
@end

@implementation IOGPUMetalResidencySet

- (void)setCurrentGeneration:(unint64_t)a3
{
  self->_currentGeneration = a3;
  self->_hashTable.m_currentGeneration = a3;
}

- (unint64_t)currentGeneration
{
  return self->_currentGeneration;
}

- (void)setExpiredGeneration:(unint64_t)a3
{
  self->_expiredGeneration = a3;
  self->_hashTable.m_expiredGeneration = a3;
}

- (unint64_t)expiredGeneration
{
  return self->_expiredGeneration;
}

- (IOGPUMetalResidencySet)initWithDevice:(id)a3 descriptor:(id)a4 args:(IOGPUNewResourceArgs *)a5 argsSize:(unint64_t)a6
{
  v22.receiver = self;
  v22.super_class = (Class)IOGPUMetalResidencySet;
  id v10 = [(_MTLObjectWithLabel *)&v22 init];
  if (v10)
  {
    id v11 = a3;
    *((void *)v10 + 9) = v11;
    *((void *)v10 + 6) = IOGPUDeviceGetNextGlobalTraceID([v11 deviceRef]);
    [v10 setCurrentGeneration:1];
    [v10 setExpiredGeneration:1];
    *((unsigned char *)v10 + 84) = [a4 evictsImmediately];
    uint64_t v12 = [a4 initialCapacity];
    unint64_t v13 = 128;
    if (v12) {
      unint64_t v13 = v12;
    }
    uint64_t v14 = 64;
    do
    {
      size_t v15 = v14;
      uint64_t v14 = (2 * v14);
    }
    while (v13 > v15);
    if (v15 > 0x40000) {
      goto LABEL_14;
    }
    a5->var0.var0 = 3;
    if (*((unsigned char *)v10 + 84)) {
      a5->var0.var10 = 0x400000;
    }
    a5->var0.var16.var1.var0 = v15;
    uint64_t v16 = IOGPUResourceCreate((mach_port_t *)[*((id *)v10 + 9) deviceRef], a5, a6);
    *((void *)v10 + 8) = v16;
    if (v16)
    {
      *((_DWORD *)v10 + 10) = *(_DWORD *)(v16 + 48);
      *((_DWORD *)v10 + 20) = 0;
      IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::init((int32x2_t *)v10 + 13, v15, 0x40000u);
      v17 = (_DWORD *)__globalGPUCommPage;
      if (*(_DWORD *)__globalGPUCommPage)
      {
        [a4 initialCapacity];
        IOGPUDeviceTraceEvent();
        v17 = (_DWORD *)__globalGPUCommPage;
      }
      if (*v17)
      {
        uint64_t v18 = [*((id *)v10 + 9) deviceRef];
        uint64_t v19 = *((void *)v10 + 6);
        uint64_t v20 = *((void *)v10 + 7);
        objc_msgSend((id)objc_msgSend(a4, "label"), "cStringUsingEncoding:", 1);
        *((void *)v10 + 7) = IOGPUDeviceTraceObjectLabel(v18, 8, 0, v19, v20);
      }
    }
    else
    {
LABEL_14:

      return 0;
    }
  }
  return (IOGPUMetalResidencySet *)v10;
}

- (void)dealloc
{
  groupRef = self->_groupRef;
  if (groupRef) {
    CFRelease(groupRef);
  }
  IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::releaseAllKeys((uint64_t *)&self->_hashTable);

  v4.receiver = self;
  v4.super_class = (Class)IOGPUMetalResidencySet;
  [(_MTLObjectWithLabel *)&v4 dealloc];
}

- (unint64_t)allocatedSize
{
  return IOGPUResourceGroupGetAllocationSize((uint64_t)self->_groupRef);
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)endResidency
{
  int v2 = 2;
  IOGPUResourceSetPurgeable((uint64_t)self->_groupRef, 6uLL, &v2);
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEvent();
  }
}

- (void)requestResidency
{
  int v2 = 4;
  IOGPUResourceSetPurgeable((uint64_t)self->_groupRef, 5uLL, &v2);
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEvent();
  }
}

- (void)addAllocations:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v5 = 0;
    p_hashTable = &self->_hashTable;
    do
    {
      unint64_t v7 = (unint64_t)a3[v5];
      v8 = (void *)(v7 & 0xFFFFFFFFFFFFFFFCLL);
      unint64_t v9 = 0x9E3779B97F4A7C15 * (v7 & 0xFFFFFFFFFFFFFFFCLL);
      unint64_t v10 = v9 >> -LOBYTE(p_hashTable->m_hashShift);
      unsigned int v11 = p_hashTable->m_hopInfo[v10];
      while (v11)
      {
        unsigned int v12 = __clz(__rbit32(v11));
        v11 &= ~(1 << v12);
        uint64_t v13 = (v12 + v10) & (p_hashTable->m_hashSize - 1);
        uint64_t v14 = *((void *)p_hashTable->m_keyTable + v13);
        if ((void *)(v14 & 0xFFFFFFFFFFFFFFFCLL) == v8)
        {
          *((void *)p_hashTable->m_keyTable + v13) = v14 | 2;
          goto LABEL_36;
        }
      }
      unsigned int v40 = 0;
      unint64_t m_currentGeneration = p_hashTable->m_currentGeneration;
      int v42 = p_hashTable->m_hashSize - 1;
      unint64_t v43 = v9 >> -LOBYTE(p_hashTable->m_hashShift);
      unsigned int m_usedMask = p_hashTable->m_usedMask;
      int v45 = v43 & 0x3F;
      m_usedInfo = p_hashTable->m_usedInfo;
      uint64_t v47 = m_usedInfo[v43 >> 6] | ~(-1 << v43);
      unsigned int v48 = v43 >> 6 << 6;
      unsigned int v49 = (v43 >> 6) + 1;
      while (v47 == -1)
      {
        unsigned int v40 = v40 - v45 + 64;
        uint64_t v47 = m_usedInfo[v49 & m_usedMask];
        v48 += 64;
        ++v49;
        int v45 = 0;
        if (v40 >= 0x80) {
          goto LABEL_32;
        }
      }
      uint64_t v27 = __clz(__rbit64(~v47)) + v48;
      if ((v27 - v43) > 0x7F) {
LABEL_32:
      }
        IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::rehash((uint64_t)p_hashTable, 0);
      LODWORD(v15) = p_hashTable->m_usedMask;
      while ((v27 - v43) >= 0x20)
      {
        int v16 = v27 - 31;
        if (v27 < 0x1F)
        {
LABEL_20:
          uint64_t v25 = v27;
        }
        else
        {
          m_hopInfo = p_hashTable->m_hopInfo;
          if (v27 < (int)v27 - 30) {
            int v16 = v27 - 30;
          }
          else {
            int v16 = v27;
          }
          int v18 = -31;
          while (1)
          {
            int v19 = v27 + v18;
            uint64_t v20 = (v27 + v18) & v42;
            unsigned int v21 = m_hopInfo[v20];
            unsigned int v22 = __clz(__rbit32(v21));
            unint64_t v23 = v27 + v18 + v22;
            if (v21 && v23 < v27) {
              break;
            }
            if (!__CFADD__(v27, ++v18)) {
              goto LABEL_20;
            }
          }
          uint64_t v28 = v23 & v42;
          m_keyTable = p_hashTable->m_keyTable;
          m_generationTable = p_hashTable->m_generationTable;
          uint64_t v31 = *((void *)p_hashTable->m_keyTable + v28);
          unint64_t v32 = m_generationTable[v28];
          m_hopInfo[v20] = v21 & ~(1 << v22) | (1 << -(char)v18);
          m_dirtyInfo = p_hashTable->m_dirtyInfo;
          uint64_t v15 = p_hashTable->m_usedMask;
          unint64_t v34 = v15 & (v23 >> 6);
          unint64_t v35 = m_dirtyInfo[v34];
          if ((v35 & (1 << (v19 + v22))) != 0)
          {
            m_dirtyInfo[v34] = v35 & ~(1 << v23);
            unint64_t v36 = v15 & ((unint64_t)v27 >> 6);
            m_dirtyInfo[v36] |= 1 << v27;
            uint64_t v37 = 1 << v36;
            unint64_t v38 = p_hashTable->m_dirtyHMask & (v36 >> 6);
            p_hashTable->m_dirtyInfoH[v38] |= v37;
          }
          uint64_t v25 = v19 + v22;
          m_usedInfo[m_usedMask & (v27 >> 6)] |= 1 << v27;
          unsigned int v39 = v27 & v42;
          *((void *)m_keyTable + v39) = v31;
          m_generationTable[v39] = v32;
          *((void *)m_keyTable + v28) = 2;
          m_usedInfo[m_usedMask & (v23 >> 6)] &= ~(1 << (v19 + v22));
          int v16 = v19;
        }
        BOOL v26 = v16 == v27;
        uint64_t v27 = v25;
        if (v26) {
          goto LABEL_32;
        }
      }
      unsigned int v50 = v27 & v42;
      v51 = p_hashTable->m_generationTable;
      *((void *)p_hashTable->m_keyTable + v50) = v7 | 2;
      v51[v50] = m_currentGeneration;
      if ((v7 & 1 | 2) == 2)
      {
        unint64_t v52 = v15 & ((unint64_t)v27 >> 6);
        m_dirtyInfoH = p_hashTable->m_dirtyInfoH;
        p_hashTable->m_dirtyInfo[v52] |= 1 << v27;
        uint64_t v54 = 1 << v52;
        unint64_t v55 = p_hashTable->m_dirtyHMask & (v52 >> 6);
        m_dirtyInfoH[v55] |= v54;
        ++p_hashTable->m_dirtyCount;
      }
      p_hashTable->m_hopInfo[v43] |= 1 << (v27 - v43);
      m_usedInfo[m_usedMask & (v27 >> 6)] |= 1 << v27;
      ++p_hashTable->m_count;
      id v56 = v8;
LABEL_36:
      if (*(_DWORD *)__globalGPUCommPage)
      {
        [(id)v7 allocatedSize];
        IOGPUDeviceTraceEvent();
      }
      ++v5;
    }
    while (v5 != a4);
  }
}

- (void)removeAllocations:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    uint64_t v5 = a3;
    uint64_t v6 = 0;
    p_hashTable = &self->_hashTable;
    do
    {
      unint64_t v8 = (unint64_t)v5[v6] & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v9 = (0x9E3779B97F4A7C15 * v8) >> -LOBYTE(self->_hashTable.m_hashShift);
      uint64_t v10 = v9;
      unsigned int v11 = self->_hashTable.m_hopInfo[v9];
      while (v11)
      {
        unsigned int v12 = __clz(__rbit32(v11));
        int v13 = 1 << v12;
        v11 &= ~(1 << v12);
        unint64_t v14 = v12 + v9;
        uint64_t v15 = v14 & (self->_hashTable.m_hashSize - 1);
        m_keyTable = p_hashTable->m_keyTable;
        uint64_t v17 = *((void *)p_hashTable->m_keyTable + v15);
        if ((v17 & 0xFFFFFFFFFFFFFFFCLL) == v8)
        {
          *((void *)m_keyTable + v15) = v17 & 0xFFFFFFFFFFFFFFFDLL;
          if (v17)
          {
            uint64_t m_usedMask = self->_hashTable.m_usedMask;
            self->_hashTable.m_generationTable[self->_hashTable.m_hashMask & v14] = self->_hashTable.m_currentGeneration;
            unint64_t v21 = m_usedMask & (v14 >> 6);
            m_dirtyInfoH = self->_hashTable.m_dirtyInfoH;
            self->_hashTable.m_dirtyInfo[v21] |= 1 << v14;
            uint64_t v23 = 1 << v21;
            unint64_t v24 = self->_hashTable.m_dirtyHMask & (v21 >> 6);
            m_dirtyInfoH[v24] |= v23;
            ++self->_hashTable.m_dirtyCount;
          }
          else
          {
            int v18 = ~v13;

            *((void *)m_keyTable + v15) = 0;
            m_usedInfo = self->_hashTable.m_usedInfo;
            self->_hashTable.m_hopInfo[v10] &= v18;
            uint64_t v5 = a3;
            unint64_t v4 = a4;
            m_usedInfo[self->_hashTable.m_usedMask & (v14 >> 6)] &= ~(1 << v14);
            --self->_hashTable.m_count;
          }
          break;
        }
      }
      if (*(_DWORD *)__globalGPUCommPage) {
        IOGPUDeviceTraceEvent();
      }
      ++v6;
    }
    while (v6 != v4);
  }
}

- (void)addAllocation:(id)a3
{
  p_hashTable = &self->_hashTable;
  unint64_t v5 = (unint64_t)a3 | 2;
  uint64_t v6 = (void *)((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL);
  unint64_t v7 = 0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL);
  unint64_t v8 = v7 >> -LOBYTE(self->_hashTable.m_hashShift);
  unsigned int v9 = self->_hashTable.m_hopInfo[v8];
  while (v9)
  {
    unsigned int v10 = __clz(__rbit32(v9));
    v9 &= ~(1 << v10);
    uint64_t v11 = (v10 + v8) & (self->_hashTable.m_hashSize - 1);
    uint64_t v12 = *((void *)p_hashTable->m_keyTable + v11);
    if ((void *)(v12 & 0xFFFFFFFFFFFFFFFCLL) == v6)
    {
      *((void *)p_hashTable->m_keyTable + v11) = v12 | 2;
      goto LABEL_34;
    }
  }
  unsigned int v13 = 0;
  unint64_t m_currentGeneration = self->_hashTable.m_currentGeneration;
  unsigned int v15 = self->_hashTable.m_hashSize - 1;
  unint64_t v16 = v7 >> -LOBYTE(self->_hashTable.m_hashShift);
  unsigned int m_usedMask = self->_hashTable.m_usedMask;
  int v18 = v16 & 0x3F;
  m_usedInfo = self->_hashTable.m_usedInfo;
  uint64_t v20 = m_usedInfo[v16 >> 6] | ~(-1 << v16);
  unsigned int v21 = v16 >> 6 << 6;
  unsigned int v22 = (v16 >> 6) + 1;
  while (v20 == -1)
  {
    unsigned int v13 = v13 - v18 + 64;
    uint64_t v20 = m_usedInfo[v22 & m_usedMask];
    v21 += 64;
    ++v22;
    int v18 = 0;
    if (v13 >= 0x80) {
      goto LABEL_10;
    }
  }
  uint64_t v23 = __clz(__rbit64(~v20)) + v21;
  if ((v23 - v16) > 0x7F) {
LABEL_10:
  }
    IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::rehash((uint64_t)p_hashTable, 0);
  LODWORD(v24) = self->_hashTable.m_usedMask;
  while ((v23 - v16) >= 0x20)
  {
    int v25 = v23 - 31;
    if (v23 < 0x1F)
    {
LABEL_24:
      uint64_t v34 = v23;
    }
    else
    {
      m_hopInfo = p_hashTable->m_hopInfo;
      if (v23 < (int)v23 - 30) {
        int v25 = v23 - 30;
      }
      else {
        int v25 = v23;
      }
      int v27 = -31;
      while (1)
      {
        int v28 = v23 + v27;
        uint64_t v29 = (v23 + v27) & v15;
        unsigned int v30 = m_hopInfo[v29];
        unsigned int v31 = __clz(__rbit32(v30));
        unint64_t v32 = v23 + v27 + v31;
        if (v30 && v32 < v23) {
          break;
        }
        if (!__CFADD__(v23, ++v27)) {
          goto LABEL_24;
        }
      }
      uint64_t v36 = v32 & v15;
      m_keyTable = p_hashTable->m_keyTable;
      m_generationTable = p_hashTable->m_generationTable;
      uint64_t v39 = *((void *)p_hashTable->m_keyTable + v36);
      unint64_t v40 = m_generationTable[v36];
      m_hopInfo[v29] = v30 & ~(1 << v31) | (1 << -(char)v27);
      m_dirtyInfo = p_hashTable->m_dirtyInfo;
      uint64_t v24 = p_hashTable->m_usedMask;
      unint64_t v42 = v24 & (v32 >> 6);
      unint64_t v43 = m_dirtyInfo[v42];
      if ((v43 & (1 << (v28 + v31))) != 0)
      {
        m_dirtyInfo[v42] = v43 & ~(1 << v32);
        unint64_t v44 = v24 & ((unint64_t)v23 >> 6);
        m_dirtyInfo[v44] |= 1 << v23;
        uint64_t v45 = 1 << v44;
        unint64_t v46 = p_hashTable->m_dirtyHMask & (v44 >> 6);
        p_hashTable->m_dirtyInfoH[v46] |= v45;
      }
      uint64_t v34 = v28 + v31;
      m_usedInfo[m_usedMask & (v23 >> 6)] |= 1 << v23;
      unsigned int v47 = v23 & v15;
      *((void *)m_keyTable + v47) = v39;
      m_generationTable[v47] = v40;
      *((void *)m_keyTable + v36) = 2;
      m_usedInfo[m_usedMask & (v32 >> 6)] &= ~(1 << (v28 + v31));
      int v25 = v28;
    }
    BOOL v35 = v25 == v23;
    uint64_t v23 = v34;
    if (v35) {
      goto LABEL_10;
    }
  }
  unsigned int v48 = v23 & v15;
  unsigned int v49 = p_hashTable->m_generationTable;
  *((void *)p_hashTable->m_keyTable + v48) = v5;
  v49[v48] = m_currentGeneration;
  if ((v5 & 3) == 2)
  {
    unint64_t v50 = v24 & ((unint64_t)v23 >> 6);
    m_dirtyInfoH = p_hashTable->m_dirtyInfoH;
    p_hashTable->m_dirtyInfo[v50] |= 1 << v23;
    uint64_t v52 = 1 << v50;
    unint64_t v53 = p_hashTable->m_dirtyHMask & (v50 >> 6);
    m_dirtyInfoH[v53] |= v52;
    ++p_hashTable->m_dirtyCount;
  }
  p_hashTable->m_hopInfo[v16] |= 1 << (v23 - v16);
  m_usedInfo[m_usedMask & (v23 >> 6)] |= 1 << v23;
  ++p_hashTable->m_count;
  id v54 = v6;
LABEL_34:
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [a3 allocatedSize];
    IOGPUDeviceTraceEvent();
  }
}

- (void)removeAllocation:(id)a3
{
  p_hashTable = &self->_hashTable;
  unint64_t v4 = (void *)((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL);
  unint64_t v5 = (0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(self->_hashTable.m_hashShift);
  uint64_t v6 = v5;
  unsigned int v7 = self->_hashTable.m_hopInfo[v5];
  while (v7)
  {
    unsigned int v8 = __clz(__rbit32(v7));
    int v9 = 1 << v8;
    v7 &= ~(1 << v8);
    unint64_t v10 = v8 + v5;
    uint64_t v11 = v10 & (self->_hashTable.m_hashSize - 1);
    m_keyTable = p_hashTable->m_keyTable;
    uint64_t v13 = *((void *)p_hashTable->m_keyTable + v11);
    if ((void *)(v13 & 0xFFFFFFFFFFFFFFFCLL) == v4)
    {
      *((void *)m_keyTable + v11) = v13 & 0xFFFFFFFFFFFFFFFDLL;
      if (v13)
      {
        uint64_t m_usedMask = self->_hashTable.m_usedMask;
        self->_hashTable.m_generationTable[self->_hashTable.m_hashMask & v10] = self->_hashTable.m_currentGeneration;
        unint64_t v17 = m_usedMask & (v10 >> 6);
        m_dirtyInfoH = self->_hashTable.m_dirtyInfoH;
        self->_hashTable.m_dirtyInfo[v17] |= 1 << v10;
        uint64_t v19 = 1 << v17;
        unint64_t v20 = self->_hashTable.m_dirtyHMask & (v17 >> 6);
        m_dirtyInfoH[v20] |= v19;
        ++self->_hashTable.m_dirtyCount;
      }
      else
      {
        int v14 = ~v9;

        *((void *)m_keyTable + v11) = 0;
        m_usedInfo = p_hashTable->m_usedInfo;
        p_hashTable->m_hopInfo[v6] &= v14;
        m_usedInfo[p_hashTable->m_usedMask & (v10 >> 6)] &= ~(1 << v10);
        --p_hashTable->m_count;
      }
      break;
    }
  }
  if (*(_DWORD *)__globalGPUCommPage)
  {
    IOGPUDeviceTraceEvent();
  }
}

- (NSArray)allAllocations
{
  p_hashTable = &self->_hashTable;
  uint64_t m_count = self->_hashTable.m_count;
  if (m_count)
  {
    unint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:m_count];
    unsigned int v5 = 0;
    do
    {
      for (unint64_t i = p_hashTable->m_usedInfo[v5]; i; i &= ~(1 << v7))
      {
        unint64_t v7 = __clz(__rbit64(i));
        uint64_t v8 = *((void *)p_hashTable->m_keyTable + (v7 | (v5 << 6)));
        if ((v8 & 2) != 0) {
          [v4 addObject:v8 & 0xFFFFFFFFFFFFFFFCLL];
        }
      }
      ++v5;
    }
    while (v5 <= p_hashTable->m_usedMask);
  }
  else
  {
    unint64_t v4 = objc_opt_new();
  }
  return (NSArray *)v4;
}

- (NSArray)allCommittedAllocations
{
  p_hashTable = &self->_hashTable;
  uint64_t m_count = self->_hashTable.m_count;
  if (m_count)
  {
    unint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:m_count];
    unsigned int v5 = 0;
    do
    {
      for (unint64_t i = p_hashTable->m_usedInfo[v5]; i; i &= ~(1 << v7))
      {
        unint64_t v7 = __clz(__rbit64(i));
        uint64_t v8 = *((void *)p_hashTable->m_keyTable + (v7 | (v5 << 6)));
        if (v8) {
          [v4 addObject:v8 & 0xFFFFFFFFFFFFFFFCLL];
        }
      }
      ++v5;
    }
    while (v5 <= p_hashTable->m_usedMask);
  }
  else
  {
    unint64_t v4 = objc_opt_new();
  }
  return (NSArray *)v4;
}

- (void)removeAllAllocations
{
  unsigned int v2 = 0;
  p_hashTable = &self->_hashTable;
  m_usedInfo = self->_hashTable.m_usedInfo;
  do
  {
    unint64_t v5 = m_usedInfo[v2];
    for (uint64_t i = v2; v5; v5 &= ~v13)
    {
      unsigned int v7 = __clz(__rbit64(v5));
      unint64_t v8 = (i << 6) | v7;
      m_keyTable = p_hashTable->m_keyTable;
      uint64_t v10 = *((void *)p_hashTable->m_keyTable + v8);
      unint64_t v11 = (0x9E3779B97F4A7C15 * (v10 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(p_hashTable->m_hashShift);
      int v12 = v8 - v11;
      if ((int)v8 - (int)v11 < 0) {
        v12 += p_hashTable->m_hashSize;
      }
      uint64_t v13 = 1 << v7;
      *((void *)m_keyTable + v8) = v10 & 0xFFFFFFFFFFFFFFFDLL;
      if (v10)
      {
        uint64_t m_usedMask = p_hashTable->m_usedMask;
        p_hashTable->m_generationTable[p_hashTable->m_hashMask & v8] = p_hashTable->m_currentGeneration;
        unint64_t v15 = m_usedMask & (v8 >> 6);
        m_dirtyInfoH = p_hashTable->m_dirtyInfoH;
        p_hashTable->m_dirtyInfo[v15] |= 1 << (((_BYTE)i << 6) | v7);
        uint64_t v17 = 1 << v15;
        unint64_t v18 = p_hashTable->m_dirtyHMask & (v15 >> 6);
        m_dirtyInfoH[v18] |= v17;
        ++p_hashTable->m_dirtyCount;
      }
      else
      {

        *((void *)m_keyTable + v8) = 0;
        m_usedInfo = p_hashTable->m_usedInfo;
        p_hashTable->m_hopInfo[v11] &= ~(1 << v12);
        m_usedInfo[i] &= ~v13;
        --p_hashTable->m_count;
      }
    }
    unsigned int v2 = i + 1;
  }
  while ((i + 1) <= p_hashTable->m_usedMask);
  if (*(_DWORD *)__globalGPUCommPage)
  {
    IOGPUDeviceTraceEvent();
  }
}

- (BOOL)containsAllocation:(id)a3
{
  unint64_t v3 = (0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(self->_hashTable.m_hashShift);
  unsigned int v4 = self->_hashTable.m_hopInfo[v3];
  while (v4)
  {
    unsigned int v5 = __clz(__rbit32(v4));
    v4 &= ~(1 << v5);
    unint64_t v6 = *((void *)self->_hashTable.m_keyTable + ((v5 + v3) & (self->_hashTable.m_hashSize - 1)));
    if ((v6 & 0xFFFFFFFFFFFFFFFCLL) == ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) {
      return (v6 >> 1) & 1;
    }
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (unint64_t)allocationCount
{
  return self->_hashTable.m_count;
}

- (unint64_t)countForAllocation:(id)a3
{
  unint64_t v3 = (0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(self->_hashTable.m_hashShift);
  unsigned int v4 = self->_hashTable.m_hopInfo[v3];
  while (v4)
  {
    unsigned int v5 = __clz(__rbit32(v4));
    v4 &= ~(1 << v5);
    unint64_t v6 = *((void *)self->_hashTable.m_keyTable + ((v5 + v3) & (self->_hashTable.m_hashSize - 1)));
    if ((v6 & 0xFFFFFFFFFFFFFFFCLL) == ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) {
      return (v6 >> 1) & 1;
    }
  }
  return 0;
}

- (unint64_t)generationForAllocation:(id)a3
{
  unint64_t v3 = (0x9E3779B97F4A7C15 * ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL)) >> -LOBYTE(self->_hashTable.m_hashShift);
  unsigned int v4 = self->_hashTable.m_hopInfo[v3];
  while (v4)
  {
    unsigned int v5 = __clz(__rbit32(v4));
    v4 &= ~(1 << v5);
    uint64_t v6 = (v5 + v3) & (self->_hashTable.m_hashSize - 1);
    if ((*((void *)self->_hashTable.m_keyTable + v6) & 0xFFFFFFFFFFFFFFFCLL) == ((unint64_t)a3 & 0xFFFFFFFFFFFFFFFCLL))
    {
      if ((*((void *)self->_hashTable.m_keyTable + v6) & 3) == 1) {
        return self->_hashTable.m_generationTable[v6];
      }
      return 0;
    }
  }
  return 0;
}

- (void)commit
{
  uint64_t v2 = MEMORY[0x270FA5388](self, a2);
  if (*(_DWORD *)__globalGPUCommPage) {
    IOGPUDeviceTraceEventStart();
  }
  unint64_t v3 = (uint64_t *)(v2 + 104);
  uint64_t v4 = *(unsigned int *)(v2 + 176);
  if (v4)
  {
    if (v4 > 0x100)
    {
      unsigned int v5 = (char *)malloc_type_malloc(16 * v4, 0x80040B8603338uLL);
      int v7 = *(_DWORD *)(v2 + 176);
      unint64_t v32 = v5;
      uint64_t v6 = (id *)&v5[8 * v4];
      if (!v7)
      {
        uint64_t v8 = 0;
        uint64_t v9 = 0;
LABEL_29:
        if (v8 | v9)
        {
          objc_msgSend((id)v2, "_commitAddedAllocations:count:removedAllocations:count:");
          for (; v8; --v8)
        }
        if (v32 != v31) {
          free(v32);
        }
        goto LABEL_34;
      }
    }
    else
    {
      unsigned int v5 = (char *)v31;
      unint64_t v32 = v31;
      uint64_t v6 = &v31[v4];
    }
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    int v11 = 0;
    uint64_t v12 = *(void *)(v2 + 144);
    do
    {
      unint64_t v13 = *(void *)(v12 + 8 * v10);
      if (v13)
      {
        uint64_t v14 = 0;
        do
        {
          unsigned int v15 = __clz(__rbit64(v13));
          uint64_t v16 = 1 << v15;
          uint64_t v17 = (v10 << 6) | v15;
          if (v17 <= *(_DWORD *)(v2 + 160))
          {
            int8x8_t v18 = *(int8x8_t *)(*(void *)(v2 + 136) + 8 * v17);
            if (v18)
            {
              unint64_t v19 = *(void *)(*(void *)(v2 + 136) + 8 * v17);
              do
              {
                unsigned int v20 = __clz(__rbit64(v19));
                uint64_t v21 = 1 << v20;
                uint64_t v22 = ~(1 << v20);
                uint64_t v23 = (v17 << 6) | v20;
                uint64_t v24 = *v3;
                uint64_t v25 = *(void *)(*v3 + 8 * v23);
                if ((v25 & 3) == 1)
                {
                  if (*(void *)(*(void *)(v2 + 112) + 8 * v23) <= *(void *)(v2 + 200))
                  {
                    unint64_t v26 = v25 & 0xFFFFFFFFFFFFFFFCLL;
                    unint64_t v27 = (0x9E3779B97F4A7C15 * (v25 & 0xFFFFFFFFFFFFFFFCLL)) >> -*(unsigned char *)(v2 + 168);
                    *(void *)(v24 + 8 * v23) = 0;
                    v6[v8] = (id)v26;
                    *(void *)(v24 + 8 * v23) &= ~1uLL;
                    int v28 = v23 - v27;
                    if (v28 < 0) {
                      v28 += *(_DWORD *)(v2 + 152);
                    }
                    ++v8;
                    *(void *)&v18 &= v22;
                    *(_DWORD *)(*(void *)(v2 + 120) + 4 * v27) &= ~(1 << v28);
                    *(void *)(*(void *)(v2 + 128) + 8 * v17) &= v22;
                    --*(_DWORD *)(v2 + 172);
                  }
                }
                else if ((v25 & 3) == 2)
                {
                  *(void *)&v5[8 * v9++] = v25 & 0xFFFFFFFFFFFFFFFCLL;
                  *(void *)(v24 + 8 * v23) |= 1uLL;
                  *(void *)&v18 &= v22;
                }
                v19 &= ~v21;
              }
              while (v19);
              uint8x8_t v29 = (uint8x8_t)vcnt_s8(v18);
              v29.i16[0] = vaddlv_u8(v29);
              v11 += v29.i32[0];
              *(int8x8_t *)(*(void *)(v2 + 136) + 8 * v17) = v18;
              if (v18) {
                uint64_t v30 = v16;
              }
              else {
                uint64_t v30 = 0;
              }
              v14 |= v30;
            }
          }
          v13 &= ~v16;
        }
        while (v13);
        uint64_t v12 = *(void *)(v2 + 144);
        *(void *)(v12 + 8 * v10) = v14;
      }
      ++v10;
    }
    while (v10 <= *(_DWORD *)(v2 + 164));
    *(_DWORD *)(v2 + 176) = v11;
    goto LABEL_29;
  }
LABEL_34:
  if (*(_DWORD *)__globalGPUCommPage)
  {
    [(id)v2 allocatedSize];
    IOGPUDeviceTraceEventEnd();
  }
}

- (BOOL)_commitAddedAllocations:(const void *)a3 count:(unint64_t)a4 removedAllocations:(const void *)a5 count:(unint64_t)a6
{
  uint64_t v6 = MEMORY[0x270FA5388](self, a2);
  unint64_t v9 = v8;
  int v11 = v10;
  unint64_t v12 = v7;
  uint64_t v14 = v13;
  unsigned int v15 = (void *)v6;
  if (v7 > 0x100)
  {
    unint64_t v43 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    uint64_t v16 = malloc_type_malloc(8 * v12, 0x80040B8603338uLL);
  }
  else
  {
    unint64_t v43 = v42;
    uint64_t v16 = v40;
  }
  v41 = v16;
  if (v9 > 0x100)
  {
    uint64_t v39 = malloc_type_malloc(8 * v9, 0x80040B8603338uLL);
    int8x8_t v18 = (char *)malloc_type_malloc(8 * v9, 0x80040B8603338uLL);
    uint64_t v16 = v41;
    uint64_t v17 = v39;
  }
  else
  {
    uint64_t v17 = v38;
    uint64_t v39 = v38;
    int8x8_t v18 = &v36;
  }
  uint64_t v37 = v18;
  unint64_t v19 = (char *)v43;
  unsigned int v20 = (int *)MEMORY[0x263F12B10];
  if (v12)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    do
    {
      uint64_t v24 = *v14++;
      uint64_t v23 = v24;
      uint64_t v25 = *(void *)(v24 + *v20);
      BOOL v26 = v25 == 1;
      if (v25 == 1) {
        unint64_t v27 = &v19[8 * v22];
      }
      else {
        unint64_t v27 = &v16[8 * v21];
      }
      if (v26) {
        ++v22;
      }
      else {
        ++v21;
      }
      *(void *)unint64_t v27 = v23;
      --v12;
    }
    while (v12);
    if (v9) {
      goto LABEL_17;
    }
LABEL_27:
    uint64_t v29 = 0;
    uint64_t v28 = 0;
    goto LABEL_28;
  }
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  if (!v9) {
    goto LABEL_27;
  }
LABEL_17:
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  do
  {
    uint64_t v31 = *v11++;
    uint64_t v30 = v31;
    uint64_t v32 = *(void *)(v31 + *v20);
    BOOL v33 = v32 == 1;
    if (v32 == 1) {
      uint64_t v34 = &v17[8 * v29];
    }
    else {
      uint64_t v34 = &v18[8 * v28];
    }
    if (v33) {
      ++v29;
    }
    else {
      ++v28;
    }
    *(void *)uint64_t v34 = v30;
    --v9;
  }
  while (v9);
LABEL_28:
  if (v22 | v29) {
    objc_msgSend(v15, "_commitAddedResources:count:removedResources:count:");
  }
  if (v21 | v28) {
    [v15 _commitAddedHeaps:v16 count:v21 removedHeaps:v18 count:v28];
  }
  if (v37 != &v36) {
    free(v37);
  }
  if (v39 != v38) {
    free(v39);
  }
  if (v41 != v40) {
    free(v41);
  }
  if (v43 != v42) {
    free(v43);
  }
  return 1;
}

- (BOOL)_commitAddedResources:(const void *)a3 count:(unint64_t)a4 removedResources:(const void *)a5 count:(unint64_t)a6
{
  unint64_t v8 = a4;
  if (a4 >= 0x101)
  {
    int v11 = malloc_type_malloc(4 * a4, 0x100004052888210uLL);
    unsigned int v20 = v11;
  }
  else
  {
    int v11 = v19;
    unsigned int v20 = v19;
    if (!a4)
    {
      uintptr_t v12 = 0;
      goto LABEL_9;
    }
  }
  uintptr_t v12 = 0;
  do
  {
    if (*((void *)*a3 + 22) != 3) {
      *(_DWORD *)&v11[4 * v12++] = *((_DWORD *)*a3 + 20);
    }
    ++a3;
    --v8;
  }
  while (v8);
LABEL_9:
  if (a6 >= 0x101)
  {
    unint64_t v13 = malloc_type_malloc(8 * a6, 0x100004000313F17uLL);
    int8x8_t v18 = v13;
  }
  else
  {
    unint64_t v13 = v17;
    int8x8_t v18 = v17;
    if (!a6)
    {
      uintptr_t v14 = 0;
      goto LABEL_17;
    }
  }
  uintptr_t v14 = 0;
  do
  {
    if (*((void *)*a5 + 22) != 3) {
      *(void *)&v13[8 * v14++] = *((void *)*a5 + 16);
    }
    ++a5;
    --a6;
  }
  while (a6);
LABEL_17:
  int updated = IOGPUResourceGroupUpdateResources((uint64_t)self->_groupRef, v12, (unsigned int *)v11, v14, v13);
  if (v18 != v17) {
    free(v18);
  }
  if (v20 != v19) {
    free(v20);
  }
  return updated == 0;
}

- (BOOL)_commitAddedHeaps:(const void *)a3 count:(unint64_t)a4 removedHeaps:(const void *)a5 count:(unint64_t)a6
{
  if (a4 >= 0x101)
  {
    int v11 = malloc_type_malloc(4 * a4, 0x100004052888210uLL);
    unsigned int v20 = v11;
  }
  else
  {
    int v11 = v19;
    unsigned int v20 = v19;
    if (!a4) {
      goto LABEL_9;
    }
  }
  uint64_t v12 = 0;
  do
  {
    if (*(void *)(*((void *)a3[v12] + 7) + 176) != 3) {
      *(_DWORD *)&v11[4 * v12] = *(_DWORD *)(*((void *)a3[v12] + 7) + 80);
    }
    ++v12;
  }
  while (a4 != v12);
LABEL_9:
  if (a6 >= 0x101)
  {
    unint64_t v13 = malloc_type_malloc(8 * a6, 0x100004000313F17uLL);
    int8x8_t v18 = v13;
  }
  else
  {
    unint64_t v13 = v17;
    int8x8_t v18 = v17;
    if (!a6) {
      goto LABEL_17;
    }
  }
  uint64_t v14 = 0;
  do
  {
    if (*(void *)(*((void *)a5[v14] + 7) + 176) != 3) {
      *(void *)&v13[8 * v14] = *(void *)(*((void *)a5[v14] + 7) + 128);
    }
    ++v14;
  }
  while (a6 != v14);
LABEL_17:
  int updated = IOGPUResourceGroupUpdateResources((uint64_t)self->_groupRef, a4, (unsigned int *)v11, a6, v13);
  if (v18 != v17) {
    free(v18);
  }
  if (v20 != v19) {
    free(v20);
  }
  return updated == 0;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 148) = 0u;
  *((void *)self + 22) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 21) = 0;
  return self;
}

- (void)addAllocations:(int *)a1 count:.cold.1(int *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Unable to add allocation to set, current allocation count: %u", (uint8_t *)v2, 8u);
}

- (void)addAllocation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)(a1 + 68);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Unable to add allocation to set, current resource count: %u", (uint8_t *)v2, 8u);
}

@end