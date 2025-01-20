@interface CSIGenerator
+ (int)fileEncoding;
+ (void)initialize;
+ (void)setFileEncoding:(int)a3;
- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentRectInsets;
- (BOOL)allowsDeepmap2ImageCompression;
- (BOOL)allowsDeepmapImageCompression;
- (BOOL)allowsHevcCompression;
- (BOOL)allowsMultiPassEncoding;
- (BOOL)allowsOptimalRowbytesPacking;
- (BOOL)allowsPaletteImageCompression;
- (BOOL)clampMetrics;
- (BOOL)cubemap;
- (BOOL)isExcludedFromContrastFilter;
- (BOOL)isFlippable;
- (BOOL)isInterpolatable;
- (BOOL)isTintable;
- (BOOL)isVectorBased;
- (BOOL)optOutOfThinning;
- (BOOL)preserveForArchiveOnly;
- (BOOL)preservedVectorRepresentation;
- (BOOL)textureOpaque;
- (BOOL)vectorContainsHierarchicalLayers;
- (BOOL)vectorContainsMulticolorLayers;
- (CGRect)alphaCroppedFrame;
- (CGSize)originalUncroppedSize;
- (CGSize)physicalSizeInMeters;
- (CGSize)size;
- (CSIGenerator)initWithCanvasSize:(CGSize)a3 sliceCount:(unsigned int)a4 layout:(signed __int16)a5;
- (CSIGenerator)initWithColorNamed:(id)a3 colorSpaceID:(unint64_t)a4 components:(id)a5;
- (CSIGenerator)initWithColorNamed:(id)a3 colorSpaceID:(unint64_t)a4 components:(id)a5 linkedToSystemColorWithName:(id)a6;
- (CSIGenerator)initWithExternalReference:(id)a3 tags:(id)a4;
- (CSIGenerator)initWithInternalReferenceRect:(CGRect)a3 layout:(signed __int16)a4;
- (CSIGenerator)initWithLayerStackData:(id)a3 type:(int64_t)a4 withCanvasSize:(CGSize)a5;
- (CSIGenerator)initWithLayerStackData:(id)a3 withCanvasSize:(CGSize)a4;
- (CSIGenerator)initWithModelAsset:(id)a3;
- (CSIGenerator)initWithModelMesh:(id)a3;
- (CSIGenerator)initWithModelSubmesh:(id)a3;
- (CSIGenerator)initWithMultisizeImageSetNamed:(id)a3 sizesByIndex:(id)a4;
- (CSIGenerator)initWithNameList:(id)a3;
- (CSIGenerator)initWithRawData:(id)a3 pixelFormat:(unsigned int)a4 layout:(signed __int16)a5;
- (CSIGenerator)initWithShapeEffectPreset:(id)a3 forScaleFactor:(unsigned int)a4;
- (CSIGenerator)initWithTextStyleNamed:(id)a3 fontName:(id)a4 fontSize:(double)a5 maxPointSize:(double)a6 minPointSize:(double)a7 scalingStyle:(signed __int16)a8 alignment:(signed __int16)a9;
- (CSIGenerator)initWithTextureForPixelFormat:(int64_t)a3;
- (CSIGenerator)initWithTextureImageWithSize:(CGSize)a3 forPixelFormat:(int64_t)a4 cubeMap:(BOOL)a5;
- (CUIPSDGradient)gradient;
- (CUIShapeEffectPreset)effectPreset;
- (MDLAsset)modelAsset;
- (MDLMesh)modelMesh;
- (MDLSubmesh)modelSubmesh;
- (NSArray)colorComponents;
- (NSArray)layerReferences;
- (NSArray)meshReferences;
- (NSArray)mipReferences;
- (NSArray)submeshReferences;
- (NSArray)vectorSizes;
- (NSDate)modtime;
- (NSDictionary)renditionProperties;
- (NSDictionary)sizesByIndex;
- (NSString)fontName;
- (NSString)name;
- (NSString)utiType;
- (__n128)setTransformation:(__n128)a3;
- (__n128)transformation;
- (double)compressionQuality;
- (double)fontSize;
- (double)maxPointSize;
- (double)minPointSize;
- (double)opacity;
- (float)baseline;
- (float)capHeight;
- (float)templateVersion;
- (id)CSIRepresentationWithCompression:(BOOL)a3;
- (id)_addNodes:(uint64_t)a3 toNodeList:;
- (id)_updateCompressionInfoFor:(id)result;
- (id)rawData;
- (int)blendMode;
- (int)exifOrientation;
- (int)objectVersion;
- (int64_t)compressionType;
- (int64_t)targetPlatform;
- (int64_t)templateRenderingMode;
- (int64_t)textureFormat;
- (int64_t)textureInterpretation;
- (int64_t)vectorGlyphRenderingMode;
- (signed)alignment;
- (signed)colorSpaceID;
- (signed)scalingStyle;
- (size_t)writeMultisizeImageSetToData:(void *)a1;
- (uint64_t)writeBitmap:(void *)a3 toData:(uint64_t)a4 compress:;
- (uint64_t)writeColorToData:(id *)a1;
- (uint64_t)writeExternalLinkToData:(uint64_t)a1;
- (uint64_t)writeGradientToData:(id *)a1;
- (uint64_t)writeRawDataToData:(uint64_t)result;
- (uint64_t)writeRecognitionObjectToData:(uint64_t)result;
- (uint64_t)writeResourcesToData:(uint64_t)a1;
- (uint64_t)writeTextStyleToData:(CFStringRef *)a1;
- (uint64_t)writeTextureToData:(uint64_t)a1;
- (unsigned)formatCSIHeader:(unsigned __int8 *)result;
- (unsigned)pixelFormat;
- (unsigned)scaleFactor;
- (unsigned)standardVectorSize;
- (void)_shouldUseCompactCompressionForBitmap:(void *)result;
- (void)addBitmap:(id)a3;
- (void)addLayerReference:(id)a3;
- (void)addMeshReference:(id)a3;
- (void)addMetrics:(id *)a3;
- (void)addMipReference:(id)a3;
- (void)addSliceRect:(CGRect)a3;
- (void)addSubmeshReference:(id)a3;
- (void)dealloc;
- (void)setAlignment:(signed __int16)a3;
- (void)setAlignmentRectInsets:(id)a3;
- (void)setAllowsDeepmap2ImageCompression:(BOOL)a3;
- (void)setAllowsDeepmapImageCompression:(BOOL)a3;
- (void)setAllowsHevcCompression:(BOOL)a3;
- (void)setAllowsMultiPassEncoding:(BOOL)a3;
- (void)setAllowsOptimalRowbytesPacking:(BOOL)a3;
- (void)setAllowsPaletteImageCompression:(BOOL)a3;
- (void)setAlphaCroppedFrame:(CGRect)a3;
- (void)setBaseline:(float)a3;
- (void)setBlendMode:(int)a3;
- (void)setCapHeight:(float)a3;
- (void)setClampMetrics:(BOOL)a3;
- (void)setColorComponents:(id)a3;
- (void)setColorSpaceID:(signed __int16)a3;
- (void)setCompressionQuality:(double)a3;
- (void)setCompressionType:(int64_t)a3;
- (void)setCubemap:(BOOL)a3;
- (void)setEffectPreset:(id)a3;
- (void)setExcludedFromContrastFilter:(BOOL)a3;
- (void)setExifOrientation:(int)a3;
- (void)setFontName:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setGradient:(id)a3;
- (void)setInterpolatable:(BOOL)a3;
- (void)setIsFlippable:(BOOL)a3;
- (void)setIsTintable:(BOOL)a3;
- (void)setIsVectorBased:(BOOL)a3;
- (void)setMaxPointSize:(double)a3;
- (void)setMinPointSize:(double)a3;
- (void)setModelAsset:(id)a3;
- (void)setModelMesh:(id)a3;
- (void)setModelSubmesh:(id)a3;
- (void)setModtime:(id)a3;
- (void)setName:(id)a3;
- (void)setObjectVersion:(int)a3;
- (void)setOpacity:(double)a3;
- (void)setOptOutOfThinning:(BOOL)a3;
- (void)setOriginalUncroppedSize:(CGSize)a3;
- (void)setPhysicalSizeInMeters:(CGSize)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setPreserveForArchiveOnly:(BOOL)a3;
- (void)setPreservedVectorRepresentation:(BOOL)a3;
- (void)setRenditionProperties:(id)a3;
- (void)setScaleFactor:(unsigned int)a3;
- (void)setScalingStyle:(signed __int16)a3;
- (void)setSize:(CGSize)a3;
- (void)setSizesByIndex:(id)a3;
- (void)setStandardVectorSize:(unsigned int)a3;
- (void)setTargetPlatform:(int64_t)a3;
- (void)setTemplateRenderingMode:(int64_t)a3;
- (void)setTemplateVersion:(float)a3;
- (void)setTextureFormat:(int64_t)a3;
- (void)setTextureInterpretation:(int64_t)a3;
- (void)setTextureOpaque:(BOOL)a3;
- (void)setUtiType:(id)a3;
- (void)setVectorContainsHierarchicalLayers:(BOOL)a3;
- (void)setVectorContainsMulticolorLayers:(BOOL)a3;
- (void)setVectorGlyphRenderingMode:(int64_t)a3;
- (void)setVectorSizes:(id)a3;
@end

@implementation CSIGenerator

+ (void)initialize
{
  BOOL v19 = 0;
  __SetBoolConfigFromEnvironment((BOOL *)&__coreThemeLoggingEnabled, "CoreThemeLoggingEnabled");
  __SetBoolConfigFromEnvironment((BOOL *)&__loggingEnabled, "CoreUI_LogCompressionStats");
  if (getenv("CoreUI_USELZVN"))
  {
    __SetBoolConfigFromEnvironment(&v19, "CoreUI_USELZVN");
    if (getenv("CoreUI_USELZVN")) {
      _CUILog(1, (uint64_t)"CoreUI: CoreUI_USELZVN is depreciated use the environment variable CoreUI_COMPRESSION instead", v2, v3, v4, v5, v6, v7, v18);
    }
    __environmentRequestedCompression = v19;
  }
  else
  {
    v8 = getenv("CoreUI_COMPRESSION");
    if (v8)
    {
      v9 = v8;
      if (!strncasecmp(v8, "lzw", 3uLL))
      {
        __environmentRequestedCompression = 0;
      }
      else
      {
        if (!strncasecmp(v9, "lzvn", 4uLL))
        {
          v16 = &OBJC_IVAR___CUIThemeSchemaRendition__image;
          int v17 = 1;
        }
        else
        {
          if (strncasecmp(v9, "lzfse", 5uLL))
          {
            _CUILog(4, (uint64_t)"CoreUI: Unknown value passed to environment variable '%s' ignoring", v10, v11, v12, v13, v14, v15, (uint64_t)"CoreUI_COMPRESSION");
            return;
          }
          v16 = &OBJC_IVAR___CUIThemeSchemaRendition__image;
          int v17 = 2;
        }
        v16[578] = v17;
      }
    }
  }
}

+ (void)setFileEncoding:(int)a3
{
  if (!getenv("CoreUI_USELZVN") && !getenv("CoreUI_COMPRESSION")) {
    __environmentRequestedCompression = a3;
  }
}

+ (int)fileEncoding
{
  return __environmentRequestedCompression;
}

- (CSIGenerator)initWithCanvasSize:(CGSize)a3 sliceCount:(unsigned int)a4 layout:(signed __int16)a5
{
  int v5 = a5;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)CSIGenerator;
  v9 = [(CSIGenerator *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_size.CGFloat width = width;
    v9->_size.CGFloat height = height;
    v9->_layout = v5;
    if (v5 != 6)
    {
      v9->_slices = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a4];
      v10->_bitmaps = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
      v10->_metrics = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    }
    v10->_layerReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_blendMode = 0;
    v10->_opacity = 1.0;
    v10->_pixelFormat = 1095911234;
    *(_WORD *)&v10->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v10->_allowsPaletteImageCompression = 0;
  }
  return v10;
}

- (CSIGenerator)initWithShapeEffectPreset:(id)a3 forScaleFactor:(unsigned int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CSIGenerator;
  uint64_t v6 = [(CSIGenerator *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_size = NSZeroSize;
    v6->_layout = 7;
    v6->_scaleFactor = a4;
    [(CSIGenerator *)v6 setEffectPreset:a3];
    v7->_blendMode = 0;
    v7->_opacity = 1.0;
    v7->_pixelFormat = 1095911234;
    *(_WORD *)&v7->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v7->_allowsPaletteImageCompression = 0;
  }
  return v7;
}

- (CSIGenerator)initWithNameList:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSIGenerator;
  uint64_t v4 = [(CSIGenerator *)&v7 init];
  int v5 = v4;
  if (v4)
  {
    v4->_layout = 1005;
    v4->_scaleFactor = 1;
    v4->_containedNamedElements = (NSArray *)a3;
  }
  return v5;
}

- (CSIGenerator)initWithRawData:(id)a3 pixelFormat:(unsigned int)a4 layout:(signed __int16)a5
{
  if ((int)a4 <= 1246774598)
  {
    if (a4 == 1145132097) {
      goto LABEL_9;
    }
    int v9 = 1212500294;
  }
  else
  {
    if (a4 == 1246774599 || a4 == 1346651680) {
      goto LABEL_9;
    }
    int v9 = 1398163232;
  }
  if (a4 != v9) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CSIGenerator.m" lineNumber:284 description:@"initWithRawData is only supported for SVG/PDF/JPEG/HEIGF and Raw data for now"];
  }
LABEL_9:
  v13.receiver = self;
  v13.super_class = (Class)CSIGenerator;
  uint64_t v10 = [(CSIGenerator *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_layout = a5;
    v10->_scaleFactor = 0;
    v10->_pixelFormat = a4;
    v10->_rawData = (NSData *)a3;
    *(_WORD *)&v11->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v11->_allowsPaletteImageCompression = 0;
    v11->_opacity = 1.0;
    if (a4 == 1246774599 || a4 == 1212500294)
    {
      v11->_slices = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v11->_bitmaps = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v11->_metrics = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    }
  }
  return v11;
}

- (CSIGenerator)initWithExternalReference:(id)a3 tags:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CSIGenerator;
  uint64_t v6 = [(CSIGenerator *)&v9 init];
  objc_super v7 = v6;
  if (v6)
  {
    v6->_size = NSZeroSize;
    v6->_layout = 1001;
    v6->_blendMode = 0;
    v6->_opacity = 1.0;
    v6->_pixelFormat = 1095911234;
    *(_WORD *)&v6->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v6->_allowsPaletteImageCompression = 0;
    v6->_assetPackIdentifier = (NSString *)a3;
    v7->_externalTags = (NSSet *)a4;
  }
  return v7;
}

- (CSIGenerator)initWithLayerStackData:(id)a3 withCanvasSize:(CGSize)a4
{
  return -[CSIGenerator initWithLayerStackData:type:withCanvasSize:](self, "initWithLayerStackData:type:withCanvasSize:", a3, 1002, a4.width, a4.height);
}

- (CSIGenerator)initWithLayerStackData:(id)a3 type:(int64_t)a4 withCanvasSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  signed __int16 v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSIGenerator;
  objc_super v9 = [(CSIGenerator *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_size.CGFloat width = width;
    v9->_size.CGFloat height = height;
    v9->_layout = v7;
    v9->_blendMode = 0;
    v9->_opacity = 1.0;
    v9->_pixelFormat = 1145132097;
    *(_WORD *)&v9->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v9->_allowsPaletteImageCompression = 0;
    v9->_metrics = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_layerReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_rawData = (NSData *)a3;
  }
  return v10;
}

- (CSIGenerator)initWithTextureForPixelFormat:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSIGenerator;
  uint64_t v4 = [(CSIGenerator *)&v7 init];
  int v5 = v4;
  if (v4)
  {
    v4->_layout = 1007;
    v4->_textureFormat = a3;
    v4->_pixelFormat = 1095911234;
    v4->_opacity = 1.0;
    *(_WORD *)&v4->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v4->_allowsPaletteImageCompression = 0;
    v4->_mipReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v5;
}

- (CSIGenerator)initWithTextureImageWithSize:(CGSize)a3 forPixelFormat:(int64_t)a4 cubeMap:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)CSIGenerator;
  objc_super v9 = [(CSIGenerator *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_size.CGFloat width = width;
    v9->_size.CGFloat height = height;
    v9->_layout = 1008;
    v9->_textureFormat = a4;
    v9->_pixelFormat = 1095911234;
    v9->_opacity = 1.0;
    v9->_isCubeMap = v5;
    id v11 = objc_alloc((Class)NSMutableArray);
    if (v5) {
      uint64_t v12 = 6;
    }
    else {
      uint64_t v12 = 1;
    }
    v10->_bitmaps = (NSMutableArray *)[v11 initWithCapacity:v12];
    *(_DWORD *)&v10->_allowsPaletteImageCompression = 0;
  }
  return v10;
}

- (CSIGenerator)initWithInternalReferenceRect:(CGRect)a3 layout:(signed __int16)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_super v9 = -[CSIGenerator initWithCanvasSize:sliceCount:layout:](self, "initWithCanvasSize:sliceCount:layout:", 1, 1003, a3.size.width, a3.size.height);
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_externalReferenceFrame.origin.CGFloat x = x;
    v9->_externalReferenceFrame.origin.CGFloat y = y;
    v9->_externalReferenceFrame.size.CGFloat width = width;
    v9->_externalReferenceFrame.size.CGFloat height = height;

    v10->_slices = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_metrics = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_layerReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->_blendMode = 0;
    v10->_opacitCGFloat y = 1.0;
    v10->_pixelFormat = 1095911234;
    *(_WORD *)&v10->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&v10->_allowsPaletteImageCompression = 0;
    v10->_linkLayout = a4;
  }
  return v10;
}

- (CSIGenerator)initWithColorNamed:(id)a3 colorSpaceID:(unint64_t)a4 components:(id)a5
{
  signed __int16 v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSIGenerator;
  v8 = [(CSIGenerator *)&v10 init];
  if (v8)
  {
    v8->_name = (NSString *)a3;
    v8->_colorComponents = (NSArray *)a5;
    v8->_colorSpaceID = v6;
    v8->_layout = 1009;
  }
  return v8;
}

- (CSIGenerator)initWithColorNamed:(id)a3 colorSpaceID:(unint64_t)a4 components:(id)a5 linkedToSystemColorWithName:(id)a6
{
  signed __int16 v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSIGenerator;
  objc_super v10 = [(CSIGenerator *)&v12 init];
  if (v10)
  {
    v10->_name = (NSString *)a3;
    v10->_colorComponents = (NSArray *)a5;
    v10->_colorSpaceID = v8;
    v10->_layout = 1009;
    v10->_systemColorName = (NSString *)a6;
  }
  return v10;
}

- (CSIGenerator)initWithTextStyleNamed:(id)a3 fontName:(id)a4 fontSize:(double)a5 maxPointSize:(double)a6 minPointSize:(double)a7 scalingStyle:(signed __int16)a8 alignment:(signed __int16)a9
{
  v18.receiver = self;
  v18.super_class = (Class)CSIGenerator;
  v16 = [(CSIGenerator *)&v18 init];
  if (v16)
  {
    v16->_name = (NSString *)a3;
    v16->_fontName = (NSString *)a4;
    v16->_fontSize = a5;
    v16->_maxPointSize = a6;
    v16->_minPointSize = a7;
    v16->_scalingStyle = a8;
    v16->_alignment = a9;
    v16->_layout = 1015;
  }
  return v16;
}

- (CSIGenerator)initWithMultisizeImageSetNamed:(id)a3 sizesByIndex:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CSIGenerator;
  signed __int16 v6 = [(CSIGenerator *)&v8 init];
  if (v6)
  {
    v6->_name = (NSString *)a3;
    v6->_sizesByIndeCGFloat x = (NSDictionary *)a4;
    v6->_layout = 1010;
  }
  return v6;
}

- (CSIGenerator)initWithModelAsset:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSIGenerator;
  uint64_t v4 = [(CSIGenerator *)&v6 init];
  if (v4)
  {
    v4->_modelAsset = (MDLAsset *)a3;
    v4->_layout = 1011;
    v4->_meshReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v4;
}

- (CSIGenerator)initWithModelMesh:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSIGenerator;
  uint64_t v4 = [(CSIGenerator *)&v6 init];
  if (v4)
  {
    v4->_modelMesh = (MDLMesh *)a3;
    v4->_layout = 1012;
    v4->_submeshReferences = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v4;
}

- (CSIGenerator)initWithModelSubmesh:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSIGenerator;
  uint64_t v4 = [(CSIGenerator *)&v6 init];
  if (v4)
  {
    v4->_modelSubmesh = (MDLSubmesh *)a3;
    v4->_layout = 1016;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CSIGenerator;
  [(CSIGenerator *)&v3 dealloc];
}

- (id)rawData
{
  return self->_rawData;
}

- (void)_shouldUseCompactCompressionForBitmap:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    if ([result compressionType] == (id)3 && objc_msgSend(v3, "pixelFormat") == 1095911234) {
      BOOL v4 = [a2 sourceAlphaInfo] == 5
    }
        || [a2 sourceAlphaInfo] == 6
        || [a2 sourceAlphaInfo] == 0;
    else {
      BOOL v4 = 0;
    }
    return (void *)([a2 allowsCompactCompression] & v4);
  }
  return result;
}

- (id)_updateCompressionInfoFor:(id)result
{
  if (!result) {
    return result;
  }
  objc_super v3 = result;
  if ([result compressionType] == (id)3)
  {
    unsigned int v4 = [v3 allowsHevcCompression];
    if ([v3 pixelFormat] == 1195456544 && !v4)
    {
      uint64_t v5 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    [v3 pixelFormat];
  }
  if (-[CSIGenerator _shouldUseCompactCompressionForBitmap:](v3, a2)) {
    uint64_t v5 = 7;
  }
  else {
    uint64_t v5 = (uint64_t)[v3 compressionType];
  }
LABEL_10:
  [a2 setCompressionType:v5];
  objc_msgSend(a2, "setTargetPlatform:", objc_msgSend(v3, "targetPlatform"));
  [v3 compressionQuality];
  objc_msgSend(a2, "setCompressionQuality:");
  objc_msgSend(a2, "setAllowsPaletteImageCompression:", objc_msgSend(v3, "allowsPaletteImageCompression"));
  objc_msgSend(a2, "setAllowsHevcCompression:", objc_msgSend(v3, "allowsHevcCompression"));
  objc_msgSend(a2, "setAllowsDeepmapImageCompression:", objc_msgSend(v3, "allowsDeepmapImageCompression"));
  id v6 = [v3 allowsDeepmap2ImageCompression];
  return [a2 setAllowsDeepmap2ImageCompression:v6];
}

- (void)addBitmap:(id)a3
{
  objc_msgSend(a3, "setName:", -[CSIGenerator name](self, "name"));
  -[CSIGenerator _updateCompressionInfoFor:](self, a3);
  bitmaps = self->_bitmaps;
  [(NSMutableArray *)bitmaps addObject:a3];
}

- (void)setCompressionQuality:(double)a3
{
  self->_compressionQualitCGFloat y = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  bitmaps = self->_bitmaps;
  id v5 = [(NSMutableArray *)bitmaps countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(bitmaps);
        }
        -[CSIGenerator _updateCompressionInfoFor:](self, *(void **)(*((void *)&v9 + 1) + 8 * i));
      }
      id v6 = [(NSMutableArray *)bitmaps countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (int64_t)compressionType
{
  return self->_compressionType;
}

- (void)setCompressionType:(int64_t)a3
{
  self->_compressionType = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  bitmaps = self->_bitmaps;
  id v5 = [(NSMutableArray *)bitmaps countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(bitmaps);
        }
        -[CSIGenerator _updateCompressionInfoFor:](self, *(void **)(*((void *)&v9 + 1) + 8 * i));
      }
      id v6 = [(NSMutableArray *)bitmaps countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (int64_t)targetPlatform
{
  return self->_targetPlatform;
}

- (void)setTargetPlatform:(int64_t)a3
{
  self->_targetPlatform = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  bitmaps = self->_bitmaps;
  id v5 = [(NSMutableArray *)bitmaps countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(bitmaps);
        }
        -[CSIGenerator _updateCompressionInfoFor:](self, *(void **)(*((void *)&v9 + 1) + 8 * i));
      }
      id v6 = [(NSMutableArray *)bitmaps countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addSliceRect:(CGRect)a3
{
  slices = self->_slices;
  unsigned int v4 = +[NSValue valueWithRect:](NSValue, "valueWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(NSMutableArray *)slices addObject:v4];
}

- (void)addMetrics:(id *)a3
{
  CGSize var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  v7[2] = a3->var2;
  v6[0] = CSIIllegalMetrics;
  v6[1] = unk_1A139E0C8;
  v6[2] = xmmword_1A139E0D8;
  if (!CSIEqualMetrics((uint64_t)v7, (uint64_t)v6)) {
    [(NSMutableArray *)self->_metrics addObject:+[NSValue valueWithBytes:a3 objCType:"{?={CGSize=dd}{CGSize=dd}{CGSize=dd}}"]];
  }
}

- (void)addLayerReference:(id)a3
{
}

- (void)addMipReference:(id)a3
{
}

- (void)addMeshReference:(id)a3
{
}

- (void)addSubmeshReference:(id)a3
{
}

- (unsigned)formatCSIHeader:(unsigned __int8 *)result
{
  if (!result) {
    return result;
  }
  objc_super v3 = result;
  *(void *)a2 = 0x143545349;
  *(_DWORD *)(a2 + 8) = (4 * result[89]) | (2 * result[88]);
  *(_DWORD *)(a2 + 28) &= 0xFu;
  id v4 = [result templateRenderingMode];
  if (v4 == (id)1)
  {
    int v5 = 8;
  }
  else
  {
    if (v4 != (id)2) {
      goto LABEL_7;
    }
    int v5 = 16;
  }
  *(_DWORD *)(a2 + 8) |= v5;
LABEL_7:
  if ([v3 optOutOfThinning]) {
    *(_DWORD *)(a2 + 8) |= 0x20u;
  }
  if ([v3 preserveForArchiveOnly]) {
    *(_DWORD *)(a2 + 8) |= 0x200u;
  }
  if ([v3 preservedVectorRepresentation]) {
    *(_DWORD *)(a2 + 8) |= 0x100u;
  }
  if ([v3 isFlippable]) {
    *(_DWORD *)(a2 + 8) |= 0x40u;
  }
  if ([v3 isTintable]) {
    *(_DWORD *)(a2 + 8) |= 0x80u;
  }
  *(uint32x2_t *)(a2 + 12) = vcvt_u32_f32(vrndx_f32(vcvt_f32_f64(*(float64x2_t *)(v3 + 8))));
  *(_DWORD *)(a2 + 20) = 100 * *((_DWORD *)v3 + 35);
  *(_DWORD *)(a2 + 24) = *((_DWORD *)v3 + 48);
  int v6 = *((_DWORD *)v3 + 48);
  if (v6 > 1195456543)
  {
    if (v6 == 1195456544)
    {
      unsigned int v8 = *(_DWORD *)(a2 + 28) & 0xFFFFFFF0 | 2;
      goto LABEL_26;
    }
    int v7 = 1380401751;
    goto LABEL_22;
  }
  if (v6 != 1095911234)
  {
    int v7 = 1195454774;
LABEL_22:
    if (v6 != v7)
    {
      unsigned int v8 = *(_DWORD *)(a2 + 28);
      goto LABEL_26;
    }
  }
  unsigned int v8 = *(_DWORD *)(a2 + 28) & 0xFFFFFFF0 | *((_WORD *)v3 + 68) & 0xF;
LABEL_26:
  *(_DWORD *)(a2 + 28) = v8 & 0xF;
  if ([v3 modtime])
  {
    objc_msgSend(objc_msgSend(v3, "modtime"), "timeIntervalSince1970");
    unsigned int v10 = v9;
  }
  else
  {
    unsigned int v10 = 0;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(a2 + 36) = *((unsigned __int16 *)v3 + 69);
  long long v11 = (void *)*((void *)v3 + 3);
  if (v11) {
    long long v12 = (const char *)[v11 UTF8String];
  }
  else {
    long long v12 = "CoreStructuredImage";
  }
  strncpy((char *)(a2 + 40), v12, 0x7FuLL);
  *(_DWORD *)(a2 + 168) = 0;
  result = (unsigned __int8 *)[*((id *)v3 + 8) count];
  if (result <= 1) {
    int v13 = 1;
  }
  else {
    int v13 = (int)result;
  }
  *(_DWORD *)(a2 + 172) = v13;
  return result;
}

- (uint64_t)writeResourcesToData:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = a1;
  uint64_t v170 = 0;
  unsigned int v169 = 0;
  if ([*(id *)(a1 + 56) count] != (id)9) {
    goto LABEL_22;
  }
  if (![*(id *)(v3 + 64) count]) {
    goto LABEL_22;
  }
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 4), "rectValue");
  if (v4 != (double)objc_msgSend(objc_msgSend(*(id *)(v3 + 64), "objectAtIndex:", 0), "width")) {
    goto LABEL_22;
  }
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 4), "rectValue");
  if (v5 != (double)objc_msgSend(objc_msgSend(*(id *)(v3 + 64), "objectAtIndex:", 0), "height")) {
    goto LABEL_22;
  }
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 0), "rectValue");
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 1), "rectValue");
  double v144 = v10;
  double v12 = v11;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 2), "rectValue");
  double v140 = v13;
  double v142 = v14;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 3), "rectValue");
  id obj = v15;
  double v138 = v16;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 4), "rectValue");
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 5), "rectValue");
  double v134 = v17;
  double v19 = v18;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 6), "rectValue");
  double v21 = v20;
  double v23 = v22;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 7), "rectValue");
  double v25 = v24;
  double v27 = v26;
  objc_msgSend(objc_msgSend(*(id *)(v3 + 56), "objectAtIndex:", 8), "rectValue");
  if (v9 != 0.0 && v7 != 0.0) {
    goto LABEL_22;
  }
  if ((v12 == 0.0 || v144 == 0.0)
    && (v142 == 0.0 || v140 == 0.0)
    && (v138 == 0.0 || *(double *)&obj == 0.0)
    && (v19 == 0.0 || v134 == 0.0)
    && (v23 == 0.0 || v21 == 0.0)
    && (v27 == 0.0 || v25 == 0.0)
    && (v29 == 0.0 || v28 == 0.0))
  {
    id v30 = *(id *)(v3 + 56);
  }
  else
  {
LABEL_22:
    id v30 = [*(id *)(v3 + 56) sortedArrayUsingFunction:__sliceSort context:0];
  }
  unsigned int v31 = [v30 count];
  unsigned int v169 = v31;
  if (v31)
  {
    LODWORD(v170) = 1001;
    HIDWORD(v170) = (16 * v31) | 4;
    [a2 appendBytes:&v170 length:8];
    [a2 appendBytes:&v169 length:4];
    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    id v32 = [v30 countByEnumeratingWithState:&v165 objects:v174 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v166;
      uint64_t v35 = 12;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v166 != v34) {
            objc_enumerationMutation(v30);
          }
          [*(id *)(*((void *)&v165 + 1) + 8 * i) rectValue];
          v38.f64[1] = v37;
          v40.f64[1] = v39;
          *(uint32x4_t *)v147 = vcvtq_u32_f32(vrndxq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v40), v38)));
          [a2 appendBytes:v147 length:16];
        }
        v35 += 16 * (void)v33;
        id v33 = [v30 countByEnumeratingWithState:&v165 objects:v174 count:16];
      }
      while (v33);
    }
    else
    {
      uint64_t v35 = 12;
    }
  }
  else
  {
    uint64_t v35 = 0;
  }
  unsigned int v164 = 0;
  unsigned int v41 = [*(id *)(v3 + 72) count];
  unsigned int v164 = v41;
  if (v41)
  {
    LODWORD(v170) = 1003;
    HIDWORD(v170) = (24 * v41) | 4;
    [a2 appendBytes:&v170 length:8];
    [a2 appendBytes:&v164 length:4];
    v35 += 12;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    v42 = *(void **)(v3 + 72);
    id v43 = [v42 countByEnumeratingWithState:&v160 objects:v173 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v161;
      do
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(void *)v161 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v160 + 1) + 8 * (void)j);
          memset(v147, 0, 48);
          [v47 getValue:v147];
          int32x4_t v48 = vcvtq_s32_f32(vrndxq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)v147), *(float64x2_t *)&v147[16])));
          int32x4_t v158 = vtrn1q_s32(v48, (int32x4_t)vextq_s8((int8x16_t)v48, (int8x16_t)v48, 0xCuLL));
          int32x2_t v49 = vcvt_s32_f32(vrndx_f32(vcvt_f32_f64(*(float64x2_t *)&v147[32])));
          int32x2_t v159 = v49;
          if (*(unsigned char *)(v3 + 400))
          {
            int32x4_t v50 = vmaxq_s32(v48, (int32x4_t)0);
            int32x4_t v158 = vtrn1q_s32(v50, (int32x4_t)vextq_s8((int8x16_t)v50, (int8x16_t)v50, 0xCuLL));
            int32x2_t v159 = vmax_s32(v49, 0);
          }
          [a2 appendBytes:&v158 length:24];
        }
        v35 += 24 * (void)v44;
        id v44 = [v42 countByEnumeratingWithState:&v160 objects:v173 count:16];
      }
      while (v44);
    }
  }
  unsigned int v51 = [*(id *)(v3 + 80) count];
  unsigned int v52 = v51;
  uint64_t v143 = v3;
  if (*(_WORD *)(v3 + 138) == 1003)
  {
    id v53 = objc_alloc_init((Class)NSMutableData);
    *(_DWORD *)&v147[24] = 0;
    *(_WORD *)&v147[28] = 0;
    *(void *)v147 = 1229868107;
    *(int32x4_t *)&v147[8] = vuzp1q_s32((int32x4_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 224)), (int32x4_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 240)));
    *(_WORD *)&v147[24] = *(_WORD *)(v3 + 256);
    if (v52 != 1) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel_writeResourcesToData_ object:v3 file:@"CSIGenerator.m" lineNumber:890 description:@"We need to have at 1 and only 1 reference file here"];
    }
    id v54 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v3 + 80), "firstObject"), "referenceKey"), "keyList");
    int v55 = CUIRenditionKeyTokenCount((uint64_t)v54);
    uint64_t v56 = (4 * v55 + 4);
    *(_DWORD *)&v147[26] = 4 * v55 + 4;
    [v53 appendBytes:v147 length:30];
    [v53 appendBytes:v54 length:v56];
    LODWORD(v170) = 1010;
    HIDWORD(v170) = [v53 length];
    [a2 appendBytes:&v170 length:8];
    [a2 appendData:v53];
    v35 += (uint64_t)[v53 length] + 8;
  }
  else if (v51)
  {
    id v57 = objc_alloc_init((Class)NSMutableData);
    v158.i64[0] = 0;
    v158.i32[0] = [*(id *)(v3 + 80) count];
    [v57 appendBytes:&v158 length:8];
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    v58 = *(void **)(v3 + 80);
    id v59 = [v58 countByEnumeratingWithState:&v154 objects:v172 count:16];
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v155;
      do
      {
        for (k = 0; k != v60; k = (char *)k + 1)
        {
          if (*(void *)v155 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v154 + 1) + 8 * (void)k);
          memset(v147, 0, 32);
          [v63 frame];
          v65.f64[1] = v64;
          v67.f64[1] = v66;
          float32x4_t v68 = vrndxq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v67), v65));
          *(void *)&long long v69 = vcvtq_s32_f32(v68).u64[0];
          *((void *)&v69 + 1) = vcvtq_u32_f32(v68).i64[1];
          *(_OWORD *)&v147[4] = v69;
          [v63 opacity];
          *(float *)&double v70 = v70;
          *(_DWORD *)&v147[24] = LODWORD(v70);
          *(_DWORD *)&v147[20] = [v63 blendMode];
          unsigned int v71 = [v63 fixedFrame];
          *(_DWORD *)v147 = *(_DWORD *)v147 & 0xFFFFFFFE | v71;
          id v72 = objc_msgSend(objc_msgSend(v63, "referenceKey"), "keyList");
          int v73 = CUIRenditionKeyTokenCount((uint64_t)v72);
          uint64_t v74 = (4 * v73 + 4);
          *(_DWORD *)&v147[28] = 4 * v73 + 4;
          [v57 appendBytes:v147 length:32];
          [v57 appendBytes:v72 length:v74];
        }
        id v60 = [v58 countByEnumeratingWithState:&v154 objects:v172 count:16];
      }
      while (v60);
    }
    LODWORD(v170) = 1012;
    HIDWORD(v170) = [v57 length];
    [a2 appendBytes:&v170 length:8];
    [a2 appendData:v57];
    v35 += (uint64_t)[v57 length] + 8;

    uint64_t v3 = v143;
  }
  uint64_t v170 = 0x8000003ECLL;
  [a2 appendBytes:&v170 length:8];
  uint64_t v153 = 0;
  [(id)v3 opacity];
  *(float *)&double v75 = v75;
  HIDWORD(v153) = LODWORD(v75);
  LODWORD(v153) = [(id)v3 blendMode];
  [a2 appendBytes:&v153 length:8];
  v135 = a2;
  if ([*(id *)(v3 + 32) length])
  {
    CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(*(CFStringRef *)(v3 + 32));
    v77 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x69B0AC61uLL);
    CFStringGetFileSystemRepresentation(*(CFStringRef *)(v3 + 32), v77, MaximumSizeOfFileSystemRepresentation);
    int v78 = strnlen(v77, MaximumSizeOfFileSystemRepresentation);
    *(void *)v147 = (v78 + 1);
    LODWORD(v170) = 1005;
    HIDWORD(v170) = v78 + 9;
    [a2 appendBytes:&v170 length:8];
    [a2 appendBytes:v147 length:8];
    [a2 appendBytes:v77 length:*(unsigned int *)v147];
    uint64_t v79 = v35 + *(unsigned int *)v147 + 32;
    free(v77);
  }
  else
  {
    uint64_t v79 = v35 + 16;
  }
  uint64_t v145 = v79;
  if ([*(id *)(v3 + 448) count])
  {
    id v80 = objc_msgSend(objc_msgSend(*(id *)(v3 + 448), "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    id obja = v80;
    id v81 = [v80 countByEnumeratingWithState:&v149 objects:v171 count:16];
    if (v81)
    {
      id v82 = v81;
      CFIndex v83 = 0;
      int v84 = 0;
      char v139 = 0;
      uint64_t v141 = *(void *)v150;
      __asm { FMOV            V0.2D, #1.0 }
      long long v133 = _Q0;
      do
      {
        v90 = 0;
        do
        {
          if (*(void *)v150 != v141) {
            objc_enumerationMutation(obja);
          }
          CFStringRef v91 = *(const __CFString **)(*((void *)&v149 + 1) + 8 * (void)v90);
          v92 = (__CFString *)objc_msgSend(*(id *)(v3 + 448), "objectForKey:", v91, (void)v133);
          CFIndex v93 = CFStringGetMaximumSizeOfFileSystemRepresentation(v91);
          v94 = (char *)malloc_type_malloc(v93, 0x6D829054uLL);
          CFStringGetFileSystemRepresentation(v91, v94, v93);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CFIndex v83 = CFStringGetMaximumSizeOfFileSystemRepresentation(v92);
            v95 = (char *)malloc_type_malloc(v83, 0x35A8EC37uLL);
            CFStringGetFileSystemRepresentation(v92, v95, v83);
            int v84 = 0;
LABEL_79:
            uint64_t v3 = v143;
            goto LABEL_80;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!strcmp((const char *)[(__CFString *)v92 objCType], "d"))
            {
              v95 = (char *)malloc_type_malloc(8uLL, 0x37A61F0FuLL);
              [(__CFString *)v92 doubleValue];
              *(void *)v95 = v101;
              int v84 = 2;
            }
            else
            {
              v95 = (char *)malloc_type_malloc(8uLL, 0xECC3607DuLL);
              *(void *)v95 = [(__CFString *)v92 longLongValue];
              int v84 = 1;
            }
            CFIndex v83 = 8;
            goto LABEL_79;
          }
          CFTypeID v96 = CFGetTypeID(v92);
          if (v96 != CGColorGetTypeID())
          {
            v95 = 0;
            goto LABEL_79;
          }
          v95 = (char *)malloc_type_malloc(0x20uLL, 0x48E90669uLL);
          size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)v92);
          Components = (uint64_t *)CGColorGetComponents((CGColorRef)v92);
          if (NumberOfComponents - 2 < 2)
          {
            int64x2_t v99 = *(int64x2_t *)Components;
            *((void *)&v100 + 1) = *((void *)&v133 + 1);
            *(void *)&long long v100 = Components[2];
          }
          else
          {
            if (NumberOfComponents != 4)
            {
              int64x2_t v99 = 0uLL;
              long long v100 = 0uLL;
              uint64_t v3 = v143;
              if (NumberOfComponents == 1)
              {
                int64x2_t v99 = vdupq_lane_s64(*Components, 0);
                *((void *)&v100 + 1) = *((void *)&v133 + 1);
                *(void *)&long long v100 = *Components;
              }
              goto LABEL_92;
            }
            int64x2_t v99 = *(int64x2_t *)Components;
            long long v100 = *((_OWORD *)Components + 1);
          }
          uint64_t v3 = v143;
LABEL_92:
          *(int64x2_t *)v95 = v99;
          *((_OWORD *)v95 + 1) = v100;
          char v139 = 1;
          int v84 = 3;
          CFIndex v83 = 32;
LABEL_80:
          if (v93 < 1 || v83 < 1)
          {
            free(v94);
            if (v95) {
              free(v95);
            }
          }
          else
          {
            *(_DWORD *)&v147[8] = v83;
            *(_DWORD *)&v147[12] = v84;
            *(_DWORD *)&v147[16] = v139 & 0xF;
            *(_DWORD *)v147 = 0;
            *(_DWORD *)&v147[4] = v93;
            LODWORD(v170) = 1016;
            HIDWORD(v170) = v93 + v83 + 20;
            [v135 appendBytes:&v170 length:8];
            [v135 appendBytes:v147 length:20];
            [v135 appendBytes:v94 length:v93];
            [v135 appendBytes:v95 length:v83];
            v145 += *(unsigned int *)&v147[4] + (unint64_t)*(unsigned int *)&v147[8] + 28;
            free(v95);
            free(v94);
            CFIndex v83 = 0;
          }
          v90 = (char *)v90 + 1;
        }
        while (v82 != v90);
        id v103 = [obja countByEnumeratingWithState:&v149 objects:v171 count:16];
        id v82 = v103;
      }
      while (v103);
    }
  }
  double v105 = *(double *)(v3 + 40);
  double v104 = *(double *)(v3 + 48);
  if (v105 == CGSizeZero.width && v104 == CGSizeZero.height)
  {
    uint64_t v106 = v145;
  }
  else
  {
    float v107 = v105;
    *(_DWORD *)v147 = 0;
    float v108 = v104;
    *(float *)&v147[4] = v107;
    *(float *)&v147[8] = v108;
    uint64_t v170 = 0xC000003F7;
    [v135 appendBytes:&v170 length:8];
    [v135 appendBytes:v147 length:12];
    uint64_t v106 = v145 + 20;
  }
  int v109 = *(_DWORD *)(v3 + 196);
  if (!v109)
  {
    int v109 = 1;
    *(_DWORD *)(v3 + 196) = 1;
  }
  *(_DWORD *)v147 = v109;
  uint64_t v170 = 0x4000003EELL;
  [v135 appendBytes:&v170 length:8];
  [v135 appendBytes:v147 length:4];
  float32x4_t v110 = *(float32x4_t *)(v3 + 464);
  float32x4_t v111 = *(float32x4_t *)(v3 + 480);
  float32x4_t v112 = *(float32x4_t *)(v3 + 496);
  float32x4_t v113 = *(float32x4_t *)(v3 + 512);
  if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqzq_f32(v111), (int8x16_t)vceqzq_f32(v110)), vandq_s8((int8x16_t)vceqzq_f32(v112), (int8x16_t)vceqzq_f32(v113)))) & 0x80000000) != 0)
  {
    uint64_t v114 = v106 + 12;
  }
  else
  {
    *(_DWORD *)v147 = 0;
    *(float32x4_t *)&v147[4] = v110;
    *(float32x4_t *)&v147[20] = v111;
    *(float32x4_t *)&v147[36] = v112;
    float32x4_t v148 = v113;
    uint64_t v170 = 0x44000003F9;
    [v135 appendBytes:&v170 length:8];
    [v135 appendBytes:v147 length:68];
    uint64_t v114 = v106 + 88;
  }
  if (*(void *)(v3 + 200))
  {
    *(_DWORD *)v147 = *(void *)(v3 + 200);
    uint64_t v170 = 0x4000003EFLL;
    v115 = v135;
    [v135 appendBytes:&v170 length:8];
    [v135 appendBytes:v147 length:4];
    v114 += 12;
  }
  else
  {
    v115 = v135;
  }
  if (!CGRectIsEmpty(*(CGRect *)(v3 + 280)))
  {
    *(void *)v147 = 1011;
    *(int32x4_t *)&v147[8] = vuzp1q_s32((int32x4_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 264)), (int32x4_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 280)));
    *(int32x2_t *)&v147[24] = vmovn_s64((int64x2_t)vcvtq_u64_f64(*(float64x2_t *)(v3 + 296)));
    uint64_t v170 = 0x20000003F3;
    [v115 appendBytes:&v170 length:8];
    [v115 appendBytes:v147 length:32];
    v114 += 40;
  }
  int v116 = *(unsigned __int16 *)(v3 + 138);
  if (v116 == 1005)
  {
    v158.i32[0] = 0;
    id v117 = objc_alloc_init((Class)NSMutableData);
    *(void *)v147 = [*(id *)(v3 + 312) count];
    [v117 appendBytes:v147 length:8];
    if (*(_DWORD *)v147)
    {
      unint64_t v118 = 0;
      do
      {
        CFIndex v119 = CFStringGetMaximumSizeOfFileSystemRepresentation((CFStringRef)[*(id *)(v3 + 312) objectAtIndex:v118]);
        v120 = (char *)malloc_type_malloc(v119, 0xD91C2938uLL);
        CFStringGetFileSystemRepresentation((CFStringRef)[*(id *)(v3 + 312) objectAtIndex:v118], v120, v119);
        v158.i32[0] = strnlen(v120, v119);
        [v117 appendBytes:&v158 length:4];
        [v117 appendBytes:v120 length:v158.u32[0]];
        free(v120);
        ++v118;
      }
      while (v118 < *(unsigned int *)v147);
    }
    LODWORD(v170) = 1013;
    HIDWORD(v170) = [v117 length];
    [v115 appendBytes:&v170 length:8];
    [v115 appendData:v117];
    v114 += (uint64_t)[v117 length] + 8;

    int v116 = *(unsigned __int16 *)(v3 + 138);
  }
  if (v116 == 1007)
  {
    id v121 = objc_alloc_init((Class)NSMutableData);
    unsigned int v122 = [(id)v3 textureInterpretation];
    int v123 = *(unsigned __int8 *)(v3 + 368);
    *(_DWORD *)&v147[4] = v122;
    *(_DWORD *)&v147[8] = v123;
    *(_DWORD *)v147 = 0;
    [v121 appendBytes:v147 length:12];
    LODWORD(v170) = 1014;
    HIDWORD(v170) = [v121 length];
    [v115 appendBytes:&v170 length:8];
    [v115 appendData:v121];
    v114 += (uint64_t)[v121 length] + 8;
  }
  if ([*(id *)(v3 + 568) count] || *(_DWORD *)(v3 + 576))
  {
    id v124 = objc_alloc_init((Class)NSMutableData);
    id v125 = [*(id *)(v3 + 568) count];
    uint64_t v126 = (uint64_t)v125;
    int v127 = *(_DWORD *)(v3 + 576);
    *(_DWORD *)v147 = 3;
    *(_DWORD *)&v147[4] = v127;
    *(void *)&v147[8] = *(void *)(v3 + 580);
    *(_DWORD *)&v147[16] = *(_DWORD *)(v3 + 588);
    int8x16_t v128 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(v3 + 592)), *(float64x2_t *)(v3 + 608));
    *(int8x16_t *)&v147[20] = vextq_s8(v128, v128, 4uLL);
    if (*(unsigned char *)(v3 + 624)) {
      *(_DWORD *)v147 = 7;
    }
    *(_DWORD *)&v147[36] = v125;
    [v124 appendBytes:v147 length:40];
    if (v126 >= 1)
    {
      for (uint64_t m = 0; m != v126; ++m)
      {
        v158.i64[0] = m;
        v158.i32[1] = objc_msgSend(objc_msgSend(*(id *)(v3 + 568), "objectAtIndex:", m), "intValue");
        [v124 appendBytes:&v158 length:8];
      }
    }
    LODWORD(v170) = 1018;
    HIDWORD(v170) = [v124 length];
    [v115 appendBytes:&v170 length:8];
    [v115 appendData:v124];
    id v130 = [v124 length];

    id v131 = objc_alloc_init((Class)NSMutableData);
    v158.i32[1] = *(void *)(v3 + 104);
    v158.i32[0] = 1;
    v158.i32[2] = *(unsigned __int8 *)(v3 + 112) | (2 * *(unsigned __int8 *)(v3 + 113));
    [v131 appendBytes:&v158 length:12];
    v146[0] = 1019;
    v146[1] = [v131 length];
    [v115 appendBytes:v146 length:8];
    [v115 appendData:v131];
    v114 += (uint64_t)[v131 length] + (void)v130 + 16;
  }
  return v114;
}

- (uint64_t)writeBitmap:(void *)a3 toData:(uint64_t)a4 compress:
{
  uint64_t v4 = a1;
  if (a1)
  {
    int v27 = 0;
    int v24 = 0;
    uint64_t v21 = 0;
    id v7 = [a2 compressedData:a4 usedEncoding:(char *)&v21 + 4 andRowChunkSize:&v21];
    double v8 = (char *)[v7 count];
    int v26 = 1128614989;
    int v28 = HIDWORD(v21);
    unsigned int v29 = 0;
    uint64_t v22 = 1128416075;
    int v23 = 0;
    unsigned int v25 = 0;
    if ([(id)v4 allowsMultiPassEncoding]
      && (![a2 sourceAlphaInfo]
       || [a2 sourceAlphaInfo] == 6
       || [a2 sourceAlphaInfo] == 5))
    {
      int v9 = 2;
    }
    else
    {
      int v9 = 0;
    }
    if ((unint64_t)v8 > 1)
    {
      int v27 = v9 | 1;
      unsigned int v29 = v8;
      uint64_t v4 = 16;
      [a3 appendBytes:&v26 length:16];
      double v13 = 0;
      int v14 = v21;
      int v15 = v21;
      do
      {
        id v16 = [v7 objectAtIndex:v13];
        unsigned int v17 = [v16 length];
        int v24 = v15;
        unsigned int v25 = v17;
        [a3 appendBytes:&v22 length:20];
        [a3 appendData:v16];
        uint64_t v18 = v25;
        int v19 = v14 + v15;
        if (v14 + v15 > (int)[a2 height]) {
          int v15 = [a2 height] - v14;
        }
        v4 += v18 + 20;
        ++v13;
        int v14 = v19;
      }
      while (v8 != v13);
    }
    else
    {
      int v27 = v9;
      id v10 = [v7 lastObject];
      if (v10)
      {
        id v11 = v10;
        unsigned int v12 = [v10 length];
        v29 += v12;
        [a3 appendBytes:&v26 length:16];
        [a3 appendData:v11];
        return v29 + 16;
      }
      else
      {
        return 0;
      }
    }
  }
  return v4;
}

- (id)_addNodes:(uint64_t)a3 toNodeList:
{
  if (result)
  {
    id v5 = result;
    result = [a2 count];
    if (result)
    {
      id v6 = [a2 objectAtIndex:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unsigned int v7 = [v6 isColorStop];
        unsigned int v8 = [v6 isOpacityStop];
        if (v8 & 1) != 0 || (v7) {
          goto LABEL_7;
        }
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel__addNodes_toNodeList_, v5, @"CSIGenerator.m", 1439, @"Unsupported gradient nodes: %@", a2 object file lineNumber description];
      }
      unsigned int v7 = 0;
      unsigned int v8 = 0;
LABEL_7:
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      result = [a2 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (!result) {
        return result;
      }
      id v9 = result;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v36;
      do
      {
        unsigned int v12 = 0;
        uint64_t v34 = v10;
        double v13 = (void *)(a3 + 32 + 72 * v10);
        do
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(a2);
          }
          int v14 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v12);
          if (v7)
          {
            [*(id *)(*((void *)&v35 + 1) + 8 * (void)v12) colorLocation];
            float v16 = v15;
            [v14 gradientColor];
            uint64_t v18 = v17;
            uint64_t v20 = v19;
            uint64_t v22 = v21;
            uint64_t v24 = v23;
            if (objc_opt_respondsToSelector())
            {
              [v14 leadOutColor];
              int v29 = 1129270340;
              goto LABEL_22;
            }
            int v29 = 1129270354;
          }
          else if (v8)
          {
            [*(id *)(*((void *)&v35 + 1) + 8 * (void)v12) opacityLocation];
            float v16 = v30;
            [v14 opacity];
            uint64_t v24 = v31;
            uint64_t v18 = 0;
            if (objc_opt_respondsToSelector())
            {
              [v14 leadOutOpacity];
              uint64_t v28 = v32;
              int v29 = 1330660164;
              uint64_t v20 = 0;
              uint64_t v22 = 0;
              uint64_t v25 = 0;
              uint64_t v26 = 0;
              uint64_t v27 = 0;
              goto LABEL_22;
            }
            int v29 = 1330660180;
            uint64_t v20 = 0;
            uint64_t v22 = 0;
          }
          else
          {
            [*(id *)(*((void *)&v35 + 1) + 8 * (void)v12) floatValue];
            float v16 = v33;
            uint64_t v18 = 0;
            uint64_t v20 = 0;
            int v29 = 1296647248;
            uint64_t v22 = 0;
            uint64_t v24 = 0;
          }
          uint64_t v25 = 0;
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          uint64_t v28 = 0;
LABEL_22:
          *((_DWORD *)v13 - 8) = v29;
          *((float *)v13 - 7) = v16;
          *(v13 - 3) = v18;
          *(v13 - 2) = v20;
          *(v13 - 1) = v22;
          *double v13 = v24;
          v13[1] = v25;
          v13[2] = v26;
          unsigned int v12 = (char *)v12 + 1;
          v13[3] = v27;
          v13[4] = v28;
          v13 += 9;
        }
        while (v9 != v12);
        result = [a2 countByEnumeratingWithState:&v35 objects:v39 count:16];
        id v9 = result;
        uint64_t v10 = (uint64_t)v12 + v34;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)writeGradientToData:(id *)a1
{
  if (!a1) {
    return 0;
  }
  id v3 = [a1[18] evaluator];
  id v18 = [v3 colorStops];
  id v19 = [v3 colorMidpointLocations];
  id v20 = [v3 opacityStops];
  id v21 = [v3 opacityMidpointLocations];
  unsigned int v4 = [v18 count];
  unsigned int v5 = [v19 count];
  unsigned int v6 = [v20 count];
  unsigned int v7 = [v21 count];
  uint64_t v8 = 72 * (v5 + v4 + v6 + v7);
  uint64_t v9 = v8 + 80;
  uint64_t v10 = malloc_type_calloc(v8 + 80, 1uLL, 0x90559558uLL);
  *uint64_t v10 = 1196572996;
  v10[4] = 2;
  v10[2] = v8;
  v10[3] = [a1[18] gradientStyle];
  [a1[18] drawingAngle];
  *(float *)&double v11 = v11;
  v10[14] = LODWORD(v11);
  [v3 smoothingCoefficient];
  *(float *)&double v12 = v12;
  v10[15] = LODWORD(v12);
  v10[1] = [v3 isDithered];
  [v3 fillColor];
  *((void *)v10 + 3) = v13;
  *((void *)v10 + 4) = v14;
  *((void *)v10 + 5) = v15;
  *((void *)v10 + 6) = v16;
  v10[5] = [v3 blendMode];
  v10[16] = v4;
  v10[17] = v5;
  v10[18] = v6;
  v10[19] = v7;
  -[CSIGenerator _addNodes:toNodeList:](a1, v18, (uint64_t)(v10 + 20));
  -[CSIGenerator _addNodes:toNodeList:](a1, v19, (uint64_t)&v10[18 * v4 + 20]);
  -[CSIGenerator _addNodes:toNodeList:](a1, v20, (uint64_t)&v10[18 * v5 + 20 + 18 * v4]);
  -[CSIGenerator _addNodes:toNodeList:](a1, v21, (uint64_t)&v10[18 * v5 + 20 + 18 * v4 + 18 * v6]);
  [a2 appendBytes:v10 length:v8 + 80];
  free(v10);
  return v9;
}

- (uint64_t)writeColorToData:(id *)a1
{
  if (!a1) {
    return 0;
  }
  unsigned int v4 = objc_msgSend(objc_msgSend(a1, "colorComponents"), "count");
  uint64_t v5 = 8 * v4;
  uint64_t v6 = v5 + 16;
  unsigned int v7 = malloc_type_calloc(v5 + 16, 1uLL, 0x9BA78920uLL);
  int v8 = *((unsigned __int8 *)v7 + 8);
  *(void *)unsigned int v7 = 0x1434F4C52;
  v7[2] = v8;
  _OWORD v7[3] = v4;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; *(void *)&v7[2 * i++ + 4] = v10)
      objc_msgSend(objc_msgSend(objc_msgSend(a1, "colorComponents"), "objectAtIndex:", i), "doubleValue");
  }
  *((unsigned char *)v7 + 8) = [a1 colorSpaceID];
  if ([a1[48] length]) {
    v7[2] = v7[2] & 0xFFFFF8FF | 0x100;
  }
  [a2 appendBytes:v7 length:v5 + 16];
  free(v7);
  if ([a1[48] length])
  {
    double v11 = (const char *)objc_msgSend(a1[48], "UTF8String", 0x1434F4C52);
    unsigned int v14 = strlen(v11);
    [a2 appendBytes:&v13 length:12];
    [a2 appendBytes:v11 length:v14];
    return v5 + v14 + 28;
  }
  return v6;
}

- (uint64_t)writeTextStyleToData:(CFStringRef *)a1
{
  if (!a1) {
    return 0;
  }
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a1[51]);
  uint64_t v5 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x69994CC9uLL);
  CFStringGetFileSystemRepresentation(a1[51], v5, MaximumSizeOfFileSystemRepresentation);
  uint64_t v6 = strnlen(v5, MaximumSizeOfFileSystemRepresentation) + 1;
  uint64_t v7 = v6 + 32;
  int v8 = malloc_type_calloc(v6 + 32, 1uLL, 0xB5E70040uLL);
  *(void *)int v8 = 0x15354594CLL;
  *((_DWORD *)v8 + 2) = [(CFStringRef *)a1 scalingStyle];
  [(CFStringRef *)a1 fontSize];
  *(float *)&double v9 = v9;
  *((_DWORD *)v8 + 3) = LODWORD(v9);
  [(CFStringRef *)a1 maxPointSize];
  *(float *)&double v10 = v10;
  *((_DWORD *)v8 + 4) = LODWORD(v10);
  [(CFStringRef *)a1 minPointSize];
  *(float *)&double v11 = v11;
  *((_DWORD *)v8 + 5) = LODWORD(v11);
  *((_DWORD *)v8 + 6) = [(CFStringRef *)a1 alignment];
  *((_DWORD *)v8 + 7) = v6;
  strcpy((char *)v8 + 32, v5);
  [a2 appendBytes:v8 length:v6 + 32];
  free(v5);
  free(v8);
  return v7;
}

- (size_t)writeMultisizeImageSetToData:(void *)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = objc_msgSend(objc_msgSend(objc_msgSend(a1, "sizesByIndex"), "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_2);
  unsigned int v5 = [v4 count];
  size_t v6 = 12 * v5 + 12;
  uint64_t v7 = malloc_type_calloc(v6, 1uLL, 0x3C246F41uLL);
  int v8 = v7;
  *(void *)uint64_t v7 = 0x14D534953;
  v7[2] = v5;
  if (v5)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v5;
    double v11 = v7 + 5;
    do
    {
      id v12 = [v4 objectAtIndex:v9];
      objc_msgSend(objc_msgSend(objc_msgSend(a1, "sizesByIndex"), "objectForKey:", v12), "sizeValue");
      *(v11 - 2) = v13;
      *(v11 - 1) = v14;
      *double v11 = [v12 integerValue];
      v11 += 3;
      ++v9;
    }
    while (v10 != v9);
  }
  [a2 appendBytes:v8 length:v6];
  free(v8);
  return v6;
}

id __45__CSIGenerator_writeMultisizeImageSetToData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (uint64_t)writeRawDataToData:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v12 = 1380013892;
  int v3 = *(_DWORD *)(result + 192);
  BOOL v4 = v3 == 1398163232 || v3 == 1145132097;
  if (!v4
    || ((int v5 = *(unsigned __int16 *)(result + 138), (v5 - 1000) <= 0x11)
      ? (BOOL v6 = ((1 << (v5 + 24)) & 0x24001) == 0)
      : (BOOL v6 = 1),
        (v6 || *(void *)(result + 328) != 2) && (v3 != 1398163232 || v5 != 9)))
  {
    uint64_t v7 = (id *)(result + 152);
LABEL_19:
    int v11 = 0;
    id v9 = *v7;
    goto LABEL_20;
  }
  uint64_t v7 = (id *)(result + 152);
  CFDataRef v8 = CUICompressedDataWithLZFSE(*(const __CFData **)(result + 152));
  id v9 = v8;
  if (!v8 || (id v10 = -[__CFData length](v8, "length", v12), v10 >= [*v7 length]))
  {

    goto LABEL_19;
  }
  int v11 = 1;
LABEL_20:
  HIDWORD(v12) = v11;
  unsigned int v13 = objc_msgSend(v9, "length", v12);
  [a2 appendBytes:&v12 length:12];
  [a2 appendData:v9];
  if (v11) {

  }
  return v13 + 12;
}

- (uint64_t)writeExternalLinkToData:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v20 = 1008;
  uint64_t v21 = 1163414603;
  unsigned int v22 = [*(id *)(a1 + 216) count];
  [a2 appendBytes:&v21 length:12];
  if (![*(id *)(a1 + 208) length]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel_writeExternalLinkToData_ object:a1 file:@"CSIGenerator.m" lineNumber:1697 description:@"We must have an assetpack identifier or none of this will work"];
  }
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(*(CFStringRef *)(a1 + 208));
  int v5 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x2E9439CBuLL);
  CFStringGetFileSystemRepresentation(*(CFStringRef *)(a1 + 208), v5, MaximumSizeOfFileSystemRepresentation);
  HIDWORD(v20) = strnlen(v5, MaximumSizeOfFileSystemRepresentation) + 1;
  [a2 appendBytes:&v20 length:8];
  [a2 appendBytes:v5 length:HIDWORD(v20)];
  uint64_t v6 = HIDWORD(v20) + 20;
  free(v5);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = *(void **)(a1 + 216);
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        CFStringRef v12 = *(const __CFString **)(*((void *)&v16 + 1) + 8 * i);
        CFIndex v13 = CFStringGetMaximumSizeOfFileSystemRepresentation(v12);
        double v14 = (char *)malloc_type_malloc(v13, 0xD566AAFuLL);
        CFStringGetFileSystemRepresentation(v12, v14, v13);
        LODWORD(v20) = 1008;
        HIDWORD(v20) = strnlen(v14, v13) + 1;
        [a2 appendBytes:&v20 length:8];
        [a2 appendBytes:v14 length:HIDWORD(v20)];
        v6 += HIDWORD(v20) + 8;
        free(v14);
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v9);
  }
  return v6;
}

- (uint64_t)writeTextureToData:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v19 = 1415074898;
  int v20 = *(void *)(a1 + 344);
  uint64_t v21 = 0x100000001;
  if (*(unsigned char *)(a1 + 336)) {
    __int16 v4 = 5;
  }
  else {
    __int16 v4 = 1;
  }
  __int16 v22 = v4;
  unsigned __int16 v23 = (unsigned __int16)[*(id *)(a1 + 360) count];
  uint64_t v5 = 24;
  [a2 appendBytes:&v19 length:24];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = *(void **)(a1 + 360);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    uint64_t v5 = 24;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) keyList];
        uint64_t v12 = 4 * CUIRenditionKeyTokenCount((uint64_t)v11) + 4;
        uint64_t v14 = v12;
        [a2 appendBytes:&v14 length:8];
        [a2 appendBytes:v11 length:v12];
        v5 += v12 + 8;
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v8);
  }
  return v5;
}

- (uint64_t)writeRecognitionObjectToData:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    __int16 v4 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[*(id *)(result + 152) length] + 4);
    [(NSMutableData *)v4 appendBytes:v3 + 456 length:4];
    [(NSMutableData *)v4 appendData:*(void *)(v3 + 152)];

    *(void *)(v3 + 152) = [(NSMutableData *)v4 copy];
    return -[CSIGenerator writeRawDataToData:](v3, a2);
  }
  return result;
}

- (id)CSIRepresentationWithCompression:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSMutableData data];
  long long v45 = 0u;
  memset(v44, 0, sizeof(v44));
  -[CSIGenerator formatCSIHeader:]((unsigned __int8 *)self, (uint64_t)v44);
  if (self)
  {
    uint64_t v6 = 4 * (HIDWORD(v45) + 1);
    [v5 appendBytes:v44 length:176];
    [v5 increaseLengthBy:v6];
  }
  self->_rowbytes = 0;
  int layout = self->_layout;
  switch(self->_layout)
  {
    case 0x3E8:
    case 0x3EA:
    case 0x3FA:
      goto LABEL_9;
    case 0x3E9:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      int v9 = -[CSIGenerator writeExternalLinkToData:]((uint64_t)self, v5);
      goto LABEL_18;
    case 0x3EB:
    case 0x3ED:
    case 0x3EE:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      *((void *)[v5 mutableBytes] + 22) = 0;
      goto LABEL_22;
    case 0x3EC:
    case 0x3F0:
    case 0x3F5:
    case 0x3F9:
      goto LABEL_8;
    case 0x3EF:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      int v9 = -[CSIGenerator writeTextureToData:]((uint64_t)self, v5);
      goto LABEL_18;
    case 0x3F1:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      int v9 = -[CSIGenerator writeColorToData:]((id *)&self->super.isa, v5);
      goto LABEL_18;
    case 0x3F2:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      int v9 = -[CSIGenerator writeMultisizeImageSetToData:](self, v5);
      goto LABEL_18;
    case 0x3F3:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      id v10 = [[_CUIThemeModelAssetRendition alloc] initForArchiving:self->_modelAsset withMeshRenditionKeys:self->_meshReferences];
      goto LABEL_20;
    case 0x3F4:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      id v10 = [[_CUIThemeModelMeshRendition alloc] initForArchiving:self->_modelMesh withSubmeshRenditionKeys:self->_submeshReferences];
      goto LABEL_20;
    case 0x3F6:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      int v9 = -[CSIGenerator writeRecognitionObjectToData:]((uint64_t)self, v5);
      goto LABEL_18;
    case 0x3F7:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      int v9 = -[CSIGenerator writeTextStyleToData:]((CFStringRef *)self, v5);
      goto LABEL_18;
    case 0x3F8:
      int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
      id v10 = [[_CUIThemeModelSubmeshRendition alloc] initForArchiving:self->_modelSubmesh];
LABEL_20:
      CFIndex v13 = v10;
      unsigned int v14 = [v10 writeToData:v5];

      long long v15 = [v5 mutableBytes];
      v15[44] = 0;
      v15[45] = v14;
      goto LABEL_22;
    default:
      if (layout == 7)
      {
        int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
        objc_msgSend(v5, "appendData:", -[CUIShapeEffectPreset CUIEffectDataRepresentation](self->_effectPreset, "CUIEffectDataRepresentation"));
        long long v16 = [v5 mutableBytes];
        v16[44] = 0;
        v16[45] = [v5 length];
        goto LABEL_22;
      }
      if (layout == 6)
      {
        int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
        int v9 = -[CSIGenerator writeGradientToData:]((id *)&self->super.isa, v5);
LABEL_18:
        int v11 = v9;
        uint64_t v12 = [v5 mutableBytes];
        v12[44] = 0;
        v12[45] = v11;
LABEL_22:
        *((_DWORD *)[v5 mutableBytes] + 42) = v8;
        return v5;
      }
LABEL_8:
      if (self->_rawData)
      {
LABEL_9:
        int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
        int v9 = -[CSIGenerator writeRawDataToData:]((uint64_t)self, v5);
        goto LABEL_18;
      }
      long long v18 = (char *)[(NSMutableArray *)self->_bitmaps count];
      v36[1] = v36;
      uint64_t v19 = v18 + 1;
      size_t v20 = 8 * (void)(v18 + 1);
      uint64_t v21 = (int *)((char *)v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
      id v38 = +[NSMutableData data];
      bzero(v21, v20);
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      bitmaps = self->_bitmaps;
      id v22 = [(NSMutableArray *)bitmaps countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (!v22)
      {
LABEL_32:
        self->_rowbytes = (unint64_t)objc_msgSend(-[NSMutableArray firstObject](self->_bitmaps, "firstObject", v36[0]), "rowbytes");
        int v8 = -[CSIGenerator writeResourcesToData:]((uint64_t)self, v5);
        [v5 appendData:v38];
        int v29 = [v5 mutableBytes];
        unsigned int v30 = objc_msgSend(-[NSMutableArray firstObject](self->_bitmaps, "firstObject"), "pixelFormat");
        signed __int16 v31 = (unsigned __int16)objc_msgSend(-[NSMutableArray firstObject](self->_bitmaps, "firstObject"), "colorSpaceID");
        if ([(CSIGenerator *)self colorSpaceID] != v31
          || v30 != [(CSIGenerator *)self pixelFormat])
        {
          unsigned int v32 = v29[7] & 0xFFFFFFF0 | v31 & 0xF;
          v29[6] = v30;
          v29[7] = v32;
        }
        if (v19)
        {
          int v33 = 0;
          uint64_t v34 = v29 + 44;
          do
          {
            *v34++ = v33;
            int v35 = *v21;
            v21 += 2;
            v33 += v35;
            --v19;
          }
          while (v19);
        }
        goto LABEL_22;
      }
      id v23 = v22;
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v40;
LABEL_26:
      uint64_t v26 = 0;
      v36[0] = v24;
      uint64_t v27 = &v21[2 * (void)v24];
      while (1)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(bitmaps);
        }
        uint64_t v28 = -[CSIGenerator writeBitmap:toData:compress:]((uint64_t)self, *(void **)(*((void *)&v39 + 1) + 8 * (void)v26), v38, v3);
        if (!v28) {
          return 0;
        }
        *(void *)&v27[2 * (void)v26] = v28;
        uint64_t v26 = (char *)v26 + 1;
        if (v23 == v26)
        {
          id v23 = [(NSMutableArray *)bitmaps countByEnumeratingWithState:&v39 objects:v43 count:16];
          uint64_t v24 = (char *)v26 + v36[0];
          if (!v23) {
            goto LABEL_32;
          }
          goto LABEL_26;
        }
      }
  }
}

- (BOOL)vectorContainsMulticolorLayers
{
  return self->_vectorContainsMulticolorLayers;
}

- (void)setVectorContainsMulticolorLayers:(BOOL)a3
{
  self->_vectorContainsMulticolorLayers = a3;
}

- (BOOL)vectorContainsHierarchicalLayers
{
  return self->_vectorContainsHierarchicalLayers;
}

- (void)setVectorContainsHierarchicalLayers:(BOOL)a3
{
  self->_vectorContainsHierarchicalLayers = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)utiType
{
  return self->_utiType;
}

- (void)setUtiType:(id)a3
{
}

- (CGSize)physicalSizeInMeters
{
  double width = self->_physicalSizeInMeters.width;
  double height = self->_physicalSizeInMeters.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPhysicalSizeInMeters:(CGSize)a3
{
  self->_physicalSizeInMeters = a3;
}

- (BOOL)isVectorBased
{
  return self->_isVectorBased;
}

- (void)setIsVectorBased:(BOOL)a3
{
  self->_isVectorBased = a3;
}

- (int64_t)templateRenderingMode
{
  return self->_templateRenderingMode;
}

- (void)setTemplateRenderingMode:(int64_t)a3
{
  self->_templateRenderingMode = a3;
}

- (BOOL)isExcludedFromContrastFilter
{
  return self->_isExcludedFromFilter;
}

- (void)setExcludedFromContrastFilter:(BOOL)a3
{
  self->_isExcludedFromFilter = a3;
}

- (signed)colorSpaceID
{
  return self->_colorSpaceID;
}

- (void)setColorSpaceID:(signed __int16)a3
{
  self->_colorSpaceID = a3;
}

- (CUIPSDGradient)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
}

- (unsigned)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(unsigned int)a3
{
  self->_scaleFactor = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (NSArray)layerReferences
{
  return &self->_layerReferences->super;
}

- (CUIShapeEffectPreset)effectPreset
{
  return self->_effectPreset;
}

- (void)setEffectPreset:(id)a3
{
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacitCGFloat y = a3;
}

- (NSDate)modtime
{
  return self->_modtime;
}

- (void)setModtime:(id)a3
{
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(int)a3
{
  self->_exifOrientation = a3;
}

- (CGSize)originalUncroppedSize
{
  double width = self->_originalUncroppedSize.width;
  double height = self->_originalUncroppedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOriginalUncroppedSize:(CGSize)a3
{
  self->_originalUncroppedSize = a3;
}

- (CGRect)alphaCroppedFrame
{
  double x = self->_alphaCroppedFrame.origin.x;
  double y = self->_alphaCroppedFrame.origin.y;
  double width = self->_alphaCroppedFrame.size.width;
  double height = self->_alphaCroppedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAlphaCroppedFrame:(CGRect)a3
{
  self->_alphaCroppedFrame = a3;
}

- (BOOL)allowsMultiPassEncoding
{
  return self->_allowsMultiPassEncoding;
}

- (void)setAllowsMultiPassEncoding:(BOOL)a3
{
  self->_allowsMultiPassEncoding = a3;
}

- (BOOL)allowsOptimalRowbytesPacking
{
  return self->_allowsOptimalRowbytesPacking;
}

- (void)setAllowsOptimalRowbytesPacking:(BOOL)a3
{
  self->_allowsOptimalRowbytesPacking = a3;
}

- (BOOL)allowsPaletteImageCompression
{
  return self->_allowsPaletteImageCompression;
}

- (void)setAllowsPaletteImageCompression:(BOOL)a3
{
  self->_allowsPaletteImageCompression = a3;
}

- (BOOL)allowsHevcCompression
{
  return self->_allowsHevcCompression;
}

- (void)setAllowsHevcCompression:(BOOL)a3
{
  self->_allowsHevcCompression = a3;
}

- (BOOL)allowsDeepmapImageCompression
{
  return self->_allowsDeepmapImageCompression;
}

- (void)setAllowsDeepmapImageCompression:(BOOL)a3
{
  self->_allowsDeepmapImageCompression = a3;
}

- (BOOL)allowsDeepmap2ImageCompression
{
  return self->_allowsDeepmap2ImageCompression;
}

- (void)setAllowsDeepmap2ImageCompression:(BOOL)a3
{
  self->_allowsDeepmap2ImageCompression = a3;
}

- (BOOL)optOutOfThinning
{
  return self->_optOutOfThinning;
}

- (void)setOptOutOfThinning:(BOOL)a3
{
  self->_optOutOfThinning = a3;
}

- (BOOL)preserveForArchiveOnly
{
  return self->_preserveForArchiveOnly;
}

- (void)setPreserveForArchiveOnly:(BOOL)a3
{
  self->_preserveForArchiveOnldouble y = a3;
}

- (BOOL)preservedVectorRepresentation
{
  return self->_preservedVectorRepresentation;
}

- (void)setPreservedVectorRepresentation:(BOOL)a3
{
  self->_preservedVectorRepresentation = a3;
}

- (BOOL)isFlippable
{
  return self->_isFlippable;
}

- (void)setIsFlippable:(BOOL)a3
{
  self->_isFlippable = a3;
}

- (BOOL)isTintable
{
  return self->_isTintable;
}

- (void)setIsTintable:(BOOL)a3
{
  self->_isTintable = a3;
}

- (BOOL)cubemap
{
  return self->_isCubeMap;
}

- (void)setCubemap:(BOOL)a3
{
  self->_isCubeMap = a3;
}

- (int64_t)textureFormat
{
  return self->_textureFormat;
}

- (void)setTextureFormat:(int64_t)a3
{
  self->_textureFormat = a3;
}

- (int64_t)textureInterpretation
{
  return self->_textureInterpretation;
}

- (void)setTextureInterpretation:(int64_t)a3
{
  self->_textureInterpretation = a3;
}

- (NSArray)mipReferences
{
  return &self->_mipReferences->super;
}

- (BOOL)textureOpaque
{
  return self->_textureOpaque;
}

- (void)setTextureOpaque:(BOOL)a3
{
  self->_textureOpaque = a3;
}

- (NSArray)colorComponents
{
  return self->_colorComponents;
}

- (void)setColorComponents:(id)a3
{
}

- (NSDictionary)sizesByIndex
{
  return self->_sizesByIndex;
}

- (void)setSizesByIndex:(id)a3
{
}

- (BOOL)clampMetrics
{
  return self->_clampMetrics;
}

- (void)setClampMetrics:(BOOL)a3
{
  self->_clampMetrics = a3;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)maxPointSize
{
  return self->_maxPointSize;
}

- (void)setMaxPointSize:(double)a3
{
  self->_maxPointSize = a3;
}

- (double)minPointSize
{
  return self->_minPointSize;
}

- (void)setMinPointSize:(double)a3
{
  self->_minPointSize = a3;
}

- (signed)scalingStyle
{
  return self->_scalingStyle;
}

- (void)setScalingStyle:(signed __int16)a3
{
  self->_scalingStyle = a3;
}

- (signed)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(signed __int16)a3
{
  self->_alignment = a3;
}

- (NSDictionary)renditionProperties
{
  return self->_renditionProperties;
}

- (void)setRenditionProperties:(id)a3
{
}

- (int)objectVersion
{
  return self->_objectVersion;
}

- (void)setObjectVersion:(int)a3
{
  self->_objectVersion = a3;
}

- (__n128)transformation
{
  return a1[29];
}

- (__n128)setTransformation:(__n128)a3
{
  result[29] = a2;
  result[30] = a3;
  result[31] = a4;
  result[32] = a5;
  return result;
}

- (MDLAsset)modelAsset
{
  return self->_modelAsset;
}

- (void)setModelAsset:(id)a3
{
}

- (NSArray)meshReferences
{
  return &self->_meshReferences->super;
}

- (MDLMesh)modelMesh
{
  return self->_modelMesh;
}

- (void)setModelMesh:(id)a3
{
}

- (NSArray)submeshReferences
{
  return &self->_submeshReferences->super;
}

- (MDLSubmesh)modelSubmesh
{
  return self->_modelSubmesh;
}

- (void)setModelSubmesh:(id)a3
{
}

- (NSArray)vectorSizes
{
  return self->_vectorSizes;
}

- (void)setVectorSizes:(id)a3
{
}

- (unsigned)standardVectorSize
{
  return self->_standardVectorSize;
}

- (void)setStandardVectorSize:(unsigned int)a3
{
  self->_standardVectorSize = a3;
}

- (float)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(float)a3
{
  self->_baseline = a3;
}

- (float)capHeight
{
  return self->_capHeight;
}

- (void)setCapHeight:(float)a3
{
  self->_capHeight = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  bottouint64_t m = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.CGSize var1 = left;
  result.var0 = top;
  return result;
}

- (void)setAlignmentRectInsets:(id)a3
{
  self->_alignmentRectInsets = ($6B9B24F574F852F8EB8F2DB2BEA94E23)a3;
}

- (float)templateVersion
{
  return self->_templateVersion;
}

- (void)setTemplateVersion:(float)a3
{
  self->_templateVersion = a3;
}

- (BOOL)isInterpolatable
{
  return self->_isInterpolatable;
}

- (void)setInterpolatable:(BOOL)a3
{
  self->_isInterpolatable = a3;
}

- (int64_t)vectorGlyphRenderingMode
{
  return self->_vectorGlyphRenderingMode;
}

- (void)setVectorGlyphRenderingMode:(int64_t)a3
{
  self->_vectorGlyphRenderingMode = a3;
}

@end