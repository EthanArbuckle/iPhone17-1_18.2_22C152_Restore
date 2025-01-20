@interface JFXStillMediaItem
+ (void)stillMediaItemWithLocalURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (BOOL)canBeAddedToSequence;
- (BOOL)hasGainMap;
- (BOOL)hasPhotoCharacteristic;
- (BOOL)hasVisualCharacteristic;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImageValid:(id)a3 renderingIntent:(int)a4 size:(CGSize *)a5;
- (CGImage)hdrGainMapImageForURL:(id)a3 renderingIntent:(int)a4;
- (CGImage)imageForURL:(id)a3 renderingIntent:(int)a4;
- (CGImage)imageForURL:(id)a3 renderingIntent:(int)a4 useAuxillaryMap:(BOOL)a5;
- (CGSize)exportImageSize:(CGSize)a3;
- (CGSize)imageSizeForRenderingIntent:(int)a3 originalSize:(CGSize)a4;
- (CGSize)playBackImageSize:(CGSize)a3;
- (CGSize)sizeForMaxPixels:(double)a3 sourceSize:(CGSize)a4;
- (CGSize)sizeForQuality:(int)a3;
- (CGSize)sourceImageSize;
- (CGSize)thumbImageSize:(CGSize)a3;
- (PVColorSpace)imageColorSpace;
- (double)JT_maximumPixelsForStillImage:(BOOL)a3;
- (float)meteorPlusHeadroom;
- (id)assetURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)info;
- (int)durationAt30fps;
- (unint64_t)hash;
- (void)commonInit;
- (void)generateLocalURLForAsset;
- (void)setHasGainMap:(BOOL)a3;
- (void)setImageColorSpace:(id)a3;
- (void)setMeteorPlusHeadroom:(float)a3;
- (void)setSourceImageSize:(CGSize)a3;
- (void)updateAssetImageColorSpace;
@end

@implementation JFXStillMediaItem

+ (void)stillMediaItemWithLocalURL:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *, void))a5;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___JFXStillMediaItem;
  id v10 = a3;
  id v11 = objc_msgSendSuper2(&v14, sel_alloc);
  v12 = objc_msgSend(v11, "initWithURL:", v10, v14.receiver, v14.super_class);

  if (v12)
  {
    [v12 setDelegate:v8];
    [v12 setMediaState:0];
    [v12 setMediaLoadState:0];
    [v12 commonInit];
    [v12 checkIfAssetIsMissing];
    [v12 updateAssetImageColorSpace];
    [v12 setMediaLoadState:1];
    v13 = [v12 delegate];
    [v13 mediaItemDidLoad:v12 error:0];

    v9[2](v9, v12, 0);
  }
}

- (void)commonInit
{
  [(JFXMediaItem *)self setMediaType:2];
  [(JFXMediaItem *)self setMediaLoadState:0];
  -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  LODWORD(v3) = -1.0;
  [(JFXStillMediaItem *)self setMeteorPlusHeadroom:v3];
  [(JFXStillMediaItem *)self setHasGainMap:0];
}

- (void)generateLocalURLForAsset
{
  double v3 = [(JFXMediaItem *)self delegate];
  [v3 mediaItemWillLoad:self];

  [(JFXMediaItem *)self setMediaLoadState:0];
  id v4 = objc_alloc_init(MEMORY[0x263F14DD0]);
  [v4 setNetworkAccessAllowed:1];
  [v4 setCanHandleAdjustmentData:&__block_literal_global_47];
  v5 = [(JTAssetMediaItem *)self asset];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke_2;
  v6[3] = &unk_264C0C3F8;
  v6[4] = self;
  [v5 requestContentEditingInputWithOptions:v4 completionHandler:v6];
}

uint64_t __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke()
{
  return 1;
}

void __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke_3;
  v7[3] = &unk_264C09F10;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __45__JFXStillMediaItem_generateLocalURLForAsset__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fullSizeImageURL];
  id v7 = [v2 path];

  id v3 = NSURL;
  id v4 = [NSString stringWithFormat:@"JTPhotoAsset://%@", v7];
  uint64_t v5 = [v3 URLWithString:v4];
  [*(id *)(a1 + 40) setAssetLocalURL:v5];

  [*(id *)(a1 + 40) updateAssetImageColorSpace];
  [*(id *)(a1 + 40) setMediaLoadState:1];
  id v6 = [*(id *)(a1 + 40) delegate];
  [v6 mediaItemDidLoad:*(void *)(a1 + 40) error:0];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)JFXStillMediaItem;
  v2 = [(JTAssetMediaItem *)&v4 description];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)JFXStillMediaItem;
  id v4 = [(JTAssetMediaItem *)&v7 copyWithZone:a3];
  [(JFXStillMediaItem *)self sourceImageSize];
  objc_msgSend(v4, "setSourceImageSize:");
  uint64_t v5 = [(JFXStillMediaItem *)self imageColorSpace];
  [v4 setImageColorSpace:v5];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JFXStillMediaItem;
  return [(JTAssetMediaItem *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)JFXStillMediaItem;
  return [(JTAssetMediaItem *)&v3 hash];
}

- (BOOL)canBeAddedToSequence
{
  return 1;
}

- (int)durationAt30fps
{
  return 54000;
}

- (CGSize)imageSizeForRenderingIntent:(int)a3 originalSize:(CGSize)a4
{
  if (a3) {
    -[JFXStillMediaItem exportImageSize:](self, "exportImageSize:", a4.width, a4.height);
  }
  else {
    -[JFXStillMediaItem playBackImageSize:](self, "playBackImageSize:", a4.width, a4.height);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGImage)imageForURL:(id)a3 renderingIntent:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__20;
  v44 = __Block_byref_object_dispose__20;
  objc_super v7 = [(JFXStillMediaItem *)self assetURL];
  if ([v7 isFileURL])
  {
    id v8 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v9 = [(JFXStillMediaItem *)self assetURL];
    id v10 = [v9 path];
    id v45 = [v8 imageWithContentsOfFile:v10];
  }
  else
  {
    id v45 = 0;
  }

  if ([(JFXMediaItem *)self mediaState] == 2 || [(JFXMediaItem *)self mediaState] == 3)
  {
    -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:", 1080.0, 1080.0);
    id v11 = (void *)MEMORY[0x263F1C6B0];
    id v12 = [MEMORY[0x263F1C550] blackColor];
    [(JFXStillMediaItem *)self sizeForQuality:v4];
    uint64_t v13 = objc_msgSend(v11, "imageWithColor:andSize:", v12);
    objc_super v14 = (void *)v41[5];
    v41[5] = v13;

LABEL_7:
    goto LABEL_8;
  }
  if (!v41[5])
  {
    id v12 = objc_alloc_init(MEMORY[0x263F14E40]);
    [v12 setResizeMode:2];
    [v12 setVersion:0];
    [v12 setNetworkAccessAllowed:0];
    [v12 setSynchronous:1];
    [(JFXStillMediaItem *)self sourceImageSize];
    if (v29 == *MEMORY[0x263F001B0] && v28 == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      v30 = [(JTAssetMediaItem *)self asset];
      unint64_t v31 = [v30 pixelWidth];
      v32 = [(JTAssetMediaItem *)self asset];
      -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:", (double)v31, (double)(unint64_t)[v32 pixelHeight]);
    }
    [(JFXStillMediaItem *)self sourceImageSize];
    -[JFXStillMediaItem imageSizeForRenderingIntent:originalSize:](self, "imageSizeForRenderingIntent:originalSize:", v4);
    double v34 = v33;
    double v36 = v35;
    v37 = [MEMORY[0x263F14E38] defaultManager];
    v38 = [(JTAssetMediaItem *)self asset];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __49__JFXStillMediaItem_imageForURL_renderingIntent___block_invoke;
    v39[3] = &unk_264C0C420;
    v39[4] = &v40;
    objc_msgSend(v37, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v38, 0, v12, v39, v34, v36);

    goto LABEL_7;
  }
  [(JFXStillMediaItem *)self sourceImageSize];
  if (v19 == *MEMORY[0x263F001B0] && v18 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(id)v41[5] size];
    -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:");
  }
  [(JFXStillMediaItem *)self sourceImageSize];
  -[JFXStillMediaItem imageSizeForRenderingIntent:originalSize:](self, "imageSizeForRenderingIntent:originalSize:", v4);
  double v22 = v21;
  double v24 = v23;
  [(JFXStillMediaItem *)self sourceImageSize];
  if (v26 != v22 || v25 != v24 || [(id)v41[5] imageOrientation])
  {
    uint64_t v27 = objc_msgSend((id)v41[5], "scaledImageEqualOrSmallerThanSize:maintainAspectRatio:normalizeOrientation:", 1, 1, v22, v24);
    id v12 = (id)v41[5];
    v41[5] = v27;
    goto LABEL_7;
  }
LABEL_8:
  v15 = (void *)v41[5];
  if (v15)
  {
    v16 = (CGImage *)[v15 CGImage];
    CGImageRetain(v16);
  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v40, 8);

  return v16;
}

void __49__JFXStillMediaItem_imageForURL_renderingIntent___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (CGImage)imageForURL:(id)a3 renderingIntent:(int)a4 useAuxillaryMap:(BOOL)a5
{
  if (a5)
  {
    id v6 = NSURL;
    objc_super v7 = [a3 path];
    CFURLRef v8 = [v6 fileURLWithPath:v7];

    uint64_t v9 = CGImageSourceCreateWithURL(v8, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, (CFDictionaryRef)&unk_26E8020B8);

    return ImageAtIndex;
  }
  else
  {
    return [(JFXStillMediaItem *)self imageForURL:a3 renderingIntent:*(void *)&a4];
  }
}

- (BOOL)isImageValid:(id)a3 renderingIntent:(int)a4 size:(CGSize *)a5
{
  if (a3 && a5) {
    *a5 = *(CGSize *)MEMORY[0x263F001B0];
  }
  return a3 != 0;
}

- (CGImage)hdrGainMapImageForURL:(id)a3 renderingIntent:(int)a4
{
  id v4 = NSURL;
  uint64_t v5 = [a3 path];
  CFURLRef v6 = [v4 fileURLWithPath:v5];

  GainMapImageRefFromAssetURL = (CGImage *)createGainMapImageRefFromAssetURL(v6);
  return GainMapImageRefFromAssetURL;
}

- (double)JT_maximumPixelsForStillImage:(BOOL)a3
{
  BOOL v3 = a3;
  if (JT_maximumPixelsForStillImage__onceToken != -1)
  {
    dispatch_once(&JT_maximumPixelsForStillImage__onceToken, &__block_literal_global_25);
    if (v3) {
      goto LABEL_3;
    }
LABEL_10:
    id v10 = [MEMORY[0x263F1C5C0] currentDevice];
    BOOL v11 = objc_msgSend(v10, "jfx_memorySize") > 1610612736;

    double v9 = dbl_234D616D0[v11];
    return v9 * (v9 / 1.33333333);
  }
  if (!a3) {
    goto LABEL_10;
  }
LABEL_3:
  if (JT_maximumPixelsForStillImage__increasePlaybackQuality)
  {
    id v4 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v5 = objc_msgSend(v4, "jfx_memorySize");

    if (v5 <= 1610612736) {
      double v6 = 640.0;
    }
    else {
      double v6 = 1080.0;
    }
  }
  else
  {
    double v6 = 640.0;
  }
  objc_super v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 scale];
  double v9 = v6 * v8;

  return v9 * (v9 / 1.33333333);
}

void __51__JFXStillMediaItem_JT_maximumPixelsForStillImage___block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  JT_maximumPixelsForStillImage__increasePlaybackQuality = [v0 BOOLForKey:@"lowPlaybackQuality"] ^ 1;
}

- (CGSize)sizeForMaxPixels:(double)a3 sourceSize:(CGSize)a4
{
  double v4 = a4.width * a4.height / a3;
  if (v4 > 1.0)
  {
    double v5 = sqrt(v4);
    float v6 = a4.width / v5;
    a4.double width = floorf(v6);
    *(float *)&double v5 = a4.height / v5;
    a4.double height = floorf(*(float *)&v5);
  }
  double width = a4.width;
  double height = a4.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)playBackImageSize:(CGSize)a3
{
  [(JFXStillMediaItem *)self JT_maximumPixelsForStillImage:1];
  -[JFXStillMediaItem sizeForMaxPixels:sourceSize:](self, "sizeForMaxPixels:sourceSize:");
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)exportImageSize:(CGSize)a3
{
  [(JFXStillMediaItem *)self JT_maximumPixelsForStillImage:0];
  -[JFXStillMediaItem sizeForMaxPixels:sourceSize:](self, "sizeForMaxPixels:sourceSize:");
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)thumbImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  float v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  double v8 = v7 * 75.0;

  -[JFXStillMediaItem sizeForMaxPixels:sourceSize:](self, "sizeForMaxPixels:sourceSize:", v8 * v8, width, height);
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [MEMORY[0x263F1C920] mainScreen];
  [v13 scale];
  double v15 = v14 * 80.0;

  if (v10 <= v12)
  {
    if (v10 < v15)
    {
      float v17 = v12 * (v15 / v10);
      double v12 = floorf(v17);
      double v10 = v15;
    }
  }
  else if (v12 < v15)
  {
    float v16 = v10 * (v15 / v12);
    double v10 = floorf(v16);
    double v12 = v15;
  }
  double v18 = v10;
  double v19 = v12;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (CGSize)sizeForQuality:(int)a3
{
  [(JFXStillMediaItem *)self sourceImageSize];
  double v6 = *MEMORY[0x263F001B0];
  double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v8 == *MEMORY[0x263F001B0] && v5 == v7)
  {
    double v10 = [(JFXStillMediaItem *)self assetURL];
    int v11 = [v10 isFileURL];

    if (v11)
    {
      double v12 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v13 = [(JFXStillMediaItem *)self assetURL];
      double v14 = [v13 path];
      double v15 = [v12 imageWithContentsOfFile:v14];

      [v15 size];
      -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:");
    }
    else
    {
      double v15 = [(JTAssetMediaItem *)self asset];
      double v16 = (double)(unint64_t)[v15 pixelWidth];
      float v17 = [(JTAssetMediaItem *)self asset];
      -[JFXStillMediaItem setSourceImageSize:](self, "setSourceImageSize:", v16, (double)(unint64_t)[v17 pixelHeight]);
    }
  }
  switch(a3)
  {
    case 0:
      [(JFXStillMediaItem *)self sourceImageSize];
      -[JFXStillMediaItem playBackImageSize:](self, "playBackImageSize:");
      goto LABEL_18;
    case 1:
      [(JFXStillMediaItem *)self sourceImageSize];
      -[JFXStillMediaItem exportImageSize:](self, "exportImageSize:");
      goto LABEL_18;
    case 2:
      [(JFXStillMediaItem *)self sourceImageSize];
      -[JFXStillMediaItem thumbImageSize:](self, "thumbImageSize:");
      goto LABEL_18;
    case 3:
      [(JFXStillMediaItem *)self sourceImageSize];
LABEL_18:
      double v6 = v18;
      double v7 = v19;
      break;
    default:
      v20 = JFXLog_core();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[JFXStillMediaItem sizeForQuality:](a3, v20);
      }

      break;
  }
  double v21 = v6;
  double v22 = v7;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (BOOL)hasVisualCharacteristic
{
  return 1;
}

- (BOOL)hasPhotoCharacteristic
{
  return 1;
}

- (id)assetURL
{
  BOOL v3 = [(JTAssetMediaItem *)self assetIdentifier];

  if (v3) {
    [(JTAssetMediaItem *)self assetLocalURL];
  }
  else {
  double v4 = [(JTLocalAssetMediaItem *)self localFileURL];
  }
  return v4;
}

- (void)updateAssetImageColorSpace
{
  BOOL v3 = [(JFXStillMediaItem *)self assetURL];

  if (v3)
  {
    double v4 = NSURL;
    double v5 = [(JFXStillMediaItem *)self assetURL];
    double v6 = [v5 path];
    CFURLRef url = [v4 fileURLWithPath:v6];

    double v7 = CGImageSourceCreateWithURL(url, 0);
    if (v7)
    {
      double v8 = v7;
      [(JFXStillMediaItem *)self setHasGainMap:hasGainMap(v7)];
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
      if (ImageAtIndex)
      {
        double v10 = ImageAtIndex;
        CGColorSpaceRef ColorSpace = CGImageGetColorSpace(ImageAtIndex);
        if (ColorSpace)
        {
          double v12 = objc_msgSend(MEMORY[0x263F61230], "jfx_getColorSpaceFromCGColorSpace:", ColorSpace);
          [(JFXStillMediaItem *)self setImageColorSpace:v12];
        }
        CGImageRelease(v10);
      }
      CFRelease(v8);
    }
    uint64_t v13 = [(JFXStillMediaItem *)self imageColorSpace];

    if (!v13)
    {
      double v14 = [MEMORY[0x263F61230] sRGBColorSpace];
      [(JFXStillMediaItem *)self setImageColorSpace:v14];
    }
  }
}

- (id)info
{
  v4.receiver = self;
  v4.super_class = (Class)JFXStillMediaItem;
  v2 = [(JTAssetMediaItem *)&v4 info];
  return v2;
}

- (PVColorSpace)imageColorSpace
{
  return self->_imageColorSpace;
}

- (void)setImageColorSpace:(id)a3
{
}

- (BOOL)hasGainMap
{
  return self->_hasGainMap;
}

- (void)setHasGainMap:(BOOL)a3
{
  self->_hasGainMap = a3;
}

- (float)meteorPlusHeadroom
{
  return self->_meteorPlusHeadroom;
}

- (void)setMeteorPlusHeadroom:(float)a3
{
  self->_meteorPlusHeadroom = a3;
}

- (CGSize)sourceImageSize
{
  double width = self->_sourceImageSize.width;
  double height = self->_sourceImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSourceImageSize:(CGSize)a3
{
  self->_sourceImageSize = a3;
}

- (void).cxx_destruct
{
}

- (void)sizeForQuality:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "WARNING: sizeForStillQuality: does not understand your quality %d", (uint8_t *)v2, 8u);
}

@end