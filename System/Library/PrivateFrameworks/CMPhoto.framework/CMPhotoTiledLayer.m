@interface CMPhotoTiledLayer
- (BOOL)_visibleTileRegionHasChanged:(CGRect)a3 level:(int)a4;
- (BOOL)decodeToHDROutputModePreferMeteor;
- (BOOL)shouldDisplayHDR;
- (CGSize)imageSize;
- (CMPhotoTiledLayer)initWithContainer:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6;
- (CMPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6;
- (CMPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 placeholderImage:(CGImage *)a5 screenSize:(CGSize)a6;
- (double)_zoomStartScaleForImage:(CGSize)a3 placeholderImageSize:(CGSize)a4;
- (int)decodeToHDROutputMode;
- (int64_t)imageOrientation;
- (void)_decodeImageRectangle:(CGRect)a3 forLevel:(int)a4 zoomScale:(double)a5 requestId:(unsigned int)a6 completionHandler:(id)a7;
- (void)_prepareForDecodeSynchronous;
- (void)_removeAllTiles;
- (void)_runMetalConversionOnSurface:(__IOSurface *)a3 cropRect:(CGRect)a4 completionHandler:(id)a5;
- (void)_runVImageConversionOnSurface:(__IOSurface *)a3 cropRect:(CGRect)a4 completionHandler:(id)a5;
- (void)_setHDROptions:(id)a3;
- (void)_setupConverterForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4;
- (void)_updateSubLayers:(id)a3 zoomScale:(double)a4;
- (void)dealloc;
- (void)flushCache;
- (void)prepareForDecode;
- (void)setDecodeToHDROutputMode:(int)a3;
- (void)setDecodeToHDROutputModePreferMeteor:(BOOL)a3;
- (void)setFlexGTCColorSpace:(CGColorSpace *)a3;
- (void)setShouldDisplayHDR:(BOOL)a3;
- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4;
- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4 completionHandler:(id)a5;
- (void)sizeToFit;
@end

@implementation CMPhotoTiledLayer

- (double)_zoomStartScaleForImage:(CGSize)a3 placeholderImageSize:(CGSize)a4
{
  double width = a3.width;
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double result = 0.0;
  if ((width != *MEMORY[0x1E4F1DB30] || a3.height != v5) && (a4.width != *MEMORY[0x1E4F1DB30] || a4.height != v5))
  {
    double v9 = a4.width / width;
    double v10 = a4.height / a3.height;
    if (a4.width / width <= v10) {
      double v9 = v10;
    }
    double v11 = 1.0;
    do
    {
      double v12 = v11;
      double v11 = v11 * 0.5;
    }
    while (v11 > v9);
    double v13 = 0.0;
    if (v12 >= 0.0) {
      double v13 = v12;
    }
    return fmin(v13, 1.0);
  }
  return result;
}

- (void)_setupConverterForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1AD1109A0](self, a2);
  v8 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  self->_metalDevice = v8;
  if (!v8)
  {
LABEL_12:
    *(void *)&srcFormat.bitsPerComponent = 0x2000000008;
    srcFormat.colorSpace = a3;
    srcFormat.bitmapInfo = 8198;
    memset(&srcFormat.version, 0, 20);
    *(void *)&destFormat.bitsPerComponent = 0x2000000008;
    destFormat.colorSpace = a4;
    destFormat.bitmapInfo = 8198;
    memset(&destFormat.version, 0, 20);
    CFDataRef v15 = CGColorSpaceCopyICCData(a3);
    CFDataRef v16 = CGColorSpaceCopyICCData(a4);
    CFDataRef v17 = v15;
    CFDataRef v18 = v16;
    if (v15)
    {
      if (v16)
      {
        ColorSyncProfileRef v19 = ColorSyncProfileCreate(v15, 0);
        ColorSyncProfileRef v20 = ColorSyncProfileCreate(v16, 0);
        v21 = v19;
        v22 = v20;
        if (v19)
        {
          if (v20)
          {
            v23 = (void *)MEMORY[0x1E4F1A768];
            v24 = (uint64_t *)MEMORY[0x1E4F1A770];
            uint64_t v25 = *MEMORY[0x1E4F1A770];
            v41[0] = *MEMORY[0x1E4F1A768];
            v41[1] = v25;
            v26 = (uint64_t *)MEMORY[0x1E4F1A778];
            uint64_t v27 = *MEMORY[0x1E4F1A778];
            v42[0] = v19;
            v42[1] = v27;
            v28 = (void *)MEMORY[0x1E4F1A7B8];
            v41[2] = *MEMORY[0x1E4F1A7B8];
            v42[2] = *MEMORY[0x1E4F1A798];
            uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
            uint64_t v30 = *v24;
            v39[0] = *v23;
            v39[1] = v30;
            uint64_t v31 = *v26;
            v40[0] = v20;
            v40[1] = v31;
            v39[2] = *v28;
            v40[2] = *MEMORY[0x1E4F1A7A8];
            v38[0] = v29;
            v38[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
            ColorSyncTransformRef v32 = ColorSyncTransformCreate((CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2], 0);
            v33 = v32;
            if (v32)
            {
              v34 = (void *)MEMORY[0x1AD10EFD0](v32, *MEMORY[0x1E4F1A7A0], 0);
              id v35 = v34;
              if (v34) {
                self->_vimageConverter = vImageConverter_CreateWithColorSyncCodeFragment(v34, &srcFormat, &destFormat, 0, 0, 0);
              }
            }
          }
        }
      }
    }
    goto LABEL_19;
  }
  uint64_t v43 = *MEMORY[0x1E4F1DCB0];
  v44[0] = MEMORY[0x1E4F1CC38];
  CGColorConversionInfoRef v9 = CGColorConversionInfoCreateFromList((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1], a3, kCGColorConversionTransformFromSpace, kCGRenderingIntentDefault, a4, 1, 0, 0);
  if (v9)
  {
    CGColorConversionInfoRef v10 = v9;
    self->_metalConverter = (MPSImageConversion *)[objc_alloc(MEMORY[0x1E4F35560]) initWithDevice:self->_metalDevice srcAlpha:1 destAlpha:1 backgroundColor:0 conversionInfo:v9];
    self->_metalCmdQueue = (MTLCommandQueue *)[(MTLDevice *)self->_metalDevice newCommandQueue];
    double v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.tiledlayer.metalconversion", 0);
    self->_metalQueue = v11;
    if (v11) {
      dispatch_queue_set_specific((dispatch_queue_t)v11, (const void *)kMetalQueueID, (void *)kMetalQueueID, 0);
    }
    double v12 = v10;
  }
  metalDevice = self->_metalDevice;
  if (!metalDevice || !self->_metalConverter || !self->_metalCmdQueue || !self->_metalQueue)
  {

    self->_metalDevice = 0;
    self->_metalCmdQueue = 0;

    self->_metalConverter = 0;
    metalQueue = self->_metalQueue;
    if (metalQueue)
    {
      dispatch_release(metalQueue);
      self->_metalQueue = 0;
    }
    goto LABEL_12;
  }
LABEL_19:
}

- (void)_setHDROptions:(id)a3
{
  v9[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((self->_decodeToHDROutputMode - 1) <= 4)
    {
      v8[0] = @"DecodeToHDROutputMode";
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:");
      if (self->_decodeToHDROutputModePreferMeteor) {
        uint64_t v6 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v6 = MEMORY[0x1E4F1CC28];
      }
      v9[0] = v5;
      v9[1] = v6;
      v8[1] = @"DecodeToHDROutputModePreferMeteor";
      v8[2] = @"DecodeToHDROutputModeUseBaselayerOrientation";
      v8[3] = @"DecodeToHDRAddFlexGTC";
      v9[2] = MEMORY[0x1E4F1CC38];
      v9[3] = MEMORY[0x1E4F1CC28];
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 4), @"DecodeToHDROutput");
    }
    colorSpaceFlexGTC = self->_colorSpaceFlexGTC;
    if (colorSpaceFlexGTC) {
      [a3 setObject:colorSpaceFlexGTC forKeyedSubscript:@"UseProvidedColorSpace"];
    }
  }
}

- (void)_prepareForDecodeSynchronous
{
  if (self->_shouldTile && self->_containerFormat == 1 && !self->_prepareFinished)
  {
    CFTypeRef cf = 0;
    v6.size.double width = self->_tileSize.width;
    v6.size.height = self->_tileSize.height;
    v6.origin.x = 0.0;
    v6.origin.y = 0.0;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v6);
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"DryRun"];
    [v4 setObject:DictionaryRepresentation forKeyedSubscript:@"SourceCropRect"];
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
    [(CMPhotoTiledLayer *)self _setHDROptions:v4];
    self->_err = CMPhotoDecompressionContainerCreateImageForIndex((char *)self->_container, (const __CFNumber *)self->_imageIndex, (const __CFDictionary *)v4, 2, (uint64_t)&cf);

    if (cf) {
      CFRelease(cf);
    }
  }
  self->_prepareFinished = 1;
}

- (void)prepareForDecode
{
  updateQueue = self->_updateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__CMPhotoTiledLayer_prepareForDecode__block_invoke;
  v3[3] = &unk_1E5E2EBD0;
  v3[4] = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __CMPhotoDispatchAsync_block_invoke;
  block[3] = &unk_1E5E2F288;
  block[4] = v3;
  dispatch_async(updateQueue, block);
}

uint64_t __37__CMPhotoTiledLayer_prepareForDecode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareForDecodeSynchronous];
}

- (CMPhotoTiledLayer)initWithContainer:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v9 = a5.height;
  double v10 = a5.width;
  v70[4] = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef v67 = 0;
  CFDictionaryRef theDict = 0;
  v66.receiver = self;
  v66.super_class = (Class)CMPhotoTiledLayer;
  double v12 = [(CMPhotoTiledLayer *)&v66 init];
  double v13 = v12;
  if (!v12)
  {
    int v22 = 0;
    goto LABEL_90;
  }
  if (!CMPhotoDecompressionDetectContainerFormat((const __CFData *)a3, &v12->_containerFormat)) {
    goto LABEL_97;
  }
  v13->_hasExtendedColorDisplay = MGGetBoolAnswer();
  v13->_imageIndex = a4;
  v13->_decodePixelFormat = 875704422;
  v13->_decodeToHDROutputMode = 0;
  v13->_decodeToHDROutputModePreferMeteor = 0;
  v14 = dispatch_queue_create("com.apple.coremedia.tiledlayer.update", 0);
  v13->_updateQueue = (OS_dispatch_queue *)v14;
  dispatch_queue_set_specific(v14, (const void *)kUpdateQueueID, (void *)kUpdateQueueID, 0);
  v13->_schedulingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CMPhoto.tiledlayer.scheduling", 0);
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  p_decodeSession = (const void **)&v13->_decodeSession;
  int Container = CMPhotoDecompressionSessionCreate((const __CFAllocator *)*MEMORY[0x1E4F1CF80], 0, &v13->_decodeSession);
  if (Container
    || (p_container = &v13->_container,
        (int Container = CMPhotoDecompressionSessionCreateContainer(*p_decodeSession, 0, (const __CFData *)a3, 0, (uint64_t *)&v13->_container)) != 0))
  {
    int v22 = Container;
    goto LABEL_90;
  }
  uint64x2_t v65 = 0uLL;
  int v64 = 0;
  if (CMPhotoDecompressionContainerGetImageGeometryForIndexWithOptions(*p_container, (const __CFNumber *)v13->_imageIndex, 0, (uint64_t)&v65, (uint64_t)&v65.i64[1], (uint64_t)&v64))
  {
LABEL_97:
    int v22 = -1;
    goto LABEL_90;
  }
  p_double width = &v13->_imageSize.width;
  v13->_imageSize = (CGSize)vcvtq_f64_u64(v65);
  v13->_imageOrientation = v64;
  uint64_t v63 = 0;
  int AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndexWithOptions(*p_container, (const __CFNumber *)v13->_imageIndex, 0, (uint64_t)&v63);
  if (AuxiliaryImageCountForIndexWithOptions) {
    goto LABEL_87;
  }
  if (v63 >= 1)
  {
    uint64_t v21 = 0;
    do
    {
      int v62 = 0;
      int AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerGetAuxiliaryImageTypeForIndexWithOptions(*p_container, (const __CFNumber *)v13->_imageIndex, v21, 0, (uint64_t)&v62, 0);
      if (AuxiliaryImageCountForIndexWithOptions) {
        goto LABEL_87;
      }
      if (v62 == 3)
      {
        v13->_hasAlpha = 1;
        v13->_decodePixelFormat = 1111970369;
        break;
      }
    }
    while (++v21 < v63);
  }
  int AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerCopyCGColorSpaceForIndexWithOptions(*p_container, (const __CFNumber *)v13->_imageIndex, 0, (uint64_t)&v67);
  if (AuxiliaryImageCountForIndexWithOptions) {
    BOOL v23 = AuxiliaryImageCountForIndexWithOptions == -16993;
  }
  else {
    BOOL v23 = 1;
  }
  if (v23)
  {
    if (!v67 || v13->_hasAlpha)
    {
      int v24 = 0;
LABEL_38:
      int AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerCopyImagePropertiesForIndexWithOptions(*p_container, (const __CFNumber *)v13->_imageIndex, 0, 0, 0, (CFTypeRef *)&theDict);
      if (!AuxiliaryImageCountForIndexWithOptions)
      {
        double v27 = width * height >= 1000000.0 ? 512.0 : 256.0;
        v28 = &v13->_tileSize.width;
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F2FD40]);
        if (Value
          && (CFDictionaryRef v30 = Value,
              uint64_t v31 = (void *)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E4F2FD98]),
              ColorSyncTransformRef v32 = (void *)CFDictionaryGetValue(v30, (const void *)*MEMORY[0x1E4F2FD90]),
              v31)
          && (v33 = v32) != 0)
        {
          double v34 = (double)[v31 integerValue];
          uint64_t v35 = [v33 integerValue];
          double v36 = (double)v35;
          if (v27 > v34) {
            double v34 = (floor(v27 / v34) + 1.0) * v34;
          }
          double v27 = v27 <= v36 ? (double)v35 : (floor(v27 / v36) + 1.0) * v36;
        }
        else
        {
          double v34 = v27;
        }
        double *v28 = v34;
        v13->_tileSize.double height = v27;
        int v37 = (int)width / (int)(v34 * 0.5) + 1;
        int v38 = v37 + v37 * ((int)height / (int)(v27 * 0.5));
        int v39 = (v38 + v38 / 4) / 10 + v38 + v38 / 4;
        double v41 = *p_width;
        double v40 = v13->_imageSize.height;
        int v42 = (int)(v34 * v27);
        int v43 = (int)(*p_width * v40);
        int v44 = 4 * v42;
        int v45 = 3 * v42 / 2;
        int v46 = v43;
        if (v13->_decodePixelFormat == 875704422)
        {
          int v47 = 3 * v43 / 2;
        }
        else
        {
          int v45 = v44;
          int v47 = 4 * v43;
        }
        int v48 = v45 * v39;
        if (v41 <= v40) {
          double v49 = v13->_imageSize.height;
        }
        else {
          double v49 = *p_width;
        }
        BOOL v50 = v49 >= 4096.0 || v48 < v47;
        char v51 = v50;
        if (v50) {
          char v52 = 1;
        }
        else {
          char v52 = v24;
        }
        int v53 = 4 * v46;
        int v54 = 3 * v46 / 2;
        if (v13->_conversionPixelFormat == 875704422) {
          int v55 = v54;
        }
        else {
          int v55 = v53;
        }
        BOOL v56 = v48 < v55 + v47;
        if (v51) {
          BOOL v56 = v52;
        }
        if (!v24) {
          BOOL v56 = v52;
        }
        if (width >= height) {
          double v57 = height;
        }
        else {
          double v57 = width;
        }
        float v58 = v49 / v57;
        if (v58 > 2.0) {
          BOOL v56 = 1;
        }
        v13->_shouldTile = v56;
        if (!v56)
        {
          if (v34 > v41) {
            double v41 = v34;
          }
          if (v27 > v40) {
            double v40 = v27;
          }
          double *v28 = v41;
          v13->_tileSize.double height = v40;
          int v39 = 1;
        }
        v69[0] = @"HighWaterBytes";
        v69[1] = @"LowWaterBytes";
        v70[0] = &unk_1F02E5120;
        v70[1] = &unk_1F02E5120;
        v69[2] = @"HighWaterBufferCount";
        v70[2] = [MEMORY[0x1E4F28ED0] numberWithInt:(2 * v39 + 50)];
        v69[3] = @"LowWaterBufferCount";
        v70[3] = [MEMORY[0x1E4F28ED0] numberWithInt:(2 * v39)];
        int AuxiliaryImageCountForIndexWithOptions = CMPhotoSurfacePoolCreate(v15, (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:4], (uint64_t *)&v13->_surfacePool);
        if (!AuxiliaryImageCountForIndexWithOptions)
        {
          int AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionSessionSetSurfacePool((uint64_t)*p_decodeSession, v13->_surfacePool);
          if (!AuxiliaryImageCountForIndexWithOptions)
          {
            -[CMPhotoTiledLayer setFrame:](v13, "setFrame:", 0.0, 0.0, *p_width, v13->_imageSize.height);
            int v22 = CMPhotoCacheCreate(v15, v39, &v13->_tileCache);
            if (!v22)
            {
              v13->_visibleTileKeys = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
              v13->_subLayers = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
              v13->_zoomLevel = -1;
              v13->_lock._os_unfair_lock_opaque = 0;
              -[CMPhotoTiledLayer _zoomStartScaleForImage:placeholderImageSize:](v13, "_zoomStartScaleForImage:placeholderImageSize:", *p_width, v13->_imageSize.height, v10, v9);
              v13->_zoomStartScale = v59;
              CGSize v60 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
              v13->_lastVisibleRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
              v13->_lastVisibleRect.size = v60;
              v13->_lastAboveZoomThreshold = 0;
              v13->_showTileBorders = 0;
            }
            goto LABEL_88;
          }
        }
      }
      goto LABEL_87;
    }
    uint64_t v25 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    if (v25 && (CGColorSpaceEqualToColorSpace() & 1) == 0)
    {
      if (v13->_hasExtendedColorDisplay)
      {
        if (CGColorSpaceUsesITUR_2100TF(v67))
        {
          if (_getEnableHDRPreferences_onceToken != -1) {
            dispatch_once(&_getEnableHDRPreferences_onceToken, &__block_literal_global_222);
          }
          int v24 = 0;
          v13->_decodePixelFormat = 2019963440;
          v13->_isHDRFile = 1;
          v13->_isHDROutput = 1;
          goto LABEL_37;
        }
      }
      else
      {
        [(CMPhotoTiledLayer *)v13 _setupConverterForSourceColorSpace:v67 destinationColorSpace:v25];
        if (v13->_metalConverter || v13->_vimageConverter)
        {
          v13->_decodePixelFormat = 1111970369;
          if (v13->_hasExtendedColorDisplay) {
            int v26 = 1999843442;
          }
          else {
            int v26 = 1111970369;
          }
          v13->_conversionPixelFormat = v26;
          int v24 = 1;
          goto LABEL_37;
        }
      }
    }
    int v24 = 0;
LABEL_37:
    CGColorSpaceRelease(v25);
    goto LABEL_38;
  }
LABEL_87:
  int v22 = AuxiliaryImageCountForIndexWithOptions;
LABEL_88:
  if (theDict) {
    CFRelease(theDict);
  }
LABEL_90:
  if (v67) {
    CFRelease(v67);
  }
  if (v22)
  {

    return 0;
  }
  return v13;
}

- (CMPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v8 = a5.height;
  double v9 = a5.width;
  double v12 = 0;
  if (!FigCreateBlockBufferWithCFDataNoCopy()) {
    return -[CMPhotoTiledLayer initWithContainer:containerImageIndex:backgroundImageSize:screenSize:](self, "initWithContainer:containerImageIndex:backgroundImageSize:screenSize:", 0, a4, v9, v8, width, height);
  }
  return v12;
}

- (CMPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 placeholderImage:(CGImage *)a5 screenSize:(CGSize)a6
{
  return -[CMPhotoTiledLayer initWithContainerData:containerImageIndex:backgroundImageSize:screenSize:](self, "initWithContainerData:containerImageIndex:backgroundImageSize:screenSize:", a3, a4, a5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), a6.width, a6.height);
}

- (void)dealloc
{
  updateQueue = self->_updateQueue;
  schedulingQueue = self->_schedulingQueue;
  metalQueue = self->_metalQueue;
  metalDevice = self->_metalDevice;
  metalCmdQueue = self->_metalCmdQueue;
  metalConverter = self->_metalConverter;
  vimageConverter = self->_vimageConverter;
  visibleTileKeys = self->_visibleTileKeys;
  subLayers = self->_subLayers;
  surfacePool = self->_surfacePool;
  container = self->_container;
  decodeSession = self->_decodeSession;
  tileCache = self->_tileCache;
  placeholderImage = self->_placeholderImage;
  if (_getDeferredDeallocQueue_onceToken != -1)
  {
    uint64_t v21 = self->_schedulingQueue;
    int v22 = self->_updateQueue;
    ColorSyncProfileRef v19 = self->_metalDevice;
    ColorSyncProfileRef v20 = self->_metalQueue;
    CFDataRef v18 = self->_metalCmdQueue;
    dispatch_once(&_getDeferredDeallocQueue_onceToken, &__block_literal_global_224);
    metalCmdQueue = v18;
    metalDevice = v19;
    metalQueue = v20;
    schedulingQueue = v21;
    updateQueue = v22;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CMPhotoTiledLayer_dealloc__block_invoke;
  block[3] = &unk_1E5E2F0E0;
  block[4] = updateQueue;
  void block[5] = schedulingQueue;
  block[6] = metalQueue;
  block[7] = metalDevice;
  block[8] = metalCmdQueue;
  block[9] = metalConverter;
  block[10] = visibleTileKeys;
  block[11] = subLayers;
  block[12] = vimageConverter;
  block[13] = surfacePool;
  block[14] = container;
  block[15] = decodeSession;
  block[16] = tileCache;
  block[17] = placeholderImage;
  dispatch_async((dispatch_queue_t)_gDeferredDeallocQueue, block);
  colorSpaceFlexGTC = self->_colorSpaceFlexGTC;
  if (colorSpaceFlexGTC) {
    CFRelease(colorSpaceFlexGTC);
  }
  v23.receiver = self;
  v23.super_class = (Class)CMPhotoTiledLayer;
  [(CMPhotoTiledLayer *)&v23 dealloc];
}

void __28__CMPhotoTiledLayer_dealloc__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)kUpdateQueueID;
    if (dispatch_queue_get_specific(*(dispatch_queue_t *)(a1 + 32), (const void *)kUpdateQueueID) == v3
      || (uint64_t block = MEMORY[0x1E4F143A8],
          uint64_t v13 = 3221225472,
          v14 = __CMPhotoDispatchSync_block_invoke,
          CFAllocatorRef v15 = &unk_1E5E2F288,
          CFDataRef v16 = &__block_literal_global_14,
          dispatch_sync(v2, &block),
          (v2 = *(NSObject **)(a1 + 32)) != 0))
    {
      dispatch_release(v2);
    }
  }
  v4 = *(NSObject **)(a1 + 40);
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = *(NSObject **)(a1 + 48);
  if (v5)
  {
    CGRect v6 = (void *)kMetalQueueID;
    if (dispatch_queue_get_specific(*(dispatch_queue_t *)(a1 + 48), (const void *)kMetalQueueID) == v6
      || (uint64_t block = MEMORY[0x1E4F143A8],
          uint64_t v13 = 3221225472,
          v14 = __CMPhotoDispatchSync_block_invoke,
          CFAllocatorRef v15 = &unk_1E5E2F288,
          CFDataRef v16 = &__block_literal_global_63,
          dispatch_sync(v5, &block),
          (uint64_t v5 = *(NSObject **)(a1 + 48)) != 0))
    {
      dispatch_release(v5);
    }
  }

  v7 = *(const void **)(a1 + 96);
  if (v7) {
    CFRelease(v7);
  }

  double v8 = *(const void **)(a1 + 104);
  if (v8) {
    CFRelease(v8);
  }
  double v9 = *(const void **)(a1 + 112);
  if (v9) {
    CFRelease(v9);
  }
  double v10 = *(const void **)(a1 + 120);
  if (v10) {
    CFRelease(v10);
  }
  double v11 = *(const void **)(a1 + 128);
  if (v11) {
    CFRelease(v11);
  }
  CGImageRelease(*(CGImageRef *)(a1 + 136));
}

- (void)flushCache
{
  CMPhotoCacheRemoveAllItems((uint64_t)self->_tileCache);
  CMPhotoDecompressionSessionFlushCachedBuffers((uint64_t)self->_decodeSession, 0, 0);
  surfacePool = self->_surfacePool;
  CMPhotoSurfacePoolFlushCaches((uint64_t)surfacePool, 0);
}

- (void)_updateSubLayers:(id)a3 zoomScale:(double)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  space = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  v7 = CGColorCreate(space, _updateSubLayers_zoomScale__black);
  [MEMORY[0x1E4F39D00] begin];
  [MEMORY[0x1E4F39D00] setDisableActions:1];
  [MEMORY[0x1E4F39D00] setAnimationDuration:0.0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a3);
        }
        double v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v12 visible])
        {
          uint64_t v13 = (void *)[MEMORY[0x1E4F39BE0] layer];
          if (self->_showTileBorders)
          {
            v14 = CGColorCreate(space, _updateSubLayers_zoomScale__orange);
            [v13 setBorderColor:v14];
            CGColorRelease(v14);
            [v13 setBorderWidth:4.0];
          }
          [v12 imageRect];
          objc_msgSend(v13, "setFrame:");
          objc_msgSend(v13, "setContents:", objc_msgSend(v12, "decodedSurface"));
          [v12 contentsRect];
          objc_msgSend(v13, "setContentsRect:");
          [v13 setBackgroundColor:v7];
          [v13 setOpaque:1];
          BOOL v15 = self->_isHDROutput && self->_shouldDisplayHDR;
          [v13 setWantsExtendedDynamicRangeContent:v15];
          [(CMPhotoTiledLayer *)self addSublayer:v13];
          -[NSMutableDictionary setObject:forKey:](self->_subLayers, "setObject:forKey:", v13, [v12 key]);
        }
        else
        {
          CFDataRef v16 = (void *)-[NSMutableDictionary objectForKey:](self->_subLayers, "objectForKey:", [v12 key]);
          [v16 removeFromSuperlayer];
          [v16 setContents:0];
          -[NSMutableDictionary removeObjectForKey:](self->_subLayers, "removeObjectForKey:", [v12 key]);
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  if (a4 > 1.0 && _getRasterizeWhenZoomedPreferences_onceToken != -1) {
    dispatch_once(&_getRasterizeWhenZoomedPreferences_onceToken, &__block_literal_global_227);
  }
  [(CMPhotoTiledLayer *)self setShouldRasterize:a4 > 1.0];
  [MEMORY[0x1E4F39D00] commit];
  CGColorRelease(v7);
  CGColorSpaceRelease(space);
}

- (void)_runMetalConversionOnSurface:(__IOSurface *)a3 cropRect:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v12 = (void *)MEMORY[0x1AD1109A0](self, a2);
  IOSurfaceRef v24 = 0;
  CMPhotoSurfacePoolCreateImageSurface((uint64_t)self->_surfacePool, self->_conversionPixelFormat, (unint64_t)width, (unint64_t)height, 1, 0x10uLL, 0x10uLL, 1, 0, 1, 0, &v24, 0);
  if (v24)
  {
    uint64_t v13 = (void *)[(MTLCommandQueue *)self->_metalCmdQueue commandBuffer];
    if (self->_hasExtendedColorDisplay) {
      uint64_t v14 = 554;
    }
    else {
      uint64_t v14 = 80;
    }
    uint64_t v15 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:80 width:(unint64_t)width height:(unint64_t)height mipmapped:0];
    CFDataRef v16 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v14 width:(unint64_t)width height:(unint64_t)height mipmapped:0];
    [v16 setUsage:6];
    CFDataRef v17 = (void *)[(MTLDevice *)self->_metalDevice newTextureWithDescriptor:v15 iosurface:a3 plane:0];
    long long v18 = (void *)[(MTLDevice *)self->_metalDevice newTextureWithDescriptor:v16 iosurface:v24 plane:0];
    [(MPSImageConversion *)self->_metalConverter encodeToCommandBuffer:v13 sourceTexture:v17 destinationTexture:v18];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke;
    v23[3] = &unk_1E5E2F108;
    v23[4] = a5;
    v23[5] = v24;
    v23[6] = 0;
    v23[7] = 0;
    *(double *)&v23[8] = (double)(unint64_t)width;
    *(double *)&v23[9] = (double)(unint64_t)height;
    [v13 addScheduledHandler:v23];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke_2;
    v22[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    v22[4] = a3;
    [v13 addCompletedHandler:v22];
    [v13 commit];
    id v19 = v13;
    metalQueue = self->_metalQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke_3;
    v21[3] = &unk_1E5E2EBD0;
    v21[4] = v13;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __CMPhotoDispatchAsync_block_invoke;
    block[3] = &unk_1E5E2F288;
    block[4] = v21;
    dispatch_async(metalQueue, block);
  }
  else
  {
    (*((void (**)(id, __IOSurface *, double, double, double, double))a5 + 2))(a5, a3, x, y, width, height);
  }
}

void __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

void __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(__IOSurface **)(a1 + 32);
  if (v1) {
    IOSurfaceDecrementUseCount(v1);
  }
}

void __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) waitUntilScheduled];
  v2 = *(void **)(a1 + 32);
}

- (void)_runVImageConversionOnSurface:(__IOSurface *)a3 cropRect:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  vImagePixelCount v12 = (unint64_t)a4.size.width;
  vImagePixelCount v13 = (unint64_t)a4.size.height;
  IOSurfaceRef v21 = 0;
  CMPhotoSurfacePoolCreateImageSurface((uint64_t)self->_surfacePool, self->_conversionPixelFormat, (unint64_t)a4.size.width, (unint64_t)a4.size.height, 1, 0x10uLL, 0x10uLL, 1, 0, 1, 0, &v21, 0);
  if (v21)
  {
    IOSurfaceLock(a3, 0, 0);
    IOSurfaceLock(v21, 0, 0);
    srcs.data = IOSurfaceGetBaseAddress(a3);
    srcs.double height = v13;
    srcs.double width = v12;
    srcs.rowBytes = IOSurfaceGetBytesPerRow(a3);
    dests.data = IOSurfaceGetBaseAddress(v21);
    dests.double height = v13;
    dests.double width = v12;
    dests.rowBytes = IOSurfaceGetBytesPerRow(v21);
    vImage_Error v14 = vImageConvert_AnyToAny(self->_vimageConverter, &srcs, &dests, 0, 0x10u);
    IOSurfaceUnlock(a3, 0, 0);
    IOSurfaceUnlock(v21, 0, 0);
    if (v14)
    {
      if (v21) {
        IOSurfaceDecrementUseCount(v21);
      }
      v15.n128_f64[0] = x;
      v16.n128_f64[0] = y;
      v17.n128_f64[0] = width;
      v18.n128_f64[0] = height;
      (*((void (**)(id, __IOSurface *, __n128, __n128, __n128, __n128))a5 + 2))(a5, a3, v15, v16, v17, v18);
    }
    else
    {
      if (a3) {
        IOSurfaceDecrementUseCount(a3);
      }
      v15.n128_u64[0] = 0;
      v16.n128_u64[0] = 0;
      v17.n128_f64[0] = (double)v12;
      v18.n128_f64[0] = (double)v13;
      (*((void (**)(id, IOSurfaceRef, __n128, __n128, __n128, __n128))a5 + 2))(a5, v21, v15, v16, v17, v18);
    }
    CFRelease(v21);
  }
  else
  {
    (*((void (**)(id, __IOSurface *, double, double, double, double))a5 + 2))(a5, a3, x, y, width, height);
  }
}

- (void)_decodeImageRectangle:(CGRect)a3 forLevel:(int)a4 zoomScale:(double)a5 requestId:(unsigned int)a6 completionHandler:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  [(CMPhotoTiledLayer *)self _prepareForDecodeSynchronous];
  if (self->_err) {
    return;
  }
  unsigned int v64 = a6;
  double v58 = a5;
  id v59 = a7;
  double v16 = self->_tileSize.width;
  double v17 = self->_tileSize.height;
  v68 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
  __n128 v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  uint64_t v62 = [MEMORY[0x1E4F1CA48] array];
  if (!self->_isHDROutput || self->_metalConverter || self->_vimageConverter) {
    long long v20 = (void *)[MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_decodePixelFormat];
  }
  else {
    long long v20 = &unk_1F02E5138;
  }
  [v19 setObject:v20 forKeyedSubscript:@"OutputPixelFormat"];
  [v19 setObject:&unk_1F02E5150 forKeyedSubscript:@"TiledDownsampling"];
  [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ForceHighSpeedDecode"];
  if (self->_containerFormat == 1) {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", self->_shouldTile), @"AccelerationMode");
  }
  objc_super v66 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  objc_msgSend(v19, "setObject:forKeyedSubscript:");
  CFDictionaryRef theDict = (CFDictionaryRef)v19;
  [(CMPhotoTiledLayer *)self _setHDROptions:v19];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  CGColorSpaceRef v67 = self;
  visibleTileKeys = self->_visibleTileKeys;
  uint64_t v22 = [(NSMutableSet *)visibleTileKeys countByEnumeratingWithState:&v91 objects:v100 count:16];
  int v63 = (int)v16 << a4;
  int v60 = (int)v17 << a4;
  int v69 = (int)(y / (double)v60);
  int v70 = (int)((x + width + -1.0) / (double)v63);
  int v71 = (int)(x / (double)v63);
  int v23 = (int)((y + height + -1.0) / (double)v60);
  if (v22)
  {
    uint64_t v24 = *(void *)v92;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v92 != v24) {
          objc_enumerationMutation(visibleTileKeys);
        }
        int v26 = *(void **)(*((void *)&v91 + 1) + 8 * v25);
        double v27 = (int *)[v26 bytes];
        if (v27[2] == a4
          && (*v27 >= v71 ? (BOOL v28 = *v27 <= v70) : (BOOL v28 = 0),
              v28 && ((int v29 = v27[1], v29 >= v69) ? (v30 = v29 <= v23) : (v30 = 0), v30)))
        {
          [(NSMutableSet *)v68 addObject:v26];
        }
        else
        {
          uint64_t v31 = objc_alloc_init(CMPhotoTile);
          [(CMPhotoTile *)v31 setVisible:0];
          [(CMPhotoTile *)v31 setKey:v26];
          [v18 addObject:v31];
        }
        ++v25;
      }
      while (v22 != v25);
      uint64_t v32 = [(NSMutableSet *)visibleTileKeys countByEnumeratingWithState:&v91 objects:v100 count:16];
      uint64_t v22 = v32;
    }
    while (v32);
  }
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x3052000000;
  v88 = __Block_byref_object_copy_;
  v89 = __Block_byref_object_dispose_;
  uint64_t v90 = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  int v84 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x2020000000;
  int v82 = 0;
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke;
  v79[3] = &__block_descriptor_36_e1459_i40__0__CMPhotoDecompressionSession____CFRuntimeBase_QAQ__os_unfair_lock_s_I_Q____CFSet_____C_______CFArray_i____C_______CFArray_i____C_______CFArray_i____C_______CFArray_i____Ci_os_unfair_lock_s_I______CFArray____CMPhotoSurfacePool___CMPhotoScaleAndRotateSession___CMPhotoCodecSessionPool___CMPhotoCodecSessionPool____vQ_8__CMPhotoDecompressionContainer____CFRuntimeBase_QAQ___CMPhotoDecompressionSession_CCCCC__CMPhotoDecompressionContainerVTable___________CFAllocator___OpaqueFigPictureCollection___OpaqueFigFormatReader_____Cqq__CGImageMetadata_____CFDictionary_i____C____CFArray_____Cqq____CC____CCC____CC_________CFAllocator____CCq___OpaqueFigFormatReader_____CFDictionary_________CFArray_____CFArray__C________CFAllocator____i____v____CFURL_____IOSurface_____CFData___OpaqueCMBlockBuffer____OpaqueCMByteStream____OpaqueFigSimpleMutex_______C____CFArray_____CMPhotoUnifiedJPEGDecoder____C___QQ_iCCi____CFData_____CC______QQ_iI__CGImageMetadata_____CFString_____CFDictionary____qQ_Ci____CFData___CGColorSpace_____CFDictionary__qQ________CC___qQ_iC___C___QQ_i___qQ_i_____CC___qQ_____CC___qQ_____CFData_____CC___qQ_____CFData_____CC____CFData_____CC____CFData__________CFAllocator____i____v____CFURL_____IOSurface_____CFData___OpaqueCMBlockBuffer____OpaqueCMByteStream_____CFData_____C___iIIIIffifiiiiIIIIi___II____IIIi_II_100C____CGColorSpace_____CFData_____CFString_____CFString_____CFArray_____CFArray____QQ___Cq____Cq_i_______CFArray__q_qqqq__16Q24_v32l;
  unsigned int v33 = a6;
  unsigned int v80 = a6;
  if (v67->_shouldTile)
  {
    int v34 = CMPhotoDecompressionSetAsyncPreDecodeCallback((uint64_t)v67->_decodeSession, v79, (uint64_t)&v67->_requestID);
    v67->_err = v34;
    int v35 = (int)v16 << a4;
    if (v34 || v69 > v23) {
      goto LABEL_33;
    }
LABEL_43:
    int v41 = (int)(y / (double)v60);
    if (v69 <= v23) {
      int v41 = (int)((y + height + -1.0) / (double)v60);
    }
    int v61 = v41;
    int v57 = v71 * v35;
    while (v71 > v70)
    {
LABEL_63:
      BOOL v49 = v69++ == v61;
      if (v49) {
        goto LABEL_33;
      }
    }
    int v42 = v57;
    int v43 = v71;
    while (1)
    {
      unsigned int v44 = atomic_load(&v67->_requestID);
      if (v44 != v33) {
        goto LABEL_33;
      }
      unint64_t v95 = __PAIR64__(v69, v43);
      LODWORD(v96) = a4;
      int v45 = (const void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v95 length:12];
      ItemForKedouble y = (void *)CMPhotoCacheGetItemForKey((uint64_t)v67->_tileCache, v45);
      if (([(NSMutableSet *)v67->_visibleTileKeys containsObject:v45] & 1) == 0)
      {
        if (ItemForKey)
        {
          [ItemForKey setVisible:1];
          os_unfair_lock_lock(&v67->_lock);
          [v18 addObject:ItemForKey];
          [(NSMutableSet *)v68 addObject:v45];
          os_unfair_lock_unlock(&v67->_lock);
        }
        else
        {
          v102.origin.double x = (double)v42;
          v104.size.double width = v67->_imageSize.width;
          v104.size.double height = v67->_imageSize.height;
          v104.origin.double x = 0.0;
          v104.origin.double y = 0.0;
          v102.origin.double y = (double)(v69 * v60);
          v102.size.double width = (double)v63;
          v102.size.double height = (double)v60;
          CGRect v103 = CGRectIntersection(v102, v104);
          double v47 = v103.size.width;
          double v48 = v103.size.height;
          if ((int)v103.size.width) {
            BOOL v49 = (int)v103.size.height == 0;
          }
          else {
            BOOL v49 = 1;
          }
          if (!v49)
          {
            double v50 = v103.origin.x;
            double v51 = v103.origin.y;
            uint64_t v76 = 0;
            v77[0] = MEMORY[0x1E4F143A8];
            v77[1] = 3221225472;
            v77[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_2;
            v77[3] = &unk_1E5E2F170;
            CGRect v78 = v103;
            v77[4] = v45;
            v77[5] = v67;
            v77[6] = v18;
            v77[7] = v68;
            int v52 = CMPhotoDecompressionSessionReserveRequestID((uint64_t)v67->_decodeSession, &v76);
            v67->_err = v52;
            if (v52) {
              goto LABEL_63;
            }
            int v53 = (void *)MEMORY[0x1AD1109A0]();
            int v35 = (int)v16 << a4;
            unsigned int v33 = v64;
            objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", v50), @"X");
            objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", v51), @"Y");
            objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", v47), @"Width");
            objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", v48), @"Height");
            if (v47 <= v48) {
              double v54 = v48;
            }
            else {
              double v54 = v47;
            }
            -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:vcvtmd_u64_f64(1.0 / (double)(1 << a4) * v54)], @"MaxPixelSize");
            -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v76], @"RequestIDOverride");
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_3;
            aBlock[3] = &unk_1E5E2F1C0;
            aBlock[4] = v67;
            aBlock[5] = v77;
            aBlock[6] = v81;
            aBlock[7] = &v85;
            aBlock[8] = v83;
            schedulingQueue = v67->_schedulingQueue;
            v74[0] = MEMORY[0x1E4F143A8];
            v74[1] = 3221225472;
            v74[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_5;
            v74[3] = &unk_1E5E2F1E8;
            v74[4] = v62;
            v74[5] = v83;
            v74[6] = v76;
            dispatch_sync(schedulingQueue, v74);
            int v56 = CMPhotoDecompressionContainerDecodeImageForIndexAsync((char *)v67->_container, (const __CFNumber *)v67->_imageIndex, theDict, 2, (uint64_t)&v76, aBlock);
            if (v56)
            {
              v67->_err = v56;
              goto LABEL_63;
            }
            if (v67->_err) {
              goto LABEL_63;
            }
          }
        }
      }
      ++v43;
      v42 += v35;
      if (v70 + 1 == v43) {
        goto LABEL_63;
      }
    }
  }
  int v35 = (int)v16 << a4;
  if (v69 <= v23) {
    goto LABEL_43;
  }
LABEL_33:
  double v36 = v67->_schedulingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_6;
  block[3] = &unk_1E5E2F198;
  block[4] = v83;
  void block[5] = v81;
  void block[6] = &v85;
  dispatch_sync(v36, block);
  int v37 = v86[5];
  if (v37)
  {
    dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
    int v38 = v86[5];
    if (v38)
    {
      dispatch_release(v38);
      v86[5] = 0;
    }
  }
  metalQueue = v67->_metalQueue;
  if (metalQueue)
  {
    unint64_t v95 = MEMORY[0x1E4F143A8];
    uint64_t v96 = 3221225472;
    v97 = __CMPhotoDispatchSync_block_invoke;
    v98 = &unk_1E5E2F288;
    v99 = &__block_literal_global_94;
    dispatch_sync(metalQueue, &v95);
  }
  CMPhotoDecompressionSetAsyncPreDecodeCallback((uint64_t)v67->_decodeSession, 0, 0);
  unsigned int v40 = atomic_load(&v67->_requestID);
  if (v40 == v33)
  {

    v67->_visibleTileKeys = v68;
    v67->_zoomLevel = a4;
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_8;
    v72[3] = &unk_1E5E2F210;
    v72[4] = v67;
    v72[5] = v18;
    *(double *)&v72[7] = v58;
    v72[6] = v59;
    unint64_t v95 = MEMORY[0x1E4F143A8];
    uint64_t v96 = 3221225472;
    v97 = __CMPhotoDispatchAsync_block_invoke;
    v98 = &unk_1E5E2F288;
    v99 = v72;
    dispatch_async(MEMORY[0x1E4F14428], &v95);
  }
  else
  {
  }
  _Block_object_dispose(v81, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(&v85, 8);
}

uint64_t __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5)
{
  int v5 = *(_DWORD *)(a1 + 32);
  unsigned int v6 = atomic_load(a5);
  if (v5 == v6) {
    return 0;
  }
  else {
    return 4294950191;
  }
}

void __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_2(uint64_t a1, IOSurfaceRef buffer, double a3, double a4, double a5, double a6)
{
  double Width = (double)IOSurfaceGetWidth(buffer);
  size_t Height = IOSurfaceGetHeight(buffer);
  double v14 = a4 / (double)Height;
  double v15 = a6 / (double)Height;
  double v17 = objc_alloc_init(CMPhotoTile);
  [(CMPhotoTile *)v17 setDecodedSurface:buffer];
  [(CMPhotoTile *)v17 setVisible:1];
  [(CMPhotoTile *)v17 setKey:*(void *)(a1 + 32)];
  -[CMPhotoTile setImageRect:](v17, "setImageRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  -[CMPhotoTile setContentsRect:](v17, "setContentsRect:", a3 / Width, v14, a5 / Width, v15);
  int v16 = CMPhotoCacheAddItemForKey(*(void *)(*(void *)(a1 + 40) + 144), *(const void **)(a1 + 32), v17);
  if (v16) {
    *(_DWORD *)(*(void *)(a1 + 40) + 140) = v16;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 224));
  [*(id *)(a1 + 48) addObject:v17];
  [*(id *)(a1 + 56) addObject:*(void *)(a1 + 32)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 224));
}

void __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, __CVBuffer *a6)
{
  if (!a4 && a5 == 2)
  {
    double PixelBufferCLAPAsRect = CMPhotoGetPixelBufferCLAPAsRect(a6);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 136) || !CMPhotoPixelBufferPremultiplyWithAlpha(a6))
    {
      IOSurface = CVPixelBufferGetIOSurface(a6);
      if (IOSurface)
      {
        int v16 = IOSurface;
        IOSurfaceIncrementUseCount(IOSurface);
        double v17 = *(void **)(a1 + 32);
        if (v17[15])
        {
          objc_msgSend(v17, "_runMetalConversionOnSurface:cropRect:completionHandler:", v16, *(void *)(a1 + 40), PixelBufferCLAPAsRect, v10, v12, v14);
        }
        else
        {
          uint64_t v18 = *(void *)(a1 + 40);
          if (v17[16]) {
            objc_msgSend(v17, "_runVImageConversionOnSurface:cropRect:completionHandler:", v16, v18, PixelBufferCLAPAsRect, v10, v12, v14);
          }
          else {
            (*(void (**)(void, __IOSurface *, double, double, double, double))(v18 + 16))(*(void *)(a1 + 40), v16, PixelBufferCLAPAsRect, v10, v12, v14);
          }
        }
      }
    }
  }
  id v19 = *(NSObject **)(*(void *)(a1 + 32) + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_4;
  block[3] = &unk_1E5E2F198;
  long long v21 = *(_OWORD *)(a1 + 48);
  uint64_t v22 = *(void *)(a1 + 64);
  dispatch_sync(v19, block);
}

NSObject *__90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_4(void *a1)
{
  ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  double result = *(NSObject **)(*(void *)(a1[5] + 8) + 40);
  if (result)
  {
    if (*(_DWORD *)(*(void *)(a1[4] + 8) + 24) == *(_DWORD *)(*(void *)(a1[6] + 8) + 24)) {
      return dispatch_semaphore_signal(result);
    }
  }
  return result;
}

uint64_t __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_5(void *a1)
{
  uint64_t v1 = a1[6];
  ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  v2 = (void *)a1[4];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:v1];
  return [v2 addObject:v3];
}

dispatch_semaphore_t __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_6(dispatch_semaphore_t result)
{
  if (*(_DWORD *)(*((void *)result[4].isa + 1) + 24) != *(_DWORD *)(*((void *)result[5].isa + 1) + 24))
  {
    dispatch_semaphore_t v1 = result;
    double result = dispatch_semaphore_create(0);
    *(void *)(*((void *)v1[6].isa + 1) + 40) = result;
  }
  return result;
}

uint64_t __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSubLayers:*(void *)(a1 + 40) zoomScale:*(double *)(a1 + 56)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_removeAllTiles
{
  visibleTileKeys = self->_visibleTileKeys;
  self->_visibleTileKeys = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__CMPhotoTiledLayer__removeAllTiles__block_invoke;
  v4[3] = &unk_1E5E2F238;
  v4[4] = visibleTileKeys;
  v4[5] = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __CMPhotoDispatchAsync_block_invoke;
  block[3] = &unk_1E5E2F288;
  void block[4] = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __36__CMPhotoTiledLayer__removeAllTiles__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39D00] begin];
  [MEMORY[0x1E4F39D00] setDisableActions:1];
  [MEMORY[0x1E4F39D00] setAnimationDuration:0.0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = (void *)[*(id *)(*(void *)(a1 + 40) + 168) objectForKey:v7];
        [v8 removeFromSuperlayer];
        [v8 setContents:0];
        [*(id *)(*(void *)(a1 + 40) + 168) removeObjectForKey:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  [MEMORY[0x1E4F39D00] commit];
}

- (BOOL)_visibleTileRegionHasChanged:(CGRect)a3 level:(int)a4
{
  double lastZoomScale = self->_lastZoomScale;
  if (lastZoomScale >= 0.5 || !self->_shouldTile)
  {
    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v6 = 0;
    double v7 = 0.5;
    do
    {
      double v7 = v7 * 0.5;
      ++v6;
    }
    while (v7 > lastZoomScale);
  }
  if (v6 >= 3) {
    unsigned int v6 = 3;
  }
  BOOL result = v6 != a4
        || (int v8 = (int)self->_tileSize.width << a4,
            int x = (int)self->_lastVisibleRect.origin.x,
            (int)a3.origin.x / v8 != x / v8)
        || (int v10 = (int)self->_tileSize.height << a4,
            int y = (int)self->_lastVisibleRect.origin.y,
            (int)a3.origin.y / v10 != y / v10)
        || ((int)a3.size.width + (int)a3.origin.x - 1) / v8 != (x + (int)self->_lastVisibleRect.size.width - 1) / v8
        || ((int)a3.size.height + (int)a3.origin.y - 1) / v10 != ((int)self->_lastVisibleRect.size.height + y - 1) / v10;
  return result;
}

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4 completionHandler:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a4 >= 0.5 || !self->_shouldTile)
  {
    unsigned int v13 = 0;
  }
  else
  {
    unsigned int v13 = 0;
    double v14 = 0.5;
    do
    {
      double v14 = v14 * 0.5;
      ++v13;
    }
    while (v14 > a4);
  }
  if (v13 >= 3) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = v13;
  }
  BOOL v16 = -[CMPhotoTiledLayer _visibleTileRegionHasChanged:level:](self, "_visibleTileRegionHasChanged:level:", v15, a3.origin.x, y, a3.size.width, a3.size.height);
  double lastZoomScale = self->_lastZoomScale;
  BOOL v18 = a4 <= 1.0;
  if (lastZoomScale <= 1.0) {
    BOOL v18 = 0;
  }
  if (a4 > 1.0 && lastZoomScale <= 1.0) {
    BOOL v18 = 1;
  }
  double zoomStartScale = self->_zoomStartScale;
  int lastAboveZoomThreshold = self->_lastAboveZoomThreshold;
  self->_lastVisibleRect.origin.CGFloat x = x;
  self->_lastVisibleRect.origin.double y = y;
  int v22 = zoomStartScale < a4;
  self->_lastVisibleRect.size.CGFloat width = width;
  self->_lastVisibleRect.size.CGFloat height = height;
  self->_double lastZoomScale = a4;
  self->_int lastAboveZoomThreshold = v22;
  char v23 = lastAboveZoomThreshold != v22 || v16;
  if (v18 || (v23 & 1) != 0)
  {
    unsigned int add = atomic_fetch_add((atomic_uint *volatile)&self->_requestID, 1u);
    if (zoomStartScale >= a4)
    {
      updateQueue = self->_updateQueue;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__CMPhotoTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke;
      v29[3] = &unk_1E5E2EBD0;
      v29[4] = self;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      uint64_t v32 = __CMPhotoDispatchAsync_block_invoke;
      unsigned int v33 = &unk_1E5E2F288;
      int v34 = v29;
    }
    else
    {
      if (self->_err) {
        return;
      }
      updateQueue = self->_updateQueue;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __69__CMPhotoTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke_2;
      v26[3] = &unk_1E5E2F260;
      *(CGFloat *)&v26[6] = x;
      *(double *)&v26[7] = y;
      *(CGFloat *)&v26[8] = width;
      *(CGFloat *)&v26[9] = height;
      *(double *)&v26[10] = a4;
      int v27 = v15;
      unsigned int v28 = add + 1;
      v26[4] = self;
      v26[5] = a5;
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      uint64_t v32 = __CMPhotoDispatchAsync_block_invoke;
      unsigned int v33 = &unk_1E5E2F288;
      int v34 = v26;
    }
  }
  else
  {
    if (!a5) {
      return;
    }
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    uint64_t v32 = __CMPhotoDispatchAsync_block_invoke;
    unsigned int v33 = &unk_1E5E2F288;
    int v34 = a5;
    updateQueue = MEMORY[0x1E4F14428];
  }
  dispatch_async(updateQueue, &block);
}

uint64_t __69__CMPhotoTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllTiles];
}

uint64_t __69__CMPhotoTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decodeImageRectangle:forLevel:zoomScale:requestId:completionHandler:", *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4
{
}

- (void)setFlexGTCColorSpace:(CGColorSpace *)a3
{
  colorSpaceFlexGTC = self->_colorSpaceFlexGTC;
  if (colorSpaceFlexGTC) {
    CFRelease(colorSpaceFlexGTC);
  }
  if (a3) {
    unsigned int v6 = (CGColorSpace *)CFRetain(a3);
  }
  else {
    unsigned int v6 = 0;
  }
  self->_colorSpaceFlexGTC = v6;
}

- (void)setShouldDisplayHDR:(BOOL)a3
{
  self->_shouldDisplayHDR = a3;
}

- (void)setDecodeToHDROutputMode:(int)a3
{
  self->_decodeToHDROutputMode = a3;
  BOOL v3 = (a3 - 1) < 5 && ((0x1Du >> (a3 - 1)) & 1) != 0 || self->_isHDRFile;
  self->_isHDROutput = v3;
}

- (void)sizeToFit
{
  [(CMPhotoTiledLayer *)self frame];
  double v4 = v3;
  [(CMPhotoTiledLayer *)self frame];
  [(CMPhotoTiledLayer *)self setFrame:v4];
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (BOOL)shouldDisplayHDR
{
  return self->_shouldDisplayHDR;
}

- (int)decodeToHDROutputMode
{
  return self->_decodeToHDROutputMode;
}

- (BOOL)decodeToHDROutputModePreferMeteor
{
  return self->_decodeToHDROutputModePreferMeteor;
}

- (void)setDecodeToHDROutputModePreferMeteor:(BOOL)a3
{
  self->_decodeToHDROutputModePreferMeteor = a3;
}

@end