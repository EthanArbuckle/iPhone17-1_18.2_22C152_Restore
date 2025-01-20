@interface BWVideoFormatRequirements
+ (BOOL)supportsSecureCoding;
+ (id)cacheModesForCacheProfile:(int)a3;
+ (id)cacheModesForOptimizedCPUAccess;
+ (id)cacheModesForOptimizedDisplayAccess;
+ (id)cacheModesForOptimizedHWAccess;
+ (id)formatRequirements;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)memoryPoolUseAllowed;
- (BOOL)prewireBuffers;
- (BWVideoFormatRequirements)init;
- (BWVideoFormatRequirements)initWithCoder:(id)a3;
- (BWVideoFormatRequirements)initWithPixelBufferAttributes:(id)a3;
- (Class)formatClass;
- (NSArray)preferredPixelFormats;
- (NSArray)supportedCacheModes;
- (NSArray)supportedColorSpaceProperties;
- (NSArray)supportedPixelFormats;
- (NSDictionary)pixelBufferAttributes;
- (id)_resolvePixelFormat;
- (id)debugDescription;
- (id)description;
- (uint64_t)_resolveWith:(uint64_t)result printErrors:(void *)a2;
- (unint64_t)bytesPerRowAlignment;
- (unint64_t)height;
- (unint64_t)heightAlignment;
- (unint64_t)planeAlignment;
- (unint64_t)sliceCount;
- (unint64_t)width;
- (unint64_t)widthAlignment;
- (unsigned)mediaType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBytesPerRowAlignment:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setHeightAlignment:(unint64_t)a3;
- (void)setMemoryPoolUseAllowed:(BOOL)a3;
- (void)setPlaneAlignment:(unint64_t)a3;
- (void)setPreferredPixelFormats:(id)a3;
- (void)setPrewireBuffers:(BOOL)a3;
- (void)setSliceCount:(unint64_t)a3;
- (void)setSupportedCacheModes:(id)a3;
- (void)setSupportedColorSpaceProperties:(id)a3;
- (void)setSupportedPixelFormats:(id)a3;
- (void)setWidth:(unint64_t)a3;
- (void)setWidthAlignment:(unint64_t)a3;
@end

@implementation BWVideoFormatRequirements

- (NSDictionary)pixelBufferAttributes
{
  v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  if (self->_width)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
    [(NSDictionary *)v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F24E10]];
  }
  if (self->_height)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
    [(NSDictionary *)v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F24D08]];
  }
  if (self->_sliceCount)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
    [(NSDictionary *)v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F24D48]];
  }
  [(NSDictionary *)v3 setObject:self->_supportedPixelFormats forKeyedSubscript:*MEMORY[0x1E4F24D70]];
  if (self->_bytesPerRowAlignment)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
    [(NSDictionary *)v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F24C98]];
  }
  unint64_t widthAlignment = self->_widthAlignment;
  if (widthAlignment)
  {
    unint64_t width = self->_width;
    if (width)
    {
      unint64_t v10 = width % widthAlignment;
      if (widthAlignment - v10 >= widthAlignment ? -(uint64_t)v10 : widthAlignment - v10)
      {
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
        [(NSDictionary *)v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F24CE8]];
      }
    }
  }
  unint64_t heightAlignment = self->_heightAlignment;
  if (heightAlignment)
  {
    unint64_t height = self->_height;
    if (height)
    {
      unint64_t v15 = height % heightAlignment;
      if (heightAlignment - v15 >= heightAlignment ? -(uint64_t)v15 : heightAlignment - v15)
      {
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
        [(NSDictionary *)v3 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F24CD0]];
      }
    }
  }
  if (self->_planeAlignment)
  {
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLong:");
    [(NSDictionary *)v3 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F24D78]];
  }
  supportedCacheModes = self->_supportedCacheModes;
  if (supportedCacheModes) {
    [(NSDictionary *)v3 setObject:supportedCacheModes forKeyedSubscript:*MEMORY[0x1E4F24CB0]];
  }
  v20 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v21 = v20;
  if (!self->_prewireBuffers) {
    [v20 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F2F268]];
  }
  [(NSDictionary *)v3 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F24D20]];
  if (FigCapturePlatformIOSurfaceWiringAssertionEnabled()) {
    [(NSDictionary *)v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F24D30]];
  }
  return v3;
}

- (void)setSupportedColorSpaceProperties:(id)a3
{
}

- (id)_resolvePixelFormat
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    result = (id *)[result[4] count];
    if ((unint64_t)result >= 2)
    {
      id v2 = v1[4];
      id v3 = v1[5];
      if (v3)
      {
        long long v13 = 0u;
        long long v14 = 0u;
        long long v11 = 0u;
        long long v12 = 0u;
        uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0;
          uint64_t v7 = *(void *)v12;
          do
          {
            for (uint64_t i = 0; i != v5; ++i)
            {
              if (*(void *)v12 != v7) {
                objc_enumerationMutation(v3);
              }
              uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
              if ([v2 containsObject:v9])
              {
                if (!v6) {
                  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
                }
                [v6 addObject:v9];
              }
            }
            uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
          }
          while (v5);
        }
        else
        {
          uint64_t v6 = 0;
        }
        if ([v6 count]) {
          id v2 = v6;
        }
      }
      uint64_t v10 = FigCapturePixelFormatWithLeastAverageBandwidth(v2);

      uint64_t v15 = [NSNumber numberWithUnsignedInt:v10];
      result = (id *)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      v1[4] = result;
    }
  }
  return result;
}

- (uint64_t)_resolveWith:(uint64_t)result printErrors:(void *)a2
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t v4 = [a2 width];
  uint64_t v5 = *(void *)(v3 + 8);
  if (v5) {
    BOOL v6 = v5 == v4;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = v6;
  if (v4 && v7)
  {
    *(void *)(v3 + 8) = v4;
  }
  else
  {
    char v8 = v7 ^ 1;
    if (!v4) {
      char v8 = 0;
    }
    if (v8) {
      return 0;
    }
  }
  uint64_t v9 = [a2 height];
  uint64_t v10 = *(void *)(v3 + 16);
  if (v10) {
    BOOL v11 = v10 == v9;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = v11;
  if (v9 && v12)
  {
    *(void *)(v3 + 16) = v9;
  }
  else
  {
    char v13 = v12 ^ 1;
    if (!v9) {
      char v13 = 0;
    }
    if (v13) {
      return 0;
    }
  }
  uint64_t v14 = [a2 sliceCount];
  uint64_t v15 = *(void *)(v3 + 24);
  if (v15) {
    BOOL v16 = v15 == v14;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = v16;
  if (!v14 || !v17)
  {
    char v18 = v17 ^ 1;
    if (!v14) {
      char v18 = 0;
    }
    if ((v18 & 1) == 0) {
      goto LABEL_38;
    }
    return 0;
  }
  *(void *)(v3 + 24) = v14;
LABEL_38:
  result = vfr_resolveNumericalArrays((id *)(v3 + 32), (void *)[a2 supportedPixelFormats]);
  if (result)
  {
    vfr_resolveNumericalArrays((id *)(v3 + 40), (void *)[a2 preferredPixelFormats]);
    id v19 = (id)objc_msgSend(*(id *)(v3 + 40), "bw_intersectWithArray:", *(void *)(v3 + 32));

    *(void *)(v3 + 40) = v19;
    result = vfr_resolveNumericalArrays((id *)(v3 + 48), (void *)[a2 supportedColorSpaceProperties]);
    if (result)
    {
      result = vfr_resolveNumericalArrays((id *)(v3 + 88), (void *)[a2 supportedCacheModes]);
      if (result)
      {
        vfr_resolveOptionalAlignmentFactors((uint64_t *)(v3 + 56), [a2 bytesPerRowAlignment]);
        vfr_resolveOptionalAlignmentFactors((uint64_t *)(v3 + 64), [a2 planeAlignment]);
        vfr_resolveOptionalAlignmentFactors((uint64_t *)(v3 + 72), [a2 widthAlignment]);
        vfr_resolveOptionalAlignmentFactors((uint64_t *)(v3 + 80), [a2 heightAlignment]);
        if (*(unsigned char *)(v3 + 96)) {
          char v20 = [a2 prewireBuffers];
        }
        else {
          char v20 = 0;
        }
        *(unsigned char *)(v3 + 96) = v20;
        if (*(unsigned char *)(v3 + 97) && ([a2 memoryPoolUseAllowed], *(unsigned char *)(v3 + 97))) {
          char v21 = [a2 memoryPoolUseAllowed];
        }
        else {
          char v21 = 0;
        }
        *(unsigned char *)(v3 + 97) = v21;
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)memoryPoolUseAllowed
{
  return self->_memoryPoolUseAllowed;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v13 = v4;
    uint64_t v14 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [a3 width] == self->_width
      && [a3 height] == self->_height
      && [a3 sliceCount] == self->_sliceCount
      && [a3 bytesPerRowAlignment] == self->_bytesPerRowAlignment
      && [a3 planeAlignment] == self->_planeAlignment
      && [a3 widthAlignment] == self->_widthAlignment
      && [a3 heightAlignment] == self->_heightAlignment
      && self->_prewireBuffers == [a3 prewireBuffers]
      && self->_memoryPoolUseAllowed == [a3 memoryPoolUseAllowed])
    {
      if (((NSArray *)[a3 supportedPixelFormats] == self->_supportedPixelFormats
         || (int v11 = objc_msgSend((id)objc_msgSend(a3, "supportedPixelFormats"), "isEqual:", self->_supportedPixelFormats)) != 0)
        && ((NSArray *)objc_msgSend(a3, "preferredPixelFormats", v6, v5, v13, v14, v7, v8) == self->_preferredPixelFormats
         || (int v11 = objc_msgSend((id)objc_msgSend(a3, "preferredPixelFormats"), "isEqual:", self->_preferredPixelFormats)) != 0)
        && ((NSArray *)[a3 supportedColorSpaceProperties] == self->_supportedColorSpaceProperties
         || (int v11 = objc_msgSend((id)objc_msgSend(a3, "supportedColorSpaceProperties"), "isEqual:", self->_supportedColorSpaceProperties)) != 0))
      {
        if ((NSArray *)[a3 supportedCacheModes] == self->_supportedCacheModes) {
          LOBYTE(v11) = 1;
        }
        else {
          LOBYTE(v11) = objc_msgSend((id)objc_msgSend(a3, "supportedCacheModes"), "isEqual:", self->_supportedCacheModes);
        }
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (NSArray)supportedPixelFormats
{
  return self->_supportedPixelFormats;
}

- (unint64_t)width
{
  return self->_width;
}

- (NSArray)supportedCacheModes
{
  return self->_supportedCacheModes;
}

- (NSArray)supportedColorSpaceProperties
{
  return self->_supportedColorSpaceProperties;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)sliceCount
{
  return self->_sliceCount;
}

- (unint64_t)bytesPerRowAlignment
{
  return self->_bytesPerRowAlignment;
}

- (unint64_t)planeAlignment
{
  return self->_planeAlignment;
}

- (BOOL)prewireBuffers
{
  return self->_prewireBuffers;
}

- (unint64_t)widthAlignment
{
  return self->_widthAlignment;
}

- (unint64_t)heightAlignment
{
  return self->_heightAlignment;
}

- (NSArray)preferredPixelFormats
{
  return self->_preferredPixelFormats;
}

- (void)setSupportedCacheModes:(id)a3
{
}

- (BWVideoFormatRequirements)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoFormatRequirements;
  result = [(BWFormatRequirements *)&v3 init];
  if (result)
  {
    result->_prewireBuffers = 1;
    result->_memoryPoolUseAllowed = 1;
  }
  return result;
}

- (Class)formatClass
{
  return (Class)objc_opt_class();
}

- (BWVideoFormatRequirements)initWithPixelBufferAttributes:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v34.receiver = self;
    v34.super_class = (Class)BWVideoFormatRequirements;
    uint64_t v4 = [(BWFormatRequirements *)&v34 init];
    if (v4)
    {
      uint64_t v33 = *MEMORY[0x1E4F24E10];
      v4->_unint64_t width = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:"), "unsignedIntegerValue");
      uint64_t v32 = *MEMORY[0x1E4F24D08];
      v4->_unint64_t height = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:"), "unsignedIntegerValue");
      v4->_sliceCount = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D48]), "unsignedIntegerValue");
      uint64_t v31 = *MEMORY[0x1E4F24D70];
      uint64_t v5 = objc_msgSend(a3, "objectForKeyedSubscript:");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35[0] = v5;
        uint64_t v6 = (NSArray *)(id)[MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      }
      else
      {
        uint64_t v6 = (NSArray *)[v5 copy];
      }
      v4->_supportedPixelFormats = v6;
      uint64_t v7 = *MEMORY[0x1E4F24C98];
      v4->_bytesPerRowAlignment = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F24C98]), "unsignedIntegerValue");
      uint64_t v8 = *MEMORY[0x1E4F24D78];
      v4->_planeAlignment = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D78]), "unsignedIntegerValue");
      uint64_t v9 = *MEMORY[0x1E4F24CB0];
      uint64_t v10 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F24CB0]];
      if ([v10 count]) {
        v4->_supportedCacheModes = (NSArray *)[v10 copy];
      }
      v4->_prewireBuffers = 1;
      v4->_memoryPoolUseAllowed = 1;
      uint64_t v11 = *MEMORY[0x1E4F24D20];
      int v12 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F24D20]];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F2EFE8]];
        if (v14)
        {
          uint64_t v15 = v14;
          supportedCacheModes = v4->_supportedCacheModes;
          if (!supportedCacheModes
            || (objc_msgSend(-[NSArray objectAtIndexedSubscript:](supportedCacheModes, "objectAtIndexedSubscript:", 0), "isEqual:", v15), !v4->_supportedCacheModes))
          {
            v4->_supportedCacheModes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v15, 0);
          }
        }
        int v17 = (void *)[v13 objectForKeyedSubscript:*MEMORY[0x1E4F2F268]];
        if (v17) {
          v4->_prewireBuffers = [v17 BOOLValue];
        }
      }
      uint64_t v18 = *MEMORY[0x1E4F24CE8];
      id v19 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F24CE8]];
      if (v19)
      {
        unint64_t width = v4->_width;
        if (width)
        {
          uint64_t v21 = [v19 unsignedIntegerValue];
          unint64_t v22 = v21 + 1;
          while ((v21 + width) % v22 || !(width % v22))
          {
            if (++v22 > 0x1000)
            {
              unint64_t v22 = 0;
              break;
            }
          }
          v4->_unint64_t widthAlignment = v22;
        }
      }
      uint64_t v23 = *MEMORY[0x1E4F24CD0];
      v24 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F24CD0]];
      if (v24)
      {
        unint64_t height = v4->_height;
        if (height)
        {
          uint64_t v26 = [v24 unsignedIntegerValue];
          unint64_t v27 = v26 + 1;
          while ((v26 + height) % v27 || !(height % v27))
          {
            if (++v27 > 0x1000)
            {
              unint64_t v27 = 0;
              break;
            }
          }
          v4->_unint64_t heightAlignment = v27;
        }
      }
      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v33, v32, v31, v7, v8, v9, v18, v23, v11, 0);
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", objc_msgSend(a3, "allKeys"));
      [v29 minusSet:v28];
      [v29 count];
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoFormatRequirements;
  [(BWVideoFormatRequirements *)&v3 dealloc];
}

+ (id)cacheModesForOptimizedCPUAccess
{
  return vfr_cacheModesForOptimalAccess(0, 0);
}

- (void)setMemoryPoolUseAllowed:(BOOL)a3
{
  self->_memoryPoolUseAllowed = a3;
}

- (void)setWidthAlignment:(unint64_t)a3
{
  self->_unint64_t widthAlignment = a3;
}

- (void)setBytesPerRowAlignment:(unint64_t)a3
{
  self->_bytesPerRowAlignment = a3;
}

- (void)setHeightAlignment:(unint64_t)a3
{
  self->_unint64_t heightAlignment = a3;
}

- (void)setPlaneAlignment:(unint64_t)a3
{
  self->_planeAlignment = a3;
}

- (void)setSupportedPixelFormats:(id)a3
{
}

- (void)setWidth:(unint64_t)a3
{
  self->_unint64_t width = a3;
}

- (void)setHeight:(unint64_t)a3
{
  self->_unint64_t height = a3;
}

- (void)setPreferredPixelFormats:(id)a3
{
}

- (void)setPrewireBuffers:(BOOL)a3
{
  self->_prewireBuffers = a3;
}

+ (id)cacheModesForOptimizedHWAccess
{
  return vfr_cacheModesForOptimalAccess(1, 0);
}

- (void)setSliceCount:(unint64_t)a3
{
  self->_sliceCount = a3;
}

+ (id)cacheModesForOptimizedDisplayAccess
{
  return vfr_cacheModesForOptimalAccess(1, 1);
}

+ (void)initialize
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)formatRequirements
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BWVideoFormatRequirements)initWithCoder:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(BWVideoFormatRequirements *)self init];
  if (v4)
  {
    v4->_unint64_t width = [a3 decodeInt64ForKey:@"width"];
    v4->_unint64_t height = [a3 decodeInt64ForKey:@"height"];
    v4->_sliceCount = [a3 decodeInt64ForKey:@"numberOfSlices"];
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    uint64_t v6 = objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 2));
    v4->_supportedPixelFormats = (NSArray *)(id)[a3 decodeObjectOfClasses:v6 forKey:@"supportedPixelFormats"];
    v4->_preferredPixelFormats = (NSArray *)(id)[a3 decodeObjectOfClasses:v6 forKey:@"preferredPixelFormats"];
    v4->_supportedColorSpaceProperties = (NSArray *)(id)[a3 decodeObjectOfClasses:v6 forKey:@"supportedColorSpaceProperties"];
    v4->_bytesPerRowAlignment = [a3 decodeInt64ForKey:@"bytesPerRowAlignment"];
    v4->_planeAlignment = [a3 decodeInt64ForKey:@"planeAlignment"];
    v4->_unint64_t widthAlignment = [a3 decodeInt64ForKey:@"widthAlignment"];
    v4->_unint64_t heightAlignment = [a3 decodeInt64ForKey:@"heightAlignment"];
    v4->_supportedCacheModes = (NSArray *)(id)[a3 decodeObjectOfClasses:v6 forKey:@"supportedCacheModes"];
    v4->_prewireBuffers = [a3 decodeBoolForKey:@"prewireBuffers"];
    v4->_memoryPoolUseAllowed = [a3 decodeBoolForKey:@"memoryPoolUseAllowed"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_width forKey:@"width"];
  [a3 encodeInt64:self->_height forKey:@"height"];
  [a3 encodeInt64:self->_sliceCount forKey:@"numberOfSlices"];
  [a3 encodeObject:self->_supportedPixelFormats forKey:@"supportedPixelFormats"];
  [a3 encodeObject:self->_preferredPixelFormats forKey:@"preferredPixelFormats"];
  [a3 encodeObject:self->_supportedColorSpaceProperties forKey:@"supportedColorSpaceProperties"];
  [a3 encodeInt64:self->_bytesPerRowAlignment forKey:@"bytesPerRowAlignment"];
  [a3 encodeInt64:self->_planeAlignment forKey:@"planeAlignment"];
  [a3 encodeInt64:self->_widthAlignment forKey:@"widthAlignment"];
  [a3 encodeInt64:self->_heightAlignment forKey:@"heightAlignment"];
  [a3 encodeObject:self->_supportedCacheModes forKey:@"supportedCacheModes"];
  [a3 encodeBool:self->_prewireBuffers forKey:@"prewireBuffers"];
  BOOL memoryPoolUseAllowed = self->_memoryPoolUseAllowed;
  [a3 encodeBool:memoryPoolUseAllowed forKey:@"memoryPoolUseAllowed"];
}

- (unsigned)mediaType
{
  return 1986618469;
}

- (id)description
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithCapacity:0];
  uint64_t v4 = v3;
  if (self->_width) {
    objc_msgSend(v3, "appendFormat:", @"%i", self->_width);
  }
  else {
    [v3 appendString:@"[any width]"];
  }
  [v4 appendString:@" x "];
  if (self->_height) {
    objc_msgSend(v4, "appendFormat:", @"%i", self->_height);
  }
  else {
    [v4 appendString:@"[any height]"];
  }
  if (self->_sliceCount) {
    objc_msgSend(v4, "appendFormat:", @" x %i", self->_sliceCount);
  }
  unint64_t widthAlignment = self->_widthAlignment;
  if (widthAlignment || self->_heightAlignment)
  {
    unint64_t width = self->_width;
    if (width && (unint64_t height = self->_height) != 0)
    {
      if (width % widthAlignment) {
        unint64_t v8 = widthAlignment - width % widthAlignment;
      }
      else {
        unint64_t v8 = 0;
      }
      if (widthAlignment) {
        unint64_t v9 = v8;
      }
      else {
        unint64_t v9 = 0;
      }
      unint64_t v10 = v9 + width;
      unint64_t heightAlignment = self->_heightAlignment;
      if (height % heightAlignment) {
        unint64_t v12 = heightAlignment - height % heightAlignment;
      }
      else {
        unint64_t v12 = 0;
      }
      if (heightAlignment) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = 0;
      }
      objc_msgSend(v4, "appendFormat:", @" (%i x %i)", v10, v13 + height);
    }
    else
    {
      if (widthAlignment) {
        [v4 appendFormat:@", WidthAlignment = %i", self->_widthAlignment];
      }
      if (self->_heightAlignment) {
        [v4 appendFormat:@", HeightAlignment = %i", self->_heightAlignment, v42];
      }
    }
  }
  [v4 appendString:@", "];
  if ([(NSArray *)self->_supportedPixelFormats count])
  {
    if ([(NSArray *)self->_supportedPixelFormats count] == 1)
    {
      uint64_t v14 = BWStringFromCVPixelFormatType(objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_supportedPixelFormats, "objectAtIndexedSubscript:", 0), "unsignedIntValue"));
    }
    else
    {
      [v4 appendString:@"["];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      supportedPixelFormats = self->_supportedPixelFormats;
      uint64_t v16 = [(NSArray *)supportedPixelFormats countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        int v18 = 0;
        uint64_t v19 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v54 != v19) {
              objc_enumerationMutation(supportedPixelFormats);
            }
            uint64_t v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (-v18 != i) {
              [v4 appendString:@", "];
            }
            objc_msgSend(v4, "appendString:", BWStringFromCVPixelFormatType(objc_msgSend(v21, "unsignedIntValue")));
          }
          v18 += v17;
          uint64_t v17 = [(NSArray *)supportedPixelFormats countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v17);
      }
      uint64_t v14 = @"]";
    }
  }
  else
  {
    uint64_t v14 = @"[any pixel format]";
  }
  [v4 appendString:v14];
  if ([(NSArray *)self->_supportedColorSpaceProperties count])
  {
    [v4 appendString:@", ["];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    supportedColorSpaceProperties = self->_supportedColorSpaceProperties;
    uint64_t v23 = [(NSArray *)supportedColorSpaceProperties countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      v43 = self;
      int v25 = 0;
      uint64_t v26 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(supportedColorSpaceProperties);
          }
          v28 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          if (-v25 != j) {
            [v4 appendString:@", "];
          }
          [v4 appendFormat:@"%@", BWColorSpacePropertiesToString(objc_msgSend(v28, "unsignedIntValue"))];
        }
        v25 += v24;
        uint64_t v24 = [(NSArray *)supportedColorSpaceProperties countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v24);
      self = v43;
    }
    v29 = @"]";
  }
  else
  {
    v29 = @", [any color space]";
  }
  [v4 appendString:v29];
  if (self->_bytesPerRowAlignment) {
    [v4 appendFormat:@", BPRAlignment = %i", self->_bytesPerRowAlignment];
  }
  if (self->_planeAlignment) {
    [v4 appendFormat:@", PlaneAlignment = %i", self->_planeAlignment];
  }
  if ([(NSArray *)self->_supportedCacheModes count])
  {
    [v4 appendString:@", CacheModes = ["];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    supportedCacheModes = self->_supportedCacheModes;
    uint64_t v31 = [(NSArray *)supportedCacheModes countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      int v33 = 0;
      uint64_t v34 = *(void *)v46;
      do
      {
        uint64_t v35 = 0;
        int v44 = v33;
        int v36 = -v33;
        do
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(supportedCacheModes);
          }
          v37 = *(void **)(*((void *)&v45 + 1) + 8 * v35);
          if (v36 != v35) {
            [v4 appendString:@", "];
          }
          HIDWORD(v39) = [v37 unsignedIntValue];
          LODWORD(v39) = HIDWORD(v39);
          unsigned int v38 = v39 >> 8;
          v40 = @"Unknown";
          if (v38 <= 7) {
            v40 = off_1E5C29CB0[v38];
          }
          [v4 appendString:v40];
          ++v35;
        }
        while (v32 != v35);
        int v33 = v44 + v32;
        uint64_t v32 = [(NSArray *)supportedCacheModes countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v32);
    }
    [v4 appendString:@"]"];
  }
  return v4;
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v4), self, -[BWVideoFormatRequirements description](self, "description")];
}

+ (id)cacheModesForCacheProfile:(int)a3
{
  return 0;
}

@end