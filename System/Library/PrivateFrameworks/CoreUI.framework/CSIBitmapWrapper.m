@interface CSIBitmapWrapper
- (BOOL)allowsCompactCompression;
- (BOOL)allowsDeepmap2ImageCompression;
- (BOOL)allowsDeepmapImageCompression;
- (BOOL)allowsHevcCompression;
- (BOOL)allowsMultiPassEncoding;
- (BOOL)allowsOptimalRowbytesPacking;
- (BOOL)allowsPaletteImageCompression;
- (BOOL)flipped;
- (CGContext)bitmapContext;
- (CGImageRef)destImage;
- (CSIBitmapWrapper)initWithCGImage:(CGImage *)a3 width:(unsigned int)a4 height:(unsigned int)a5 texturePixelFormat:(int64_t)a6;
- (CSIBitmapWrapper)initWithPixelWidth:(unsigned int)a3 pixelHeight:(unsigned int)a4;
- (NSString)name;
- (double)compressionQuality;
- (id)compressedData:(BOOL)a3 usedEncoding:(int *)a4 andRowChunkSize:(unsigned int *)a5;
- (id)pixelData;
- (int)exifOrientation;
- (int64_t)compressionType;
- (int64_t)targetPlatform;
- (int64_t)textureInterpretation;
- (unint64_t)colorSpaceID;
- (unint64_t)rowbytes;
- (unsigned)height;
- (unsigned)pixelFormat;
- (unsigned)sourceAlphaInfo;
- (unsigned)width;
- (void)dealloc;
- (void)setAllowsCompactCompression:(BOOL)a3;
- (void)setAllowsDeepmap2ImageCompression:(BOOL)a3;
- (void)setAllowsDeepmapImageCompression:(BOOL)a3;
- (void)setAllowsHevcCompression:(BOOL)a3;
- (void)setAllowsMultiPassEncoding:(BOOL)a3;
- (void)setAllowsOptimalRowbytesPacking:(BOOL)a3;
- (void)setAllowsPaletteImageCompression:(BOOL)a3;
- (void)setColorSpaceID:(unint64_t)a3;
- (void)setCompressionQuality:(double)a3;
- (void)setCompressionType:(int64_t)a3;
- (void)setExifOrientation:(int)a3;
- (void)setFlipped:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPixelData:(id)a3;
- (void)setPixelFormat:(unsigned int)a3;
- (void)setRowbytes:(unint64_t)a3;
- (void)setSourceAlphaInfo:(unsigned int)a3;
- (void)setTargetPlatform:(int64_t)a3;
- (void)setTextureInterpretation:(int64_t)a3;
@end

@implementation CSIBitmapWrapper

- (CSIBitmapWrapper)initWithPixelWidth:(unsigned int)a3 pixelHeight:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSIBitmapWrapper;
  result = [(CSIBitmapWrapper *)&v7 init];
  if (result)
  {
    result->_colorSpaceID = 1;
    result->_pixelFormat = 1095911234;
    result->_width = a3;
    result->_height = a4;
    *(_WORD *)&result->_allowsMultiPassEncoding = 257;
    *(_DWORD *)&result->_allowsPaletteImageCompression = 0;
    result->_imageAlpha = 2;
  }
  return result;
}

- (CSIBitmapWrapper)initWithCGImage:(CGImage *)a3 width:(unsigned int)a4 height:(unsigned int)a5 texturePixelFormat:(int64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CSIBitmapWrapper;
  v10 = [(CSIBitmapWrapper *)&v14 init];
  v11 = (CSIBitmapWrapper *)v10;
  if (v10)
  {
    *((_DWORD *)v10 + 7) = a4;
    *((_DWORD *)v10 + 8) = a5;
    *((_WORD *)v10 + 24) = 257;
    *(_DWORD *)(v10 + 51) = 0;
    v12 = CGImageRetain(a3);
    v11->_sourceImage = v12;
    v11->_destImage = 0;
    v11->_texturePixelFormat = a6;
    v11->_imageAlpha = CGImageGetAlphaInfo(v12);
  }
  return v11;
}

- (void)dealloc
{
  bitmapContext = self->_bitmapContext;
  if (bitmapContext) {
    CFRelease(bitmapContext);
  }
  sourceImage = self->_sourceImage;
  if (sourceImage) {
    CFRelease(sourceImage);
  }
  destImage = self->_destImage;
  if (destImage && destImage != self->_sourceImage) {
    CFRelease(destImage);
  }
  v6.receiver = self;
  v6.super_class = (Class)CSIBitmapWrapper;
  [(CSIBitmapWrapper *)&v6 dealloc];
}

- (unsigned)height
{
  return self->_height;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setRowbytes:(unint64_t)a3
{
  self->_rowbytes = a3;
}

- (unint64_t)rowbytes
{
  return self->_rowbytes;
}

- (CGContext)bitmapContext
{
  if (self->_sourceImage) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CSIGenerator.m" lineNumber:2125 description:@"can't use a sourceImage and request a bitmapContext at the same time"];
  }
  result = self->_bitmapContext;
  if (!result)
  {
    unsigned int v11 = (self->_imageAlpha < 7) & (0x61u >> self->_imageAlpha);
    signed int pixelFormat = self->_pixelFormat;
    if (pixelFormat > 1195456543)
    {
      if (pixelFormat != 1195456544)
      {
        if (pixelFormat == 1380401751)
        {
          unint64_t colorSpaceID = self->_colorSpaceID;
          if (v11) {
            int v19 = 4101;
          }
          else {
            int v19 = 4097;
          }
          BOOL v13 = colorSpaceID == 4;
          uint64_t v14 = v19 | ((colorSpaceID == 4) << 8);
          goto LABEL_32;
        }
LABEL_28:
        _CUILog(4, (uint64_t)"Unsupported CSIGenerator pixel format: %d", v2, v3, v4, v5, v6, v7, self->_pixelFormat);
        return 0;
      }
      if (v11)
      {
        uint64_t v14 = 0;
        CFStringRef v16 = kCGColorSpaceGenericGrayGamma2_2;
        int v17 = 1;
LABEL_40:
        uint64_t v22 = 8;
        goto LABEL_41;
      }
      CFStringRef v16 = kCGColorSpaceSRGB;
      uint64_t v14 = 8194;
    }
    else
    {
      if (pixelFormat != 1095911234)
      {
        if (pixelFormat == 1195454774)
        {
          BOOL v13 = self->_colorSpaceID == 6;
          if (v11)
          {
            if (self->_colorSpaceID == 6) {
              uint64_t v14 = 4352;
            }
            else {
              uint64_t v14 = 4096;
            }
            v15 = &kCGColorSpaceExtendedGray;
            if (self->_colorSpaceID != 6) {
              v15 = &kCGColorSpaceGenericGrayGamma2_2;
            }
            CFStringRef v16 = *v15;
            int v17 = 2;
LABEL_35:
            uint64_t v22 = 16;
LABEL_41:
            v23 = CGColorSpaceCreateWithName(v16);
            unsigned int v24 = [(CSIBitmapWrapper *)self allowsOptimalRowbytesPacking];
            unsigned int width = self->_width;
            size_t AlignedBytesPerRow = width * v17;
            if (v24)
            {
              size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
              unsigned int width = self->_width;
            }
            v27 = CGBitmapContextCreate(0, width, self->_height, v22, AlignedBytesPerRow, v23, v14);
            self->_bitmapContext = v27;
            if (!v27) {
              [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CSIGenerator.m", 2242, @"CoreUI: Unable to create bitmap context for distill output target with _width %d _height %d PixelFormat: %d, ColorSpace: %@, BitsPerComponent: %d, bitmapInfo: %d", self->_width, self->_height, self->_pixelFormat, v23, v22, v14 object file lineNumber description];
            }
            CGColorSpaceRelease(v23);
            unsigned int v28 = [(CSIBitmapWrapper *)self flipped];
            result = self->_bitmapContext;
            if (v28)
            {
              LODWORD(v29) = self->_height;
              CGContextTranslateCTM(result, 0.0, (double)v29);
              CGContextScaleCTM(self->_bitmapContext, 1.0, -1.0);
              return self->_bitmapContext;
            }
            return result;
          }
          if (self->_colorSpaceID == 6) {
            uint64_t v14 = 4353;
          }
          else {
            uint64_t v14 = 4097;
          }
LABEL_32:
          v21 = &kCGColorSpaceExtendedSRGB;
          if (!v13) {
            v21 = &kCGColorSpaceDisplayP3;
          }
          CFStringRef v16 = *v21;
          int v17 = 8;
          goto LABEL_35;
        }
        goto LABEL_28;
      }
      if ((v11 & [(CSIBitmapWrapper *)self allowsMultiPassEncoding]) != 0) {
        uint64_t v14 = 8198;
      }
      else {
        uint64_t v14 = 8194;
      }
      if (self->_colorSpaceID == 3) {
        v20 = &kCGColorSpaceDisplayP3;
      }
      else {
        v20 = &kCGColorSpaceSRGB;
      }
      CFStringRef v16 = *v20;
    }
    int v17 = 4;
    goto LABEL_40;
  }
  return result;
}

- (void)setSourceAlphaInfo:(unsigned int)a3
{
  self->_imageAlpha = a3;
}

- (unsigned)sourceAlphaInfo
{
  return self->_imageAlpha;
}

- (void)setPixelData:(id)a3
{
  pixelData = self->_pixelData;
  if (pixelData != a3)
  {

    self->_pixelData = (NSData *)a3;
  }
}

- (id)pixelData
{
  if (self->_pixelData) {
    return self->_pixelData;
  }
  sourceImage = self->_sourceImage;
  if (sourceImage)
  {
    LODWORD(v2) = self->_width;
    LODWORD(v3) = self->_height;
    self->_pixelData = (NSData *)CUIConvertImageToPixelFormat(sourceImage, self->_flipped, self->_exifOrientation, self->_textureInterpretation, self->_texturePixelFormat, &self->_rowbytes, (double)v2, (double)v3);
    return self->_pixelData;
  }
  uint64_t v7 = [(CSIBitmapWrapper *)self bitmapContext];
  if (!v7) {
    return self->_pixelData;
  }
  v8 = v7;
  unsigned int pixelFormat = self->_pixelFormat;
  if (pixelFormat != 1195456544 && pixelFormat != 1195454774)
  {
    size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v7);
    size_t v30 = CGBitmapContextGetHeight(v8) * BytesPerRow;
    self->_pixelData = (NSData *)[objc_alloc((Class)NSData) initWithBytesNoCopy:CGBitmapContextGetData(v8) length:v30 freeWhenDone:0];
    self->_rowbytes = CGBitmapContextGetBytesPerRow(v8);
    return self->_pixelData;
  }
  v34.data = 0;
  Image = CGBitmapContextCreateImage(v7);
  __int16 BitmapInfo = CGImageGetBitmapInfo(Image);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(Image);
  BOOL v13 = (CFStringRef *)&kCGColorSpaceExtendedGray;
  int v14 = BitmapInfo & 0x100;
  if ((BitmapInfo & 0x100) == 0) {
    BOOL v13 = (CFStringRef *)&kCGColorSpaceGenericGrayGamma2_2;
  }
  v15 = CGColorSpaceCreateWithName(*v13);
  BOOL v16 = BitsPerComponent > 8;
  if (BitsPerComponent <= 8) {
    uint32_t v17 = 8;
  }
  else {
    uint32_t v17 = 16;
  }
  if (v16) {
    uint32_t v18 = 32;
  }
  else {
    uint32_t v18 = 16;
  }
  if (v16) {
    int v19 = 4097;
  }
  else {
    int v19 = 12289;
  }
  CGBitmapInfo v20 = v19 | v14;
  v34.height = CGImageGetHeight(Image);
  v34.unsigned int width = CGImageGetWidth(Image);
  v34.rowBytes = CGBitmapGetAlignedBytesPerRow();
  ColorSpace = CGBitmapContextGetColorSpace(v8);
  v33.bitsPerComponent = v17;
  v33.bitsPerPixel = v18;
  v33.colorSpace = v15;
  v33.bitmapInfo = v20;
  memset(&v33.version, 0, 20);
  vImage_Error v22 = CUIConvertCGImageFormat(Image, ColorSpace, &v33, &v34);
  CGColorSpaceRelease(v15);
  self->_rowbytes = v34.rowBytes;
  CFRelease(Image);
  if (!v22)
  {
    id v31 = objc_alloc((Class)NSData);
    self->_pixelData = (NSData *)[v31 initWithBytes:v34.data length:v34.height * v34.rowBytes];
    if (v34.data) {
      CGBitmapFreeData();
    }
    return self->_pixelData;
  }
  _CUILog(4, (uint64_t)"CoreUI: Unable to create convert image to 16 Gray scale .", v23, v24, v25, v26, v27, v28, v32);
  return 0;
}

- (CGImageRef)destImage
{
  if (result)
  {
    v1 = result;
    result = (CGImageRef)*((void *)result + 8);
    if (!result)
    {
      result = (CGImageRef)v1[7];
      if (!result) {
        result = CGBitmapContextCreateImage((CGContextRef)[v1 bitmapContext]);
      }
      v1[8] = result;
    }
  }
  return result;
}

- (BOOL)allowsMultiPassEncoding
{
  return self->_allowsMultiPassEncoding;
}

- (void)setAllowsMultiPassEncoding:(BOOL)a3
{
  self->_allowsMultiPassEncoding = a3;
  if (__coreThemeLoggingEnabled) {
    _CUILog(1, (uint64_t)"CoreUI(DEBUG) setting allowsMultiPassEncoding to %d", a3, v3, v4, v5, v6, v7, a3);
  }
}

- (BOOL)allowsOptimalRowbytesPacking
{
  return self->_allowsOptimalRowbytesPacking;
}

- (void)setAllowsOptimalRowbytesPacking:(BOOL)a3
{
  self->_allowsOptimalRowbytesPacking = a3;
  if (__coreThemeLoggingEnabled) {
    _CUILog(1, (uint64_t)"CoreUI(DEBUG) setting allowsOptimalRowbytesPacking to %d", a3, v3, v4, v5, v6, v7, a3);
  }
}

- (BOOL)allowsCompactCompression
{
  return self->_allowsCompactCompression;
}

- (void)setAllowsCompactCompression:(BOOL)a3
{
  self->_allowsCompactCompression = a3;
  if (__coreThemeLoggingEnabled) {
    _CUILog(1, (uint64_t)"CoreUI(DEBUG) setting allowsCompactCompression to %d", a3, v3, v4, v5, v6, v7, a3);
  }
}

- (id)compressedData:(BOOL)a3 usedEncoding:(int *)a4 andRowChunkSize:(unsigned int *)a5
{
  if (![(CSIBitmapWrapper *)self width]
    && ![(CSIBitmapWrapper *)self width]
    && [(CSIBitmapWrapper *)self pixelData]
    && [(CSIBitmapWrapper *)self pixelFormat] == 1346651680)
  {
    *a5 = 0;
    *a4 = 0;
    id v22 = [(CSIBitmapWrapper *)self pixelData];
    return +[NSArray arrayWithObject:v22];
  }
  v10 = [(CSIBitmapWrapper *)self pixelData];
  CFStreamPropertyKey propertyName = [(NSData *)v10 length];
  unsigned int v11 = [(CSIBitmapWrapper *)self height];
  unsigned int v12 = [(CSIBitmapWrapper *)self width];
  uint64_t v166 = [(NSData *)v10 length];
  Data = [(NSData *)v10 bytes];
  unint64_t rowbytes = self->_rowbytes;
  if (!rowbytes)
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CSIGenerator.m" lineNumber:2448 description:@"Row Bytes MUST be set"];
    unint64_t rowbytes = self->_rowbytes;
  }
  size_t v14 = v12;
  if (!a3) {
    [(CSIBitmapWrapper *)self setCompressionType:1];
  }
  unsigned int v173 = 0;
  __int16 v172 = 0;
  unsigned int v171 = 0;
  size_t v170 = 0;
  uint32_t v17 = 0;
  uint32_t v18 = &OBJC_IVAR___CUIThemeSchemaRendition__image;
  switch([(CSIBitmapWrapper *)self compressionType])
  {
    case 0:
    case 2:
      goto LABEL_41;
    case 1:
      *a5 = v11;
      uint32_t v17 = +[NSArray arrayWithObject:v10];
      goto LABEL_16;
    case 3:
      goto LABEL_23;
    case 4:
    case 5:
      int v19 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
      CGBitmapInfo v20 = CUIImageCompressedWithATECompression(v19, [(CSIBitmapWrapper *)self compressionType], [(CSIBitmapWrapper *)self targetPlatform], &v173, &v171, &v172);
      if (!v20) {
        goto LABEL_23;
      }
      v21 = v20;
      [(CSIBitmapWrapper *)self setPixelFormat:v171];
      [(CSIBitmapWrapper *)self setColorSpaceID:v172];
      goto LABEL_34;
    case 6:
LABEL_16:
      unsigned int v173 = 6;
      *(void *)&v174[0] = 0;
      v169.data = 0;
      *a5 = v11;
      if ((encodeRadiosity(v14, v11, rowbytes, (uint64_t)Data, (uint64_t)v174, (uint64_t)&v169, v15, v16, 40.0) & 0x80000000) != 0) {
        goto LABEL_36;
      }
      id v24 = objc_alloc((Class)NSData);
      v21 = (__CFData *)[v24 initWithBytesNoCopy:*(void *)&v174[0] length:v169.data freeWhenDone:1];
      goto LABEL_35;
    case 7:
      if ((![(CSIBitmapWrapper *)self sourceAlphaInfo]
         || [(CSIBitmapWrapper *)self sourceAlphaInfo] == 5
         || [(CSIBitmapWrapper *)self sourceAlphaInfo] == 6)
        && self->_pixelFormat == 1095911234)
      {
        [(CSIBitmapWrapper *)self allowsCompactCompression];
        CGBitmapContextGetBitsPerPixel([(CSIBitmapWrapper *)self bitmapContext]);
        Image = CGBitmapContextCreateImage([(CSIBitmapWrapper *)self bitmapContext]);
        ColorSpace = CGBitmapContextGetColorSpace([(CSIBitmapWrapper *)self bitmapContext]);
        uint64_t v27 = CGBitmapContextCreate(0, v14, v11, 5uLL, 0, ColorSpace, 0x1006u);
        v176.size.unsigned int width = (double)v14;
        v176.size.height = (double)v11;
        v176.origin.x = 0.0;
        v176.origin.y = 0.0;
        CGContextDrawImage(v27, v176, Image);
        CGImageRelease(Image);
        Data = (UInt8 *)CGBitmapContextGetData(v27);
        CFRelease(self->_bitmapContext);
        self->_bitmapContext = v27;
        size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v27);
        self->_unint64_t rowbytes = BytesPerRow;
        unint64_t rowbytes = BytesPerRow;
        uint64_t v29 = BytesPerRow * v11;
        uint32_t v18 = &OBJC_IVAR___CUIThemeSchemaRendition__image;
        v10 = (NSData *)[objc_alloc((Class)NSData) initWithBytesNoCopy:Data length:v29 freeWhenDone:0];
        [(CSIBitmapWrapper *)self setPixelData:v10];

        [(CSIBitmapWrapper *)self setPixelFormat:1380401717];
        CFStreamPropertyKey propertyName = (CFStreamPropertyKey)v29;
        uint64_t v166 = v29;
LABEL_41:
        if ([(CSIBitmapWrapper *)self allowsPaletteImageCompression]
          && ![(CSIBitmapWrapper *)self allowsDeepmap2ImageCompression]
          && (id)[(CSIBitmapWrapper *)self colorSpaceID] != (id)2
          && (id)[(CSIBitmapWrapper *)self colorSpaceID] != (id)6
          && (id)[(CSIBitmapWrapper *)self compressionType] != (id)7)
        {
          unsigned int v173 = 8;
          v55 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
          if (!v55 || (v62 = v55, !CGImageGetWidth(v55)) || !CGImageGetHeight(v62))
          {
            _CUILog(4, (uint64_t)"CoreUI: Invalid image for lossless compression, fallback to Deepmap lossless compression...", v56, v57, v58, v59, v60, v61, v154);
            goto LABEL_52;
          }
          memset(v174, 0, 40);
          v169.data = 0;
          v169.height = CGImageGetHeight(v62);
          *(_OWORD *)&v169.unsigned int width = CGImageGetWidth(v62);
          pixelData = self->_pixelData;
          if (pixelData)
          {
            v64 = [(NSData *)self->_pixelData bytes];
            size_t v67 = self->_rowbytes;
            v169.data = v64;
            v169.rowBytes = v67;
          }
          else
          {
            vImage_Error v147 = CUIGetRGBAImageBuffer(v62, (uint64_t)v174, &v169);
            if (v147 || !v169.width || !v169.height)
            {
              if (v147) {
                _CUILog(4, (uint64_t)"CoreUI: Image conversion failed vImage error %d, fallback to other lossless compression...", v148, v149, v150, v151, v65, v66, v147);
              }
              else {
                _CUILog(4, (uint64_t)"CoreUI: Image conversion failed vImage returned degenerate image (width=%lu, height=%lu), fallback to other lossless compression...", v148, v149, v150, v151, v65, v66, v169.width);
              }
              goto LABEL_52;
            }
          }
          v163 = pixelData;
          vImage_Buffer v168 = v169;
          CFDataRef v152 = CUIImageCompressedWithColorQuantization((uint64_t)v62, (uint64_t *)&v168, 0, (int *)&v171, &v172, (uint64_t *)&v170, v65, v66);
          if (v152)
          {
            CFDataRef v153 = v152;
            [(CSIBitmapWrapper *)self setPixelFormat:v171];
            [(CSIBitmapWrapper *)self setColorSpaceID:v172];
            self->_unint64_t rowbytes = v170;
            *a5 = v11;
            uint32_t v17 = +[NSArray arrayWithObject:v153];

            if (!v163) {
              CUIDeallocateRGBAImageBuffer((uint64_t)v174, &v169.data);
            }
            goto LABEL_36;
          }
          if (!pixelData) {
            CUIDeallocateRGBAImageBuffer((uint64_t)v174, &v169.data);
          }
        }
LABEL_52:
        if ((id)[(CSIBitmapWrapper *)self compressionType] != (id)7)
        {
          if ([(CSIBitmapWrapper *)self allowsDeepmap2ImageCompression])
          {
            unsigned int v173 = 11;
            v68 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
            if (v68)
            {
              v75 = v68;
              if (CGImageGetWidth(v68))
              {
                if (CGImageGetHeight(v75))
                {
                  size_t v161 = v14;
                  v162 = a4;
                  v159 = [(NSData *)self->_pixelData bytes];
                  vImagePixelCount Height = CGImageGetHeight(v75);
                  vImagePixelCount Width = CGImageGetWidth(v75);
                  size_t v76 = self->_rowbytes;
                  size_t BitsPerPixel = CGImageGetBitsPerPixel(v75);
                  unsigned int v78 = 8 * ((BitsPerPixel >> 3) / (BitsPerPixel / CGImageGetBitsPerComponent(v75)));
                  CGColorSpaceRef v79 = CGImageGetColorSpace(v75);
                  CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(v75);
                  uint64_t pixelFormat = self->_pixelFormat;
                  *(void *)&v174[0] = __PAIR64__(BitsPerPixel, v78);
                  *((void *)&v174[0] + 1) = v79;
                  LODWORD(v174[1]) = BitmapInfo;
                  memset((char *)&v174[1] + 4, 0, 20);
                  v169.data = v159;
                  v169.height = Height;
                  v169.unsigned int width = Width;
                  v169.rowBytes = v76;
                  id v83 = CUIImageCompressedWithDeepmap2((unsigned int *)v174, &v169, pixelFormat, &v171, &v172, (uint64_t *)&v170, a5, v82);
                  if (!v83)
                  {
                    v90 = "CoreUI: Deepmap 2.0 image compression returned nil, fallback to other lossless compression...";
                    int v91 = 4;
LABEL_145:
                    _CUILog(v91, (uint64_t)v90, v84, v85, v86, v87, v88, v89, v154);
                    size_t v14 = v161;
                    a4 = v162;
                    goto LABEL_68;
                  }
                  goto LABEL_64;
                }
              }
            }
            v102 = "CoreUI: Invalid image for lossless compression with kCSICompressedDeepmap2Encoding encoding, fallback"
                   " to default lossless compression...";
LABEL_67:
            _CUILog(4, (uint64_t)v102, v69, v70, v71, v72, v73, v74, v154);
            goto LABEL_68;
          }
          if ([(CSIBitmapWrapper *)self allowsDeepmapImageCompression])
          {
            unsigned int v173 = 10;
            v92 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
            if (v92)
            {
              v93 = v92;
              if (CGImageGetWidth(v92))
              {
                if (CGImageGetHeight(v93))
                {
                  size_t v161 = v14;
                  v162 = a4;
                  v160 = [(NSData *)self->_pixelData bytes];
                  vImagePixelCount v158 = CGImageGetHeight(v93);
                  vImagePixelCount v156 = CGImageGetWidth(v93);
                  size_t v94 = self->_rowbytes;
                  size_t v95 = CGImageGetBitsPerPixel(v93);
                  unsigned int v96 = 8 * ((v95 >> 3) / (v95 / CGImageGetBitsPerComponent(v93)));
                  CGColorSpaceRef v97 = CGImageGetColorSpace(v93);
                  CGBitmapInfo v98 = CGImageGetBitmapInfo(v93);
                  uint64_t v99 = self->_pixelFormat;
                  *(void *)&v174[0] = __PAIR64__(v95, v96);
                  *((void *)&v174[0] + 1) = v97;
                  LODWORD(v174[1]) = v98;
                  memset((char *)&v174[1] + 4, 0, 20);
                  v169.data = v160;
                  v169.height = v158;
                  v169.unsigned int width = v156;
                  v169.rowBytes = v94;
                  id v83 = CUIImageCompressedWithDeepmap((unsigned int *)v174, (long long *)&v169, v99, &v171, &v172, (uint64_t *)&v170, a5, v100);
                  if (!v83)
                  {
                    v90 = "CoreUI: Deepmap image compression returned early, fallback to other lossless compression...";
                    int v91 = 3;
                    goto LABEL_145;
                  }
LABEL_64:
                  v101 = v83;
                  [(CSIBitmapWrapper *)self setPixelFormat:v171];
                  [(CSIBitmapWrapper *)self setColorSpaceID:v172];
                  self->_unint64_t rowbytes = v170;
                  uint32_t v17 = v101;
LABEL_120:
                  a4 = v162;
                  uint32_t v18 = &OBJC_IVAR___CUIThemeSchemaRendition__image;
                  goto LABEL_36;
                }
              }
            }
            v102 = "CoreUI: Invalid image for lossless compression with kCSICompressedDeepmapEncoding encoding, fallback "
                   "to default lossless compression...";
            goto LABEL_67;
          }
        }
LABEL_68:
        if (rowbytes * v11 > 0xFFF || (unsigned int v103 = self->_pixelFormat, v103 == 1195454774) || v103 == 1380401751)
        {
          *(void *)&v174[0] = 0;
          v169.data = 0;
          if (__environmentRequestedCompression == 2)
          {
            unsigned int v104 = 4;
          }
          else if (__environmentRequestedCompression == 1)
          {
            unsigned int v104 = 3;
          }
          else
          {
            if (__environmentRequestedCompression)
            {
LABEL_78:
              unsigned int v105 = [(CSIBitmapWrapper *)self allowsMultiPassEncoding];
              if (v14 > 1) {
                unsigned int v112 = v105;
              }
              else {
                unsigned int v112 = 0;
              }
              if (v14 * (unint64_t)v11 > 0xFFF) {
                unsigned int v113 = v112;
              }
              else {
                unsigned int v113 = 0;
              }
              if (v113 == 1)
              {
                if (__coreThemeLoggingEnabled) {
                  _CUILog(1, (uint64_t)"CoreUI(DEBUG): doing multipass encoding", v106, v107, v108, v109, v110, v111, v154);
                }
                if (rowbytes * v11 < 0x5000)
                {
                  v11 >>= 1;
                }
                else if (v11 >= 3)
                {
                  v11 /= 3u;
                }
              }
              v162 = a4;
              *a5 = v11;
              int64_t v114 = v166;
              if (v166 >= 1)
              {
                uint32_t v17 = 0;
                uint64_t v115 = 0;
                int64_t v116 = rowbytes * v11;
                CFStringRef propertyNamea = kCFStreamPropertyDataWritten;
                while (1)
                {
                  v117 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
                  CFWriteStreamOpen(v117);
                  *(void *)&v174[0] = 0;
                  _StreamSys_init_write((unint64_t)v174, (uint64_t)v117);
                  v169.data = 0;
                  char v118 = v173 == 3 ? 4 : 5;
                  char v119 = v173 == 2 ? 1 : v118;
                  if (_BOMFileNewFromCFWriteStreamSys(&v169, *(long long **)&v174[0], v119)) {
                    break;
                  }
                  int64_t v126 = 0;
                  if (v116 >= v114) {
                    unint64_t v127 = v114;
                  }
                  else {
                    unint64_t v127 = v116;
                  }
                  if (v127)
                  {
                    while (1)
                    {
                      int64_t v128 = BOMFileWrite((uint64_t)v169.data, &Data[v126], v127);
                      if (v128 < 1) {
                        break;
                      }
                      v126 += v128;
                      v127 -= v128;
                      if (!v127) {
                        goto LABEL_106;
                      }
                    }
                    BOMFileClose((uint64_t)v169.data);
                    CFRelease(v117);
                    _CUILog(4, (uint64_t)"CoreUI: Failure to write to stream", v133, v134, v135, v136, v137, v138, v154);
                    v139 = v17;
                    return 0;
                  }
LABEL_106:
                  BOMFileClose((uint64_t)v169.data);
                  BomSys_free(*(void **)&v174[0]);
                  CFDataRef v129 = (const __CFData *)CFWriteStreamCopyProperty(v117, propertyNamea);
                  CFDataRef v130 = v129;
                  if (__loggingEnabled) {
                    v115 += CFDataGetLength(v129);
                  }
                  if (!v17) {
                    uint32_t v17 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
                  }
                  Data += v126;
                  [(NSArray *)v17 addObject:v130];

                  CFRelease(v117);
                  BOOL v131 = v114 <= v126;
                  v114 -= v126;
                  if (v131) {
                    char v132 = 0;
                  }
                  else {
                    char v132 = v113;
                  }
                  if ((v132 & 1) == 0) {
                    goto LABEL_119;
                  }
                }
                if (v117) {
                  CFRelease(v117);
                }
                _CUILog(4, (uint64_t)"CoreUI: Unable to create compressed output stream.", v120, v121, v122, v123, v124, v125, v154);

                return 0;
              }
              uint32_t v17 = 0;
LABEL_119:
              v140 = v17;
              goto LABEL_120;
            }
            unsigned int v104 = 2;
          }
          unsigned int v173 = v104;
          goto LABEL_78;
        }
        unint64_t v141 = v166 + 8 * v11 + 12;
        if (v141 <= 0x800) {
          size_t v142 = 2048;
        }
        else {
          size_t v142 = v166 + 8 * v11 + 12;
        }
        if (v141 >= 0x800) {
          v143 = malloc_type_malloc(v142, 0x73C041C6uLL);
        }
        else {
          v143 = v174;
        }
        if (self->_sourceImage || self->_texturePixelFormat)
        {
          unsigned int v173 = 0;
          if (v141 >= 0x800) {
LABEL_130:
          }
            free(v143);
        }
        else
        {
          if (self->_pixelFormat == 1195456544) {
            unsigned int v144 = 3;
          }
          else {
            unsigned int v144 = 4;
          }
          int v145 = pk_compressData((uint64_t)Data, v144, v14, v11, rowbytes, (unsigned int *)v143, v142, v40);
          if (v145 >= 1 && (uint64_t)propertyName > v145)
          {
            unsigned int v173 = 1;
            if (v141 > 0x7FF) {
              v146 = +[NSData dataWithBytesNoCopy:v143 length:v145 freeWhenDone:1];
            }
            else {
              v146 = +[NSData dataWithBytes:v143 length:v145];
            }
            v10 = v146;
            goto LABEL_131;
          }
          unsigned int v173 = 0;
          if (v141 >= 0x800) {
            goto LABEL_130;
          }
        }
LABEL_131:
        uint32_t v18 = &OBJC_IVAR___CUIThemeSchemaRendition__image;
        *a5 = v11;
        uint32_t v17 = +[NSArray arrayWithObject:v10];
        goto LABEL_36;
      }
LABEL_23:
      size_t v30 = -[CSIBitmapWrapper destImage]((CGImageRef)self);
      if (![(CSIBitmapWrapper *)self allowsHevcCompression]) {
        goto LABEL_32;
      }
      [(CSIBitmapWrapper *)self compressionQuality];
      uint64_t v32 = CUIImageCompressedWithHEVC(v30, &v171, &v172, &v170, v31);
      if (v32)
      {
        v21 = v32;
        unsigned int v173 = 9;
      }
      else
      {
        if ([(CSIBitmapWrapper *)self name]) {
          vImage_CGImageFormat v33 = [(NSString *)[(CSIBitmapWrapper *)self name] UTF8String];
        }
        else {
          vImage_CGImageFormat v33 = "a rendition";
        }
        if ([(CSIBitmapWrapper *)self pixelFormat] == 1195456544)
        {
          _CUILog(4, (uint64_t)"CoreUI: HEVC lossy compression failed for %s. Re-try again with default lossless fallback.", v34, v35, v36, v37, v38, v39, (uint64_t)v33);
          goto LABEL_68;
        }
        _CUILog(4, (uint64_t)"CoreUI: HEVC lossy compression failed for %s. Re-try again with jpeg+lzfse fallback.", v34, v35, v36, v37, v38, v39, (uint64_t)v33);
LABEL_32:
        [(CSIBitmapWrapper *)self compressionQuality];
        v21 = CUIImageCompressedWithJPEGandLZFSE(v30, &v171, &v172, &v170, v41);
        unsigned int v173 = 5;
        if (!v21)
        {
          _CUILog(4, (uint64_t)"CoreUI: Lossy fallback compression failed. Re-try again with fallback.", v42, v43, v44, v45, v46, v47, v154);
          goto LABEL_41;
        }
      }
      [(CSIBitmapWrapper *)self setPixelFormat:v171];
      [(CSIBitmapWrapper *)self setColorSpaceID:v172];
      self->_unint64_t rowbytes = v170;
LABEL_34:
      *a5 = v11;
LABEL_35:
      uint32_t v17 = +[NSArray arrayWithObject:v21];

LABEL_36:
      if (*((unsigned char *)v18 + 3753))
      {
        v48 = CUIConvertCompressionTypeToString(v173);
        NSLocalizedFileSizeDescription();
        _CUILog(1, (uint64_t)"CSI: %s Compressed [%lu x %lu]\t\t%lu\trowbytes %lu\t to size %@\twith compressionFactor:\t%.2f", v49, v50, v51, v52, v53, v54, (uint64_t)v48);
      }
      if (a4) {
        *a4 = v173;
      }
      return v17;
    default:
      goto LABEL_36;
  }
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_uint64_t pixelFormat = a3;
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

- (BOOL)flipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (double)compressionQuality
{
  return self->_compressionQuality;
}

- (void)setCompressionQuality:(double)a3
{
  self->_compressionQuality = a3;
}

- (int64_t)compressionType
{
  return self->_compressionType;
}

- (void)setCompressionType:(int64_t)a3
{
  self->_compressionType = a3;
}

- (int64_t)targetPlatform
{
  return self->_targetPlatform;
}

- (void)setTargetPlatform:(int64_t)a3
{
  self->_targetPlatform = a3;
}

- (unint64_t)colorSpaceID
{
  return self->_colorSpaceID;
}

- (void)setColorSpaceID:(unint64_t)a3
{
  self->_unint64_t colorSpaceID = a3;
}

- (int64_t)textureInterpretation
{
  return self->_textureInterpretation;
}

- (void)setTextureInterpretation:(int64_t)a3
{
  self->_textureInterpretation = a3;
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(int)a3
{
  self->_exifOrientation = a3;
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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)a3;
}

@end