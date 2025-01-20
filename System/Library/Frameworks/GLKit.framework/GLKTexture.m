@interface GLKTexture
- (BOOL)_uploadToGLTexture:(unsigned int)a3 data:(id)a4 width:(int)a5 height:(int)a6 dataCategory:(int)a7 cubeMapIndex:(int)a8 mipMapIndex:(int)a9 error:(id *)a10;
- (BOOL)canHonorSRGBrequest;
- (BOOL)decodeCGImage:(CGImage *)a3;
- (BOOL)decodeCGImageDataProvider:(CGImage *)a3;
- (BOOL)decodeCGImageImageProvider:(CGImage *)a3 CGImageProvider:(CGImageProvider *)a4;
- (BOOL)determineCGImageBlockFormatWithComponentType:(int)a3 andPixelSize:(unint64_t)a4 andColorModel:(int)a5;
- (BOOL)determinePVRFormat:(unsigned int)a3;
- (BOOL)hasAlpha;
- (BOOL)hasPremultipliedAlpha;
- (BOOL)isCubeMap;
- (BOOL)isMipmapped;
- (BOOL)isPowerOfTwo;
- (BOOL)isVerticalFlipped;
- (BOOL)loadCGImage:(CGImage *)a3 options:(id)a4 error:(id *)a5;
- (BOOL)loadPVRTCData:(id)a3 error:(id *)a4;
- (BOOL)loadWithData:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)premultiplyWithAlpha:(void *)a3 source:(void *)a4 withWidth:(unsigned int)a5 withHeight:(unsigned int)a6 withRowBytes:(unsigned int)a7 error:(id *)a8;
- (BOOL)reOrient;
- (BOOL)reorientToGL:(void *)a3 source:(void *)a4 withWidth:(unsigned int)a5 withHeight:(unsigned int)a6 withRowBytes:(unsigned int)a7 error:(id *)a8;
- (BOOL)requestIssuedForMipmapGeneration;
- (BOOL)shouldApplyPremultiplication;
- (BOOL)shouldApplyReorientToGL;
- (BOOL)uploadToGLTexture:(unsigned int)a3 error:(id *)a4;
- (GLKTexture)init;
- (GLKTexture)initWithCGImage:(CGImage *)a3 forceCubeMap:(BOOL)a4 wasCubeMap:(BOOL *)a5 cubeMapIndex:(int)a6 options:(id)a7 error:(id *)a8;
- (GLKTexture)initWithData:(id)a3 forceCubeMap:(BOOL)a4 wasCubeMap:(BOOL *)a5 cubeMapIndex:(int)a6 options:(id)a7 error:(id *)a8;
- (GLKTexture)initWithDecodedData:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 rowBytes:(unsigned int)a6 texture:(id)a7 cubeMapIndex:(int)a8 options:(id)a9 error:(id *)a10;
- (NSData)imageData;
- (NSString)label;
- (int)dataCategory;
- (int)loadMode;
- (int)texelFormat;
- (unsigned)GLTextureName;
- (unsigned)bindTarget;
- (unsigned)bitsPerPixel;
- (unsigned)format;
- (unsigned)height;
- (unsigned)index;
- (unsigned)internalFormat;
- (unsigned)nComponents;
- (unsigned)nPrimarySurfaces;
- (unsigned)nSurfaces;
- (unsigned)numMipMapLevels;
- (unsigned)orientation;
- (unsigned)rowBytes;
- (unsigned)textureTarget;
- (unsigned)type;
- (unsigned)width;
- (void)alignmentFix:(unsigned int)a3 data:(const void *)a4;
- (void)dealloc;
- (void)setBindTarget:(unsigned int)a3;
- (void)setBitsPerPixel:(unsigned int)a3;
- (void)setDataCategory:(int)a3;
- (void)setFormat:(unsigned int)a3;
- (void)setGLTextureName:(unsigned int)a3;
- (void)setHasAlpha:(BOOL)a3;
- (void)setHeight:(unsigned int)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setInternalFormat:(unsigned int)a3;
- (void)setIsCubeMap:(BOOL)a3;
- (void)setIsMipmapped:(BOOL)a3;
- (void)setIsPowerOfTwo:(BOOL)a3;
- (void)setIsVerticalFlipped:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLoadMode:(int)a3;
- (void)setNComponents:(unsigned int)a3;
- (void)setNPrimarySurfaces:(unsigned int)a3;
- (void)setNSurfaces:(unsigned int)a3;
- (void)setNumMipMapLevels:(unsigned int)a3;
- (void)setOrientation:(unsigned int)a3;
- (void)setReOrient:(BOOL)a3;
- (void)setRowBytes:(unsigned int)a3;
- (void)setTexelFormat:(int)a3;
- (void)setTextureTarget:(unsigned int)a3;
- (void)setType:(unsigned int)a3;
- (void)setWidth:(unsigned int)a3;
- (void)updateRequestedOperationsFromOptions:(id)a3;
@end

@implementation GLKTexture

- (GLKTexture)init
{
  v3.receiver = self;
  v3.super_class = (Class)GLKTexture;
  result = [(GLKTexture *)&v3 init];
  if (result)
  {
    result->_type = 5121;
    *(int32x2_t *)&result->_bindTarget = vdup_n_s32(0xDE1u);
    result->_hasPremultipliedAlpha = 0;
    result->_unpackAlignment = 4;
    result->_requestIssuedForSRGB = 0;
  }
  return result;
}

- (void)dealloc
{
  if (self->_blockSet) {
    CGImageBlockSetRelease();
  }
  cfData = self->_cfData;
  if (cfData) {
    CFRelease(cfData);
  }
  [(GLKTexture *)self setLabel:0];
  v4.receiver = self;
  v4.super_class = (Class)GLKTexture;
  [(GLKTexture *)&v4 dealloc];
}

- (void)updateRequestedOperationsFromOptions:(id)a3
{
  self->_requestIssuedForMipmapGeneration = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"GLKTextureLoaderGenerateMipmaps"), "BOOLValue");
  self->_requestIssuedToReorientToGL = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"GLKTextureLoaderOriginBottomLeft"), "BOOLValue");
  self->_requestIssuedForAlphaPremultiplication = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"GLKTextureLoaderApplyPremultiplication"), "BOOLValue");
  self->_requestIssuedForSRGB = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"GLKTextureLoaderSRGB"), "BOOLValue");
  self->_requestIssuedToInterpretGrayAsAlpha = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"GLKTextureLoaderGrayscaleAsAlpha"), "BOOLValue");
  self->_isMipmapped = self->_requestIssuedForMipmapGeneration;
}

- (BOOL)shouldApplyPremultiplication
{
  return self->_requestIssuedForAlphaPremultiplication
      && self->_hasAlpha
      && !self->_hasPremultipliedAlpha
      && self->_dataCategory != 5;
}

- (BOOL)shouldApplyReorientToGL
{
  return self->_requestIssuedToReorientToGL && self->_dataCategory != 5;
}

- (BOOL)canHonorSRGBrequest
{
  return (self->_internalFormat & 0xFFFFFFFD) == 35904;
}

- (GLKTexture)initWithData:(id)a3 forceCubeMap:(BOOL)a4 wasCubeMap:(BOOL *)a5 cubeMapIndex:(int)a6 options:(id)a7 error:(id *)a8
{
  BOOL v12 = a4;
  v14 = [(GLKTexture *)self init];
  if (v14)
  {
    int v20 = 0;
    long long v19 = 0u;
    memset(v18, 0, sizeof(v18));
    [a3 getBytes:v18 length:52];
    if (HIDWORD(v19) == 559044176) {
      int v15 = 2;
    }
    else {
      int v15 = 1;
    }
    v14->_int loadMode = v15;
    [(GLKTexture *)v14 updateRequestedOperationsFromOptions:a7];
    v14->_index = a6;
    if (a5) {
      *a5 = 0;
    }
    int loadMode = v14->_loadMode;
    if (loadMode != 2)
    {
      if (loadMode != 1) {
        return v14;
      }
      v14->_isCubeMap = v12;
      if ([(GLKTexture *)v14 loadWithData:a3 options:a7 error:a8]) {
        return v14;
      }
LABEL_17:

      return 0;
    }
    if (![(GLKTexture *)v14 loadPVRTCData:a3 error:a8]) {
      goto LABEL_17;
    }
    if (a5 && v14->_isCubeMap) {
      *a5 = 1;
    }
    if (v12)
    {
      v14->_isCubeMap = 1;
      *(void *)&v14->_bindTarget = 0x851500008513;
    }
  }
  return v14;
}

- (GLKTexture)initWithCGImage:(CGImage *)a3 forceCubeMap:(BOOL)a4 wasCubeMap:(BOOL *)a5 cubeMapIndex:(int)a6 options:(id)a7 error:(id *)a8
{
  v14 = [(GLKTexture *)self init];
  int v15 = v14;
  if (v14)
  {
    v14->_int loadMode = 1;
    [(GLKTexture *)v14 updateRequestedOperationsFromOptions:a7];
    v15->_isCubeMap = a4;
    v15->_index = a6;
    if (a5) {
      *a5 = 0;
    }
    if (![(GLKTexture *)v15 loadCGImage:a3 options:a7 error:a8])
    {

      return 0;
    }
  }
  return v15;
}

- (GLKTexture)initWithDecodedData:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 rowBytes:(unsigned int)a6 texture:(id)a7 cubeMapIndex:(int)a8 options:(id)a9 error:(id *)a10
{
  v16 = [(GLKTexture *)self init];
  if (v16)
  {
    v16->_int loadMode = [a7 loadMode];
    [(GLKTexture *)v16 updateRequestedOperationsFromOptions:a9];
    v16->_dataCategory = [a7 dataCategory];
    v16->_imageData = (NSData *)a3;
    v16->_width = a4;
    v16->_height = a5;
    v16->_rowBytes = a6;
    v16->_index = a8;
    v16->_isCubeMap = [a7 isCubeMap];
    v16->_bitsPerPixel = [a7 bitsPerPixel];
    v16->_nComponents = [a7 nComponents];
    v16->_orientation = [a7 orientation];
    v16->_texelFormat = [a7 texelFormat];
    v16->_internalFormat = [a7 internalFormat];
    v16->_format = [a7 format];
    v16->_type = [a7 type];
    v16->_isPowerOfTwo = [a7 isPowerOfTwo];
    v16->_isVerticalFlipped = [a7 isVerticalFlipped];
    v16->_hasAlpha = [a7 hasAlpha];
    v16->_numMipMapLevels = 1;
    v16->_bindTarget = [a7 bindTarget];
    v16->_textureTarget = [a7 textureTarget];
  }
  return v16;
}

- (BOOL)loadPVRTCData:(id)a3 error:(id *)a4
{
  self->_imageData = 0;
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  v7 = (NSData *)a3;
  self->_imageData = v7;
  v8 = [(NSData *)v7 bytes];
  unsigned int v9 = v8[4];
  if (![(GLKTexture *)self determinePVRFormat:v9])
  {
    if (a4)
    {
      v13 = @"Unsupported PVR format";
      uint64_t v14 = 11;
LABEL_31:
      *a4 = (id)_GLKTextureErrorWithCodeAndErrorString(v14, (uint64_t)v13);
    }
LABEL_32:

    BOOL result = 0;
    self->_imageData = 0;
    return result;
  }
  unsigned int v10 = v8[3];
  self->_numMipMapLevels = v10 + 1;
  if ((v9 & 0xFE) != 0x18)
  {
    self->_dataCategory = 7;
    goto LABEL_21;
  }
  self->_dataCategory = 5;
  BOOL v11 = self->_requestIssuedForMipmapGeneration && v10 == 0;
  char v12 = !v11;
  if (v11)
  {
    if (!a4) {
      goto LABEL_27;
    }
    *a4 = (id)_GLKTextureErrorWithCodeAndErrorString(13, @"Cannot generate mipmaps for compressed PVR file");
  }
  if (self->_requestIssuedToReorientToGL)
  {
    if (a4)
    {
      char v12 = 0;
      *a4 = (id)_GLKTextureErrorWithCodeAndErrorString(15, @"Cannot reorient compressed PVR file");
      goto LABEL_28;
    }
LABEL_27:
    char v12 = 0;
  }
LABEL_28:
  if (self->_requestIssuedForAlphaPremultiplication)
  {
    if (a4)
    {
      v13 = @"Cannot premultiply compressed PVR file";
      uint64_t v14 = 16;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((v12 & 1) == 0) {
    goto LABEL_32;
  }
LABEL_21:
  BOOL v15 = v8[10] != 0;
  unsigned int v16 = v8[2];
  self->_width = v16;
  BOOL result = 1;
  BOOL v18 = HIWORD(v9) & 1;
  if (v18) {
    unsigned int v19 = 4;
  }
  else {
    unsigned int v19 = 1;
  }
  self->_height = v8[1];
  self->_orientation = v19;
  unsigned int v20 = v8[6];
  self->_bitsPerPixel = v20;
  self->_rowBytes = (v20 * v16) >> 3;
  self->_unpackAlignment = 1;
  unsigned int v21 = v8[12];
  if (v21 <= 1) {
    unsigned int v21 = 1;
  }
  self->_isCubeMap = (v9 & 0x1000) != 0;
  self->_isMipmapped |= BYTE1(v9) & 1;
  self->_isVerticalFlipped = v18;
  self->_hasAlpha = v15;
  self->_nPrimarySurfaces = v21;
  self->_nSurfaces = v8[3] + 1;
  *(int8x8_t *)&self->_bindTarget = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(((v9 >> 12) & 1) == 0), 0x1FuLL)), (int8x8_t)vdup_n_s32(0xDE1u), (int8x8_t)0x851500008513);
  self->_primarySurfaceLength = v8[5];
  return result;
}

- (void)alignmentFix:(unsigned int)a3 data:(const void *)a4
{
  unsigned int v5 = self->_width * a3;
  int v6 = self->_rowBytes - v5;
  if (!v6)
  {
    BOOL result = 0;
    int v8 = 1;
LABEL_7:
    self->_unpackAlignment = v8;
    return result;
  }
  if (v6 <= 1)
  {
    BOOL result = 0;
    int v8 = 2;
    goto LABEL_7;
  }
  if (v6 <= 3)
  {
    BOOL result = 0;
    int v8 = 4;
    goto LABEL_7;
  }
  self->_unpackAlignment = 8;
  if (v6 < 8) {
    return 0;
  }
  size_t v10 = (v5 + 7) & 0xFFFFFFF8;
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, self->_height * (unint64_t)v10, 0xA8230A87uLL)) {
    return 0;
  }
  if (self->_height)
  {
    unsigned int v11 = 0;
    unint64_t v12 = 0;
    do
    {
      memcpy((char *)memptr + v11, (char *)a4 + (self->_rowBytes * v12++), v10);
      v11 += v10;
    }
    while (v12 < self->_height);
  }
  self->_rowBytes = v10;
  return memptr;
}

- (BOOL)decodeCGImageDataProvider:(CGImage *)a3
{
  char BitmapInfo = CGImageGetBitmapInfo(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  unsigned int BitsPerPixel = CGImageGetBitsPerPixel(a3);
  self->_bitsPerPixel = BitsPerPixel;
  if (BitsPerPixel != 32 && BitsPerPixel != 8 || ColorSpace && Model > kCGColorSpaceModelRGB) {
    return 0;
  }
  self->_rowBytes = CGImageGetBytesPerRow(a3);
  self->_width = CGImageGetWidth(a3);
  self->_height = CGImageGetHeight(a3);
  self->_type = 5121;
  unsigned int v9 = self->_bitsPerPixel;
  if (v9 == 8)
  {
    if (ColorSpace) {
      BOOL v14 = (BitmapInfo & 0x1F) == 7;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14) {
      unsigned int v13 = 6406;
    }
    else {
      unsigned int v13 = 6409;
    }
    if (v14) {
      int v12 = 23;
    }
    else {
      int v12 = 20;
    }
    self->_internalFormat = v13;
    uint64_t v11 = 1;
  }
  else
  {
    if (v9 != 32) {
      return 0;
    }
    BOOL v10 = 0;
    self->_internalFormat = 6408;
    if ((BitmapInfo & 0x1Fu) > 6 || ((1 << (BitmapInfo & 0x1F)) & 0x54) == 0) {
      return v10;
    }
    uint64_t v11 = 4;
    int v12 = 2;
    unsigned int v13 = 32993;
  }
  self->_format = v13;
  self->_texelFormat = v12;
  self->_nComponents = v11;
  DataProvider = CGImageGetDataProvider(a3);
  unsigned int v16 = CGDataProviderCopyData(DataProvider);
  self->_cfData = v16;
  if (!v16) {
    return 0;
  }
  BytePtr = CFDataGetBytePtr(v16);
  if (BytePtr)
  {
    BOOL v18 = BytePtr;
    unsigned int v19 = [(GLKTexture *)self alignmentFix:v11 data:BytePtr];
    if (v19)
    {
      unsigned int v20 = v19;
LABEL_31:
      CFRelease(self->_cfData);
      self->_cfData = 0;
      BOOL v10 = 1;
      self->_imageData = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v20 length:self->_rowBytes * self->_height freeWhenDone:1];
      return v10;
    }
    if ([(GLKTexture *)self shouldApplyReorientToGL]
      || [(GLKTexture *)self shouldApplyPremultiplication])
    {
      v22 = malloc_type_malloc(self->_rowBytes * (unint64_t)self->_height, 0x2E325D47uLL);
      if (v22)
      {
        unsigned int v20 = v22;
        memcpy(v22, v18, self->_rowBytes * self->_height);
        goto LABEL_31;
      }
    }
    else
    {
      self->_imageData = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v18 length:self->_rowBytes * self->_height freeWhenDone:0];
    }
    return 1;
  }
  CFRelease(self->_cfData);
  BOOL v10 = 0;
  self->_cfData = 0;
  return v10;
}

- (BOOL)decodeCGImageImageProvider:(CGImage *)a3 CGImageProvider:(CGImageProvider *)a4
{
  ColorSpace = (CGColorSpace *)CGImageProviderGetColorSpace();
  uint64_t Model = CGColorSpaceGetModel(ColorSpace);
  if (Model > 1) {
    return 0;
  }
  uint64_t v7 = Model;
  CGImageProviderGetSize();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    return 0;
  }
  unsigned int v9 = Mutable;
  CFDictionarySetValue(Mutable, @"kCGImageBlockIOSurfaceOptimizedRequest", (const void *)*MEMORY[0x263EFFB40]);
  CFDictionarySetValue(v9, @"kCGImageBlockFormatRequest", @"kCGImageBlockFormatBGRx8");
  BOOL v10 = (CGImageBlockSet *)CGImageProviderCopyImageBlockSetWithOptions();
  self->_blockSet = v10;
  if (v10)
  {
    if (CGImageBlockSetGetCount() != 1) {
      goto LABEL_13;
    }
    CGImageBlockSetGetImageBlock();
    CGImageBlockGetRect();
    self->_width = v11;
    self->_height = v12;
    self->_rowBytes = CGImageBlockGetBytesPerRow();
    uint64_t Data = CGImageBlockGetData();
    uint64_t ComponentType = CGImageBlockSetGetComponentType();
    unsigned int PixelSize = CGImageBlockSetGetPixelSize();
    uint64_t v16 = PixelSize == 3 ? 4 : PixelSize;
    if ([(GLKTexture *)self determineCGImageBlockFormatWithComponentType:ComponentType andPixelSize:v16 andColorModel:v7])
    {
      v17 = [(GLKTexture *)self alignmentFix:v16 data:Data];
      if (v17)
      {
        BOOL v18 = v17;
        CGImageBlockSetRelease();
        self->_blockSet = 0;
        BOOL v19 = 1;
        self->_imageuint64_t Data = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v18 length:self->_rowBytes * self->_height freeWhenDone:1];
      }
      else
      {
        self->_imageuint64_t Data = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:Data length:self->_rowBytes * self->_height freeWhenDone:0];
        BOOL v19 = 1;
      }
    }
    else
    {
LABEL_13:
      CGImageBlockSetRelease();
      BOOL v19 = 0;
      self->_blockSet = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }
  CFRelease(v9);
  return v19;
}

- (BOOL)decodeCGImage:(CGImage *)a3
{
  uint64_t ImageProvider = CGImageGetImageProvider();
  if (ImageProvider)
  {
    return [(GLKTexture *)self decodeCGImageImageProvider:a3 CGImageProvider:ImageProvider];
  }
  else
  {
    return [(GLKTexture *)self decodeCGImageDataProvider:a3];
  }
}

- (BOOL)loadWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  self->_imageuint64_t Data = 0;
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  self->_dataCategory = 1;
  CGImageSourceRef v8 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v8) {
    goto LABEL_18;
  }
  unsigned int v9 = v8;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  if (!Mutable) {
    goto LABEL_17;
  }
  double v11 = Mutable;
  CFDictionarySetValue(Mutable, @"kCGImageBlockIOSurfaceOptimizedRequest", (const void *)*MEMORY[0x263EFFB40]);
  CFDictionarySetValue(v11, @"kCGImageBlockFormatRequest", @"kCGImageBlockFormatBGRx8");
  CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(v9, 0, v11);
  if (!v12) {
    goto LABEL_17;
  }
  CFDictionaryRef v13 = v12;
  BOOL v14 = (const void *)*MEMORY[0x263F0F4C8];
  if (CFDictionaryContainsKey(v12, (const void *)*MEMORY[0x263F0F4C8]))
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v13, v14);
    CFNumberGetValue(Value, kCFNumberIntType, &self->_orientation);
    unsigned int orientation = self->_orientation;
    if (orientation != 1 && orientation != 4) {
      self->_unsigned int orientation = 0;
    }
  }
  else
  {
    self->_unsigned int orientation = 1;
  }
  v17 = (const void *)*MEMORY[0x263F0F458];
  if (CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x263F0F458]))
  {
    CFBooleanRef v18 = (const __CFBoolean *)CFDictionaryGetValue(v13, v17);
    self->_hasAlpha = CFBooleanGetValue(v18) != 0;
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, v11);
  if (!ImageAtIndex)
  {
    CFRelease(v11);
    CFRelease(v13);
LABEL_17:
    CFRelease(v9);
    goto LABEL_18;
  }
  unsigned int v20 = ImageAtIndex;
  BOOL v21 = [(GLKTexture *)self decodeCGImage:ImageAtIndex];
  CGImageRelease(v20);
  CFRelease(v11);
  CFRelease(v13);
  CFRelease(v9);
  if (v21)
  {
    *(void *)&self->_nPrimarySurfaces = 0x100000001;
    BOOL result = 1;
    self->_numMipMapLevels = 1;
    *(int8x8_t *)&self->_bindTarget = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(!self->_isCubeMap), 0x1FuLL)), (int8x8_t)vdup_n_s32(0xDE1u), (int8x8_t)0x851500008513);
    return result;
  }
LABEL_18:
  if (!a5) {
    return 0;
  }
  v23 = (void *)_GLKTextureErrorWithCodeAndErrorString(12, @"Image decoding failed");
  BOOL result = 0;
  *a5 = v23;
  return result;
}

- (BOOL)loadCGImage:(CGImage *)a3 options:(id)a4 error:(id *)a5
{
  if (!a3)
  {
    if (a5)
    {
      unsigned int v9 = @"Invalid CGImageRef";
LABEL_10:
      BOOL v8 = 0;
      *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(12, (uint64_t)v9);
      return v8;
    }
    return 0;
  }

  self->_imageuint64_t Data = 0;
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  BOOL v8 = 1;
  self->_dataCategory = 1;
  self->_unsigned int orientation = 1;
  self->_hasAlpha = CGImageGetAlphaInfo(a3) - 1 < 4;
  if (![(GLKTexture *)self decodeCGImage:a3])
  {
    if (a5)
    {
      unsigned int v9 = @"Image decoding failed";
      goto LABEL_10;
    }
    return 0;
  }
  *(void *)&self->_nPrimarySurfaces = 0x100000001;
  self->_numMipMapLevels = 1;
  *(int8x8_t *)&self->_bindTarget = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(!self->_isCubeMap), 0x1FuLL)), (int8x8_t)vdup_n_s32(0xDE1u), (int8x8_t)0x851500008513);
  return v8;
}

- (BOOL)_uploadToGLTexture:(unsigned int)a3 data:(id)a4 width:(int)a5 height:(int)a6 dataCategory:(int)a7 cubeMapIndex:(int)a8 mipMapIndex:(int)a9 error:(id *)a10
{
  glBindTexture(self->_bindTarget, a3);
  label = self->_label;
  if (label) {
    glLabelObjectEXT(0x1702u, a3, 0, [(NSString *)label cStringUsingEncoding:1]);
  }
  glTexParameteri(self->_bindTarget, 0x2802u, 33071);
  glTexParameteri(self->_bindTarget, 0x2803u, 33071);
  glTexParameteri(self->_bindTarget, 0x2800u, 9729);
  if (self->_isMipmapped) {
    GLint v18 = 9987;
  }
  else {
    GLint v18 = 9729;
  }
  glTexParameteri(self->_bindTarget, 0x2801u, v18);
  if (a7 == 5)
  {
    glCompressedTexImage2D(self->_textureTarget + a8, a9, self->_internalFormat, a5, a6, 0, [a4 length], (const GLvoid *)objc_msgSend(a4, "bytes"));
  }
  else
  {
    GLint params = 0;
    glGetIntegerv(0xCF5u, &params);
    glPixelStorei(0xCF5u, self->_unpackAlignment);
    glTexImage2D(self->_textureTarget + a8, a9, self->_internalFormat, a5, a6, 0, self->_format, self->_type, (const GLvoid *)[a4 bytes]);
    glPixelStorei(0xCF5u, params);
  }
  uint64_t Error = glGetError();
  uint64_t v20 = Error;
  if (Error)
  {
    if (Error == 1281)
    {
      GLint v26 = 0;
      GLint v27 = 0;
      glGetIntegerv(0xD33u, &v27);
      glGetIntegerv(0x851Cu, &v26);
      if (self->_isCubeMap || v27 >= a5)
      {
        if (self->_isCubeMap || v27 >= a6)
        {
          if (a5 == a6 || !self->_isCubeMap)
          {
            if (self->_isCubeMap && v26 < a5) {
              BOOL v21 = @"Cube Map width / height are greater than GL_MAX_CUBE_MAP_TEXTURE_SIZE";
            }
            else {
              BOOL v21 = 0;
            }
            if (a7 == 5 && (!self->_isCubeMap || v26 >= a5))
            {
              if ([a4 length] == (a6 * a5 * self->_bitsPerPixel) >> 3) {
                BOOL v21 = 0;
              }
              else {
                BOOL v21 = @"Compressed texture image size is not consistent with the format, dimensions, and contents of the specified compressed image data.";
              }
            }
          }
          else
          {
            BOOL v21 = @"Cube Map width and height are not equal.";
          }
        }
        else
        {
          BOOL v21 = @"Texture height is greater than GL_MAX_TEXTURE_SIZE";
        }
      }
      else
      {
        BOOL v21 = @"Texture width is greater than GL_MAX_TEXTURE_SIZE";
      }
    }
    else
    {
      BOOL v21 = @"OpenGLES Error.";
    }
    uint64_t v22 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v20), @"GLKTextureLoaderGLErrorKey", v21, @"GLKTextureLoaderErrorKey", 0);
    if (a10)
    {
      uint64_t v23 = v22;
      if (a7 == 5) {
        uint64_t v24 = 7;
      }
      else {
        uint64_t v24 = 8;
      }
      *a10 = (id)_GLKTextureErrorWithCodeAndUserInfo(v24, v23);
    }
  }
  return v20 == 0;
}

- (BOOL)uploadToGLTexture:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (self->_requestIssuedForSRGB && ![(GLKTexture *)self canHonorSRGBrequest])
  {
    if (a4)
    {
      BOOL v10 = @"Incompatible decoded format for sRGB";
      uint64_t v11 = 18;
      goto LABEL_12;
    }
LABEL_54:
    LOBYTE(v13) = 0;
    return v13;
  }
  if ((self->_dataCategory | 2) == 7)
  {
    uint64_t v7 = [(NSData *)self->_imageData bytes];
    if (self->_dataCategory == 7
      && ([(GLKTexture *)self shouldApplyReorientToGL]
       || [(GLKTexture *)self shouldApplyPremultiplication]))
    {
      unsigned int v9 = (char *)malloc_type_malloc(self->_rowBytes * (unint64_t)self->_height, 0x92882F41uLL);
      if (!v9)
      {
        if (a4)
        {
          BOOL v10 = @"Failed to create intermediate operation buffer.";
          uint64_t v11 = 8;
LABEL_12:
          CFDictionaryRef v12 = (void *)_GLKTextureErrorWithCodeAndErrorString(v11, (uint64_t)v10);
          LOBYTE(v13) = 0;
          *a4 = v12;
          return v13;
        }
        goto LABEL_54;
      }
    }
    else
    {
      unsigned int v9 = 0;
    }
    unsigned int nPrimarySurfaces = self->_nPrimarySurfaces;
    if (nPrimarySurfaces)
    {
      uint64_t v15 = 0;
      uint64_t v16 = v7 + 52;
      unsigned int nSurfaces = self->_nSurfaces;
      while (!nSurfaces)
      {
LABEL_43:
        uint64_t v15 = (v15 + 1);
        if (v15 >= nPrimarySurfaces) {
          goto LABEL_44;
        }
      }
      unsigned int v18 = 0;
      *(void *)&long long v8 = *(void *)&self->_width;
      while (1)
      {
        uint64_t index = v15;
        if (self->_isCubeMap)
        {
          uint64_t index = v15;
          if (self->_nPrimarySurfaces == 1) {
            uint64_t index = self->_index;
          }
        }
        long long v34 = v8;
        if (self->_dataCategory == 5)
        {
          unsigned int internalFormat = self->_internalFormat;
          if (internalFormat == 35843)
          {
            double v22 = COERCE_DOUBLE(vshl_u32(*(uint32x2_t *)&v8, (uint32x2_t)0xFFFFFFFEFFFFFFFDLL));
            int v24 = 2;
            int v23 = 32;
          }
          else
          {
            BOOL v21 = internalFormat == 35842;
            double v22 = COERCE_DOUBLE(vshr_n_u32(*(uint32x2_t *)&v8, 2uLL));
            if (internalFormat == 35842) {
              int v23 = 16;
            }
            else {
              int v23 = 0;
            }
            if (internalFormat == 35842) {
              int v24 = 4;
            }
            else {
              int v24 = 0;
            }
            if (!v21) {
              double v22 = 0.0;
            }
          }
          int32x2_t v29 = (int32x2_t)vmax_u32(*(uint32x2_t *)&v22, (uint32x2_t)0x200000002);
          signed __int32 v28 = vmul_lane_s32(v29, v29, 1).u32[0] * ((v24 * v23) >> 3);
          v25 = v16;
        }
        else
        {
          v25 = v16;
          if (v9)
          {
            if ([(GLKTexture *)self shouldApplyReorientToGL]
              && !-[GLKTexture reorientToGL:source:withWidth:withHeight:withRowBytes:error:](self, "reorientToGL:source:withWidth:withHeight:withRowBytes:error:", v9, v16))
            {
              goto LABEL_53;
            }
            BOOL v26 = [(GLKTexture *)self shouldApplyPremultiplication];
            v25 = v9;
            *(void *)&long long v8 = v34;
            if (v26)
            {
              BOOL v27 = -[GLKTexture premultiplyWithAlpha:source:withWidth:withHeight:withRowBytes:error:](self, "premultiplyWithAlpha:source:withWidth:withHeight:withRowBytes:error:", v9, v16);
              *(void *)&long long v8 = v34;
              v25 = v9;
              if (!v27) {
                goto LABEL_53;
              }
            }
          }
          signed __int32 v28 = (vmul_lane_s32(*(int32x2_t *)&v8, *(int32x2_t *)&v8, 1).u32[0] * self->_bitsPerPixel) >> 3;
        }
        uint64_t v30 = v28;
        LODWORD(v33) = v18;
        if (!-[GLKTexture _uploadToGLTexture:data:width:height:dataCategory:cubeMapIndex:mipMapIndex:error:](self, "_uploadToGLTexture:data:width:height:dataCategory:cubeMapIndex:mipMapIndex:error:", v5, [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v25 length:v28 freeWhenDone:0], v34, DWORD1(v34), self->_dataCategory, index, v33, a4))break; {
        v16 += v30;
        }
        *((void *)&v8 + 1) = *((void *)&v34 + 1);
        *(uint32x2_t *)&long long v8 = vmax_u32(vshr_n_u32(*(uint32x2_t *)&v34, 1uLL), (uint32x2_t)0x100000001);
        ++v18;
        unsigned int nSurfaces = self->_nSurfaces;
        if (v18 >= nSurfaces)
        {
          unsigned int nPrimarySurfaces = self->_nPrimarySurfaces;
          goto LABEL_43;
        }
      }
      if (!v9) {
        goto LABEL_54;
      }
LABEL_53:
      free(v9);
      goto LABEL_54;
    }
LABEL_44:
    if (v9) {
      free(v9);
    }
LABEL_51:
    LOBYTE(v13) = 1;
    return v13;
  }
  if ((![(GLKTexture *)self shouldApplyReorientToGL]
     || (BOOL v13 = [(GLKTexture *)self reorientToGL:[(NSData *)[(GLKTexture *)self imageData] bytes] source:[(NSData *)[(GLKTexture *)self imageData] bytes] withWidth:self->_width withHeight:self->_height withRowBytes:self->_rowBytes error:a4]))&& (![(GLKTexture *)self shouldApplyPremultiplication]|| (BOOL v13 = [(GLKTexture *)self premultiplyWithAlpha:[(NSData *)[(GLKTexture *)self imageData] bytes] source:[(NSData *)[(GLKTexture *)self imageData] bytes] withWidth:self->_width withHeight:self->_height withRowBytes:self->_rowBytes error:a4])))
  {
    LODWORD(v33) = 0;
    BOOL v31 = [(GLKTexture *)self _uploadToGLTexture:v5 data:self->_imageData width:self->_width height:self->_height dataCategory:self->_dataCategory cubeMapIndex:self->_index mipMapIndex:v33 error:a4];
    LOBYTE(v13) = 0;
    if (v31) {
      goto LABEL_51;
    }
  }
  return v13;
}

- (BOOL)determineCGImageBlockFormatWithComponentType:(int)a3 andPixelSize:(unint64_t)a4 andColorModel:(int)a5
{
  if (a3 != 1) {
    return 0;
  }
  self->_type = 5121;
  if (a4 == 1)
  {
    if (self->_requestIssuedToInterpretGrayAsAlpha) {
      unsigned int v5 = 6406;
    }
    else {
      unsigned int v5 = 6409;
    }
    if (self->_requestIssuedToInterpretGrayAsAlpha) {
      int v9 = 23;
    }
    else {
      int v9 = 20;
    }
    unsigned int v7 = 8;
    unsigned int v8 = 1;
    unsigned int v6 = v5;
    goto LABEL_23;
  }
  if (a4 != 2)
  {
    if (a4 == 4)
    {
      if (self->_requestIssuedForSRGB) {
        unsigned int v5 = 35906;
      }
      else {
        unsigned int v5 = 6408;
      }
      if (self->_requestIssuedForSRGB) {
        unsigned int v6 = 35906;
      }
      else {
        unsigned int v6 = 32993;
      }
      unsigned int v7 = 32;
      unsigned int v8 = 4;
      int v9 = 2;
      goto LABEL_23;
    }
    return 0;
  }
  BOOL v10 = 0;
  if (!a5 && self->_hasAlpha)
  {
    unsigned int v7 = 16;
    unsigned int v8 = 2;
    int v9 = 14;
    unsigned int v5 = 6410;
    unsigned int v6 = 6410;
LABEL_23:
    self->_unsigned int internalFormat = v5;
    self->_format = v6;
    self->_texelFormat = v9;
    self->_nComponents = v8;
    BOOL v10 = 1;
    self->_bitsPerPixel = v7;
  }
  return v10;
}

- (BOOL)determinePVRFormat:(unsigned int)a3
{
  if ((a3 & 0xFFFFFFF7) == 0x12)
  {
    if (self->_requestIssuedForSRGB) {
      unsigned int v3 = 35906;
    }
    else {
      unsigned int v3 = 6408;
    }
    self->_unsigned int internalFormat = v3;
    unsigned int v4 = 4;
    int v5 = 1;
LABEL_6:
    int v6 = 5121;
    uint64_t v7 = 64;
    uint64_t v8 = 60;
  }
  else
  {
    BOOL v9 = 0;
    unsigned int v4 = 4;
    int v5 = 27;
    unsigned int v3 = 35842;
    uint64_t v7 = 60;
    uint64_t v8 = 56;
    int v6 = 35842;
    switch(a3)
    {
      case 0x10u:
        unsigned int v3 = 6408;
        int v5 = 4;
        self->_format = 6408;
        int v6 = 32819;
        goto LABEL_24;
      case 0x11u:
        unsigned int v3 = 6408;
        self->_format = 6408;
        int v5 = 3;
        int v6 = 32820;
        goto LABEL_24;
      case 0x12u:
      case 0x14u:
      case 0x1Au:
        return v9;
      case 0x13u:
        unsigned int v3 = 6407;
        unsigned int v4 = 3;
        self->_format = 6407;
        int v5 = 10;
        int v6 = 33635;
        goto LABEL_24;
      case 0x15u:
        if (self->_requestIssuedForSRGB) {
          unsigned int v3 = 35904;
        }
        else {
          unsigned int v3 = 6407;
        }
        self->_unsigned int internalFormat = v3;
        unsigned int v4 = 3;
        int v5 = 7;
        goto LABEL_6;
      case 0x16u:
        unsigned int v3 = 6409;
        unsigned int v4 = 1;
        self->_format = 6409;
        int v5 = 20;
        goto LABEL_22;
      case 0x17u:
        unsigned int v3 = 6410;
        unsigned int v4 = 2;
        self->_format = 6410;
        int v5 = 14;
        goto LABEL_22;
      case 0x18u:
        int v5 = 26;
        unsigned int v3 = 35843;
        uint64_t v7 = 60;
        uint64_t v8 = 56;
        int v6 = 35843;
        break;
      case 0x19u:
        break;
      case 0x1Bu:
        unsigned int v3 = 6406;
        unsigned int v4 = 1;
        self->_format = 6406;
        int v5 = 23;
LABEL_22:
        int v6 = 5121;
        goto LABEL_24;
      default:
        if (a3 == 50)
        {
          unsigned int v3 = 6408;
          unsigned int v4 = 4;
          self->_format = 6408;
          int v5 = 6;
          int v6 = 36193;
        }
        else
        {
          if (a3 != 53) {
            return v9;
          }
          unsigned int v3 = 6408;
          unsigned int v4 = 4;
          self->_format = 6408;
          int v5 = 5;
          int v6 = 5126;
        }
LABEL_24:
        uint64_t v7 = 64;
        uint64_t v8 = 56;
        break;
    }
  }
  *(_DWORD *)((char *)&self->super.isa + v8) = v3;
  *(_DWORD *)((char *)&self->super.isa + v7) = v6;
  self->_texelFormat = v5;
  BOOL v9 = 1;
  self->_nComponents = v4;
  return v9;
}

- (BOOL)reorientToGL:(void *)a3 source:(void *)a4 withWidth:(unsigned int)a5 withHeight:(unsigned int)a6 withRowBytes:(unsigned int)a7 error:(id *)a8
{
  src.data = a4;
  src.height = a6;
  src.width = a5;
  src.rowBytes = a7;
  dest.data = a3;
  dest.height = a6;
  dest.width = a5;
  dest.rowBytes = a7;
  unsigned int orientation = self->_orientation;
  if (orientation)
  {
    if (orientation != 1) {
      return 1;
    }
    unsigned int bitsPerPixel = self->_bitsPerPixel;
    HIDWORD(v11) = bitsPerPixel;
    LODWORD(v11) = bitsPerPixel - 8;
    BOOL v12 = 1;
    switch((v11 >> 3))
    {
      case 0u:
        goto LABEL_8;
      case 1u:
      case 2u:
      case 5u:
      case 7u:
      case 0xBu:
        if (bitsPerPixel >= 0x40) {
          char v13 = 5;
        }
        else {
          char v13 = 3;
        }
        dest.width = self->_width * (bitsPerPixel >> v13);
        src.width = dest.width;
        if (bitsPerPixel > 0x3F)
        {
          vImage_Error v14 = vImageVerticalReflect_PlanarF(&src, &dest, 0);
          if (!v14) {
            return 1;
          }
        }
        else
        {
LABEL_8:
          vImage_Error v14 = vImageVerticalReflect_Planar8(&src, &dest, 0);
          if (!v14) {
            return 1;
          }
        }
LABEL_15:
        if (!a8) {
          return 0;
        }
        uint64_t v15 = (__CFString *)[NSString stringWithFormat:@"Image reorientation failed, vImageError: %ld", v14];
        uint64_t v16 = 15;
        break;
      case 3u:
        vImage_Error v14 = vImageVerticalReflect_ARGB8888(&src, &dest, 0);
        if (!v14) {
          return 1;
        }
        goto LABEL_15;
      case 0xFu:
        vImage_Error v14 = vImageVerticalReflect_ARGBFFFF(&src, &dest, 0);
        if (!v14) {
          return 1;
        }
        goto LABEL_15;
      default:
        return v12;
    }
  }
  else
  {
    if (!a8) {
      return 0;
    }
    uint64_t v15 = @"Unsupported image orientation";
    uint64_t v16 = 14;
  }
  v17 = (void *)_GLKTextureErrorWithCodeAndErrorString(v16, (uint64_t)v15);
  BOOL v12 = 0;
  *a8 = v17;
  return v12;
}

- (BOOL)premultiplyWithAlpha:(void *)a3 source:(void *)a4 withWidth:(unsigned int)a5 withHeight:(unsigned int)a6 withRowBytes:(unsigned int)a7 error:(id *)a8
{
  BOOL v9 = a4;
  BOOL v10 = (__int16 *)a3;
  src.data = a4;
  src.height = a6;
  src.width = a5;
  src.rowBytes = a7;
  dest.data = a3;
  dest.height = a6;
  dest.width = a5;
  dest.rowBytes = a7;
  int texelFormat = self->_texelFormat;
  if (texelFormat > 4)
  {
    if (texelFormat == 5)
    {
      vImage_Error v13 = vImagePremultiplyData_RGBAFFFF(&src, &dest, 0);
      goto LABEL_17;
    }
    if (texelFormat == 14)
    {
      [(GLKTexture *)self rowBytes];
      [(GLKTexture *)self height];
      uint64_t v14 = 0;
      do
      {
        uint64_t v15 = &v10[v14];
        int v16 = HIBYTE(v9[v14]);
        *(unsigned char *)uint64_t v15 = LOBYTE(v9[v14]) * v16 / 0xFF;
        *((unsigned char *)v15 + 1) = v16;
        unsigned int v17 = [(GLKTexture *)self rowBytes];
        ++v14;
      }
      while ((v14 * 2) <= [(GLKTexture *)self height] * v17);
      goto LABEL_21;
    }
LABEL_20:
    NSLog(&cfstr_CannotApplyPre.isa, a2);
LABEL_21:
    BOOL result = 1;
    goto LABEL_22;
  }
  if ((texelFormat - 1) >= 2)
  {
    if (texelFormat == 3)
    {
      [(GLKTexture *)self rowBytes];
      [(GLKTexture *)self height];
      unsigned int v18 = 0;
      do
      {
        if (*v9) {
          __int16 v19 = *v10;
        }
        else {
          __int16 v19 = 0;
        }
        *v10++ = v19;
        ++v9;
        v18 += 4;
        unsigned int v20 = [(GLKTexture *)self rowBytes];
      }
      while (v18 <= [(GLKTexture *)self height] * v20);
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  vImage_Error v13 = vImagePremultiplyData_RGBA8888(&src, &dest, 0);
LABEL_17:
  vImage_Error v21 = v13;
  BOOL result = v13 == 0;
  if (a8 && v21)
  {
    int v23 = (void *)_GLKTextureErrorWithCodeAndErrorString(16, [NSString stringWithFormat:@"Alpha premultiplication failed, vImageError: %ld", v21]);
    BOOL result = 0;
    *a8 = v23;
  }
LABEL_22:
  self->_hasPremultipliedAlpha = result;
  return result;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (unsigned)GLTextureName
{
  return self->_GLTextureName;
}

- (void)setGLTextureName:(unsigned int)a3
{
  self->_GLTextureName = a3;
}

- (unsigned)bindTarget
{
  return self->_bindTarget;
}

- (void)setBindTarget:(unsigned int)a3
{
  self->_bindTarget = a3;
}

- (unsigned)textureTarget
{
  return self->_textureTarget;
}

- (void)setTextureTarget:(unsigned int)a3
{
  self->_textureTarget = a3;
}

- (unsigned)internalFormat
{
  return self->_internalFormat;
}

- (void)setInternalFormat:(unsigned int)a3
{
  self->_unsigned int internalFormat = a3;
}

- (unsigned)format
{
  return self->_format;
}

- (void)setFormat:(unsigned int)a3
{
  self->_format = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (int)texelFormat
{
  return self->_texelFormat;
}

- (void)setTexelFormat:(int)a3
{
  self->_int texelFormat = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  self->_height = a3;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_unsigned int orientation = a3;
}

- (unsigned)numMipMapLevels
{
  return self->_numMipMapLevels;
}

- (void)setNumMipMapLevels:(unsigned int)a3
{
  self->_numMipMapLevels = a3;
}

- (unsigned)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerPixel:(unsigned int)a3
{
  self->_unsigned int bitsPerPixel = a3;
}

- (unsigned)rowBytes
{
  return self->_rowBytes;
}

- (void)setRowBytes:(unsigned int)a3
{
  self->_rowBytes = a3;
}

- (unsigned)nComponents
{
  return self->_nComponents;
}

- (void)setNComponents:(unsigned int)a3
{
  self->_nComponents = a3;
}

- (unsigned)nPrimarySurfaces
{
  return self->_nPrimarySurfaces;
}

- (void)setNPrimarySurfaces:(unsigned int)a3
{
  self->_unsigned int nPrimarySurfaces = a3;
}

- (unsigned)nSurfaces
{
  return self->_nSurfaces;
}

- (void)setNSurfaces:(unsigned int)a3
{
  self->_unsigned int nSurfaces = a3;
}

- (int)loadMode
{
  return self->_loadMode;
}

- (void)setLoadMode:(int)a3
{
  self->_int loadMode = a3;
}

- (int)dataCategory
{
  return self->_dataCategory;
}

- (void)setDataCategory:(int)a3
{
  self->_dataCategory = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_uint64_t index = a3;
}

- (BOOL)requestIssuedForMipmapGeneration
{
  return self->_requestIssuedForMipmapGeneration;
}

- (BOOL)hasPremultipliedAlpha
{
  return self->_hasPremultipliedAlpha;
}

- (BOOL)isPowerOfTwo
{
  return self->_isPowerOfTwo;
}

- (void)setIsPowerOfTwo:(BOOL)a3
{
  self->_isPowerOfTwo = a3;
}

- (BOOL)isCubeMap
{
  return self->_isCubeMap;
}

- (void)setIsCubeMap:(BOOL)a3
{
  self->_isCubeMap = a3;
}

- (BOOL)isMipmapped
{
  return self->_isMipmapped;
}

- (void)setIsMipmapped:(BOOL)a3
{
  self->_isMipmapped = a3;
}

- (BOOL)isVerticalFlipped
{
  return self->_isVerticalFlipped;
}

- (void)setIsVerticalFlipped:(BOOL)a3
{
  self->_isVerticalFlipped = a3;
}

- (BOOL)hasAlpha
{
  return self->_hasAlpha;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->_hasAlpha = a3;
}

- (BOOL)reOrient
{
  return self->_reOrient;
}

- (void)setReOrient:(BOOL)a3
{
  self->_reOrient = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

@end