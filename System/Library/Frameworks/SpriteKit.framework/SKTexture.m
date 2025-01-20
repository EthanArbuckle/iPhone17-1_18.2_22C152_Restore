@interface SKTexture
+ (BOOL)supportsSecureCoding;
+ (SKTexture)textureNoiseWithSmoothness:(CGFloat)smoothness size:(CGSize)size grayscale:(BOOL)grayscale;
+ (SKTexture)textureVectorNoiseWithSmoothness:(CGFloat)smoothness size:(CGSize)size;
+ (SKTexture)textureWithCGImage:(CGImage *)a3 pointSize:(CGSize)a4;
+ (SKTexture)textureWithCGImage:(CGImageRef)image;
+ (SKTexture)textureWithData:(NSData *)pixelData size:(CGSize)size;
+ (SKTexture)textureWithData:(NSData *)pixelData size:(CGSize)size flipped:(BOOL)flipped;
+ (SKTexture)textureWithData:(NSData *)pixelData size:(CGSize)size rowLength:(unsigned int)rowLength alignment:(unsigned int)alignment;
+ (SKTexture)textureWithIOSurfaceID:(unsigned int)a3 width:(unsigned int)a4 height:(unsigned int)a5 format:(unsigned int)a6;
+ (SKTexture)textureWithImage:(UIImage *)image;
+ (SKTexture)textureWithImageNamed:(NSString *)name;
+ (SKTexture)textureWithImageNamed:(id)a3 rect:(CGRect)a4;
+ (SKTexture)textureWithImagePath:(id)a3;
+ (SKTexture)textureWithMetalTexture:(id)a3;
+ (SKTexture)textureWithRect:(CGRect)rect inTexture:(SKTexture *)texture;
+ (id)_cachedTextureNames;
+ (id)_textureByTransferingData:(char *)a3 size:(CGSize)a4;
+ (id)_textureByTransferingData:(char *)a3 size:(CGSize)a4 rowLength:(unsigned int)a5 alignment:(unsigned int)a6;
+ (id)_textureWithGLTextureId:(unsigned int)a3 size:(CGSize)a4;
+ (id)_textureWithImageNamed:(id)a3;
+ (id)compressedTextureWithData:(id)a3;
+ (id)compressedTextureWithData:(id)a3 size:(CGSize)a4 bitsPerPixel:(unsigned int)a5 hasAlpha:(BOOL)a6;
+ (id)lookupTextureCacheForName:(id)a3;
+ (id)preloadQueue;
+ (void)_reloadTextureCacheForImageNamed:(id)a3;
+ (void)preloadTextures:(NSArray *)textures withCompletionHandler:(void *)completionHandler;
+ (void)registerTextureCache:(id)a3 forName:(id)a4;
- (BOOL)_needsExtrusionWorkaround;
- (BOOL)hasAlpha;
- (BOOL)isEqualToTexture:(id)a3;
- (BOOL)isFlipped;
- (BOOL)isRepeatable;
- (BOOL)isRotated;
- (BOOL)loadImageDataFromPVRData:(id)a3;
- (BOOL)loadImageDataFromPVRGZData:(id)a3;
- (BOOL)performFullCapture;
- (BOOL)usesMipmaps;
- (CGImage)_newTextureFromGLCache;
- (CGPoint)cropOffset;
- (CGPoint)cropScale;
- (CGRect)textureRect;
- (CGSize)alphaMapSize;
- (CGSize)pixelSize;
- (CGSize)size;
- (NSString)imageNameOrPath;
- (NSString)originalAtlasName;
- (NSString)subTextureName;
- (SKTexture)init;
- (SKTexture)initWithBackingTetxure:(shared_ptr<jet_texture>)a3;
- (SKTexture)initWithBackingTetxure:(shared_ptr<jet_texture>)a3 logicalWidth:(float)a4 height:(float)a5;
- (SKTexture)initWithCoder:(id)a3;
- (SKTexture)initWithImageNamed:(id)a3;
- (SKTexture)initWithImagePath:(id)a3;
- (SKTexture)textureByApplyingCIFilter:(CIFilter *)filter;
- (SKTexture)textureByGeneratingNormalMap;
- (SKTexture)textureByGeneratingNormalMapWithSmoothness:(CGFloat)smoothness contrast:(CGFloat)contrast;
- (SKTextureAtlas)rootAtlas;
- (SKTextureFilteringMode)filteringMode;
- (id)_copyImageData;
- (id)_generateNormalMap:(double)a3 contrast:(double)a4 multiPass:(unint64_t)a5;
- (id)_initWithGLTextureId:(unsigned int)a3 size:(CGSize)a4;
- (id)_textureCache;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imgName;
- (id)metalTexture;
- (int)_convert_jet_texture_format_to_ci_format:(unsigned int)a3;
- (int)glTextureId;
- (int)wrapMode;
- (shared_ptr<jet_texture>)_backingTexture;
- (unsigned)alphaMap;
- (unsigned)textureTarget;
- (void)_ensureImageData;
- (void)_savePngFromGLCache:(id)a3;
- (void)_setImageName:(id)a3;
- (void)commonInit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initTextureCacheWithImageData;
- (void)loadImageData;
- (void)loadImageDataFromCGImage:(CGImage *)a3 pointsSize:(CGSize)a4;
- (void)preloadWithCompletionHandler:(void *)completionHandler;
- (void)setCropOffset:(CGPoint)a3;
- (void)setCropScale:(CGPoint)a3;
- (void)setFilteringMode:(SKTextureFilteringMode)filteringMode;
- (void)setIsData:(BOOL)a3;
- (void)setIsFlipped:(BOOL)a3;
- (void)setIsRotated:(BOOL)a3;
- (void)setNeedsExtrusionWorkaround:(BOOL)a3;
- (void)setOriginalAtlasName:(id)a3;
- (void)setPerformFullCapture:(BOOL)a3;
- (void)setRootAtlas:(id)a3;
- (void)setSubTextureName:(id)a3;
- (void)setTextureDimension:(const CGSize *)a3 withPixelSize:(const CGSize *)a4;
- (void)setTextureTarget:(unsigned int)a3;
- (void)setUsesMipmaps:(BOOL)usesMipmaps;
- (void)setWrapMode:(int)a3;
@end

@implementation SKTexture

- (id)imgName
{
  return self->_imgName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)registerTextureCache:(id)a3 forName:(id)a4
{
}

+ (id)lookupTextureCacheForName:(id)a3
{
  v3 = [(id)_textureTable objectForKey:a3];

  return v3;
}

- (id)_textureCache
{
  return self->_textureCache;
}

- (BOOL)_needsExtrusionWorkaround
{
  return self->_needsExtrusionWorkaround;
}

- (SKTexture)textureByGeneratingNormalMap
{
  return [(SKTexture *)self textureByGeneratingNormalMapWithSmoothness:0.2 contrast:1.5];
}

- (SKTexture)textureByGeneratingNormalMapWithSmoothness:(CGFloat)smoothness contrast:(CGFloat)contrast
{
  return (SKTexture *)[(SKTexture *)self _generateNormalMap:0 contrast:smoothness multiPass:contrast];
}

- (void)commonInit
{
  originalAtlasName = self->_originalAtlasName;
  self->_originalAtlasName = 0;

  subTextureName = self->_subTextureName;
  self->_subTextureName = 0;

  imgName = self->_imgName;
  self->_imgName = 0;

  searchPaths = self->_searchPaths;
  self->_searchPaths = 0;

  if (-[SKTexture commonInit]::_queueInit != -1) {
    dispatch_once(&-[SKTexture commonInit]::_queueInit, &__block_literal_global_6);
  }
  v7 = (SKTextureCache *)objc_opt_new();
  textureCache = self->_textureCache;
  self->_textureCache = v7;

  *(_WORD *)&self->_disableAlpha = 0;
  *(_DWORD *)&self->_shouldGenerateMipmaps = 0;
  self->_isData = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(CGPoint *)v18 = _Q0;
  self->_cropScale = _Q0;
  self->_cropOffset.x = 0.0;
  self->_cropOffset.y = 0.0;
  *(void *)&self->_alignment = 1;
  filter = self->_filter;
  self->_filter = 0;

  originalTexture = self->_originalTexture;
  self->_originalTexture = 0;

  self->_textureTarget = 3553;
  self->_textRect.origin.x = 0.0;
  self->_textRect.origin.y = 0.0;
  self->_textRect.size = *(CGSize *)v18;
  v19 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spritekit.textureSync", v19);
  textureSyncQueue = self->_textureSyncQueue;
  self->_textureSyncQueue = v16;
}

void __23__SKTexture_commonInit__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.spritekit.textureOp", 0);
  v1 = (void *)_textureOpQueue;
  _textureOpQueue = (uint64_t)v0;

  v2 = [SKThreadSafeMapTable alloc];
  id v5 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
  uint64_t v3 = -[SKThreadSafeMapTable initWithNSMapTable:](v2, "initWithNSMapTable:");
  v4 = (void *)_textureTable;
  _textureTable = v3;
}

- (void)setTextureDimension:(const CGSize *)a3 withPixelSize:(const CGSize *)a4
{
  textureSyncQueue = self->_textureSyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SKTexture_setTextureDimension_withPixelSize___block_invoke;
  block[3] = &unk_263FEA1C0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(textureSyncQueue, block);
}

uint64_t __47__SKTexture_setTextureDimension_withPixelSize___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "setSize:", **(double **)(a1 + 40), *(double *)(*(void *)(a1 + 40) + 8));
  v2 = *(double **)(a1 + 48);
  double v3 = *v2;
  double v4 = v2[1];
  id v5 = *(void **)(*(void *)(a1 + 32) + 184);

  return objc_msgSend(v5, "setPixelSize:", v3, v4);
}

- (BOOL)loadImageDataFromPVRGZData:(id)a3
{
  double v4 = [a3 gzipInflate];
  LOBYTE(self) = [(SKTexture *)self loadImageDataFromPVRData:v4];

  return (char)self;
}

- (BOOL)loadImageDataFromPVRData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = v5;
  if (*(_DWORD *)(v5 + 44) == 559044176)
  {
    size_t v7 = *(unsigned int *)(v5 + 20);
    v8 = malloc_type_malloc(v7, 0x9250D8CCuLL);
    memcpy(v8, (const void *)([v4 bytes] + 52), v7);
    int32x2_t v9 = *(int32x2_t *)(v6 + 4);
    unsigned int v10 = v9.u32[1];
    unsigned int v11 = v9.i32[0];
    BOOL v13 = 0;
    if (v9.i32[1])
    {
      int32x2_t v12 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)v9, (int8x8_t)vadd_s32(v9, (int32x2_t)-1)));
      if (v12.i8[4] & 1) != 0 && v11 && (v12.i8[0]) {
        BOOL v13 = 1;
      }
    }
    [(SKTextureCache *)self->_textureCache setIsPOT:v13];
    [(SKTextureCache *)self->_textureCache setHasAlpha:*(_DWORD *)(v6 + 40) != 0];
    -[SKTextureCache setPixelSize:](self->_textureCache, "setPixelSize:", (double)v10, (double)v11);
    v16 = [(NSString *)self->_imgName lowercaseString];
    uint64_t v17 = [v16 rangeOfString:@"@2x"];

    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      double v18 = (double)v10;
    }
    else {
      double v18 = (double)v10 * 0.5;
    }
    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      double v19 = (double)v11;
    }
    else {
      double v19 = (double)v11 * 0.5;
    }
    -[SKTextureCache setSize:](self->_textureCache, "setSize:", v18, v19, (double)v11 * 0.5);
    self->_isData = 1;
    [(SKTextureCache *)self->_textureCache setState:1];
    switch(*(unsigned char *)(v6 + 16))
    {
      case 0x10:
        [(SKTextureCache *)self->_textureCache setTextureFormat:3];
        v20 = malloc_type_malloc(4 * v11 * v10, 0x193F1985uLL);
        jet_convert_pixel_data_rgba_4444_to_rgba_8888(v8, v20);
        goto LABEL_23;
      case 0x11:
        [(SKTextureCache *)self->_textureCache setTextureFormat:3];
        v20 = malloc_type_malloc(4 * v11 * v10, 0xE1388C9CuLL);
        jet_convert_pixel_data_rgba_5551_to_rgba_8888(v8, v20);
        goto LABEL_23;
      case 0x12:
        goto LABEL_24;
      case 0x13:
        [(SKTextureCache *)self->_textureCache setTextureFormat:3];
        v20 = malloc_type_malloc(4 * v11 * v10, 0xCBD3E3FFuLL);
        jet_convert_pixel_data_rgb_565_to_rgba_8888(v8, v20);
LABEL_23:
        free(v8);
        v8 = v20;
LABEL_24:
        [(SKTextureCache *)self->_textureCache setPixelData:v8];
        BOOL v15 = 1;
        break;
      default:
        free(v8);
        if (self->_imgName) {
          goto LABEL_8;
        }
        goto LABEL_9;
    }
  }
  else
  {
    if (self->_imgName)
    {
LABEL_8:
      v14 = [(id)objc_opt_class() description];
      NSLog(&cfstr_ErrorLoadingPv.isa, v14, self->_imgName);
    }
LABEL_9:
    BOOL v15 = 0;
  }

  return v15;
}

- (void)loadImageDataFromCGImage:(CGImage *)a3 pointsSize:(CGSize)a4
{
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
    size_t v9 = CGImageGetWidth(a3);
    size_t v10 = CGImageGetHeight(a3);
    unint64_t v12 = v10;
    unint64_t v13 = v9 * (unint64_t)v10;
    if ((v13 & 0xFFFFFFFF00000000) != 0) {
      -[SKTexture loadImageDataFromCGImage:pointsSize:]();
    }
    BOOL v15 = 0;
    if (v9)
    {
      if ((v9 & (v9 - 1)) == 0)
      {
        if (v10)
        {
          v11.i32[0] = v10;
          uint8x8_t v14 = (uint8x8_t)vcnt_s8(v11);
          v14.i16[0] = vaddlv_u8(v14);
          if (v14.i32[0] < 2u) {
            BOOL v15 = 1;
          }
        }
      }
    }
    [(SKTextureCache *)self->_textureCache setIsPOT:v15];
    if (SKGetShouldUseExtendedRangeColor()
      && (ColorSpace = CGImageGetColorSpace(a3), SKColorSpaceIsWideGamut(ColorSpace)))
    {
      uint64_t v17 = malloc_type_malloc(16 * v13, 0x1655AF3CuLL);
      DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00238]);
      double v19 = CGBitmapContextCreate(v17, v9, v12, 0x20uLL, (16 * v9), DeviceRGB, 0x2101u);
      int v20 = 1;
    }
    else
    {
      uint64_t v17 = malloc_type_malloc(4 * v13, 0x71113878uLL);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      double v19 = CGBitmapContextCreate(v17, v9, v12, 8uLL, (4 * v9), DeviceRGB, 0x4001u);
      int v20 = 0;
    }
    CGColorSpaceRelease(DeviceRGB);
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    v30.size.double width = (double)v9;
    v30.size.double height = (double)v12;
    CGContextClearRect(v19, v30);
    CGContextTranslateCTM(v19, 0.0, (double)v12);
    CGContextScaleCTM(v19, 1.0, -1.0);
    v31.origin.x = 0.0;
    v31.origin.y = 0.0;
    v31.size.double width = (double)v9;
    v31.size.double height = (double)v12;
    CGContextDrawImage(v19, v31, a3);
    [(SKTextureCache *)self->_textureCache setHasAlpha:(AlphaInfo > kCGImageAlphaNoneSkipFirst) | (0x1Eu >> AlphaInfo) & 1];
    CGContextRelease(v19);
    -[SKTextureCache setPixelSize:](self->_textureCache, "setPixelSize:", (double)v9, (double)v12);
    if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      [(SKTextureCache *)self->_textureCache pixelSize];
      double width = v21;
      double height = v22;
    }
    if (v20)
    {
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      char v29 = 0;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __49__SKTexture_loadImageDataFromCGImage_pointsSize___block_invoke;
      v25[3] = &unk_263FEA1E8;
      v25[4] = &v26;
      SKCPerformResourceOperation(v25);
      size_t v23 = (8 * v12 * v9);
      if (*((unsigned char *)v27 + 24))
      {
        v24 = malloc_type_malloc(v23, 0x4906E96DuLL);
        jet_convert_pixel_data_rgba_fp32_to_argb64_xr10_srgb(v17, v24);
        free(v17);
        [(SKTextureCache *)self->_textureCache setTextureFormat:7];
      }
      else
      {
        v24 = malloc_type_malloc(v23, 0x7BCCEDBFuLL);
        jet_convert_pixel_data_rgba_fp32_to_rgba_fp16(v17, v24);
        free(v17);
        [(SKTextureCache *)self->_textureCache setTextureFormat:10];
      }
      _Block_object_dispose(&v26, 8);
      uint64_t v17 = v24;
    }
    else
    {
      [(SKTextureCache *)self->_textureCache setTextureFormat:3];
    }
    -[SKTextureCache setSize:](self->_textureCache, "setSize:", width, height);
    [(SKTextureCache *)self->_textureCache setPixelData:v17];
    [(SKTextureCache *)self->_textureCache setState:1];
  }
}

void __49__SKTexture_loadImageDataFromCGImage_pointsSize___block_invoke(uint64_t a1, void *a2)
{
  if ((*(unsigned int (**)(void))(*(void *)*a2 + 136))() == 1)
  {
    id v4 = (void *)*a2;
    if (*a2 && (id v4 = __dynamic_cast(v4, MEMORY[0x263F50770], MEMORY[0x263F50778], 0)) != 0)
    {
      uint64_t v5 = (std::__shared_weak_count *)a2[1];
      if (v5) {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v6 = (*(void (**)(void *))(*(void *)v4 + 360))(v4);
    id v7 = v6;
    if (v5)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      uint64_t v6 = v7;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = SKDeviceSupportsExtendedXR10Formats(v6);
  }
}

- (void)preloadWithCompletionHandler:(void *)completionHandler
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = completionHandler;
  v6[0] = self;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  +[SKTexture preloadTextures:v5 withCompletionHandler:v4];
}

+ (id)preloadQueue
{
  if (+[SKTexture preloadQueue]::onceToken != -1) {
    dispatch_once(&+[SKTexture preloadQueue]::onceToken, &__block_literal_global_91);
  }
  v2 = (void *)+[SKTexture preloadQueue]::preloadQueue;

  return v2;
}

void __25__SKTexture_preloadQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.spritekit.preloadQueue", MEMORY[0x263EF83A8]);
  v1 = (void *)+[SKTexture preloadQueue]::preloadQueue;
  +[SKTexture preloadQueue]::preloadQueue = (uint64_t)v0;
}

+ (void)preloadTextures:(NSArray *)textures withCompletionHandler:(void *)completionHandler
{
  uint64_t v6 = textures;
  double v21 = completionHandler;
  unsigned int v7 = [(NSArray *)v6 count];
  v8 = dispatch_group_create();
  size_t v9 = [a1 preloadQueue];
  if (v7)
  {
    uint64_t v10 = 0;
    HIDWORD(v11) = -858993459 * v7;
    LODWORD(v11) = -858993459 * v7;
    uint64_t v12 = 19;
    if ((v11 >> 2) >= 0xCCCCCCD) {
      unsigned int v13 = 19;
    }
    else {
      unsigned int v13 = 20;
    }
    unsigned int v14 = v7 / v13;
    if (v14 <= 5) {
      uint64_t v15 = 5;
    }
    else {
      uint64_t v15 = v14;
    }
    do
    {
      uint64_t v16 = v12;
      if (v7 >= v15) {
        int v17 = v15;
      }
      else {
        int v17 = v7;
      }
      if (v17)
      {
        double v18 = [(NSArray *)v6 subarrayWithRange:v10];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __51__SKTexture_preloadTextures_withCompletionHandler___block_invoke;
        block[3] = &unk_263FEA210;
        id v25 = v18;
        id v19 = v18;
        dispatch_group_async(v8, v9, block);
      }
      if (v7 < v15) {
        break;
      }
      uint64_t v12 = v16 - 1;
      v10 += v15;
      v7 -= v15;
    }
    while (v16);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __51__SKTexture_preloadTextures_withCompletionHandler___block_invoke_2;
  v22[3] = &unk_263FEA238;
  id v23 = v21;
  id v20 = v21;
  dispatch_group_notify(v8, v9, v22);
}

void __51__SKTexture_preloadTextures_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(id **)(*((void *)&v6 + 1) + 8 * v4);
        if (!objc_msgSend(v5[23], "state", (void)v6)) {
          [v5 loadImageData];
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v2);
  }
}

uint64_t __51__SKTexture_preloadTextures_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initTextureCacheWithImageData
{
  uint64_t v3 = +[SKTexture lookupTextureCacheForName:self->_imgName];
  if (v3
    || ([(NSString *)self->_imgName stringByDeletingPathExtension],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        +[SKTexture lookupTextureCacheForName:v4],
        uint64_t v3 = (SKTextureCache *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    textureCache = self->_textureCache;
    self->_textureCache = v3;
    long long v6 = v3;
  }
}

- (void)loadImageData
{
  if (self->_imgName)
  {
    [(SKTexture *)self initTextureCacheWithImageData];
    if ([(SKTextureCache *)self->_textureCache state] != 1)
    {
      uint64_t v3 = +[SKTextureAtlas lookupCachedTextureNamed:self->_imgName];
      uint64_t v4 = v3;
      if (v3)
      {
        [v3 _ensureImageData];
        objc_storeStrong((id *)&self->_textureCache, *((id *)v4 + 23));
        uint64_t v5 = (NSString *)[*((id *)v4 + 2) copy];
        imgName = self->_imgName;
        self->_imgName = v5;

        CGSize v7 = (CGSize)*((_OWORD *)v4 + 3);
        self->_textRect.origin = (CGPoint)*((_OWORD *)v4 + 2);
        self->_textRect.size = v7;
        self->_isPath = v4[11];
        self->_disableAlpha = v4[96];
        objc_storeStrong((id *)&self->_subTextureName, *((id *)v4 + 22));
        objc_storeStrong((id *)&self->_originalAtlasName, *((id *)v4 + 21));
        self->_needsExtrusionWorkaround = v4[10];
        self->_cropOffset = *(CGPoint *)(v4 + 120);
        self->_isRotated = v4[97];
        self->_isFlipped = v4[98];
        self->_cropScale = *(CGPoint *)(v4 + 104);
      }
      else
      {
        textureSyncQueue = self->_textureSyncQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __26__SKTexture_loadImageData__block_invoke;
        block[3] = &unk_263FEA210;
        void block[4] = self;
        dispatch_sync(textureSyncQueue, block);
      }
    }
  }
}

void __26__SKTexture_loadImageData__block_invoke(uint64_t a1)
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 184) state] != 1)
  {
    double v2 = *MEMORY[0x263F001B0];
    double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(void *)(v4 + 24))
    {
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v5 = *(id *)(v4 + 24);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v99 objects:v103 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v100;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v100 != v7) {
              objc_enumerationMutation(v5);
            }
            long long v9 = *(void **)(*((void *)&v99 + 1) + 8 * i);
            uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 16) lastPathComponent];
            uint64_t v11 = [v9 stringByAppendingPathComponent:v10];

            uint64_t v12 = [v11 pathExtension];
            BOOL v13 = [v12 length] == 0;

            if (v13)
            {
              uint64_t v14 = [v11 stringByAppendingPathExtension:@"png"];

              uint64_t v11 = (void *)v14;
            }
            uint64_t v15 = [MEMORY[0x263F1C6B0] imageWithContentsOfFile:v11];
            if (v15)
            {
              id v17 = v15;
              uint64_t v16 = [v17 CGImage];
              [v17 size];
              double v2 = v18;
              double v3 = v19;

              goto LABEL_15;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v99 objects:v103 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      uint64_t v16 = 0;
LABEL_15:
    }
    else
    {
      uint64_t v16 = 0;
    }
    id v20 = (void *)MEMORY[0x263F38378];
    double v21 = SKGetResourceBundle();
    double v22 = [v20 defaultUICatalogForBundle:v21];

    id v23 = [MEMORY[0x263F1C920] mainScreen];
    [v23 scale];
    double v25 = v24;

    uint64_t v26 = [MEMORY[0x263F1C5C0] currentDevice];
    unint64_t v27 = [v26 userInterfaceIdiom];

    uint64_t v28 = [v22 imageWithName:*(void *)(*(void *)(a1 + 32) + 16) scaleFactor:__deviceClassForInterfaceIdiom(v27) deviceIdiom:v25];
    char v29 = [v22 parentNamedImageAtlastForImageNamed:*(void *)(*(void *)(a1 + 32) + 16) scaleFactor:v25];
    if (v29)
    {
      CGRect v30 = +[SKTextureAtlas atlasNamed:v29];
      uint64_t v31 = [v30 textureNamed:*(void *)(*(void *)(a1 + 32) + 16)];
      uint64_t v32 = v31;
      if (v31)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(v31 + 184));
        uint64_t v33 = [*(id *)(v32 + 16) copy];
        uint64_t v35 = *(void *)(a1 + 32);
        v34 = (uint64_t *)(a1 + 32);
        v36 = *(void **)(v35 + 16);
        *(void *)(v35 + 16) = v33;

        uint64_t v37 = *v34;
        long long v38 = *(_OWORD *)(v32 + 48);
        *(_OWORD *)(v37 + 32) = *(_OWORD *)(v32 + 32);
        *(_OWORD *)(v37 + 48) = v38;
        *(unsigned char *)(*v34 + 11) = *(unsigned char *)(v32 + 11);
        *(unsigned char *)(*v34 + 96) = *(unsigned char *)(v32 + 96);
        objc_storeStrong((id *)(*v34 + 176), *(id *)(v32 + 176));
        objc_storeStrong((id *)(*v34 + 168), *(id *)(v32 + 168));
        objc_storeStrong((id *)(*v34 + 152), *(id *)(v32 + 152));
        *(_OWORD *)(*v34 + 120) = *(_OWORD *)(v32 + 120);
        *(unsigned char *)(*v34 + 97) = *(unsigned char *)(v32 + 97);
        *(unsigned char *)(*v34 + 98) = *(unsigned char *)(v32 + 98);
        *(_OWORD *)(*v34 + 104) = *(_OWORD *)(v32 + 104);
        objc_storeStrong((id *)(*v34 + 208), *(id *)(v32 + 208));

LABEL_34:
LABEL_35:

        return;
      }
    }
    if ([v28 image])
    {
      if ([v28 isAlphaCropped])
      {
        [v28 size];
        double v96 = v39;
        [v28 scale];
        double v41 = v40;
        [v28 size];
        double v43 = v42;
        [v28 scale];
        double v45 = v44;
        [v28 alphaCroppedRect];
        double v47 = v46;
        [v28 alphaCroppedRect];
        double v49 = v48;
        [v28 alphaCroppedRect];
        double v51 = v50;
        [v28 alphaCroppedRect];
        double v53 = v52;
        [v28 alphaCroppedRect];
        double v54 = v96 * v41;
        double v55 = v43 * v45;
        v57 = +[SKTextureAtlas createCGImageFromCUINamedImage:withSize:atRect:](SKTextureAtlas, "createCGImageFromCUINamedImage:withSize:atRect:", [v28 image], v54, v55, v47, v55 - (v49 + v51), v53, v56);
        [v28 scale];
        double v59 = v58;
        [v28 scale];
        double v2 = v54 / v59;
        double v3 = v55 / v60;
        objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromCGImage:pointsSize:", v57, v2, v3);
        CGImageRelease(v57);
      }
      else
      {
        uint64_t v16 = [v28 image];
        [v28 size];
        double v2 = v67;
        double v3 = v68;
      }
      goto LABEL_29;
    }
    if (v16)
    {
LABEL_29:
      int v69 = 0;
LABEL_30:
      objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromCGImage:pointsSize:", v16, v2, v3);
      v70 = *(void **)(a1 + 32);
      if (!v70[26]) {
        +[SKTexture registerTextureCache:v70[23] forName:v70[2]];
      }
      if (!v69) {
        goto LABEL_35;
      }
      CGRect v30 = [(id)objc_opt_class() description];
      NSLog(&cfstr_ErrorLoadingIm.isa, v30, *(void *)(*(void *)(a1 + 32) + 16));
      goto LABEL_34;
    }
    v97[0] = MEMORY[0x263EF8330];
    v97[1] = 3221225472;
    v97[2] = __26__SKTexture_loadImageData__block_invoke_3;
    v97[3] = &unk_263FEA280;
    v97[4] = *(void *)(a1 + 32);
    id v98 = &__block_literal_global_103;
    v61 = (uint64_t (**)(void))MEMORY[0x21052F3F0](v97);
    v62 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v63 = *(void *)(*(void *)(a1 + 32) + 16);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
    {
      uint64_t v64 = [MEMORY[0x263F1C6B0] imageWithContentsOfFile:v63];
      v65 = (double *)MEMORY[0x263F001B0];
      v66 = (void *)v64;
      if (!v64) {
        goto LABEL_41;
      }
    }
    else
    {
      v71 = SKGetResourceBundle();
      v66 = [v62 imageNamed:v63 inBundle:v71];

      v65 = (double *)MEMORY[0x263F001B0];
      if (!v66) {
        goto LABEL_41;
      }
    }
    [v66 size];
    int v69 = 0;
    if (v73 != *v65 || v72 != v65[1]) {
      goto LABEL_58;
    }

LABEL_41:
    if (v61[2](v61))
    {
      char v74 = 0;
      uint64_t v16 = 0;
      int v69 = 0;
      goto LABEL_60;
    }
    uint64_t v75 = [*(id *)(*(void *)(a1 + 32) + 16) hasSuffix:@".pvr"];
    if ((v75 & 1) != 0
      || (uint64_t v75 = [*(id *)(*(void *)(a1 + 32) + 16) hasSuffix:@".pvrtc"], v75))
    {
      __26__SKTexture_loadImageData__block_invoke_2(v75, *(void **)(*(void *)(a1 + 32) + 16));
      v76 = (char *)objc_claimAutoreleasedReturnValue();
      if (v76)
      {
        [*(id *)(a1 + 32) loadImageDataFromPVRData:v76];
LABEL_56:
        char v74 = 0;
        uint64_t v16 = 0;
        int v69 = 0;
LABEL_59:

LABEL_60:
        if ((v74 & 1) == 0) {
          goto LABEL_35;
        }
        goto LABEL_30;
      }
      goto LABEL_54;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 16) rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v76 = (char *)*(id *)(*(void *)(a1 + 32) + 16);
      v77 = SKGetResourceBundle();
      v78 = [v77 pathForResource:v76 ofType:@"pvr"];

      v79 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v78];
      if (v79)
      {
        [*(id *)(a1 + 32) loadImageDataFromPVRData:v79];
LABEL_52:

        goto LABEL_56;
      }
      v80 = SKGetResourceBundle();
      v81 = [v80 pathForResource:v76 ofType:@"pvrtc"];

      uint64_t v82 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v81];
      if (v82)
      {
        v78 = v81;
        v79 = (void *)v82;
        objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromPVRData:");
        goto LABEL_52;
      }
    }
LABEL_54:
    uint64_t v83 = +[SKTextureAtlas findTextureNamed:*(void *)(*(void *)(a1 + 32) + 16)];
    v76 = (char *)v83;
    if (v83)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), *(id *)(v83 + 184));
      uint64_t v84 = [*((id *)v76 + 2) copy];
      uint64_t v86 = a1 + 32;
      uint64_t v85 = *(void *)(a1 + 32);
      v87 = *(void **)(v85 + 16);
      *(void *)(v85 + 16) = v84;

      uint64_t v88 = *(void *)(a1 + 32);
      long long v89 = *((_OWORD *)v76 + 3);
      *(_OWORD *)(v88 + 32) = *((_OWORD *)v76 + 2);
      *(_OWORD *)(v88 + 48) = v89;
      *(unsigned char *)(*(void *)v86 + 11) = v76[11];
      *(unsigned char *)(*(void *)v86 + 96) = v76[96];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 176), *((id *)v76 + 22));
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *((id *)v76 + 21));
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 152), *((id *)v76 + 19));
      *(_OWORD *)(*(void *)v86 + 120) = *(_OWORD *)(v76 + 120);
      *(unsigned char *)(*(void *)v86 + 97) = v76[97];
      *(unsigned char *)(*(void *)v86 + 98) = v76[98];
      *(_OWORD *)(*(void *)v86 + 104) = *(_OWORD *)(v76 + 104);
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *((id *)v76 + 26));
      goto LABEL_56;
    }
    v90 = (void *)MEMORY[0x263F1C6B0];
    v91 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v92 = [v91 pathForResource:@"MissingResource.png" ofType:0];
    uint64_t v93 = [v90 imageWithContentsOfFile:v92];

    int v69 = 1;
    v66 = (void *)v93;
LABEL_58:
    v76 = v66;
    uint64_t v16 = [v76 CGImage];
    [v76 size];
    double v2 = v94;
    double v3 = v95;
    char v74 = 1;
    goto LABEL_59;
  }
}

id __26__SKTexture_loadImageData__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v2];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [v2 stringByDeletingPathExtension];
    uint64_t v7 = [v2 pathExtension];
    long long v8 = SKGetResourceBundle();
    long long v9 = [v8 pathForResource:v6 ofType:v7];

    id v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v9];
  }

  return v5;
}

uint64_t __26__SKTexture_loadImageData__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) lowercaseString];
  int v3 = [v2 hasSuffix:@".pvr.gz"];

  if (v3)
  {
    uint64_t v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v4)
    {
      id v5 = (void *)v4;
      [*(id *)(a1 + 32) loadImageDataFromPVRGZData:v4];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) pathExtension];
    uint64_t v7 = [v6 length];

    if (!v7)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 16) stringByAppendingPathExtension:@"pvr.gz"];
      long long v9 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      if (!v9)
      {
        uint64_t v8 = 0;
        goto LABEL_9;
      }
      [*(id *)(a1 + 32) loadImageDataFromPVRGZData:v9];

LABEL_8:
      uint64_t v8 = 1;
LABEL_9:

      return v8;
    }
  }
  return 0;
}

- (SKTexture)initWithImageNamed:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKTexture;
  id v5 = [(SKTexture *)&v15 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(SKTexture *)v5 commonInit];
    uint64_t v7 = [v4 copy];
    imgName = v6->_imgName;
    v6->_imgName = (NSString *)v7;

    long long v9 = v6->_imgName;
    if (v9)
    {
      uint64_t v10 = [(NSString *)v9 length];
      uint64_t v11 = v6->_imgName;
      if (!v10)
      {
        v6->_imgName = (NSString *)@"MissingResource.png";

        uint64_t v12 = +[SKTexture _textureWithImageNamed:v6->_imgName];
        goto LABEL_7;
      }
      if ([(NSString *)v11 isAbsolutePath]) {
        v6->_isPath = 1;
      }
    }
  }
  uint64_t v12 = v6;
LABEL_7:
  BOOL v13 = v12;

  return v13;
}

- (SKTexture)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKTexture;
  id v2 = [(SKTexture *)&v5 init];
  int v3 = v2;
  if (v2) {
    [(SKTexture *)v2 commonInit];
  }
  return v3;
}

- (SKTexture)initWithImagePath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKTexture;
  objc_super v5 = [(SKTexture *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(SKTexture *)v5 commonInit];
    v6->_isPath = 1;
    uint64_t v7 = [v4 copy];
    imgName = v6->_imgName;
    v6->_imgName = (NSString *)v7;
  }
  return v6;
}

- (SKTexture)initWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)SKTexture;
  objc_super v5 = [(SKTexture *)&v54 init];
  uint64_t v6 = (uint64_t)v5;
  if (!v5) {
    goto LABEL_13;
  }
  [(SKTexture *)v5 commonInit];
  *(unsigned char *)(v6 + 12) = [v4 decodeBoolForKey:@"_isData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    uint64_t v8 = [v7 searchPaths];
    long long v9 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v8;
  }
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalAtlasName"];
  uint64_t v11 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subTextureName"];
  BOOL v13 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v12;

  if (*(void *)(v6 + 168) && *(void *)(v6 + 176))
  {
    if (![v4 decodeBoolForKey:@"_isCapture"])
    {
      uint64_t v28 = +[SKTextureAtlas atlasNamed:*(void *)(v6 + 168)];
      uint64_t v53 = [v28 textureNamed:*(void *)(v6 + 176)];

      uint64_t v6 = v53;
      goto LABEL_10;
    }
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalTexture"];
    objc_super v15 = *(void **)(v6 + 152);
    *(void *)(v6 + 152) = v14;

    uint64_t v16 = [*(id *)(v6 + 152) _textureCache];
    id v17 = *(void **)(v6 + 184);
    *(void *)(v6 + 184) = v16;

    *(unsigned char *)(v6 + 11) = [v4 decodeBoolForKey:@"_isPath"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imgName"];
    double v19 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v18;

    id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_textRect"];
    [v20 CGRectValue];
    *(void *)(v6 + 32) = v21;
    *(void *)(v6 + 40) = v22;
    *(void *)(v6 + 48) = v23;
    *(void *)(v6 + 56) = v24;

    *(unsigned char *)(v6 + 97) = [v4 decodeBoolForKey:@"_isRotated"];
    *(unsigned char *)(v6 + 98) = [v4 decodeBoolForKey:@"_isFlipped"];
    double v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cropOffset"];
    [v25 CGPointValue];
    *(void *)(v6 + 120) = v26;
    *(void *)(v6 + 128) = v27;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cropScale"];
    [v28 CGPointValue];
  }
  else
  {
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pixelSize"];
    [v31 CGSizeValue];
    objc_msgSend(*(id *)(v6 + 184), "setPixelSize:");

    *(unsigned char *)(v6 + 11) = [v4 decodeBoolForKey:@"_isPath"];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imgName"];
    uint64_t v33 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v32;

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_textRect"];
    [v34 CGRectValue];
    *(void *)(v6 + 32) = v35;
    *(void *)(v6 + 40) = v36;
    *(void *)(v6 + 48) = v37;
    *(void *)(v6 + 56) = v38;

    *(unsigned char *)(v6 + 97) = [v4 decodeBoolForKey:@"_isRotated"];
    double v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cropOffset"];
    [v39 CGPointValue];
    *(void *)(v6 + 120) = v40;
    *(void *)(v6 + 128) = v41;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cropScale"];
    [v28 CGPointValue];
  }
  *(void *)(v6 + 104) = v29;
  *(void *)(v6 + 112) = v30;
LABEL_10:

  if (*(unsigned char *)(v6 + 12))
  {
    [*(id *)(v6 + 184) setState:1];
    double v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pixelSize"];
    [v42 CGSizeValue];
    objc_msgSend(*(id *)(v6 + 184), "setPixelSize:");

    double v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_size"];
    [v43 CGSizeValue];
    objc_msgSend(*(id *)(v6 + 184), "setSize:");

    double v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_textRect"];
    [v44 CGRectValue];
    *(void *)(v6 + 32) = v45;
    *(void *)(v6 + 40) = v46;
    *(void *)(v6 + 48) = v47;
    *(void *)(v6 + 56) = v48;

    double v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imageData"];
    id v50 = (id) [objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v49];
    uint64_t v51 = [v50 CGImage];
    [*(id *)(v6 + 184) size];
    objc_msgSend((id)v6, "loadImageDataFromCGImage:pointsSize:", v51);
  }
  *(unsigned char *)(v6 + 96) = [v4 decodeBoolForKey:@"_disableAlpha"];
  objc_msgSend((id)v6, "setFilteringMode:", (int)objc_msgSend(v4, "decodeIntForKey:", @"_filteringMode"));
LABEL_13:

  return (SKTexture *)v6;
}

- (BOOL)isEqualToTexture:(id)a3
{
  id v4 = (SKTexture *)a3;
  objc_super v5 = v4;
  if (self == v4) {
    goto LABEL_33;
  }
  if (self->_isPath != v4->_isPath) {
    goto LABEL_20;
  }
  if (self->_performFullCapture != v4->_performFullCapture) {
    goto LABEL_20;
  }
  if (self->_disableAlpha != v4->_disableAlpha) {
    goto LABEL_20;
  }
  if (self->_isRotated != v4->_isRotated) {
    goto LABEL_20;
  }
  if (self->_isFlipped != v4->_isFlipped) {
    goto LABEL_20;
  }
  SKTextureFilteringMode v6 = [(SKTexture *)self filteringMode];
  if (v6 != [(SKTexture *)v5 filteringMode]) {
    goto LABEL_20;
  }
  [(SKTextureCache *)self->_textureCache size];
  double v8 = v7;
  [(SKTextureCache *)v5->_textureCache size];
  if (v8 != v9) {
    goto LABEL_20;
  }
  [(SKTextureCache *)self->_textureCache size];
  double v11 = v10;
  [(SKTextureCache *)v5->_textureCache size];
  if (v11 != v12) {
    goto LABEL_20;
  }
  [(SKTextureCache *)self->_textureCache pixelSize];
  double v14 = v13;
  [(SKTextureCache *)v5->_textureCache pixelSize];
  if (v14 != v15) {
    goto LABEL_20;
  }
  [(SKTextureCache *)self->_textureCache pixelSize];
  double v17 = v16;
  [(SKTextureCache *)v5->_textureCache pixelSize];
  if (v17 != v18) {
    goto LABEL_20;
  }
  if (self->_cropOffset.x != v5->_cropOffset.x) {
    goto LABEL_20;
  }
  if (self->_cropOffset.y != v5->_cropOffset.y) {
    goto LABEL_20;
  }
  if (self->_cropScale.x != v5->_cropScale.x) {
    goto LABEL_20;
  }
  if (self->_cropScale.y != v5->_cropScale.y) {
    goto LABEL_20;
  }
  if (self->_textRect.origin.x != v5->_textRect.origin.x) {
    goto LABEL_20;
  }
  if (self->_textRect.origin.y != v5->_textRect.origin.y) {
    goto LABEL_20;
  }
  if (self->_textRect.size.width != v5->_textRect.size.width) {
    goto LABEL_20;
  }
  if (self->_textRect.size.height != v5->_textRect.size.height) {
    goto LABEL_20;
  }
  originalAtlasName = self->_originalAtlasName;
  if ((unint64_t)originalAtlasName | (unint64_t)v5->_originalAtlasName)
  {
    if (!-[NSString isEqualToString:](originalAtlasName, "isEqualToString:")) {
      goto LABEL_20;
    }
  }
  subTextureName = self->_subTextureName;
  if ((unint64_t)subTextureName | (unint64_t)v5->_subTextureName)
  {
    if (!-[NSString isEqualToString:](subTextureName, "isEqualToString:")) {
      goto LABEL_20;
    }
  }
  if (![(NSString *)self->_imgName isEqualToString:v5->_imgName]) {
    goto LABEL_20;
  }
  if ([(SKTexture *)self performFullCapture])
  {
    if (!self->_originalTexture)
    {
      if (self->_isData != v5->_isData) {
        goto LABEL_20;
      }
      goto LABEL_32;
    }
LABEL_33:
    BOOL v19 = 1;
    goto LABEL_34;
  }
  if (self->_isData != v5->_isData) {
    goto LABEL_20;
  }
  if (!self->_isData) {
    goto LABEL_33;
  }
LABEL_32:
  id v22 = [(SKTexture *)self _copyImageData];
  id v23 = [(SKTexture *)v5 _copyImageData];
  char v24 = [v22 isEqual:v23];

  if (v24) {
    goto LABEL_33;
  }
LABEL_20:
  BOOL v19 = 0;
LABEL_34:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [v13 encodeObject:self->_originalAtlasName forKey:@"_originalAtlasName"];
  [v13 encodeObject:self->_subTextureName forKey:@"_subTextureName"];
  [v13 encodeBool:self->_isPath forKey:@"_isPath"];
  objc_msgSend(v13, "encodeBool:forKey:", -[SKTexture performFullCapture](self, "performFullCapture"), @"_isCapture");
  if ([(SKTexture *)self performFullCapture])
  {
    originalTexture = self->_originalTexture;
    if (originalTexture)
    {
      [v13 encodeObject:originalTexture forKey:@"_originalTexture"];
      goto LABEL_8;
    }
    [v13 encodeBool:1 forKey:@"_isData"];
    id v5 = [(SKTexture *)self _copyImageData];
    [v13 encodeObject:v5 forKey:@"_imageData"];
  }
  else
  {
    [v13 encodeBool:self->_isData forKey:@"_isData"];
    if (!self->_isData) {
      goto LABEL_8;
    }
    id v5 = [(SKTexture *)self _copyImageData];
    [v13 encodeObject:v5 forKey:@"_imageData"];
  }

LABEL_8:
  [v13 encodeObject:self->_imgName forKey:@"_imgName"];
  [v13 encodeBool:self->_disableAlpha forKey:@"_disableAlpha"];
  SKTextureFilteringMode v6 = (void *)MEMORY[0x263F08D40];
  [(SKTextureCache *)self->_textureCache size];
  double v7 = objc_msgSend(v6, "valueWithCGSize:");
  [v13 encodeObject:v7 forKey:@"_size"];

  double v8 = (void *)MEMORY[0x263F08D40];
  [(SKTextureCache *)self->_textureCache pixelSize];
  double v9 = objc_msgSend(v8, "valueWithCGSize:");
  [v13 encodeObject:v9 forKey:@"_pixelSize"];

  double v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", self->_textRect.origin.x, self->_textRect.origin.y, self->_textRect.size.width, self->_textRect.size.height);
  [v13 encodeObject:v10 forKey:@"_textRect"];

  double v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", self->_cropOffset.x, self->_cropOffset.y);
  [v13 encodeObject:v11 forKey:@"_cropOffset"];

  double v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", self->_cropScale.x, self->_cropScale.y);
  [v13 encodeObject:v12 forKey:@"_cropScale"];

  [v13 encodeBool:self->_isRotated forKey:@"_isRotated"];
  [v13 encodeBool:self->_isFlipped forKey:@"_isFlipped"];
  objc_msgSend(v13, "encodeInteger:forKey:", -[SKTexture filteringMode](self, "filteringMode"), @"_filteringMode");
}

+ (SKTexture)textureWithImageNamed:(NSString *)name
{
  id v4 = name;
  id v5 = (void *)[objc_alloc((Class)a1) initWithImageNamed:v4];

  return (SKTexture *)v5;
}

+ (SKTexture)textureWithImageNamed:(id)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  double v10 = (CGFloat *)[objc_alloc((Class)a1) initWithImageNamed:v9];
  v10[4] = x;
  v10[5] = y;
  v10[6] = width;
  v10[7] = height;

  return (SKTexture *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_imgName copy];
  SKTextureFilteringMode v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  CGSize size = self->_textRect.size;
  *(CGPoint *)(v4 + 32) = self->_textRect.origin;
  *(CGSize *)(v4 + 48) = size;
  *(unsigned char *)(v4 + 11) = self->_isPath;
  objc_msgSend(*(id *)(v4 + 184), "setHasAlpha:", -[SKTextureCache hasAlpha](self->_textureCache, "hasAlpha"));
  *(unsigned char *)(v4 + 96) = self->_disableAlpha;
  *(unsigned char *)(v4 + 10) = self->_needsExtrusionWorkaround;
  objc_storeStrong((id *)(v4 + 176), self->_subTextureName);
  objc_storeStrong((id *)(v4 + 168), self->_originalAtlasName);
  objc_storeStrong((id *)(v4 + 184), self->_textureCache);
  *(CGPoint *)(v4 + 120) = self->_cropOffset;
  *(unsigned char *)(v4 + 97) = self->_isRotated;
  *(unsigned char *)(v4 + 98) = self->_isFlipped;
  *(CGPoint *)(v4 + 104) = self->_cropScale;
  objc_storeStrong((id *)(v4 + 208), self->_rootAtlas);
  return (id)v4;
}

+ (SKTexture)textureWithRect:(CGRect)rect inTexture:(SKTexture *)texture
{
  double height = rect.size.height;
  double width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  double v10 = texture;
  if (SKGetLinkedOnOrAfter(655360) && (width < 0.0 || height < 0.0))
  {
    double v11 = (void *)MEMORY[0x263EFF940];
    v19.double width = width;
    v19.double height = height;
    double v12 = NSStringFromCGSize(v19);
    [v11 raise:*MEMORY[0x263EFF4A0], @"Invalid size specified (should be positive): %@", v12 format];
  }
  id v13 = objc_alloc_init((Class)a1);
  uint64_t v14 = [(NSString *)v10->_imgName copy];
  double v15 = (void *)*((void *)v13 + 2);
  *((void *)v13 + 2) = v14;

  objc_storeStrong((id *)v13 + 19, texture);
  objc_storeStrong((id *)v13 + 22, v10->_subTextureName);
  objc_storeStrong((id *)v13 + 21, v10->_originalAtlasName);
  *((CGFloat *)v13 + 4) = x;
  *((CGFloat *)v13 + 5) = y;
  *((double *)v13 + 6) = width;
  *((double *)v13 + 7) = height;
  *((unsigned char *)v13 + 11) = v10->_isPath;
  objc_storeStrong((id *)v13 + 26, v10->_rootAtlas);
  double v16 = v10->_textureCache;
  if (v16
    || (+[SKTexture lookupTextureCacheForName:*((void *)v13 + 2)], (double v16 = (SKTextureCache *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_storeStrong((id *)v13 + 23, v16);
  }
  else
  {
    objc_msgSend(*((id *)v13 + 23), "setHasAlpha:", -[SKTextureCache hasAlpha](v10->_textureCache, "hasAlpha"));
    *((unsigned char *)v13 + 96) = v10->_disableAlpha;
    [(SKTextureCache *)v10->_textureCache pixelSize];
    objc_msgSend(*((id *)v13 + 23), "setPixelSize:");
    [(SKTextureCache *)v10->_textureCache size];
    objc_msgSend(*((id *)v13 + 23), "setSize:");
    objc_msgSend(*((id *)v13 + 23), "setState:", -[SKTextureCache state](v10->_textureCache, "state"));
    double v16 = 0;
  }

  return (SKTexture *)v13;
}

+ (SKTexture)textureVectorNoiseWithSmoothness:(CGFloat)smoothness size:(CGSize)size
{
  uint64_t v5 = 0;
  double v21 = round(size.width);
  double v6 = fmax(v21, 0.0);
  if (v6 != 0.0)
  {
    double v7 = round(size.height);
    double v8 = fmax(v7, 0.0);
    if (v8 != 0.0)
    {
      uint64_t v5 = (id *)objc_alloc_init((Class)a1);
      objc_msgSend(v5[23], "setPixelData:", malloc_type_malloc(vcvtd_n_u64_f64(v6 * v8, 2uLL), 0x73BD441DuLL));
      uint64_t v9 = [v5[23] pixelData];
      __exp10(smoothness * -2.0 + 3.0);
      if (v7 > 0.0)
      {
        int v10 = 0;
        double v11 = 0.0;
        do
        {
          if (v21 > 0.0)
          {
            int v12 = 0;
            double v13 = 0.0;
            do
            {
              srdnoise3();
              uint64_t v14 = (unsigned char *)(v9 + (int)vcvtd_n_s64_f64(v13 + v11 * v6, 2uLL));
              unsigned char *v14 = (int)(float)((float)((float)(0.0 * 0.10206) + 0.5) * 255.0);
              v14[1] = (int)(float)((float)((float)(0.0 * 0.10206) + 0.5) * 255.0);
              v14[2] = (int)(float)((float)((float)(0.0 * 0.10206) + 0.5) * 255.0);
              v14[3] = (int)(float)((float)((float)(v15 * 0.5) + 0.5) * 255.0);
              double v13 = (double)++v12;
            }
            while (v6 > (double)v12);
          }
          double v11 = (double)++v10;
        }
        while (v8 > (double)v10);
      }
      unsigned int v16 = v8;
      if (v6) {
        BOOL v17 = v16 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      BOOL v19 = 0;
      if (!v17)
      {
        int32x2_t v18 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v6, v16), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v6, v16), (int32x2_t)-1)));
        if (v18.i8[4] & 1) != 0 && (v18.i8[0]) {
          BOOL v19 = 1;
        }
      }
      [v5[23] setIsPOT:v19];
      [v5[23] setHasAlpha:1];
      objc_msgSend(v5[23], "setPixelSize:", v6, v8);
      objc_msgSend(v5[23], "setSize:", v6, v8);
      *((unsigned char *)v5 + 12) = 1;
      [v5[23] setState:1];
    }
  }

  return (SKTexture *)v5;
}

+ (SKTexture)textureNoiseWithSmoothness:(CGFloat)smoothness size:(CGSize)size grayscale:(BOOL)grayscale
{
  double v6 = 0;
  double v30 = round(size.width);
  double v7 = fmax(v30, 0.0);
  if (v7 != 0.0)
  {
    double v8 = round(size.height);
    double v9 = fmax(v8, 0.0);
    if (v9 != 0.0)
    {
      double v6 = (id *)objc_alloc_init((Class)a1);
      objc_msgSend(v6[23], "setPixelData:", malloc_type_malloc(vcvtd_n_u64_f64(v7 * v9, 2uLL), 0xE4EE1079uLL));
      uint64_t v11 = [v6[23] pixelData];
      __exp10(smoothness * -2.0 + 3.0);
      if (v8 > 0.0)
      {
        int v12 = 0;
        double v13 = 0.0;
        float32x4_t v34 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        double v29 = v9;
        do
        {
          if (v30 > 0.0)
          {
            int v14 = 0;
            double v15 = 0.0;
            do
            {
              snoise2();
              v17.i32[0] = v16;
              __int32 v18 = v16;
              __int32 v19 = v16;
              if (!grayscale)
              {
                __int32 v33 = v16;
                snoise2();
                __int32 v32 = v20;
                snoise2();
                __int32 v31 = v21;
                snoise2();
                __int32 v18 = v32;
                v17.i32[0] = v33;
                __int32 v19 = v31;
              }
              v17.i32[1] = v18;
              v17.i64[1] = __PAIR64__(v16, v19);
              v22.i64[0] = 0x3F0000003F000000;
              v22.i64[1] = 0x3F0000003F000000;
              int16x8_t v23 = (int16x8_t)vcvtq_s32_f32(vmulq_f32(vmlaq_f32(v22, v22, v17), v34));
              *(int16x4_t *)v23.i8 = vmovn_s32((int32x4_t)v23);
              *(_DWORD *)(v11 + (int)vcvtd_n_s64_f64(v15 + v13 * v7, 2uLL)) = vmovn_s16(v23).u32[0];
              double v15 = (double)++v14;
            }
            while (v7 > (double)v14);
          }
          double v13 = (double)++v12;
          double v9 = v29;
        }
        while (v29 > (double)v12);
      }
      unsigned int v24 = v9;
      if (v7) {
        BOOL v25 = v24 == 0;
      }
      else {
        BOOL v25 = 1;
      }
      BOOL v27 = 0;
      if (!v25)
      {
        int32x2_t v26 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v7, v24), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v7, v24), (int32x2_t)-1)));
        if (v26.i8[4] & 1) != 0 && (v26.i8[0]) {
          BOOL v27 = 1;
        }
      }
      [v6[23] setIsPOT:v27];
      [v6[23] setHasAlpha:1];
      objc_msgSend(v6[23], "setPixelSize:", v7, v9);
      objc_msgSend(v6[23], "setSize:", v7, v9);
      *((unsigned char *)v6 + 12) = 1;
      [v6[23] setState:1];
    }
  }

  return (SKTexture *)v6;
}

+ (SKTexture)textureWithCGImage:(CGImage *)a3 pointSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = objc_alloc_init((Class)a1);
  v7[12] = 1;
  objc_msgSend(v7, "loadImageDataFromCGImage:pointsSize:", a3, width, height);

  return (SKTexture *)v7;
}

+ (SKTexture)textureWithCGImage:(CGImageRef)image
{
  return (SKTexture *)objc_msgSend(a1, "textureWithCGImage:pointSize:", image, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

+ (SKTexture)textureWithImage:(UIImage *)image
{
  uint64_t v4 = image;
  uint64_t v5 = [(UIImage *)v4 CGImage];
  [(UIImage *)v4 size];
  double v6 = objc_msgSend(a1, "textureWithCGImage:pointSize:", v5);

  return (SKTexture *)v6;
}

+ (SKTexture)textureWithData:(NSData *)pixelData size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  double v7 = pixelData;
  double v8 = 0;
  if (v7 && width > 0.0 && height > 0.0)
  {
    double v8 = (id *)objc_alloc_init((Class)a1);
    unsigned int v9 = vcvtpd_u64_f64(width);
    unsigned int v10 = vcvtpd_u64_f64(height);
    objc_msgSend(v8[23], "setPixelData:", malloc_type_malloc(4 * v10 * v9, 0x100004077774924uLL));
    memcpy((void *)[v8[23] pixelData], -[NSData bytes](v7, "bytes"), 4 * v10 * v9);
    if (!v9 || !v10) {
      goto LABEL_11;
    }
    v11.i32[0] = v9;
    int8x8_t v12 = vcnt_s8(v11);
    v12.i16[0] = vaddlv_u8((uint8x8_t)v12);
    unsigned int v13 = v12.i32[0];
    v12.i32[0] = v10;
    uint8x8_t v14 = (uint8x8_t)vcnt_s8(v12);
    v14.i16[0] = vaddlv_u8(v14);
    if (v13 <= 1 && v14.i32[0] < 2u) {
      uint64_t v16 = 1;
    }
    else {
LABEL_11:
    }
      uint64_t v16 = 0;
    [v8[23] setIsPOT:v16];
    [v8[23] setHasAlpha:1];
    objc_msgSend(v8[23], "setPixelSize:", width, height);
    objc_msgSend(v8[23], "setSize:", width, height);
    *((unsigned char *)v8 + 12) = 1;
    [v8[23] setState:1];
  }

  return (SKTexture *)v8;
}

+ (SKTexture)textureWithData:(NSData *)pixelData size:(CGSize)size flipped:(BOOL)flipped
{
  double height = size.height;
  double width = size.width;
  unsigned int v9 = pixelData;
  unsigned int v10 = 0;
  if (v9 && width > 0.0 && height > 0.0)
  {
    if (flipped)
    {
      unsigned int v10 = (id *)objc_alloc_init((Class)a1);
      unsigned int v11 = vcvtpd_u64_f64(width);
      unsigned int v12 = vcvtpd_u64_f64(height);
      objc_msgSend(v10[23], "setPixelData:", malloc_type_malloc(4 * v12 * v11, 0x100004077774924uLL));
      uint64_t v13 = [(NSData *)v9 bytes];
      uint64_t v14 = [v10[23] pixelData];
      if (v12)
      {
        uint64_t v16 = (char *)v14;
        uint64_t v17 = 4 * v11;
        __int32 v18 = (char *)(v13 + v17 * (v12 + 0x3FFFFFFF));
        unsigned int v19 = v12;
        do
        {
          memcpy(v16, v18, 4 * v11);
          v16 += v17;
          v18 -= v17;
          --v19;
        }
        while (v19);
      }
      if (!v11 || !v12) {
        goto LABEL_16;
      }
      v15.i32[0] = v11;
      int8x8_t v20 = vcnt_s8(v15);
      v20.i16[0] = vaddlv_u8((uint8x8_t)v20);
      unsigned int v21 = v20.i32[0];
      v20.i32[0] = v12;
      uint8x8_t v22 = (uint8x8_t)vcnt_s8(v20);
      v22.i16[0] = vaddlv_u8(v22);
      if (v21 <= 1 && v22.i32[0] < 2u) {
        uint64_t v24 = 1;
      }
      else {
LABEL_16:
      }
        uint64_t v24 = 0;
      [v10[23] setIsPOT:v24];
      [v10[23] setHasAlpha:1];
      objc_msgSend(v10[23], "setPixelSize:", width, height);
      objc_msgSend(v10[23], "setSize:", width, height);
      *((unsigned char *)v10 + 12) = 1;
      [v10[23] setState:1];
    }
    else
    {
      objc_msgSend(a1, "textureWithData:size:", v9, width, height);
      unsigned int v10 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }

  return (SKTexture *)v10;
}

+ (SKTexture)textureWithData:(NSData *)pixelData size:(CGSize)size rowLength:(unsigned int)rowLength alignment:(unsigned int)alignment
{
  double height = size.height;
  double width = size.width;
  unsigned int v11 = pixelData;
  unsigned int v12 = 0;
  if (v11 && width > 0.0 && height > 0.0)
  {
    unsigned int v12 = (id *)objc_alloc_init((Class)a1);
    unsigned int v13 = vcvtpd_u64_f64(width);
    unsigned int v14 = vcvtpd_u64_f64(height);
    objc_msgSend(v12[23], "setPixelData:", malloc_type_malloc(4 * v14 * v13, 0x100004077774924uLL));
    memcpy((void *)[v12[23] pixelData], -[NSData bytes](v11, "bytes"), 4 * v14 * v13);
    if (!v13 || !v14) {
      goto LABEL_11;
    }
    v15.i32[0] = v13;
    int8x8_t v16 = vcnt_s8(v15);
    v16.i16[0] = vaddlv_u8((uint8x8_t)v16);
    unsigned int v17 = v16.i32[0];
    v16.i32[0] = v14;
    uint8x8_t v18 = (uint8x8_t)vcnt_s8(v16);
    v18.i16[0] = vaddlv_u8(v18);
    if (v17 <= 1 && v18.i32[0] < 2u) {
      uint64_t v20 = 1;
    }
    else {
LABEL_11:
    }
      uint64_t v20 = 0;
    [v12[23] setIsPOT:v20];
    [v12[23] setHasAlpha:1];
    objc_msgSend(v12[23], "setPixelSize:", width, height);
    objc_msgSend(v12[23], "setSize:", width, height);
    *((unsigned char *)v12 + 12) = 1;
    *((_DWORD *)v12 + 34) = alignment;
    *((_DWORD *)v12 + 35) = rowLength;
    [v12[23] setState:1];
  }

  return (SKTexture *)v12;
}

- (BOOL)hasAlpha
{
  return [(SKTextureCache *)self->_textureCache hasAlpha];
}

- (CGRect)textureRect
{
  double x = self->_textRect.origin.x;
  double y = self->_textRect.origin.y;
  double width = self->_textRect.size.width;
  double height = self->_textRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)size
{
  [(SKTexture *)self _ensureImageData];
  [(SKTextureCache *)self->_textureCache size];
  double v4 = v3;
  double v6 = v5;
  [(SKTexture *)self textureRect];
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(SKTexture *)self isRotated];
  double v12 = v4 * v8;
  [(SKTexture *)self cropScale];
  double v14 = v13;
  double v16 = v15;
  double v17 = v6 * v10;
  [(SKTexture *)self cropScale];
  double v20 = v17 / v19;
  if (!v11) {
    double v20 = v12 / v14;
  }
  double v21 = v17 / v18;
  if (v11) {
    double v21 = v12 / v16;
  }
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (SKTexture)textureByApplyingCIFilter:(CIFilter *)filter
{
  double v4 = filter;
  double v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  double v6 = self;
  [(SKTexture *)v6 _ensureImageData];
  double v7 = (void *)[(CIFilter *)v4 copy];
  [(SKTextureCache *)v6->_textureCache pixelSize];
  double v9 = v8;
  [(SKTextureCache *)v6->_textureCache pixelSize];
  if (v4)
  {
    double v11 = v10;
    double v12 = (void *)MEMORY[0x263F00650];
    double v13 = [MEMORY[0x263F00608] colorWithRed:1.0 green:1.0 blue:1.0];
    double v14 = [v12 imageWithColor:v13];

    double v15 = objc_msgSend(v14, "imageByCroppingToRect:", 0.0, 0.0, v9, v11);

    [v7 setValue:v15 forKey:@"inputImage"];
    double v16 = [v7 valueForKey:@"outputImage"];
    [v16 extent];
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v18 = *MEMORY[0x263F001B0];
    double v20 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  unsigned int v21 = vcvtpd_u64_f64(v18);
  BOOL v24 = 0;
  if (v21)
  {
    unsigned int v22 = vcvtpd_u64_f64(v20);
    int32x2_t v23 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v21, v22), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v21, v22), (int32x2_t)-1)));
    if (v23.i8[4] & 1) != 0 && v22 && (v23.i8[0]) {
      BOOL v24 = 1;
    }
  }
  [v5[23] setIsPOT:v24];
  objc_storeStrong(v5 + 18, v7);
  objc_storeStrong(v5 + 19, self);
  [v5[23] setState:1];
  objc_msgSend(v5[23], "setPixelSize:", v18, v20);
  [(SKTextureCache *)v6->_textureCache size];
  double v26 = v25;
  [(SKTextureCache *)v6->_textureCache pixelSize];
  double v28 = v27;
  [v5[23] pixelSize];
  double v30 = v29;
  [(SKTextureCache *)v6->_textureCache size];
  double v32 = v31;
  [(SKTextureCache *)v6->_textureCache pixelSize];
  double v34 = v33;
  [v5[23] pixelSize];
  objc_msgSend(v5[23], "setSize:", v26 / v28 * v30, v32 / v34 * v35);

  return (SKTexture *)v5;
}

- (id)description
{
  if (self->_isData)
  {
    double v3 = @"<data>";
    goto LABEL_8;
  }
  subTextureName = self->_subTextureName;
  if (subTextureName)
  {
    double v5 = subTextureName;
LABEL_7:
    double v3 = v5;
    goto LABEL_8;
  }
  imgName = self->_imgName;
  if (imgName)
  {
    double v5 = [(NSString *)imgName lastPathComponent];
    goto LABEL_7;
  }
  filter = self->_filter;
  if (filter)
  {
    double v14 = NSString;
    double v15 = [(CIFilter *)filter name];
    double v16 = [(SKTexture *)self->_originalTexture imageNameOrPath];
    double v17 = [v16 lastPathComponent];
    uint64_t v18 = [v14 stringWithFormat:@"<%@(%@)>", v15, v17];

    double v3 = (__CFString *)v18;
  }
  else
  {
    double v3 = 0;
  }
LABEL_8:
  double v7 = NSString;
  [(SKTexture *)self pixelSize];
  double v9 = v8;
  [(SKTexture *)self pixelSize];
  double v11 = [v7 stringWithFormat:@"<SKTexture> '%@' (%d x %d)", v3, (int)v9, (int)v10];

  return v11;
}

- (BOOL)usesMipmaps
{
  return self->_shouldGenerateMipmaps;
}

- (void)setUsesMipmaps:(BOOL)usesMipmaps
{
  self->_shouldGenerateMipmaps = usesMipmaps;
}

- (void)_ensureImageData
{
  textureCache = self->_textureCache;
  if (!textureCache || [(SKTextureCache *)textureCache state] != 1)
  {
    [(SKTexture *)self loadImageData];
  }
}

- (void)setWrapMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(SKTexture *)self _ensureImageData];
  if ([(SKTextureCache *)self->_textureCache wrapMode] != v3)
  {
    textureCache = self->_textureCache;
    [(SKTextureCache *)textureCache setWrapMode:v3];
  }
}

- (int)wrapMode
{
  [(SKTexture *)self _ensureImageData];
  textureCache = self->_textureCache;

  return [(SKTextureCache *)textureCache wrapMode];
}

- (void)setFilteringMode:(SKTextureFilteringMode)filteringMode
{
  [(SKTexture *)self _ensureImageData];
  if ([(SKTextureCache *)self->_textureCache filteringMode] != filteringMode)
  {
    textureCache = self->_textureCache;
    [(SKTextureCache *)textureCache setFilteringMode:filteringMode];
  }
}

- (SKTextureFilteringMode)filteringMode
{
  [(SKTexture *)self _ensureImageData];
  textureCache = self->_textureCache;

  return [(SKTextureCache *)textureCache filteringMode];
}

- (void)dealloc
{
  textureCache = self->_textureCache;
  self->_textureCache = 0;

  imgName = self->_imgName;
  self->_imgName = 0;

  v5.receiver = self;
  v5.super_class = (Class)SKTexture;
  [(SKTexture *)&v5 dealloc];
}

+ (id)_textureWithImageNamed:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_alloc_init((Class)a1);
  double v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 pathForResource:v4 ofType:0];
  double v8 = (void *)v5[2];
  v5[2] = v7;

  *((unsigned char *)v5 + 11) = 1;

  return v5;
}

- (CGPoint)cropScale
{
  double x = self->_cropScale.x;
  double y = self->_cropScale.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCropScale:(CGPoint)a3
{
  self->_cropScale = a3;
}

- (CGPoint)cropOffset
{
  double x = self->_cropOffset.x;
  double y = self->_cropOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCropOffset:(CGPoint)a3
{
  self->_cropOffset = a3;
}

- (NSString)originalAtlasName
{
  return self->_originalAtlasName;
}

- (void)setOriginalAtlasName:(id)a3
{
}

- (NSString)subTextureName
{
  return self->_subTextureName;
}

- (void)setSubTextureName:(id)a3
{
}

- (BOOL)performFullCapture
{
  return self->_performFullCapture;
}

- (void)setPerformFullCapture:(BOOL)a3
{
  self->_performFullCapture = a3;
}

- (BOOL)isRepeatable
{
  return self->_isRepeatable;
}

- (SKTextureAtlas)rootAtlas
{
  return self->_rootAtlas;
}

- (void)setRootAtlas:(id)a3
{
}

- (unsigned)alphaMap
{
  return self->_alphaMap;
}

- (CGSize)alphaMapSize
{
  double width = self->_alphaMapSize.width;
  double height = self->_alphaMapSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNeedsExtrusionWorkaround:(BOOL)a3
{
  self->_needsExtrusionWorkaround = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootAtlas, 0);
  objc_storeStrong((id *)&self->_textureSyncQueue, 0);
  objc_storeStrong((id *)&self->_textureCache, 0);
  objc_storeStrong((id *)&self->_subTextureName, 0);
  objc_storeStrong((id *)&self->_originalAtlasName, 0);
  objc_storeStrong((id *)&self->_originalTexture, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_searchPaths, 0);

  objc_storeStrong((id *)&self->_imgName, 0);
}

- (SKTexture)initWithBackingTetxure:(shared_ptr<jet_texture>)a3
{
  ptr = a3.__ptr_;
  objc_super v5 = *(uint64_t (****)(void, SEL))a3.__ptr_;
  double v6 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v13 = *(void *)a3.__ptr_;
  double v14 = v6;
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    objc_super v5 = *(uint64_t (****)(void, SEL))a3.__ptr_;
  }
  unsigned int v7 = (**v5)(v5, a2);
  __n128 v8 = ((__n128 (*)(void))*(void *)(**(void **)ptr + 8))(*(void *)ptr);
  v8.n128_f32[0] = (float)v7;
  *(float *)&double v10 = (float)v9;
  double v11 = [(SKTexture *)self initWithBackingTetxure:&v13 logicalWidth:v8.n128_f64[0] height:v10];
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  return v11;
}

- (SKTexture)initWithBackingTetxure:(shared_ptr<jet_texture>)a3 logicalWidth:(float)a4 height:(float)a5
{
  ptr = a3.__ptr_;
  __n128 v8 = [(SKTexture *)self init];
  unsigned int v9 = v8;
  if (v8)
  {
    double v10 = v8;
    unsigned int v11 = (***(uint64_t (****)(void))ptr)();
    unsigned int v12 = (*(uint64_t (**)(void))(**(void **)ptr + 8))();
    unsigned int v13 = v12;
    BOOL v15 = 0;
    if (v11)
    {
      int32x2_t v14 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v11, v12), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v11, v12), (int32x2_t)-1)));
      if (v14.i8[4] & 1) != 0 && v12 && (v14.i8[0]) {
        BOOL v15 = 1;
      }
    }
    [(SKTextureCache *)v10->_textureCache setIsPOT:v15];
    imgName = v10->_imgName;
    v10->_imgName = 0;

    -[SKTextureCache setPixelSize:](v10->_textureCache, "setPixelSize:", (double)v11, (double)v13);
    -[SKTextureCache setSize:](v10->_textureCache, "setSize:", a4, a5);
    [(SKTextureCache *)v10->_textureCache setState:1];
    textureCache = v10->_textureCache;
    uint64_t v18 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v20 = *(void *)ptr;
    unsigned int v21 = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(SKTextureCache *)textureCache setBackingTexture:&v20];
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
  }

  return v9;
}

- (shared_ptr<jet_texture>)_backingTexture
{
  id v4 = v2;
  textureCache = self->_textureCache;
  if (!textureCache || [(SKTextureCache *)textureCache state] != 1) {
    [(SKTexture *)self loadImageData];
  }
  double v6 = self->_textureCache;
  if (v6)
  {
    [(SKTextureCache *)v6 backingTexture];
    if (v25)
    {
      __n128 v8 = v26;
      uint64_t *v4 = v25;
      v4[1] = (uint64_t)v8;
      id v4 = &v25;
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v25 = 0;
    double v26 = 0;
  }
  [(SKTextureCache *)self->_textureCache pixelSize];
  double v10 = v9;
  [(SKTextureCache *)self->_textureCache pixelSize];
  double v12 = v11;
  unsigned int v13 = self->_textureCache;
  if (!v13) {
    goto LABEL_32;
  }
  [(SKTextureCache *)v13 backingTexture];
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (!v23)
  {
LABEL_32:
    if ([(SKTextureCache *)self->_textureCache pixelData])
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __38__SKTexture_Internal___backingTexture__block_invoke;
      v20[3] = &unk_263FEA2A8;
      unsigned int v21 = vcvtpd_u64_f64(v10);
      unsigned int v22 = vcvtpd_u64_f64(v12);
      v20[4] = self;
      SKCPerformResourceOperation(v20);
      free([(SKTextureCache *)self->_textureCache pixelData]);
      [(SKTextureCache *)self->_textureCache setPixelData:0];
    }
    else
    {
      originalTexture = self->_originalTexture;
      if (originalTexture && self->_filter)
      {
        [(SKTexture *)originalTexture _backingTexture];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3321888768;
        id v18[2] = __38__SKTexture_Internal___backingTexture__block_invoke_2;
        v18[3] = &unk_26BEEE028;
        v18[5] = v23;
        double v19 = v24;
        if (v24) {
          atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v18[4] = self;
        SKCPerformResourceOperation(v18);
        double v17 = self->_originalTexture;
        self->_originalTexture = 0;

        if (v19) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v19);
        }
        if (v24) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v24);
        }
      }
    }
  }
  int32x2_t v14 = self->_textureCache;
  if (v14)
  {
    [(SKTextureCache *)v14 backingTexture];
    goto LABEL_17;
  }
LABEL_16:
  uint64_t *v4 = 0;
  v4[1] = 0;
LABEL_17:
  BOOL v15 = (jet_texture *)v26;
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
  result.__cntrl_ = v7;
  result.__ptr_ = v15;
  return result;
}

void __38__SKTexture_Internal___backingTexture__block_invoke(uint64_t a1)
{
  kdebug_trace();
  [*(id *)(*(void *)(a1 + 32) + 184) textureFormat];
  [*(id *)(*(void *)(a1 + 32) + 184) pixelData];
  uint64_t texture_2d = jet_context::create_texture_2d();
  std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v3, texture_2d);
}

void __38__SKTexture_Internal___backingTexture__block_invoke_2(uint64_t a1, void *a2)
{
  (*(void (**)(void, void))(*(void *)*a2 + 48))(*a2, *(void *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 144) setValue:objc_claimAutoreleasedReturnValue() forKey:@"inputImage"];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 144) valueForKey:@"outputImage"];
  uint64_t v5 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a2 + 40))(*a2, v4);
  std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v6, v5);
}

- (void)setIsData:(BOOL)a3
{
  self->_isData = a3;
}

- (void)_setImageName:(id)a3
{
  self->_isData = 0;
}

- (CGSize)pixelSize
{
  [(SKTexture *)self _ensureImageData];
  [(SKTextureCache *)self->_textureCache pixelSize];
  double v4 = v3;
  double v6 = v5;
  [(SKTexture *)self textureRect];
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(SKTexture *)self isRotated];
  double v12 = v4 * v8;
  [(SKTexture *)self cropScale];
  double v14 = v13;
  double v16 = v15;
  double v17 = v6 * v10;
  [(SKTexture *)self cropScale];
  double v19 = v17 / v18;
  double v21 = v17 / v20;
  if (v11) {
    double v21 = v12 / v16;
  }
  else {
    double v19 = v12 / v14;
  }
  double v22 = fabs(v19);
  double v23 = fabs(v21);
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (BOOL)isRotated
{
  return self->_isRotated;
}

- (void)setIsRotated:(BOOL)a3
{
  self->_isRotated = a3;
}

- (BOOL)isFlipped
{
  return self->_isFlipped;
}

- (void)setIsFlipped:(BOOL)a3
{
  self->_isFlipped = a3;
}

- (unsigned)textureTarget
{
  return self->_textureTarget;
}

- (void)setTextureTarget:(unsigned int)a3
{
  self->_textureTarget = a3;
}

+ (void)_reloadTextureCacheForImageNamed:(id)a3
{
  id v3 = [(id)_textureTable objectForKey:a3];
  if (v3) {
    [v3 _reset];
  }
}

+ (id)_cachedTextureNames
{
  id v2 = [(id)_textureTable keyEnumerator];
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)_textureTable, "count"));
  double v4 = 0;
  while (1)
  {
    uint64_t v5 = [v2 nextObject];

    if (!v5) {
      break;
    }
    double v4 = (void *)v5;
    [v3 addObject:v5];
  }

  return v3;
}

- (id)_copyImageData
{
  if (self->_originalTexture) {
    self = self->_originalTexture;
  }
  id v2 = [(SKTexture *)self _createCGImage];
  id v3 = [MEMORY[0x263F1C6B0] imageWithCGImage:v2];
  double v4 = UIImagePNGRepresentation(v3);
  CGImageRelease(v2);

  return v4;
}

+ (id)compressedTextureWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (_DWORD *)[v4 bytes];
  if (v5[11] == 559044176)
  {
    double v6 = (id *)objc_alloc_init((Class)a1);
    size_t v7 = v5[5];
    objc_msgSend(v6[23], "setPixelData:", malloc_type_malloc(v7, 0xF634550uLL));
    memcpy((void *)[v6[23] pixelData], (const void *)(objc_msgSend(v4, "bytes") + 52), v7);
    unsigned int v8 = v5[1];
    LODWORD(v7) = v5[2];
    [v6[23] setHasAlpha:v5[10] != 0];
    objc_msgSend(v6[23], "setPixelSize:", (double)v7, (double)v8);
    objc_msgSend(v6[23], "setSize:", (double)v7, (double)v8);
    *((unsigned char *)v6 + 12) = 1;
    [v6[23] setState:1];
    free((void *)[v6[23] pixelData]);
  }
  return 0;
}

+ (id)compressedTextureWithData:(id)a3 size:(CGSize)a4 bitsPerPixel:(unsigned int)a5 hasAlpha:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  if (v11 && width > 0.0 && height > 0.0 && (a5 == 4 || a5 == 2))
  {
    double v12 = (id *)objc_alloc_init((Class)a1);
    double v13 = ceil(width);
    double v14 = ceil(height);
    double v15 = 3.0;
    if (v6) {
      double v15 = 4.0;
    }
    size_t v16 = (unint64_t)(v15 * (v13 * v14 * (double)a5)) >> 3;
    objc_msgSend(v12[23], "setPixelData:", malloc_type_malloc(v16, 0x2C8D4E4BuLL));
    memcpy((void *)[v12[23] pixelData], (const void *)objc_msgSend(v11, "bytes"), v16);
    [v12[23] setHasAlpha:v6];
    objc_msgSend(v12[23], "setPixelSize:", v13, v14);
    objc_msgSend(v12[23], "setSize:", v13, v14);
    *((unsigned char *)v12 + 12) = 1;
    [v12[23] setState:1];
    free((void *)[v12[23] pixelData]);
  }
  return 0;
}

- (id)_generateNormalMap:(double)a3 contrast:(double)a4 multiPass:(unint64_t)a5
{
  double v9 = [(SKTexture *)self _createCGImage];
  double v10 = v9;
  if (v9)
  {
    size_t Width = CGImageGetWidth(v9);
    size_t Height = CGImageGetHeight(v10);
    unsigned int v13 = Height;
    double v14 = (double)Height;
    double v15 = malloc_type_malloc((4 * Width * Height), 0x15DC9E00uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    double v17 = CGBitmapContextCreate(v15, Width, v13, 8uLL, (4 * Width), DeviceRGB, 0x4001u);
    CGColorSpaceRelease(DeviceRGB);
    v21.origin.double x = 0.0;
    v21.origin.double y = 0.0;
    v21.size.double width = (double)Width;
    v21.size.double height = v14;
    CGContextClearRect(v17, v21);
    CGContextTranslateCTM(v17, 0.0, v14);
    CGContextScaleCTM(v17, 1.0, -1.0);
    v22.origin.double x = 0.0;
    v22.origin.double y = 0.0;
    v22.size.double width = (double)Width;
    v22.size.double height = v14;
    CGContextDrawImage(v17, v22, v10);
    CGContextRelease(v17);
    CGImageRelease(v10);
    if (SKGenerateNormalMapWithMultiSampling(Width, v13, (unsigned int *)v15, a5, a3, a4))
    {
      double v18 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v15 length:4 * (unint64_t)(double)Width * (unint64_t)v14];
      +[SKTexture textureWithData:size:](SKTexture, "textureWithData:size:", v18, (double)Width, v14);
      double v10 = (CGImage *)objc_claimAutoreleasedReturnValue();
      *((unsigned char *)v10 + 97) = self->_isRotated;
    }
    else
    {
      free(v15);
      double v10 = 0;
    }
  }

  return v10;
}

- (NSString)imageNameOrPath
{
  return self->_imgName;
}

+ (SKTexture)textureWithImagePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithImagePath:v4];

  return (SKTexture *)v5;
}

+ (id)_textureByTransferingData:(char *)a3 size:(CGSize)a4
{
  id v4 = 0;
  if (a3)
  {
    double width = a4.width;
    if (a4.width > 0.0)
    {
      double height = a4.height;
      if (a4.height > 0.0)
      {
        id v4 = (id *)objc_alloc_init((Class)a1);
        [v4[23] setPixelData:a3];
        [v4[23] setHasAlpha:1];
        double v8 = ceil(width);
        double v9 = ceil(height);
        objc_msgSend(v4[23], "setPixelSize:", v8, v9);
        objc_msgSend(v4[23], "setSize:", v8, v9);
        *((unsigned char *)v4 + 12) = 1;
        [v4[23] setState:1];
      }
    }
  }

  return v4;
}

+ (id)_textureByTransferingData:(char *)a3 size:(CGSize)a4 rowLength:(unsigned int)a5 alignment:(unsigned int)a6
{
  BOOL v6 = 0;
  if (a3)
  {
    double width = a4.width;
    if (a4.width > 0.0)
    {
      double height = a4.height;
      if (a4.height > 0.0)
      {
        BOOL v6 = (id *)objc_alloc_init((Class)a1);
        [v6[23] setPixelData:a3];
        double v12 = ceil(width);
        double v13 = ceil(height);
        unsigned int v14 = v13;
        if (v12) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        BOOL v17 = 0;
        if (!v15)
        {
          int32x2_t v16 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v12, v14), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v12, v14), (int32x2_t)-1)));
          if (v16.i8[4] & 1) != 0 && (v16.i8[0]) {
            BOOL v17 = 1;
          }
        }
        [v6[23] setIsPOT:v17];
        [v6[23] setHasAlpha:1];
        objc_msgSend(v6[23], "setPixelSize:", v12, v13);
        objc_msgSend(v6[23], "setSize:", v12, v13);
        *((unsigned char *)v6 + 12) = 1;
        [v6[23] setState:1];
        *((_DWORD *)v6 + 34) = a6;
        *((_DWORD *)v6 + 35) = a5;
      }
    }
  }

  return v6;
}

+ (id)_textureWithGLTextureId:(unsigned int)a3 size:(CGSize)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)a1), "_initWithGLTextureId:size:", *(void *)&a3, a4.width, a4.height);

  return v4;
}

- (id)_initWithGLTextureId:(unsigned int)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  BOOL v6 = [(SKTexture *)self init];
  size_t v7 = v6;
  if (v6)
  {
    double v8 = v6;
    double v9 = v8;
    unsigned int v10 = vcvtpd_u64_f64(width);
    unsigned int v11 = vcvtpd_u64_f64(height);
    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    BOOL v14 = 0;
    if (!v12)
    {
      int32x2_t v13 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v10, v11), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v10, v11), (int32x2_t)-1)));
      if (v13.i8[4] & 1) != 0 && (v13.i8[0]) {
        BOOL v14 = 1;
      }
    }
    [(SKTextureCache *)v8->_textureCache setIsPOT:v14];
    imgName = v9->_imgName;
    v9->_imgName = 0;

    v9->_isData = 1;
    [(SKTextureCache *)v9->_textureCache setPixelData:0];
    -[SKTextureCache setPixelSize:](v9->_textureCache, "setPixelSize:", width, height);
    -[SKTextureCache setSize:](v9->_textureCache, "setSize:", width, height);
    [(SKTextureCache *)v9->_textureCache setState:1];
  }

  return v7;
}

- (int)glTextureId
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  [(SKTexture *)self _backingTexture];
  if (v6)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3321888768;
    v4[2] = __33__SKTexture_Private__glTextureId__block_invoke;
    v4[3] = &unk_26BEEE060;
    v4[4] = &v8;
    v4[5] = v6;
    uint64_t v5 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    SKCPerformResourceOperation(v4);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  int v2 = *((_DWORD *)v9 + 6);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  _Block_object_dispose(&v8, 8);
  return v2;
}

void __33__SKTexture_Private__glTextureId__block_invoke(uint64_t a1, void *a2)
{
  if (!(*(unsigned int (**)(void))(*(void *)*a2 + 136))())
  {
    id v4 = (void *)*a2;
    if (*a2 && (id v4 = __dynamic_cast(v4, MEMORY[0x263F50770], MEMORY[0x263F50780], 0)) != 0)
    {
      uint64_t v5 = (std::__shared_weak_count *)a2[1];
      if (v5) {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (*(uint64_t (**)(void *, void))(*(void *)v4 + 392))(v4, *(void *)(a1 + 40));
    if (v5)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

+ (SKTexture)textureWithIOSurfaceID:(unsigned int)a3 width:(unsigned int)a4 height:(unsigned int)a5 format:(unsigned int)a6
{
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x4012000000;
  double v20 = __Block_byref_object_copy__4;
  CGRect v21 = __Block_byref_object_dispose__4;
  CGRect v22 = "";
  uint64_t v23 = 0;
  BOOL v24 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__SKTexture_Private__textureWithIOSurfaceID_width_height_format___block_invoke;
  v12[3] = &unk_263FEA2D0;
  v12[4] = &v17;
  unsigned int v13 = a3;
  unsigned int v14 = a4;
  unsigned int v15 = a5;
  unsigned int v16 = a6;
  SKCPerformResourceOperation(v12);
  if (v18[6])
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    size_t v7 = (std::__shared_weak_count *)v18[7];
    uint64_t v10 = v18[6];
    int v11 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = (void *)[v6 initWithBackingTetxure:&v10];
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  _Block_object_dispose(&v17, 8);
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }

  return (SKTexture *)v8;
}

void __65__SKTexture_Private__textureWithIOSurfaceID_width_height_format___block_invoke(unsigned int *a1, void *a2)
{
  uint64_t v2 = (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)*a2 + 32))(*a2, a1[10], a1[11], a1[12], a1[13], 0);
  std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v3, v2);
}

+ (SKTexture)textureWithMetalTexture:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x4012000000;
  uint64_t v17 = __Block_byref_object_copy__4;
  double v18 = __Block_byref_object_dispose__4;
  uint64_t v19 = "";
  uint64_t v20 = 0;
  CGRect v21 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__SKTexture_Private__textureWithMetalTexture___block_invoke;
  v11[3] = &unk_263FEA2F8;
  unsigned int v13 = &v14;
  id v4 = v3;
  id v12 = v4;
  SKCPerformResourceOperation(v11);
  if (v15[6])
  {
    id v5 = objc_alloc((Class)objc_opt_class());
    id v6 = (std::__shared_weak_count *)v15[7];
    uint64_t v9 = v15[6];
    uint64_t v10 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    size_t v7 = (void *)[v5 initWithBackingTetxure:&v9];
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
  }
  else
  {
    size_t v7 = 0;
  }

  _Block_object_dispose(&v14, 8);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }

  return (SKTexture *)v7;
}

uint64_t __46__SKTexture_Private__textureWithMetalTexture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)*a2 + 136))();
  if (result == 1)
  {
    id v5 = (void *)*a2;
    if (*a2)
    {
      id v5 = __dynamic_cast(v5, MEMORY[0x263F50770], MEMORY[0x263F50778], 0);
      if (v5)
      {
        uint64_t v6 = a2[1];
        if (v6) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
        }
      }
    }
    uint64_t v7 = (*(uint64_t (**)(void *, void))(*(void *)v5 + 408))(v5, *(void *)(a1 + 32));
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v8, v7);
  }
  return result;
}

- (id)metalTexture
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__374;
  id v12 = __Block_byref_object_dispose__375;
  id v13 = 0;
  [(SKTexture *)self _backingTexture];
  if (v6)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3321888768;
    v4[2] = __34__SKTexture_Private__metalTexture__block_invoke;
    v4[3] = &unk_26BEEE060;
    v4[4] = &v8;
    v4[5] = v6;
    id v5 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    SKCPerformResourceOperation(v4);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  id v2 = (id)v9[5];
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  _Block_object_dispose(&v8, 8);

  return v2;
}

void __34__SKTexture_Private__metalTexture__block_invoke(uint64_t a1, void *a2)
{
  if ((*(unsigned int (**)(void))(*(void *)*a2 + 136))() == 1)
  {
    id v4 = (void *)*a2;
    if (*a2 && (id v4 = __dynamic_cast(v4, MEMORY[0x263F50770], MEMORY[0x263F50778], 0)) != 0)
    {
      id v5 = (std::__shared_weak_count *)a2[1];
      if (v5) {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v6 = (*(void (**)(void *, void))(*(void *)v4 + 432))(v4, *(void *)(a1 + 40));
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (v5)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

- (int)_convert_jet_texture_format_to_ci_format:(unsigned int)a3
{
  if (a3 - 1 > 0xD) {
    id v3 = (int *)MEMORY[0x263F008B0];
  }
  else {
    id v3 = (int *)qword_263FEA338[a3 - 1];
  }
  return *v3;
}

- (CGImage)_newTextureFromGLCache
{
  [(SKTexture *)self _ensureImageData];
  [(SKTexture *)self _backingTexture];
  unsigned int v3 = (**(uint64_t (***)(void))v89)();
  double v68 = self;
  unsigned int v4 = (*(uint64_t (**)(jet_texture *))(*(void *)v89 + 8))(v89);
  if (v4 * v3)
  {
    int bytes_per_element = jet_texture::get_bytes_per_element(v89);
    uint64_t v6 = malloc_type_malloc(bytes_per_element * v4 * v3, 0xFD65CEF7uLL);
    v88[0] = MEMORY[0x263EF8330];
    v88[1] = 3221225472;
    v88[2] = __44__SKTexture_Private___newTextureFromGLCache__block_invoke;
    v88[3] = &__block_descriptor_48_e69_v24__0_shared_ptr_jet_context____jet_context_____shared_weak_count__8l;
    v88[4] = &v89;
    v88[5] = v6;
    SKCPerformResourceOperation(v88);
    v87 = v6;
    double x = v68->_textRect.origin.x;
    double y = v68->_textRect.origin.y;
    unsigned int v9 = (y * (double)v4 + 0.5);
    unsigned int v10 = ((x + v68->_textRect.size.width) * (double)v3 + 0.5);
    uint64_t v81 = (x * (double)v3 + 0.5);
    unsigned int v82 = ((y + v68->_textRect.size.height) * (double)v4 + 0.5);
    if (v68->_isRotated) {
      unsigned int v11 = v82 - v9;
    }
    else {
      unsigned int v11 = v10 - v81;
    }
    if (v68->_isRotated) {
      unsigned int v12 = v10 - v81;
    }
    else {
      unsigned int v12 = v82 - v9;
    }
    int v13 = jet_texture::get_bytes_per_element(v89);
    int v14 = v11 * v12;
    unsigned int v15 = malloc_type_malloc(v11 * v12 * v13, 0x3DE5AECFuLL);
    unsigned int v66 = v12;
    unsigned int v67 = v11;
    int v16 = jet_texture::get_bytes_per_element(v89);
    int v17 = v16;
    int v65 = v14;
    if (v68->_isFlipped)
    {
      if (v68->_isRotated)
      {
        if (v82 > v9)
        {
          int v18 = v16 * (v81 + v9 * v3);
          int v69 = v3 * v16;
          int v19 = v11 * v16;
          int v20 = v11 * v16 * (v66 - 1);
          do
          {
            unsigned int v83 = v9;
            int v73 = v20;
            int v77 = v18;
            for (uint64_t i = v81; i < v10; v20 -= v19)
            {
              for (unint64_t j = 0; j < jet_texture::get_bytes_per_element(v89); ++j)
                v15[v20 + j] = v6[v18 + j];
              ++i;
              v18 += v17;
            }
            unsigned int v9 = v83 + 1;
            int v18 = v77 + v69;
            int v20 = v73 + v17;
          }
          while (v83 + 1 != v82);
        }
      }
      else if (v82 > v9)
      {
        int v29 = 0;
        int v30 = v16 * (v81 + v9 * v3);
        int v71 = v11 * v16;
        int v75 = v3 * v16;
        do
        {
          unsigned int v85 = v9;
          int v79 = v29;
          int v31 = v30;
          for (uint64_t k = v81; k < v10; v29 += v17)
          {
            for (unint64_t m = 0; m < jet_texture::get_bytes_per_element(v89); ++m)
              v15[v29 + m] = v87[v31 + m];
            ++k;
            v31 += v17;
          }
          unsigned int v9 = v85 + 1;
          v30 += v75;
          int v29 = v79 + v71;
        }
        while (v85 + 1 != v82);
      }
    }
    else if (v68->_isRotated)
    {
      if (v82 > v9)
      {
        int v24 = v16 * (v81 + v9 * v3);
        int v70 = v3 * v16;
        int v25 = v16 * (v11 * v66 - 1);
        int v26 = v11 * v16;
        do
        {
          unsigned int v84 = v9;
          int v74 = v25;
          int v78 = v24;
          for (uint64_t n = v81; n < v10; v25 -= v26)
          {
            for (iuint64_t i = 0; ii < jet_texture::get_bytes_per_element(v89); ++ii)
              v15[v25 + ii] = v6[v24 + ii];
            ++n;
            v24 += v17;
          }
          unsigned int v9 = v84 + 1;
          int v24 = v78 + v70;
          int v25 = v74 - v17;
        }
        while (v84 + 1 != v82);
      }
    }
    else if (v82 > v9)
    {
      int v34 = v16 * (v81 + v9 * v3);
      int v72 = v11 * v16;
      int v76 = v3 * v16;
      int v35 = v11 * v16 * (~v9 + v82);
      do
      {
        unsigned int v86 = v9;
        int v36 = v35;
        int v80 = v34;
        for (junint64_t j = v81; jj < v10; v36 += v17)
        {
          for (kuint64_t k = 0; kk < jet_texture::get_bytes_per_element(v89); ++kk)
            v15[v36 + kk] = v87[v34 + kk];
          ++jj;
          v34 += v17;
        }
        unsigned int v9 = v86 + 1;
        int v34 = v80 + v76;
        v35 -= v72;
      }
      while (v86 + 1 != v82);
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    uint64_t v40 = [MEMORY[0x263EFF8F8] dataWithBytes:v15 length:jet_texture::get_bytes_per_element(v89) * v65];
    uint64_t v41 = (void *)MEMORY[0x263F00650];
    int v42 = jet_texture::get_bytes_per_element(v89);
    double v43 = objc_msgSend(v41, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v40, v42 * v67, -[SKTexture _convert_jet_texture_format_to_ci_format:](v68, "_convert_jet_texture_format_to_ci_format:", (*(uint64_t (**)(jet_texture *))(*(void *)v89 + 32))(v89)), DeviceRGB, (double)v67, (double)v66);
    double v44 = [MEMORY[0x263F00628] context];
    [v43 extent];
    Image = (CGImage *)objc_msgSend(v44, "createCGImage:fromRect:", v43);
    CGColorSpaceRelease(DeviceRGB);
    free(v87);
    free(v15);
    if (Image)
    {
      size_t Width = CGImageGetWidth(Image);
      size_t Height = CGImageGetHeight(Image);
      size_t BitsPerComponent = CGImageGetBitsPerComponent(Image);
      size_t BitsPerPixel = CGImageGetBitsPerPixel(Image);
      size_t BytesPerRow = CGImageGetBytesPerRow(Image);
      [(SKTexture *)v68 pixelSize];
      double v52 = (double)Width;
      double v53 = (double)Height;
      double v54 = (double)BitsPerPixel;
      BOOL v55 = v50 <= (double)Width && v51 <= v53;
      if (!v55 || BytesPerRow != (unint64_t)((double)Width * (double)BitsPerPixel * 0.125))
      {
        float v57 = v50;
        float v58 = roundf(v57);
        float v59 = v51;
        float v60 = roundf(v59);
        v61 = malloc_type_malloc((unint64_t)(v58 * v60 * v54 * 0.125), 0x9DC48F5CuLL);
        v62 = CGColorSpaceCreateDeviceRGB();
        uint64_t v63 = CGBitmapContextCreate(v61, (unint64_t)v58, (unint64_t)v60, BitsPerComponent, (unint64_t)(v54 * v58 * 0.125), v62, 0x4001u);
        CGColorSpaceRelease(v62);
        v91.origin.double x = 0.0;
        v91.origin.double y = 0.0;
        v91.size.double width = v58;
        v91.size.double height = v60;
        CGContextClearRect(v63, v91);
        v92.origin.double x = v68->_cropOffset.x * v52 + (v58 - v52) * 0.5;
        v92.origin.double y = v68->_cropOffset.y * v53 + (v60 - v53) * 0.5;
        v92.size.double width = v52;
        v92.size.double height = v53;
        CGContextDrawImage(v63, v92, Image);
        CGImageRelease(Image);
        Image = CGBitmapContextCreateImage(v63);
        CGContextRelease(v63);
        free(v61);
      }
    }
  }
  else
  {
    Image = 0;
  }
  if (v90) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v90);
  }
  return Image;
}

uint64_t __44__SKTexture_Private___newTextureFromGLCache__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(***(void ***)(a1 + 32) + 72))(**(void **)(a1 + 32), *(void *)(a1 + 40), 0, 0);
}

- (void)_savePngFromGLCache:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [(SKTexture *)self _createCGImage];
  id v5 = (UIImage *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v4];
  uint64_t v6 = UIImagePNGRepresentation(v5);
  [v6 writeToFile:v7 atomically:1];
  CGImageRelease(v4);
}

- (void)loadImageDataFromCGImage:pointsSize:.cold.1()
{
}

@end