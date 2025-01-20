@interface XRVMRegionAnnotation
+ (BOOL)supportsSecureCoding;
- (XRVMRegionAnnotation)initWithCoder:(id)a3;
- (id)initSamplingRegion:(id)a3 inTask:(unsigned int)a4;
- (int)dispositionForPage:(unint64_t)a3;
- (unint64_t)pageSize;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setPageSize:(unint64_t)a3;
@end

@implementation XRVMRegionAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initSamplingRegion:(id)a3 inTask:(unsigned int)a4
{
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)XRVMRegionAnnotation;
  v7 = [(XRVMRegionAnnotation *)&v39 init];
  if (v7)
  {
    v8 = (unint64_t *)MEMORY[0x263EF8AE0];
    uint64_t v9 = *MEMORY[0x263EF8AE0];
    v10 = (unint64_t *)MEMORY[0x263EF8AF8];
    if (*MEMORY[0x263EF8AE0] >= *MEMORY[0x263EF8AF8]) {
      uint64_t v9 = *MEMORY[0x263EF8AF8];
    }
    if (v9 != 4096 && v9 != 0x4000) {
      sub_23093D76C();
    }
    LODWORD(dispositions_count) = v9;
    if (sysctlbyname("vm.self_region_page_size", 0, 0, &dispositions_count, 4uLL) && *__error() != 2)
    {
      v11 = (FILE *)*MEMORY[0x263EF8348];
      int v12 = *__error();
      v13 = __error();
      v14 = strerror(*v13);
      fprintf(v11, "Error setting sysctl %s: (%d) %s\n", "vm.self_region_page_size", v12, v14);
    }
    uint64_t v15 = [v6 location];
    v16 = (uint64_t *)MEMORY[0x263EF8AD0];
    v17 = (uint64_t *)MEMORY[0x263EF8AE8];
    uint64_t v18 = *MEMORY[0x263EF8AD0];
    if (*MEMORY[0x263EF8AD0] >= *MEMORY[0x263EF8AE8]) {
      uint64_t v18 = *MEMORY[0x263EF8AE8];
    }
    uint64_t v19 = v15 & ~v18;
    v7->_baseAddress = v19;
    uint64_t v20 = [v6 virtualSize];
    uint64_t v21 = *v16;
    if (*v16 >= (unint64_t)*v17) {
      uint64_t v21 = *v17;
    }
    uint64_t v22 = (v19 + v20 + v21) & ~v21;
    unint64_t v23 = v22 - v7->_baseAddress;
    unint64_t v24 = *v8;
    if (*v8 >= *v10) {
      unint64_t v24 = *v10;
    }
    size_t v25 = v23 / v24;
    mach_vm_size_t dispositions_count = v23 / v24;
    v7->_vpages = [v6 virtualPages];
    v7->_pageMap = (int *)malloc_type_calloc(v25, 4uLL, 0x100004052888210uLL);
    v7->_pageSize = [v6 pageSize];
    if (!mach_vm_page_range_query(a4, v7->_baseAddress, v22 - v7->_baseAddress, (mach_vm_address_t)v7->_pageMap, &dispositions_count))
    {
      mach_vm_size_t v26 = dispositions_count;
      if (dispositions_count)
      {
        LODWORD(v27) = 0;
        LODWORD(v28) = 0;
        LODWORD(v29) = 0;
        LODWORD(v30) = 0;
        pageMap = (unsigned int *)v7->_pageMap;
        do
        {
          unsigned int v32 = *pageMap++;
          unsigned int v33 = ((v32 >> 4) & 1) + v28;
          unsigned int v34 = ((v32 >> 3) & 1) + v29;
          unsigned int v35 = ((v32 >> 6) & 1) + v27;
          BOOL v36 = (v32 & 1) == 0;
          if (v32) {
            uint64_t v30 = (v30 + 1);
          }
          else {
            uint64_t v30 = v30;
          }
          if (v36) {
            uint64_t v29 = v29;
          }
          else {
            uint64_t v29 = v34;
          }
          if (v36) {
            uint64_t v28 = v33;
          }
          else {
            uint64_t v28 = v28;
          }
          if (v36) {
            uint64_t v27 = v27;
          }
          else {
            uint64_t v27 = v35;
          }
          --v26;
        }
        while (v26);
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v29 = 0;
        uint64_t v28 = 0;
        uint64_t v27 = 0;
      }
      [v6 _setResident:v30 dirty:v29 swapped:v28 speculative:v27];
    }
  }

  return v7;
}

- (int)dispositionForPage:(unint64_t)a3
{
  uint64_t v3 = *MEMORY[0x263EF8AD0];
  if (*MEMORY[0x263EF8AD0] >= *MEMORY[0x263EF8AE8]) {
    uint64_t v3 = *MEMORY[0x263EF8AE8];
  }
  unint64_t v4 = a3 & ~v3;
  unint64_t baseAddress = self->_baseAddress;
  BOOL v6 = v4 >= baseAddress;
  unint64_t v7 = v4 - baseAddress;
  if (v6 && (unint64_t v8 = v7 / self->_pageSize, v8 < self->_vpages)) {
    return self->_pageMap[v8];
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  pageMap = self->_pageMap;
  if (pageMap) {
    free(pageMap);
  }
  v4.receiver = self;
  v4.super_class = (Class)XRVMRegionAnnotation;
  [(XRVMRegionAnnotation *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    uint64_t v18 = DTXPrimitiveArrayCreateWithTypesAndValues();
    pageMap = self->_pageMap;
    uint64_t v6 = *pageMap;
    unint64_t vpages = self->_vpages;
    if (vpages < 2)
    {
      uint64_t v9 = 1;
    }
    else
    {
      unint64_t v8 = 1;
      LODWORD(v9) = 1;
      do
      {
        if (v6 == pageMap[v8])
        {
          uint64_t v9 = (v9 + 1);
        }
        else
        {
          DTXPrimitiveArrayAppendValues();
          pageMap = self->_pageMap;
          uint64_t v6 = pageMap[v8];
          unint64_t vpages = self->_vpages;
          uint64_t v9 = 1;
        }
        ++v8;
      }
      while (v8 < vpages);
    }
    uint64_t v16 = v6;
    uint64_t v15 = v9;
    DTXPrimitiveArrayAppendValues();
    int v17 = 0;
    [v4 encodeBytes:DTXPrimitiveArrayGetSerialized() length:0 forKey:@"dataList" v15 3 v16 3 0 0];
    DTXPrimitiveArrayDestroy();
  }
  else
  {
    [v4 encodeValueOfObjCType:"Q" at:&self->_baseAddress];
    [v4 encodeValueOfObjCType:"I" at:&self->_vpages];
    LODWORD(v18) = 1;
    v10 = self->_pageMap;
    int v11 = *v10;
    int v17 = *v10;
    unint64_t v12 = self->_vpages;
    if (v12 >= 2)
    {
      int v13 = 1;
      for (unint64_t i = 1; i < v12; ++i)
      {
        if (v11 == v10[i])
        {
          ++v13;
        }
        else
        {
          [v4 encodeValueOfObjCType:"I" at:&v18];
          [v4 encodeValueOfObjCType:"I" at:&v17];
          v10 = self->_pageMap;
          int v11 = v10[i];
          int v17 = v11;
          unint64_t v12 = self->_vpages;
          int v13 = 1;
        }
        LODWORD(v18) = v13;
      }
    }
    [v4 encodeValueOfObjCType:"I" at:&v18];
    [v4 encodeValueOfObjCType:"I" at:&v17];
    int v17 = 0;
    [v4 encodeValueOfObjCType:"I" at:&v17];
  }
}

- (XRVMRegionAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    if ([v4 allowsKeyedCoding])
    {
      uint64_t v21 = 0;
      [v5 decodeBytesForKey:@"dataList" returnedLength:&v21];
      DTXPrimitiveArrayReferencingSerialized();
      CFArrayRef v6 = (const __CFArray *)CFArrayCreateWithDTXPrimitiveArray();
      self->_unint64_t baseAddress = [(id)CFArrayGetValueAtIndex(v6, 0) unsignedLongLongValue];
      unsigned int v7 = [(NSNumber *)CFArrayGetValueAtIndex(v6, 1) unsignedIntValue];
      self->_unint64_t vpages = v7;
      self->_pageMap = (int *)malloc_type_calloc(v7, 4uLL, 0x100004052888210uLL);
      unsigned int Count = CFArrayGetCount(v6);
      if (Count >= 3)
      {
        int v9 = 0;
        for (unsigned int i = 2; i < Count; i += 2)
        {
          int v11 = [(NSNumber *)CFArrayGetValueAtIndex(v6, i) unsignedIntValue];
          if (v11)
          {
            int v12 = v11;
            int v13 = [(NSNumber *)CFArrayGetValueAtIndex(v6, i | 1) unsignedIntValue];
            pageMap = self->_pageMap;
            int v15 = v12 + v9;
            do
            {
              pageMap[v9++] = v13;
              --v12;
            }
            while (v12);
            int v9 = v15;
          }
        }
      }
      CFRelease(v6);
    }
    else
    {
      [v5 decodeValueOfObjCType:"Q" at:&self->_baseAddress size:8];
      [v5 decodeValueOfObjCType:"I" at:&self->_vpages size:4];
      self->_pageMap = (int *)malloc_type_calloc(self->_vpages, 4uLL, 0x100004052888210uLL);
      int v20 = 0;
      LODWORD(v21) = 0;
      [v5 decodeValueOfObjCType:"I" at:&v21 size:4];
      if (v21)
      {
        int v16 = 0;
        do
        {
          [v5 decodeValueOfObjCType:"I" at:&v20 size:4];
          if (v21)
          {
            unsigned int v17 = 0;
            uint64_t v18 = self->_pageMap;
            do
              v18[v16 + v17++] = v20;
            while (v17 < v21);
            v16 += v17;
          }
          [v5 decodeValueOfObjCType:"I" at:&v21 size:4];
        }
        while (v21);
      }
    }
  }

  return self;
}

- (unint64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(unint64_t)a3
{
  self->_pageSize = a3;
}

@end