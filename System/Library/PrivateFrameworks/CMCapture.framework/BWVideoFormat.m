@interface BWVideoFormat
+ (id)colorInfoWithSourceColorSpace:(int)a3 sourcePixelFormat:(unsigned int)a4 sourceDimensions:(id)a5 requestedPixelFormat:(unsigned int)a6;
+ (id)formatByResolvingRequirements:(id)a3;
+ (id)formatByResolvingRequirements:(id)a3 printErrors:(BOOL)a4;
+ (id)pixelBufferAttachmentsForColorSpaceProperties:(int)a3;
+ (int)colorSpacePropertiesForPixelBufferAttachments:(id)a3;
+ (int)colorSpacePropertiesForSourceThatSupportsWideColor:(BOOL)a3 sourceColorSpace:(int)a4 sourcePixelFormat:(unsigned int)a5 sourceDimensions:(id)a6 requestedPixelFormat:(unsigned int)a7;
+ (int)colorSpacePropertiesForSourceThatSupportsWideColor:(BOOL)a3 sourceColorSpace:(int)a4 sourcePixelFormat:(unsigned int)a5 sourceDimensions:(id)a6 requestedPixelFormat:(unsigned int)a7 supportedColorSpaces:(id)a8;
+ (int)colorSpacePropertiesWithSourceColorSpace:(int)a3 sourcePixelFormat:(unsigned int)a4 sourceDimensions:(id)a5 requestedPixelFormat:(unsigned int)a6;
+ (int)colorSpacePropertiesWithSourceColorSpace:(int)a3 sourcePixelFormat:(unsigned int)a4 sourceDimensions:(id)a5 requestedPixelFormat:(unsigned int)a6 supportedColorSpaces:(id)a7;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHLGColorSpace;
- (BOOL)memoryPoolUseAllowed;
- (BOOL)prewireBuffers;
- (NSDictionary)pixelBufferAttributes;
- (id)debugDescription;
- (id)description;
- (int)colorSpaceProperties;
- (opaqueCMFormatDescription)formatDescription;
- (unint64_t)bytesPerRowAlignment;
- (unint64_t)extendedHeight;
- (unint64_t)extendedWidth;
- (unint64_t)height;
- (unint64_t)planeAlignment;
- (unint64_t)sliceCount;
- (unint64_t)width;
- (unsigned)cacheMode;
- (unsigned)mediaType;
- (unsigned)pixelFormat;
- (void)_initWithResolvedRequirements:(void *)a1;
- (void)dealloc;
- (void)setBytesPerRowAlignment:(unint64_t)a3;
- (void)setCacheMode:(unsigned int)a3;
- (void)setExtendedHeight:(unint64_t)a3;
- (void)setExtendedWidth:(unint64_t)a3;
- (void)setHeight:(unint64_t)a3;
- (void)setMemoryPoolUseAllowed:(BOOL)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setPlaneAlignment:(unint64_t)a3;
- (void)setPrewireBuffers:(BOOL)a3;
- (void)setSliceCount:(unint64_t)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation BWVideoFormat

+ (id)formatByResolvingRequirements:(id)a3
{
  return (id)[a1 formatByResolvingRequirements:a3 printErrors:1];
}

- (NSDictionary)pixelBufferAttributes
{
  return self->_pixelBufferAttributes;
}

+ (id)formatByResolvingRequirements:(id)a3 printErrors:(BOOL)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![a3 count])
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = @"requirements array must have 1 or more objects";
LABEL_25:
    objc_exception_throw((id)[v15 exceptionWithName:v16 reason:v17 userInfo:0]);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v23 != v7) {
        objc_enumerationMutation(a3);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v16 = *MEMORY[0x1E4F1C3C8];
        v17 = @"requirementsArray must contain BWVideoFormatRequirements objects";
        goto LABEL_25;
      }
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v22 objects:v29 count:16];
  }
  while (v6);
LABEL_10:
  v9 = objc_alloc_init(BWVideoFormatRequirements);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
LABEL_12:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(a3);
      }
      if (!-[BWVideoFormatRequirements _resolveWith:printErrors:]((uint64_t)v9, *(void **)(*((void *)&v18 + 1) + 8 * v13)))return 0; {
      if (v11 == ++v13)
      }
      {
        uint64_t v11 = [a3 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v11) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    if (![(NSArray *)[(BWVideoFormatRequirements *)v9 supportedPixelFormats] count])
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    -[BWVideoFormatRequirements _resolvePixelFormat]((id *)&v9->super.super.isa);
    if ([(NSArray *)[(BWVideoFormatRequirements *)v9 supportedCacheModes] count] >= 2)
    {
      uint64_t v27 = [(NSArray *)[(BWVideoFormatRequirements *)v9 supportedCacheModes] firstObject];
      -[BWVideoFormatRequirements setSupportedCacheModes:](v9, "setSupportedCacheModes:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1]);
    }
    if ([(NSArray *)[(BWVideoFormatRequirements *)v9 supportedColorSpaceProperties] count] >= 2)
    {
      uint64_t v26 = [(NSArray *)[(BWVideoFormatRequirements *)v9 supportedColorSpaceProperties] firstObject];
      -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1]);
    }
    return -[BWVideoFormat _initWithResolvedRequirements:]([BWVideoFormat alloc], v9);
  }
}

- (void)_initWithResolvedRequirements:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    if (a2
      && objc_msgSend((id)objc_msgSend(a2, "supportedPixelFormats"), "count") == 1
      && (v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "supportedPixelFormats"), "firstObject"), "unsignedIntValue")) != 0&& ((int v5 = v4, (FigCapturePixelFormatIsVersatileRaw(v4) & 1) != 0)|| objc_msgSend(a2, "width") && objc_msgSend(a2, "height"))&& (unint64_t)objc_msgSend((id)objc_msgSend(a2, "supportedCacheModes"), "count") <= 1&& (unint64_t)objc_msgSend((id)objc_msgSend(a2, "supportedColorSpaceProperties"), "count") <= 1&& (v13.receiver = v2, v13.super_class = (Class)BWVideoFormat, (v2 = objc_msgSendSuper2(&v13, sel_init)) != 0))
    {
      v2[1] = [a2 width];
      v2[2] = [a2 height];
      *((_DWORD *)v2 + 8) = v5;
      v2[3] = [a2 sliceCount];
      v2[5] = [a2 bytesPerRowAlignment];
      v2[6] = [a2 planeAlignment];
      *((_DWORD *)v2 + 18) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "supportedCacheModes"), "firstObject"), "unsignedIntValue");
      unint64_t v6 = a2[9];
      if (v6)
      {
        unint64_t v7 = a2[1];
        if (v7)
        {
          unint64_t v8 = v7 % v6;
          if (v6 - v8 >= v6) {
            unint64_t v6 = -(uint64_t)v8;
          }
          else {
            v6 -= v8;
          }
        }
        else
        {
          unint64_t v6 = 0;
        }
      }
      v2[7] = v6 + v2[1];
      unint64_t v9 = a2[10];
      if (v9)
      {
        unint64_t v10 = a2[2];
        if (v10)
        {
          unint64_t v11 = v10 % v9;
          if (v9 - v11 >= v9) {
            unint64_t v9 = -(uint64_t)v11;
          }
          else {
            v9 -= v11;
          }
        }
        else
        {
          unint64_t v9 = 0;
        }
      }
      v2[8] = v9 + v2[2];
      *((unsigned char *)v2 + 76) = [a2 prewireBuffers];
      *((unsigned char *)v2 + 77) = [a2 memoryPoolUseAllowed];
      v2[10] = objc_msgSend((id)objc_msgSend(a2, "pixelBufferAttributes"), "copy");
      *((_DWORD *)v2 + 22) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "supportedColorSpaceProperties"), "firstObject"), "intValue");
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (int)colorSpaceProperties
{
  return self->_colorSpaceProperties;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)bytesPerRowAlignment
{
  return self->_bytesPerRowAlignment;
}

- (BOOL)prewireBuffers
{
  return self->_prewireBuffers;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t v5 = [(BWVideoFormat *)self width];
  if (v5 != [a3 width]) {
    return 0;
  }
  unint64_t v6 = [(BWVideoFormat *)self height];
  if (v6 != [a3 height]) {
    return 0;
  }
  unint64_t v7 = [(BWVideoFormat *)self sliceCount];
  if (v7 != [a3 sliceCount]) {
    return 0;
  }
  unsigned int v8 = [(BWVideoFormat *)self pixelFormat];
  if (v8 != [a3 pixelFormat]) {
    return 0;
  }
  unint64_t v9 = [(BWVideoFormat *)self bytesPerRowAlignment];
  if (v9 != [a3 bytesPerRowAlignment]) {
    return 0;
  }
  unint64_t v10 = [(BWVideoFormat *)self planeAlignment];
  if (v10 != [a3 planeAlignment]) {
    return 0;
  }
  unint64_t v11 = [(BWVideoFormat *)self extendedWidth];
  if (v11 != [a3 extendedWidth]) {
    return 0;
  }
  unint64_t v12 = [(BWVideoFormat *)self extendedHeight];
  if (v12 != [a3 extendedHeight]) {
    return 0;
  }
  unsigned int v13 = [(BWVideoFormat *)self cacheMode];
  return v13 == [a3 cacheMode];
}

- (unint64_t)sliceCount
{
  return self->_sliceCount;
}

- (unint64_t)planeAlignment
{
  return self->_planeAlignment;
}

+ (int)colorSpacePropertiesForSourceThatSupportsWideColor:(BOOL)a3 sourceColorSpace:(int)a4 sourcePixelFormat:(unsigned int)a5 sourceDimensions:(id)a6 requestedPixelFormat:(unsigned int)a7 supportedColorSpaces:(id)a8
{
  if (!a3) {
    return 0;
  }
  uint64_t v9 = *(void *)&a7;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  unsigned int v13 = objc_opt_class();
  return [v13 colorSpacePropertiesWithSourceColorSpace:v12 sourcePixelFormat:v11 sourceDimensions:a6 requestedPixelFormat:v9 supportedColorSpaces:a8];
}

+ (int)colorSpacePropertiesWithSourceColorSpace:(int)a3 sourcePixelFormat:(unsigned int)a4 sourceDimensions:(id)a5 requestedPixelFormat:(unsigned int)a6 supportedColorSpaces:(id)a7
{
  int var0 = a5.var0;
  if ((FigCapturePixelFormatIsYCbCr(a4) & 1) != 0 || (int result = FigCapturePixelFormatIsBGRA(a4)) != 0)
  {
    int IsWide = BWColorSpaceIsWide(a3);
    if (FigCapturePixelFormatIsBGRA(a6)) {
      uint64_t v14 = a4;
    }
    else {
      uint64_t v14 = a6;
    }
    int v15 = FigCaptureUncompressedPixelFormatForPixelFormat(v14);
    if (v15 == 875704438)
    {
      if (IsWide) {
        int v17 = 4;
      }
      else {
        int v17 = 2;
      }
      if (var0 < 960) {
        return 1;
      }
      else {
        return v17;
      }
    }
    else
    {
      int v16 = v15;
      if (v15 == 875704422)
      {
        if (IsWide) {
          return 3;
        }
        else {
          return 1;
        }
      }
      else if (FigCapturePixelFormatIsTenBit(v15))
      {
        if (a3 == 3)
        {
          return 10;
        }
        else if (IsWide)
        {
          if ([a7 containsObject:&unk_1EFB00E90]) {
            return 6;
          }
          else {
            return 5;
          }
        }
        else if (FigCapturePixelFormatIs422(v16))
        {
          return 2;
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

- (id)description
{
  v3 = (void *)[MEMORY[0x1E4F28E78] stringWithCapacity:0];
  objc_msgSend(v3, "appendFormat:", @"%i x %i", self->_width, self->_height);
  if (self->_sliceCount) {
    objc_msgSend(v3, "appendFormat:", @" x %i", self->_sliceCount);
  }
  unint64_t extendedHeight = self->_extendedHeight;
  if (self->_extendedWidth != self->_width || extendedHeight != self->_height) {
    objc_msgSend(v3, "appendFormat:", @" (%i x %i)", self->_extendedWidth, extendedHeight);
  }
  [v3 appendString:@", "];
  [v3 appendString:BWStringFromCVPixelFormatType(self->_pixelFormat)];
  unsigned int colorSpaceProperties = self->_colorSpaceProperties;
  if (colorSpaceProperties) {
    [v3 appendFormat:@", ColorSpace = %@", BWColorSpacePropertiesToString(colorSpaceProperties)];
  }
  if (self->_bytesPerRowAlignment) {
    [v3 appendFormat:@", BPRAlignment = %i", self->_bytesPerRowAlignment];
  }
  if (self->_planeAlignment) {
    [v3 appendFormat:@", PlaneAlignment = %i", self->_planeAlignment];
  }
  if (self->_cacheMode)
  {
    HIDWORD(v7) = self->_cacheMode;
    LODWORD(v7) = HIDWORD(v7);
    unsigned int v6 = v7 >> 8;
    if (v6 > 7) {
      unsigned int v8 = @"Unknown";
    }
    else {
      unsigned int v8 = off_1E5C29CB0[v6];
    }
    [v3 appendFormat:@", CacheMode = %@", v8];
  }
  if (self->_memoryPoolUseAllowed) {
    [v3 appendFormat:@", MemoryPoolUseAllowed"];
  }
  return v3;
}

- (unint64_t)extendedWidth
{
  return self->_extendedWidth;
}

- (unint64_t)extendedHeight
{
  return self->_extendedHeight;
}

+ (id)pixelBufferAttachmentsForColorSpaceProperties:(int)a3
{
  v61[3] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
      uint64_t v3 = *MEMORY[0x1E4F24AB0];
      uint64_t v4 = *MEMORY[0x1E4F24C18];
      v56[0] = *MEMORY[0x1E4F24A90];
      v56[1] = v4;
      uint64_t v5 = *MEMORY[0x1E4F24C40];
      v57[0] = v3;
      v57[1] = v5;
      v56[2] = *MEMORY[0x1E4F24BC8];
      v57[2] = *MEMORY[0x1E4F24BE0];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v57;
      unsigned int v8 = v56;
      goto LABEL_14;
    case 2:
      uint64_t v10 = *MEMORY[0x1E4F24AB0];
      uint64_t v11 = *MEMORY[0x1E4F24C18];
      v54[0] = *MEMORY[0x1E4F24A90];
      v54[1] = v11;
      uint64_t v12 = *MEMORY[0x1E4F24C48];
      v55[0] = v10;
      v55[1] = v12;
      v54[2] = *MEMORY[0x1E4F24BC8];
      v55[2] = *MEMORY[0x1E4F24BE0];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v55;
      unsigned int v8 = v54;
      goto LABEL_14;
    case 3:
      uint64_t v13 = *MEMORY[0x1E4F24AC0];
      uint64_t v14 = *MEMORY[0x1E4F24C18];
      v60[0] = *MEMORY[0x1E4F24A90];
      v60[1] = v14;
      uint64_t v15 = *MEMORY[0x1E4F24C40];
      v61[0] = v13;
      v61[1] = v15;
      v60[2] = *MEMORY[0x1E4F24BC8];
      v61[2] = *MEMORY[0x1E4F24BE0];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v61;
      unsigned int v8 = v60;
      goto LABEL_14;
    case 4:
      uint64_t v16 = *MEMORY[0x1E4F24AC0];
      uint64_t v17 = *MEMORY[0x1E4F24C18];
      v58[0] = *MEMORY[0x1E4F24A90];
      v58[1] = v17;
      uint64_t v18 = *MEMORY[0x1E4F24C48];
      v59[0] = v16;
      v59[1] = v18;
      v58[2] = *MEMORY[0x1E4F24BC8];
      v59[2] = *MEMORY[0x1E4F24BE0];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v59;
      unsigned int v8 = v58;
      goto LABEL_14;
    case 5:
      uint64_t v19 = *MEMORY[0x1E4F24AC0];
      uint64_t v20 = *MEMORY[0x1E4F24C18];
      v52[0] = *MEMORY[0x1E4F24A90];
      v52[1] = v20;
      uint64_t v21 = *MEMORY[0x1E4F24C48];
      v53[0] = v19;
      v53[1] = v21;
      v52[2] = *MEMORY[0x1E4F24BC8];
      v53[2] = *MEMORY[0x1E4F24BD8];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v53;
      unsigned int v8 = v52;
      goto LABEL_14;
    case 6:
      uint64_t v22 = *MEMORY[0x1E4F24AA8];
      uint64_t v23 = *MEMORY[0x1E4F24C18];
      v48[0] = *MEMORY[0x1E4F24A90];
      v48[1] = v23;
      uint64_t v24 = *MEMORY[0x1E4F24C30];
      v49[0] = v22;
      v49[1] = v24;
      v48[2] = *MEMORY[0x1E4F24BC8];
      v49[2] = *MEMORY[0x1E4F24BD8];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v49;
      unsigned int v8 = v48;
      goto LABEL_14;
    case 7:
      uint64_t v25 = *MEMORY[0x1E4F24AC0];
      uint64_t v26 = *MEMORY[0x1E4F24C18];
      v50[0] = *MEMORY[0x1E4F24A90];
      v50[1] = v26;
      uint64_t v27 = *MEMORY[0x1E4F24C40];
      v51[0] = v25;
      v51[1] = v27;
      v50[2] = *MEMORY[0x1E4F24BC8];
      v51[2] = *MEMORY[0x1E4F24BD8];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v51;
      unsigned int v8 = v50;
      goto LABEL_14;
    case 8:
      uint64_t v28 = *MEMORY[0x1E4F24AC0];
      uint64_t v29 = *MEMORY[0x1E4F24C18];
      v46[0] = *MEMORY[0x1E4F24A90];
      v46[1] = v29;
      uint64_t v30 = *MEMORY[0x1E4F24C48];
      v47[0] = v28;
      v47[1] = v30;
      v46[2] = *MEMORY[0x1E4F24BC8];
      v47[2] = *MEMORY[0x1E4F24BE8];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v47;
      unsigned int v8 = v46;
      goto LABEL_14;
    case 9:
      uint64_t v31 = *MEMORY[0x1E4F24AC0];
      uint64_t v32 = *MEMORY[0x1E4F24C18];
      v44[0] = *MEMORY[0x1E4F24A90];
      v44[1] = v32;
      uint64_t v33 = *MEMORY[0x1E4F24C40];
      v45[0] = v31;
      v45[1] = v33;
      v44[2] = *MEMORY[0x1E4F24BC8];
      v45[2] = *MEMORY[0x1E4F24BE8];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v45;
      unsigned int v8 = v44;
      goto LABEL_14;
    case 10:
      uint64_t v34 = *MEMORY[0x1E4F24AA8];
      uint64_t v35 = *MEMORY[0x1E4F24C18];
      v42[0] = *MEMORY[0x1E4F24A90];
      v42[1] = v35;
      uint64_t v36 = *MEMORY[0x1E4F24C30];
      v43[0] = v34;
      v43[1] = v36;
      v42[2] = *MEMORY[0x1E4F24B78];
      v43[2] = *MEMORY[0x1E4F24B80];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v43;
      unsigned int v8 = v42;
      goto LABEL_14;
    case 11:
      uint64_t v37 = *MEMORY[0x1E4F24AC0];
      uint64_t v38 = *MEMORY[0x1E4F24C18];
      v40[0] = *MEMORY[0x1E4F24A90];
      v40[1] = v38;
      uint64_t v39 = *MEMORY[0x1E4F24C40];
      v41[0] = v37;
      v41[1] = v39;
      v40[2] = *MEMORY[0x1E4F24B78];
      v41[2] = *MEMORY[0x1E4F24B80];
      unsigned int v6 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v7 = v41;
      unsigned int v8 = v40;
LABEL_14:
      id result = (id)[v6 dictionaryWithObjects:v7 forKeys:v8 count:3];
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (BOOL)memoryPoolUseAllowed
{
  return self->_memoryPoolUseAllowed;
}

+ (int)colorSpacePropertiesForPixelBufferAttachments:(id)a3
{
  uint64_t v4 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F24A90]];
  uint64_t v5 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F24BC8]];
  unsigned int v6 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F24B78]];
  unint64_t v7 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F24C18]];
  uint64_t v8 = *MEMORY[0x1E4F24AC0];
  if ([v4 isEqualToString:*MEMORY[0x1E4F24AC0]]
    && [v7 isEqualToString:*MEMORY[0x1E4F24C40]]
    && ([v5 isEqualToString:*MEMORY[0x1E4F24BE0]] & 1) != 0)
  {
    return 3;
  }
  if ([v4 isEqualToString:v8])
  {
    uint64_t v10 = *MEMORY[0x1E4F24BE0];
    if ([v7 isEqualToString:*MEMORY[0x1E4F24BE0]])
    {
      if ([v5 isEqualToString:v10]) {
        return 4;
      }
    }
  }
  uint64_t v11 = *MEMORY[0x1E4F24AB0];
  if ([v4 isEqualToString:*MEMORY[0x1E4F24AB0]]
    && [v7 isEqualToString:*MEMORY[0x1E4F24C40]]
    && ([v5 isEqualToString:*MEMORY[0x1E4F24BE0]] & 1) != 0)
  {
    return 1;
  }
  if ([v4 isEqualToString:v11]
    && [v7 isEqualToString:*MEMORY[0x1E4F24C48]]
    && ([v5 isEqualToString:*MEMORY[0x1E4F24BE0]] & 1) != 0)
  {
    return 2;
  }
  if ([v4 isEqualToString:v8]
    && [v7 isEqualToString:*MEMORY[0x1E4F24C48]]
    && ([v5 isEqualToString:*MEMORY[0x1E4F24BD8]] & 1) != 0)
  {
    return 5;
  }
  if ([v4 isEqualToString:v8]
    && [v7 isEqualToString:*MEMORY[0x1E4F24C40]]
    && ([v5 isEqualToString:*MEMORY[0x1E4F24BD8]] & 1) != 0)
  {
    return 7;
  }
  uint64_t v12 = *MEMORY[0x1E4F24AA8];
  if ([v4 isEqualToString:*MEMORY[0x1E4F24AA8]]
    && [v7 isEqualToString:*MEMORY[0x1E4F24C30]]
    && ([v5 isEqualToString:*MEMORY[0x1E4F24BD8]] & 1) != 0)
  {
    return 6;
  }
  if ([v4 isEqualToString:v8]
    && [v7 isEqualToString:*MEMORY[0x1E4F24C48]]
    && ([v5 isEqualToString:*MEMORY[0x1E4F24BE8]] & 1) != 0)
  {
    return 8;
  }
  if ([v4 isEqualToString:v8]
    && [v7 isEqualToString:*MEMORY[0x1E4F24C40]]
    && ([v5 isEqualToString:*MEMORY[0x1E4F24BE8]] & 1) != 0)
  {
    return 9;
  }
  if ([v4 isEqualToString:v12]
    && [v7 isEqualToString:*MEMORY[0x1E4F24C30]]
    && !v5
    && ([v6 isEqualToString:*MEMORY[0x1E4F24B80]] & 1) != 0)
  {
    return 10;
  }
  int result = [v4 isEqualToString:v8];
  if (result)
  {
    int v13 = [v7 isEqualToString:*MEMORY[0x1E4F24C40]];
    int result = 0;
    if (v13)
    {
      if (!v5)
      {
        if ([v6 isEqualToString:*MEMORY[0x1E4F24B80]]) {
          return 11;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

- (unsigned)cacheMode
{
  return self->_cacheMode;
}

- (opaqueCMFormatDescription)formatDescription
{
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  if (CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], self->_pixelFormat, self->_width, self->_height, 0, &formatDescriptionOut))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return (opaqueCMFormatDescription *)CFAutorelease(formatDescriptionOut);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoFormat;
  [(BWVideoFormat *)&v3 dealloc];
}

- (BOOL)isHLGColorSpace
{
  return (self->_colorSpaceProperties - 5) < 3;
}

+ (void)initialize
{
}

- (unsigned)mediaType
{
  return 1986618469;
}

- (id)debugDescription
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v4), self, -[BWVideoFormat description](self, "description")];
}

+ (int)colorSpacePropertiesForSourceThatSupportsWideColor:(BOOL)a3 sourceColorSpace:(int)a4 sourcePixelFormat:(unsigned int)a5 sourceDimensions:(id)a6 requestedPixelFormat:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  BOOL v11 = a3;
  uint64_t v12 = objc_opt_class();
  return [v12 colorSpacePropertiesForSourceThatSupportsWideColor:v11 sourceColorSpace:v10 sourcePixelFormat:v9 sourceDimensions:a6 requestedPixelFormat:v7 supportedColorSpaces:0];
}

+ (int)colorSpacePropertiesWithSourceColorSpace:(int)a3 sourcePixelFormat:(unsigned int)a4 sourceDimensions:(id)a5 requestedPixelFormat:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  uint64_t v10 = objc_opt_class();
  return [v10 colorSpacePropertiesWithSourceColorSpace:v9 sourcePixelFormat:v8 sourceDimensions:a5 requestedPixelFormat:v6 supportedColorSpaces:0];
}

+ (id)colorInfoWithSourceColorSpace:(int)a3 sourcePixelFormat:(unsigned int)a4 sourceDimensions:(id)a5 requestedPixelFormat:(unsigned int)a6
{
  uint64_t v6 = [(id)objc_opt_class() colorSpacePropertiesWithSourceColorSpace:*(void *)&a3 sourcePixelFormat:*(void *)&a4 sourceDimensions:a5 requestedPixelFormat:*(void *)&a6];
  uint64_t v7 = objc_opt_class();
  return (id)[v7 pixelBufferAttachmentsForColorSpaceProperties:v6];
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (void)setSliceCount:(unint64_t)a3
{
  self->_sliceCount = a3;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (void)setBytesPerRowAlignment:(unint64_t)a3
{
  self->_bytesPerRowAlignment = a3;
}

- (void)setPlaneAlignment:(unint64_t)a3
{
  self->_planeAlignment = a3;
}

- (void)setExtendedWidth:(unint64_t)a3
{
  self->_extendedWidth = a3;
}

- (void)setExtendedHeight:(unint64_t)a3
{
  self->_unint64_t extendedHeight = a3;
}

- (void)setCacheMode:(unsigned int)a3
{
  self->_cacheMode = a3;
}

- (void)setPrewireBuffers:(BOOL)a3
{
  self->_prewireBuffers = a3;
}

- (void)setMemoryPoolUseAllowed:(BOOL)a3
{
  self->_memoryPoolUseAllowed = a3;
}

@end