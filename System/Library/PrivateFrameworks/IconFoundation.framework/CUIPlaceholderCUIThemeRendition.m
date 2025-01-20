@interface CUIPlaceholderCUIThemeRendition
+ (Class)renditionClassForRenditionType:(int64_t)a3 andPixelFormat:(unsigned int)a4;
+ (id)displayNameForRenditionType:(int64_t)a3;
- ($01BB1521EC52D44A8E7628F5261DCEC8)vectorGlyphAlignmentRectInsets;
- (BOOL)edgesOnly;
- (BOOL)isFlippable;
- (BOOL)isInternalLink;
- (BOOL)isInterpolatable;
- (BOOL)isOpaque;
- (BOOL)isScaled;
- (BOOL)isTiled;
- (BOOL)isTintable;
- (BOOL)isVectorBased;
- (BOOL)optOutOfThinning;
- (BOOL)preserveForArchiveOnly;
- (BOOL)preservedVectorRepresentation;
- (BOOL)substituteWithSystemColor;
- (CGColor)cgColor;
- (CGImage)createImageFromPDFRenditionWithScale:(double)a3;
- (CGImage)unslicedImage;
- (CGPDFDocument)pdfDocument;
- (CGSVGDocument)svgDocument;
- (CGSize)physicalSizeInMeters;
- (CUIPlaceholderCUIThemeRendition)initWithCSIData:(id)a3 forKey:(const _renditionkeytoken *)a4 version:(unsigned int)a5;
- (NSData)srcData;
- (NSString)internalName;
- (const)csiTextStyle;
- (const)key;
- (cuithemerenditionrenditionflags)renditionFlags;
- (double)gradientDrawingAngle;
- (double)opacity;
- (double)scale;
- (double)transformation;
- (double)vectorGlyphBaseline;
- (double)vectorGlyphCapLine;
- (double)vectorGlyphReferencePointSize;
- (float)vectorGlyphTemplateVersion;
- (id)_initWithCSIData:(id)a3 forKey:(const _renditionkeytoken *)a4 version:(unsigned int)a5;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)_sourceRendition;
- (id)assetPackIdentifier;
- (id)contentNames;
- (id)data;
- (id)description;
- (id)effectPreset;
- (id)externalTags;
- (id)gradient;
- (id)imageForSliceIndex:(int64_t)a3;
- (id)layerReferences;
- (id)linkingToRendition;
- (id)maskForSliceIndex:(int64_t)a3;
- (id)metrics;
- (id)mipLevels;
- (id)modelAsset;
- (id)modelMesh;
- (id)modelSubmesh;
- (id)name;
- (id)properties;
- (id)provideTextureInfo;
- (id)sizeIndexes;
- (id)sliceInformation;
- (id)systemColorName;
- (id)textureImages;
- (id)utiType;
- (id)vectorGlyphAvailableSizes;
- (int)bitmapEncoding;
- (int)blendMode;
- (int)exifOrientation;
- (int)objectVersion;
- (int)pixelFormat;
- (int64_t)internalTemplateRenderingMode;
- (int64_t)templateRenderingMode;
- (int64_t)textureIntepretation;
- (int64_t)type;
- (int64_t)vectorGlyphRenderingMode;
- (unint64_t)colorSpaceID;
- (unint64_t)sourceRowbytes;
- (unsigned)gradientStyle;
- (unsigned)internalScale;
- (unsigned)subtype;
- (unsigned)valueForTokenIdentifier:(unsigned __int16)a3;
- (void)_initalizeMetadataFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4;
- (void)_initializeCompositingOptionsFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4;
- (void)_initializePropertiesFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4;
- (void)_initializeRenditionKey:(const _renditionkeytoken *)a3;
- (void)_initializeTypeIdentifiersWithLayout:(unsigned __int16)a3;
- (void)_setFlippable:(BOOL)a3;
- (void)dealloc;
- (void)setBlendMode:(int)a3;
- (void)setExifOrientation:(int)a3;
- (void)setInternalName:(id)a3;
- (void)setInternalScale:(unsigned int)a3;
- (void)setInternalTemplateRenderingMode:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setSubtype:(unsigned int)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CUIPlaceholderCUIThemeRendition

- (void)setInternalName:(id)a3
{
  name = self->_name;
  if (name != a3)
  {

    self->_name = (NSString *)a3;
  }
}

- (NSString)internalName
{
  return self->_name;
}

- (void)setName:(id)a3
{
  name = self->_name;
  if (name != a3)
  {

    self->_name = (NSString *)a3;
  }
}

- (cuithemerenditionrenditionflags)renditionFlags
{
  return &self->_renditionFlags;
}

+ (Class)renditionClassForRenditionType:(int64_t)a3 andPixelFormat:(unsigned int)a4
{
  if (a3 == 1003) {
    return (Class)objc_opt_class();
  }
  else {
    return 0;
  }
}

+ (id)displayNameForRenditionType:(int64_t)a3
{
  return (id)[NSString stringWithCString:gRenditionTypes[3 * a3 + 2] encoding:4];
}

- (BOOL)isInternalLink
{
  return 0;
}

- (id)linkingToRendition
{
  return 0;
}

- (unint64_t)sourceRowbytes
{
  return 0;
}

- (void)_initializeTypeIdentifiersWithLayout:(unsigned __int16)a3
{
  if ((a3 - 10) <= 2)
  {
    self->_type = 0;
LABEL_10:
    self->_subtype = a3;
    return;
  }
  if ((a3 - 20) <= 2)
  {
    int64_t v3 = 1;
LABEL_9:
    self->_type = v3;
    goto LABEL_10;
  }
  if ((a3 - 23) <= 2)
  {
    int64_t v3 = 2;
    goto LABEL_9;
  }
  if ((a3 - 30) < 5)
  {
    int64_t v3 = 3;
    goto LABEL_9;
  }
  if (a3 == 40)
  {
    self->_type = 5;
    unsigned int v4 = 40;
    goto LABEL_15;
  }
  if (a3 == 50)
  {
    self->_type = 8;
    unsigned int v4 = 50;
LABEL_15:
    self->_subtype = v4;
    return;
  }
  self->_type = a3;
}

- (void)_initializeCompositingOptionsFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4
{
  self->_opacity = 1.0;
  self->_blendMode = 0;
  uint64_t var10 = a3->var10;
  if (var10)
  {
    v7 = &a3->var11.var1[a3->var11.var0 + 1];
    v8 = (unsigned int *)((char *)v7 + var10);
    do
    {
      unsigned int v9 = v7[1];
      if (*v7 == 1004)
      {
        [(CUIPlaceholderCUIThemeRendition *)self setBlendMode:v7[2]];
        [(CUIPlaceholderCUIThemeRendition *)self setOpacity:*((float *)v7 + 3)];
      }
      if (a4 <= 0x34E && v9 != 12 && *v7 == 1019) {
        unsigned int v9 = 12;
      }
      v7 = (unsigned int *)((char *)v7 + v9 + 8);
    }
    while (v7 < v8);
  }
}

- (void)_initalizeMetadataFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4
{
  uint64_t var10 = a3->var10;
  if (var10)
  {
    v7 = &a3->var11.var1[a3->var11.var0 + 1];
    v8 = (unsigned int *)((char *)v7 + var10);
    do
    {
      unsigned int v9 = v7[1];
      if (*v7 == 1015)
      {
        if (!v7[2]) {
          self->_physicalSizeInMeters = (CGSize)vcvtq_f64_f32(*(float32x2_t *)(v7 + 3));
        }
      }
      else if (*v7 == 1005 && !v7[3])
      {

        self->_utiType = (NSString *)[[NSString alloc] initWithUTF8String:v7 + 4];
      }
      if (a4 <= 0x34E && v9 != 12 && *v7 == 1019) {
        unsigned int v9 = 12;
      }
      v7 = (unsigned int *)((char *)v7 + v9 + 8);
    }
    while (v7 < v8);
  }
}

- (void)_initializePropertiesFromCSIData:(const _csiheader *)a3 version:(unsigned int)a4
{
  uint64_t var10 = a3->var10;
  if (var10)
  {
    v7 = 0;
    v8 = &a3->var11.var1[a3->var11.var0 + 1];
    unsigned int v9 = (unsigned int *)((char *)v8 + var10);
    while (1)
    {
      unsigned int v10 = v8[1];
      if (*v8 != 1016 || v8[2]) {
        goto LABEL_20;
      }
      v11 = (void *)[[NSString alloc] initWithUTF8String:v8 + 7];
      v12 = (double *)((char *)v8 + v8[3] + 28);
      unsigned int v13 = v8[5];
      if (v13 == 2) {
        break;
      }
      if (v13 == 1)
      {
        uint64_t v14 = [objc_alloc(NSNumber) initWithLongLong:*(void *)v12];
        goto LABEL_11;
      }
      if (!v13)
      {
        uint64_t v14 = [[NSString alloc] initWithUTF8String:v12];
        goto LABEL_11;
      }
      v15 = 0;
LABEL_19:

LABEL_20:
      if (a4 <= 0x34E && v10 != 12 && *v8 == 1019) {
        unsigned int v10 = 12;
      }
      v8 = (unsigned int *)((char *)v8 + v10 + 8);
      if (v8 >= v9) {
        goto LABEL_29;
      }
    }
    uint64_t v14 = [objc_alloc(NSNumber) initWithDouble:*v12];
LABEL_11:
    v15 = (void *)v14;
    if (v11) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16)
    {
      if (!v7) {
        v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      [(NSDictionary *)v7 setObject:v15 forKey:v11];
    }
    goto LABEL_19;
  }
  v7 = 0;
LABEL_29:

  self->_properties = v7;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v13.receiver = self;
  v13.super_class = (Class)CUIPlaceholderCUIThemeRendition;
  v6 = [(CUIPlaceholderCUIThemeRendition *)&v13 init];
  v6->_colorSpaceID = *((_DWORD *)a3 + 7) & 0xF;
  [(CUIPlaceholderCUIThemeRendition *)v6 _initializeTypeIdentifiersWithLayout:a3->var9.var1];
  v6->_name = (NSString *)[[NSString alloc] initWithUTF8String:a3->var9.var3];
  unsigned int v7 = *(_DWORD *)&v6->_renditionFlags & 0xFFFFFFFE | (a3->var2 >> 2) & 1;
  v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
  unsigned int var2 = a3->var2;
  if ((var2 & 8) != 0)
  {
    uint64_t v9 = 1;
    goto LABEL_7;
  }
  if ((var2 & 0x10) != 0)
  {
    uint64_t v9 = 2;
LABEL_7:
    v6->_templateRenderingMode = v9;
    if ((var2 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v6->_templateRenderingMode = 0;
  if ((var2 & 0x20) != 0)
  {
LABEL_8:
    v7 |= 0x40u;
    v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
    unsigned int var2 = a3->var2;
  }
LABEL_9:
  if ((var2 & 0x200) != 0)
  {
    v7 |= 0x400u;
    v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
    unsigned int var2 = a3->var2;
    if ((var2 & 0x40) == 0)
    {
LABEL_11:
      if ((var2 & 0x80) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else if ((var2 & 0x40) == 0)
  {
    goto LABEL_11;
  }
  v7 |= 0x80u;
  v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
  unsigned int var2 = a3->var2;
  if ((var2 & 0x80) == 0)
  {
LABEL_12:
    if ((var2 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_20:
  v7 |= 0x100u;
  v6->_renditionFlags = (cuithemerenditionrenditionflags)v7;
  if ((a3->var2 & 0x100) != 0) {
LABEL_13:
  }
    v6->_renditionFlags = (cuithemerenditionrenditionflags)(v7 | 0x200);
LABEL_14:
  unsigned int var5 = a3->var5;
  if (var5) {
    unsigned int v11 = ((double)var5 / 100.0);
  }
  else {
    unsigned int v11 = 1;
  }
  v6->_scale = v11;
  [(CUIPlaceholderCUIThemeRendition *)v6 _initializeCompositingOptionsFromCSIData:a3 version:v4];
  [(CUIPlaceholderCUIThemeRendition *)v6 _initalizeMetadataFromCSIData:a3 version:v4];
  [(CUIPlaceholderCUIThemeRendition *)v6 _initializePropertiesFromCSIData:a3 version:v4];
  return v6;
}

- (int)pixelFormat
{
  return 0;
}

- (void)_initializeRenditionKey:(const _renditionkeytoken *)a3
{
  unsigned int v5 = CUIRenditionKeyTokenCount((uint64_t)a3);
  __int16 v6 = v5;
  if (v5 <= 0x15)
  {
    key = self->_key;
  }
  else
  {
    key = (_renditionkeytoken *)malloc_type_calloc(v5 + 1, 4uLL, 0x100004052888210uLL);
    self->_key = key;
  }
  if (!key) {
    key = self->_stackKey;
  }

  CUIRenditionKeyCopy(key, a3, (unsigned __int16)(v6 + 1));
}

- (CUIPlaceholderCUIThemeRendition)initWithCSIData:(id)a3 forKey:(const _renditionkeytoken *)a4 version:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v9 = [a3 bytes];
  unsigned int v10 = (objc_class *)[(id)objc_opt_class() renditionClassForRenditionType:*(unsigned __int16 *)(v9 + 36) andPixelFormat:*(unsigned int *)(v9 + 24)];
  if (v10) {
    unsigned int v11 = (CUIPlaceholderCUIThemeRendition *)[[v10 alloc] _initWithCSIData:a3 forKey:a4 version:v5];
  }
  else {
    unsigned int v11 = 0;
  }

  return v11;
}

- (id)_initWithCSIData:(id)a3 forKey:(const _renditionkeytoken *)a4 version:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v14.receiver = self;
  v14.super_class = (Class)CUIPlaceholderCUIThemeRendition;
  id result = [(CUIPlaceholderCUIThemeRendition *)&v14 init];
  if (result)
  {
    uint64_t v9 = result;
    unsigned int v10 = CUIRenditionKeyTokenCount((uint64_t)a4);
    __int16 v11 = v10;
    if (v10 <= 0x15)
    {
      v12 = (void *)v9[12];
    }
    else
    {
      v12 = malloc_type_calloc(v10 + 1, 4uLL, 0x100004052888210uLL);
      v9[12] = v12;
    }
    if (!v12) {
      v12 = v9 + 1;
    }
    CUIRenditionKeyCopy(v12, a4, (unsigned __int16)(v11 + 1));
    objc_super v13 = (_DWORD *)[a3 bytes];
    v9[20] = a3;
    if (*v13 == 1129599817)
    {
      return (id)[v9 _initWithCSIHeader:v13 version:v5];
    }
    else
    {
      +[CUIPlaceholderCUIRenditionKey renditionKeyWithKeyList:a4];
      _CUILog();

      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  free(self->_key);
  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholderCUIThemeRendition;
  [(CUIPlaceholderCUIThemeRendition *)&v3 dealloc];
}

- (const)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return self->_stackKey;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (id)name
{
  return self->_name;
}

- (id)utiType
{
  v2 = (void *)[(NSString *)self->_utiType copy];

  return v2;
}

- (CGSize)physicalSizeInMeters
{
  double width = self->_physicalSizeInMeters.width;
  double height = self->_physicalSizeInMeters.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isVectorBased
{
  return *(_DWORD *)&self->_renditionFlags & 1;
}

- (BOOL)isOpaque
{
  return (*(unsigned char *)&self->_renditionFlags >> 1) & 1;
}

- (int)bitmapEncoding
{
  return (*(_DWORD *)&self->_renditionFlags >> 2) & 0xF;
}

- (int64_t)templateRenderingMode
{
  return self->_templateRenderingMode;
}

- (BOOL)optOutOfThinning
{
  return (*(unsigned char *)&self->_renditionFlags >> 6) & 1;
}

- (BOOL)preserveForArchiveOnly
{
  return (*((unsigned __int8 *)&self->_renditionFlags + 1) >> 2) & 1;
}

- (BOOL)isFlippable
{
  return *(unsigned char *)&self->_renditionFlags >> 7;
}

- (BOOL)isInterpolatable
{
  return 0;
}

- (void)_setFlippable:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_renditionFlags = (cuithemerenditionrenditionflags)(*(_DWORD *)&self->_renditionFlags & 0xFFFFFF7F | v3);
}

- (BOOL)preservedVectorRepresentation
{
  return (*((unsigned __int8 *)&self->_renditionFlags + 1) >> 1) & 1;
}

- (BOOL)isTintable
{
  return *((unsigned char *)&self->_renditionFlags + 1) & 1;
}

- (id)properties
{
  v2 = (void *)[(NSDictionary *)self->_properties copy];

  return v2;
}

- (unint64_t)colorSpaceID
{
  return self->_colorSpaceID;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPlaceholderCUIThemeRendition;
  return (id)objc_msgSend(-[CUIPlaceholderCUIThemeRendition description](&v3, sel_description), "stringByAppendingFormat:", @" -- Rendition name: %@", -[CUIPlaceholderCUIThemeRendition name](self, "name"));
}

- (id)provideTextureInfo
{
  return 0;
}

- (id)textureImages
{
  return 0;
}

- (int64_t)textureIntepretation
{
  return 0;
}

- (CGImage)unslicedImage
{
  return 0;
}

- (id)imageForSliceIndex:(int64_t)a3
{
  return 0;
}

- (id)maskForSliceIndex:(int64_t)a3
{
  return 0;
}

- (double)scale
{
  LODWORD(v2) = self->_scale;
  return (double)v2;
}

- (id)metrics
{
  return 0;
}

- (id)sliceInformation
{
  return 0;
}

- (BOOL)isTiled
{
  return 0;
}

- (BOOL)isScaled
{
  return 1;
}

- (BOOL)edgesOnly
{
  return 0;
}

- (CGColor)cgColor
{
  return 0;
}

- (id)systemColorName
{
  return 0;
}

- (BOOL)substituteWithSystemColor
{
  return 0;
}

- (const)csiTextStyle
{
  return 0;
}

- (id)sizeIndexes
{
  return 0;
}

- (double)gradientDrawingAngle
{
  return 0.0;
}

- (id)gradient
{
  return 0;
}

- (unsigned)gradientStyle
{
  return 0;
}

- (unsigned)subtype
{
  unsigned int result = self->_subtype;
  if (!result)
  {
    int64_t type = self->_type;
    unsigned int result = 10;
    switch(type)
    {
      case 0:
        return result;
      case 1:
        unsigned int result = 20;
        break;
      case 2:
        unsigned int result = 23;
        break;
      case 3:
        unsigned int result = 30;
        break;
      case 4:
      case 6:
      case 7:
        goto LABEL_6;
      case 5:
        unsigned int result = 40;
        break;
      case 8:
        unsigned int result = 50;
        break;
      default:
        if (type != 1004) {
LABEL_6:
        }
          unsigned int result = 0;
        break;
    }
  }
  return result;
}

- (id)effectPreset
{
  return 0;
}

- (CGPDFDocument)pdfDocument
{
  return 0;
}

- (CGImage)createImageFromPDFRenditionWithScale:(double)a3
{
  return 0;
}

- (id)data
{
  return 0;
}

- (id)assetPackIdentifier
{
  return 0;
}

- (id)externalTags
{
  return 0;
}

- (id)layerReferences
{
  return 0;
}

- (id)mipLevels
{
  return 0;
}

- (id)contentNames
{
  return 0;
}

- (double)transformation
{
  return 0.0;
}

- (int)objectVersion
{
  return 0;
}

- (id)modelAsset
{
  return 0;
}

- (id)modelMesh
{
  return 0;
}

- (id)modelSubmesh
{
  return 0;
}

- (CGSVGDocument)svgDocument
{
  return 0;
}

- (id)vectorGlyphAvailableSizes
{
  return 0;
}

- (double)vectorGlyphBaseline
{
  return 0.0;
}

- (double)vectorGlyphCapLine
{
  return 0.0;
}

- (double)vectorGlyphReferencePointSize
{
  return 0.0;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)vectorGlyphAlignmentRectInsets
{
  double v2 = *MEMORY[0x1E4F5E038];
  double v3 = *(double *)(MEMORY[0x1E4F5E038] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F5E038] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F5E038] + 24);
  result.var3 = v5;
  result.unsigned int var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (float)vectorGlyphTemplateVersion
{
  return 0.0;
}

- (id)_sourceRendition
{
  return 0;
}

- (int64_t)vectorGlyphRenderingMode
{
  return 1;
}

- (unsigned)valueForTokenIdentifier:(unsigned __int16)a3
{
  int v3 = a3;
  double v4 = [(CUIPlaceholderCUIThemeRendition *)self key];
  int identifier = v4->identifier;
  if (!v4->identifier) {
    return 0;
  }
  __int16 v6 = v4 + 1;
  while (identifier != v3)
  {
    int v7 = v6->identifier;
    ++v6;
    int identifier = v7;
    if (!v7) {
      return 0;
    }
  }
  return v6[-1].value;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void)setSubtype:(unsigned int)a3
{
  self->_subint64_t type = a3;
}

- (unsigned)internalScale
{
  return self->_scale;
}

- (void)setInternalScale:(unsigned int)a3
{
  self->_scale = a3;
}

- (int64_t)internalTemplateRenderingMode
{
  return self->_templateRenderingMode;
}

- (void)setInternalTemplateRenderingMode:(int64_t)a3
{
  self->_templateRenderingMode = a3;
}

- (NSData)srcData
{
  return self->_srcData;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(int)a3
{
  self->_exifOrientation = a3;
}

@end