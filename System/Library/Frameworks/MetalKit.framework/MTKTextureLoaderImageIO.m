@interface MTKTextureLoaderImageIO
- (BOOL)decodeCGImage:(CGImage *)a3 options:(id)a4;
- (BOOL)decodeCGImageDataProvider:(CGImage *)a3 options:(id)a4;
- (BOOL)decodeCGImageImageProvider:(CGImage *)a3 CGImageProvider:(CGImageProvider *)a4 options:(id)a5;
- (BOOL)determineCGImageBlockFormatWithComponentType:(int)a3 alphaInfo:(unsigned int)a4 andPixelSizeBytes:(unint64_t)a5 andColorSpace:(CGColorSpace *)a6 isOptimized:(BOOL)a7 options:(id)a8;
- (MTKTextureLoaderImageIO)initWithCGImage:(CGImage *)a3 options:(id)a4 error:(id *)a5;
- (MTKTextureLoaderImageIO)initWithData:(id)a3 options:(id)a4 error:(id *)a5;
- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8;
- (void)dealloc;
@end

@implementation MTKTextureLoaderImageIO

- (BOOL)decodeCGImageDataProvider:(CGImage *)a3 options:(id)a4
{
  char BitmapInfo = CGImageGetBitmapInfo(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  int BitsPerPixel = CGImageGetBitsPerPixel(a3);
  int v10 = BitsPerPixel;
  if (BitsPerPixel != 32 && BitsPerPixel != 8 || ColorSpace && Model > kCGColorSpaceModelRGB) {
    goto LABEL_8;
  }
  self->_bytesPerRow = CGImageGetBytesPerRow(a3);
  [(MTKTextureLoaderData *)self setWidth:CGImageGetWidth(a3)];
  [(MTKTextureLoaderData *)self setHeight:CGImageGetHeight(a3)];
  if (v10 == 8)
  {
    if ((BitmapInfo & 0x1F) == 7 || ColorSpace == 0) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 10;
    }
LABEL_16:
    [(MTKTextureLoaderData *)self setPixelFormat:v12];
LABEL_17:
    [(MTKTextureLoaderData *)self pixelFormat];
    MTLPixelFormatGetInfoForDevice();
    *(_OWORD *)&self->_pixelFormatInfo.name = v17;
    *(_OWORD *)&self->_pixelFormatInfo.castClass = v18;
    *(_OWORD *)&self->_pixelFormatInfo.type.compressed.blockWidth = v19;
    self->_pixelFormatInfo.type.normal.pixelBytesRenderMSAA = v20;
    DataProvider = CGImageGetDataProvider(a3);
    v11 = CGDataProviderCopyData(DataProvider);
    self->_cfData = v11;
    if (v11)
    {
      BytePtr = CFDataGetBytePtr(v11);
      if (BytePtr)
      {
        self->_imageData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytesNoCopy:length:freeWhenDone:", BytePtr, self->_bytesPerRow * -[MTKTextureLoaderData height](self, "height"), 0);
        LOBYTE(v11) = 1;
      }
      else
      {
        CFRelease(self->_cfData);
        LOBYTE(v11) = 0;
        self->_cfData = 0;
      }
    }
    return (char)v11;
  }
  if (v10 != 32)
  {
LABEL_8:
    LOBYTE(v11) = 0;
    return (char)v11;
  }
  [(MTKTextureLoaderData *)self setPixelFormat:70];
  LOBYTE(v11) = 0;
  uint64_t v12 = 80;
  switch(BitmapInfo & 0x1F)
  {
    case 0:
      return (char)v11;
    case 2:
    case 4:
    case 6:
      goto LABEL_16;
    default:
      goto LABEL_17;
  }
  return (char)v11;
}

- (BOOL)decodeCGImageImageProvider:(CGImage *)a3 CGImageProvider:(CGImageProvider *)a4 options:(id)a5
{
  ColorSpace = (CGColorSpace *)CGImageProviderGetColorSpace();
  if (CGColorSpaceGetModel(ColorSpace) > kCGColorSpaceModelRGB)
  {
    v9 = 0;
    goto LABEL_16;
  }
  CGImageProviderGetSize();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  v9 = Mutable;
  if (Mutable)
  {
    v11 = (const void *)*MEMORY[0x263EFFB40];
    CFDictionarySetValue(Mutable, @"kCGImageBlockSingletonRequest", (const void *)*MEMORY[0x263EFFB40]);
    CGImageGetBitsPerPixel(a3);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
    uint64_t AlphaInfo = CGImageGetAlphaInfo(a3);
    CGImageGetBitmapInfo(a3);
    if (BitsPerComponent == 8)
    {
      CFDictionarySetValue(v9, @"kCGImageBlockIOSurfaceOptimizedRequest", v11);
      CFDictionarySetValue(v9, @"kCGImageBlockFormatRequest", @"kCGImageBlockFormatBGRx8");
    }
    v14 = (CGImageBlockSet *)CGImageProviderCopyImageBlockSetWithOptions();
    self->_blockSet = v14;
    if (v14)
    {
      if (CGImageBlockSetGetCount() == 1)
      {
        BOOL v15 = BitsPerComponent == 8;
        CGImageBlockSetGetImageBlock();
        CGImageBlockGetRect();
        double v17 = v16;
        [(MTKTextureLoaderData *)self setWidth:(unint64_t)v18];
        [(MTKTextureLoaderData *)self setHeight:(unint64_t)v17];
        self->_bytesPerRow = CGImageBlockGetBytesPerRow();
        Data = (char *)CGImageBlockGetData();
        uint64_t ComponentType = CGImageBlockSetGetComponentType();
        unsigned int PixelSize = CGImageBlockSetGetPixelSize();
        size_t v21 = v15 && PixelSize == 3 ? 4 : PixelSize;
        if ([(MTKTextureLoaderImageIO *)self determineCGImageBlockFormatWithComponentType:ComponentType alphaInfo:AlphaInfo andPixelSizeBytes:v21 andColorSpace:ColorSpace isOptimized:v15 options:a5])
        {
          BOOL expandRGBToRGBA = self->_expandRGBToRGBA;
          if (!self->_expandRGBToRGBA)
          {
            v26 = Data;
LABEL_22:
            if ((_mtkLinkedOnOrAfter(0) & 1) != 0
              || (__CFString *)[(MTKTextureLoaderData *)self imageOrigin] == @"MTKTextureLoaderOriginBottomLeft")
            {
              id v30 = objc_alloc(MEMORY[0x263EFF8F8]);
              unint64_t v31 = self->_bytesPerRow * [(MTKTextureLoaderData *)self height];
              v32 = v30;
              v33 = v26;
              BOOL v34 = expandRGBToRGBA;
            }
            else
            {
              v29 = malloc_type_malloc(self->_bytesPerRow * [(MTKTextureLoaderData *)self height], 0x77A72E94uLL);
              reflectImage(v26, v29, [(MTKTextureLoaderData *)self width], [(MTKTextureLoaderData *)self height], self->_bytesPerRow, 8 * self->_pixelFormatInfo.type.normal.pixelBytes, self->_pixelFormatInfo.type.normal.componentCount);
              if (expandRGBToRGBA)
              {
                free(v26);
              }
              else
              {
                CGImageBlockSetRelease();
                self->_blockSet = 0;
              }
              id v35 = objc_alloc(MEMORY[0x263EFF8F8]);
              unint64_t v31 = self->_bytesPerRow * [(MTKTextureLoaderData *)self height];
              v32 = v35;
              v33 = (char *)v29;
              BOOL v34 = 1;
            }
            self->_imageData = (NSData *)[v32 initWithBytesNoCopy:v33 length:v31 freeWhenDone:v34];
            BOOL v27 = 1;
            goto LABEL_19;
          }
          int v23 = ComponentType - 2;
          if ((ComponentType - 2) >= 4) {
            -[MTKTextureLoaderImageIO decodeCGImageImageProvider:CGImageProvider:options:]();
          }
          uint64_t v36 = qword_2156B2888[v23];
          size_t v24 = qword_2156B28A8[v23];
          v25 = (char *)malloc_type_malloc(4* v24* [(MTKTextureLoaderData *)self height]* [(MTKTextureLoaderData *)self width], 0x7055CC3FuLL);
          if (::expandRGBToRGBA(Data, v25, [(MTKTextureLoaderData *)self width], [(MTKTextureLoaderData *)self height], self->_bytesPerRow, v21, v24, v36))
          {
            self->_bytesPerRow = 4 * v24 * [(MTKTextureLoaderData *)self width];
            CGImageBlockSetRelease();
            self->_blockSet = 0;
            v26 = v25;
            goto LABEL_22;
          }
        }
      }
    }
  }
LABEL_16:
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  BOOL v27 = 0;
  BOOL result = 0;
  if (v9)
  {
LABEL_19:
    CFRelease(v9);
    return v27;
  }
  return result;
}

- (BOOL)determineCGImageBlockFormatWithComponentType:(int)a3 alphaInfo:(unsigned int)a4 andPixelSizeBytes:(unint64_t)a5 andColorSpace:(CGColorSpace *)a6 isOptimized:(BOOL)a7 options:(id)a8
{
  BOOL v9 = a7;
  self->_BOOL expandRGBToRGBA = 0;
  CGColorSpaceRef v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  int v15 = 0;
  if (_mtkLinkedOnOrAfter(0)) {
    int v15 = CFEqual(a6, v14) != 0;
  }
  CFRelease(v14);
  if ([a8 objectForKey:@"MTKTextureLoaderOptionSRGB"]) {
    int v15 = objc_msgSend((id)objc_msgSend(a8, "objectForKey:", @"MTKTextureLoaderOptionSRGB"), "BOOLValue");
  }
  switch(a3)
  {
    case 1:
      if (a5 == 1)
      {
        double v16 = self;
        if (v15) {
          uint64_t v17 = 11;
        }
        else {
          uint64_t v17 = 10;
        }
        goto LABEL_41;
      }
      if (a5 == 2)
      {
        double v16 = self;
        if (v15) {
          uint64_t v17 = 31;
        }
        else {
          uint64_t v17 = 30;
        }
        goto LABEL_41;
      }
      if (a5 != 4) {
        return 0;
      }
      if (v9)
      {
        double v16 = self;
        if (v15) {
          uint64_t v17 = 81;
        }
        else {
          uint64_t v17 = 80;
        }
LABEL_41:
        [(MTKTextureLoaderData *)v16 setPixelFormat:v17];
      }
LABEL_42:
      [(MTKTextureLoaderData *)self pixelFormat];
      MTLPixelFormatGetInfoForDevice();
      *(_OWORD *)&self->_pixelFormatInfo.name = v23;
      *(_OWORD *)&self->_pixelFormatInfo.castClass = v24;
      *(_OWORD *)&self->_pixelFormatInfo.type.compressed.blockWidth = v25;
      self->_pixelFormatInfo.type.normal.pixelBytesRenderMSAA = v26;
      return self->_pixelFormatInfo.flags & 1;
    case 2:
      BOOL result = 0;
      switch(a5)
      {
        case 2uLL:
          double v16 = self;
          uint64_t v17 = 20;
          goto LABEL_41;
        case 4uLL:
          double v16 = self;
          uint64_t v17 = 60;
          goto LABEL_41;
        case 6uLL:
          size_t v21 = self;
          uint64_t v22 = 110;
          goto LABEL_36;
        case 8uLL:
          double v16 = self;
          uint64_t v17 = 110;
          goto LABEL_41;
        default:
          return result;
      }
      return result;
    case 3:
      *((void *)&v19 + 1) = a5;
      *(void *)&long long v19 = a5 - 4;
      switch((unint64_t)(v19 >> 2))
      {
        case 0uLL:
          double v16 = self;
          uint64_t v17 = 53;
          goto LABEL_41;
        case 1uLL:
          double v16 = self;
          uint64_t v17 = 103;
          goto LABEL_41;
        case 2uLL:
          size_t v21 = self;
          uint64_t v22 = 123;
          goto LABEL_36;
        case 3uLL:
          double v16 = self;
          uint64_t v17 = 123;
          goto LABEL_41;
        default:
          return 0;
      }
    case 4:
      *((void *)&v20 + 1) = a5;
      *(void *)&long long v20 = a5 - 4;
      switch((unint64_t)(v20 >> 2))
      {
        case 0uLL:
          double v16 = self;
          uint64_t v17 = 55;
          goto LABEL_41;
        case 1uLL:
          double v16 = self;
          uint64_t v17 = 105;
          goto LABEL_41;
        case 2uLL:
          size_t v21 = self;
          uint64_t v22 = 125;
          goto LABEL_36;
        case 3uLL:
          double v16 = self;
          uint64_t v17 = 125;
          goto LABEL_41;
        default:
          return 0;
      }
    case 5:
      BOOL result = 0;
      switch(a5)
      {
        case 2uLL:
          double v16 = self;
          uint64_t v17 = 25;
          goto LABEL_41;
        case 4uLL:
          double v16 = self;
          uint64_t v17 = 65;
          goto LABEL_41;
        case 6uLL:
          size_t v21 = self;
          uint64_t v22 = 115;
LABEL_36:
          [(MTKTextureLoaderData *)v21 setPixelFormat:v22];
          self->_BOOL expandRGBToRGBA = 1;
          goto LABEL_42;
        case 8uLL:
          double v16 = self;
          uint64_t v17 = 115;
          goto LABEL_41;
        default:
          return result;
      }
      return result;
    default:
      return 0;
  }
}

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  unint64_t bytesPerRow = self->_bytesPerRow;
  unint64_t v13 = [(MTKTextureLoaderData *)self height] * bytesPerRow;
  *a7 = self->_bytesPerRow;
  *a8 = v13;
  CGColorSpaceRef v14 = (void *)MEMORY[0x263EFF8F8];
  int v15 = [(NSData *)self->_imageData bytes] + v13 * a4;

  return (id)[v14 dataWithBytesNoCopy:v15 length:v13 freeWhenDone:0];
}

- (MTKTextureLoaderImageIO)initWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  v24.receiver = self;
  v24.super_class = (Class)MTKTextureLoaderImageIO;
  v8 = [(MTKTextureLoaderData *)&v24 init];
  if (v8)
  {
    CGImageSourceRef v9 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
    if (!v9)
    {
      if (a5) {
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"Image decoding failed");
      }

      return 0;
    }
    int v10 = v9;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    if (!Mutable)
    {
      if (a5) {
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"Image decoding failed");
      }

      goto LABEL_40;
    }
    CFDictionaryRef v12 = Mutable;
    CFDictionarySetValue(Mutable, @"kCGImageBlockIOSurfaceOptimizedRequest", (const void *)*MEMORY[0x263EFFB40]);
    CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(v10, 0, v12);
    if (!v13)
    {
      if (a5) {
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"Image decoding failed");
      }

      goto LABEL_39;
    }
    CFDictionaryRef v14 = v13;
    int v15 = (const void *)*MEMORY[0x263F0F4C8];
    if (CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x263F0F4C8]))
    {
      uint64_t v16 = objc_msgSend((id)CFDictionaryGetValue(v14, v15), "integerValue");
      if (v16 == 1)
      {
        uint64_t v17 = &MTKTextureLoaderOriginTopLeft;
      }
      else
      {
        if (v16 != 4)
        {
          if (a5)
          {
            size_t v21 = @"Unsupported image orientation";
            goto LABEL_32;
          }
LABEL_33:

LABEL_38:
          CFRelease(v14);
LABEL_39:
          CFRelease(v12);
LABEL_40:
          CFRelease(v10);
          return 0;
        }
        uint64_t v17 = &MTKTextureLoaderOriginBottomLeft;
      }
      [(MTKTextureLoaderData *)v8 setImageOrigin:*v17];
    }
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, v12);
    if (ImageAtIndex)
    {
      long long v19 = ImageAtIndex;
      if ([(MTKTextureLoaderImageIO *)v8 decodeCGImage:ImageAtIndex options:a4])
      {
        if (![a4 objectForKey:@"MTKTextureLoaderOptionCubeLayout"])
        {
LABEL_25:
          CGImageRelease(v19);
          CFRelease(v14);
          CFRelease(v12);
          CFRelease(v10);
          return v8;
        }
        uint64_t v20 = [(MTKTextureLoaderData *)v8 height];
        if (v20 == 6 * [(MTKTextureLoaderData *)v8 width])
        {
          [(MTKTextureLoaderData *)v8 setHeight:[(MTKTextureLoaderData *)v8 width]];
          [(MTKTextureLoaderData *)v8 setNumFaces:6];
          [(MTKTextureLoaderData *)v8 setTextureType:5];
          goto LABEL_25;
        }
        if (!a5) {
          goto LABEL_37;
        }
        uint64_t v22 = @"Image height must be six times the image width for a vertical cubemap texture";
      }
      else
      {
        if (!a5)
        {
LABEL_37:

          CGImageRelease(v19);
          goto LABEL_38;
        }
        uint64_t v22 = @"Image decoding failed";
      }
      *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v22);
      goto LABEL_37;
    }
    if (a5)
    {
      size_t v21 = @"Image decoding failed";
LABEL_32:
      *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v21);
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  return v8;
}

- (MTKTextureLoaderImageIO)initWithCGImage:(CGImage *)a3 options:(id)a4 error:(id *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)MTKTextureLoaderImageIO;
  v8 = [(MTKTextureLoaderData *)&v11 init];
  CGImageSourceRef v9 = v8;
  if (v8)
  {
    if (![(MTKTextureLoaderImageIO *)v8 decodeCGImage:a3 options:a4])
    {
      CGImageSourceRef v9 = 0;
      if (a5) {
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, @"Image decoding failed");
      }
    }
  }
  return v9;
}

- (BOOL)decodeCGImage:(CGImage *)a3 options:(id)a4
{
  uint64_t ImageProvider = CGImageGetImageProvider();
  if (ImageProvider)
  {
    return [(MTKTextureLoaderImageIO *)self decodeCGImageImageProvider:a3 CGImageProvider:ImageProvider options:a4];
  }
  else
  {
    return [(MTKTextureLoaderImageIO *)self decodeCGImageDataProvider:a3 options:a4];
  }
}

- (void)dealloc
{
  self->_imageData = 0;
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  cfData = self->_cfData;
  if (cfData)
  {
    CFRelease(cfData);
    self->_cfData = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MTKTextureLoaderImageIO;
  [(MTKTextureLoaderData *)&v4 dealloc];
}

- (void)decodeCGImageImageProvider:CGImageProvider:options:.cold.1()
{
}

@end