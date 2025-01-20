@interface XRVMRegion
+ (BOOL)supportsSecureCoding;
+ (unint64_t)regionIndexInArray:(id)a3 forAddress:(unint64_t)a4;
+ (void)initialize;
- (BOOL)isAdjacentTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNullRegion;
- (BOOL)isSubmapRegion;
- (BOOL)matchesAddr:(unint64_t)a3 size:(unint64_t)a4 regionInfo:(vm_region_submap_info_64 *)a5;
- (BOOL)regionMatch:(id)a3;
- (BOOL)typeMatches:(id)a3;
- (XRVMRegion)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 regionInfo:(vm_region_submap_info_64 *)a5;
- (XRVMRegion)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayPath;
- (id)displayType;
- (id)path;
- (id)type;
- (int)currentProtection;
- (int)maxProtection;
- (unint64_t)dirtySize;
- (unint64_t)location;
- (unint64_t)pageSize;
- (unint64_t)residentSize;
- (unint64_t)swappedSize;
- (unint64_t)virtualSize;
- (unsigned)tag;
- (unsigned)virtualPages;
- (void)_setResident:(unsigned int)a3 dirty:(unsigned int)a4 swapped:(unsigned int)a5 speculative:(unsigned int)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress:(unint64_t)a3 size:(unint64_t)a4;
- (void)setPageSize:(unint64_t)a3;
- (void)setPath:(id)a3 type:(id)a4;
@end

@implementation XRVMRegion

+ (unint64_t)regionIndexInArray:(id)a3 forAddress:(unint64_t)a4
{
  CFArrayRef v5 = (const __CFArray *)a3;
  CFArrayRef v6 = v5;
  if (v5)
  {
    CFIndex Count = CFArrayGetCount(v5);
    CFIndex v8 = Count - 1;
    if (Count >= 1)
    {
      unint64_t v9 = Count;
      CFArrayGetValueAtIndex(v6, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unint64_t v11 = [v10 unsignedLongLongValue];
      }
      else {
        unint64_t v11 = v10[1];
      }

      if (v11 <= a4)
      {
        v10 = v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v13 = [v10 unsignedLongLongValue];
        }
        else
        {
          uint64_t v14 = v10[1];
          uint64_t v15 = v10[2];

          unint64_t v13 = v15 + v14;
        }
        if (v13 > a4)
        {
          unint64_t v12 = 0;
          goto LABEL_14;
        }
        v17 = CFArrayGetValueAtIndex(v6, v8);

        v10 = v17;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v18 = [v10 unsignedLongLongValue];
        }
        else
        {
          uint64_t v19 = v10[1];
          uint64_t v20 = v10[2];

          unint64_t v18 = v20 + v19;
        }
        if (v18 > a4)
        {
          v10 = v10;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            unint64_t v21 = [v10 unsignedLongLongValue];
          }
          else {
            unint64_t v21 = v10[1];
          }

          if (v21 <= a4)
          {
            unint64_t v12 = v8;
            goto LABEL_14;
          }
          if (v9 >= 3)
          {
            unint64_t v22 = 0;
            v23 = v10;
            while (1)
            {
              uint64_t v24 = v8 + v22;
              if ((uint64_t)(v8 + v22) < 0 != __OFADD__(v8, v22)) {
                ++v24;
              }
              unint64_t v12 = v24 >> 1;
              v25 = CFArrayGetValueAtIndex(v6, v24 >> 1);

              v23 = v25;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                unint64_t v26 = [v23 unsignedLongLongValue];
              }
              else {
                unint64_t v26 = v23[1];
              }

              if (v26 <= a4)
              {
                v10 = v23;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  unint64_t v27 = [v10 unsignedLongLongValue];
                }
                else
                {
                  uint64_t v28 = v10[1];
                  uint64_t v29 = v10[2];

                  unint64_t v27 = v29 + v28;
                }
                unint64_t v22 = v12;
                if (v27 > a4) {
                  goto LABEL_14;
                }
              }
              else
              {
                CFIndex v8 = v12;
              }
              unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
              v10 = v23;
              if ((uint64_t)(v8 - v22) <= 1) {
                goto LABEL_14;
              }
            }
          }
        }
      }
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

      goto LABEL_15;
    }
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x270F9A6D0](a1, sel_setVersion_);
  }
}

- (XRVMRegion)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 regionInfo:(vm_region_submap_info_64 *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)XRVMRegion;
  result = [(XRVMRegion *)&v12 init];
  if (result)
  {
    result->start = a3;
    result->length = a4;
    result->current_prot = a5->protection;
    result->max_prot = a5->max_protection;
    result->external_pager = a5->external_pager;
    result->share_mode = a5->share_mode;
    result->user_tag = a5->user_tag;
    unint64_t v9 = (void *)MEMORY[0x263EF8AD0];
    result->is_submap = a5->is_submap != 0;
    if (*v9 >= *MEMORY[0x263EF8AE8]) {
      v10 = (unsigned int *)MEMORY[0x263EF8AF0];
    }
    else {
      v10 = (unsigned int *)MEMORY[0x263EF8AD8];
    }
    result->region_page_shift = *v10;
    result->pages_resident = a5->pages_resident;
    result->pages_dirtied = a5->pages_dirtied;
    result->pages_swapped_out = a5->pages_swapped_out;
    result->pages_shared_now_private = a5->pages_shared_now_private;
    unint64_t v11 = *MEMORY[0x263EF8AE0];
    if (*MEMORY[0x263EF8AE0] >= *MEMORY[0x263EF8AF8]) {
      unint64_t v11 = *MEMORY[0x263EF8AF8];
    }
    result->_pageSize = v11;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((void *)result + 1) = self->start;
  *((void *)result + 2) = self->length;
  *((_DWORD *)result + 6) = self->current_prot;
  *((_DWORD *)result + 7) = self->max_prot;
  *((unsigned char *)result + 32) = self->external_pager;
  *((unsigned char *)result + 33) = self->share_mode;
  *((unsigned char *)result + 34) = self->user_tag;
  *((unsigned char *)result + 35) = self->is_submap;
  *((_DWORD *)result + 19) = self->region_page_shift;
  *((void *)result + 10) = self->_pageSize;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  if ([v15 allowsKeyedCoding])
  {
    uint64_t region_page_shift = self->region_page_shift;
    uint64_t ref_count = self->ref_count;
    uint64_t pages_dirtied = self->pages_dirtied;
    uint64_t pages_swapped_out = self->pages_swapped_out;
    uint64_t pages_shared_now_private = self->pages_shared_now_private;
    uint64_t pages_resident = self->pages_resident;
    uint64_t v8 = bswap32(*(_DWORD *)&self->external_pager);
    uint64_t max_prot = self->max_prot;
    uint64_t current_prot = self->current_prot;
    unint64_t length = self->length;
    unint64_t start = self->start;
    DTXPrimitiveArrayCreateWithTypesAndValues();
    [v15 encodeBytes:DTXPrimitiveArrayGetSerialized() length:0 forKey:@"dataList" atIndex:start length:length atIndex:current_prot atIndex:max_prot atIndex:v8 atIndex:pages_resident atIndex:pages_shared_now_private];
      pages_swapped_out,
      3,
      pages_dirtied,
      3,
      ref_count,
      3,
      region_page_shift,
      0);
    DTXPrimitiveArrayDestroy();
    [v15 encodeObject:self->path forKey:@"path"];
    [v15 encodeObject:self->type forKey:@"type"];
  }
  else
  {
    [v15 encodeValueOfObjCType:"Q" at:&self->start];
    [v15 encodeValueOfObjCType:"Q" at:&self->length];
    [v15 encodeValueOfObjCType:"i" at:&self->current_prot];
    [v15 encodeValueOfObjCType:"i" at:&self->max_prot];
    [v15 encodeValueOfObjCType:"C" at:&self->external_pager];
    [v15 encodeValueOfObjCType:"C" at:&self->share_mode];
    [v15 encodeValueOfObjCType:"C" at:&self->user_tag];
    [v15 encodeValueOfObjCType:"B" at:&self->is_submap];
    [v15 encodeValueOfObjCType:"I" at:&self->pages_resident];
    [v15 encodeValueOfObjCType:"I" at:&self->pages_shared_now_private];
    [v15 encodeValueOfObjCType:"I" at:&self->pages_swapped_out];
    [v15 encodeValueOfObjCType:"I" at:&self->pages_dirtied];
    [v15 encodeValueOfObjCType:"I" at:&self->ref_count];
    [v15 encodeValueOfObjCType:"I" at:&self->region_page_shift];
    [v15 encodeObject:self->path];
    [v15 encodeObject:self->type];
    [v15 encodeObject:0];
  }
}

- (XRVMRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  CFArrayRef v5 = v4;
  if (self)
  {
    if ([v4 allowsKeyedCoding])
    {
      uint64_t v23 = 0;
      id v6 = v5;
      [v6 decodeBytesForKey:@"dataList" returnedLength:&v23];
      DTXPrimitiveArrayReferencingSerialized();
      CFArrayRef v7 = (const __CFArray *)CFArrayCreateWithDTXPrimitiveArray();
      self->unint64_t start = [(NSNumber *)CFArrayGetValueAtIndex(v7, 0) unsignedLongLongValue];
      self->unint64_t length = [(NSNumber *)CFArrayGetValueAtIndex(v7, 1) unsignedLongLongValue];
      self->uint64_t current_prot = [(id)CFArrayGetValueAtIndex(v7, 2) unsignedIntValue];
      self->uint64_t max_prot = [(id)CFArrayGetValueAtIndex(v7, 3) unsignedIntValue];
      int v8 = [(NSNumber *)CFArrayGetValueAtIndex(v7, 4) unsignedIntValue];
      self->external_pager = HIBYTE(v8);
      self->share_mode = BYTE2(v8);
      self->user_tag = BYTE1(v8);
      self->is_submap = v8 != 0;
      self->uint64_t pages_resident = [[(id)CFArrayGetValueAtIndex(v7, 5)] unsignedIntValue];
      self->uint64_t pages_shared_now_private = [[CFArrayGetValueAtIndex(v7, 6) unsignedIntValue]];
      self->uint64_t pages_swapped_out = [[CFArrayGetValueAtIndex(v7, 7) unsignedIntValue]];
      self->uint64_t pages_dirtied = [(NSNumber *)CFArrayGetValueAtIndex(v7, 8) unsignedIntValue];
      self->uint64_t ref_count = [(id)CFArrayGetValueAtIndex(v7, 9) unsignedIntValue];
      if (CFArrayGetCount(v7) < 11)
      {
        if (*MEMORY[0x263EF8AD0] >= *MEMORY[0x263EF8AE8]) {
          v10 = (unsigned int *)MEMORY[0x263EF8AF0];
        }
        else {
          v10 = (unsigned int *)MEMORY[0x263EF8AD8];
        }
        unsigned int v9 = *v10;
      }
      else
      {
        unsigned int v9 = [[(id)CFArrayGetValueAtIndex(v7, 10) unsignedIntValue]];
      }
      self->uint64_t region_page_shift = v9;
      CFRelease(v7);
      unint64_t v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
      path = self->path;
      self->path = v11;

      unint64_t v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
      type = self->type;
      self->type = v13;
    }
    else
    {
      [v5 decodeValueOfObjCType:"Q" at:&self->start size:8];
      [v5 decodeValueOfObjCType:"Q" at:&self->length size:8];
      [v5 decodeValueOfObjCType:"i" at:&self->current_prot size:4];
      [v5 decodeValueOfObjCType:"i" at:&self->max_prot size:4];
      [v5 decodeValueOfObjCType:"C" at:&self->external_pager size:1];
      [v5 decodeValueOfObjCType:"C" at:&self->share_mode size:1];
      [v5 decodeValueOfObjCType:"C" at:&self->user_tag size:1];
      [v5 decodeValueOfObjCType:"B" at:&self->is_submap size:1];
      [v5 decodeValueOfObjCType:"I" at:&self->pages_resident size:4];
      [v5 decodeValueOfObjCType:"I" at:&self->pages_shared_now_private size:4];
      [v5 decodeValueOfObjCType:"I" at:&self->pages_swapped_out size:4];
      [v5 decodeValueOfObjCType:"I" at:&self->pages_dirtied size:4];
      [v5 decodeValueOfObjCType:"I" at:&self->ref_count size:4];
      if ([v5 versionForClassName:@"XRVMRegion"] < 2)
      {
        if (*MEMORY[0x263EF8AD0] >= *MEMORY[0x263EF8AE8]) {
          id v15 = (unsigned int *)MEMORY[0x263EF8AF0];
        }
        else {
          id v15 = (unsigned int *)MEMORY[0x263EF8AD8];
        }
        self->uint64_t region_page_shift = *v15;
      }
      else
      {
        [v5 decodeValueOfObjCType:"I" at:&self->region_page_shift size:4];
      }
      v16 = [v5 decodeObject];
      v17 = self->path;
      self->path = v16;

      unint64_t v18 = [v5 decodeObject];
      uint64_t v19 = self->type;
      self->type = v18;

      id v20 = (id)[v5 decodeObject];
    }
    unint64_t v21 = *MEMORY[0x263EF8AE0];
    if (*MEMORY[0x263EF8AE0] >= *MEMORY[0x263EF8AF8]) {
      unint64_t v21 = *MEMORY[0x263EF8AF8];
    }
    self->_pageSize = v21;
  }

  return self;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)XRVMRegion;
  id v4 = [(XRVMRegion *)&v10 description];
  uint64_t v5 = [(XRVMRegion *)self displayType];
  id v6 = (void *)v5;
  path = (__CFString *)self->path;
  if (!path)
  {
    if (self->is_submap) {
      path = @"(submap)";
    }
    else {
      path = &stru_26E517620;
    }
  }
  int v8 = [v3 stringWithFormat:@"%@  %16@ %#16llx-%#16llx %1x/%1x %@", v4, v5, self->start, self->length + self->start, self->current_prot, self->max_prot, path];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (XRVMRegion *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)XRVMRegion;
    BOOL v9 = [(XRVMRegion *)&v11 isEqual:v4];
    goto LABEL_20;
  }
  uint64_t v5 = v4;
  id v6 = v5;
  if (self->start == v5->start
    && self->length == v5->length
    && self->current_prot == v5->current_prot
    && self->max_prot == v5->max_prot
    && self->user_tag == v5->user_tag
    && self->pages_resident == v5->pages_resident
    && self->pages_shared_now_private == v5->pages_shared_now_private
    && self->pages_swapped_out == v5->pages_swapped_out
    && self->pages_dirtied == v5->pages_dirtied)
  {
    path = self->path;
    if (!path)
    {
      BOOL v9 = 1;
      goto LABEL_17;
    }
    int v8 = v6->path;
    BOOL v9 = 1;
    if (!v8 || path == v8 || -[NSString isEqualToString:](path, "isEqualToString:")) {
      goto LABEL_17;
    }
  }
  BOOL v9 = 0;
LABEL_17:

LABEL_20:
  return v9;
}

- (BOOL)matchesAddr:(unint64_t)a3 size:(unint64_t)a4 regionInfo:(vm_region_submap_info_64 *)a5
{
  return self->start == a3
      && self->length == a4
      && self->current_prot == a5->protection
      && self->max_prot == a5->max_protection
      && a5->user_tag == self->user_tag
      && self->pages_resident == a5->pages_resident
      && self->pages_shared_now_private == a5->pages_shared_now_private
      && self->pages_swapped_out == a5->pages_swapped_out
      && self->pages_dirtied == a5->pages_dirtied;
}

- (BOOL)regionMatch:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v5 = v4;
  BOOL v6 = *(_OWORD *)&self->start == *(_OWORD *)(v4 + 8) && [(XRVMRegion *)self typeMatches:v4];

  return v6;
}

- (BOOL)typeMatches:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  BOOL v10 = 0;
  if (v4)
  {
    if (self->current_prot == *((_DWORD *)v4 + 6)
      && self->max_prot == *((_DWORD *)v4 + 7)
      && self->user_tag == *((unsigned __int8 *)v4 + 34)
      && self->external_pager == *((unsigned __int8 *)v4 + 32))
    {
      type = self->type;
      if (!type
        || (CFArrayRef v7 = (NSString *)v5[6]) == 0
        || type == v7
        || -[NSString isEqualToString:](type, "isEqualToString:"))
      {
        path = self->path;
        if (!path
          || (BOOL v9 = (NSString *)v5[5]) == 0
          || path == v9
          || -[NSString isEqualToString:](path, "isEqualToString:"))
        {
          BOOL v10 = 1;
        }
      }
    }
  }

  return v10;
}

- (BOOL)isAdjacentTo:(id)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t start = self->start;
  uint64_t v4 = *((void *)a3 + 1);
  return start == *((void *)a3 + 2) + v4 || self->length + start == v4;
}

- (void)setPath:(id)a3 type:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  path = self->path;
  if (!path || ![(NSString *)path isEqualToString:v13])
  {
    int v8 = (NSString *)[v13 copy];
    BOOL v9 = self->path;
    self->path = v8;
  }
  type = self->type;
  if (!type || ![(NSString *)type isEqualToString:v6])
  {
    objc_super v11 = (NSString *)[v6 copy];
    objc_super v12 = self->type;
    self->type = v11;
  }
}

- (void)setAddress:(unint64_t)a3 size:(unint64_t)a4
{
  self->unint64_t start = a3;
  self->unint64_t length = a4;
}

- (void)_setResident:(unsigned int)a3 dirty:(unsigned int)a4 swapped:(unsigned int)a5 speculative:(unsigned int)a6
{
  self->uint64_t pages_resident = a3;
  self->uint64_t pages_swapped_out = a5;
  self->uint64_t pages_dirtied = a4;
}

- (BOOL)isSubmapRegion
{
  return self->is_submap;
}

- (unint64_t)location
{
  return self->start;
}

- (unint64_t)virtualSize
{
  uint64_t v2 = *MEMORY[0x263EF8AD0];
  if (*MEMORY[0x263EF8AD0] >= *MEMORY[0x263EF8AE8]) {
    uint64_t v2 = *MEMORY[0x263EF8AE8];
  }
  return (v2 + self->length) & ~v2;
}

- (unsigned)virtualPages
{
  uint64_t v2 = *MEMORY[0x263EF8AD0];
  if (*MEMORY[0x263EF8AD0] >= *MEMORY[0x263EF8AE8]) {
    uint64_t v2 = *MEMORY[0x263EF8AE8];
  }
  return ((v2 + self->length) & ~v2) / self->_pageSize;
}

- (unint64_t)residentSize
{
  return self->_pageSize * self->pages_resident;
}

- (unint64_t)dirtySize
{
  return self->_pageSize * self->pages_dirtied;
}

- (unint64_t)swappedSize
{
  return self->_pageSize * self->pages_swapped_out;
}

- (unsigned)tag
{
  return self->user_tag;
}

- (id)type
{
  return self->type;
}

- (id)path
{
  return self->path;
}

- (int)currentProtection
{
  int current_prot = self->current_prot;
  if (current_prot >= 7) {
    int current_prot = 7;
  }
  return current_prot & ~(current_prot >> 31);
}

- (int)maxProtection
{
  int max_prot = self->max_prot;
  if (max_prot >= 7) {
    int max_prot = 7;
  }
  return max_prot & ~(max_prot >> 31);
}

- (id)displayType
{
  type = self->type;
  if (type)
  {
    v3 = type;
  }
  else
  {
    VMURegionTypeDescriptionForTagShareProtAndPager();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)displayPath
{
  if (self->path) {
    return self->path;
  }
  else {
    return &stru_26E517620;
  }
}

- (BOOL)isNullRegion
{
  return !self->user_tag && !self->current_prot && !self->max_prot && self->share_mode == 3;
}

- (unint64_t)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(unint64_t)a3
{
  self->_pageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->type, 0);
  objc_storeStrong((id *)&self->path, 0);
}

@end