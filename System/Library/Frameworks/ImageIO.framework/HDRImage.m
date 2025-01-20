@interface HDRImage
+ (BOOL)getColorTRC:(id *)a3 matrix:(id *)a4 toneMapping:(id *)a5 fromEDR:(float)a6 toTargetSpace:(CGColorSpace *)a7;
+ (BOOL)getColorTRC:(id *)a3 matrix:(id *)a4 toneMapping:(id *)a5 fromSourceSpace:(CGColorSpace *)a6 headroom:(float)a7 toEDR:(float)a8 toneMappingMode:(int)a9;
+ (BOOL)getColorTRC:(id *)a3 matrix:(id *)a4 toneMapping:(id *)a5 fromSourceSpace:(CGColorSpace *)a6 toTargetSpace:(CGColorSpace *)a7 options:(id)a8;
+ (BOOL)getComponentMin:(id)a1 componentMax:(SEL)a2 forPixelType:componentRange:bitDepth:;
+ (BOOL)getGainMapHeadroom:(float *)a3 fromFlexGTCInfo:(id)a4;
+ (BOOL)getGainMapHeadroom:(float *)a3 fromMetadata:(CGImageMetadata *)a4;
+ (BOOL)getGainMapHeadroom:(float *)a3 fromProperties:(id)a4;
+ (BOOL)getGainMapMin:(float *)a3 max:(float *)a4 fromFlexGTCInfo:(id)a5;
+ (BOOL)getGainMapVersionMajor:(unint64_t *)a3 minor:(unint64_t *)a4 fromMetadata:(CGImageMetadata *)a5;
+ (BOOL)getInputPixelRange:(id *)a3 forPixelType:(int)a4 componentRange:(id)a5 bitDepth:(unsigned __int16)a6 isFloat:(BOOL)a7;
+ (BOOL)getInputPixelType:(int *)a3 range:(id *)a4 YCCMatrix:(id *)a5 forBuffer:(__CVBuffer *)a6;
+ (BOOL)getInputYCCMatrix:(id *)a3 forYCCMatrixString:(id)a4;
+ (BOOL)getOutputPixelRange:(id *)a3 forPixelType:(int)a4 componentRange:(id)a5 bitDepth:(unsigned __int16)a6 isFloat:(BOOL)a7;
+ (BOOL)getOutputPixelType:(id)a1 range:(SEL)a2 YCCMatrix:(int *)a3 chromaSubsampling:(id *)a4 forBuffer:(id *)a5;
+ (BOOL)getOutputYCCMatrix:(id *)a3 forYCCMatrixString:(id)a4;
+ (BOOL)getPixelType:(int *)a3 YCCMatrixString:(id *)a4 chromaSubsampling:componentRange:bitDepth:isFloat:forBuffer:;
+ (BOOL)supportsSourceColorSpace:(CGColorSpace *)a3;
+ (BOOL)supportsTargetColorSpace:(CGColorSpace *)a3;
+ (CGImageMetadata)createGainMapMetadataWithHeadroom:(float)a3;
+ (float)gainMapHeadroomForHDRGain:(float)a3 gainMapValue:(float)a4;
+ (id)curveDataFromFlexGTCInfo:(id)a3;
+ (id)flexRangeParametersWithHeadroom:(float)a3 options:(id)a4;
+ (id)gainMapHeadroomFromFlexGTCInfo:(id)a3;
+ (id)tableDataWithFloatValues:(const float *)a3 count:(unint64_t)a4;
- (BOOL)getInputColorTransform:(id *)a3 toEDR:(float)a4;
- (BOOL)getInputGainMapColorMatrix:(id *)a3;
- (BOOL)getInputGainMapPixelTransform:(id *)a3;
- (BOOL)getInputGainMapTransform:(id *)a3 toEDR:(float)a4 needsGainMap:(BOOL *)a5 baseIsSDR:(BOOL *)a6;
- (BOOL)getInputImagePixelTransform:(id *)a3;
- (BOOL)getInputImageTransform:(id *)a3 toEDR:(float)a4;
- (BOOL)getInputTransform:(id *)a3 toEDR:(float)a4;
- (BOOL)getOutputColorTransform:(id *)a3 fromEDR:(float)a4;
- (BOOL)getOutputGainMapColorMatrix:(HDRImage *)self lumaWeights:(SEL)a2 isLuma:(id *)a3;
- (BOOL)getOutputGainMapPixelTransform:(id *)a3;
- (BOOL)getOutputGainMapTransform:(id *)a3 fromEDR:(float)a4 needsGainMap:(BOOL *)a5 baseIsSDR:(BOOL *)a6;
- (BOOL)getOutputImagePixelTransform:(id *)a3;
- (BOOL)getOutputImageTransform:(id *)a3 fromEDR:(float)a4;
- (BOOL)getOutputTransform:(id *)a3 fromEDR:(float)a4;
- (BOOL)hasGainMap;
- (CGColorSpace)colorSpace;
- (CGColorSpace)gainMapColorSpace;
- (HDRFlexRangeParameters)flexRangeParams;
- (HDRImage)init;
- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3;
- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3 gainMapBuffer:(__CVBuffer *)a4;
- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3 gainMapBuffer:(__CVBuffer *)a4 flexRangeParameters:(id)a5;
- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3 gainMapBuffer:(__CVBuffer *)a4 gainMapMetadata:(CGImageMetadata *)a5 imageProperties:(id)a6;
- (NSDictionary)flexGTCInfo;
- (__CVBuffer)gainMapBuffer;
- (__CVBuffer)imageBuffer;
- (double)gainMapSize;
- (double)imageSize;
- (float)headroom;
- (id)flexGTCInfoWithCurveData:(id)a3 headroom:(float)a4 identifier:(id)a5;
- (id)inputTransformToEDR:(float)a3;
- (id)outputTransformFromEDR:(float)a3;
- (int)gainMapOrientation;
- (int)orientation;
- (int)toneMappingMode;
- (int64_t)type;
- (unint64_t)height;
- (unint64_t)width;
- (void)dealloc;
- (void)setFlexRangeParams:(id)a3;
- (void)setGainMapOrientation:(int)a3;
- (void)setHeadroom:(float)a3;
- (void)setOrientation:(int)a3;
- (void)setToneMappingMode:(int)a3;
@end

@implementation HDRImage

- (unint64_t)width
{
  v4 = (uint64_t (*)(__CVBuffer *))gFunc_CVPixelBufferGetWidth;
  v2 = [(HDRImage *)self imageBuffer];

  return v4(v2);
}

- (unint64_t)height
{
  v4 = (uint64_t (*)(__CVBuffer *))gFunc_CVPixelBufferGetHeight;
  v2 = [(HDRImage *)self imageBuffer];

  return v4(v2);
}

- (double)imageSize
{
  unsigned int v2 = [a1 width];
  return COERCE_DOUBLE(__PAIR64__([a1 height], v2));
}

+ (BOOL)getGainMapHeadroom:(float *)a3 fromProperties:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"{MakerApple}"];
  v7 = [v6 objectForKeyedSubscript:@"33"];
  v8 = [v6 objectForKeyedSubscript:@"48"];
  if (v6)
  {
    v9 = v7;
LABEL_7:
    if (v9) {
      BOOL v12 = v8 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if ((gIIODebugFlags & 0x300000) != 0)
      {
        id v13 = [v9 description];
        v14 = (const char *)[v13 UTF8String];
        id v15 = [v8 description];
        ImageIOLog("☀️  Invalid Meteor+ makernote data (hdrGain=%s, gainMapValue=%s)", v14, (const char *)[v15 UTF8String]);
      }
      BOOL v16 = 0;
    }
    else
    {
      [v9 floatValue];
      int v18 = v17;
      [v8 floatValue];
      LODWORD(v19) = LODWORD(v20);
      LODWORD(v20) = v18;
      +[HDRImage gainMapHeadroomForHDRGain:v20 gainMapValue:v19];
      float v22 = v21;
      if ((gIIODebugFlags & 0x300000) != 0)
      {
        [v9 floatValue];
        float v24 = v23;
        [v8 floatValue];
        ImageIOLog("☀️  Meteor+ headroom: %f (hdrGain=%f, gainMapValue=%f)", v22, v24, v25);
      }
      if (a3) {
        *a3 = v22;
      }
      BOOL v16 = 1;
    }
    goto LABEL_23;
  }
  v9 = [v5 objectForKeyedSubscript:@"kCGFallbackHDRGain"];

  uint64_t v10 = gIIODebugFlags & 0x300000;
  if (v9)
  {
    if (v10)
    {
      [v9 floatValue];
      ImageIOLog("☀️  Missing makernote data, using fallback hdrGain=%f\n", v11);
    }

    v8 = &unk_1ED4FF9D0;
    goto LABEL_7;
  }
  if (v10)
  {
    id v26 = [v5 description];
    ImageIOLog("☀️  Missing makernote data: %s, no fallback provided", (const char *)[v26 UTF8String]);
  }
  BOOL v16 = 0;
  v9 = 0;
LABEL_23:

  return v16;
}

+ (float)gainMapHeadroomForHDRGain:(float)a3 gainMapValue:(float)a4
{
  if (a3 >= 1.0)
  {
    if (a4 <= 0.01) {
      return exp2f((float)(a4 * -70.0) + 3.0);
    }
    double v4 = a4 * -0.303030255 + 2.0;
    double v5 = 0.303030255;
  }
  else
  {
    if (a4 <= 0.01) {
      return exp2f((float)(a4 * -20.0) + 1.8);
    }
    double v4 = a4 * -0.101010125 + 1.5;
    double v5 = 0.101010125;
  }
  float v6 = v4 + v5;
  return exp2f(v6);
}

+ (BOOL)getGainMapVersionMajor:(unint64_t *)a3 minor:(unint64_t *)a4 fromMetadata:(CGImageMetadata *)a5
{
  if (a5)
  {
    v8 = [NSString stringWithFormat:@"%@:%@", @"HDRGainMap", @"HDRGainMapVersion"];
    v9 = CGImageMetadataCopyTagWithPath(a5, 0, v8);
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = (id)CGImageMetadataTagCopyValue(v9);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        unint64_t v13 = [v11 integerValue];
        if (a3) {
          *a3 = v13 >> 16;
        }
        if (a4) {
          *a4 = (unsigned __int16)v13;
        }
      }
      else
      {
        id v14 = [v11 description];
        LogError("+[HDRImage getGainMapVersionMajor:minor:fromMetadata:]", 415, "Invalid version tag value: %s", (const char *)[v14 UTF8String]);
      }
    }
    else
    {
      id v11 = [(__CFString *)v8 description];
      LogError("+[HDRImage getGainMapVersionMajor:minor:fromMetadata:]", 409, "Failed to get metadata tag: %s", (const char *)[v11 UTF8String]);
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

+ (BOOL)getGainMapHeadroom:(float *)a3 fromMetadata:(CGImageMetadata *)a4
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  if (([a1 getGainMapVersionMajor:&v18 minor:&v17 fromMetadata:a4] & 1) == 0)
  {
    v7 = [(CGImageMetadata *)a4 description];
    LogError("+[HDRImage getGainMapHeadroom:fromMetadata:]", 435, "Failed to read gain map version info: %s", (const char *)[(__CFString *)v7 UTF8String]);
LABEL_15:
    char isKindOfClass = 0;
    goto LABEL_19;
  }
  if (v18 == 1 && v17 == 0)
  {
    v7 = [(CGImageMetadata *)a4 description];
    _cg_jpeg_mem_term("+[HDRImage getGainMapHeadroom:fromMetadata:]", 441, "Version 1.0 gain map metadata does not contain headroom value: %s", (const char *)[(__CFString *)v7 UTF8String]);
    goto LABEL_15;
  }
  v7 = [NSString stringWithFormat:@"%@:%@", @"HDRGainMap", @"HDRGainMapHeadroom"];
  v8 = CGImageMetadataCopyTagWithPath(a4, 0, v7);
  v9 = v8;
  if (v8)
  {
    id v10 = (id)CGImageMetadataTagCopyValue(v8);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v12 = v10;
      [v12 floatValue];
      float v14 = v13;
      if ((gIIODebugFlags & 0x300000) != 0) {
        ImageIOLog("Gain map headroom value: %f", v13);
      }
      if (a3) {
        *a3 = v14;
      }
      id v10 = v12;
    }
    else
    {
      id v12 = [v10 description];
      LogError("+[HDRImage getGainMapHeadroom:fromMetadata:]", 455, "Invalid gain map headroom tag value: %s", (const char *)[v12 UTF8String]);
    }
  }
  else
  {
    id v10 = [(__CFString *)v7 description];
    id v15 = (const char *)[v10 UTF8String];
    id v12 = [(CGImageMetadata *)a4 description];
    LogError("+[HDRImage getGainMapHeadroom:fromMetadata:]", 449, "Failed to get metadata tag %s from metadata: %s", v15, (const char *)[v12 UTF8String]);
    char isKindOfClass = 0;
  }

LABEL_19:
  return isKindOfClass & 1;
}

+ (CGImageMetadata)createGainMapMetadataWithHeadroom:(float)a3
{
  CGMutableImageMetadataRef Mutable = CGImageMetadataCreateMutable();
  if (CGImageMetadataRegisterNamespaceForPrefix(Mutable, @"http://ns.apple.com/HDRGainMap/1.0/", @"HDRGainMap", 0))
  {
    double v5 = [NSNumber numberWithUnsignedInteger:0x20000];
    float v6 = CGImageMetadataTagCreate(@"http://ns.apple.com/HDRGainMap/1.0/", @"HDRGainMap", @"HDRGainMapVersion", kCGImageMetadataTypeDefault, v5);
    v7 = [NSString stringWithFormat:@"%@:%@", @"HDRGainMap", @"HDRGainMapVersion"];
    if (CGImageMetadataSetTagWithPath(Mutable, 0, v7, v6))
    {
      *(float *)&double v8 = a3;
      v9 = [NSNumber numberWithFloat:v8];
      id v10 = CGImageMetadataTagCreate(@"http://ns.apple.com/HDRGainMap/1.0/", @"HDRGainMap", @"HDRGainMapHeadroom", kCGImageMetadataTypeDefault, v9);
      id v11 = [NSString stringWithFormat:@"%@:%@", @"HDRGainMap", @"HDRGainMapHeadroom"];
      if (CGImageMetadataSetTagWithPath(Mutable, 0, v11, v10))
      {
        id v12 = Mutable;
      }
      else
      {
        LogError("+[HDRImage createGainMapMetadataWithHeadroom:]", 492, "Failed to set HDRGainMap metadata headroom tag!");
        id v12 = 0;
      }
    }
    else
    {
      LogError("+[HDRImage createGainMapMetadataWithHeadroom:]", 484, "Failed to set HDRGainMap metadata version tag!");
      id v12 = 0;
    }
  }
  else
  {
    LogError("+[HDRImage createGainMapMetadataWithHeadroom:]", 473, "Failed to register HDRGainMap metadata tag!");
    id v12 = 0;
  }

  return v12;
}

- (id)flexGTCInfoWithCurveData:(id)a3 headroom:(float)a4 identifier:(id)a5
{
  v84[3] = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v77 = a5;
  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v78 setObject:v77 forKeyedSubscript:*MEMORY[0x1E4F1A708]];
  *(float *)&double v8 = log2f(a4);
  int v9 = LODWORD(v8);
  flexRangeParams = self->_flexRangeParams;
  v79 = flexRangeParams;
  if (flexRangeParams)
  {
    [(HDRFlexRangeParameters *)flexRangeParams baseHeadroom];
    float v12 = v11;
    [(HDRFlexRangeParameters *)self->_flexRangeParams alternateHeadroom];
    float v14 = v13;
    id v15 = self->_flexRangeParams;
    if (v12 <= v13) {
      [(HDRFlexRangeParameters *)v15 baseHeadroom];
    }
    else {
      [(HDRFlexRangeParameters *)v15 alternateHeadroom];
    }
    int v18 = v16;
    [(HDRFlexRangeParameters *)self->_flexRangeParams channelGamma];
    int v21 = v23;
    [(HDRFlexRangeParameters *)self->_flexRangeParams channelMin];
    if (v12 <= v14)
    {
      float v27 = v24;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelMax];
      float v29 = v28;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelAlternateOffset];
      int v19 = v30;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelBaseOffset];
      int v22 = LODWORD(v8);
      float v20 = -v27;
      float v17 = -v29;
    }
    else
    {
      float v20 = v24;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelMax];
      float v17 = v25;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelAlternateOffset];
      int v19 = v26;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelAlternateOffset];
      int v22 = LODWORD(v8);
    }
  }
  else
  {
    float v17 = -*(float *)&v8;
    int v18 = 0;
    int v19 = 981668463;
    float v20 = -0.0;
    int v21 = 1074580685;
    int v22 = 981668463;
  }
  LODWORD(v8) = v9;
  v31 = [NSNumber numberWithFloat:v8];
  [v78 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F1A728]];

  LODWORD(v32) = v18;
  v33 = [NSNumber numberWithFloat:v32];
  [v78 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F1A718]];

  *(float *)&double v34 = v20;
  v35 = [NSNumber numberWithFloat:v34];
  [v78 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F1A740]];

  *(float *)&double v36 = v17;
  v37 = [NSNumber numberWithFloat:v36];
  [v78 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F1A738]];

  LODWORD(v38) = v19;
  v39 = [NSNumber numberWithFloat:v38];
  [v78 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F1A720]];

  LODWORD(v40) = v22;
  v41 = [NSNumber numberWithFloat:v40];
  [v78 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F1A710]];

  LODWORD(v42) = v21;
  v43 = [NSNumber numberWithFloat:v42];
  [v78 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F1A730]];

  v44 = [(HDRImage *)self gainMapColorSpace];
  if (!v44) {
    v44 = [(HDRImage *)self colorSpace];
  }
  CGColorSpaceRef Linearized = CGColorSpaceCreateLinearized(v44);
  if ((CGColorSpaceGetCICPInfo() & 1) == 0)
  {
    v46 = (const char *)[(__CFString *) (id) (id) CFCopyDescription(Linearized) UTF8String];
    LogError("cicp_tagFromColorSpace", 54, "Failed to get CICP info for space: %s", v46);
  }
  v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v80, "count"));
  unint64_t v48 = 0;
  float v49 = -v17;
  float v50 = a4 + -1.0;
  double v51 = v17 * -0.693147181;
  v52 = (void *)MEMORY[0x1E4F1A700];
  v53 = (void *)MEMORY[0x1E4F1A6F0];
  while (v48 < [v80 count])
  {
    v54 = [v80 objectAtIndexedSubscript:v48];
    v55 = [v54 objectAtIndexedSubscript:0];
    [v55 floatValue];
    int v57 = v56;

    v58 = [v54 objectAtIndexedSubscript:1];
    [v58 floatValue];
    float v60 = v59;

    v61 = [v54 objectAtIndexedSubscript:2];
    [v61 floatValue];
    float v63 = v62;

    if (!v79)
    {
      float v65 = (float)(v50 * v60) + 1.0;
      float v63 = (float)(v50 * v63) / (v51 * v65);
      float v60 = (float)(v20 + log2f(v65)) / v49;
    }
    v83[0] = *MEMORY[0x1E4F1A6F8];
    LODWORD(v64) = v57;
    v66 = [NSNumber numberWithFloat:v64];
    v84[0] = v66;
    v83[1] = *v52;
    *(float *)&double v67 = v60;
    v68 = [NSNumber numberWithFloat:v67];
    v84[1] = v68;
    v83[2] = *v53;
    *(float *)&double v69 = v63;
    v70 = [NSNumber numberWithFloat:v69];
    v84[2] = v70;
    v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
    [v47 addObject:v71];

    ++v48;
  }
  uint64_t v72 = *MEMORY[0x1E4F1A758];
  v82[0] = v78;
  uint64_t v73 = *MEMORY[0x1E4F1A760];
  v81[0] = v72;
  v81[1] = v73;
  v74 = [NSNumber numberWithUnsignedInt:0];
  v81[2] = *MEMORY[0x1E4F1A750];
  v82[1] = v74;
  v82[2] = v47;
  v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];

  return v75;
}

+ (id)gainMapHeadroomFromFlexGTCInfo:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F1A758]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1A728]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v4;
      double v5 = v4;
      goto LABEL_7;
    }
    id v7 = [v3 description];
    LogError("+[HDRImage gainMapHeadroomFromFlexGTCInfo:]", 580, "Invalid FlexGTC gainmap info: %s", (const char *)[v7 UTF8String]);
  }
  else
  {
    id v4 = [v3 description];
    LogError("+[HDRImage gainMapHeadroomFromFlexGTCInfo:]", 574, "Invalid FlexGTC gainmap info: %s", (const char *)[v4 UTF8String]);
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

+ (BOOL)getGainMapHeadroom:(float *)a3 fromFlexGTCInfo:(id)a4
{
  double v5 = [a1 gainMapHeadroomFromFlexGTCInfo:a4];
  float v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    *a3 = exp2f(v7);
  }

  return v6 != 0;
}

+ (BOOL)getGainMapMin:(float *)a3 max:(float *)a4 fromFlexGTCInfo:(id)a5
{
  id v7 = a5;
  double v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1A758]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 count])
  {
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1A740]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1A738]];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        if (a3)
        {
          [v9 floatValue];
          *(_DWORD *)a3 = v12;
        }
        if (a4)
        {
          [v10 floatValue];
          *(_DWORD *)a4 = v13;
        }
      }
      else
      {
        id v14 = [v8 description];
        LogError("+[HDRImage getGainMapMin:max:fromFlexGTCInfo:]", 612, "Invalid FlexGTC gainmap info: %s", (const char *)[v14 UTF8String]);
      }
    }
    else
    {
      id v10 = [v8 description];
      LogError("+[HDRImage getGainMapMin:max:fromFlexGTCInfo:]", 606, "Invalid FlexGTC gainmap info: %s", (const char *)[v10 UTF8String]);
      char isKindOfClass = 0;
    }
  }
  else
  {
    id v9 = [v8 description];
    LogError("+[HDRImage getGainMapMin:max:fromFlexGTCInfo:]", 600, "Invalid FlexGTC gainmap info: %s", (const char *)[v9 UTF8String]);
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (id)curveDataFromFlexGTCInfo:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v3 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F1A750]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    int v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    unint64_t v4 = 0;
    double v5 = (void *)MEMORY[0x1E4F1A6F0];
    while (1)
    {
      if (v4 >= [v3 count])
      {
        float v17 = v21;
        id v16 = v21;
        goto LABEL_24;
      }
      float v6 = [v3 objectAtIndexedSubscript:v4];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1A6F8]];
      double v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1A700]];
      uint64_t v9 = [v6 objectForKeyedSubscript:*v5];
      id v10 = (void *)v9;
      if (v7) {
        BOOL v11 = v8 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      BOOL v12 = v11 || v9 == 0;
      char v13 = v12;
      if (v12)
      {
        id v14 = [v6 description];
        LogError("+[HDRImage curveDataFromFlexGTCInfo:]", 642, "Invalid FlexGTC table data point: %s", (const char *)[v14 UTF8String]);
      }
      else
      {
        v22[0] = v7;
        v22[1] = v8;
        v22[2] = v9;
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
        [v21 addObject:v14];
      }

      ++v4;
      if (v13) {
        goto LABEL_23;
      }
    }
    id v18 = [v6 description];
    LogError("+[HDRImage curveDataFromFlexGTCInfo:]", 635, "Invalid FlexGTC table data point: %s", (const char *)[v18 UTF8String]);

LABEL_23:
    id v16 = 0;
    float v17 = v21;
LABEL_24:
  }
  else
  {
    id v15 = [v3 description];
    LogError("+[HDRImage curveDataFromFlexGTCInfo:]", 628, "Invalid FlexGTC table data: %s", (const char *)[v15 UTF8String]);

    id v16 = 0;
  }

  return v16;
}

+ (id)flexRangeParametersWithHeadroom:(float)a3 options:(id)a4
{
  id v5 = a4;
  float v6 = objc_alloc_init(HDRFlexRangeParameters);
  id v7 = [v5 objectForKeyedSubscript:@"kCGFlexRangeBaseIsHDR"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"kCGFlexRangeMin"];
  *(float *)&double v10 = log2f(a3);
  if (v9) {
    int v11 = v8;
  }
  else {
    int v11 = 0;
  }
  if (v11 == 1)
  {
    objc_msgSend(v9, "floatValue", v10);
    float v13 = -v12;
  }
  else
  {
    float v13 = *(float *)&v10;
  }
  id v14 = [v5 objectForKeyedSubscript:@"kCGFlexRangeMax"];
  id v16 = v14;
  if (v14) {
    char v17 = v8;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    [v14 floatValue];
    float v13 = *(float *)&v15;
  }
  float v18 = 0.0;
  if (v8) {
    *(float *)&double v15 = v13;
  }
  else {
    *(float *)&double v15 = 0.0;
  }
  [(HDRFlexRangeParameters *)v6 setBaseHeadroom:v15];
  if (!v8) {
    float v18 = v13;
  }
  *(float *)&double v19 = v18;
  [(HDRFlexRangeParameters *)v6 setAlternateHeadroom:v19];
  [(HDRFlexRangeParameters *)v6 setIsMono:1];
  if (v9)
  {
    [v9 floatValue];
  }
  else
  {
    *(float *)&double v20 = -v13;
    if (!v8) {
      *(float *)&double v20 = 0.0;
    }
  }
  [(HDRFlexRangeParameters *)v6 setChannelMin:v20];
  if (v16)
  {
    [v16 floatValue];
    float v18 = *(float *)&v21;
  }
  *(float *)&double v21 = v18;
  [(HDRFlexRangeParameters *)v6 setChannelMax:v21];
  int v22 = [v5 objectForKeyedSubscript:@"kCGFlexRangeGamma"];
  int v23 = v22;
  if (v22)
  {
    [v22 floatValue];
    -[HDRFlexRangeParameters setChannelGamma:](v6, "setChannelGamma:");
  }
  float v24 = [v5 objectForKeyedSubscript:@"kCGFlexRangeEpsilon"];
  float v25 = v24;
  if (v24)
  {
    [v24 floatValue];
    -[HDRFlexRangeParameters setChannelBaseOffset:](v6, "setChannelBaseOffset:");
    [v25 floatValue];
    -[HDRFlexRangeParameters setChannelAlternateOffset:](v6, "setChannelAlternateOffset:");
  }
  int v26 = [v5 objectForKeyedSubscript:@"kCGFlexRangeAlternateColorSpace"];
  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGColorSpaceRef v27 = CGColorSpaceCreateWithName(v26);
      if (v27)
      {
        [(HDRFlexRangeParameters *)v6 setAlternateColorSpace:v27];
        CFRelease(v27);
      }
      else
      {
        LogError("+[HDRImage flexRangeParametersWithHeadroom:options:]", 685, "Unrecognized colorspace name: %s", (const char *)[(__CFString *)v26 UTF8String]);
      }
    }
  }
  float v28 = [v5 objectForKeyedSubscript:@"kCGFlexRangeUseAlternateColor"];
  -[HDRFlexRangeParameters setUseBaseColor:](v6, "setUseBaseColor:", [v28 BOOLValue] ^ 1);
  if (![(HDRFlexRangeParameters *)v6 useBaseColor]
    && ![(HDRFlexRangeParameters *)v6 alternateColorSpace])
  {
    LogError("+[HDRImage flexRangeParametersWithHeadroom:options:]", 691, "Request to use alternate color but no alternate colorspace specified: %s", (const char *)[(__CFString *)v26 UTF8String]);
  }

  return v6;
}

- (CGColorSpace)colorSpace
{
  result = self->_imageSpace;
  if (!result)
  {
    result = self->_imageBuffer;
    if (result)
    {
      result = (CGColorSpace *)xdr_CVPixelBufferCopyColorSpace(result);
      self->_imageSpace = result;
      if (!result)
      {
        id v4 = [(__CVBuffer *)self->_imageBuffer description];
        LogError("-[HDRImage colorSpace]", 709, "Failed to create color space from image buffer: %s", (const char *)[v4 UTF8String]);

        result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
        self->_imageSpace = result;
      }
    }
  }
  return result;
}

- (BOOL)hasGainMap
{
  return self->_gainMapBuffer != 0;
}

- (CGColorSpace)gainMapColorSpace
{
  if (!self->_gainMapSpace)
  {
    if (self->_gainMapBuffer)
    {
      flexRangeParams = self->_flexRangeParams;
      if (flexRangeParams)
      {
        if (![(HDRFlexRangeParameters *)flexRangeParams useBaseColor])
        {
          id v5 = CGColorSpaceRetain([(HDRFlexRangeParameters *)self->_flexRangeParams alternateColorSpace]);
          self->_gainMapSpace = v5;
          if (!v5) {
            LogError("-[HDRImage gainMapColorSpace]", 727, "FlexRange alternate colorspace not set, cannot use alternate color!");
          }
        }
      }
    }
  }
  return self->_gainMapSpace;
}

- (double)gainMapSize
{
  if (![a1 hasGainMap]) {
    return 0.0;
  }
  unsigned int Width = gFunc_CVPixelBufferGetWidth([a1 gainMapBuffer]);
  return COERCE_DOUBLE(__PAIR64__(gFunc_CVPixelBufferGetHeight([a1 gainMapBuffer]), Width));
}

- (HDRImage)init
{
  return 0;
}

- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3
{
  return [(HDRImage *)self initWithImageBuffer:a3 gainMapBuffer:0];
}

- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3 gainMapBuffer:(__CVBuffer *)a4
{
  return [(HDRImage *)self initWithImageBuffer:a3 gainMapBuffer:a4 gainMapMetadata:0 imageProperties:0];
}

- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3 gainMapBuffer:(__CVBuffer *)a4 gainMapMetadata:(CGImageMetadata *)a5 imageProperties:(id)a6
{
  id v10 = a6;
  if (a4)
  {
    int v11 = +[HDRFlexRangeParameters flexRangeParametersFromMetadata:a5];
  }
  else
  {
    int v11 = 0;
  }
  float v12 = [(HDRImage *)self initWithImageBuffer:a3 gainMapBuffer:a4 flexRangeParameters:v11];
  if (a4 && !v11)
  {
    float v23 = 0.0;
    if (a5 && ([(id)objc_opt_class() getGainMapHeadroom:&v23 fromMetadata:a5] & 1) != 0
      || (BOOL v13 = +[HDRImage getGainMapHeadroom:&v23 fromProperties:v10], v14 = 1.0, v13))
    {
      float v14 = v23;
    }
    v12->_headroom = v14;
  }
  double v15 = [v10 objectForKeyedSubscript:@"kCGFlexGTCInfo"];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 copy];
      flexGTCInfo = v12->_flexGTCInfo;
      v12->_flexGTCInfo = (NSDictionary *)v16;

      float v22 = 0.0;
      if ([(id)objc_opt_class() getGainMapHeadroom:&v22 fromFlexGTCInfo:v15]) {
        v12->_headroom = v22;
      }
    }
  }
  float v18 = [v10 objectForKeyedSubscript:@"kCGToneMappingMode"];
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v19 = [v18 intValue] - 1;
      int v20 = 0;
      switch(v19)
      {
        case 0:
          int v20 = 5;
          goto LABEL_24;
        case 1:
          int v20 = 4;
          goto LABEL_24;
        case 2:
          if (v12->_type == 3) {
            int v20 = 1;
          }
          else {
            int v20 = 2;
          }
          goto LABEL_24;
        case 3:
          int v20 = 3;
          goto LABEL_24;
        case 4:
LABEL_24:
          v12->_toneMappingMode = v20;
          break;
        default:
          break;
      }
    }
  }
  if (![(HDRImage *)v12 orientation]) {
    [(HDRImage *)v12 setOrientation:1];
  }

  return v12;
}

- (HDRImage)initWithImageBuffer:(__CVBuffer *)a3 gainMapBuffer:(__CVBuffer *)a4 flexRangeParameters:(id)a5
{
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HDRImage;
  uint64_t v9 = [(HDRImage *)&v21 init];
  v9->_imageBuffer = (__CVBuffer *)gFunc_CVPixelBufferRetain(a3);
  v9->_toneMappingMode = 0;
  if (a4)
  {
    if (v8)
    {
      v9->_type = 6;
      [v8 baseHeadroom];
      float v11 = v10;
      [v8 alternateHeadroom];
      v9->_headroom = exp2f(fmaxf(v11, v12));
      uint64_t v13 = [v8 copy];
      flexRangeParams = v9->_flexRangeParams;
      v9->_flexRangeParams = (HDRFlexRangeParameters *)v13;
    }
    else
    {
      v9->_type = 4;
      v9->_headroom = 4.0;
    }
    v9->_gainMapBuffer = (__CVBuffer *)gFunc_CVPixelBufferRetain(a4);
    goto LABEL_15;
  }
  double v15 = (CGColorSpace *)xdr_CVPixelBufferCopyColorSpace(a3);
  v9->_imageSpace = v15;
  if (CGColorSpaceIsHLGBased(v15))
  {
    v9->_type = 2;
    float Headroom = IIOHDRPixelBufferGetHeadroom((uint64_t)a3);
LABEL_10:
    v9->_headroom = Headroom;
    int v17 = 4;
    goto LABEL_11;
  }
  if (CGColorSpaceIsPQBased(v9->_imageSpace))
  {
    v9->_type = 3;
    float Headroom = IIOHDRPixelBufferGetHeadroom((uint64_t)a3);
    goto LABEL_10;
  }
  if (CGColorSpaceUsesExtendedRange(v9->_imageSpace))
  {
    v9->_type = 5;
    v9->_headroom = 16.0;
    int v17 = 3;
  }
  else
  {
    int v17 = 0;
    v9->_type = 0;
    v9->_headroom = 1.0;
  }
LABEL_11:
  v9->_toneMappingMode = v17;
  if (CGColorSpaceContainsFlexGTCInfo())
  {
    float v18 = (void *)CGColorSpaceCopyFlexGTCInfo();
    float v20 = 0.0;
    if ([(id)objc_opt_class() getGainMapHeadroom:&v20 fromFlexGTCInfo:v18]) {
      v9->_headroom = v20;
    }
    v9->_toneMappingMode = 5;
  }
LABEL_15:

  return v9;
}

- (void)dealloc
{
  __n128 v3 = ((__n128 (*)())gFunc_CVPixelBufferRelease)();
  gFunc_CVPixelBufferRelease(v3);
  CGColorSpaceRelease(self->_imageSpace);
  CGColorSpaceRelease(self->_gainMapSpace);
  v4.receiver = self;
  v4.super_class = (Class)HDRImage;
  [(HDRImage *)&v4 dealloc];
}

+ (BOOL)getPixelType:(int *)a3 YCCMatrixString:(id *)a4 chromaSubsampling:componentRange:bitDepth:isFloat:forBuffer:
{
  v41 = v5;
  double v42 = v7;
  double v40 = v6;
  id v8 = v4;
  uint64_t PixelFormatType = gFunc_CVPixelBufferGetPixelFormatType(v43);
  int v12 = PixelFormatType;
  uint64_t v13 = (void *)gFunc_CVPixelFormatDescriptionCreateWithPixelFormatType(0, PixelFormatType);
  float v14 = [v13 objectForKeyedSubscript:*(void *)gIIO_kCVPixelFormatContainsRGB];
  char v15 = [v14 BOOLValue];

  char v16 = v15 ^ 1;
  if (!a3) {
    char v16 = 1;
  }
  if ((v16 & 1) == 0) {
    *a3 = 1;
  }
  int v17 = [v13 objectForKeyedSubscript:*(void *)gIIO_kCVPixelFormatContainsGrayscale];
  char v18 = [v17 BOOLValue];

  char v19 = v18 ^ 1;
  if (!a3) {
    char v19 = 1;
  }
  if ((v19 & 1) == 0) {
    *a3 = 3;
  }
  float v20 = [v13 objectForKeyedSubscript:*(void *)gIIO_kCVPixelFormatContainsYCbCr];
  int v21 = [v20 BOOLValue];

  char v22 = v21 ^ 1;
  if (!a3) {
    char v22 = 1;
  }
  if ((v22 & 1) == 0) {
    *a3 = 2;
  }
  char v23 = v15 | v21 | v18;
  if (v23)
  {
    id v24 = (id)gFunc_CVBufferCopyAttachment(v43, *(void *)gIIO_kCVImageBufferYCbCrMatrixKey, 0);
    if (v24) {
      int v25 = 0;
    }
    else {
      int v25 = v21;
    }
    int v26 = v42;
    if (v25 == 1)
    {
      id v24 = *(id *)gIIO_kCVImageBufferYCbCrMatrix_ITU_R_601_4;
      LogError("+[HDRImage getPixelType:YCCMatrixString:chromaSubsampling:componentRange:bitDepth:isFloat:forBuffer:]", 916, "*** Missing YCC matrix, falling back to %s", (const char *)[v24 UTF8String]);
    }
    if (a4) {
      *a4 = v24;
    }
    CGColorSpaceRef v27 = [v13 objectForKeyedSubscript:*(void *)gIIO_kCVPixelFormatPlanes];
    float v28 = v27;
    if (v8)
    {
      int v29 = [v27 count] == 2 ? v21 : 0;
      if (v29 == 1)
      {
        int v30 = [v28 objectAtIndexedSubscript:1];
        v31 = [v30 objectForKeyedSubscript:*(void *)gIIO_kCVPixelFormatHorizontalSubsampling];
        unsigned int v32 = [v31 unsignedShortValue];

        v33 = [v30 objectForKeyedSubscript:*(void *)gIIO_kCVPixelFormatVerticalSubsampling];
        unsigned int v34 = [v33 unsignedShortValue];

        uint32x2_t v35 = vmax_u32((uint32x2_t)__PAIR64__(v34, v32), (uint32x2_t)0x100000001);
        v8[1] = v35.i16[2];
        _WORD *v8 = v35.i16[0];

        int v26 = v42;
      }
    }
    if (v41)
    {
      id v36 = [v13 objectForKeyedSubscript:*(void *)gIIO_kCVPixelFormatComponentRange];
      if (!v36) {
        id v36 = *(id *)gIIO_kCVPixelFormatComponentRange_FullRange;
      }
      id v37 = v36;
      void *v41 = v37;
    }
    if (v40)
    {
      double v38 = [v13 objectForKeyedSubscript:*(void *)gIIO_kCVPixelFormatBitsPerComponent];
      *double v40 = [v38 unsignedShortValue];

      int v26 = v42;
    }
    if (v26) {
      *int v26 = ((v12 - 1380410945) & 0xFFFFFDFF) == 0;
    }
  }
  else
  {
    id v24 = [v13 description];
    LogError("+[HDRImage getPixelType:YCCMatrixString:chromaSubsampling:componentRange:bitDepth:isFloat:forBuffer:]", 907, "*** Unsupported pixel format: %s", (const char *)[v24 UTF8String]);
  }

  return v23;
}

+ (BOOL)getInputYCCMatrix:(id *)a3 forYCCMatrixString:(id)a4
{
  id v5 = a4;
  int IntegerCodePointForString = gFunc_CVYCbCrMatrixGetIntegerCodePointForString();
  if ((IntegerCodePointForString - 5) >= 2)
  {
    if ((IntegerCodePointForString - 9) < 2)
    {
      long long v7 = xmmword_18898C220;
      int32x4_t v8 = (int32x4_t)xmmword_18898C230;
      int32x4_t v9 = (int32x4_t)xmmword_18898C240;
      goto LABEL_8;
    }
    if (IntegerCodePointForString == 1)
    {
      long long v7 = xmmword_18898C1F0;
      int32x4_t v8 = (int32x4_t)xmmword_18898C200;
      int32x4_t v9 = (int32x4_t)xmmword_18898C210;
      goto LABEL_8;
    }
    LogError("+[HDRImage getInputYCCMatrix:forYCCMatrixString:]", 1013, "Unrecognized YCC matrix: '%s' (%d), using 601", (const char *)[v5 UTF8String], IntegerCodePointForString);
  }
  long long v7 = xmmword_18898C250;
  int32x4_t v8 = (int32x4_t)xmmword_18898C260;
  int32x4_t v9 = (int32x4_t)xmmword_18898C270;
LABEL_8:
  if (a3)
  {
    *((_DWORD *)a3 + 2) = v7;
    *((_DWORD *)a3 + 6) = DWORD1(v7);
    *(void *)a3 = vzip1q_s32(v9, v8).u64[0];
    *((void *)a3 + 2) = vtrn2q_s32(v9, v8).u64[0];
    *((_DWORD *)a3 + 10) = DWORD2(v7);
    *((void *)a3 + 4) = vzip1q_s32(vdupq_laneq_s32(v9, 2), vdupq_laneq_s32(v8, 2)).u64[0];
  }

  return 1;
}

+ (BOOL)getOutputYCCMatrix:(id *)a3 forYCCMatrixString:(id)a4
{
  id v5 = a4;
  int IntegerCodePointForString = gFunc_CVYCbCrMatrixGetIntegerCodePointForString();
  if ((IntegerCodePointForString - 5) >= 2)
  {
    if ((IntegerCodePointForString - 9) < 2)
    {
      long long v7 = xmmword_18898C2B0;
      int32x4_t v8 = (int32x4_t)xmmword_18898C2C0;
      int32x4_t v9 = (int32x4_t)xmmword_18898C2D0;
      goto LABEL_8;
    }
    if (IntegerCodePointForString == 1)
    {
      long long v7 = xmmword_18898C280;
      int32x4_t v8 = (int32x4_t)xmmword_18898C290;
      int32x4_t v9 = (int32x4_t)xmmword_18898C2A0;
      goto LABEL_8;
    }
    LogError("+[HDRImage getOutputYCCMatrix:forYCCMatrixString:]", 1070, "Unrecognized YCC matrix: '%s' (%d), using 601", (const char *)[v5 UTF8String], IntegerCodePointForString);
  }
  long long v7 = xmmword_18898C2E0;
  int32x4_t v8 = (int32x4_t)xmmword_18898C2F0;
  int32x4_t v9 = (int32x4_t)xmmword_18898C300;
LABEL_8:
  if (a3)
  {
    *((_DWORD *)a3 + 2) = v7;
    *((_DWORD *)a3 + 6) = DWORD1(v7);
    *(void *)a3 = vzip1q_s32(v9, v8).u64[0];
    *((void *)a3 + 2) = vtrn2q_s32(v9, v8).u64[0];
    *((_DWORD *)a3 + 10) = DWORD2(v7);
    *((void *)a3 + 4) = vzip1q_s32(vdupq_laneq_s32(v9, 2), vdupq_laneq_s32(v8, 2)).u64[0];
  }

  return 1;
}

+ (BOOL)getComponentMin:(id)a1 componentMax:(SEL)a2 forPixelType:componentRange:bitDepth:
{
  int v7 = v6;
  int v8 = v4;
  int32x4_t v9 = v3;
  float v10 = v2;
  id v11 = v5;
  if ([v11 isEqualToString:*(void *)gIIO_kCVPixelFormatComponentRange_FullRange])
  {
    unsigned int v12 = ~(-1 << v7);
    if (v8 == 2)
    {
      long long v13 = xmmword_18898C350;
      int32x4_t v14 = vdupq_n_s32(v12);
    }
    else
    {
      int32x4_t v14 = vdupq_n_s32(v12);
      long long v13 = 0uLL;
    }
LABEL_8:
    if (v10) {
      *float v10 = v13;
    }
    if (v9) {
      int32x4_t *v9 = v14;
    }
    BOOL v15 = 1;
  }
  else
  {
    if ([v11 isEqualToString:*(void *)gIIO_kCVPixelFormatComponentRange_VideoRange])
    {
      int32x4_t v14 = (int32x4_t)xmmword_18898C310;
      *(void *)&long long v13 = 0x1000000010;
      *((void *)&v13 + 1) = 0x1000000010;
      switch(v7)
      {
        case 8:
          goto LABEL_8;
        case 10:
          int32x4_t v14 = (int32x4_t)xmmword_18898C340;
          *(void *)&long long v13 = 0x4000000040;
          *((void *)&v13 + 1) = 0x4000000040;
          goto LABEL_8;
        case 12:
          int32x4_t v14 = (int32x4_t)xmmword_18898C330;
          *(void *)&long long v13 = 0x10000000100;
          *((void *)&v13 + 1) = 0x10000000100;
          goto LABEL_8;
        case 16:
          int32x4_t v14 = (int32x4_t)xmmword_18898C320;
          *(void *)&long long v13 = 0x100000001000;
          *((void *)&v13 + 1) = 0x100000001000;
          goto LABEL_8;
        default:
          LogError("+[HDRImage getComponentMin:componentMax:forPixelType:componentRange:bitDepth:]", 1118, "Unsupported bit depth: %d", v7);
          goto LABEL_14;
      }
    }
    LogError("+[HDRImage getComponentMin:componentMax:forPixelType:componentRange:bitDepth:]", 1123, "Unsupported component range: %s", (const char *)[v11 UTF8String]);
LABEL_14:
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)getInputPixelRange:(id *)a3 forPixelType:(int)a4 componentRange:(id)a5 bitDepth:(unsigned __int16)a6 isFloat:(BOOL)a7
{
  uint64_t v8 = a6;
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  if (a7)
  {
    __asm { FMOV            V0.4S, #1.0 }
    float32x4_t v18 = 0uLL;
    if (a3)
    {
LABEL_3:
      *(float32x4_t *)a3 = _Q0;
      *((float32x4_t *)a3 + 1) = v18;
    }
  }
  else
  {
    v30.i32[2] = 0;
    v30.i64[0] = 0;
    v29.i32[2] = 0;
    v29.i64[0] = 0;
    if (([a1 getComponentMin:&v30 componentMax:&v29 forPixelType:v9 componentRange:v12 bitDepth:v8] & 1) == 0)
    {
      BOOL v19 = 0;
      goto LABEL_9;
    }
    v20.i32[0] = 2;
    v21.i32[0] = v9;
    int8x16_t v23 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v21, v20), 0);
    float32x4_t v24 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_18898C360, (int8x16_t)0);
    __asm { FMOV            V3.4S, #1.0 }
    *(float *)v22.i32 = (float)~(-1 << v8);
    float32x4_t v26 = (float32x4_t)vdupq_lane_s32(v22, 0);
    float32x4_t v27 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_18898C370, _Q3);
    _Q0 = vdivq_f32(v26, vcvtq_f32_u32((uint32x4_t)vsubq_s32(v29, v30)));
    float32x4_t v18 = vdivq_f32(vmlaq_f32(vmulq_f32(vnegq_f32(v27), vcvtq_f32_u32((uint32x4_t)v30)), vcvtq_f32_u32((uint32x4_t)v29), v24), v26);
    if (a3) {
      goto LABEL_3;
    }
  }
  BOOL v19 = 1;
LABEL_9:

  return v19;
}

+ (BOOL)getOutputPixelRange:(id *)a3 forPixelType:(int)a4 componentRange:(id)a5 bitDepth:(unsigned __int16)a6 isFloat:(BOOL)a7
{
  uint64_t v8 = a6;
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  if (a7)
  {
    __asm { FMOV            V0.4S, #1.0 }
    float32x4_t v18 = 0uLL;
    if (a3)
    {
LABEL_3:
      *(float32x4_t *)a3 = _Q0;
      *((float32x4_t *)a3 + 1) = v18;
    }
  }
  else
  {
    v30.i32[2] = 0;
    v30.i64[0] = 0;
    v29.i32[2] = 0;
    v29.i64[0] = 0;
    if (([a1 getComponentMin:&v30 componentMax:&v29 forPixelType:v9 componentRange:v12 bitDepth:v8] & 1) == 0)
    {
      BOOL v19 = 0;
      goto LABEL_9;
    }
    v20.i32[0] = 2;
    v21.i32[0] = v9;
    int8x16_t v23 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v21, v20), 0);
    __asm { FMOV            V2.4S, #1.0 }
    float32x4_t v25 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_18898C370, _Q2);
    float32x4_t v26 = (float32x4_t)vbslq_s8(v23, (int8x16_t)xmmword_18898C360, (int8x16_t)0);
    *(float *)v22.i32 = (float)~(-1 << v8);
    float32x4_t v27 = (float32x4_t)vdupq_lane_s32(v22, 0);
    _Q0 = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vsubq_s32(v29, v30)), v27);
    float32x4_t v18 = vdivq_f32(vmlaq_f32(vmulq_f32(vnegq_f32(v26), vcvtq_f32_u32((uint32x4_t)v29)), vcvtq_f32_u32((uint32x4_t)v30), v25), v27);
    if (a3) {
      goto LABEL_3;
    }
  }
  BOOL v19 = 1;
LABEL_9:

  return v19;
}

+ (BOOL)getInputPixelType:(int *)a3 range:(id *)a4 YCCMatrix:(id *)a5 forBuffer:(__CVBuffer *)a6
{
  unsigned int v21 = 0;
  unsigned __int16 v20 = 0;
  unsigned __int8 v19 = 0;
  id v17 = 0;
  id v18 = 0;
  int v10 = [a1 getPixelType:&v21 YCCMatrixString:&v18 chromaSubsampling:0 componentRange:&v17 bitDepth:&v20 isFloat:&v19 forBuffer:a6];
  id v11 = v18;
  id v12 = v17;
  if (v10)
  {
    int v13 = [a1 getInputPixelRange:a4 forPixelType:v21 componentRange:v12 bitDepth:v20 isFloat:v19];
    char v14 = v13;
    if (v21 == 2) {
      int v15 = v13;
    }
    else {
      int v15 = 0;
    }
    if (v15 == 1) {
      char v14 = [a1 getInputYCCMatrix:a5 forYCCMatrixString:v11];
    }
  }
  else
  {
    char v14 = 0;
  }
  if (a3) {
    *a3 = v21;
  }

  return v14;
}

+ (BOOL)getOutputPixelType:(id)a1 range:(SEL)a2 YCCMatrix:(int *)a3 chromaSubsampling:(id *)a4 forBuffer:(id *)a5
{
  unsigned int v22 = 0;
  unsigned __int16 v21 = 0;
  unsigned __int8 v20 = 0;
  id v18 = 0;
  id v19 = 0;
  int v11 = [a1 getPixelType:&v22 YCCMatrixString:&v19 chromaSubsampling:v5 componentRange:&v18 bitDepth:&v21 isFloat:&v20 forBuffer:v6];
  id v12 = v19;
  id v13 = v18;
  if (v11)
  {
    int v14 = [a1 getOutputPixelRange:a4 forPixelType:v22 componentRange:v13 bitDepth:v21 isFloat:v20];
    char v15 = v14;
    if (v22 == 2) {
      int v16 = v14;
    }
    else {
      int v16 = 0;
    }
    if (v16 == 1) {
      char v15 = [a1 getOutputYCCMatrix:a5 forYCCMatrixString:v12];
    }
  }
  else
  {
    char v15 = 0;
  }
  if (a3) {
    *a3 = v22;
  }

  return v15;
}

+ (BOOL)getColorTRC:(id *)a3 matrix:(id *)a4 toneMapping:(id *)a5 fromSourceSpace:(CGColorSpace *)a6 headroom:(float)a7 toEDR:(float)a8 toneMappingMode:(int)a9
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v17 = (CFStringRef *)MEMORY[0x1E4F1DBE0];
  if (a8 <= 1.0) {
    id v17 = (CFStringRef *)MEMORY[0x1E4F1DC88];
  }
  CGColorSpaceRef v18 = CGColorSpaceCreateWithName(*v17);
  switch(a9)
  {
    case 0:
    case 6:
      v39 = @"kCGHDRMediaReferenceWhite";
      double v40 = &unk_1ED4FF9F0;
      unsigned __int8 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      break;
    case 1:
    case 2:
      v49[0] = @"kCGHDRMediaReferenceWhite";
      v49[1] = @"kCGApplyToneMappingForBT2100";
      v50[0] = &unk_1ED4FF9E0;
      unsigned __int16 v21 = [NSNumber numberWithBool:a8 == 1.0];
      v50[1] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

      unsigned __int8 v20 = (void *)v22;
      break;
    case 3:
      v54[0] = &unk_1ED4FF9E0;
      uint64_t v30 = *MEMORY[0x1E4F1DD58];
      v53[0] = @"kCGHDRMediaReferenceWhite";
      v53[1] = v30;
      uint64_t v51 = *MEMORY[0x1E4F1DB40];
      v31 = [NSNumber numberWithBool:a8 == 1.0];
      v52 = v31;
      unsigned int v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      v54[1] = v32;
      uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];

      goto LABEL_10;
    case 4:
      uint64_t v47 = *MEMORY[0x1E4F1DB50];
      uint64_t v23 = *MEMORY[0x1E4F1DE88];
      v46[0] = &unk_1ED4FF9E0;
      uint64_t v24 = *MEMORY[0x1E4F1DE80];
      v45[0] = v23;
      v45[1] = v24;
      *(float *)&double v19 = a7 * 203.0;
      float32x4_t v25 = [NSNumber numberWithFloat:v19];
      v46[1] = v25;
      v45[2] = *MEMORY[0x1E4F1DE78];
      *(float *)&double v26 = a8;
      float32x4_t v27 = [NSNumber numberWithFloat:v26];
      v46[2] = v27;
      float v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
      unint64_t v48 = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];

      unsigned __int8 v20 = (void *)v29;
      break;
    case 5:
      v44[0] = &unk_1ED4FF9F0;
      uint64_t v34 = *MEMORY[0x1E4F1DB48];
      v43[0] = @"kCGHDRMediaReferenceWhite";
      v43[1] = v34;
      uint64_t v41 = *MEMORY[0x1E4F1DD00];
      *(float *)&double v19 = a8;
      uint32x2_t v35 = [NSNumber numberWithFloat:v19];
      double v42 = v35;
      id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      v44[1] = v36;
      uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

LABEL_10:
      unsigned __int8 v20 = (void *)v33;
      break;
    default:
      unsigned __int8 v20 = 0;
      break;
  }
  char v37 = [a1 getColorTRC:a3 matrix:a4 toneMapping:a5 fromSourceSpace:a6 toTargetSpace:v18 options:v20];
  CFRelease(v18);

  return v37;
}

+ (BOOL)getColorTRC:(id *)a3 matrix:(id *)a4 toneMapping:(id *)a5 fromEDR:(float)a6 toTargetSpace:(CGColorSpace *)a7
{
  id v12 = (CFStringRef *)MEMORY[0x1E4F1DBE0];
  if (a6 <= 1.0) {
    id v12 = (CFStringRef *)MEMORY[0x1E4F1DC88];
  }
  CGColorSpaceRef v13 = CGColorSpaceCreateWithName(*v12);
  char v14 = [a1 getColorTRC:a3 matrix:a4 toneMapping:a5 fromSourceSpace:v13 toTargetSpace:a7 options:&unk_1ED4FFA00];
  CFRelease(v13);
  return v14;
}

+ (BOOL)getColorTRC:(id *)a3 matrix:(id *)a4 toneMapping:(id *)a5 fromSourceSpace:(CGColorSpace *)a6 toTargetSpace:(CGColorSpace *)a7 options:(id)a8
{
  CFDictionaryRef v14 = (const __CFDictionary *)a8;
  if (!CGColorSpaceEqualToColorSpace())
  {
    CGColorConversionInfoRef v20 = CGColorConversionInfoCreateWithOptions(a6, a7, v14);
    if (!v20)
    {
      id v23 = [(CGColorSpace *)a6 description];
      uint64_t v24 = (const char *)[v23 UTF8String];
      id v17 = [(CGColorSpace *)a7 description];
      LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]", 1355, "Failed to create color converter from: %s to: %s", v24, (const char *)[v17 UTF8String]);

      LOBYTE(v17) = 0;
      goto LABEL_43;
    }
    uint64_t v149 = 0;
    v150 = &v149;
    uint64_t v151 = 0x2020000000;
    char v152 = 0;
    uint64_t v140 = 0;
    v141 = &v140;
    uint64_t v142 = 0x5812000000;
    v143 = __Block_byref_object_copy_;
    v144 = __Block_byref_object_dispose_;
    v145 = "";
    long long v146 = 0u;
    long long v147 = 0u;
    int v148 = 0;
    uint64_t v136 = 0;
    v137 = &v136;
    uint64_t v138 = 0x2020000000;
    char v139 = 0;
    uint64_t v127 = 0;
    v128 = (int32x4_t *)&v127;
    uint64_t v129 = 0x6012000000;
    v130 = __Block_byref_object_copy__64;
    v131 = __Block_byref_object_dispose__65;
    v132 = "";
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    char v126 = 0;
    uint64_t v114 = 0;
    v115 = &v114;
    uint64_t v116 = 0x5812000000;
    v117 = __Block_byref_object_copy__67;
    v118 = __Block_byref_object_dispose__68;
    v119 = "";
    long long v120 = 0u;
    long long v121 = 0u;
    int v122 = 0;
    uint64_t v110 = 0;
    v111 = &v110;
    uint64_t v112 = 0x2020000000;
    char v113 = 0;
    uint64_t v101 = 0;
    v102 = (int32x4_t *)&v101;
    uint64_t v103 = 0x6012000000;
    v104 = __Block_byref_object_copy__64;
    v105 = __Block_byref_object_dispose__65;
    v106 = "";
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    uint64_t v97 = 0;
    v98 = &v97;
    uint64_t v99 = 0x2020000000;
    char v100 = 0;
    uint64_t v88 = 0;
    v89 = (float *)&v88;
    uint64_t v90 = 0x5812000000;
    v91 = __Block_byref_object_copy_;
    v92 = __Block_byref_object_dispose_;
    v93 = "";
    long long v94 = 0u;
    long long v95 = 0u;
    int v96 = 0;
    uint64_t v84 = 0;
    v85 = &v84;
    uint64_t v86 = 0x2020000000;
    char v87 = 0;
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x5812000000;
    id v78 = __Block_byref_object_copy__67;
    v79 = __Block_byref_object_dispose__68;
    id v80 = "";
    long long v81 = 0u;
    long long v82 = 0u;
    int v83 = 0;
    uint64_t v71 = 0;
    uint64_t v72 = &v71;
    uint64_t v73 = 0x2020000000;
    char v74 = 0;
    uint64_t v62 = 0;
    float v63 = &v62;
    uint64_t v64 = 0x5812000000;
    float v65 = __Block_byref_object_copy__67;
    v66 = __Block_byref_object_dispose__68;
    double v67 = "";
    long long v68 = 0u;
    long long v69 = 0u;
    int v70 = 0;
    uint64_t v58 = 0;
    float v59 = &v58;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    uint64_t v49 = 0;
    float v50 = &v49;
    uint64_t v51 = 0x5812000000;
    v52 = __Block_byref_object_copy_;
    v53 = __Block_byref_object_dispose_;
    v54 = "";
    long long v55 = 0u;
    long long v56 = 0u;
    int v57 = 0;
    aBlock[26] = MEMORY[0x1E4F143A8];
    aBlock[27] = 3221225472;
    aBlock[28] = __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke;
    aBlock[29] = &unk_1E53C0510;
    aBlock[30] = &v97;
    aBlock[31] = &v88;
    aBlock[32] = &v71;
    aBlock[33] = &v58;
    aBlock[34] = &v49;
    aBlock[35] = &v149;
    aBlock[36] = &v140;
    aBlock[17] = MEMORY[0x1E4F143A8];
    aBlock[18] = 3221225472;
    aBlock[19] = __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke_2;
    aBlock[20] = &unk_1E53C0538;
    aBlock[21] = &v123;
    aBlock[22] = &v110;
    aBlock[23] = &v101;
    aBlock[24] = &v136;
    aBlock[25] = &v127;
    aBlock[5] = MEMORY[0x1E4F143A8];
    aBlock[6] = 3221225472;
    aBlock[7] = __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke_3;
    aBlock[8] = &unk_1E53C0560;
    aBlock[9] = &v123;
    aBlock[10] = &v149;
    aBlock[11] = &v140;
    aBlock[12] = &v75;
    aBlock[13] = &v84;
    aBlock[14] = &v114;
    aBlock[15] = &v62;
    aBlock[16] = &v71;
    LODWORD(v17) = CGColorConversionInfoIterateFunctionsWithCallbacks();
    if (!v17)
    {
LABEL_42:
      CFRelease(v20);
      _Block_object_dispose(&v49, 8);
      _Block_object_dispose(&v58, 8);
      _Block_object_dispose(&v62, 8);
      _Block_object_dispose(&v71, 8);
      _Block_object_dispose(&v75, 8);
      _Block_object_dispose(&v84, 8);
      _Block_object_dispose(&v88, 8);
      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(&v101, 8);
      _Block_object_dispose(&v110, 8);
      _Block_object_dispose(&v114, 8);
      _Block_object_dispose(&v123, 8);
      _Block_object_dispose(&v127, 8);
      _Block_object_dispose(&v136, 8);
      _Block_object_dispose(&v140, 8);
      _Block_object_dispose(&v149, 8);
      goto LABEL_43;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke_4;
    aBlock[3] = &__block_descriptor_40_e165_v24__0r__CGColorTRC_i____CGColorTRCParametric_ffffffff__CGColorTRCTable_Q_f_CGColorTRCBoundaryExtension_ff__CGColorTRCBoundaryExtension_ff____8____i___ffffffff__v_16l;
    aBlock[4] = a1;
    unsigned __int16 v21 = _Block_copy(aBlock);
    uint64_t v22 = (void (**)(void, void, void))v21;
    if (a3)
    {
      if (*((unsigned char *)v150 + 24))
      {
        (*((void (**)(void *, uint64_t *, $50196331916D9F5243BCC3FBB72CAC7E *))v21 + 2))(v21, v141 + 6, a3);
      }
      else
      {
        a3->var0 = 0;
        *(void *)&a3[1].var1.var3 = 0;
      }
      if (*((unsigned char *)v85 + 24))
      {
        float32x4_t v25 = *(int32x2_t **)((char *)v76 + 76);
        a3->var0 = 11;
        *(void *)&a3[1].var1.var3 = 0;
        long long v26 = *(_OWORD *)&a3[1].var0;
        LODWORD(v26) = v25[1].i32[0];
        a3[1].var0 = v26;
        DWORD1(v26) = v25[1].i32[1];
        *(_OWORD *)&a3[1].var0 = v26;
        DWORD2(v26) = v25[2].i32[0];
        *(_OWORD *)&a3[1].var0 = v26;
        HIDWORD(v26) = v25[2].i32[1];
        *(_OWORD *)&a3[1].var0 = v26;
        a3->var2 = (void *)vrev64_s32(*v25);
      }
    }
    if (!a4)
    {
LABEL_25:
      if (a5)
      {
        LODWORD(a5[1].var2) = 0;
        *(void *)&a5->var4.var1.var1 = 0;
        LOBYTE(a5[1].var1.var5) = 1;
        long long v34 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
        long long v35 = *MEMORY[0x1E4F14998];
        *(_OWORD *)&a5->var4.var2 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
        *(_OWORD *)&a5[1].var1.var1 = v34;
        *(_OWORD *)&a5->var4.var1.var5 = v35;
        *(void *)&a5[2].var0 = 0;
        if (*((unsigned char *)v124 + 24))
        {
          switch(*((_DWORD *)v115 + 12))
          {
            case 7:
              id v36 = *(int32x2_t **)((char *)v115 + 76);
              a5->var0 = 2;
              long long v37 = *(_OWORD *)&a5->var3.var1;
              LODWORD(v37) = v36[1].i32[0];
              *(_DWORD *)&a5->var3.var1 = v37;
              DWORD1(v37) = v36[1].i32[1];
              *(_OWORD *)&a5->var3.var1 = v37;
              DWORD2(v37) = v36[2].i32[0];
              *(_OWORD *)&a5->var3.var1 = v37;
              HIDWORD(v37) = v36[2].i32[1];
              *(_OWORD *)&a5->var3.var1 = v37;
              a5->var2 = (void *)vrev64_s32(*v36);
              break;
            case 9:
              uint64_t v39 = *(uint64_t *)((char *)v115 + 76);
              a5->var0 = 1;
              *(_OWORD *)&a5->var1.var3 = *(_OWORD *)(v39 + 20);
              *(void *)&a5->var1.var7 = *(void *)(v39 + 36);
              LODWORD(a5->var2) = *(_DWORD *)(v39 + 44);
              long long v40 = *(_OWORD *)&a5->var3.var1;
              LODWORD(v41) = *(_DWORD *)(v39 + 56);
              *(_DWORD *)&a5->var3.var1 = v41;
              DWORD1(v41) = *(_DWORD *)(v39 + 60);
              *(_OWORD *)&a5->var3.var1 = v41;
              DWORD2(v41) = *(_DWORD *)(v39 + 64);
              *(_OWORD *)&a5->var3.var1 = v41;
              HIDWORD(v41) = *(_DWORD *)(v39 + 68);
              goto LABEL_36;
            case 0xA:
              uint64_t v42 = *(uint64_t *)((char *)v115 + 76);
              a5->var0 = 4;
              *(_OWORD *)&a5->var1.var3 = *(_OWORD *)(v42 + 20);
              a5->var1.var7 = *(float *)(v42 + 36);
              *((_DWORD *)&a5->var1 + 8) = *(_DWORD *)v42;
              LODWORD(a5->var2) = *(_DWORD *)(v42 + 16);
              long long v41 = *(_OWORD *)&a5->var3.var1;
              LODWORD(v41) = *(_DWORD *)(v42 + 4);
              *(_DWORD *)&a5->var3.var1 = v41;
              DWORD1(v41) = *(_DWORD *)(v42 + 8);
              *(_OWORD *)&a5->var3.var1 = v41;
              DWORD2(v41) = *(_DWORD *)(v42 + 12);
LABEL_36:
              *(_OWORD *)&a5->var3.var1 = v41;
              break;
            case 0xB:
              uint64_t v43 = *(uint64_t *)((char *)v115 + 76);
              a5->var0 = 5;
              *(void *)&a5->var4.var1.var1 = [a1 tableDataWithFloatValues:v43 + 36 count:*(void *)(v43 + 28)];
              *(_OWORD *)&a5->var3.var1 = *(_OWORD *)(v43 + 8);
              LODWORD(a5->var2) = *(_DWORD *)(v43 + 24);
              break;
            default:
              LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]", 1606, "Unsupported tone mapping transform format: %ld, unsupported!", *((unsigned int *)v115 + 12));
              a5->var0 = 0;
              break;
          }
          if (*((unsigned char *)v137 + 24))
          {
            LOBYTE(a5[1].var1.var5) = 0;
            int32x4_t v44 = v128[3];
            int32x4_t v45 = v128[4];
            int32x4_t v46 = v128[5];
            LODWORD(a5->var4.var1.var7) = v46.i32[0];
            a5[1].var0 = v46.i32[1];
            *(void *)&a5->var4.var1.var5 = vzip1q_s32(v44, v45).u64[0];
            a5->var4.var2 = (void *)vtrn2q_s32(v44, v45).u64[0];
            LODWORD(a5[1].var1.var3) = v46.i32[2];
            *(void *)&a5[1].var1.var1 = vzip1q_s32(vdupq_laneq_s32(v44, 2), vdupq_laneq_s32(v45, 2)).u64[0];
          }
        }
        else if (*((unsigned char *)v98 + 24))
        {
          a5->var0 = 3;
          double v38 = v89;
          a5->var1.var3 = v89[14];
          a5->var1.var4 = v38[15];
          a5->var1.var5 = v38[16];
          a5->var1.var6 = v38[17];
          a5->var1.var7 = v38[18];
          *((float *)&a5->var1 + 8) = v38[19];
        }
        else if (*((unsigned char *)v72 + 24))
        {
          a5->var0 = 6;
          *(void *)&a5->var4.var1.var1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(uint64_t *)((char *)v63 + 76) length:8 * *(uint64_t *)((char *)v63 + 68) * *(uint64_t *)((char *)v63 + 68) * *(uint64_t *)((char *)v63 + 68)];
          if (*((unsigned char *)v59 + 24)) {
            ((void (**)(void, uint64_t *, void **))v22)[2](v22, v50 + 6, &a5[1].var2);
          }
        }
        else
        {
          a5->var0 = 0;
        }
      }

      goto LABEL_42;
    }
    if (*((unsigned char *)v111 + 24))
    {
      char v27 = 0;
      float v28 = v102;
    }
    else
    {
      if (!*((unsigned char *)v137 + 24) || (char v27 = *((unsigned char *)v124 + 24)) != 0)
      {
        long long v32 = *MEMORY[0x1E4F14998];
        long long v33 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
        *(_OWORD *)&a4[16].var1 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
        *(_OWORD *)&a4[32].var1 = v33;
        *(_OWORD *)&a4->var1 = v32;
        char v27 = 1;
        goto LABEL_24;
      }
      float v28 = v128;
    }
    int32x4_t v29 = v28[3];
    int32x4_t v30 = v28[4];
    int32x4_t v31 = v28[5];
    *(_DWORD *)&a4[24].var1 = v31.i32[1];
    *(_DWORD *)&a4[40].var1 = v31.i32[2];
    *(_DWORD *)&a4[8].var1 = v31.i32[0];
    *(void *)&a4->var1 = vzip1q_s32(v29, v30).u64[0];
    *(void *)&a4[16].var1 = vtrn2q_s32(v29, v30).u64[0];
    *(void *)&a4[32].var1 = vzip1q_s32(vdupq_laneq_s32(v29, 2), vdupq_laneq_s32(v30, 2)).u64[0];
LABEL_24:
    a4[48].var1 = v27;
    goto LABEL_25;
  }
  if (a3)
  {
    a3->var0 = 0;
    *(void *)&a3[1].var1.var3 = 0;
  }
  if (a4)
  {
    long long v15 = *MEMORY[0x1E4F14998];
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
    *(_OWORD *)&a4[16].var1 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    *(_OWORD *)&a4[32].var1 = v16;
    *(_OWORD *)&a4->var1 = v15;
    a4[48].var1 = 1;
  }
  LOBYTE(v17) = 1;
  if (a5)
  {
    a5->var0 = 0;
    *(void *)&a5->var4.var1.var1 = 0;
    LOBYTE(a5[1].var1.var5) = 1;
    uint64_t v18 = MEMORY[0x1E4F14998];
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    *(_OWORD *)&a5->var4.var1.var5 = *MEMORY[0x1E4F14998];
    *(_OWORD *)&a5->var4.var2 = v19;
    *(_OWORD *)&a5[1].var1.var1 = *(_OWORD *)(v18 + 32);
    LODWORD(a5[1].var2) = 0;
    *(void *)&a5[2].var0 = 0;
  }
LABEL_43:

  return (char)v17;
}

uint64_t __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if ((gIIODebugFlags & 0x300000) != 0)
  {
    id v9 = [*(id *)(*(void *)(a2 + 52) + 8 * *a5) description];
    ImageIOLog("CGColorConversion TRC: %ld [%d] %s", a3, a4, (const char *)[v9 UTF8String]);
  }
  if (a4 != 1 && (a4 != 3 || *a5 != a5[1] || *a5 != a5[2]))
  {
    LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke", 1420, "Unsupported TRC configuration");
    return 0;
  }
  if (CGColorTRCGetGammaID() == 7) {
    return 1;
  }
  CGColorTRCGetFunction();
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke", 1405, "Already have post color transform TRC stage!");
      return 0;
    }
    uint64_t v11 = *(void *)(a1[8] + 8);
    *(_OWORD *)(v11 + 48) = 0u;
    *(_OWORD *)(v11 + 64) = 0u;
    *(_DWORD *)(v11 + 80) = 0;
    uint64_t v12 = a1[7];
  }
  else
  {
    if (*(unsigned char *)(*(void *)(a1[9] + 8) + 24))
    {
      LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke", 1413, "Already have TRC stage!");
      return 0;
    }
    uint64_t v13 = *(void *)(a1[10] + 8);
    *(_OWORD *)(v13 + 48) = 0u;
    *(_OWORD *)(v13 + 64) = 0u;
    *(_DWORD *)(v13 + 80) = 0;
    uint64_t v12 = a1[9];
  }
  uint64_t result = 1;
  *(unsigned char *)(*(void *)(v12 + 8) + 24) = 1;
  return result;
}

uint64_t __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke_2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((gIIODebugFlags & 0x300000) != 0)
  {
    id v7 = [*(id *)(*(void *)(a2 + 60) + 8 * a4) description];
    ImageIOLog("CGColorConversion matrix: %ld/%ld %s", a3, a4, (const char *)[v7 UTF8String]);
  }
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke_2", 1429, "Already have TM color matrix stage!");
      return 0;
    }
    CGColorMatrixGetMatrix();
    id v9 = *(_OWORD **)(a1[6] + 8);
    v9[3] = v12;
    v9[4] = v13;
    v9[5] = v14;
    uint64_t v10 = a1[5];
  }
  else
  {
    if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke_2", 1437, "Already have color matrix stage!");
      return 0;
    }
    CGColorMatrixGetMatrix();
    uint64_t v11 = *(_OWORD **)(a1[8] + 8);
    v11[3] = v12;
    v11[4] = v13;
    v11[5] = v14;
    uint64_t v10 = a1[7];
  }
  uint64_t result = 1;
  *(unsigned char *)(*(void *)(v10 + 8) + 24) = 1;
  return result;
}

uint64_t __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((gIIODebugFlags & 0x300000) != 0)
  {
    id v6 = [*(id *)(*(void *)(a2 + 68) + 8 * a4) description];
    ImageIOLog("CGColorConversion NxM: %ld %s", a3, (const char *)[v6 UTF8String]);
  }
  CGColorNxMTransformGetTransform();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke_3", 1448, "Already have color NxM transform stage!");
  }
  else {
    LogError("+[HDRImage getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:]_block_invoke_3", 1474, "CGColorConversion NxM: %ld/%ld, unsupported!");
  }
  return 0;
}

float __81__HDRImage_getColorTRC_matrix_toneMapping_fromSourceSpace_toTargetSpace_options___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 64) = 0;
  switch(*(_DWORD *)a2)
  {
    case 0:
      int v5 = 1;
      goto LABEL_13;
    case 1:
      int v5 = 2;
      goto LABEL_13;
    case 2:
      int v5 = 3;
      goto LABEL_13;
    case 3:
      int v5 = 4;
      goto LABEL_13;
    case 4:
      int v5 = 5;
      goto LABEL_13;
    case 5:
      *(_DWORD *)a3 = 6;
      *(void *)(a3 + 64) = [*(id *)(a1 + 32) tableDataWithFloatValues:*(void *)(a2 + 12) count:*(void *)(a2 + 4)];
      break;
    case 6:
      int v5 = 7;
      goto LABEL_13;
    case 7:
      int v5 = 8;
      goto LABEL_13;
    case 8:
      int v5 = 10;
      goto LABEL_13;
    case 9:
      int v5 = 9;
LABEL_13:
      *(_DWORD *)a3 = v5;
      break;
    default:
      *(_DWORD *)a3 = 0;
      break;
  }
  *(_DWORD *)(a3 + 16) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a3 + 20) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a3 + 24) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a3 + 28) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a3 + 32) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a3 + 36) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a3 + 40) = *(_DWORD *)(a2 + 32);
  float result = *(float *)(a2 + 4);
  *(float *)(a3 + 44) = result;
  return result;
}

+ (id)tableDataWithFloatValues:(const float *)a3 count:(unint64_t)a4
{
  unint64_t v4 = a4;
  id v6 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2 * a4];
  for (i = (_WORD *)[v6 mutableBytes]; v4; --v4)
  {
    int v8 = *(_DWORD *)a3++;
    _S0 = v8;
    __asm { FCVT            H0, S0 }
    *i++ = _S0;
  }

  return v6;
}

+ (BOOL)supportsSourceColorSpace:(CGColorSpace *)a3
{
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  return [a1 getColorTRC:0 matrix:0 toneMapping:0 fromSourceSpace:a3 headroom:0 toEDR:v3 toneMappingMode:v4];
}

+ (BOOL)supportsTargetColorSpace:(CGColorSpace *)a3
{
  LODWORD(v3) = 1.0;
  return [a1 getColorTRC:0 matrix:0 toneMapping:0 fromEDR:a3 toTargetSpace:v3];
}

- (BOOL)getInputColorTransform:(id *)a3 toEDR:(float)a4
{
  flexGTCInfo = self->_flexGTCInfo;
  int v8 = objc_opt_class();
  id v9 = v8;
  if (flexGTCInfo)
  {
    uint64_t v10 = [v8 curveDataFromFlexGTCInfo:self->_flexGTCInfo];
    if (v10)
    {
      uint64_t v37 = 0;
      char v11 = [(id)objc_opt_class() getGainMapMin:(char *)&v37 + 4 max:&v37 fromFlexGTCInfo:self->_flexGTCInfo];
      long long v12 = self->_flexGTCInfo;
      if (v11)
      {
        long long v13 = [(NSDictionary *)v12 objectForKeyedSubscript:*MEMORY[0x1E4F1A760]];
        int v14 = [v13 unsignedIntValue];

        if (!v14)
        {
          ExtendedCGColorSpaceRef Linearized = CGColorSpaceCreateExtendedLinearized([(HDRImage *)self colorSpace]);
          goto LABEL_15;
        }
        long long v15 = (CGColorSpace *)CGColorSpaceCreateFromCICP();
        long long v16 = v15;
        if (v15)
        {
          ExtendedCGColorSpaceRef Linearized = CGColorSpaceCreateExtendedLinearized(v15);
          CFRelease(v16);
LABEL_15:
          if (objc_msgSend((id)objc_opt_class(), "getColorTRC:matrix:toneMapping:fromSourceSpace:toTargetSpace:options:", a3, &a3[1], 0, -[HDRImage colorSpace](self, "colorSpace"), ExtendedLinearized, &unk_1ED4FFA28))
          {
            LODWORD(a3->var1.var1.var7) = 5;
            float v28 = log2f(a4);
            float v29 = 1.0 - (float)(v28 / log2f(self->_headroom));
            *(float *)&double v30 = *((float *)&v37 + 1) * v29;
            *(float *)&double v31 = *(float *)&v37 * v29;
            a3->var1.var4.var2 = +[HDRImageConverter flexGTCTableDataFromCurveArray:v10 min:v30 max:v31];
            p_headroom = &self->_headroom;
            float32x4_t v33 = vld1q_dup_f32(p_headroom);
            *(float32x4_t *)&a3->var1.var4.var1.var5 = vdivq_f32((float32x4_t)xmmword_18898C380, v33);
            a3->var1.var4.var1.var2 = 1.0 / self->_headroom;
            a3->var1.var4.var1.var3 = 1.0;
            long long v34 = objc_opt_class();
            *(float *)&double v35 = a4;
            *(float *)&double v36 = a4;
            char v27 = [v34 getColorTRC:0 matrix:&a3[1].var1.var4.var2 toneMapping:0 fromSourceSpace:ExtendedLinearized headroom:0 toEDR:v35 toneMappingMode:v36];
          }
          else
          {
            char v27 = 0;
          }
          CFRelease(ExtendedLinearized);

          return v27;
        }
        LogError("-[HDRImage getInputColorTransform:toEDR:]", 1686, "Failed to create color space from CICP tag: '%u'", v14);
      }
      else
      {
        id v26 = [(NSDictionary *)v12 description];
        LogError("-[HDRImage getInputColorTransform:toEDR:]", 1676, "Failed to extract FlexGTC gainMap info: '%s'", (const char *)[v26 UTF8String]);
      }
    }
    else
    {
      id v25 = [(NSDictionary *)self->_flexGTCInfo description];
      LogError("-[HDRImage getInputColorTransform:toEDR:]", 1670, "Failed to extract FlexGTC curve data: '%s'", (const char *)[v25 UTF8String]);
    }
    return 0;
  }
  uint64_t v18 = [(HDRImage *)self colorSpace];
  [(HDRImage *)self headroom];
  int v20 = v19;
  uint64_t v21 = [(HDRImage *)self toneMappingMode];
  LODWORD(v22) = v20;
  *(float *)&double v23 = a4;

  return [v9 getColorTRC:a3 matrix:&a3[1].var1.var4.var2 toneMapping:&a3->var1.var1.var7 fromSourceSpace:v18 headroom:v21 toEDR:v22 toneMappingMode:v23];
}

- (BOOL)getOutputColorTransform:(id *)a3 fromEDR:(float)a4
{
  id v7 = objc_opt_class();
  int v8 = [(HDRImage *)self colorSpace];
  *(float *)&double v9 = a4;

  return [v7 getColorTRC:&a3[1].var2.var1.var3 matrix:a3 toneMapping:&a3->var1.var4 fromEDR:v8 toTargetSpace:v9];
}

- (BOOL)getInputImagePixelTransform:(id *)a3
{
  int v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend((id)objc_opt_class(), "getInputPixelType:range:YCCMatrix:forBuffer:", &v17, &v15, &v12, -[HDRImage imageBuffer](self, "imageBuffer"));
  BOOL v6 = v5;
  if (a3 && v5)
  {
    a3->var0 = v17;
    long long v7 = v16;
    *(_OWORD *)&a3[4].var0 = v15;
    *(_OWORD *)&a3[8].var0 = v7;
    long long v8 = v13;
    *(_OWORD *)&a3[12].var0 = v12;
    *(_OWORD *)&a3[16].var0 = v8;
    *(_OWORD *)&a3[20].var0 = v14;
    [(HDRImage *)self orientation];
    float64x2_t v19 = 0u;
    float64x2_t v20 = 0u;
    float64x2_t v18 = 0u;
    CGImageGetTransformForOrientationAndSize();
    float32x2_t v9 = vcvt_f32_f64(v19);
    float32x2_t v10 = vcvt_f32_f64(v20);
    *(float32x2_t *)&a3[24].var0 = vcvt_f32_f64(v18);
    *(float32x2_t *)&a3[26].var0 = v9;
    *(float32x2_t *)&a3[28].var0 = v10;
  }
  return v6;
}

- (BOOL)getOutputImagePixelTransform:(id *)a3
{
  int v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  int v8 = 0;
  int v4 = objc_msgSend((id)objc_opt_class(), "getOutputPixelType:range:YCCMatrix:chromaSubsampling:forBuffer:", &v14, &v12, &v9, &v8, -[HDRImage imageBuffer](self, "imageBuffer"));
  if (a3 && v4)
  {
    a3->var0 = v14;
    long long v5 = v13;
    *(_OWORD *)&a3[4].var0 = v12;
    *(_OWORD *)&a3[8].var0 = v5;
    long long v6 = v10;
    *(_OWORD *)&a3[12].var0 = v9;
    *(_OWORD *)&a3[16].var0 = v6;
    *(_OWORD *)&a3[20].var0 = v11;
    LOWORD(v6) = 1;
    WORD3(v6) = 1;
    *(_DWORD *)((char *)&v6 + 2) = v8;
    *(void *)&a3[24].var0 = v6;
  }
  return v4;
}

- (BOOL)getInputGainMapPixelTransform:(id *)a3
{
  int v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend((id)objc_opt_class(), "getInputPixelType:range:YCCMatrix:forBuffer:", &v17, &v15, &v12, -[HDRImage gainMapBuffer](self, "gainMapBuffer"));
  BOOL v6 = v5;
  if (a3 && v5)
  {
    a3->var0 = v17;
    long long v7 = v16;
    *(_OWORD *)&a3[4].var0 = v15;
    *(_OWORD *)&a3[8].var0 = v7;
    long long v8 = v13;
    *(_OWORD *)&a3[12].var0 = v12;
    *(_OWORD *)&a3[16].var0 = v8;
    *(_OWORD *)&a3[20].var0 = v14;
    [(HDRImage *)self gainMapOrientation];
    float64x2_t v19 = 0u;
    float64x2_t v20 = 0u;
    float64x2_t v18 = 0u;
    CGImageGetTransformForOrientationAndSize();
    float32x2_t v9 = vcvt_f32_f64(v19);
    float32x2_t v10 = vcvt_f32_f64(v20);
    *(float32x2_t *)&a3[24].var0 = vcvt_f32_f64(v18);
    *(float32x2_t *)&a3[26].var0 = v9;
    *(float32x2_t *)&a3[28].var0 = v10;
  }
  return v6;
}

- (BOOL)getOutputGainMapPixelTransform:(id *)a3
{
  int v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  __int32 v19 = 0;
  int v5 = objc_msgSend((id)objc_opt_class(), "getOutputPixelType:range:YCCMatrix:chromaSubsampling:forBuffer:", &v25, &v23, &v20, &v19, -[HDRImage gainMapBuffer](self, "gainMapBuffer"));
  BOOL result = 0;
  if (v5)
  {
    [(HDRImage *)self gainMapSize];
    int8x8_t v18 = v7;
    int32x2_t v8 = (int32x2_t)vand_s8(v7, (int8x8_t)0xFFFF0000FFFFLL);
    [(HDRImage *)self imageSize];
    int32x2_t v10 = (int32x2_t)vand_s8(v9, (int8x8_t)0xFFFF0000FFFFLL);
    int16x4_t v11 = (int16x4_t)vceq_s32(v8, v10);
    if ((vminv_u16((uint16x4_t)vuzp1_s16(v11, v11)) & 0x8000) != 0)
    {
      unsigned int v13 = 1;
      if (!a3) {
        return 1;
      }
    }
    else
    {
      int16x4_t v12 = (int16x4_t)vceq_s32(v8, (int32x2_t)vshr_n_u32((uint32x2_t)v10, 1uLL));
      if ((vminv_u16((uint16x4_t)vuzp1_s16(v12, v12)) & 0x8000) == 0)
      {
        LogError("-[HDRImage getOutputGainMapPixelTransform:]", 1828, "Unsupported gain map size: %ux%u image size: %ux%u", v18.u16[0], v18.u16[2], v9.u16[0], v9.u16[2]);
        return 0;
      }
      unsigned int v13 = 2;
      if (!a3) {
        return 1;
      }
    }
    int v14 = v25;
    a3->var0 = v25;
    long long v15 = v24;
    *(_OWORD *)&a3[4].var0 = v23;
    *(_OWORD *)&a3[8].var0 = v15;
    long long v16 = v21;
    *(_OWORD *)&a3[12].var0 = v20;
    *(_OWORD *)&a3[16].var0 = v16;
    *(_OWORD *)&a3[20].var0 = v22;
    switch(v14)
    {
      case 3:
        goto LABEL_11;
      case 2:
        v17.i16[0] = 1;
        v17.i16[3] = 1;
        *(__int32 *)((char *)v17.i32 + 2) = v19;
        *(int16x4_t *)&a3[24].var0 = vmul_s16(v17, vdup_n_s16(v13));
        return 1;
      case 1:
LABEL_11:
        *(void *)&a3[24].var0 = (unsigned __int16)v13;
        break;
    }
    return 1;
  }
  return result;
}

- (BOOL)getInputGainMapColorMatrix:(id *)a3
{
  BOOL v5 = [(HDRImage *)self hasGainMap];
  if (v5)
  {
    BOOL v6 = [(HDRImage *)self gainMapColorSpace];
    if (!v6 || (int8x8_t v7 = v6, CGColorSpaceGetModel(v6) != kCGColorSpaceModelRGB)) {
      int8x8_t v7 = [(HDRImage *)self colorSpace];
    }
    int32x2_t v8 = (CGColorSpace *)CGColorSpaceCopyBaseColorSpace();
    int8x8_t v9 = v8;
    if (!v8) {
      int32x2_t v8 = v7;
    }
    CGColorSpaceRef Linearized = CGColorSpaceCreateLinearized(v8);
    if (!Linearized)
    {
      int16x4_t v11 = (id) CFCopyDescription(v7);
      LogError("-[HDRImage getInputGainMapColorMatrix:]", 1870, "Failed to linearized gain map space: %s, using sRGB Linear instead!", (const char *)[(__CFString *)v11 UTF8String]);

      CGColorSpaceRef Linearized = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC88]);
    }
    int16x4_t v12 = objc_opt_class();
    LODWORD(v13) = 1.0;
    LODWORD(v14) = 1.0;
    char v15 = [v12 getColorTRC:0 matrix:a3 toneMapping:0 fromSourceSpace:Linearized headroom:0 toEDR:v13 toneMappingMode:v14];
    CGColorSpaceRelease(Linearized);
    CGColorSpaceRelease(v9);
    LOBYTE(v5) = v15;
  }
  return v5;
}

- (BOOL)getOutputGainMapColorMatrix:(HDRImage *)self lumaWeights:(SEL)a2 isLuma:(id *)a3
{
  BOOL v5 = v4;
  uint64_t v6 = v3;
  if (![(HDRImage *)self hasGainMap]) {
    return 0;
  }
  int v16 = 0;
  id v15 = 0;
  int v9 = objc_msgSend((id)objc_opt_class(), "getPixelType:YCCMatrixString:chromaSubsampling:componentRange:bitDepth:isFloat:forBuffer:", &v16, &v15, 0, 0, 0, 0, -[HDRImage gainMapBuffer](self, "gainMapBuffer"));
  id v10 = v15;
  BOOL v11 = 0;
  if (v9)
  {
    int16x4_t v12 = [(HDRImage *)self gainMapColorSpace];
    if (!v12) {
      int16x4_t v12 = [(HDRImage *)self colorSpace];
    }
    double v13 = objc_opt_class();
    [(HDRImage *)self headroom];
    if (objc_msgSend(v13, "getColorTRC:matrix:toneMapping:fromEDR:toTargetSpace:", 0, a3, 0, v12))
    {
      if (v16 == 3)
      {
        if (v6) {
          *(_OWORD *)uint64_t v6 = xmmword_18898C380;
        }
        BOOL v11 = 1;
        if (v5) {
          *BOOL v5 = 1;
        }
      }
      else
      {
        if (v5) {
          *BOOL v5 = 0;
        }
        if (v6)
        {
          *(void *)uint64_t v6 = 0;
          *(void *)(v6 + 8) = 0;
        }
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (BOOL)getInputGainMapTransform:(id *)a3 toEDR:(float)a4 needsGainMap:(BOOL *)a5 baseIsSDR:(BOOL *)a6
{
  if ([(HDRImage *)self type] == 4)
  {
    BOOL v12 = 1;
    if (a4 > 1.0)
    {
      *(float *)v11.i32 = a4 + -1.0;
      if ((float)(a4 + -1.0) < 0.0) {
        *(float *)v11.i32 = 0.0;
      }
      *(_DWORD *)&a3[10].var1.var1.var1 = 1;
      *(int32x4_t *)&a3[12].var0.var0 = vdupq_n_s32(0x400CCCCDu);
      *(int32x4_t *)&a3[13].var1.var0.var0 = vdupq_lane_s32(v11, 0);
      __asm { FMOV            V0.4S, #1.0 }
      *(_OWORD *)&a3[14].var1.var1.var1 = _Q0;
      *(_OWORD *)&a3[16].var0.var0 = 0u;
      *(_OWORD *)&a3[17].var1.var0.var0 = 0u;
      *(_OWORD *)&a3[18].var1.var1.var1 = 0u;
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ([(HDRImage *)self type] == 6)
  {
    [(HDRFlexRangeParameters *)self->_flexRangeParams baseHeadroom];
    float v19 = exp2f(v18);
    [(HDRFlexRangeParameters *)self->_flexRangeParams alternateHeadroom];
    BOOL v12 = v19 <= 1.0;
    if (v19 > 1.0) {
      BOOL v20 = v19 > a4;
    }
    else {
      BOOL v20 = a4 > 1.0;
    }
    if (v20)
    {
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelGammaRGB];
      float32x4_t v43 = v21;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelMinRGB];
      float32x4_t v42 = v22;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelMaxRGB];
      float32x4_t v41 = v23;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelBaseOffsetRGB];
      long long v40 = v24;
      [(HDRFlexRangeParameters *)self->_flexRangeParams channelAlternateOffsetRGB];
      long long v39 = v25;
      float v26 = log2f(a4);
      [(HDRFlexRangeParameters *)self->_flexRangeParams baseHeadroom];
      float v28 = v26 - v27;
      [(HDRFlexRangeParameters *)self->_flexRangeParams alternateHeadroom];
      float v30 = v29;
      [(HDRFlexRangeParameters *)self->_flexRangeParams baseHeadroom];
      *(float *)v31.i32 = fminf(fmaxf(v28 / (float)(v30 - *(float *)v31.i32), 0.0), 1.0);
      if (v19 >= a4) {
        *(float *)v31.i32 = -*(float *)v31.i32;
      }
      __asm { FMOV            V1.4S, #1.0 }
      *(_DWORD *)&a3[10].var1.var1.var1 = 2;
      *(float32x4_t *)&a3[12].var0.var0 = vdivq_f32(_Q1, v43);
      *(float32x4_t *)&a3[13].var1.var0.var0 = vsubq_f32(v41, v42);
      *(float32x4_t *)&a3[14].var1.var1.var1 = v42;
      *(_OWORD *)&a3[16].var0.var0 = v40;
      *(_OWORD *)&a3[17].var1.var0.var0 = v39;
      *(int32x4_t *)&a3[18].var1.var1.var1 = vdupq_lane_s32(v31, 0);
LABEL_14:
      [(HDRImage *)self getInputGainMapColorMatrix:&a3[20]];
      [(HDRImage *)self getInputGainMapPixelTransform:a3];
      BOOL v33 = 1;
      if (!a5) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_16:
    BOOL v33 = 0;
    *(_DWORD *)&a3[10].var1.var1.var1 = 0;
    uint64_t v34 = MEMORY[0x1E4F14998];
    long long v35 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
    *(_OWORD *)&a3[20].var0.var0 = *MEMORY[0x1E4F14998];
    *(_OWORD *)&a3[21].var1.var0.var0 = v35;
    *(_OWORD *)&a3[22].var1.var1.var1 = *(_OWORD *)(v34 + 32);
    LOBYTE(a3[24].var0.var0) = 1;
    if (!a5)
    {
LABEL_18:
      if (a6) {
        *a6 = v12;
      }
      return 1;
    }
LABEL_17:
    *a5 = v33;
    goto LABEL_18;
  }
  unint64_t v37 = [(HDRImage *)self type];
  if (v37 > 6) {
    double v38 = "???";
  }
  else {
    double v38 = off_1E53C05A0[v37];
  }
  LogError("-[HDRImage getInputGainMapTransform:toEDR:needsGainMap:baseIsSDR:]", 1987, "Unexpected HDR type: %s", v38);
  return 0;
}

- (BOOL)getOutputGainMapTransform:(id *)a3 fromEDR:(float)a4 needsGainMap:(BOOL *)a5 baseIsSDR:(BOOL *)a6
{
  if ([(HDRImage *)self type] == 4)
  {
    __asm { FMOV            V0.2S, #1.0 }
    *(float *)&_D0.i32[1] = a4;
    *(int32x2_t *)&a3[14].var1.var0 = _D0;
    BOOL v16 = 1;
    a3->var0.var0.var0 = 1;
    *(float *)v10.i32 = 1.0 / (float)(a4 + -1.0);
    *(float *)_D0.i32 = -1.0 / (float)(a4 + -1.0);
    *(int32x4_t *)&a3[1].var0.var1.var1 = vdupq_n_s32(0x3EE8BA2Eu);
    *(int32x4_t *)&a3[2].var1.var0 = vdupq_lane_s32(v10, 0);
    *(int32x4_t *)&a3[4].var0.var0.var0 = vdupq_lane_s32(_D0, 0);
    *(int32x4_t *)&a3[5].var0.var1.var1 = vdupq_n_s32(0x3A83126Fu);
    *(_OWORD *)&a3[6].var1.var0 = 0u;
    *(_OWORD *)&a3[8].var0.var0.var0 = 0u;
  }
  else
  {
    if ([(HDRImage *)self type] != 6)
    {
      BOOL v28 = 0;
      goto LABEL_7;
    }
    [(HDRFlexRangeParameters *)self->_flexRangeParams baseHeadroom];
    float v34 = exp2f(v17);
    [(HDRFlexRangeParameters *)self->_flexRangeParams alternateHeadroom];
    float v32 = exp2f(v18);
    [(HDRFlexRangeParameters *)self->_flexRangeParams channelGamma];
    int32x2_t v31 = v19;
    [(HDRFlexRangeParameters *)self->_flexRangeParams channelMin];
    float v21 = v20;
    [(HDRFlexRangeParameters *)self->_flexRangeParams channelMax];
    float v23 = v22;
    [(HDRFlexRangeParameters *)self->_flexRangeParams channelBaseOffset];
    int32x2_t v30 = v24;
    [(HDRFlexRangeParameters *)self->_flexRangeParams channelAlternateOffset];
    *(float *)v25.i32 = 1.0 / (float)(v23 - v21);
    *(float *)v26.i32 = (float)-v21 / (float)(v23 - v21);
    *(void *)&a3[14].var1.var0 = __PAIR64__(LODWORD(v32), LODWORD(v34));
    a3->var0.var0.var0 = 2;
    *(int32x4_t *)&a3[1].var0.var1.var1 = vdupq_lane_s32(v31, 0);
    *(int32x4_t *)&a3[2].var1.var0 = vdupq_lane_s32(v25, 0);
    *(int32x4_t *)&a3[4].var0.var0.var0 = vdupq_lane_s32(v26, 0);
    *(int32x4_t *)&a3[5].var0.var1.var1 = vdupq_lane_s32(v30, 0);
    *(int32x4_t *)&a3[6].var1.var0 = vdupq_lane_s32(v27, 0);
    *(_OWORD *)&a3[8].var0.var0.var0 = 0u;
    BOOL v16 = v34 < v32;
  }
  *a6 = v16;
  BOOL v35 = 0;
  [(HDRImage *)self getOutputGainMapColorMatrix:&a3[9].var0.var1 lumaWeights:&a3[16] isLuma:&v35];
  a3[17].var0.var1.var1 = v35;
  [(HDRImage *)self getOutputGainMapPixelTransform:&a3[18].var1];
  BOOL v28 = 1;
LABEL_7:
  *a5 = v28;
  return 1;
}

- (BOOL)getInputImageTransform:(id *)a3 toEDR:(float)a4
{
  BOOL v7 = -[HDRImage getInputImagePixelTransform:](self, "getInputImagePixelTransform:");
  *(float *)&double v8 = a4;
  return v7 & [(HDRImage *)self getInputColorTransform:&a3->var1.var1.var4.var1.var3 toEDR:v8];
}

- (BOOL)getOutputImageTransform:(id *)a3 fromEDR:(float)a4
{
  BOOL v7 = [(HDRImage *)self getOutputImagePixelTransform:&a3[2].var0.var1.var1.var5];
  *(float *)&double v8 = a4;
  return v7 & [(HDRImage *)self getOutputColorTransform:a3 fromEDR:v8];
}

- (BOOL)getInputTransform:(id *)a3 toEDR:(float)a4
{
  if (!a3)
  {
    float v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDRImage.mm", 2084, @"Invalid parameter not satisfying: %@", @"outTransform != NULL" object file lineNumber description];
  }
  __int16 v26 = 0;
  if ([(HDRImage *)self hasGainMap]
    && (*(float *)&double v7 = a4,
        [(HDRImage *)self getInputGainMapTransform:&a3[2].var1.var1.var1.var4.var1.var1 toEDR:(char *)&v26 + 1 needsGainMap:&v26 baseIsSDR:v7], HIBYTE(v26)))
  {
    int v8 = v26;
    if ((_BYTE)v26) {
      unsigned int v9 = 3;
    }
    else {
      unsigned int v9 = 1;
    }
    a3->var0 = v9;
    a4 = 1.0;
    if (!v8)
    {
      [(HDRImage *)self headroom];
      a4 = *(float *)&v7;
    }
  }
  else
  {
    a3->var0 = 0;
  }
  *(float *)&double v7 = a4;
  BOOL v10 = [(HDRImage *)self getInputImageTransform:&a3->var1.var1 toEDR:v7];
  if (HIBYTE(v26) && !LOBYTE(a3[4].var1.var1.var0.var1.var3))
  {
    p_var1 = &a3[2].var1.var1.var1;
    if (a3[2].var1.var1.var1.var3.var1)
    {
      simd_float3x3 v31 = __invert_f3(*(simd_float3x3 *)&a3[3].var2.var0.var0);
      LODWORD(a3[2].var1.var1.var1.var1.var1) = v31.columns[0].i32[2];
      *(void *)&p_var1->var0 = v31.columns[0].i64[0];
      LODWORD(a3[2].var1.var1.var1.var1.var5) = v31.columns[1].i32[2];
      *(void *)&a3[2].var1.var1.var1.var1.var3 = v31.columns[1].i64[0];
      LODWORD(a3[2].var1.var1.var1.var2) = v31.columns[2].i32[2];
      *(void *)&a3[2].var1.var1.var1.var1.var7 = v31.columns[2].i64[0];
      a3[2].var1.var1.var1.var3.var1 = 0;
    }
    else
    {
      simd_float3x3 v12 = *(simd_float3x3 *)&a3[3].var2.var0.var0;
      uint32x4_t v13 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&a3[2].var1.var1.var1.var1.var3, (float32x4_t)v12.columns[1]), (int8x16_t)vceqq_f32(*(float32x4_t *)&a3[2].var1.var1.var1.var0, (float32x4_t)v12.columns[0])), (int8x16_t)vceqq_f32(*(float32x4_t *)&a3[2].var1.var1.var1.var1.var7, (float32x4_t)v12.columns[2]));
      v13.i32[3] = v13.i32[2];
      if ((vminvq_u32(v13) & 0x80000000) != 0)
      {
        long long v18 = *MEMORY[0x1E4F14998];
        long long v19 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
        *(_OWORD *)&a3[2].var1.var1.var1.var1.var3 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
        *(_OWORD *)&a3[2].var1.var1.var1.var1.var7 = v19;
        *(_OWORD *)&p_var1->var0 = v18;
        a3[2].var1.var1.var1.var3.var1 = 1;
      }
      else
      {
        long long v23 = *(_OWORD *)&a3[2].var1.var1.var1.var0;
        long long v24 = *(_OWORD *)&a3[2].var1.var1.var1.var1.var3;
        long long v25 = *(_OWORD *)&a3[2].var1.var1.var1.var1.var7;
        simd_float3x3 v32 = __invert_f3(v12);
        uint64_t v14 = 0;
        v27[0] = v23;
        v27[1] = v24;
        v27[2] = v25;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        do
        {
          *(long long *)((char *)&v28 + v14 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v32.columns[0], COERCE_FLOAT(v27[v14])), (float32x4_t)v32.columns[1], *(float32x2_t *)&v27[v14], 1), (float32x4_t)v32.columns[2], (float32x4_t)v27[v14], 2);
          ++v14;
        }
        while (v14 != 3);
        uint64_t v15 = v28;
        long long v16 = v29;
        long long v17 = v30;
        a3[2].var1.var1.var1.var1.var1 = *((float *)&v28 + 2);
        a3[2].var1.var1.var1.var1.var5 = *((float *)&v16 + 2);
        *(void *)&p_var1->var0 = v15;
        *(void *)&a3[2].var1.var1.var1.var1.var3 = v16;
        LODWORD(a3[2].var1.var1.var1.var2) = DWORD2(v17);
        *(void *)&a3[2].var1.var1.var1.var1.var7 = v17;
      }
    }
  }
  return v10;
}

- (BOOL)getOutputTransform:(id *)a3 fromEDR:(float)a4
{
  if (!a3)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDRImage.mm", 2129, @"Invalid parameter not satisfying: %@", @"outTransform != NULL" object file lineNumber description];
  }
  __int16 v17 = 0;
  if ([(HDRImage *)self hasGainMap])
  {
    *(float *)&double v7 = a4;
    [(HDRImage *)self getOutputGainMapTransform:&a3[2].var1.var0.var1.var4.var2 fromEDR:(char *)&v17 + 1 needsGainMap:&v17 baseIsSDR:v7];
    int v8 = v17;
    if ((_BYTE)v17) {
      int v9 = 3;
    }
    else {
      int v9 = 1;
    }
    BOOL v10 = HIBYTE(v17) == 0;
    if (HIBYTE(v17)) {
      unsigned int v11 = v9;
    }
    else {
      unsigned int v11 = 0;
    }
  }
  else
  {
    int v8 = 0;
    unsigned int v11 = 0;
    BOOL v10 = 1;
  }
  a3->var0 = v11;
  p_var1 = &a3->var1.var0.var1;
  if (v8) {
    int v13 = v10;
  }
  else {
    int v13 = 1;
  }
  LODWORD(v7) = 1.0;
  if (v13) {
    *(float *)&double v7 = a4;
  }
  return [(HDRImage *)self getOutputImageTransform:p_var1 fromEDR:v7];
}

- (id)inputTransformToEDR:(float)a3
{
  BOOL v5 = objc_alloc_init(HDRInputTransform);
  uint64_t v6 = [(HDRInputTransform *)v5 storage];
  *(float *)&double v7 = a3;
  if ([(HDRImage *)self getInputTransform:v6 toEDR:v7]) {
    int v8 = v5;
  }
  else {
    int v8 = 0;
  }
  int v9 = v8;

  return v9;
}

- (id)outputTransformFromEDR:(float)a3
{
  BOOL v5 = objc_alloc_init(HDROutputTransform);
  uint64_t v6 = [(HDROutputTransform *)v5 storage];
  *(float *)&double v7 = a3;
  if ([(HDRImage *)self getOutputTransform:v6 fromEDR:v7]) {
    int v8 = v5;
  }
  else {
    int v8 = 0;
  }
  int v9 = v8;

  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (int)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

- (float)headroom
{
  return self->_headroom;
}

- (void)setHeadroom:(float)a3
{
  self->_headroom = a3;
}

- (__CVBuffer)imageBuffer
{
  return self->_imageBuffer;
}

- (__CVBuffer)gainMapBuffer
{
  return self->_gainMapBuffer;
}

- (int)gainMapOrientation
{
  return self->_gainMapOrientation;
}

- (void)setGainMapOrientation:(int)a3
{
  self->_gainMapOrientation = a3;
}

- (HDRFlexRangeParameters)flexRangeParams
{
  return self->_flexRangeParams;
}

- (void)setFlexRangeParams:(id)a3
{
}

- (NSDictionary)flexGTCInfo
{
  return self->_flexGTCInfo;
}

- (int)toneMappingMode
{
  return self->_toneMappingMode;
}

- (void)setToneMappingMode:(int)a3
{
  self->_toneMappingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flexGTCInfo, 0);

  objc_storeStrong((id *)&self->_flexRangeParams, 0);
}

@end