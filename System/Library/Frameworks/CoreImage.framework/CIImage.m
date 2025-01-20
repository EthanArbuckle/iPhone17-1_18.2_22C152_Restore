@interface CIImage
+ (BOOL)supportsSecureCoding;
+ (CIImage)blackImage;
+ (CIImage)blueImage;
+ (CIImage)clearImage;
+ (CIImage)cyanImage;
+ (CIImage)emptyImage;
+ (CIImage)grayImage;
+ (CIImage)greenImage;
+ (CIImage)imageWithArrayOfImages:(id)a3 selector:(id)a4;
+ (CIImage)imageWithAttributedString:(id)a3 format:(int)a4;
+ (CIImage)imageWithAttributedString:(id)a3 format:(int)a4 options:(id)a5;
+ (CIImage)imageWithBitmapData:(NSData *)data bytesPerRow:(size_t)bytesPerRow size:(CGSize)size format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace;
+ (CIImage)imageWithBitmapData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 options:(id)a7;
+ (CIImage)imageWithCGImage:(CGImageRef)image;
+ (CIImage)imageWithCGImage:(CGImageRef)image options:(NSDictionary *)options;
+ (CIImage)imageWithCGImageSource:(CGImageSourceRef)source index:(size_t)index options:(NSDictionary *)dict;
+ (CIImage)imageWithCGLayer:(CGLayerRef)layer;
+ (CIImage)imageWithCGLayer:(CGLayerRef)layer options:(NSDictionary *)options;
+ (CIImage)imageWithCVImageBuffer:(CVImageBufferRef)imageBuffer;
+ (CIImage)imageWithCVImageBuffer:(CVImageBufferRef)imageBuffer options:(NSDictionary *)options;
+ (CIImage)imageWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer;
+ (CIImage)imageWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options;
+ (CIImage)imageWithColor:(CIColor *)color;
+ (CIImage)imageWithContentsOfFile:(id)a3;
+ (CIImage)imageWithContentsOfFile:(id)a3 options:(id)a4;
+ (CIImage)imageWithContentsOfURL:(NSURL *)url;
+ (CIImage)imageWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options;
+ (CIImage)imageWithData:(NSData *)data;
+ (CIImage)imageWithData:(NSData *)data options:(NSDictionary *)options;
+ (CIImage)imageWithDepthData:(AVDepthData *)data;
+ (CIImage)imageWithDepthData:(AVDepthData *)data options:(NSDictionary *)options;
+ (CIImage)imageWithIOSurface:(IOSurfaceRef)surface;
+ (CIImage)imageWithIOSurface:(IOSurfaceRef)surface options:(NSDictionary *)options;
+ (CIImage)imageWithImageProvider:(id)a3 userInfo:(id)a4 size:(CGSize)a5 format:(int)a6 flipped:(BOOL)a7 colorSpace:(CGColorSpace *)a8;
+ (CIImage)imageWithImageProvider:(id)p size:(size_t)width :(size_t)height format:(CIFormat)f colorSpace:(CGColorSpaceRef)cs options:(NSDictionary *)options;
+ (CIImage)imageWithInternalRepresentation:(void *)a3;
+ (CIImage)imageWithMTLTexture:(id)texture options:(NSDictionary *)options;
+ (CIImage)imageWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte;
+ (CIImage)imageWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte options:(NSDictionary *)options;
+ (CIImage)imageWithPortraitEffectsMatte:(id)a3;
+ (CIImage)imageWithPortraitEffectsMatte:(id)a3 options:(id)a4;
+ (CIImage)imageWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte;
+ (CIImage)imageWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte options:(NSDictionary *)options;
+ (CIImage)imageWithTexture:(unsigned int)a3 size:(CGSize)a4 options:(id)a5;
+ (CIImage)imageWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped colorSpace:(CGColorSpaceRef)colorSpace;
+ (CIImage)imageWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped options:(NSDictionary *)options;
+ (CIImage)imageWithYCCImage:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 colorSpace:(CGColorSpace *)a6;
+ (CIImage)imageWithYCCImage:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 precision:(int)a6 colorSpace:(CGColorSpace *)a7;
+ (CIImage)imageWithYImage:(id)a3 CrCbImage:(id)a4 CrCbScale:(int)a5 matrix:(int)a6 fullRange:(BOOL)a7 colorSpace:(CGColorSpace *)a8;
+ (CIImage)imageWithYImage:(id)a3 CrCbImage:(id)a4 CrCbScale:(int)a5 matrix:(int)a6 fullRange:(BOOL)a7 precision:(int)a8 colorSpace:(CGColorSpace *)a9;
+ (CIImage)magentaImage;
+ (CIImage)redImage;
+ (CIImage)whiteImage;
+ (CIImage)yellowImage;
+ (id)clearImage:(CGRect)a3;
+ (id)imageForRenderingWithMPS:(id)a3 orNonMPS:(id)a4;
+ (id)imageForRenderingWithMetal:(id)a3 orNonMetal:(id)a4;
+ (id)imageForRenderingWithMetalContext:(id)a3 orOpenGLContextUsingMetal:(id)a4 orNonMetalContext:(id)a5;
+ (id)imageYCC444:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 colorSpace:(CGColorSpace *)a6;
+ (id)imageYCC444:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 precision:(int)a6 colorSpace:(CGColorSpace *)a7;
+ (id)noiseImage;
+ (id)noiseImageNearest;
+ (id)noiseImagePadded;
+ (id)nullImage;
+ (id)smartColorAdjustmentsForValue:(double)a3 andStatistics:(id)a4;
+ (id)smartToneAdjustmentsForValue:(double)a3 andStatistics:(id)a4;
+ (id)smartToneAdjustmentsForValue:(double)a3 localLightAutoValue:(double)a4 andStatistics:(id)a5;
- (AVDepthData)depthData;
- (AVPortraitEffectsMatte)portraitEffectsMatte;
- (AVSemanticSegmentationMatte)semanticSegmentationMatte;
- (BOOL)cacheHint;
- (BOOL)isOpaque;
- (CGAffineTransform)imageTransformForCGOrientation:(SEL)a3;
- (CGAffineTransform)imageTransformForOrientation:(SEL)a3;
- (CGAffineTransform)inverseImageTransformForOrientation:(SEL)a3;
- (CGColorSpace)_copyHDRColorspaceFromSource:(CGImageSource *)a3 index:(unint64_t)a4;
- (CGColorSpace)baseColorSpace;
- (CGColorSpaceRef)colorSpace;
- (CGImage)_cgImageGraphRepresentation;
- (CGImageRef)CGImage;
- (CGPoint)calcIntersection:(CGPoint)a3 slope1:(CGPoint)a4 pt2:(CGPoint)a5 slope2:(CGPoint)a6;
- (CGPoint)pointWithDictionary:(id)a3 name:(id)a4 index:(int)a5 transformedBy:(CGAffineTransform *)a6;
- (CGRect)extent;
- (CGRect)regionOfInterestForImage:(CIImage *)image inRect:(CGRect)rect;
- (CIFilterShape)definition;
- (CIImage)imageByApplyingCGOrientation:(CGImagePropertyOrientation)orientation;
- (CIImage)imageByApplyingFilter:(NSString *)filterName;
- (CIImage)imageByApplyingFilter:(NSString *)filterName withInputParameters:(NSDictionary *)params;
- (CIImage)imageByApplyingGaussianBlurWithSigma:(double)sigma;
- (CIImage)imageByApplyingOrientation:(int)orientation;
- (CIImage)imageByApplyingTransform:(CGAffineTransform *)matrix;
- (CIImage)imageByApplyingTransform:(CGAffineTransform *)matrix highQualityDownsample:(BOOL)highQualityDownsample;
- (CIImage)imageByClampingToExtent;
- (CIImage)imageByClampingToRect:(CGRect)rect;
- (CIImage)imageByColorMatchingColorSpaceToWorkingSpace:(CGColorSpaceRef)colorSpace;
- (CIImage)imageByColorMatchingWorkingSpaceToColorSpace:(CGColorSpaceRef)colorSpace;
- (CIImage)imageByCompositingOverImage:(CIImage *)dest;
- (CIImage)imageByConvertingLabToWorkingSpace;
- (CIImage)imageByConvertingWorkingSpaceToLab;
- (CIImage)imageByCroppingToRect:(CGRect)rect;
- (CIImage)imageByInsertingIntermediate;
- (CIImage)imageByInsertingIntermediate:(BOOL)cache;
- (CIImage)imageByPremultiplyingAlpha;
- (CIImage)imageBySamplingLinear;
- (CIImage)imageBySamplingNearest;
- (CIImage)imageBySettingAlphaOneInExtent:(CGRect)extent;
- (CIImage)imageBySettingProperties:(NSDictionary *)properties;
- (CIImage)imageByUnpremultiplyingAlpha;
- (CIImage)imageWithExtent:(CGRect)a3 processorDescription:(id)a4 argumentDigest:(unint64_t)a5 inputFormat:(int)a6 outputFormat:(int)a7 options:(id)a8 roiCallback:(id)a9 processor:(id)a10;
- (CIImage)imageWithMesh:(id)a3 transform:(CGAffineTransform *)a4;
- (CIImage)initWithArrayOfImages:(id)a3 selector:(id)a4;
- (CIImage)initWithAttributedString:(id)a3 format:(int)a4;
- (CIImage)initWithAttributedString:(id)a3 format:(int)a4 options:(id)a5;
- (CIImage)initWithBitmapData:(NSData *)data bytesPerRow:(size_t)bytesPerRow size:(CGSize)size format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace;
- (CIImage)initWithBitmapData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 options:(id)a7;
- (CIImage)initWithCGImage:(CGImageRef)image;
- (CIImage)initWithCGImage:(CGImageRef)image options:(NSDictionary *)options;
- (CIImage)initWithCGImageSource:(CGImageSourceRef)source index:(size_t)index options:(NSDictionary *)dict;
- (CIImage)initWithCGLayer:(CGLayerRef)layer;
- (CIImage)initWithCGLayer:(CGLayerRef)layer options:(NSDictionary *)options;
- (CIImage)initWithCVImageBuffer:(CVImageBufferRef)imageBuffer;
- (CIImage)initWithCVImageBuffer:(CVImageBufferRef)imageBuffer options:(NSDictionary *)options;
- (CIImage)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer;
- (CIImage)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options;
- (CIImage)initWithCoder:(id)a3;
- (CIImage)initWithColor:(CIColor *)color;
- (CIImage)initWithColorR:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6;
- (CIImage)initWithContentsOfFile:(id)a3;
- (CIImage)initWithContentsOfFile:(id)a3 options:(id)a4;
- (CIImage)initWithContentsOfURL:(NSURL *)url;
- (CIImage)initWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options;
- (CIImage)initWithData:(NSData *)data;
- (CIImage)initWithData:(NSData *)data options:(NSDictionary *)options;
- (CIImage)initWithDepthData:(AVDepthData *)data;
- (CIImage)initWithDepthData:(AVDepthData *)data options:(NSDictionary *)options;
- (CIImage)initWithEmptyClearColor;
- (CIImage)initWithIOSurface:(IOSurfaceRef)surface;
- (CIImage)initWithIOSurface:(IOSurfaceRef)surface options:(NSDictionary *)options;
- (CIImage)initWithImageProvider:(id)a3 userInfo:(id)a4 size:(CGSize)a5 format:(int)a6 flipped:(BOOL)a7 colorSpace:(CGColorSpace *)a8;
- (CIImage)initWithImageProvider:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7 options:(id)a8;
- (CIImage)initWithImageProvider:(id)p size:(size_t)width :(size_t)height format:(CIFormat)f colorSpace:(CGColorSpaceRef)cs options:(NSDictionary *)options;
- (CIImage)initWithMTLTexture:(id)texture options:(NSDictionary *)options;
- (CIImage)initWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte;
- (CIImage)initWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte options:(NSDictionary *)options;
- (CIImage)initWithPortraitEffectsMatte:(id)a3;
- (CIImage)initWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte;
- (CIImage)initWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte options:(NSDictionary *)options;
- (CIImage)initWithTexture:(unsigned int)a3 size:(CGSize)a4 options:(id)a5;
- (CIImage)initWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped colorSpace:(CGColorSpaceRef)colorSpace;
- (CIImage)initWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped options:(NSDictionary *)options;
- (CVPixelBufferRef)pixelBuffer;
- (MTLTexture)metalTexture;
- (NSArray)autoAdjustmentFilters;
- (NSArray)autoAdjustmentFiltersWithOptions:(NSDictionary *)options;
- (NSDictionary)properties;
- (NSURL)url;
- (__CVBuffer)_pixelBufferFromAuxProps:(__CFDictionary *)a3 linear:(BOOL)a4;
- (float)_makernoteMeteorHeadroom;
- (float)contentHeadroom;
- (float)headroom;
- (id)TIFFRepresentation;
- (id)_autoRedEyeFilterWithFeatures:(id)a3 imageProperties:(id)a4 context:(id)a5 options:(id)a6;
- (id)_dictForFeature:(id)a3 invOrientationTransform:(CGAffineTransform *)a4 extent:(CGRect)a5;
- (id)_imageByApplyingColorMatrixRed:(CIImage *)self green:(SEL)a2 blue:bias:;
- (id)_imageByApplyingGainMap:(id)a3 headroom:(float)a4;
- (id)_imageByApplyingGamma:(double)a3;
- (id)_imageByApplyingTransform:(CGAffineTransform *)a3 highQualityDownsample:(Trilean)a4;
- (id)_imageByClampingAlpha;
- (id)_imageByRenderingToIntermediate;
- (id)_imageByToneMappingColorSpaceToWorkingSpace:(CGColorSpace *)a3 targetHeadroom:(float)a4;
- (id)_initNaiveWithCGImage:(CGImage *)a3 options:(id)a4;
- (id)_initWithBitmapData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 options:(id)a7;
- (id)_initWithCVImageBuffer:(__CVBuffer *)a3 options:(id)a4;
- (id)_initWithIOSurface:(__IOSurface *)a3 options:(id)a4 owner:(void *)a5;
- (id)_initWithImageProvider:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7 surfaceCache:(BOOL)a8 options:(id)a9;
- (id)_initWithInternalRepresentation:(void *)a3;
- (id)_pdfDataRepresentation;
- (id)_scaleImageToMaxDimension:(unsigned int)a3;
- (id)autoAdjustmentFiltersWithImageProperties:(id)a3 options:(id)a4;
- (id)autoPerspectiveFilterWithOptions:(id)a3;
- (id)autoPerspectiveResultWithOptions:(id)a3;
- (id)autoRedEyeFilterWithFeatures:(id)a3 imageProperties:(id)a4 options:(id)a5;
- (id)autoRedEyeFilterWithFeatures:(id)a3 options:(id)a4;
- (id)autoRotateFilterFFT:(id)a3 image:(CGImage *)a4 inputRect:(CGRect)a5 minTiltAngle:(float)a6 maxTiltAngle:(float)a7 detectVerticalLines:(BOOL)a8 thrVertAngle:(float)a9 thrDomAngleDiff:(float)a10;
- (id)debugDescription;
- (id)description;
- (id)filteredImage:(id)a3 keysAndValues:(id)a4;
- (id)getAutoRotateFilter:(id)a3 ciImage:(id)a4 inputRect:(CGRect)a5 rotateCropRect:(CGRect *)a6 minTiltAngle:(float)a7 maxTiltAngle:(float)a8 detectVerticalLines:(BOOL)a9 thrVertAngle:(float)a10 thrDomAngleDiff:(float)a11;
- (id)imageByApplyingGainMap:(id)a3;
- (id)imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:(CGColorSpace *)a3;
- (id)imageBySettingPropertiesNoCopy:(id)a3;
- (id)imageByTaggingWithColorSpace:(CGColorSpace *)a3;
- (id)imageByToneMappingColorSpaceToWorkingSpace:(CGColorSpace *)a3;
- (id)initAuxiliaryWithImageSource:(CGImageSource *)a3 index:(unint64_t)a4 options:(id)a5 depth:(BOOL)a6;
- (id)initForRenderingWithMPS:(id)a3 orNonMPS:(id)a4;
- (id)initForRenderingWithMetal:(id)a3 orNonMetal:(id)a4;
- (id)initForRenderingWithMetalContext:(id)a3 orOpenGLContextUsingMetal:(id)a4 orNonMetalContext:(id)a5;
- (id)initGainmapWithImageSource:(CGImageSource *)a3 options:(id)a4;
- (id)initMatteWithImageSource:(CGImageSource *)a3 options:(id)a4;
- (id)localLightStatistics;
- (id)localLightStatisticsNoProxy;
- (id)localLightStatisticsWithProxy:(BOOL)a3;
- (id)metalImageByApplyingFilter:(id)a3;
- (id)metalImageByApplyingFilter:(id)a3 withInputParameters:(id)a4;
- (id)smartBlackAndWhiteAdjustmentsForValue:(double)a3 andStatistics:(id)a4;
- (id)smartBlackAndWhiteStatistics;
- (id)smartColorAdjustmentsForValue:(double)a3 andStatistics:(id)a4;
- (id)smartColorStatistics;
- (id)smartToneAdjustmentsForValue:(double)a3 andStatistics:(id)a4;
- (id)smartToneAdjustmentsForValue:(double)a3 localLightAutoValue:(double)a4 andStatistics:(id)a5;
- (id)smartToneStatistics;
- (id)userInfo;
- (int)outputFormat;
- (unint64_t)digest;
- (unint64_t)recipeDigest;
- (void)_internalRepresentation;
- (void)_setOriginalCGImage:(CGImage *)a3 options:(id)a4;
- (void)_setOriginalCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4;
- (void)_setOriginalMTLTexture:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getAutocropRect:(id)a3 rotateXfrm:(CGAffineTransform *)a4 inputImageRect:(CGRect)a5 clipRect:(CGRect *)a6;
- (void)printTree;
- (void)setUserInfo:(id)a3;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)writeToTIFF:(id)a3;
@end

@implementation CIImage

- (void)_internalRepresentation
{
  return self->_priv;
}

+ (CIImage)imageWithInternalRepresentation:(void *)a3
{
  id v3 = [[CIImage alloc] _initWithInternalRepresentation:a3];

  return (CIImage *)v3;
}

- (id)_initWithInternalRepresentation:(void *)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CIImage;
    v4 = [(CIImage *)&v6 init];
    if (v4) {
      v4->_priv = (void *)CI::Object::ref((uint64_t)a3);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (CGRect)extent
{
  v3.origin.x = (*(double (**)(void *, SEL))(*(void *)self->_priv + 88))(self->_priv, a2);
  CGRect v4 = CGRectInset(v3, 0.00100000005, 0.00100000005);

  return CGRectIntegral(v4);
}

- (CGColorSpace)baseColorSpace
{
  return (CGColorSpace *)(*(uint64_t (**)(void))(*(void *)self->_priv + 248))();
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {
    if (priv[18] > 0x3FFu)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __18__CIImage_dealloc__block_invoke_2;
      v5[3] = &__block_descriptor_40_e5_v8__0l;
      v5[4] = priv;
      CI::Object::performDeferredRoot(v5);
    }
    else
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __18__CIImage_dealloc__block_invoke;
      v6[3] = &__block_descriptor_40_e5_v8__0l;
      v6[4] = priv;
      CI::Object::performDeferred(v6);
    }
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIImage;
  [(CIImage *)&v4 dealloc];
}

void __18__CIImage_dealloc__block_invoke(uint64_t a1)
{
  v1 = *(CI::Object **)(a1 + 32);
  if (v1) {
    CI::Object::unref(v1);
  }
}

+ (CIImage)emptyImage
{
  {
    +[CIImage emptyImage]::empty = [[CIImage alloc] initWithEmptyClearColor];
  }
  return (CIImage *)+[CIImage emptyImage]::empty;
}

- (CIImage)initWithEmptyClearColor
{
}

- (CIImage)imageByCroppingToRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  [(CIImage *)self extent];
  v27.origin.CGFloat x = v8;
  v27.origin.CGFloat y = v9;
  v27.size.CGFloat width = v10;
  v27.size.CGFloat height = v11;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  if (CGRectContainsRect(v23, v27))
  {
    v12 = self;
    return v12;
  }
  else
  {
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGRect v25 = CGRectIntegral(v24);
    CGFloat v14 = v25.origin.x;
    CGFloat v15 = v25.origin.y;
    CGFloat v16 = v25.size.width;
    CGFloat v17 = v25.size.height;
    [(CIImage *)self extent];
    v28.origin.CGFloat x = v18;
    v28.origin.CGFloat y = v19;
    v28.size.CGFloat width = v20;
    v28.size.CGFloat height = v21;
    v26.origin.CGFloat x = v14;
    v26.origin.CGFloat y = v15;
    v26.size.CGFloat width = v16;
    v26.size.CGFloat height = v17;
    if (CGRectIntersectsRect(v26, v28))
    {
      [(CIImage *)self _internalRepresentation];
      operator new();
    }
    return +[CIImage emptyImage];
  }
}

- (id)_imageByClampingAlpha
{
}

+ (CIImage)imageWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options
{
  objc_super v4 = [[CIImage alloc] initWithCVPixelBuffer:pixelBuffer options:options];

  return v4;
}

- (CIImage)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer options:(NSDictionary *)options
{
  if (!pixelBuffer)
  {
    CGFloat v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CIImage initWithCVPixelBuffer:options:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_12;
  }
  CFTypeID v7 = CFGetTypeID(pixelBuffer);
  if (v7 != CVPixelBufferGetTypeID())
  {
    v22 = ci_logger_api();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[CIImage initWithCVPixelBuffer:options:].cold.4(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_12;
  }
  PixelFormatType = (CI *)CVPixelBufferGetPixelFormatType(pixelBuffer);
  uint64_t v9 = (uint64_t)PixelFormatType;
  if (PixelFormatType == 1919365992 || PixelFormatType == 1919365990)
  {
    size_t Width = CVPixelBufferGetWidth(pixelBuffer);
    size_t Height = CVPixelBufferGetHeight(pixelBuffer);
    CGColorSpaceRef v12 = [(NSDictionary *)options objectForKeyedSubscript:@"CIImageColorSpace"];
    if (!v12)
    {
      CGColorSpaceRef v12 = CVImageBufferCopyColorSpace(pixelBuffer);
      CFAutorelease(v12);
    }
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __41__CIImage_initWithCVPixelBuffer_options___block_invoke;
    v49[3] = &unk_1E5771F20;
    v49[4] = pixelBuffer;
    int v50 = v9;
    return [(CIImage *)self initWithImageProvider:v49 width:Width height:Height format:2056 colorSpace:v12 options:options];
  }
  if ((CI::PixelFormatType_is_source_supported(PixelFormatType) & 1) == 0)
  {
    if (v9 < 0x29)
    {
      v35 = ci_logger_api();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[CIImage initWithCVPixelBuffer:options:](v9, v35, v36, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      unsigned int v48 = bswap32(v9);
      v34 = ci_logger_api();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[CIImage initWithCVPixelBuffer:options:]((uint64_t)&v48, v34);
      }
    }
LABEL_12:

    return 0;
  }
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  if (IOSurface)
  {
    IOSurfaceRef v32 = IOSurface;
    if (options) {
      id v33 = (id)[(NSDictionary *)options mutableCopy];
    }
    else {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v43 = v33;
    id v44 = v33;
    PixelBufferYCCMatriCGFloat x = GetPixelBufferYCCMatrix(pixelBuffer);
    if (PixelBufferYCCMatrix) {
      objc_msgSend(v43, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", PixelBufferYCCMatrix), @"kCIImageYCCMatrix");
    }
    if (![(NSDictionary *)options objectForKey:@"CIImageColorSpace"])
    {
      CGColorSpaceRef v46 = CVImageBufferCopyColorSpace(pixelBuffer);
      [v43 setObject:v46 forKey:@"CIImageColorSpace"];
      CFRelease(v46);
    }
    CFTypeRef Attachment = CVBufferGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F249D8], 0);
    if (Attachment && CFEqual(Attachment, (CFTypeRef)*MEMORY[0x1E4F249E8])) {
      [v43 setObject:MEMORY[0x1E4F1CC28] forKey:@"CIImagePremultiplied"];
    }
    if (CVBufferGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F249D0], 0) == (CFTypeRef)*MEMORY[0x1E4F1CFD0]) {
      [v43 setObject:MEMORY[0x1E4F1CC38] forKey:@"kCIImageAlphaSkip"];
    }
    if (![(NSDictionary *)options objectForKey:@"CIImageFlipped"]
      && !CVImageBufferIsFlipped(pixelBuffer))
    {
      [v43 setObject:MEMORY[0x1E4F1CC28] forKey:@"CIImageFlipped"];
    }
    v42 = [(CIImage *)self _initWithIOSurface:v32 options:v43 owner:pixelBuffer];
  }
  else
  {
    v42 = [(CIImage *)self _initWithCVImageBuffer:pixelBuffer options:options];
  }
  v13 = v42;
  [(CIImage *)v42 _setOriginalCVPixelBuffer:pixelBuffer options:options];
  return v13;
}

- (void)_setOriginalCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4
{
  v7[8] = *MEMORY[0x1E4F143B8];
  id v6 = (id)[a4 mutableCopy];
  v7[0] = @"kCIImageCacheHint";
  v7[1] = @"kCIImageCacheImmediately";
  v7[2] = @"kCIImageContentDigest";
  v7[3] = @"CIImageEdgesAreClear";
  v7[4] = @"kCIImageAVDepthData";
  v7[5] = @"kCIImageAVPortraitEffectsMatte";
  v7[6] = @"kCIImageAVSemanticSegmentationMatte";
  v7[7] = @"CIImageProperties";
  objc_msgSend(v6, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 8));
  if (![v6 count]) {
    (*(void (**)(void *, __CVBuffer *))(*(void *)self->_priv + 312))(self->_priv, a3);
  }
}

- (CIImage)initWithCGImage:(CGImageRef)image options:(NSDictionary *)options
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  if (!image)
  {
    uint64_t v25 = ci_logger_api();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[CIImage initWithCGImage:options:](v25, v26, v27, v28, v29, v30, v31, v32);
    }
LABEL_23:

    return 0;
  }
  CopyWithColorSpace = image;
  if (CGImageGetImageProvider())
  {
    PropertCGFloat y = (void *)CGImageProviderGetProperty();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      NSUInteger v8 = [(NSDictionary *)options countByEnumeratingWithState:&v111 objects:v129 count:16];
      if (!v8) {
        goto LABEL_14;
      }
      NSUInteger v9 = v8;
      uint64_t v10 = *(void *)v112;
      int v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v112 != v10) {
            objc_enumerationMutation(options);
          }
          v13 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          if (([v13 isEqual:@"CIImageProperties"] & 1) == 0) {
            v11 &= [v13 hasPrefix:@"kCGImageSource"];
          }
        }
        NSUInteger v9 = [(NSDictionary *)options countByEnumeratingWithState:&v111 objects:v129 count:16];
      }
      while (v9);
      if (v11)
      {
LABEL_14:
        id v14 = [(NSDictionary *)options objectForKey:@"CIImageProperties"];
        if (v14) {
          PropertCGFloat y = (void *)[Property imageBySettingProperties:v14];
        }

        return (CIImage *)Property;
      }
    }
  }
  size_t Width = CGImageGetWidth(CopyWithColorSpace);
  size_t Height = CGImageGetHeight(CopyWithColorSpace);
  size_t BytesPerRow = CGImageGetBytesPerRow(CopyWithColorSpace);
  if (!Width || !Height) {
    goto LABEL_23;
  }
  size_t v20 = BytesPerRow;
  v107 = self;
  int v21 = CI::alpha_mode_from_CGImage((uint64_t)CopyWithColorSpace, v19);
  int v23 = CI::format_from_CGImage((uint64_t)CopyWithColorSpace, v22);
  if (CGImageGetMask()) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = CGImageGetMaskingColors() != 0;
  }
  Decode = CGImageGetDecode(CopyWithColorSpace);
  if (Decode
    && (v35 = Decode,
        ColorSpace = CGImageGetColorSpace(CopyWithColorSpace),
        (size_t v37 = 2 * CGColorSpaceGetNumberOfComponents(ColorSpace)) != 0))
  {
    size_t v38 = 0;
    while (v35[v38] == 0.0 && v35[v38 + 1] == 1.0)
    {
      v38 += 2;
      if (v38 >= v37) {
        goto LABEL_33;
      }
    }
    int v39 = 1;
  }
  else
  {
LABEL_33:
    int v39 = 0;
  }
  int is_supported_source_bitmap = CI::format_is_supported_source_bitmap(v23);
  if ((v39 & 1) == 0 && !(is_supported_source_bitmap ^ 1 | v24))
  {
    if (options) {
      id v41 = (id)[(NSDictionary *)options mutableCopy];
    }
    else {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v54 = v41;
    id v55 = [(NSDictionary *)options valueForKey:@"kCIImageCacheImmediately"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v55)
    {
      char v56 = [v55 BOOLValue];
    }
    else
    {
      unsigned int v57 = atomic_load((unsigned int *)&dword_1EB466E78[17]);
      char v56 = v57 < 0x101 && v20 * Height < 0x4000001;
    }
    double v59 = iosurface_limits((uint64_t)buf);
    if (Height <= *(void *)&v120[4])
    {
      double v59 = iosurface_limits((uint64_t)v110);
      char v60 = Width <= v110[0] ? v56 : 0;
      if (v60)
      {
        uint64_t ImageProvider = CGImageGetImageProvider();
        if (ImageProvider)
        {
          uint64_t v62 = ImageProvider;
          id v63 = [(NSDictionary *)options valueForKey:@"kCIImageRequestSurfaceFormat"];
          if (v63)
          {
            uint64_t v117 = *MEMORY[0x1E4F2FFA0];
            id v118 = v63;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
            uint64_t v64 = CGImageProviderCopyIOSurface();
            if (v64)
            {
              Surface = (void *)v64;
              goto LABEL_96;
            }
          }
          Surface = (void *)CGImageProviderCopyIOSurface();
          if (Surface)
          {
LABEL_96:
            if (!objc_msgSend(v54, "objectForKey:", @"CIImageColorSpace", Data)) {
              [v54 setObject:CGImageGetColorSpace(CopyWithColorSpace) forKey:@"CIImageColorSpace"];
            }
            if (v21 == 2)
            {
              uint64_t v83 = MEMORY[0x1E4F1CC28];
              v84 = @"CIImagePremultiplied";
            }
            else
            {
              if (v21 != 1)
              {
LABEL_103:
                if (!getContentDigestFromOptions(options)) {
                  objc_msgSend(v54, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", CGImageGetIdentifier() | 0x6367696400000000), @"kCIImageContentDigest");
                }
                uint64_t v15 = [(CIImage *)v107 _initWithIOSurface:Surface options:v54 owner:0];
                [(CIImage *)v15 _setOriginalCGImage:CopyWithColorSpace options:options];

                CFRelease(Surface);
                return v15;
              }
              uint64_t v83 = MEMORY[0x1E4F1CC38];
              v84 = @"kCIImageAlphaOne";
            }
            [v54 setObject:v83 forKey:v84];
            goto LABEL_103;
          }
          int v104 = CI_IOSURFACE_WRAPPING(1u);
          uint64_t v85 = *MEMORY[0x1E4F1DD40];
          v115[0] = *MEMORY[0x1E4F1DD48];
          v115[1] = v85;
          v116[0] = MEMORY[0x1E4F1CC38];
          v116[1] = MEMORY[0x1E4F1CC38];
          v115[2] = *MEMORY[0x1E4F1DD20];
          v116[2] = &unk_1EE4AA9B8;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:3];
          int v21 = CI::alpha_mode_from_CGImageProvider(v62);
          uint64_t v86 = CI::format_from_CGImageProvider(v62);
          int v106 = CI::PixelFormatType_from_format(v86);
          unsigned int v87 = CI::PixelFormatType_approx_from_format(v86);
          if (v86)
          {
            if (v87)
            {
              unsigned int v103 = v87;
              uint64_t v88 = CGImageProviderCopyImageBlockSetWithOptions();
              if (v88)
              {
                uint64_t v89 = v88;
                if (CGImageBlockSetGetCount() == 1)
                {
                  uint64_t v102 = v89;
                  uint64_t ImageBlock = CGImageBlockSetGetImageBlock();
                  if (iosurface_creatable_from_cgblock(ImageBlock))
                  {
                    CGImageBlockGetRect();
                    v133.origin.CGFloat x = v91;
                    v133.origin.CGFloat y = v92;
                    v133.size.CGFloat width = v93;
                    v133.size.CGFloat height = v94;
                    v132.origin.CGFloat x = 0.0;
                    v132.origin.CGFloat y = 0.0;
                    v132.size.CGFloat width = (double)Width;
                    v132.size.CGFloat height = (double)Height;
                    if (CGRectEqualToRect(v132, v133))
                    {
                      uint64_t v101 = CGImageBlockGetBytesPerRow();
                      Data = (const void *)CGImageBlockGetData();
                      if (IOSurfaceWrapPointerOk(Data) && (v101 & 3) == 0 && v104)
                      {
                        uint64_t PixelSize = CGImageProviderGetPixelSize();
                        WrappedSurface = CreateWrappedSurface(Width, Height, v103, v101, PixelSize, (uint64_t)Data);
                        if (WrappedSurface)
                        {
                          Surface = WrappedSurface;
                          CGImageBlockSetRetain();
                          v108[0] = MEMORY[0x1E4F143A8];
                          v108[1] = 3221225472;
                          v108[2] = __35__CIImage_initWithCGImage_options___block_invoke_2;
                          v108[3] = &__block_descriptor_40_e5_v8__0l;
                          v108[4] = v102;
                          SetSurfaceDeallocBlock(Surface, (uint64_t)v108);
                          goto LABEL_119;
                        }
                      }
                      else
                      {
                        Surface = CreateSurface((__CVBuffer *)Width, (__CVBuffer *)Height, (void *)0x10, v103, 0);
                        v109[0] = MEMORY[0x1E4F143A8];
                        v109[1] = 3221225472;
                        v109[2] = __35__CIImage_initWithCGImage_options___block_invoke;
                        v109[3] = &__block_descriptor_48_e21_v48__0_v8Q16Q24Q32Q40l;
                        v109[4] = Data;
                        v109[5] = v101;
                        SurfaceApplyPlaneBlock((__IOSurface *)Surface, (uint64_t)v109);
                        if (Surface)
                        {
LABEL_119:
                          v97 = CGImageGetColorSpace(CopyWithColorSpace);
                          if (v97)
                          {
                            CFPropertyListRef v98 = CGColorSpaceCopyPropertyList(v97);
                            if (v98)
                            {
                              v99 = v98;
                              IOSurfaceSetValue((IOSurfaceRef)Surface, (CFStringRef)*MEMORY[0x1E4F2F068], v98);
                              CFRelease(v99);
                            }
                          }
                          if (v21 == 1 || v21 == -1) {
                            IOSurfaceSetValue((IOSurfaceRef)Surface, @"IOSurfaceAlphaIsOpaque", (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
                          }
                          if (v106 != v103) {
                            objc_msgSend(v54, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v86), @"CIImageSurfaceFormat");
                          }
                          CGImageBlockSetRelease();
                          goto LABEL_96;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          CGImageBlockSetRelease();
        }
      }
    }
    uint64_t v15 = -[CIImage _initNaiveWithCGImage:options:](v107, "_initNaiveWithCGImage:options:", CopyWithColorSpace, v54, v59, Data);
    [(CIImage *)v15 _setOriginalCGImage:CopyWithColorSpace options:options];

    return v15;
  }
  size_t BitsPerComponent = CGImageGetBitsPerComponent(CopyWithColorSpace);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(CopyWithColorSpace);
  CGBitmapInfo v44 = (CGImageGetBitmapInfo(CopyWithColorSpace) >> 8) & 1;
  if (BitsPerComponent > 8) {
    CGBitmapInfo v44 = 1;
  }
  CGBitmapInfo v105 = v44;
  CGBitmapInfo BitmapInfo = CGImageGetBitmapInfo(CopyWithColorSpace);
  CGColorSpaceRef v46 = ci_logger_performance();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v47 = "ABGR8";
    *(_DWORD *)buf = 136447490;
    *(void *)v120 = "-[CIImage initWithCGImage:options:]";
    if (v105) {
      v47 = "RGBAh";
    }
    *(_WORD *)&v120[8] = 2082;
    *(void *)&v120[10] = v47;
    unsigned int v48 = "decode array";
    if (!v39) {
      unsigned int v48 = "pixel format that is unsupported";
    }
    __int16 v121 = 2048;
    size_t v122 = BitsPerComponent;
    __int16 v123 = 2048;
    size_t v124 = BitsPerPixel;
    __int16 v125 = 1024;
    CGBitmapInfo v126 = BitmapInfo;
    if (v24) {
      unsigned int v48 = "mask";
    }
    __int16 v127 = 2082;
    v128 = v48;
    _os_log_impl(&dword_193671000, v46, OS_LOG_TYPE_INFO, "%{public}s CI_CONVERSION: Rendered to intermediate %{public}s CGImage because the CGImage (bpc:%zu bpp:%zu info:0x%X) passed to Core Image has a %{public}s.", buf, 0x3Au);
  }
  v49 = CGImageGetColorSpace(CopyWithColorSpace);
  int v50 = CGColorSpaceRetain(v49);
  if (CGColorSpaceGetModel(v50) == kCGColorSpaceModelIndexed)
  {
    BaseColorSpace = CGColorSpaceGetBaseColorSpace(v50);
    CGColorSpaceRef v52 = CGColorSpaceRetain(BaseColorSpace);
    CGColorSpaceRelease(v50);
    int v50 = v52;
  }
  if (CGColorSpaceGetModel(v50) != kCGColorSpaceModelRGB)
  {
    CGColorSpaceRelease(v50);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    goto LABEL_56;
  }
  if (v50)
  {
    if (CGColorSpaceSupportsOutput(v50))
    {
      DeviceRGB = v50;
LABEL_56:
      int v50 = 0;
      goto LABEL_78;
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace(CopyWithColorSpace, DeviceRGB);
  }
  else
  {
    DeviceRGB = 0;
  }
LABEL_78:
  if (v105)
  {
    size_t v66 = 8 * Width;
    size_t v67 = Width;
    size_t v68 = Height;
    size_t v69 = 16;
    v70 = DeviceRGB;
    uint32_t v71 = 4353;
  }
  else
  {
    size_t v66 = 4 * Width;
    size_t v67 = Width;
    size_t v68 = Height;
    size_t v69 = 8;
    v70 = DeviceRGB;
    uint32_t v71 = 8194;
  }
  v72 = CGBitmapContextCreate(0, v67, v68, v69, v66, v70, v71);
  CGColorSpaceRelease(DeviceRGB);
  if (!v72)
  {
    if (v50) {
      CGImageRelease(CopyWithColorSpace);
    }
    CGColorSpaceRelease(v50);
    v75 = ci_logger_api();
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      goto LABEL_94;
    }
LABEL_93:
    -[CIImage initWithCGImage:options:](v75, v76, v77, v78, v79, v80, v81, v82);
LABEL_94:

    return 0;
  }
  v131.size.CGFloat width = (double)Width;
  v131.size.CGFloat height = (double)Height;
  v131.origin.CGFloat x = 0.0;
  v131.origin.CGFloat y = 0.0;
  CGContextDrawImage(v72, v131, CopyWithColorSpace);
  v73 = CGBitmapContextCreateImage(v72);
  CGContextRelease(v72);
  if (!v73)
  {
    if (v50) {
      CGImageRelease(CopyWithColorSpace);
    }
    CGColorSpaceRelease(v50);
    v75 = ci_logger_api();
    if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
  if (v50)
  {
    CGImageRef v74 = CGImageCreateCopyWithColorSpace(v73, v50);
    CGImageRelease(v73);
    CGImageRelease(CopyWithColorSpace);
    v73 = v74;
  }
  uint64_t v15 = [(CIImage *)v107 initWithCGImage:v73 options:options];
  CGColorSpaceRelease(v50);
  CGImageRelease(v73);
  return v15;
}

- (id)_initWithIOSurface:(__IOSurface *)a3 options:(id)a4 owner:(void *)a5
{
  if (!a3) {
    goto LABEL_19;
  }
  PixelFormat = (CI *)IOSurfaceGetPixelFormat(a3);
  uint64_t v9 = (uint64_t)PixelFormat;
  if (PixelFormat != 1919365992 && PixelFormat != 1919365990)
  {
    if (CI::PixelFormatType_is_source_supported(PixelFormat))
    {
      int v15 = CI::format_from_IOSurface(a3, v14);
      uint64_t v16 = (void *)[a4 objectForKey:@"CIImageSurfaceFormat"];
      if (!v16
        || (int v17 = [v16 unsignedIntValue],
            int v18 = CI::format_bits_per_pixel(v15),
            int v15 = v17,
            v18 == CI::format_bits_per_pixel(v17)))
      {
        if ([a4 objectForKey:@"CIImageFlipped"]) {
          objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CIImageFlipped"), "BOOLValue");
        }
        if (!CI::format_has_unpremul_alpha(v15) && (CI::format_has_alpha(v15) & 1) == 0) {
          CI::format_has_x(v15);
        }
        if ([a4 objectForKey:@"CIImagePremultiplied"]) {
          objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CIImagePremultiplied"), "BOOLValue");
        }
        objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kCIImageAlphaSkip"), "BOOLValue");
        objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kCIImageAlphaOne"), "BOOLValue");
        CI::format_is_ycc(v15);
        if (a4) {
          [a4 objectForKey:@"CIImageEdgesAreClear"];
        }
        uint64_t v29 = (void *)MEMORY[0x1E4F1CC38];
        if (a4)
        {
          [a4 objectForKey:@"CIImageClampToEdge"];
          uint64_t v30 = (void *)[a4 objectForKey:@"CIImageEdgeRepeat"];
        }
        else
        {
          uint64_t v30 = 0;
        }
        if ((v30 == v29 || v30 == &unk_1EE4AAA18)
          && (uint64_t v31 = ci_logger_api(), os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)))
        {
          -[CIImage _initWithIOSurface:options:owner:]();
          if (!a4) {
            goto LABEL_37;
          }
        }
        else if (!a4)
        {
LABEL_37:
          uint64_t v32 = [a4 objectForKey:@"CIImageColorSpace"];
          if ([MEMORY[0x1E4F1CA98] null] != v32 && !CI_NO_CM() && !v32)
          {
            CGColorSpaceRef DeviceRGB = CopySurfaceColorSpace(a3);
            if (DeviceRGB || (CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB()) != 0) {
              CFAutorelease(DeviceRGB);
            }
          }
          if ([a4 objectForKey:@"kCIImageToneMapHDRtoSDR"] && a4) {
            [a4 objectForKey:@"kCIImageToneMapHDRtoSDR"];
          }
          v34 = (void *)[a4 objectForKey:@"CIImageProperties"];
          v35 = (void *)[a4 objectForKey:@"kCIImageApplyOrientationProperty"];
          if ([v35 isEqual:MEMORY[0x1E4F1CC38]])
          {
            uint64_t v36 = (void *)[v34 objectForKey:*MEMORY[0x1E4F2FCA0]];
            if (v36) {
              [v36 intValue];
            }
            if (v34 && (void *)[MEMORY[0x1E4F1CA98] null] != v34)
            {
              size_t v37 = &__block_literal_global_780;
LABEL_56:
              dictionaryDeepCopy(v34, (uint64_t)v37);
            }
          }
          else if (v34 && (void *)[MEMORY[0x1E4F1CA98] null] != v34)
          {
            size_t v37 = &__block_literal_global_786;
            goto LABEL_56;
          }
          if ([a4 objectForKey:@"kCIImageYCCMatrix"]) {
            objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kCIImageYCCMatrix"), "intValue");
          }
          OptionHeadroom((NSDictionary *)a4);
          operator new();
        }
        [a4 objectForKey:@"CIImageNearestSampling"];
        [a4 objectForKey:@"kCIImageCacheHint"];
        goto LABEL_37;
      }
      uint64_t v27 = ci_logger_api();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[CIImage _initWithIOSurface:options:owner:]();
      }
    }
    else if (v9 < 0x29)
    {
      size_t v20 = ci_logger_api();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[CIImage _initWithIOSurface:options:owner:].cold.4(v9, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    else
    {
      LODWORD(v38) = bswap32(v9);
      uint64_t v19 = ci_logger_api();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CIImage _initWithIOSurface:options:owner:]((uint64_t)&v38, v19);
      }
    }
LABEL_19:

    return 0;
  }
  size_t Width = IOSurfaceGetWidth(a3);
  size_t Height = IOSurfaceGetHeight(a3);
  CGColorSpaceRef v12 = (CGColorSpaceRef)[a4 objectForKeyedSubscript:@"CIImageColorSpace"];
  if (!v12)
  {
    CGColorSpaceRef v12 = CopySurfaceColorSpace(a3);
    CFAutorelease(v12);
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __44__CIImage__initWithIOSurface_options_owner___block_invoke;
  v39[3] = &unk_1E5771F20;
  v39[4] = a3;
  int v40 = v9;
  return [(CIImage *)self initWithImageProvider:v39 width:Width height:Height format:2056 colorSpace:v12 options:a4];
}

- (void)_setOriginalCGImage:(CGImage *)a3 options:(id)a4
{
  v7[6] = *MEMORY[0x1E4F143B8];
  id v6 = (id)[a4 mutableCopy];
  v7[0] = @"kCIImageCacheHint";
  v7[1] = @"kCIImageCacheImmediately";
  v7[2] = @"kCIImageContentDigest";
  v7[3] = @"CIImageEdgesAreClear";
  v7[4] = @"kCIImageAVDepthData";
  v7[5] = @"CIImageProperties";
  objc_msgSend(v6, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 6));
  if (![v6 count]) {
    (*(void (**)(void *, CGImage *))(*(void *)self->_priv + 312))(self->_priv, a3);
  }
}

- (CIImage)imageByApplyingTransform:(CGAffineTransform *)matrix
{
  long long v3 = *(_OWORD *)&matrix->c;
  v5[0] = *(_OWORD *)&matrix->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&matrix->tx;
  return (CIImage *)[(CIImage *)self _imageByApplyingTransform:v5 highQualityDownsample:0];
}

- (id)_imageByApplyingTransform:(CGAffineTransform *)a3 highQualityDownsample:(Trilean)a4
{
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v22.c = v6;
  *(_OWORD *)&v22.tCGFloat x = *(_OWORD *)&a3->tx;
  if (CGAffineTransformIsIdentity(&v22)) {
    return self;
  }
  NSUInteger v8 = [(CIImage *)self _internalRepresentation];
  v9.f64[0] = a3->a;
  v9.f64[1] = a3->c;
  float64x2_t v10 = *(float64x2_t *)&a3->d;
  if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(v9), (int8x16_t)vcgezq_f64(v9)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(v10), (int8x16_t)vcgezq_f64(v10)))))))
  {
    v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CIImage _imageByApplyingTransform:highQualityDownsample:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    return +[CIImage emptyImage];
  }
  int v11 = v8;
  if (fabs(vmlad_n_f64(-(a3->b * a3->c), a3->a, v10.f64[0])) >= 1.0e-10) {
    operator new();
  }
  v23.origin.CGFloat x = (*(double (**)(void *))(*(void *)v8 + 88))(v8);
  if (!CGRectIsInfinite(v23)) {
    return +[CIImage emptyImage];
  }
  if ((*(unsigned int (**)(void *))(*(void *)v11 + 16))(v11) == 9) {
    return self;
  }
  return 0;
}

- (BOOL)isOpaque
{
  return (*(uint64_t (**)(void))(*(void *)self->_priv + 128))();
}

- (float)contentHeadroom
{
  (*(void (**)(void))(*(void *)self->_priv + 232))();
  return result;
}

- (CIImage)imageByApplyingFilter:(NSString *)filterName withInputParameters:(NSDictionary *)params
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFTypeID v7 = (void *)MEMORY[0x199702DB0](self, a2);
  NSUInteger v8 = +[CIFilter filterWithName:filterName setDefaults:1];
  if (v8)
  {
    float64x2_t v9 = v8;
    if ([(NSDictionary *)[(CIFilter *)v8 attributes] objectForKey:@"inputImage"]) {
      [(CIFilter *)v9 setValue:self forKey:@"inputImage"];
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    NSUInteger v10 = [(NSDictionary *)params countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      NSUInteger v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(params);
          }
          [(CIFilter *)v9 setValue:[(NSDictionary *)params objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * v13)] forKey:*(void *)(*((void *)&v16 + 1) + 8 * v13)];
          ++v13;
        }
        while (v11 != v13);
        NSUInteger v11 = [(NSDictionary *)params countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
    uint64_t v14 = [(CIFilter *)v9 outputImage];
    return v14;
  }
  else
  {
    return 0;
  }
}

- (id)imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:(CGColorSpace *)a3
{
  if (a3)
  {
    if (CI::ColorSpace_is_RGB_or_Gray_and_supports_output((BOOL)a3, (CGColorSpace *)a2))
    {
      v5 = [(CIImage *)self _internalRepresentation];
      if ((*(unsigned int (**)(void *))(*(void *)v5 + 16))(v5) != 4
        || !*((unsigned char *)v5 + 137)
        || (long long v6 = (CGColorSpace *)*((void *)v5 + 15), v6 != a3) && (!v6 || !CFEqual(a3, v6))
        || *((unsigned char *)v5 + 138))
      {
        operator new();
      }
      uint64_t v17 = (*(uint64_t (**)(void *, void))(*(void *)v5 + 48))(v5, 0);
      return +[CIImage imageWithInternalRepresentation:v17];
    }
    else
    {
      float64x2_t v9 = ci_logger_api();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CIImage imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
      return 0;
    }
  }
  else
  {
    CFTypeID v7 = self;
    return v7;
  }
}

- (CIImage)imageByClampingToRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  if (!CGRectIsEmpty(rect))
  {
    v11.origin.CGFloat x = x;
    v11.origin.CGFloat y = y;
    v11.size.CGFloat width = width;
    v11.size.CGFloat height = height;
    if (CGRectIsInfinite(v11))
    {
      NSUInteger v8 = self;
      return v8;
    }
    [(CIImage *)self extent];
    if (!CGRectIsEmpty(v12))
    {
      [(CIImage *)self extent];
      v15.origin.CGFloat x = x;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      CGRect v14 = CGRectIntersection(v13, v15);
      if (!CGRectIsEmpty(v14))
      {
        [(CIImage *)self _internalRepresentation];
        operator new();
      }
    }
  }

  return +[CIImage emptyImage];
}

- (CIImage)initWithCGImage:(CGImageRef)image
{
  return [(CIImage *)self initWithCGImage:image options:0];
}

- (CIImage)imageBySettingAlphaOneInExtent:(CGRect)extent
{
}

- (CGColorSpaceRef)colorSpace
{
  return (CGColorSpaceRef)(*(uint64_t (**)(void))(*(void *)self->_priv + 240))();
}

+ (CIImage)blackImage
{
  {
    +[CIImage blackImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor blackColor]];
  }
  return (CIImage *)+[CIImage blackImage]::i;
}

+ (CIImage)whiteImage
{
  {
    +[CIImage whiteImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor whiteColor]];
  }
  return (CIImage *)+[CIImage whiteImage]::i;
}

+ (CIImage)grayImage
{
  {
    +[CIImage grayImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor grayColor]];
  }
  return (CIImage *)+[CIImage grayImage]::i;
}

+ (CIImage)redImage
{
  {
    +[CIImage redImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor redColor]];
  }
  return (CIImage *)+[CIImage redImage]::i;
}

+ (CIImage)greenImage
{
  {
    +[CIImage greenImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor greenColor]];
  }
  return (CIImage *)+[CIImage greenImage]::i;
}

+ (CIImage)blueImage
{
  {
    +[CIImage blueImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor blueColor]];
  }
  return (CIImage *)+[CIImage blueImage]::i;
}

+ (CIImage)cyanImage
{
  {
    +[CIImage cyanImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor cyanColor]];
  }
  return (CIImage *)+[CIImage cyanImage]::i;
}

+ (CIImage)magentaImage
{
  {
    +[CIImage magentaImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor magentaColor]];
  }
  return (CIImage *)+[CIImage magentaImage]::i;
}

+ (CIImage)yellowImage
{
  {
    +[CIImage yellowImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor yellowColor]];
  }
  return (CIImage *)+[CIImage yellowImage]::i;
}

+ (CIImage)clearImage
{
  {
    +[CIImage clearImage]::uint64_t i = [[CIImage alloc] initWithColor:+[CIColor clearColor]];
  }
  return (CIImage *)+[CIImage clearImage]::i;
}

uint64_t __44__CIImage__initWithIOSurface_options_owner___block_invoke(uint64_t a1, char *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a7)
  {
    CGRect v13 = __b;
    uint64_t v14 = a7;
    do
    {
      memset_pattern8(v13, &unk_193950998, 8 * a6);
      v13 += a3;
      --v14;
    }
    while (v14);
  }
  CGRect v15 = *(__IOSurface **)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__CIImage__initWithIOSurface_options_owner___block_invoke_2;
  v18[3] = &__block_descriptor_84_e22_v48__0r_v8Q16Q24Q32Q40l;
  v18[4] = a7;
  v18[5] = __b;
  v18[6] = a3;
  v18[7] = a5;
  int v19 = *(_DWORD *)(a1 + 40);
  v18[8] = a6;
  v18[9] = a4;
  return SurfaceApplyPlaneReadOnlyBlock(v15, (uint64_t)v18);
}

uint64_t __44__CIImage__initWithIOSurface_options_owner___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(result + 32);
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)(result + 48);
    int v9 = *(_DWORD *)(result + 80);
    uint64_t v10 = *(void *)(result + 40) + 2 * a3;
    uint64_t v11 = a2 + *(void *)(result + 56) * a6;
    do
    {
      if (v9 == 1919365992)
      {
        uint64_t v13 = *(void *)(result + 64);
        if (v13)
        {
          uint64_t v14 = 0;
          uint64_t v15 = v11 + 2 * *(void *)(result + 72);
          uint64_t v16 = (_WORD *)v10;
          do
          {
            *uint64_t v16 = *(_WORD *)(v15 + 2 * v14);
            v16 += 4;
            ++v14;
          }
          while (v13 != v14);
        }
      }
      else if (v9 == 1919365990)
      {
        uint64_t v12 = *(void *)(result + 64);
        if (v12)
        {
          uint64_t v17 = 0;
          uint64_t v18 = v11 + 4 * *(void *)(result + 72);
          do
          {
            _S0 = *(_DWORD *)(v18 + v17);
            __asm { FCVT            H0, S0 }
            *(_WORD *)(v10 + 2 * v17) = _S0;
            v17 += 4;
            --v12;
          }
          while (v12);
        }
      }
      ++v7;
      v10 += v8;
      v11 += a6;
    }
    while (v7 != v6);
  }
  return result;
}

+ (id)nullImage
{
  return +[CIImage emptyImage];
}

+ (CIImage)imageWithIOSurface:(IOSurfaceRef)surface
{
  return +[CIImage imageWithIOSurface:surface options:0];
}

+ (CIImage)imageWithIOSurface:(IOSurfaceRef)surface options:(NSDictionary *)options
{
  objc_super v4 = [[CIImage alloc] initWithIOSurface:surface options:options];

  return v4;
}

- (CIImage)initWithIOSurface:(IOSurfaceRef)surface
{
  return [(CIImage *)self initWithIOSurface:surface options:0];
}

- (CIImage)initWithIOSurface:(IOSurfaceRef)surface options:(NSDictionary *)options
{
  return (CIImage *)[(CIImage *)self _initWithIOSurface:surface options:options owner:0];
}

- (CGImageRef)CGImage
{
  v2 = (CGImage *)(*(uint64_t (**)(void *, SEL))(*(void *)self->_priv + 304))(self->_priv, a2);
  if (!v2) {
    return 0;
  }
  long long v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 != CGImageGetTypeID()) {
    return 0;
  }
  return v3;
}

+ (CIImage)imageWithCGImage:(CGImageRef)image
{
  return +[CIImage imageWithCGImage:image options:0];
}

+ (CIImage)imageWithCGImage:(CGImageRef)image options:(NSDictionary *)options
{
  CFTypeID v4 = [[CIImage alloc] initWithCGImage:image options:options];

  return v4;
}

+ (CIImage)imageWithCGImageSource:(CGImageSourceRef)source index:(size_t)index options:(NSDictionary *)dict
{
  v5 = [[CIImage alloc] initWithCGImageSource:source index:index options:dict];

  return v5;
}

- (id)_initNaiveWithCGImage:(CGImage *)a3 options:(id)a4
{
  if (a3)
  {
    v25.receiver = self;
    v25.super_class = (Class)CIImage;
    uint64_t v6 = [(CIImage *)&v25 init];
    if (v6)
    {
      if ([a4 objectForKey:@"CIImageFlipped"]) {
        int v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CIImageFlipped"), "BOOLValue");
      }
      else {
        int v7 = 1;
      }
      uint64_t v8 = (void *)MEMORY[0x1E4F1CC38];
      if (a4)
      {
        int v9 = (void *)[a4 objectForKey:@"CIImageEdgesAreClear"];
        BOOL v11 = v9 == v8 || v9 == &unk_1EE4AAA18;
        HIDWORD(v24) = v11;
        uint64_t v12 = (void *)[a4 objectForKey:@"CIImageClampToEdge"];
        BOOL v14 = v12 == v8 || v12 == &unk_1EE4AAA18;
        LODWORD(v24) = v14;
        uint64_t v15 = (void *)[a4 objectForKey:@"CIImageEdgeRepeat"];
      }
      else
      {
        uint64_t v24 = 0;
        uint64_t v15 = 0;
      }
      if ((v15 == v8 || v15 == &unk_1EE4AAA18)
        && (uint64_t v16 = ci_logger_api(), os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)))
      {
        -[CIImage _initNaiveWithCGImage:options:]();
        if (!a4) {
          goto LABEL_28;
        }
      }
      else if (!a4)
      {
LABEL_28:
        uint64_t v17 = [a4 objectForKey:@"CIImageColorSpace"];
        HIDWORD(v23) = v7;
        if ([MEMORY[0x1E4F1CA98] null] == v17 || CI_NO_CM())
        {
          LODWORD(v23) = 1;
        }
        else
        {
          if (!v17) {
            CGImageGetColorSpace(a3);
          }
          LODWORD(v23) = 0;
        }
        if (objc_msgSend(a4, "objectForKey:", @"kCIImageToneMapHDRtoSDR", v23, v24) && a4) {
          [a4 objectForKey:@"kCIImageToneMapHDRtoSDR"];
        }
        uint64_t v18 = (void *)[a4 objectForKey:@"CIImageProperties"];
        int v19 = (void *)[a4 objectForKey:@"kCIImageApplyOrientationProperty"];
        if ([v19 isEqual:MEMORY[0x1E4F1CC38]])
        {
          uint64_t v20 = (void *)[v18 objectForKey:*MEMORY[0x1E4F2FCA0]];
          if (v20) {
            [v20 intValue];
          }
          if (v18 && (void *)[MEMORY[0x1E4F1CA98] null] != v18)
          {
            uint64_t v21 = &__block_literal_global_780;
            goto LABEL_46;
          }
        }
        else if (v18 && (void *)[MEMORY[0x1E4F1CA98] null] != v18)
        {
          uint64_t v21 = &__block_literal_global_786;
LABEL_46:
          dictionaryDeepCopy(v18, (uint64_t)v21);
        }
        OptionHeadroom((NSDictionary *)a4);
        operator new();
      }
      [a4 objectForKey:@"CIImageNearestSampling"];
      [a4 objectForKey:@"kCIImageCacheHint"];
      goto LABEL_28;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

void *__35__CIImage_initWithCGImage_options___block_invoke(void *result, char *__dst, uint64_t a3, uint64_t a4, uint64_t a5, size_t a6)
{
  if (a5)
  {
    uint64_t v9 = (uint64_t)result;
    for (uint64_t i = 0; i != a5; ++i)
    {
      size_t v11 = *(void *)(v9 + 40);
      if (v11 >= a6) {
        size_t v12 = a6;
      }
      else {
        size_t v12 = *(void *)(v9 + 40);
      }
      float result = memcpy(__dst, (const void *)(*(void *)(v9 + 32) + v11 * i), v12);
      __dst += a6;
    }
  }
  return result;
}

uint64_t __35__CIImage_initWithCGImage_options___block_invoke_2()
{
  return CGImageBlockSetRelease();
}

- (id)initAuxiliaryWithImageSource:(CGImageSource *)a3 index:(unint64_t)a4 options:(id)a5 depth:(BOOL)a6
{
  v44[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_26;
  }
  uint64_t v10 = (const char *)(a6 ? 1751410032 : 1751411059);
  CFDictionaryRef v11 = imageSourceCopyAuxiliaryDataInfo(a3, a4, (const __CFString *)*MEMORY[0x1E4F2F3B8]);
  if (!v11)
  {
    CFDictionaryRef v11 = imageSourceCopyAuxiliaryDataInfo(a3, a4, (const __CFString *)*MEMORY[0x1E4F2F3B0]);
    if (!v11) {
      goto LABEL_26;
    }
  }
  uint64_t v12 = *MEMORY[0x1E4F2F380];
  Value = CFDictionaryGetValue(v11, (const void *)*MEMORY[0x1E4F2F380]);
  BOOL v14 = Value;
  if (Value)
  {
    CFTypeRef v15 = CFRetain(Value);
    CFAutorelease(v15);
  }
  uint64_t v16 = (void *)AVFDepthDataFromDictionary(v11);
  CFRelease(v11);
  if (!v16) {
    goto LABEL_26;
  }
  if (AVFDepthDataType(v16, v17) != v10) {
    uint64_t v16 = AVFDepthDataByConvertingToDepthDataType(v16, v10);
  }
  int v19 = AVFDepthDataMap(v16, v18);
  if (v19)
  {
    uint64_t v20 = v19;
    v43 = @"kCIImageAVDepthData";
    v44[0] = v16;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    if (v14)
    {
      v41[1] = @"CIImageProperties";
      v42[0] = v16;
      v41[0] = @"kCIImageAVDepthData";
      uint64_t v39 = v12;
      int v40 = v14;
      v42[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
    }
    uint64_t v22 = v21;
    uint64_t v23 = (void *)[a5 objectForKey:@"kCIImageApplyOrientationProperty"];
    if ([v23 isEqual:MEMORY[0x1E4F1CC38]])
    {
      CFDictionaryRef v24 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)a5);
      uint64_t v25 = *MEMORY[0x1E4F2FCA0];
      uint64_t v26 = (void *)[(__CFDictionary *)v24 objectForKey:*MEMORY[0x1E4F2FCA0]];
      if (v26)
      {
        unsigned int v27 = [v26 intValue];
        uint64_t v28 = v27 - 9 >= 0xFFFFFFF8 ? v27 : 0;
        if ((int)v28 >= 1)
        {
          v37[0] = @"kCIImageAVDepthData";
          v37[1] = @"kCIImageApplyOrientationProperty";
          v38[0] = v16;
          v38[1] = MEMORY[0x1E4F1CC38];
          v37[2] = @"CIImageProperties";
          uint64_t v35 = v25;
          uint64_t v36 = [NSNumber numberWithInt:v28];
          v38[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
          if (v14)
          {
            v33[0] = @"kCIImageAVDepthData";
            v33[1] = @"kCIImageApplyOrientationProperty";
            v34[0] = v16;
            v34[1] = MEMORY[0x1E4F1CC38];
            v33[2] = @"CIImageProperties";
            v31[1] = v12;
            v32[0] = objc_msgSend(NSNumber, "numberWithInt:", v28, v25);
            v32[1] = v14;
            v34[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
            uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
          }
          uint64_t v22 = v29;
        }
      }
      CFRelease(v24);
    }
    return [(CIImage *)self initWithCVPixelBuffer:v20 options:v22];
  }
  else
  {
LABEL_26:

    return 0;
  }
}

- (__CVBuffer)_pixelBufferFromAuxProps:(__CFDictionary *)a3 linear:(BOOL)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef pixelBufferOut = 0;
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  Value = (void *)CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F2F378]);
  int v7 = CFDictionaryGetValue(a3, (const void *)*MEMORY[0x1E4F2F370]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v8 = objc_msgSend((id)objc_msgSend(Value, "valueForKey:", @"Width"), "intValue");
  int v9 = objc_msgSend((id)objc_msgSend(Value, "valueForKey:", @"Height"), "intValue");
  int v10 = objc_msgSend((id)objc_msgSend(Value, "valueForKey:", @"BytesPerRow"), "intValue");
  int v11 = objc_msgSend((id)objc_msgSend(Value, "valueForKey:", @"PixelFormat"), "unsignedLongValue");
  BOOL v12 = !v8 || v9 == 0;
  if (v12 || v10 == 0) {
    return 0;
  }
  if (v10 < v8 || v11 != 1278226488) {
    return 0;
  }
  uint64_t v21 = *MEMORY[0x1E4F24D20];
  v22[0] = MEMORY[0x1E4F1CC08];
  CVReturn v16 = CVPixelBufferCreate(0, v8, v9, 0x4C303038u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1], &pixelBufferOut);
  float result = pixelBufferOut;
  if (!v16)
  {
    uint64_t v17 = (CFTypeRef *)MEMORY[0x1E4F24BE8];
    if (!v4) {
      uint64_t v17 = (CFTypeRef *)MEMORY[0x1E4F24C10];
    }
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8], *v17, kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A90], (CFTypeRef)*MEMORY[0x1E4F24AB0], kCVAttachmentMode_ShouldPropagate);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __43__CIImage__pixelBufferFromAuxProps_linear___block_invoke;
    v18[3] = &unk_1E5771F68;
    v18[4] = v7;
    int v19 = v10;
    PixelBufferApplyOnePlaneBlock(pixelBufferOut, 0, (uint64_t)v18);
    return pixelBufferOut;
  }
  return result;
}

char *__43__CIImage__pixelBufferFromAuxProps_linear___block_invoke(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t a6)
{
  float result = (char *)[*(id *)(a1 + 32) bytes];
  int v11 = result;
  if (*(_DWORD *)(a1 + 40) == a6)
  {
    return (char *)memcpy(a2, result, a6 * a5);
  }
  else if (a5)
  {
    uint64_t v12 = 0;
    do
    {
      size_t v13 = *(int *)(a1 + 40);
      if (v13 >= a6) {
        size_t v14 = a6;
      }
      else {
        size_t v14 = *(int *)(a1 + 40);
      }
      float result = (char *)memcpy(a2, &v11[(int)v13 * (uint64_t)(int)v12++], v14);
      a2 += a6;
    }
    while (a5 != v12);
  }
  return result;
}

- (id)initMatteWithImageSource:(CGImageSource *)a3 options:(id)a4
{
  v58[5] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_55;
  }
  int v7 = (void *)[a4 valueForKey:@"kCIImageAuxiliaryPortraitEffectsMatte"];
  int v8 = [v7 isEqual:MEMORY[0x1E4F1CC38]];
  int v9 = (const __CFString **)MEMORY[0x1E4F2F3D0];
  if (v8)
  {
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F2F3D0];
    int v11 = @"kCIImageAVPortraitEffectsMatte";
LABEL_15:
    char v18 = 1;
    goto LABEL_16;
  }
  uint64_t v12 = (void *)[a4 valueForKey:@"kCIImageAuxiliarySemanticSegmentationSkinMatte"];
  if ([v12 isEqual:MEMORY[0x1E4F1CC38]])
  {
    size_t v13 = (const __CFString **)MEMORY[0x1E4F2F3E8];
LABEL_14:
    CFStringRef v10 = *v13;
    int v11 = @"kCIImageAVSemanticSegmentationMatte";
    goto LABEL_15;
  }
  size_t v14 = (void *)[a4 valueForKey:@"kCIImageAuxiliarySemanticSegmentationHairMatte"];
  if ([v14 isEqual:MEMORY[0x1E4F1CC38]])
  {
    size_t v13 = (const __CFString **)MEMORY[0x1E4F2F3E0];
    goto LABEL_14;
  }
  CFTypeRef v15 = (void *)[a4 valueForKey:@"kCIImageAuxiliarySemanticSegmentationTeethMatte"];
  if ([v15 isEqual:MEMORY[0x1E4F1CC38]])
  {
    size_t v13 = (const __CFString **)MEMORY[0x1E4F2F3F8];
    goto LABEL_14;
  }
  CVReturn v16 = (void *)[a4 valueForKey:@"kCIImageAuxiliarySemanticSegmentationGlassesMatte"];
  if ([v16 isEqual:MEMORY[0x1E4F1CC38]])
  {
    size_t v13 = (const __CFString **)MEMORY[0x1E4F2F3D8];
    goto LABEL_14;
  }
  uint64_t v17 = (void *)[a4 valueForKey:@"kCIImageAuxiliarySemanticSegmentationSkyMatte"];
  if ([v17 isEqual:MEMORY[0x1E4F1CC38]])
  {
    size_t v13 = (const __CFString **)MEMORY[0x1E4F2F3F0];
    goto LABEL_14;
  }
  CFStringRef v10 = 0;
  char v18 = 0;
  int v11 = 0;
LABEL_16:
  CFDictionaryRef v19 = imageSourceCopyAuxiliaryDataInfo(a3, 0, v10);
  if (!v19) {
    goto LABEL_55;
  }
  CFDictionaryRef v20 = v19;
  uint64_t v51 = *MEMORY[0x1E4F2F380];
  Value = CFDictionaryGetValue(v19, (const void *)*MEMORY[0x1E4F2F380]);
  uint64_t v22 = Value;
  if (Value)
  {
    CFTypeRef v23 = CFRetain(Value);
    CFAutorelease(v23);
  }
  uint64_t v24 = *MEMORY[0x1E4F2F3E0];
  v58[0] = *MEMORY[0x1E4F2F3E8];
  v58[1] = v24;
  uint64_t v25 = *MEMORY[0x1E4F2F3D8];
  v58[2] = *MEMORY[0x1E4F2F3F8];
  v58[3] = v25;
  v58[4] = *MEMORY[0x1E4F2F3F0];
  uint64_t v26 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:5];
  if (v10 == *v9)
  {
    uint64_t v32 = (void *)AVPortraitEffectsMatteFromDictionary(v20);
    uint64_t v31 = v32;
    if (v32)
    {
      uint64_t v30 = AVFPortraitEffectsMatteImage(v32, v33);
      uint64_t v29 = 0;
      if (!v30) {
        goto LABEL_30;
      }
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if (![v26 containsObject:v10])
  {
    uint64_t v31 = 0;
LABEL_28:
    uint64_t v29 = 0;
LABEL_30:
    v34 = [(CIImage *)self _pixelBufferFromAuxProps:v20 linear:1];
    if (v34)
    {
      uint64_t v30 = v34;
      CFAutorelease(v34);
      goto LABEL_32;
    }
    CFRelease(v20);
LABEL_55:

    return 0;
  }
  unsigned int v27 = (void *)AVSemanticSegmentationMatteFromDictionary(v20, (uint64_t)v10);
  uint64_t v29 = v27;
  if (!v27)
  {
    uint64_t v31 = 0;
    goto LABEL_30;
  }
  uint64_t v30 = AVSemanticSegmentationMatteImage(v27, v28);
  uint64_t v31 = 0;
  if (!v30) {
    goto LABEL_30;
  }
LABEL_32:
  CFRelease(v20);
  uint64_t v35 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v36 = v35;
  char v37 = v18 ^ 1;
  if (v31) {
    char v38 = v37;
  }
  else {
    char v38 = 1;
  }
  if ((v38 & 1) == 0) {
    [v35 setObject:v31 forKey:v11];
  }
  if (v29) {
    char v39 = v37;
  }
  else {
    char v39 = 1;
  }
  if ((v39 & 1) == 0) {
    [v36 setObject:v29 forKey:v11];
  }
  if (v22)
  {
    uint64_t v56 = v51;
    unsigned int v57 = v22;
    objc_msgSend(v36, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1), @"CIImageProperties");
  }
  if ([a4 valueForKey:@"CIImageColorSpace"]) {
    objc_msgSend(v36, "setObject:forKey:", objc_msgSend(a4, "valueForKey:", @"CIImageColorSpace"), @"CIImageColorSpace");
  }
  int v40 = (void *)[a4 objectForKey:@"kCIImageApplyOrientationProperty"];
  if ([v40 isEqual:MEMORY[0x1E4F1CC38]])
  {
    CFDictionaryRef v41 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)a4);
    uint64_t v42 = *MEMORY[0x1E4F2FCA0];
    v43 = (void *)[(__CFDictionary *)v41 objectForKey:*MEMORY[0x1E4F2FCA0]];
    if (v43)
    {
      unsigned int v44 = [v43 intValue];
      uint64_t v45 = v44 - 9 >= 0xFFFFFFF8 ? v44 : 0;
      if ((int)v45 >= 1)
      {
        [v36 setObject:MEMORY[0x1E4F1CC38] forKey:@"kCIImageApplyOrientationProperty"];
        if (v22)
        {
          v54[0] = v42;
          v54[1] = v51;
          v55[0] = [NSNumber numberWithInt:v45];
          v55[1] = v22;
          CGColorSpaceRef v46 = (void *)MEMORY[0x1E4F1C9E8];
          v47 = v55;
          unsigned int v48 = v54;
          uint64_t v49 = 2;
        }
        else
        {
          uint64_t v52 = v42;
          uint64_t v53 = [NSNumber numberWithInt:v45];
          CGColorSpaceRef v46 = (void *)MEMORY[0x1E4F1C9E8];
          v47 = &v53;
          unsigned int v48 = &v52;
          uint64_t v49 = 1;
        }
        objc_msgSend(v36, "setObject:forKey:", objc_msgSend(v46, "dictionaryWithObjects:forKeys:count:", v47, v48, v49), @"CIImageProperties");
      }
    }
    CFRelease(v41);
  }
  return [(CIImage *)self initWithCVPixelBuffer:v30 options:v36];
}

- (id)initGainmapWithImageSource:(CGImageSource *)a3 options:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_16;
  }
  int v7 = (void *)[a4 valueForKey:@"kCIImageAuxiliaryHDRGainMap"];
  if (([v7 isEqual:MEMORY[0x1E4F1CC38]] & 1) == 0) {
    goto LABEL_16;
  }
  if (![a4 objectForKey:@"kCIImageAuxiliaryGainMapPreference"])
  {
    [0 intValue];
    [0 intValue];
  }
  uint64_t v34 = *MEMORY[0x1E4F2F398];
  v35[0] = *MEMORY[0x1E4F2F3A0];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  CFDictionaryRef v8 = (const __CFDictionary *)CGImageSourceCopyAuxiliaryDataInfoAtIndexWithOptions();
  if (!v8)
  {
    CFDictionaryRef v8 = imageSourceCopyAuxiliaryDataInfo(a3, 0, (const __CFString *)*MEMORY[0x1E4F2F3C0]);
    if (!v8) {
      goto LABEL_16;
    }
  }
  uint64_t v9 = *MEMORY[0x1E4F2F380];
  Value = CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E4F2F380]);
  int v11 = Value;
  if (Value)
  {
    CFRetain(Value);
    CFAutorelease(v11);
  }
  uint64_t v12 = (__CVBuffer *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E4F2F390]);
  if (!v12)
  {
    size_t v13 = [(CIImage *)self _pixelBufferFromAuxProps:v8 linear:1];
    CFRelease(v8);
    if (v13) {
      goto LABEL_12;
    }
LABEL_16:

    return 0;
  }
  size_t v13 = v12;
  CFRetain(v12);
  CFRelease(v8);
LABEL_12:
  size_t v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (v11)
  {
    uint64_t v32 = v9;
    id v33 = v11;
    objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), @"CIImageProperties");
  }
  if ([a4 valueForKey:@"CIImageColorSpace"]) {
    uint64_t v15 = [a4 valueForKey:@"CIImageColorSpace"];
  }
  else {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  [v14 setObject:v15 forKey:@"CIImageColorSpace"];
  uint64_t v17 = (void *)[a4 objectForKey:@"kCIImageApplyOrientationProperty"];
  if ([v17 isEqual:MEMORY[0x1E4F1CC38]])
  {
    CFDictionaryRef v18 = CGImageSourceCopyPropertiesAtIndex(a3, 0, (CFDictionaryRef)a4);
    uint64_t v19 = *MEMORY[0x1E4F2FCA0];
    CFDictionaryRef v20 = (void *)[(__CFDictionary *)v18 objectForKey:*MEMORY[0x1E4F2FCA0]];
    if (v20)
    {
      unsigned int v21 = [v20 intValue];
      uint64_t v22 = v21 - 9 >= 0xFFFFFFF8 ? v21 : 0;
      if ((int)v22 >= 1)
      {
        [v14 setObject:MEMORY[0x1E4F1CC38] forKey:@"kCIImageApplyOrientationProperty"];
        if (v11)
        {
          v30[0] = v19;
          v30[1] = v9;
          v31[0] = [NSNumber numberWithInt:v22];
          v31[1] = v11;
          CFTypeRef v23 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v24 = v31;
          uint64_t v25 = v30;
          uint64_t v26 = 2;
        }
        else
        {
          uint64_t v28 = v19;
          uint64_t v29 = [NSNumber numberWithInt:v22];
          CFTypeRef v23 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v24 = &v29;
          uint64_t v25 = &v28;
          uint64_t v26 = 1;
        }
        objc_msgSend(v14, "setObject:forKey:", objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, v26), @"CIImageProperties");
      }
    }
    CFRelease(v18);
  }
  CVReturn v16 = [(CIImage *)self initWithCVPixelBuffer:v13 options:v14];
  CFRelease(v13);
  return v16;
}

- (id)_imageByApplyingGainMap:(id)a3 headroom:(float)a4
{
  v134[8] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return self;
  }
  int v7 = (void *)[a3 properties];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2F380]];
  if (!v8)
  {
    int v13 = 0;
    float v14 = 0.0;
    int32x4_t v125 = 0u;
    int32x4_t v126 = 0u;
    int32x4_t v123 = 0u;
    int32x4_t v124 = 0u;
    float32x4_t v121 = 0u;
    float v15 = 0.0;
    goto LABEL_6;
  }
  uint64_t v9 = (const CGImageMetadata *)v8;
  CFStringRef v10 = (void *)MEMORY[0x199702DB0]();
  int v11 = (void *)copyMetadataValue(v9, @"HDRToneMap:Version");
  if (v11) {
    int v12 = [v11 intValue];
  }
  else {
    int v12 = 0;
  }
  int v13 = objc_msgSend((id)copyMetadataValue(v9, @"HDRToneMap:BaseColorIsWorkingColor"), "isEqual:", @"True");
  uint64_t v19 = (void *)copyMetadataValue(v9, @"HDRToneMap:BaseHeadroom");
  if (v19)
  {
    [v19 floatValue];
    float v15 = v20;
  }
  else
  {
    float v15 = NAN;
  }
  unsigned int v21 = (void *)copyMetadataValue(v9, @"HDRToneMap:AlternateHeadroom");
  if (v21)
  {
    [v21 floatValue];
    float v14 = v22;
  }
  else
  {
    float v14 = NAN;
  }
  CFTypeRef v23 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[0].BaseOffset");
  if (v23) {
    [v23 floatValue];
  }
  else {
    v24.i32[0] = 2143289344;
  }
  int32x4_t v126 = vdupq_lane_s32(v24, 0);
  uint64_t v25 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[1].BaseOffset");
  if (v25)
  {
    [v25 floatValue];
    int32x4_t v26 = v126;
    v26.i32[1] = v27;
    int32x4_t v126 = v26;
  }
  uint64_t v28 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[2].BaseOffset");
  if (v28)
  {
    [v28 floatValue];
    int32x4_t v29 = v126;
    v29.i32[2] = v30;
    int32x4_t v126 = v29;
  }
  uint64_t v31 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[0].AlternateOffset");
  if (v31) {
    [v31 floatValue];
  }
  else {
    v32.i32[0] = 2143289344;
  }
  int32x4_t v125 = vdupq_lane_s32(v32, 0);
  id v33 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[1].AlternateOffset");
  if (v33)
  {
    [v33 floatValue];
    int32x4_t v34 = v125;
    v34.i32[1] = v35;
    int32x4_t v125 = v34;
  }
  uint64_t v36 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[2].AlternateOffset");
  if (v36)
  {
    [v36 floatValue];
    int32x4_t v37 = v125;
    v37.i32[2] = v38;
    int32x4_t v125 = v37;
  }
  char v39 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[0].GainMapMin");
  if (v39) {
    [v39 floatValue];
  }
  else {
    v40.i32[0] = 2143289344;
  }
  int32x4_t v124 = vdupq_lane_s32(v40, 0);
  CFDictionaryRef v41 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[1].GainMapMin");
  if (v41)
  {
    [v41 floatValue];
    int32x4_t v42 = v124;
    v42.i32[1] = v43;
    int32x4_t v124 = v42;
  }
  unsigned int v44 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[2].GainMapMin");
  if (v44)
  {
    [v44 floatValue];
    int32x4_t v45 = v124;
    v45.i32[2] = v46;
    int32x4_t v124 = v45;
  }
  v47 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[0].GainMapMax");
  if (v47) {
    [v47 floatValue];
  }
  else {
    v48.i32[0] = 2143289344;
  }
  int32x4_t v123 = vdupq_lane_s32(v48, 0);
  uint64_t v49 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[1].GainMapMax");
  if (v49)
  {
    [v49 floatValue];
    int32x4_t v50 = v123;
    v50.i32[1] = v51;
    int32x4_t v123 = v50;
  }
  uint64_t v52 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[2].GainMapMax");
  if (v52)
  {
    [v52 floatValue];
    int32x4_t v53 = v123;
    v53.i32[2] = v54;
    int32x4_t v123 = v53;
  }
  id v55 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[0].Gamma");
  if (v55) {
    [v55 floatValue];
  }
  else {
    v56.i32[0] = 2143289344;
  }
  float32x4_t v121 = (float32x4_t)vdupq_lane_s32(v56, 0);
  unsigned int v57 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[1].Gamma");
  if (v57)
  {
    [v57 floatValue];
    float32x4_t v58 = v121;
    v58.i32[1] = v59;
    float32x4_t v121 = v58;
  }
  char v60 = (void *)copyMetadataValue(v9, @"HDRToneMap:ChannelMetadata[2].Gamma");
  if (v60)
  {
    [v60 floatValue];
    float32x4_t v61 = v121;
    v61.i32[2] = v62;
    float32x4_t v121 = v61;
  }
  id v63 = CGImageMetadataCopyTagWithPath(v9, 0, @"HDRGainMap:HDRGainMapVersion");
  uint64_t v64 = v63;
  if (v63) {
    v65 = (void *)CGImageMetadataTagCopyValue(v63);
  }
  else {
    v65 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v18 = 0;
    if (!v65) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  int v18 = [v65 intValue];
  if (v65) {
LABEL_58:
  }
    CFRelease(v65);
LABEL_59:
  if (v64) {
    CFRelease(v64);
  }
  if (v12 == 1)
  {
    int v17 = 1;
    goto LABEL_73;
  }
  if (v12 >= 2)
  {
    size_t v66 = ci_logger_api();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      size_t v67 = "Image's gain map will be ignored because FlexRange version value was not supported.";
LABEL_71:
      _os_log_impl(&dword_193671000, v66, OS_LOG_TYPE_DEFAULT, v67, (uint8_t *)&buf, 2u);
      goto LABEL_72;
    }
    goto LABEL_72;
  }
  int v17 = 0;
  if (v18 != 0x20000 && v18 != 0x10000)
  {
    if (v18)
    {
      size_t v66 = ci_logger_api();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.a) = 0;
        size_t v67 = "Image's gain map will be ignored because GainMap version value was not supported.";
        goto LABEL_71;
      }
LABEL_72:
      int v17 = 0;
      goto LABEL_73;
    }
LABEL_6:
    CVReturn v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.a) = 0;
      _os_log_impl(&dword_193671000, v16, OS_LOG_TYPE_DEFAULT, "Image's gain map will be ignored because no version tag was present.", (uint8_t *)&buf, 2u);
    }
    int v17 = 0;
    int v18 = 0;
  }
LABEL_73:
  memset(&buf, 0, sizeof(buf));
  [(CIImage *)self extent];
  double v69 = v68;
  [a3 extent];
  CGFloat v71 = v69 / v70;
  [(CIImage *)self extent];
  double v73 = v72;
  [a3 extent];
  CGAffineTransformMakeScale(&buf, v71, v73 / v74);
  CGAffineTransform v127 = buf;
  uint64_t v75 = [a3 imageByApplyingTransform:&v127];
  if (v17)
  {
    float v76 = exp2f(v15);
    float v77 = exp2f(v14);
    float v78 = fmaxf(v76, v77);
    float v79 = fminf(fmaxf(a4, fminf(v76, v77)), v78);
    if (a4 == 0.0) {
      float v79 = v78;
    }
    float v80 = log2f(v79);
    __asm { FMOV            V0.4S, #1.0 }
    float32x4_t v116 = vdivq_f32(_Q0, v121);
    float v86 = fminf(fmaxf((float)(v80 - v15) / (float)(v14 - v15), 0.0), 1.0);
    if (v80 <= v15) {
      float v87 = -v86;
    }
    else {
      float v87 = v86;
    }
    uint64_t v88 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_flexMap, *(_OWORD *)&v116);
    if (v13 && [(CIImage *)self colorSpace]) {
      CGColorSpaceRef ExtendedLinearized = CGColorSpaceCreateExtendedLinearized([(CIImage *)self colorSpace]);
    }
    else {
      CGColorSpaceRef ExtendedLinearized = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBD8]);
    }
    int v104 = ExtendedLinearized;
    CGBitmapInfo v105 = [(CIImage *)self imageByColorMatchingWorkingSpaceToColorSpace:ExtendedLinearized];
    float v106 = exp2f(v80);
    [(CIImage *)v105 extent];
    double v108 = v107;
    double v122 = v109;
    double v119 = v111;
    double v120 = v110;
    v134[0] = v105;
    v134[1] = v75;
    v134[2] = +[CIVector vectorWithX:*(float *)&v117 Y:*((float *)&v117 + 1) Z:v118];
    v134[3] = +[CIVector vectorWithX:*(float *)v124.i32 Y:*(float *)&v124.i32[1] Z:*(float *)&v124.i32[2]];
    v134[4] = +[CIVector vectorWithX:*(float *)v123.i32 Y:*(float *)&v123.i32[1] Z:*(float *)&v123.i32[2]];
    *(float *)&double v112 = v87;
    v134[5] = [NSNumber numberWithFloat:v112];
    v134[6] = +[CIVector vectorWithX:*(float *)v126.i32 Y:*(float *)&v126.i32[1] Z:*(float *)&v126.i32[2]];
    v134[7] = +[CIVector vectorWithX:*(float *)v125.i32 Y:*(float *)&v125.i32[1] Z:*(float *)&v125.i32[2]];
    uint64_t v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:8];
    CGRect v132 = @"kCIImageContentHeadroom";
    *(float *)&double v114 = v106;
    uint64_t v133 = [NSNumber numberWithFloat:v114];
    self = (CIImage *)objc_msgSend(-[CIColorKernel applyWithExtent:arguments:options:](v88, "applyWithExtent:arguments:options:", v113, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1), v108, v122, v120, v119), "imageByColorMatchingColorSpaceToWorkingSpace:", v104);
    CGColorSpaceRelease(v104);
  }
  else if (v18 == 0x20000 || v18 == 0x10000)
  {
    v90 = +[CIKernel kernelWithInternalRepresentation:&CI::_gainMap];
    [(CIImage *)self _makernoteMeteorHeadroom];
    float v92 = fminf(fmaxf(a4, 1.0), v91);
    float v93 = a4 == 0.0 ? v91 : v92;
    if (v93 > 1.0)
    {
      [(CIImage *)self extent];
      double v95 = v94;
      double v97 = v96;
      double v99 = v98;
      double v101 = v100;
      v131[0] = self;
      v131[1] = v75;
      *(float *)&double v94 = v93;
      v131[2] = [NSNumber numberWithFloat:v94];
      uint64_t v102 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:3];
      v129 = @"kCIImageContentHeadroom";
      *(float *)&double v103 = v93;
      uint64_t v130 = [NSNumber numberWithFloat:v103];
      return -[CIColorKernel applyWithExtent:arguments:options:](v90, "applyWithExtent:arguments:options:", v102, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1], v95, v97, v99, v101);
    }
  }
  return self;
}

- (id)imageByApplyingGainMap:(id)a3
{
  return [(CIImage *)self _imageByApplyingGainMap:a3 headroom:0.0];
}

- (CGColorSpace)_copyHDRColorspaceFromSource:(CGImageSource *)a3 index:(unint64_t)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F2FE58];
  v13[0] = *MEMORY[0x1E4F2FE68];
  uint64_t v6 = *MEMORY[0x1E4F2FE60];
  v12[0] = v5;
  v12[1] = v6;
  uint64_t v10 = *MEMORY[0x1E4F2F360];
  uint64_t v11 = MEMORY[0x1E4F1CC38];
  v13[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(a3, 0, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2]);
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  CGColorSpaceRetain(ColorSpace);
  CGImageRelease(ImageAtIndex);
  return ColorSpace;
}

- (CIImage)initWithCGImageSource:(CGImageSourceRef)source index:(size_t)index options:(NSDictionary *)dict
{
  if (!source)
  {

    return 0;
  }
  id v9 = [(NSDictionary *)dict valueForKey:@"kCIImageAuxiliaryDepth"];
  if ([v9 isEqual:MEMORY[0x1E4F1CC38]])
  {
    uint64_t v10 = self;
    CGImageSourceRef v11 = source;
    size_t v12 = index;
    int v13 = dict;
    uint64_t v14 = 1;
LABEL_9:
    return (CIImage *)[(CIImage *)v10 initAuxiliaryWithImageSource:v11 index:v12 options:v13 depth:v14];
  }
  id v17 = [(NSDictionary *)dict valueForKey:@"kCIImageAuxiliaryDisparity"];
  if ([v17 isEqual:MEMORY[0x1E4F1CC38]])
  {
    uint64_t v10 = self;
    CGImageSourceRef v11 = source;
    size_t v12 = index;
    int v13 = dict;
    uint64_t v14 = 0;
    goto LABEL_9;
  }
  id v18 = [(NSDictionary *)dict valueForKey:@"kCIImageAuxiliaryPortraitEffectsMatte"];
  if (([v18 isEqual:MEMORY[0x1E4F1CC38]] & 1) != 0
    || (id v19 = -[NSDictionary valueForKey:](dict, "valueForKey:", @"kCIImageAuxiliarySemanticSegmentationGlassesMatte"), ([v19 isEqual:MEMORY[0x1E4F1CC38]] & 1) != 0)|| (v20 = -[NSDictionary valueForKey:](dict, "valueForKey:", @"kCIImageAuxiliarySemanticSegmentationSkyMatte"), (objc_msgSend(v20, "isEqual:", MEMORY[0x1E4F1CC38]) & 1) != 0)|| (v21 = -[NSDictionary valueForKey:](dict, "valueForKey:", @"kCIImageAuxiliarySemanticSegmentationSkinMatte"), (objc_msgSend(v21, "isEqual:", MEMORY[0x1E4F1CC38]) & 1) != 0)|| (v22 = -[NSDictionary valueForKey:](dict, "valueForKey:", @"kCIImageAuxiliarySemanticSegmentationHairMatte"), (objc_msgSend(v22, "isEqual:", MEMORY[0x1E4F1CC38]) & 1) != 0)|| (v23 = -[NSDictionary valueForKey:](dict, "valueForKey:",
                @"kCIImageAuxiliarySemanticSegmentationTeethMatte"),
        [v23 isEqual:MEMORY[0x1E4F1CC38]]))
  {
    return (CIImage *)[(CIImage *)self initMatteWithImageSource:source options:dict];
  }
  id v24 = [(NSDictionary *)dict valueForKey:@"kCIImageAuxiliaryHDRGainMap"];
  id v25 = (id)MEMORY[0x1E4F1CC38];
  if (![v24 isEqual:MEMORY[0x1E4F1CC38]])
  {
    if (dict) {
      id v26 = [(NSDictionary *)dict objectForKey:@"kCIImageExpandToHDR"];
    }
    else {
      id v26 = 0;
    }
    if (v26 == v25 || v26 == &unk_1EE4AAA18) {
      [(__CFString *)(id)CGImageSourceGetType(source) hasSuffix:@"raw-image"];
    }
    if (dict) {
      id v27 = (id)[(NSDictionary *)dict mutableCopy];
    }
    else {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v28 = v27;
    uint64_t v29 = *MEMORY[0x1E4F2FF88];
    id v30 = [(NSDictionary *)dict valueForKey:*MEMORY[0x1E4F2FF88]];
    uint64_t v31 = *MEMORY[0x1E4F1CFD0];
    if (!v30) {
      [v28 setObject:*MEMORY[0x1E4F1CFD0] forKey:v29];
    }
    [v28 setObject:v31 forKey:*MEMORY[0x1E4F2FE50]];
    if (![(NSDictionary *)dict valueForKey:@"kCGImageSourceRasterizationDPI"]) {
      [v28 setObject:&unk_1EE4AA9D0 forKey:@"kCGImageSourceRasterizationDPI"];
    }
    id v32 = (id)MEMORY[0x1E4F1CC38];
    [v28 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F2FDF0]];
    if (dict) {
      id v33 = [(NSDictionary *)dict objectForKey:@"kCIImageExpandToHDR"];
    }
    else {
      id v33 = 0;
    }
    BOOL v34 = v33 == v32 || v33 == &unk_1EE4AAA18;
    int v35 = v34;
    if (v34)
    {
      id v36 = (id)[(NSDictionary *)dict mutableCopy];
      [v36 setValue:MEMORY[0x1E4F1CC38] forKey:@"kCIImageAuxiliaryHDRGainMap"];
      int32x4_t v37 = +[CIImage imageWithCGImageSource:source index:index options:v36];
    }
    else
    {
      int32x4_t v37 = 0;
    }
    if (![v28 objectForKey:@"CIImageProperties"])
    {
      CFDictionaryRef v38 = CGImageSourceCopyPropertiesAtIndex(source, index, (CFDictionaryRef)v28);
      if (v38)
      {
        CFDictionaryRef v39 = v38;
        int v69 = v35;
        int32x2_t v40 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v38];
        CFDictionaryRef v41 = (void *)[v40 valueForKeyPath:@"{JPEG}.ChromaSubsamplingX"];
        int32x4_t v42 = (void *)[v40 valueForKeyPath:@"{JPEG}.ChromaSubsamplingY"];
        if ([v41 intValue] == 1 || objc_msgSend(v42, "intValue") == 1) {
          objc_msgSend(v28, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", 1111970369), @"kCIImageRequestSurfaceFormat");
        }
        [v40 removeObjectForKey:*MEMORY[0x1E4F2FC10]];
        [v28 setObject:v40 forKey:@"CIImageProperties"];
        CFRelease(v39);
        int v35 = v69;
      }
    }
    uint64_t v43 = *MEMORY[0x1E4F2FF18];
    unsigned int v44 = (void *)[v28 valueForKey:*MEMORY[0x1E4F2FF18]];
    uint64_t v45 = [v28 valueForKey:@"kCIImageCacheImmediately"];
    if (v44 && !v45)
    {
      __int32 v46 = v37;
      int v47 = v35;
      int32x2_t v48 = NSNumber;
      uint64_t v49 = [v44 BOOLValue];
      int32x4_t v50 = v48;
      int v35 = v47;
      int32x4_t v37 = v46;
      objc_msgSend(v28, "setValue:forKey:", objc_msgSend(v50, "numberWithBool:", v49), @"kCIImageCacheImmediately");
    }
    [v28 setValue:MEMORY[0x1E4F1CC28] forKey:v43];
    ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(source, index, (CFDictionaryRef)v28);
    if (ImageAtIndex)
    {
      uint64_t v52 = ImageAtIndex;
      float v15 = [(CIImage *)self initWithCGImage:ImageAtIndex options:v28];
      CGImageRelease(v52);
      if (v37) {
        int v53 = v35;
      }
      else {
        int v53 = 0;
      }
      if (v53 != 1
        || (uint64_t v54 = [(CIImage *)v15 imageByApplyingGainMap:v37], (CIImage *)v54 == v15))
      {
LABEL_79:

        return v15;
      }
      id v55 = (void *)v54;
      if (dict) {
        id v56 = [(NSDictionary *)dict objectForKey:@"kCIImageGenerateFlexGTC"];
      }
      else {
        id v56 = 0;
      }
      if (v56 == (id)MEMORY[0x1E4F1CC38] || v56 == &unk_1EE4AAA18)
      {
        float32x4_t v58 = [(CIImage *)v15 _copyHDRColorspaceFromSource:source index:index];
        unsigned int v57 = v58;
        if (v58 && CGColorSpaceIsPQBased(v58))
        {
          PQBasedCopCGFloat y = CGColorSpaceRetain(v57);
LABEL_76:
          __int32 v62 = PQBasedCopy;
          id v63 = (void *)[v55 imageByTaggingWithColorSpace:PQBasedCopy];
          CGColorSpaceRelease(v62);
          CGColorSpaceRelease(v57);
          uint64_t v64 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v63, "properties"));
          [v64 setObject:&unk_1EE4AA9E8 forKey:@"Depth"];
          uint64_t v65 = CGColorSpaceCopyICCProfileDescription();
          if (v65)
          {
            size_t v66 = (const void *)v65;
            [v64 setObject:v65 forKey:@"ProfileName"];
            CFRelease(v66);
          }
          size_t v67 = (void *)[v63 imageBySettingProperties:v64];
          double v68 = v15;
          float v15 = v67;
          goto LABEL_79;
        }
      }
      else
      {
        unsigned int v57 = 0;
      }
      char v60 = [(CIImage *)v15 colorSpace];
      PQBasedCopCGFloat y = CI::ColorSpaceCreatePQBasedCopy(v60, v61);
      goto LABEL_76;
    }

    return 0;
  }

  return (CIImage *)[(CIImage *)self initGainmapWithImageSource:source options:dict];
}

+ (CIImage)imageWithCGLayer:(CGLayerRef)layer
{
  return (CIImage *)[a1 imageWithCGLayer:layer options:0];
}

+ (CIImage)imageWithCGLayer:(CGLayerRef)layer options:(NSDictionary *)options
{
  BOOL v4 = [[CIImage alloc] initWithCGLayer:layer options:options];

  return v4;
}

- (CIImage)initWithCGLayer:(CGLayerRef)layer
{
  return [(CIImage *)self initWithCGLayer:layer options:0];
}

- (CIImage)initWithCGLayer:(CGLayerRef)layer options:(NSDictionary *)options
{
  if (!layer) {
    goto LABEL_14;
  }
  CGSize Size = CGLayerGetSize(layer);
  CGContextRef Context = CGLayerGetContext(layer);
  BOOL v9 = Size.width < 0.5 || Size.height < 0.5;
  if (v9 || Context == 0) {
    goto LABEL_14;
  }
  size_t v11 = vcvtpd_u64_f64(Size.width);
  size_t v12 = vcvtpd_u64_f64(Size.height);
  int v13 = (CGColorSpace *)CGContextCopyDeviceColorSpace();
  if (!v13) {
    int v13 = +[CIContext defaultRGBColorSpace];
  }
  uint64_t v14 = CGBitmapContextCreate(0, v11, v12, 8uLL, 0, v13, 2u);
  CGColorSpaceRelease(v13);
  if (v14
    && (CGContextDrawLayerAtPoint(v14, *MEMORY[0x1E4F1DAD8], layer),
        CGContextFlush(v14),
        Image = CGBitmapContextCreateImage(v14),
        CGContextRelease(v14),
        Image))
  {
    CVReturn v16 = [(CIImage *)self initWithCGImage:Image options:options];
    CGImageRelease(Image);
    return v16;
  }
  else
  {
LABEL_14:

    return 0;
  }
}

+ (CIImage)imageWithBitmapData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 options:(id)a7
{
  int v7 = -[CIImage initWithBitmapData:bytesPerRow:size:format:options:]([CIImage alloc], "initWithBitmapData:bytesPerRow:size:format:options:", a3, a4, *(void *)&a6, a7, a5.width, a5.height);

  return v7;
}

+ (CIImage)imageWithBitmapData:(NSData *)data bytesPerRow:(size_t)bytesPerRow size:(CGSize)size format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  int v7 = -[CIImage initWithBitmapData:bytesPerRow:size:format:colorSpace:]([CIImage alloc], "initWithBitmapData:bytesPerRow:size:format:colorSpace:", data, bytesPerRow, *(void *)&format, colorSpace, size.width, size.height);

  return v7;
}

- (id)_initWithBitmapData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 options:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  double height = a5.height;
  double width = a5.width;
  v19.receiver = self;
  v19.super_class = (Class)CIImage;
  id result = [(CIImage *)&v19 init];
  if (result)
  {
    id v14 = result;
    if (a3
      && ((unint64_t)width ? (BOOL v15 = (unint64_t)height == 0) : (BOOL v15 = 1),
          !v15 && CI::format_bytes_per_row(v8, (unint64_t)width) <= a4))
    {
      uint64_t v16 = [a7 objectForKey:@"CIImageColorSpace"];
      if ([MEMORY[0x1E4F1CA98] null] == v16 || CI_NO_CM()) {
        uint64_t v16 = 0;
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __63__CIImage__initWithBitmapData_bytesPerRow_size_format_options___block_invoke;
      v17[3] = &unk_1E5771F90;
      int v18 = v8;
      v17[4] = a3;
      v17[5] = a4;
      return (id)[v14 initWithImageProvider:v17 width:(unint64_t)width height:(unint64_t)height format:v8 colorSpace:v16 options:a7];
    }
    else
    {

      return 0;
    }
  }
  return result;
}

char *__63__CIImage__initWithBitmapData_bytesPerRow_size_format_options___block_invoke(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v14 = CI::format_bytes_per_pixel(*(_DWORD *)(a1 + 48));
  id result = (char *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 32));
  if (a7)
  {
    uint64_t v16 = &result[*(void *)(a1 + 40) * a5 + v14 * a4];
    size_t v17 = v14 * a6;
    do
    {
      id result = (char *)memcpy(a2, v16, v17);
      v16 += *(void *)(a1 + 40);
      a2 += a3;
      --a7;
    }
    while (a7);
  }
  return result;
}

- (CIImage)initWithBitmapData:(NSData *)data bytesPerRow:(size_t)bytesPerRow size:(CGSize)size format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  uint64_t v7 = *(void *)&format;
  double height = size.height;
  double width = size.width;
  v15[1] = *MEMORY[0x1E4F143B8];
  int v14 = @"CIImageColorSpace";
  if (!colorSpace) {
    colorSpace = (CGColorSpaceRef)[MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = colorSpace;
  return -[CIImage initWithBitmapData:bytesPerRow:size:format:options:](self, "initWithBitmapData:bytesPerRow:size:format:options:", data, bytesPerRow, v7, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1], width, height);
}

- (CIImage)initWithBitmapData:(id)a3 bytesPerRow:(unint64_t)a4 size:(CGSize)a5 format:(int)a6 options:(id)a7
{
  uint64_t v10 = *(void *)&a6;
  double height = a5.height;
  double width = a5.width;
  id v14 = a3;
  LODWORD(v7) = vcvtpd_u64_f64(a5.width);
  LODWORD(v8) = vcvtpd_u64_f64(a5.height);
  uint64_t v16 = [a3 length];
  if (v7) {
    BOOL v17 = v8 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17) {
    goto LABEL_28;
  }
  size_t v18 = v16;
  if (![v14 bytes]) {
    goto LABEL_28;
  }
  uint64_t v20 = CI::format_modernize(v10, (CI *)"-[CIImage initWithBitmapData:bytesPerRow:size:format:options:]", v19);
  if ((CI::format_is_supported_source_bitmap(v20) & 1) == 0)
  {
    id v22 = CI::name_for_format(v20);
    id v23 = ci_logger_api();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      if (v24) {
        -[CIImage initWithBitmapData:bytesPerRow:size:format:options:]((uint64_t)v22, v23, v25, v26, v27, v28, v29, v30);
      }
    }
    else if (v24)
    {
      -[CIImage initWithBitmapData:bytesPerRow:size:format:options:]();
    }
    goto LABEL_28;
  }
  if (ceil(height) * (double)a4 > (double)v18)
  {
    id v21 = ci_logger_api();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CIImage initWithBitmapData:bytesPerRow:size:format:options:]();
    }
LABEL_28:

    return 0;
  }
  uint64_t v31 = (const void *)[v14 bytes];
  int v32 = CI_IOSURFACE_WRAPPING(1u);
  if ((a4 & 3) != 0) {
    goto LABEL_23;
  }
  if (!v32) {
    goto LABEL_23;
  }
  unsigned int v33 = atomic_load((unsigned int *)&dword_1EB466E78[17]);
  if (v33 >= 0x101) {
    goto LABEL_23;
  }
  if ((IOSurfaceWrapPointerOk(v31) & 1) == 0)
  {
    BOOL v34 = mmap(0, v18, 3, 4098, 1140850688, 0);
    if (v34 == (void *)-1) {
      goto LABEL_23;
    }
    int v35 = v34;
    memcpy(v34, v31, v18);
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v35 length:v18 deallocator:&__block_literal_global_38];
    id v36 = v14;
  }
  int v37 = CI::PixelFormatType_from_format(v20);
  uint64_t v38 = CI::PixelFormatType_approx_from_format(v20);
  uint64_t v39 = [v14 bytes];
  uint64_t v40 = CI::format_bytes_per_pixel(v20);
  if (v38)
  {
    WrappedSurface = CreateWrappedSurface(v7, v8, v38, a4, v40, v39);
    if (WrappedSurface)
    {
      int32x4_t v42 = WrappedSurface;
      objc_setAssociatedObject(WrappedSurface, SetSurfaceBackingObject, v14, (void *)1);
      if (v37 == v38)
      {
        id v43 = a7;
      }
      else
      {
        if (a7) {
          id v45 = (id)[a7 mutableCopy];
        }
        else {
          id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        id v43 = v45;
        objc_msgSend(v45, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v20), @"CIImageSurfaceFormat");
      }
      __int32 v46 = [(CIImage *)self _initWithIOSurface:v42 options:v43 owner:0];
      CFRelease(v42);

      return v46;
    }
  }
LABEL_23:

  return (CIImage *)-[CIImage _initWithBitmapData:bytesPerRow:size:format:options:](self, "_initWithBitmapData:bytesPerRow:size:format:options:", v14, a4, v20, a7, width, height);
}

uint64_t __62__CIImage_initWithBitmapData_bytesPerRow_size_format_options___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

+ (CIImage)imageWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped colorSpace:(CGColorSpaceRef)colorSpace
{
  uint64_t v6 = -[CIImage initWithTexture:size:flipped:colorSpace:]([CIImage alloc], "initWithTexture:size:flipped:colorSpace:", *(void *)&name, flipped, colorSpace, size.width, size.height);

  return v6;
}

+ (CIImage)imageWithTexture:(unsigned int)a3 size:(CGSize)a4 options:(id)a5
{
  uint64_t v5 = -[CIImage initWithTexture:size:options:]([CIImage alloc], "initWithTexture:size:options:", *(void *)&a3, a5, a4.width, a4.height);

  return v5;
}

+ (CIImage)imageWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped options:(NSDictionary *)options
{
  uint64_t v6 = -[CIImage initWithTexture:size:flipped:options:]([CIImage alloc], "initWithTexture:size:flipped:options:", *(void *)&name, flipped, options, size.width, size.height);

  return v6;
}

- (CIImage)initWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped colorSpace:(CGColorSpaceRef)colorSpace
{
  BOOL v6 = flipped;
  double height = size.height;
  double width = size.width;
  uint64_t v9 = *(void *)&name;
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIImageColorSpace";
  if (!colorSpace) {
    colorSpace = (CGColorSpaceRef)[MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = @"CIImageFlipped";
  v13[0] = colorSpace;
  v13[1] = [NSNumber numberWithBool:v6];
  return -[CIImage initWithTexture:size:options:](self, "initWithTexture:size:options:", v9, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2], width, height);
}

- (CIImage)initWithTexture:(unsigned int)name size:(CGSize)size flipped:(BOOL)flipped options:(NSDictionary *)options
{
  BOOL v6 = flipped;
  double height = size.height;
  double width = size.width;
  uint64_t v9 = *(void *)&name;
  size_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:options];
  objc_msgSend(v11, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v6), @"CIImageFlipped");

  return -[CIImage initWithTexture:size:options:](self, "initWithTexture:size:options:", v9, v11, width, height);
}

- (CIImage)initWithTexture:(unsigned int)a3 size:(CGSize)a4 options:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v9 = (void *)[a5 objectForKey:@"kCIImageTextureTarget"];
  uint64_t v10 = v9;
  if (!v9 || [v9 intValue] == 3553)
  {
    [a5 objectForKey:@"kCIImageTextureFormat"];
    if ([a5 objectForKey:@"CIImagePremultiplied"]) {
      objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"CIImagePremultiplied"), "BOOLValue");
    }
    objc_msgSend((id)objc_msgSend(a5, "objectForKey:", @"kCIImageAlphaOne"), "BOOLValue");
    if (a5) {
      [a5 objectForKey:@"CIImageEdgesAreClear"];
    }
    size_t v12 = (void *)MEMORY[0x1E4F1CC38];
    if (a5)
    {
      [a5 objectForKey:@"CIImageClampToEdge"];
      int v13 = (void *)[a5 objectForKey:@"CIImageEdgeRepeat"];
    }
    else
    {
      int v13 = 0;
    }
    if (v13 == v12 || v13 == &unk_1EE4AAA18)
    {
      id v14 = ci_logger_api();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CIImage initWithTexture:size:options:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    id v22 = (void *)[a5 objectForKey:@"CIImageProperties"];
    if (v22)
    {
      if ((void *)[MEMORY[0x1E4F1CA98] null] != v22) {
        dictionaryDeepCopy(v22, (uint64_t)&__block_literal_global_786);
      }
    }
    v24.origin.CGFloat x = 0.0;
    v24.origin.CGFloat y = 0.0;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    if (CGRectIsNull(v24))
    {
      if (!v10) {
LABEL_27:
      }
        operator new();
    }
    else
    {
      v25.origin.CGFloat x = 0.0;
      v25.origin.CGFloat y = 0.0;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      if (CGRectIsInfinite(v25))
      {
        if (!v10) {
          goto LABEL_27;
        }
      }
      else
      {
        v26.origin.CGFloat x = 0.0;
        v26.origin.CGFloat y = 0.0;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectInset(v26, 0.000001, 0.000001);
        CGRectIntegral(v27);
        if (!v10) {
          goto LABEL_27;
        }
      }
    }
    [v10 intValue];
    goto LABEL_27;
  }
  size_t v11 = ci_logger_api();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CIImage initWithTexture:size:options:]();
  }

  return 0;
}

- (void)_setOriginalMTLTexture:(id)a3 options:(id)a4
{
  v7[6] = *MEMORY[0x1E4F143B8];
  id v6 = (id)[a4 mutableCopy];
  v7[0] = @"kCIImageCacheHint";
  v7[1] = @"kCIImageCacheImmediately";
  v7[2] = @"kCIImageContentDigest";
  v7[3] = @"CIImageEdgesAreClear";
  v7[4] = @"kCIImageAVDepthData";
  v7[5] = @"CIImageProperties";
  objc_msgSend(v6, "removeObjectsForKeys:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 6));
  if (![v6 count]) {
    (*(void (**)(void *, id))(*(void *)self->_priv + 312))(self->_priv, a3);
  }
}

- (MTLTexture)metalTexture
{
  v2 = (MTLTexture *)(*(uint64_t (**)(void *, SEL))(*(void *)self->_priv + 304))(self->_priv, a2);
  if (!v2) {
    return 0;
  }
  long long v3 = v2;
  if (([(MTLTexture *)v2 conformsToProtocol:&unk_1EE4D2378] & 1) == 0) {
    return 0;
  }
  return v3;
}

+ (CIImage)imageWithMTLTexture:(id)texture options:(NSDictionary *)options
{
  BOOL v4 = [[CIImage alloc] initWithMTLTexture:texture options:options];

  return v4;
}

- (CIImage)initWithMTLTexture:(id)texture options:(NSDictionary *)options
{
  if ([texture textureType] != 2)
  {
    uint64_t v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CIImage initWithMTLTexture:options:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_7;
  }
  if (([texture usage] & 1) == 0)
  {
    uint64_t v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CIImage initWithMTLTexture:options:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_7:

    return 0;
  }
  CGRect v24 = (__IOSurface *)[texture iosurface];
  if (!v24
    || (CGRect v25 = v24, IOSurfaceGetPlaneCount(v24) < 2)
    || (CGRect v26 = (void *)[texture device], (CIMetalDeviceIsA9OrHigher(v26, v27) & 1) != 0))
  {
    uint64_t v28 = [texture pixelFormat];
    unsigned int v29 = [texture swizzle] >> 24;
    if (v29 == 1) {
      goto LABEL_29;
    }
    if (v29 != 5) {
      goto LABEL_28;
    }
    if (v28 <= 499)
    {
      if (((unint64_t)(v28 - 10) > 0x37 || ((1 << (v28 - 10)) & 0x84200000308403) == 0)
        && ((unint64_t)(v28 - 240) > 0x3D || ((1 << (v28 + 16)) & 0x3000000000000003) == 0)
        && v28 != 105)
      {
        goto LABEL_28;
      }
    }
    else if (((unint64_t)(v28 - 500) > 0x37 || ((1 << (v28 + 12)) & 0xC1FF00000007EDLL) == 0) {
           && (unint64_t)(v28 - 570) >= 3)
    }
    {
LABEL_28:
      [texture pixelFormat];
    }
LABEL_29:
    if ([(NSDictionary *)options objectForKey:@"CIImagePremultiplied"]) {
      objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"CIImagePremultiplied"), "BOOLValue");
    }
    objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", @"kCIImageAlphaOne"), "BOOLValue");
    CFDictionaryRef v41 = self;
    if (options) {
      [(NSDictionary *)options objectForKey:@"CIImageEdgesAreClear", self];
    }
    id v30 = (id)MEMORY[0x1E4F1CC38];
    if (options)
    {
      [(NSDictionary *)options objectForKey:@"CIImageClampToEdge"];
      id v31 = [(NSDictionary *)options objectForKey:@"CIImageEdgeRepeat", v41];
    }
    else
    {
      id v31 = 0;
    }
    if (v31 == v30 || v31 == &unk_1EE4AAA18)
    {
      int v32 = ci_logger_api();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[CIImage initWithMTLTexture:options:](v32, v33, v34, v35, v36, v37, v38, v39);
      }
    }
    id v40 = [(NSDictionary *)options objectForKey:@"CIImageProperties", v41];
    if (v40 && (id)[MEMORY[0x1E4F1CA98] null] != v40) {
      dictionaryDeepCopy(v40, (uint64_t)&__block_literal_global_786);
    }
    operator new();
  }
  if (![(NSDictionary *)options objectForKey:@"CIImageFlipped"])
  {
    options = (NSDictionary *)(id)[(NSDictionary *)options mutableCopy];
    [(NSDictionary *)options setObject:MEMORY[0x1E4F1CC28] forKey:@"CIImageFlipped"];
  }

  return (CIImage *)[(CIImage *)self _initWithIOSurface:v25 options:options owner:0];
}

- (CVPixelBufferRef)pixelBuffer
{
  v2 = (__CVBuffer *)(*(uint64_t (**)(void *, SEL))(*(void *)self->_priv + 304))(self->_priv, a2);
  if (!v2) {
    return 0;
  }
  long long v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 != CVPixelBufferGetTypeID()) {
    return 0;
  }
  return v3;
}

- (AVDepthData)depthData
{
  return (AVDepthData *)(*(uint64_t (**)(void))(*(void *)self->_priv + 208))();
}

- (AVPortraitEffectsMatte)portraitEffectsMatte
{
  return (AVPortraitEffectsMatte *)(*(uint64_t (**)(void))(*(void *)self->_priv + 216))();
}

- (AVSemanticSegmentationMatte)semanticSegmentationMatte
{
  return (AVSemanticSegmentationMatte *)(*(uint64_t (**)(void))(*(void *)self->_priv + 224))();
}

- (id)_initWithCVImageBuffer:(__CVBuffer *)a3 options:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  CFTypeID v6 = CFGetTypeID(a3);
  if (v6 == CVPixelBufferGetTypeID())
  {
    EncodedCGSize Size = CVImageBufferGetEncodedSize(a3);
    int v9 = CI::format_from_CVPixelBuffer(a3, v8);
    int v10 = CVImageBufferIsFlipped(a3) != 0;
    if ([a4 objectForKey:@"CIImageFlipped"]) {
      int v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CIImageFlipped"), "BOOLValue");
    }
    int v39 = v10;
    if (!CI::format_has_unpremul_alpha(v9) && (CI::format_has_alpha(v9) & 1) == 0) {
      CI::format_has_x(v9);
    }
    if ([a4 objectForKey:@"CIImagePremultiplied"]) {
      objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CIImagePremultiplied"), "BOOLValue");
    }
    objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kCIImageAlphaOne"), "BOOLValue");
    CI::format_is_ycc(v9);
    if (a4) {
      [a4 objectForKey:@"CIImageEdgesAreClear"];
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F1CC38];
    if (a4)
    {
      [a4 objectForKey:@"CIImageClampToEdge"];
      uint64_t v14 = (void *)[a4 objectForKey:@"CIImageEdgeRepeat"];
    }
    else
    {
      uint64_t v14 = 0;
    }
    if (v14 == v13 || v14 == &unk_1EE4AAA18)
    {
      uint64_t v15 = ci_logger_api();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CIImage _initWithCVImageBuffer:options:]();
      }
    }
    if (a4)
    {
      [a4 objectForKey:@"CIImageNearestSampling"];
      [a4 objectForKey:@"kCIImageCacheHint"];
    }
    if (!CI::format_is_ycc_or_ycca(v9)
      || ![a4 objectForKey:@"kCIImageYCCMatrix"]
      || !objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"kCIImageYCCMatrix"), "intValue"))
    {
      if (CI::format_is_ycc_or_ycca(v9))
      {
        if (!GetPixelBufferYCCMatrix(a3))
        {
          default_ycc_color_matriCGFloat x = CI::format_get_default_ycc_color_matrix(v9);
          uint64_t v16 = ci_logger_api();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)CGAffineTransform buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = default_ycc_color_matrix;
            _os_log_impl(&dword_193671000, v16, OS_LOG_TYPE_INFO, "CIImage will use Rec. %d YCC Matrix because the CVPixelBuffer was not tagged with a supported kCVImageBufferYCbCrMatrixKey.", buf, 8u);
          }
        }
      }
    }
    CGColorSpaceRef DeviceRGB = (CGColorSpaceRef)[a4 objectForKey:@"CIImageColorSpace"];
    if ((CGColorSpaceRef)[MEMORY[0x1E4F1CA98] null] == DeviceRGB || CI_NO_CM())
    {
      char v38 = 1;
    }
    else
    {
      if (!DeviceRGB)
      {
        CGColorSpaceRef DeviceRGB = CVImageBufferCopyColorSpace(a3);
        if (DeviceRGB || (CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB()) != 0) {
          CFAutorelease(DeviceRGB);
        }
      }
      char v38 = 0;
    }
    if ([a4 objectForKey:@"kCIImageToneMapHDRtoSDR"])
    {
      if (a4) {
        uint64_t v18 = (void *)[a4 objectForKey:@"kCIImageToneMapHDRtoSDR"];
      }
      else {
        uint64_t v18 = 0;
      }
      BOOL v20 = v18 == v13 || v18 == &unk_1EE4AAA18;
      BOOL v37 = v20;
    }
    else
    {
      BOOL v37 = 0;
    }
    uint64_t v21 = (void *)[a4 objectForKey:@"CIImageProperties"];
    uint64_t v22 = (void *)[a4 objectForKey:@"kCIImageApplyOrientationProperty"];
    if ([v22 isEqual:MEMORY[0x1E4F1CC38]])
    {
      id v23 = (void *)[v21 objectForKey:*MEMORY[0x1E4F2FCA0]];
      if (v23) {
        LODWORD(v23) = [v23 intValue];
      }
      if ((v23 - 9) >= 0xFFFFFFF8) {
        int v24 = (int)v23;
      }
      else {
        int v24 = 0;
      }
      if (!v21 || (void *)[MEMORY[0x1E4F1CA98] null] == v21) {
        goto LABEL_65;
      }
      CGRect v25 = &__block_literal_global_780;
    }
    else
    {
      if (!v21)
      {
        int v24 = 0;
        goto LABEL_65;
      }
      int v24 = 0;
      if ((void *)[MEMORY[0x1E4F1CA98] null] == v21)
      {
LABEL_65:
        double v26 = OptionHeadroom((NSDictionary *)a4);
        if (*(float *)&v26 == 0.0)
        {
          CFDataRef v27 = (const __CFData *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24B88], 0);
          CFDataRef v28 = v27;
          if (v27)
          {
            CFTypeID v29 = CFGetTypeID(v27);
            if (v29 == CFDataGetTypeID() && CFDataGetLength(v28) == 24) {
              CFDataGetBytePtr(v28);
            }
          }
          CFDataRef v30 = (const __CFData *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x1E4F24AD0], 0);
          CFDataRef v31 = v30;
          if (v30)
          {
            CFTypeID v32 = CFGetTypeID(v30);
            if (v32 == CFDataGetTypeID() && CFDataGetLength(v31) == 4) {
              CFDataGetBytePtr(v31);
            }
          }
          if (v28) {
            CFRelease(v28);
          }
          if (v31) {
            CFRelease(v31);
          }
        }
        CFTypeID v33 = CFGetTypeID(a3);
        unint64_t height = (unint64_t)EncodedSize.height;
        if (v33 == CVPixelBufferGetTypeID()) {
          operator new();
        }
        [a4 objectForKey:@"kCIImageAVDepthData"];
        [a4 objectForKey:@"kCIImageAVPortraitEffectsMatte"];
        [a4 objectForKey:@"kCIImageAVSemanticSegmentationMatte"];
        if ((v38 & 1) == 0) {
          CI::ColorMatchImage::append_and_unref(0, DeviceRGB, (CGColorSpace *)v37);
        }
        if (height == 1) {
          int v35 = 0;
        }
        else {
          int v35 = v39;
        }
        if (v35 == 1)
        {
          v43[1] = 0;
          v43[2] = 0;
          v43[0] = 0x3FF0000000000000;
          long long v44 = xmmword_193951E50;
          double v45 = (double)height;
          CI::AffineImage::append_and_unref(0, (CI::Image *)v43, 0);
        }
        if (v24 >= 2)
        {
          v50.size.CGFloat width = (double)(unint64_t)EncodedSize.width;
          v50.size.unint64_t height = (double)height;
          long long v47 = 0u;
          long long v48 = 0u;
          *(_OWORD *)CGAffineTransform buf = 0u;
          v50.origin.CGFloat x = 0.0;
          v50.origin.CGFloat y = 0.0;
          orientationTransform(v50, v24, buf);
          v42[0] = *(_OWORD *)buf;
          v42[1] = v47;
          void v42[2] = v48;
          CI::AffineImage::append_and_unref(0, (CI::Image *)v42, 0);
        }
        return [(CIImage *)self _initWithInternalRepresentation:0];
      }
      CGRect v25 = &__block_literal_global_786;
    }
    dictionaryDeepCopy(v21, (uint64_t)v25);
    goto LABEL_65;
  }
  uint64_t v11 = ci_logger_api();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CIImage _initWithCVImageBuffer:options:]();
  }

  return 0;
}

uint64_t __42__CIImage__initWithCVImageBuffer_options___block_invoke(uint64_t a1, uint64_t a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CI::format_is_packed(*(_DWORD *)(a1 + 40));
  uint64_t v16 = *(__CVBuffer **)(a1 + 32);
  unint64_t v17 = CI::format_bytes_for_width_of_plane(*(_DWORD *)(a1 + 40), a5, a3);
  unint64_t v18 = CI::format_bytes_for_width_of_plane(*(_DWORD *)(a1 + 40), a7, a3);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __42__CIImage__initWithCVImageBuffer_options___block_invoke_2;
  v20[3] = &__block_descriptor_80_e22_v48__0r_v8Q16Q24Q32Q40l;
  v20[4] = a6;
  v20[5] = v17;
  v20[6] = a8;
  v20[7] = a2;
  v20[8] = a4;
  v20[9] = v18;
  return PixelBufferApplyOnePlaneReadOnlyBlock(v16, a3, (uint64_t)v20);
}

void *__42__CIImage__initWithCVImageBuffer_options___block_invoke_2(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (result[6])
  {
    uint64_t v7 = result;
    unint64_t v8 = 0;
    int v9 = (char *)(a2 + result[4] * a6 + result[5]);
    do
    {
      id result = memcpy((void *)(v7[7] + v7[8] * v8++), v9, v7[9]);
      v9 += a6;
    }
    while (v8 < v7[6]);
  }
  return result;
}

+ (CIImage)imageWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer
{
  return +[CIImage imageWithCVPixelBuffer:pixelBuffer options:0];
}

- (CIImage)initWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer
{
  return [(CIImage *)self initWithCVPixelBuffer:pixelBuffer options:0];
}

uint64_t __41__CIImage_initWithCVPixelBuffer_options___block_invoke(uint64_t a1, char *__b, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a7)
  {
    uint64_t v13 = __b;
    uint64_t v14 = a7;
    do
    {
      memset_pattern8(v13, &unk_193950998, 8 * a6);
      v13 += a3;
      --v14;
    }
    while (v14);
  }
  uint64_t v15 = *(__CVBuffer **)(a1 + 32);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__CIImage_initWithCVPixelBuffer_options___block_invoke_2;
  v18[3] = &__block_descriptor_84_e22_v48__0r_v8Q16Q24Q32Q40l;
  v18[4] = a7;
  void v18[5] = __b;
  v18[6] = a3;
  v18[7] = a5;
  int v19 = *(_DWORD *)(a1 + 40);
  v18[8] = a6;
  v18[9] = a4;
  return PixelBufferApplyPlaneReadOnlyBlock(v15, (uint64_t)v18);
}

uint64_t __41__CIImage_initWithCVPixelBuffer_options___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(result + 32);
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)(result + 48);
    int v9 = *(_DWORD *)(result + 80);
    uint64_t v10 = *(void *)(result + 40) + 2 * a3;
    uint64_t v11 = a2 + *(void *)(result + 56) * a6;
    do
    {
      if (v9 == 1919365992)
      {
        uint64_t v13 = *(void *)(result + 64);
        if (v13)
        {
          uint64_t v14 = 0;
          uint64_t v15 = v11 + 2 * *(void *)(result + 72);
          uint64_t v16 = (_WORD *)v10;
          do
          {
            *uint64_t v16 = *(_WORD *)(v15 + 2 * v14);
            v16 += 4;
            ++v14;
          }
          while (v13 != v14);
        }
      }
      else if (v9 == 1919365990)
      {
        uint64_t v12 = *(void *)(result + 64);
        if (v12)
        {
          uint64_t v17 = 0;
          uint64_t v18 = v11 + 4 * *(void *)(result + 72);
          do
          {
            _S0 = *(_DWORD *)(v18 + v17);
            __asm { FCVT            H0, S0 }
            *(_WORD *)(v10 + 2 * v17) = _S0;
            v17 += 4;
            --v12;
          }
          while (v12);
        }
      }
      ++v7;
      v10 += v8;
      v11 += a6;
    }
    while (v7 != v6);
  }
  return result;
}

+ (CIImage)imageWithCVImageBuffer:(CVImageBufferRef)imageBuffer
{
  return +[CIImage imageWithCVImageBuffer:imageBuffer options:0];
}

+ (CIImage)imageWithCVImageBuffer:(CVImageBufferRef)imageBuffer options:(NSDictionary *)options
{
  CFTypeID v4 = [[CIImage alloc] initWithCVImageBuffer:imageBuffer options:options];

  return v4;
}

- (CIImage)initWithCVImageBuffer:(CVImageBufferRef)imageBuffer
{
  return [(CIImage *)self initWithCVImageBuffer:imageBuffer options:0];
}

- (CIImage)initWithCVImageBuffer:(CVImageBufferRef)imageBuffer options:(NSDictionary *)options
{
  if (!imageBuffer)
  {
    int v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CIImage initWithCVImageBuffer:options:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_14;
  }
  CFTypeID v7 = CFGetTypeID(imageBuffer);
  if (v7 == CVPixelBufferGetTypeID())
  {
    return [(CIImage *)self initWithCVPixelBuffer:imageBuffer options:options];
  }
  CFTypeID v17 = CFGetTypeID(imageBuffer);
  if (v17 != CVMetalTextureGetTypeID())
  {
    int v19 = ci_logger_api();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CIImage initWithCVImageBuffer:options:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
LABEL_14:

    return 0;
  }
  id Texture = CVMetalTextureGetTexture(imageBuffer);

  return [(CIImage *)self initWithMTLTexture:Texture options:options];
}

+ (CIImage)imageWithColor:(CIColor *)color
{
  long long v3 = [[CIImage alloc] initWithColor:color];

  return v3;
}

- (CIImage)initWithColorR:(double)a3 G:(double)a4 B:(double)a5 A:(double)a6
{
}

- (CIImage)initWithColor:(CIColor *)color
{
  if (objc_opt_isKindOfClass()) {
    operator new();
  }

  return 0;
}

+ (id)noiseImage
{
  {
    +[CIImage noiseImage]::noiseImage = (uint64_t)_noiseImage(0);
  }
  return (id)+[CIImage noiseImage]::noiseImage;
}

+ (id)noiseImageNearest
{
  {
    +[CIImage noiseImageNearest]::noiseImage = (uint64_t)_noiseImage(1);
  }
  return (id)+[CIImage noiseImageNearest]::noiseImage;
}

+ (id)noiseImagePadded
{
  if (+[CIImage noiseImagePadded]::onceToken != -1) {
    dispatch_once(&+[CIImage noiseImagePadded]::onceToken, &__block_literal_global_371);
  }
  return (id)+[CIImage noiseImagePadded]::noiseImage;
}

CIImage *__27__CIImage_noiseImagePadded__block_invoke()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:268320];
  uint64_t v1 = [v0 mutableBytes];
  srandom(0x2Au);
  uint64_t v2 = 0;
  uint64_t v3 = v1 + 1044;
  do
  {
    uint64_t v4 = 0;
    ++v2;
    do
      *(unsigned char *)(v3 + v4++) = random();
    while (v4 != 1024);
    v3 += 1040;
  }
  while (v2 != 256);
  for (uint64_t i = 0; i != 266240; i += 1040)
  {
    uint64_t v6 = v1 + i;
    *(_DWORD *)(v6 + 1040) = *(_DWORD *)(v1 + i + 2064);
    *(_DWORD *)(v6 + 2068) = *(_DWORD *)(v1 + i + 1044);
  }
  memcpy((void *)v1, (const void *)(v1 + 266240), 0x410uLL);
  memcpy((void *)(v1 + 267280), (const void *)(v1 + 1040), 0x410uLL);
  uint64_t v8 = @"CIImageColorSpace";
  v9[0] = [MEMORY[0x1E4F1CA98] null];
  id result = -[CIImage initWithBitmapData:bytesPerRow:size:format:options:]([CIImage alloc], "initWithBitmapData:bytesPerRow:size:format:options:", v0, 1040, 265, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1], 258.0, 258.0);
  +[CIImage noiseImagePadded]::noiseImage = (uint64_t)result;
  return result;
}

- (CGAffineTransform)imageTransformForOrientation:(SEL)a3
{
  [(CIImage *)self extent];

  return (CGAffineTransform *)orientationTransform(*(CGRect *)&v6, orientation, retstr);
}

- (CIImage)imageByApplyingOrientation:(int)orientation
{
  if (self) {
    [(CIImage *)self imageTransformForOrientation:*(void *)&orientation];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  return [(CIImage *)self imageByApplyingTransform:v5];
}

- (CGAffineTransform)imageTransformForCGOrientation:(SEL)a3
{
  [(CIImage *)self extent];

  return (CGAffineTransform *)orientationTransform(*(CGRect *)&v6, orientation, retstr);
}

- (CIImage)imageByApplyingCGOrientation:(CGImagePropertyOrientation)orientation
{
  if (self) {
    [(CIImage *)self imageTransformForCGOrientation:*(void *)&orientation];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  return [(CIImage *)self imageByApplyingTransform:v5];
}

+ (CIImage)imageWithData:(NSData *)data
{
  uint64_t v3 = [[CIImage alloc] initWithData:data options:0];

  return v3;
}

+ (CIImage)imageWithData:(NSData *)data options:(NSDictionary *)options
{
  uint64_t v4 = [[CIImage alloc] initWithData:data options:options];

  return v4;
}

- (CIImage)initWithData:(NSData *)data
{
  return [(CIImage *)self initWithData:data options:0];
}

- (CIImage)initWithData:(NSData *)data options:(NSDictionary *)options
{
  CFTypeID v7 = (void *)MEMORY[0x199702DB0](self, a2);
  if (!data) {
    goto LABEL_9;
  }
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = *MEMORY[0x1E4F2FF78];
  if ([(NSDictionary *)options valueForKey:*MEMORY[0x1E4F2FF78]]) {
    objc_msgSend(v8, "setObject:forKey:", -[NSDictionary valueForKey:](options, "valueForKey:", v9), v9);
  }
  uint64_t v10 = *MEMORY[0x1E4F2FF58];
  if ([(NSDictionary *)options objectForKey:*MEMORY[0x1E4F2FF58]]) {
    objc_msgSend(v8, "setObject:forKey:", -[NSDictionary objectForKey:](options, "objectForKey:", v10), v10);
  }
  CGImageSourceRef v11 = CGImageSourceCreateWithData((CFDataRef)data, (CFDictionaryRef)v8);
  if (v11)
  {
    CGImageSourceRef v12 = v11;
    if (options) {
      id v13 = [(NSDictionary *)options objectForKey:@"kCIImageExpandToHDR"];
    }
    else {
      id v13 = 0;
    }
    if ((v13 == (id)MEMORY[0x1E4F1CC38] || v13 == &unk_1EE4AAA18)
      && [(__CFString *)(id)CGImageSourceGetType(v12) hasSuffix:@"raw-image"]
      && (uint64_t v15 = +[CIRAWFilter filterWithImageData:data identifierHint:CGImageSourceGetType(v12)], (v18 = hdrRawImage(v15, v16, v17)) != 0))
    {
      int v19 = v18;
      CFRelease(v12);

      uint64_t v14 = v19;
    }
    else
    {
      uint64_t v14 = [(CIImage *)self initWithCGImageSource:v12 index:0 options:options];
      CFRelease(v12);
    }
  }
  else
  {
LABEL_9:

    uint64_t v14 = 0;
  }
  return v14;
}

+ (CIImage)imageWithContentsOfURL:(NSURL *)url
{
  return (CIImage *)[a1 imageWithContentsOfURL:url options:0];
}

+ (CIImage)imageWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options
{
  uint64_t v4 = [[CIImage alloc] initWithContentsOfURL:url options:options];

  return v4;
}

- (CIImage)initWithContentsOfURL:(NSURL *)url
{
  return [(CIImage *)self initWithContentsOfURL:url options:0];
}

- (CIImage)initWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options
{
  CFTypeID v7 = (void *)MEMORY[0x199702DB0](self, a2);
  CGImageSourceRef v8 = CGImageSourceCreateWithURL((CFURLRef)url, 0);
  if (v8)
  {
    CGImageSourceRef v9 = v8;
    if (options) {
      id v10 = [(NSDictionary *)options objectForKey:@"kCIImageExpandToHDR"];
    }
    else {
      id v10 = 0;
    }
    BOOL v12 = v10 == (id)MEMORY[0x1E4F1CC38] || v10 == &unk_1EE4AAA18;
    if (v12
      && [(__CFString *)(id)CGImageSourceGetType(v9) hasSuffix:@"raw-image"]
      && (id v13 = +[CIRAWFilter filterWithImageURL:url],
          (id v16 = hdrRawImage(v13, v14, v15)) != 0))
    {
      double v17 = v16;
      CFRelease(v9);

      CGImageSourceRef v11 = v17;
    }
    else
    {
      CGImageSourceRef v11 = [(CIImage *)self initWithCGImageSource:v9 index:0 options:options];
      CFRelease(v9);
      if (v11) {
        (*(void (**)(void *, NSURL *))(*(void *)v11->_priv + 280))(v11->_priv, url);
      }
    }
  }
  else
  {

    CGImageSourceRef v11 = 0;
  }
  return v11;
}

+ (CIImage)imageWithContentsOfFile:(id)a3
{
  return +[CIImage imageWithContentsOfFile:a3 options:0];
}

+ (CIImage)imageWithContentsOfFile:(id)a3 options:(id)a4
{
  uint64_t v4 = [[CIImage alloc] initWithContentsOfFile:a3 options:a4];

  return v4;
}

- (CIImage)initWithContentsOfFile:(id)a3
{
  return [(CIImage *)self initWithContentsOfFile:a3 options:0];
}

- (CIImage)initWithContentsOfFile:(id)a3 options:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];

  return [(CIImage *)self initWithContentsOfURL:v6 options:a4];
}

- (CIImage)imageByApplyingTransform:(CGAffineTransform *)matrix highQualityDownsample:(BOOL)highQualityDownsample
{
  long long v4 = *(_OWORD *)&matrix->c;
  v7[0] = *(_OWORD *)&matrix->a;
  v7[1] = v4;
  v7[2] = *(_OWORD *)&matrix->tx;
  if (highQualityDownsample) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 255;
  }
  return (CIImage *)[(CIImage *)self _imageByApplyingTransform:v7 highQualityDownsample:v5];
}

- (CIImage)imageByClampingToExtent
{
  [(CIImage *)self extent];

  return -[CIImage imageByClampingToRect:](self, "imageByClampingToRect:");
}

- (CIImage)imageByCompositingOverImage:(CIImage *)dest
{
  [(CIImage *)self extent];
  IsEmptCGFloat y = CGRectIsEmpty(v10);
  [(CIImage *)dest extent];
  BOOL v6 = CGRectIsEmpty(v11);
  if (IsEmpty && v6)
  {
    return +[CIImage emptyImage];
  }
  else
  {
    if (v6)
    {
      CGImageSourceRef v8 = self;
    }
    else
    {
      if (!IsEmpty) {
        return (CIImage *)[(CIImage *)self filteredImage:@"CISourceOverCompositing", @"inputBackgroundImage", dest, 0 keysAndValues];
      }
      CGImageSourceRef v8 = dest;
    }
    return v8;
  }
}

- (CIImage)imageByPremultiplyingAlpha
{
  [(CIImage *)self extent];
  if (CGRectIsEmpty(v7))
  {
    return +[CIImage emptyImage];
  }
  long long v4 = [(CIImage *)self _internalRepresentation];
  if ((*(unsigned int (**)(_DWORD *))(*(void *)v4 + 16))(v4) != 16)
  {
    if ((*(unsigned int (**)(_DWORD *))(*(void *)v4 + 128))(v4))
    {
      uint64_t v5 = (uint64_t)v4;
      goto LABEL_10;
    }
LABEL_13:
    operator new();
  }
  if (v4[30] != -1) {
    goto LABEL_13;
  }
  uint64_t v5 = (*(uint64_t (**)(_DWORD *, void))(*(void *)v4 + 48))(v4, 0);
LABEL_10:

  return +[CIImage imageWithInternalRepresentation:v5];
}

- (CIImage)imageByUnpremultiplyingAlpha
{
  [(CIImage *)self extent];
  if (CGRectIsEmpty(v7))
  {
    return +[CIImage emptyImage];
  }
  long long v4 = [(CIImage *)self _internalRepresentation];
  if ((*(unsigned int (**)(_DWORD *))(*(void *)v4 + 16))(v4) != 16)
  {
    if ((*(unsigned int (**)(_DWORD *))(*(void *)v4 + 128))(v4))
    {
      uint64_t v5 = (uint64_t)v4;
      goto LABEL_10;
    }
LABEL_13:
    operator new();
  }
  if (v4[30] != 1) {
    goto LABEL_13;
  }
  uint64_t v5 = (*(uint64_t (**)(_DWORD *, void))(*(void *)v4 + 48))(v4, 0);
LABEL_10:

  return +[CIImage imageWithInternalRepresentation:v5];
}

- (id)_imageByApplyingGamma:(double)a3
{
  [(CIImage *)self extent];
  if (CGRectIsEmpty(v8))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    if (fabs(a3 + -1.0) >= 0.01)
    {
      [(CIImage *)self _internalRepresentation];
      operator new();
    }
    BOOL v6 = self;
    return v6;
  }
}

- (CIImage)imageByApplyingGaussianBlurWithSigma:(double)sigma
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (sigma >= 0.16)
  {
    BOOL v6 = @"inputRadius";
    v7[0] = objc_msgSend(NSNumber, "numberWithDouble:");
    return -[CIImage imageByApplyingFilter:withInputParameters:](self, "imageByApplyingFilter:withInputParameters:", @"CIGaussianBlur", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1]);
  }
  else
  {
    long long v4 = self;
    return v4;
  }
}

- (CIImage)imageByColorMatchingWorkingSpaceToColorSpace:(CGColorSpaceRef)colorSpace
{
  uint64_t v3 = self;
  if (colorSpace)
  {
    [(CIImage *)self extent];
    if (CGRectIsEmpty(v23))
    {
      return +[CIImage emptyImage];
    }
    else if (CI::ColorSpace_is_RGB_or_Gray_and_supports_output((BOOL)colorSpace, v5))
    {
      CGRect v8 = [(CIImage *)v3 baseColorSpace];
      if (!CI_NO_CM()
        && CI::ColorSpace_is_HDR(v8, v9)
        && (CI::ColorSpace_is_HDR(colorSpace, v10) & 1) == 0
        && !CGColorSpaceUsesExtendedRange(colorSpace))
      {
        uint64_t v3 = [[(CIImage *)v3 imageByColorMatchingWorkingSpaceToColorSpace:v8] imageByToneMappingColorSpaceToWorkingSpace:v8];
      }
      uint64_t v11 = [(CIImage *)v3 _internalRepresentation];
      if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 16))(v11) != 4
        || !*(unsigned char *)(v11 + 137)
        || (BOOL v12 = *(CGColorSpace **)(v11 + 120), v12 != colorSpace) && (!v12 || !CFEqual(colorSpace, v12))
        || *(unsigned char *)(v11 + 138))
      {
        operator new();
      }
      uint64_t v21 = (*(uint64_t (**)(uint64_t, void))(*(void *)v11 + 48))(v11, 0);
      return +[CIImage imageWithInternalRepresentation:v21];
    }
    else
    {
      id v13 = ci_logger_api();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
      return 0;
    }
  }
  else
  {
    CGRect v7 = self;
    return v7;
  }
}

- (CIImage)imageByColorMatchingColorSpaceToWorkingSpace:(CGColorSpaceRef)colorSpace
{
  if (colorSpace)
  {
    if (CI::ColorSpace_is_RGB_or_Gray(colorSpace, (CGColorSpace *)a2))
    {
      uint64_t v5 = [(CIImage *)self _internalRepresentation];
      if ((*(unsigned int (**)(void *))(*(void *)v5 + 16))(v5) != 4
        || (char v6 = CGColorSpaceContainsFlexGTCInfo(), !*((unsigned char *)v5 + 136))
        || (v7 = v6, CGRect v8 = (CGColorSpace *)*((void *)v5 + 16), v8 != colorSpace) && (!v8 || !CFEqual(colorSpace, v8))
        || (*((unsigned char *)v5 + 138) ? (char v9 = 1) : (char v9 = v7), (v9 & 1) != 0))
      {
        operator new();
      }
      uint64_t v20 = (*(uint64_t (**)(void *, void))(*(void *)v5 + 48))(v5, 0);
      return +[CIImage imageWithInternalRepresentation:v20];
    }
    else
    {
      BOOL v12 = ci_logger_api();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
      return 0;
    }
  }
  else
  {
    CGRect v10 = self;
    return v10;
  }
}

- (id)_imageByToneMappingColorSpaceToWorkingSpace:(CGColorSpace *)a3 targetHeadroom:(float)a4
{
  if (a3)
  {
    if (CI::ColorSpace_is_RGB(a3, (CGColorSpace *)a2)
      && (CI::ColorSpace_is_HDR(a3, v7) & 1) != 0)
    {
      if (a4 >= 1.0 && a4 <= 16.0)
      {
        [(CIImage *)self _internalRepresentation];
        operator new();
      }
      char v9 = ci_logger_api();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CIImage _imageByToneMappingColorSpaceToWorkingSpace:targetHeadroom:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else
    {
      uint64_t v17 = ci_logger_api();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CIImage _imageByToneMappingColorSpaceToWorkingSpace:targetHeadroom:](v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    return 0;
  }
  else
  {
    uint64_t v26 = self;
    return v26;
  }
}

- (id)imageByToneMappingColorSpaceToWorkingSpace:(CGColorSpace *)a3
{
  if (a3)
  {
    if (CI::ColorSpace_is_RGB(a3, (CGColorSpace *)a2)
      && (CI::ColorSpace_is_HDR(a3, v5) & 1) != 0)
    {
      [(CIImage *)self _internalRepresentation];
      operator new();
    }
    char v6 = ci_logger_api();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CIImage imageByToneMappingColorSpaceToWorkingSpace:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    return 0;
  }
  else
  {
    uint64_t v15 = self;
    return v15;
  }
}

- (id)imageByTaggingWithColorSpace:(CGColorSpace *)a3
{
  if (!a3 || (CI::ColorSpace_is_RGB(a3, (CGColorSpace *)a2) & 1) != 0)
  {
    [(CIImage *)self _internalRepresentation];
    operator new();
  }
  long long v4 = ci_logger_api();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CIImage imageByTaggingWithColorSpace:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return 0;
}

- (id)_imageByApplyingColorMatrixRed:(CIImage *)self green:(SEL)a2 blue:bias:
{
  long long v11 = v4;
  long long v12 = v5;
  long long v9 = v2;
  long long v10 = v3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(CIImage *)self extent];
  if (CGRectIsEmpty(v26))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    v13[0] = vcvtq_f64_f32(*(float32x2_t *)&v9);
    *(double *)&v13[1] = *((float *)&v9 + 2);
    *((void *)&v13[1] + 1) = 0;
    v13[2] = vcvtq_f64_f32(*(float32x2_t *)&v10);
    double v14 = *((float *)&v10 + 2);
    uint64_t v15 = 0;
    float64x2_t v16 = vcvtq_f64_f32(*(float32x2_t *)&v11);
    double v17 = *((float *)&v11 + 2);
    uint64_t v18 = 0;
    long long v19 = xmmword_193953CF0;
    long long v20 = unk_193953D00;
    float64x2_t v21 = vcvtq_f64_f32(*(float32x2_t *)&v12);
    double v22 = *((float *)&v12 + 2);
    uint64_t v23 = 0;
    if (!CI::ColorMatrixImage::is_identity((CI::ColorMatrixImage *)v13, v7))
    {
      [(CIImage *)self _internalRepresentation];
      operator new();
    }
    return self;
  }
}

- (CIImage)imageByInsertingIntermediate
{
  v2.var0 = 0;
  return implRenderToIntermediate(self, v2);
}

- (CIImage)imageByInsertingIntermediate:(BOOL)cache
{
  if (cache) {
    v3.var0 = 1;
  }
  else {
    v3.var0 = -1;
  }
  return implRenderToIntermediate(self, v3);
}

- (id)_imageByRenderingToIntermediate
{
  v2.var0 = 0;
  return implRenderToIntermediate(self, v2);
}

- (CIImage)imageBySettingProperties:(NSDictionary *)properties
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v5 = [(NSDictionary *)properties allValues];
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = (void *)MEMORY[0x199702DB0]();
    uint64_t v8 = [(NSArray *)v5 count];
    if (v8)
    {
      uint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        id v11 = [(NSArray *)v5 objectAtIndexedSubscript:i];
        CFTypeID v12 = CFGetTypeID(v11);
        if (v12 != CGImageMetadataGetTypeID() && v12 != CGColorSpaceGetTypeID() && v12 != CGColorGetTypeID()) {
          id v11 = (id)[v11 copy];
        }
        [v6 setObject:v11 atIndexedSubscript:i];
      }
    }
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:", v6, -[NSDictionary allKeys](properties, "allKeys"));
    [(CIImage *)self _internalRepresentation];
    operator new();
  }
  uint64_t v13 = ci_logger_api();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[CIImage imageBySettingProperties:](v13, v14, v15, v16, v17, v18, v19, v20);
  }
  return self;
}

- (id)imageBySettingPropertiesNoCopy:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a3 copyItems:0];
    [(CIImage *)self _internalRepresentation];
    operator new();
  }
  uint64_t v6 = ci_logger_api();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CIImage imageBySettingPropertiesNoCopy:](v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return self;
}

- (CIImage)imageBySamplingNearest
{
  [(CIImage *)self extent];
  if (!CGRectIsEmpty(v5))
  {
    [(CIImage *)self _internalRepresentation];
    operator new();
  }

  return +[CIImage emptyImage];
}

- (CIImage)imageBySamplingLinear
{
  [(CIImage *)self extent];
  if (!CGRectIsEmpty(v5))
  {
    [(CIImage *)self _internalRepresentation];
    operator new();
  }

  return +[CIImage emptyImage];
}

+ (id)imageForRenderingWithMetal:(id)a3 orNonMetal:(id)a4
{
  id v4 = [[CIImage alloc] initForRenderingWithMetal:a3 orNonMetal:a4];

  return v4;
}

- (id)initForRenderingWithMetal:(id)a3 orNonMetal:(id)a4
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = a4;
  v5[1] = a3;
  return -[CIImage initWithArrayOfImages:selector:](self, "initWithArrayOfImages:selector:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2], &__block_literal_global_387);
}

uint64_t __48__CIImage_initForRenderingWithMetal_orNonMetal___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"kContextInfoIsMetal"), "BOOLValue");
}

+ (id)imageForRenderingWithMPS:(id)a3 orNonMPS:(id)a4
{
  id v4 = [[CIImage alloc] initForRenderingWithMPS:a3 orNonMPS:a4];

  return v4;
}

- (id)initForRenderingWithMPS:(id)a3 orNonMPS:(id)a4
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = a4;
  v5[1] = a3;
  return -[CIImage initWithArrayOfImages:selector:](self, "initWithArrayOfImages:selector:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2], &__block_literal_global_392);
}

uint64_t __44__CIImage_initForRenderingWithMPS_orNonMPS___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"kContextInfoSupportsMPS"), "BOOLValue");
}

+ (id)imageForRenderingWithMetalContext:(id)a3 orOpenGLContextUsingMetal:(id)a4 orNonMetalContext:(id)a5
{
  id v5 = [[CIImage alloc] initForRenderingWithMetalContext:a3 orOpenGLContextUsingMetal:a4 orNonMetalContext:a5];

  return v5;
}

- (id)initForRenderingWithMetalContext:(id)a3 orOpenGLContextUsingMetal:(id)a4 orNonMetalContext:(id)a5
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v6[0] = a5;
  v6[1] = a4;
  v6[2] = a3;
  return -[CIImage initWithArrayOfImages:selector:](self, "initWithArrayOfImages:selector:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3], &__block_literal_global_397);
}

uint64_t __88__CIImage_initForRenderingWithMetalContext_orOpenGLContextUsingMetal_orNonMetalContext___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"kContextInfoIsMetal"), "BOOLValue")) {
    return 0;
  }
  id v3 = CIMetalCopyDefaultDevice();
  if (!v3) {
    return 2;
  }
  id v5 = v3;
  if (CIMetalDeviceIsSupported(v3, v4)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  CFRelease(v5);
  return v2;
}

+ (CIImage)imageWithArrayOfImages:(id)a3 selector:(id)a4
{
  id v4 = [[CIImage alloc] initWithArrayOfImages:a3 selector:a4];

  return v4;
}

- (CIImage)initWithArrayOfImages:(id)a3 selector:(id)a4
{
  if ([a3 count])
  {
    [a3 count];
    operator new();
  }

  return 0;
}

- (CIFilterShape)definition
{
  [(CIImage *)self extent];

  return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:");
}

void __18__CIImage_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(CI::Object **)(a1 + 32);
  if (v1) {
    CI::Object::unref(v1);
  }
}

- (id)description
{
  [(CIImage *)self extent];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  if (CGRectIsInfinite(v12)) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CIImage: %p extent [infinite]>", self, v8, v9, v10, v11);
  }
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  if (CGRectIsEmpty(v13)) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CIImage: %p extent [empty]>", self, v8, v9, v10, v11);
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CIImage: %p extent [%g %g %g %g]>", self, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height);
  }
}

- (id)debugDescription
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__CIImage_debugDescription__block_invoke;
  v3[3] = &unk_1E5771158;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __27__CIImage_debugDescription__block_invoke(uint64_t a1, __sFILE *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (CI::Image *)v3[1];
  [v3 extent];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  if (CGRectIsInfinite(v11))
  {
    fprintf(a2, "<CIImage: %p extent [infinite]>\n");
  }
  else
  {
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.CGFloat width = width;
    v12.size.CGFloat height = height;
    if (CGRectIsEmpty(v12)) {
      fprintf(a2, "<CIImage: %p extent [empty]>\n");
    }
    else {
      fprintf(a2, "<CIImage: %p extent [%g %g %g %g]>\n");
    }
  }

  return CI::Image::print_graph(v4, a2);
}

- (NSDictionary)properties
{
  return (NSDictionary *)(*(uint64_t (**)(void))(*(void *)self->_priv + 200))();
}

- (float)headroom
{
  (*(void (**)(void))(*(void *)self->_priv + 232))();
  return result;
}

- (float)_makernoteMeteorHeadroom
{
  uint64_t v2 = [(CIImage *)self properties];
  uint64_t v3 = [(NSDictionary *)v2 valueForKeyPath:@"{MakerApple}.33"];
  if (!v3) {
    return NAN;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [(NSDictionary *)v2 valueForKeyPath:@"{MakerApple}.48"];
  if (!v5) {
    return NAN;
  }
  uint64_t v6 = (void *)v5;
  [v4 floatValue];
  float v8 = v7;
  [v6 floatValue];
  if (v8 >= 1.0)
  {
    if (v9 <= 0.01)
    {
      float v13 = (float)(v9 * -70.0) + 3.0;
      goto LABEL_12;
    }
    float v10 = 2.303;
    float v11 = -0.303;
  }
  else if (v9 <= 0.01)
  {
    float v10 = 1.8;
    float v11 = -20.0;
  }
  else
  {
    float v10 = 1.601;
    float v11 = -0.101;
  }
  float v13 = v10 + (float)(v9 * v11);
LABEL_12:

  return exp2f(v13);
}

- (int)outputFormat
{
  return (*(uint64_t (**)(void))(*(void *)self->_priv + 144))();
}

- (NSURL)url
{
  id v2 = (id)(*(uint64_t (**)(void *, SEL))(*(void *)self->_priv + 272))(self->_priv, a2);

  return (NSURL *)v2;
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  id v2 = (id)(*(uint64_t (**)(void *, SEL))(*(void *)self->_priv + 288))(self->_priv, a2);

  return v2;
}

- (BOOL)cacheHint
{
  return 0;
}

- (unint64_t)digest
{
  priv = self->_priv;
  if (priv) {
    return priv[10];
  }
  else {
    return 0;
  }
}

- (unint64_t)recipeDigest
{
  priv = self->_priv;
  if (priv) {
    return priv[11];
  }
  else {
    return 0;
  }
}

- (id)filteredImage:(id)a3 keysAndValues:(id)a4
{
  float v7 = (void *)MEMORY[0x199702DB0](self, a2);
  float v8 = +[CIFilter filterWithName:a3];
  if (v8)
  {
    float v9 = v8;
    [(CIFilter *)v8 setValue:self forKey:@"inputImage"];
    float v13 = &v14;
    if (a4)
    {
      do
      {
        [(CIFilter *)v9 setValue:*v13 forKey:a4];
        float v10 = (id *)(v13 + 1);
        v13 += 2;
        a4 = *v10;
      }
      while (*v10);
    }
    float v11 = [(CIFilter *)v9 outputImage];
    return v11;
  }
  else
  {
    return 0;
  }
}

- (CIImage)imageByApplyingFilter:(NSString *)filterName
{
  return [(CIImage *)self imageByApplyingFilter:filterName withInputParameters:0];
}

- (void)writeToTIFF:(id)a3
{
  id v5 = +[CIContext _singletonContext];
  [(CIImage *)self extent];
  CGRectIsInfinite(v10);
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3];
  uint64_t v7 = [v5 workingColorSpace];
  uint64_t v8 = MEMORY[0x1E4F1CC08];

  [v5 writeTIFFRepresentationOfImage:self toURL:v6 format:2056 colorSpace:v7 options:v8 error:0];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    id v5 = @"CIRequiresKeyedArchiver";
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = @"CoreImage doesn't support old-style archiving";
    goto LABEL_5;
  }
  [(CIImage *)self extent];
  if (CGRectIsInfinite(v23))
  {
    id v5 = @"CIImageEncoder";
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = @"CoreImage doesn't support archiving infinite images.";
LABEL_5:
    [v6 raise:v5 format:v7];
    return;
  }
  id v8 = +[CIContext _singletonContext];
  [(CIImage *)self extent];
  float v9 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", self);
  if (v9)
  {
    CGRect v10 = v9;
    size_t Width = CGImageGetWidth(v9);
    size_t Height = CGImageGetHeight(v10);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(v10);
    size_t BitsPerPixel = CGImageGetBitsPerPixel(v10);
    size_t BytesPerRow = CGImageGetBytesPerRow(v10);
    uint64_t BitmapInfo = CGImageGetBitmapInfo(v10);
    BOOL ShouldInterpolate = CGImageGetShouldInterpolate(v10);
    CGColorRenderingIntent RenderingIntent = CGImageGetRenderingIntent(v10);
    DataProvider = CGImageGetDataProvider(v10);
    if (DataProvider)
    {
      CFDataRef v19 = CGDataProviderCopyData(DataProvider);
      if (v19)
      {
        CFDataRef v20 = v19;
        [a3 encodeObject:v19 forKey:@"CICGImageData"];
        [a3 encodeInt:Width forKey:@"CICGImageWidth"];
        [a3 encodeInt:Height forKey:@"CICGImageHeight"];
        [a3 encodeInt:BitsPerComponent forKey:@"CICGImageBPC"];
        [a3 encodeInt:BitsPerPixel forKey:@"CICGImageBPP"];
        [a3 encodeInt:BytesPerRow forKey:@"CICGImageBPR"];
        [a3 encodeInt:BitmapInfo forKey:@"CICGImageAlphaInfo"];
        [a3 encodeBool:ShouldInterpolate forKey:@"CICGImageInterp"];
        [a3 encodeInt:RenderingIntent forKey:@"CICGImageRI"];
        CFRelease(v20);
      }
    }
    CGImageRelease(v10);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIImage)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    goto LABEL_26;
  }
  v19.receiver = self;
  v19.super_class = (Class)CIImage;
  self = [(CIImage *)&v19 init];
  if (!self) {
    return self;
  }
  if (![a3 containsValueForKey:@"CICGImageData"]) {
    goto LABEL_26;
  }
  CFDataRef v5 = (const __CFData *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"CICGImageData"];
  int v6 = [a3 decodeIntForKey:@"CICGImageWidth"];
  int v7 = [a3 decodeIntForKey:@"CICGImageHeight"];
  uint64_t v8 = [a3 containsValueForKey:@"CICGImageBPC"]
     ? (int)[a3 decodeIntForKey:@"CICGImageBPC"]
     : 8;
  size_t v18 = v8;
  int v9 = [a3 containsValueForKey:@"CICGImageBPP"]
     ? [a3 decodeIntForKey:@"CICGImageBPP"]
     : 32;
  int v17 = [a3 containsValueForKey:@"CICGImageBPR"]
      ? [a3 decodeIntForKey:@"CICGImageBPR"]
      : (v9 >> 3) * v6;
  CGBitmapInfo v10 = [a3 containsValueForKey:@"CICGImageAlphaInfo"]
      ? [a3 decodeIntForKey:@"CICGImageAlphaInfo"]
      : 2;
  char shouldInterpolate = [a3 containsValueForKey:@"CICGImageInterp"]
                    ? [a3 decodeBoolForKey:@"CICGImageInterp"]
                    : 1;
  CGColorRenderingIntent intent = [a3 containsValueForKey:@"CICGImageRI"]
         ? [a3 decodeIntForKey:@"CICGImageRI"]
         : kCGRenderingIntentDefault;
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v14 = CGDataProviderCreateWithCFData(v5);
  uint64_t v15 = CGImageCreate(v6, v7, v18, v9, v17, DeviceRGB, v10, v14, 0, shouldInterpolate, intent);
  CGDataProviderRelease(v14);
  CGColorSpaceRelease(DeviceRGB);
  if (!v15)
  {
LABEL_26:

    return 0;
  }
  self = [(CIImage *)self initWithCGImage:v15];
  CGImageRelease(v15);
  if ([a3 containsValueForKey:@"CIUserInfo"]
    && -[CIImage initWithCoder:]::onceToken != -1)
  {
    dispatch_once(&-[CIImage initWithCoder:]::onceToken, &__block_literal_global_440);
  }
  return self;
}

void __25__CIImage_initWithCoder___block_invoke()
{
  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __25__CIImage_initWithCoder___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)printTree
{
  uint64_t v3 = (FILE *)CI_LOG_FILE();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __20__CIImage_printTree__block_invoke;
  v4[3] = &unk_1E5771158;
  v4[4] = self;
  stream_to_file(v3, (uint64_t)v4);
}

size_t __20__CIImage_printTree__block_invoke(uint64_t a1, FILE *a2)
{
  uint64_t v3 = *(CI::Image **)(*(void *)(a1 + 32) + 8);
  fprintf(a2, "<CIImage: %p> printTree:\n", *(const void **)(a1 + 32));
  CI::Image::print_graph(v3, a2);

  return fwrite("\n\n", 2uLL, 1uLL, a2);
}

- (id)TIFFRepresentation
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x199702DB0](self, a2);
  [(CIImage *)self extent];
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  if (CGRectIsEmpty(v20))
  {
    return 0;
  }
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  if (CGRectIsInfinite(v21))
  {
    double height = 1024.0;
    double width = 1024.0;
    double y = 0.0;
    double x = 0.0;
  }
  id v9 = +[CIContext _singletonContext];
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  float v11 = (CGImage *)objc_msgSend(v9, "createCGImage:fromRect:format:colorSpace:", self, 265, DeviceRGB, x, y, width, height);
  CGColorSpaceRelease(DeviceRGB);
  if (v11)
  {
    CGRect v12 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    uint64_t v18 = *MEMORY[0x1E4F2FD40];
    uint64_t v16 = *MEMORY[0x1E4F2FD28];
    int v17 = &unk_1EE4AAA00;
    v19[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    float v13 = CGImageDestinationCreateWithData(v12, @"public.tiff", 1uLL, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1]);
    if (v13)
    {
      uint64_t v14 = v13;
      CGImageDestinationAddImage(v13, v11, 0);
      BOOL v15 = CGImageDestinationFinalize(v14);
      CFRelease(v14);
      CGImageRelease(v11);
      if (v15) {
        goto LABEL_12;
      }
    }
    else
    {
      CGImageRelease(v11);
    }
  }
  CGRect v12 = 0;
LABEL_12:
  return v12;
}

- (CGRect)regionOfInterestForImage:(CIImage *)image inRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  if (!CGRectIsEmpty(rect))
  {
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    CGRect v30 = CGRectInset(v29, 0.001, 0.001);
    CGRect v31 = CGRectIntegral(v30);
    CGFloat v10 = v31.origin.x;
    CGFloat v11 = v31.origin.y;
    CGFloat v12 = v31.size.width;
    CGFloat v13 = v31.size.height;
    [(CIImage *)self extent];
    v36.origin.CGFloat x = v14;
    v36.origin.CGFloat y = v15;
    v36.size.CGFloat width = v16;
    v36.size.CGFloat height = v17;
    v32.origin.CGFloat x = v10;
    v32.origin.CGFloat y = v11;
    v32.size.CGFloat width = v12;
    v32.size.CGFloat height = v13;
    CGRect v33 = CGRectIntersection(v32, v36);
    CGFloat v18 = v33.origin.x;
    CGFloat v19 = v33.origin.y;
    CGFloat v20 = v33.size.width;
    CGFloat v21 = v33.size.height;
    if (!CGRectIsEmpty(v33))
    {
      CGRect v26 = [(CIImage *)image _internalRepresentation];
      CFDataRef v27 = [(CIImage *)self _internalRepresentation];
      while ((*(unsigned int (**)(void *))(*(void *)v26 + 16))(v26) == 16
           || (*(unsigned int (**)(void *))(*(void *)v26 + 16))(v26) == 4)
        CGRect v26 = (void *)(*(uint64_t (**)(void *, void))(*(void *)v26 + 48))(v26, 0);
      v34.origin.CGFloat x = v18;
      v34.origin.CGFloat y = v19;
      v34.size.CGFloat width = v20;
      v34.size.CGFloat height = v21;
      CI::Image::BuildMapToUnionRoi(v27, v28, v34);
    }
  }
  double v22 = *MEMORY[0x1E4F1DB20];
  double v23 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v4 = ci_logger_api();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CIImage setValue:forKeyPath:]();
  }
}

- (CIImage)initWithDepthData:(AVDepthData *)data options:(NSDictionary *)options
{
  if (data && (uint64_t v7 = AVFDepthDataMap(data, a2)) != 0)
  {
    uint64_t v8 = v7;
    id v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:options];
    [v9 setValue:data forKey:@"kCIImageAVDepthData"];
    return [(CIImage *)self initWithCVPixelBuffer:v8 options:v9];
  }
  else
  {

    return 0;
  }
}

- (CIImage)initWithDepthData:(AVDepthData *)data
{
  return [(CIImage *)self initWithDepthData:data options:0];
}

+ (CIImage)imageWithDepthData:(AVDepthData *)data options:(NSDictionary *)options
{
  uint64_t v4 = [[CIImage alloc] initWithDepthData:data options:options];

  return v4;
}

+ (CIImage)imageWithDepthData:(AVDepthData *)data
{
  uint64_t v3 = [[CIImage alloc] initWithDepthData:data options:0];

  return v3;
}

- (CIImage)initWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte options:(NSDictionary *)options
{
  if (matte && (uint64_t v7 = AVFPortraitEffectsMatteImage(matte, a2)) != 0)
  {
    uint64_t v8 = v7;
    id v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:options];
    [v9 setValue:matte forKey:@"kCIImageAVPortraitEffectsMatte"];
    return [(CIImage *)self initWithCVPixelBuffer:v8 options:v9];
  }
  else
  {

    return 0;
  }
}

- (CIImage)initWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte
{
  return [(CIImage *)self initWithPortaitEffectsMatte:matte options:0];
}

+ (CIImage)imageWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte options:(NSDictionary *)options
{
  uint64_t v4 = [[CIImage alloc] initWithPortaitEffectsMatte:matte options:options];

  return v4;
}

+ (CIImage)imageWithPortaitEffectsMatte:(AVPortraitEffectsMatte *)matte
{
  uint64_t v3 = [[CIImage alloc] initWithPortaitEffectsMatte:matte options:0];

  return v3;
}

- (CIImage)initWithPortraitEffectsMatte:(id)a3
{
  return [(CIImage *)self initWithPortraitEffectsMatte:a3 options:0];
}

+ (CIImage)imageWithPortraitEffectsMatte:(id)a3 options:(id)a4
{
  uint64_t v4 = [[CIImage alloc] initWithPortraitEffectsMatte:a3 options:a4];

  return v4;
}

+ (CIImage)imageWithPortraitEffectsMatte:(id)a3
{
  uint64_t v3 = [[CIImage alloc] initWithPortraitEffectsMatte:a3 options:0];

  return v3;
}

- (CIImage)initWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte options:(NSDictionary *)options
{
  if (matte && (uint64_t v7 = AVSemanticSegmentationMatteImage(matte, a2)) != 0)
  {
    uint64_t v8 = v7;
    id v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:options];
    [v9 setValue:matte forKey:@"kCIImageAVSemanticSegmentationMatte"];
    return [(CIImage *)self initWithCVPixelBuffer:v8 options:v9];
  }
  else
  {

    return 0;
  }
}

- (CIImage)initWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte
{
  return [(CIImage *)self initWithSemanticSegmentationMatte:matte options:0];
}

+ (CIImage)imageWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte options:(NSDictionary *)options
{
  uint64_t v4 = [[CIImage alloc] initWithSemanticSegmentationMatte:matte options:options];

  return v4;
}

+ (CIImage)imageWithSemanticSegmentationMatte:(AVSemanticSegmentationMatte *)matte
{
  uint64_t v3 = [[CIImage alloc] initWithSemanticSegmentationMatte:matte options:0];

  return v3;
}

- (CIImage)imageByConvertingWorkingSpaceToLab
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_RGBtoLAB];
  [(CIImage *)self extent];
  v9[0] = self;
  return (CIImage *)-[CIImage imageByTaggingWithColorSpace:](-[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1], v4, v5, v6, v7), "imageByTaggingWithColorSpace:", 0);
}

- (CIImage)imageByConvertingLabToWorkingSpace
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[CIKernel kernelWithInternalRepresentation:&CI::_LABtoRGB];
  [(CIImage *)self extent];
  v9[0] = self;
  return -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1], v4, v5, v6, v7);
}

+ (CIImage)imageWithAttributedString:(id)a3 format:(int)a4
{
  double v4 = [[CIImage alloc] initWithAttributedString:a3 format:*(void *)&a4 options:0];

  return v4;
}

+ (CIImage)imageWithAttributedString:(id)a3 format:(int)a4 options:(id)a5
{
  double v5 = [[CIImage alloc] initWithAttributedString:a3 format:*(void *)&a4 options:a5];

  return v5;
}

- (CIImage)initWithAttributedString:(id)a3 format:(int)a4
{
  return [(CIImage *)self initWithAttributedString:a3 format:*(void *)&a4 options:0];
}

- (CIImage)initWithAttributedString:(id)a3 format:(int)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v9 = (CGColorSpace *)[a5 objectForKey:@"CIImageColorSpace"];
  CGFloat v10 = (void *)[a5 objectForKey:@"kCIImageTextScaleFactor"];
  if (v10)
  {
    [v10 floatValue];
    float v12 = v11;
  }
  else
  {
    float v12 = 1.0;
  }
  float v45 = v12;
  CGFloat v13 = (void *)[a5 objectForKey:@"kCIImageTextPadding"];
  if (v13)
  {
    [v13 floatValue];
    int v16 = vcvtps_s32_f32(v15);
  }
  else
  {
    int v16 = 1;
  }
  int v17 = CI::format_modernize(v6, (CI *)"-[CIImage(TextImage) initWithAttributedString:format:options:]", v14);
  unsigned int v46 = v17;
  CGFloat v18 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)a3);
  CFIndex v19 = [a3 length];
  v51.double width = 1.79769313e308;
  v49.location = 0;
  v49.length = v19;
  v51.CGFloat height = 1.79769313e308;
  CGSize v20 = CTFramesetterSuggestFrameSizeWithConstraints(v18, v49, 0, v51, 0);
  double width = v20.width;
  double v22 = CTLineCreateWithAttributedString((CFAttributedStringRef)a3);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v22, 8uLL);
  double x = BoundsWithOptions.origin.x;
  CGFloat y = BoundsWithOptions.origin.y;
  CGFloat v25 = BoundsWithOptions.size.width;
  CGFloat height = BoundsWithOptions.size.height;
  if (v20.width < CGRectGetMaxX(BoundsWithOptions))
  {
    v53.origin.double x = x;
    v53.origin.CGFloat y = y;
    v53.size.double width = v25;
    v53.size.CGFloat height = height;
    double width = CGRectGetMaxX(v53);
  }
  double v27 = ceil(-0.001 - x);
  double v28 = -0.0;
  if (x < 0.0) {
    double v28 = v27;
  }
  double v29 = v28 + width;
  CFRelease(v22);
  v54.origin.double x = 0.0;
  v54.origin.CGFloat y = 0.0;
  v54.size.double width = v29;
  v54.size.CGFloat height = v20.height;
  CGRect v30 = CGPathCreateWithRect(v54, 0);
  v50.location = 0;
  v50.length = v19;
  CTFrameRef Frame = CTFramesetterCreateFrame(v18, v50, v30, 0);
  CGRect v32 = Frame;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (CGRect v33 = objc_msgSend(a3, "dataFromRange:documentAttributes:error:", 0, objc_msgSend(a3, "length"), &unk_1EE4AB1A8, 0)) == 0)
  {
    CGRect v33 = (void *)archivedDataWithRootObject([a3 string]);
  }
  id v34 = (id)[v33 mutableCopy];
  [v34 appendBytes:&v46 length:4];
  [v34 appendBytes:&v45 length:4];
  if (v9)
  {
    CFDataRef v35 = CGColorSpaceCopyICCData(v9);
    [v34 appendData:v35];
  }
  else
  {
    if (CI::format_is_luminance(v17)) {
      DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
    }
    else {
      DeviceGraCGFloat y = CGColorSpaceCreateDeviceRGB();
    }
    id v9 = DeviceGray;
  }
  double v37 = 0.0;
  if (x < 0.0) {
    double v37 = v27;
  }
  if ((v16 & ~(v16 >> 31)) >= 0xC8) {
    int v38 = 200;
  }
  else {
    int v38 = v16 & ~(v16 >> 31);
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  void v41[2] = __62__CIImage_TextImage__initWithAttributedString_format_options___block_invoke_2;
  v41[3] = &unk_1E5772058;
  *(double *)&v41[6] = v37;
  int v42 = v17;
  int v43 = v38;
  float v44 = v45;
  v41[4] = v32;
  v41[5] = v9;
  long long v47 = @"kCIImageProviderContentDigest";
  v48[0] = v34;
  int v39 = -[CIImage initWithImageProvider:width:height:format:colorSpace:options:](self, "initWithImageProvider:width:height:format:colorSpace:options:", v41, vcvtpd_u64_f64(ceil(v29 * v12 + -0.001) + (double)(2 * v38)), vcvtpd_u64_f64(ceil(v20.height * v12 + -0.001) + (double)(2 * v38)), v46, v9, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1]);
  CFRelease(Frame);

  CFRelease(v18);
  CGPathRelease(v30);
  return v39;
}

uint64_t __62__CIImage_TextImage__initWithAttributedString_format_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"range(%lu,%lu)\n", a3, a4);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [a2 debugDescription];

  return [v6 appendString:v7];
}

void __62__CIImage_TextImage__initWithAttributedString_format_options___block_invoke_2(uint64_t a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, size_t a6, size_t a7)
{
  size_t v12 = CI::buffer_size_for_format(*(_DWORD *)(a1 + 56), a6, a7, a3);
  bzero(a2, v12);
  size_t v13 = (int)CI::format_bits_per_component(*(_DWORD *)(a1 + 56));
  uint32_t v14 = CI::format_CGBitmapInfo(*(_DWORD *)(a1 + 56), 1);
  float v15 = CGBitmapContextCreate(a2, a6, a7, v13, a3, *(CGColorSpaceRef *)(a1 + 40), v14);
  CGContextSetShouldSmoothFonts(v15, 0);
  CGContextTranslateCTM(v15, *(CGFloat *)(a1 + 48), 0.0);
  CGContextTranslateCTM(v15, (double)*(int *)(a1 + 60), (double)*(int *)(a1 + 60));
  CGContextScaleCTM(v15, *(float *)(a1 + 64), *(float *)(a1 + 64));
  CTFrameDraw(*(CTFrameRef *)(a1 + 32), v15);

  CGContextRelease(v15);
}

- (id)_pdfDataRepresentation
{
  uint64_t v3 = (CI::GraphObject *)CFStringCreateWithFormat(0, 0, @"CIImage <%p>", self);
  id v4 = +[CIContext _cachedContext:@"CIImageQuicklook" options:0];
  [(CIImage *)self extent];
  id v9 = (__CFString *)objc_msgSend(v4, "createCGImage:fromRect:format:colorSpace:deferred:", self, 264, objc_msgSend(v4, "_outputColorSpace"), 0, v5, v6, v7, v8);
  float v11 = CI::GraphObject::graphviz_representation((CI::GraphObject *)self->_priv, v3, v9, v10);
  {
    -[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer = (uint64_t)CIGVRendererCreatePDFRenderer();
  }
  CIGVRendererSetOutputFileURL((void *)-[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer, 0);
  CIGVGraphRender(v11, (const char *)-[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer);
  CIGVRenddererFlushRender(-[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer);
  PDFData = (void *)CIGVRendererGetPDFData(-[CIImage(QuicklookSupport) _pdfDataRepresentation]::renderer);
  CFRelease(v3);
  CGImageRelease((CGImageRef)v9);
  CFRelease(v11);

  return PDFData;
}

- (CGImage)_cgImageGraphRepresentation
{
  uint64_t v3 = (CI::GraphObject *)CFStringCreateWithFormat(0, 0, @"CIImage <%p>", self);
  double v5 = CI::GraphObject::graphviz_representation((CI::GraphObject *)self->_priv, v3, 0, v4);
  {
    -[CIImage(QuicklookSupport) _cgImageGraphRepresentation]::renderer = (uint64_t)CIGVRendererCreatePNGRenderer();
  }
  CIGVGraphRender(v5, (const char *)-[CIImage(QuicklookSupport) _cgImageGraphRepresentation]::renderer);
  CGImage = (CGImage *)CIGVRendererGetCGImage(-[CIImage(QuicklookSupport) _cgImageGraphRepresentation]::renderer);
  CFRelease(v3);
  CFRelease(v5);
  return CGImage;
}

+ (id)clearImage:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = +[CIKernel kernelWithInternalRepresentation:&CI::_clearer];

  return -[CIColorKernel applyWithExtent:arguments:](v7, "applyWithExtent:arguments:", 0, x, y, width, height);
}

- (id)_scaleImageToMaxDimension:(unsigned int)a3
{
  id v4 = self;
  [(CIImage *)self extent];
  CGFloat x = v7;
  CGFloat y = v9;
  double v11 = fmin((double)a3 / v5, (double)a3 / v6);
  if (v11 < 1.0)
  {
    CGFloat width = v5;
    CGFloat height = v6;
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeScale(&v21, 0.5, 0.5);
    while (v11 < 0.5)
    {
      CGAffineTransform v20 = v21;
      v22.origin.CGFloat x = x;
      v22.origin.CGFloat y = y;
      v22.size.CGFloat width = width;
      v22.size.CGFloat height = height;
      CGRect v23 = CGRectApplyAffineTransform(v22, &v20);
      CGFloat x = v23.origin.x;
      CGFloat y = v23.origin.y;
      CGFloat width = v23.size.width;
      CGFloat height = v23.size.height;
      CGAffineTransform v20 = v21;
      id v4 = [[(CIImage *)v4 imageByApplyingTransform:&v20] _imageByRenderingToIntermediate];
      double v11 = v11 + v11;
    }
    CGAffineTransformMakeScale(&v20, v11, v11);
    CGAffineTransform v21 = v20;
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    CGRect v25 = CGRectApplyAffineTransform(v24, &v20);
    CGRect v26 = CGRectIntegral(v25);
    double v14 = v26.origin.x;
    double v15 = v26.origin.y;
    double v16 = v26.size.width;
    double v17 = v26.size.height;
    CGFloat v18 = [(CIImage *)v4 imageByClampingToExtent];
    CGAffineTransform v20 = v21;
    return -[CIImage imageByCroppingToRect:]([(CIImage *)v18 imageByApplyingTransform:&v20], "imageByCroppingToRect:", v14, v15, v16, v17);
  }
  return v4;
}

- (id)autoAdjustmentFiltersWithImageProperties:(id)a3 options:(id)a4
{
  v124[1] = *MEMORY[0x1E4F143B8];
  int32x4_t v123 = @"high_quality_downsample";
  v124[0] = MEMORY[0x1E4F1CC38];
  id v104 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", @"CIImageAutoAdjust", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:&v123 count:1]);
  uint64_t v7 = *MEMORY[0x1E4F2F800];
  id v103 = a3;
  double v8 = (void *)[a3 valueForKey:*MEMORY[0x1E4F2F800]];
  double v9 = (void *)[v8 valueForKey:*MEMORY[0x1E4F2F838]];
  if (v9)
  {
    if ([v9 intValue]) {
      int v10 = 121;
    }
    else {
      int v10 = 110;
    }
  }
  else
  {
    int v10 = 63;
  }
  double v11 = (void *)[a4 objectForKey:@"kCIImageAutoAdjustRedEye"];
  size_t v12 = (void *)[a4 objectForKey:@"kCIImageAutoAdjustEnhance"];
  size_t v13 = (void *)[a4 objectForKey:@"kCIImageAutoAdjustCrop"];
  double v14 = (void *)[a4 objectForKey:@"kCIImageAutoAdjustLevel"];
  if (v12)
  {
    int v15 = [v12 BOOLValue];
    if (v11) {
      goto LABEL_8;
    }
  }
  else
  {
    int v15 = 1;
    if (v11)
    {
LABEL_8:
      int v16 = [v11 BOOLValue];
      if (v13) {
        goto LABEL_9;
      }
LABEL_13:
      int v17 = 0;
      if (v14) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  int v16 = 1;
  if (!v13) {
    goto LABEL_13;
  }
LABEL_9:
  int v17 = [v13 BOOLValue];
  if (v14)
  {
LABEL_10:
    int v18 = [v14 BOOLValue];
    goto LABEL_15;
  }
LABEL_14:
  int v18 = 0;
LABEL_15:
  [(CIImage *)self extent];
  double x = v125.origin.x;
  double y = v125.origin.y;
  double width = v125.size.width;
  double height = v125.size.height;
  if (CGRectIsNull(v125)) {
    return 0;
  }
  v126.origin.double x = x;
  v126.origin.double y = y;
  v126.size.double width = width;
  v126.size.double height = height;
  if (CGRectIsInfinite(v126)) {
    return 0;
  }
  v127.origin.double x = x;
  v127.origin.double y = y;
  v127.size.double width = width;
  v127.size.double height = height;
  if (CGRectIsEmpty(v127)) {
    return 0;
  }
  int v23 = v15;
  uint64_t v24 = v7;
  int v25 = v16 ^ 1;
  if (v10 == 110) {
    int v25 = 1;
  }
  int v26 = fmin(width, height) < 160.0 ? 1 : v25;
  unsigned int v102 = v23;
  int v27 = v26 ^ 1 | v23 | v17;
  if (((v27 | v18) & 1) == 0) {
    return 0;
  }
  uint64_t v100 = [a4 valueForKey:@"kCIImageAutoAdjustFeatures"];
  char v28 = (v100 != 0) | ~(_BYTE)v27;
  uint64_t v29 = v24;
  if ((v28 & 1) == 0)
  {
    CGRect v30 = (void *)MEMORY[0x199702DB0]();
    float32x4_t v121 = @"CIDetectorBetterEyeLocs";
    uint64_t v122 = [NSNumber numberWithInt:v26 ^ 1u];
    double v101 = +[CIDetector detectorOfType:context:options:](CIDetector, "detectorOfType:context:options:", @"CIDetectorTypeFace", v104, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1]);
    uint64_t v31 = [a4 valueForKey:@"CIDetectorImageOrientation"];
    if (v31)
    {
      double v119 = @"CIDetectorImageOrientation";
      uint64_t v120 = v31;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
    }
    else
    {
      uint64_t v32 = 0;
    }
    id v34 = [(NSArray *)[(CIDetector *)v101 featuresInImage:self options:v32] sortedArrayUsingComparator:&__block_literal_global_40];
    CFDataRef v35 = v34;
    uint64_t v100 = (uint64_t)v34;
    CGRect v36 = v34;
  }
  double v37 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ((v26 & 1) == 0)
  {
    id v38 = [(CIImage *)self _autoRedEyeFilterWithFeatures:v100 imageProperties:v103 context:v104 options:a4];
    if (v38)
    {
      id v39 = v38;
      if (([v38 _isIdentity] & 1) == 0) {
        [v37 addObject:v39];
      }
    }
  }
  if ((v102 | v17 | v18) == 1)
  {
    id v40 = objc_alloc_init(CIEnhancementCalculator);
    [(CIEnhancementCalculator *)v40 setFaceBalanceEnabled:v102];
    [(CIEnhancementCalculator *)v40 setVibranceEnabled:v102];
    [(CIEnhancementCalculator *)v40 setCurvesEnabled:v102];
    [(CIEnhancementCalculator *)v40 setShadowsEnabled:v102];
    double v99 = objc_opt_new();
    if ([(CIEnhancementCalculator *)v40 faceBalanceEnabled])
    {
      CFDictionaryRef v41 = objc_opt_new();
      [(CIEnhancementCalculator *)v40 setupFaceColorFromImage:self usingContext:v104 features:v100];
      [v41 drain];
    }
    id v98 = [(CIImage *)self _scaleImageToMaxDimension:400];
    int v42 = objc_opt_new();
    if (v102)
    {
      id v43 = +[CIImageRowReader forImage:v98 usingContext:v104];
      -[CIEnhancementCalculator setupHistogramsUsing:redIndex:greenIndex:blueIndex:](v40, "setupHistogramsUsing:redIndex:greenIndex:blueIndex:", v43, [v43 red], objc_msgSend(v43, "green"), objc_msgSend(v43, "blue"));
    }
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v109 = *MEMORY[0x1E4F1DAB8];
    long long v110 = v44;
    long long v111 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v107.f64[0] = x;
    v107.f64[1] = y;
    v108.f64[0] = width;
    v108.f64[1] = height;
    if (v18)
    {
      float v45 = (void *)[a4 objectForKey:@"kCIImageAutoAdjustLevel_MaxAngle"];
      uint64_t v46 = [a4 objectForKey:@"kCIImageAutoAdjustLevel_UseVerticalDetector"];
      if (v45)
      {
        [v45 floatValue];
        float v48 = v47;
      }
      else
      {
        float v48 = -1.0;
      }
      if (v46) {
        unsigned int v97 = [v14 BOOLValue];
      }
      else {
        unsigned int v97 = 0;
      }
      CFRange v49 = (void *)[a4 objectForKey:@"kCIImageAutoAdjustLevel_MinAngle"];
      CFRange v50 = (void *)[a4 objectForKey:@"kCIImageAutoAdjustLevel_VerticalAngleThreshold"];
      CGSize v51 = (void *)[a4 objectForKey:@"kCIImageAutoAdjustLevel_DominantAngleDiffThreshold"];
      float v56 = -1.0;
      float v57 = -1.0;
      if (v49)
      {
        [v49 floatValue];
        float v57 = v58;
      }
      if (v50)
      {
        [v50 floatValue];
        float v56 = v59;
      }
      if (v51)
      {
        [v51 floatValue];
        LODWORD(v55) = v60;
      }
      else
      {
        LODWORD(v55) = -1.0;
      }
      *(float *)&double v52 = v57;
      *(float *)&double v53 = v48;
      *(float *)&double v54 = v56;
      id v61 = -[CIImage getAutoRotateFilter:ciImage:inputRect:rotateCropRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:](self, "getAutoRotateFilter:ciImage:inputRect:rotateCropRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:", v104, v98, &v107, v97, x, y, width, height, v52, v53, v54, v55);
      if (v61)
      {
        __int32 v62 = v61;
        [v37 addObject:v61];
        CGAffineTransformFromObject([v62 valueForKey:@"inputTransform"], (uint64_t)&v109);
      }
    }
    [v42 drain];
    [v99 drain];
    float64x2_t v105 = v107;
    float64x2_t v106 = v108;
    if (v17)
    {
      long long v112 = v109;
      long long v113 = v110;
      long long v114 = v111;
      -[CIImage getAutocropRect:rotateXfrm:inputImageRect:clipRect:](self, "getAutocropRect:rotateXfrm:inputImageRect:clipRect:", v100, &v112, &v105, x, y, width, height);
    }
    v128.origin = (CGPoint)v105;
    v128.size = (CGSize)v106;
    v129.origin.double x = x;
    v129.origin.double y = y;
    v129.size.double width = width;
    v129.size.double height = height;
    if (!CGRectEqualToRect(v128, v129))
    {
      __asm { FMOV            V1.2D, #0.5 }
      float64x2_t v68 = vsubq_f64(v105, vcvtq_f64_f32(vcvt_f32_s32(vmovn_s64(vcvtq_s64_f64(vaddq_f64(v105, _Q1))))));
      float64x2_t v105 = vsubq_f64(v105, v68);
      float64x2_t v106 = vcvtq_f64_f32(vcvt_f32_s32(vmovn_s64(vcvtq_s64_f64(vaddq_f64(vaddq_f64(v106, v68), _Q1)))));
      int v69 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CICrop", @"inputRectangle", +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *(_OWORD *)&v105, *(_OWORD *)&v106), 0);
      acLog("   adding crop rect: x=%.3f,y=%.3f,w=%.3f,h=%.3f\n", v70, v71, v72, v73, v74, v75, v76, SLOBYTE(v105.f64[0]));
      if (v69) {
        [v37 addObject:v69];
      }
    }
    if (v102)
    {
      if ([(CIEnhancementCalculator *)v40 faceBalanceEnabled])
      {
        if ([(CIEnhancementCalculation *)v40 faceBalanceWarmth])
        {
          if ([(CIEnhancementCalculation *)v40 faceBalanceStrength])
          {
            float v77 = +[CIFilter filterWithName:@"CIFaceBalance"];
            if (v77)
            {
              float v78 = v77;
              [(CIEnhancementCalculation *)v40 originalFaceColor];
              double v80 = v79;
              -[CIFilter setValue:forKey:](v78, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithDouble:"), @"inputOrigI");
              -[CIFilter setValue:forKey:](v78, "setValue:forKey:", [NSNumber numberWithDouble:v80], @"inputOrigQ");
              [(CIFilter *)v78 setValue:[(CIEnhancementCalculation *)v40 faceBalanceStrength] forKey:@"inputStrength"];
              [(CIFilter *)v78 setValue:[(CIEnhancementCalculation *)v40 faceBalanceWarmth] forKey:@"inputWarmth"];
              if (![(CIFilter *)v78 _isIdentity]) {
                [v37 addObject:v78];
              }
            }
          }
        }
      }
      if ([(CIEnhancementCalculator *)v40 vibranceEnabled])
      {
        if ([(CIEnhancementCalculation *)v40 vibrance])
        {
          uint64_t v81 = +[CIFilter filterWithName:@"CIVibrance"];
          if (v81)
          {
            uint64_t v82 = v81;
            [(CIFilter *)v81 setValue:[(CIEnhancementCalculation *)v40 vibrance] forKey:@"inputAmount"];
            if (![(CIFilter *)v82 _isIdentity]) {
              [v37 addObject:v82];
            }
          }
        }
      }
      if ([(CIEnhancementCalculator *)v40 curvesEnabled])
      {
        if ([(CIEnhancementCalculation *)v40 curveCount] == 5)
        {
          uint64_t v83 = +[CIFilter filterWithName:@"CIToneCurve"];
          if (v83)
          {
            v84 = v83;
            uint64_t v85 = 0;
            float v86 = (void *)&v112 + 1;
            do
            {
              [(CIEnhancementCalculation *)v40 curvePointAtIndex:v85];
              *(v86 - 1) = v87;
              *float v86 = v88;
              ++v85;
              v86 += 2;
            }
            while (v85 != 5);
            [(CIFilter *)v84 setValue:+[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v112) forKey:@"inputPoint0"];
            [(CIFilter *)v84 setValue:+[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v113) forKey:@"inputPoint1"];
            [(CIFilter *)v84 setValue:+[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v114) forKey:@"inputPoint2"];
            [(CIFilter *)v84 setValue:+[CIVector vectorWithX:v115 Y:v116] forKey:@"inputPoint3"];
            [(CIFilter *)v84 setValue:+[CIVector vectorWithX:v117 Y:v118] forKey:@"inputPoint4"];
            [(CIFilter *)v84 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputExtrapolate"];
            if (![(CIFilter *)v84 _isIdentity]) {
              [v37 addObject:v84];
            }
          }
        }
      }
      BOOL v89 = [(CIEnhancementCalculator *)v40 shadowsEnabled];
      if (v103)
      {
        if (v89)
        {
          v90 = (void *)[v103 objectForKey:v29];
          int v91 = objc_msgSend((id)objc_msgSend(v90, "objectForKey:", *MEMORY[0x1E4F2F7E0]), "intValue");
          float v92 = (void *)[v103 objectForKey:*MEMORY[0x1E4F2FD40]];
          float v93 = (void *)[v92 objectForKey:*MEMORY[0x1E4F2FD68]];
          if (v91 == 3)
          {
            double v94 = v93;
            if (([v93 hasPrefix:@"iPhone"] & 1) != 0
              || [v94 hasPrefix:@"iPad"])
            {
              [(CIEnhancementCalculator *)v40 setShadowsEnabled:0];
            }
          }
        }
      }
      if ([(CIEnhancementCalculator *)v40 shadowsEnabled])
      {
        if ([(CIEnhancementCalculation *)v40 shadow])
        {
          double v95 = +[CIFilter filterWithName:@"CIHighlightShadowAdjust"];
          if (v95)
          {
            double v96 = v95;
            [(CIFilter *)v95 setValue:[(CIEnhancementCalculation *)v40 shadow] forKey:@"inputShadowAmount"];
            [(CIFilter *)v96 setValue:&unk_1EE4AAA30 forKey:@"__inputVersion"];
            if (![(CIFilter *)v96 _isIdentity]) {
              [v37 addObject:v96];
            }
          }
        }
      }
    }
  }
  else
  {
    id v40 = 0;
  }
  if (autoAdjustmentFiltersWithImageProperties_options__didCheck != -1) {
    dispatch_once(&autoAdjustmentFiltersWithImageProperties_options__didCheck, &__block_literal_global_106);
  }
  if (autoAdjustmentFiltersWithImageProperties_options__dumpAutoEnhanceArray) {
    NSLog(&cfstr_Filters_0.isa, v37);
  }

  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:v37];
}

uint64_t __72__CIImage_AutoAdjust__autoAdjustmentFiltersWithImageProperties_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 bounds];
  double v6 = v5;
  [a2 bounds];
  double v8 = v6 * v7;
  [a3 bounds];
  double v10 = v9;
  [a3 bounds];
  if (v8 > v10 * v11) {
    return -1;
  }
  else {
    return v8 < v10 * v11;
  }
}

const char *__72__CIImage_AutoAdjust__autoAdjustmentFiltersWithImageProperties_options___block_invoke_103()
{
  CGRect result = getenv("DUMP_AUTO_ENHANCE_ARRAY");
  if (result) {
    CGRect result = (const char *)atoi(result);
  }
  autoAdjustmentFiltersWithImageProperties_options__dumpAutoEnhanceArradouble y = (int)result;
  return result;
}

- (NSArray)autoAdjustmentFilters
{
  return [(CIImage *)self autoAdjustmentFiltersWithOptions:0];
}

- (NSArray)autoAdjustmentFiltersWithOptions:(NSDictionary *)options
{
  double v5 = [(CIImage *)self properties];

  return (NSArray *)[(CIImage *)self autoAdjustmentFiltersWithImageProperties:v5 options:options];
}

- (CIImage)imageWithMesh:(id)a3 transform:(CGAffineTransform *)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  double v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 1352; i += 8)
  {
    uint64_t v9 = *(int *)((char *)&imageWithMesh_transform__meshEndPointIndexes + i + 4);
    double v10 = (void *)[a3 objectAtIndexedSubscript:*(int *)((char *)&imageWithMesh_transform__meshEndPointIndexes + i)];
    [v10 X];
    double v12 = v11;
    [v10 Y];
    double v14 = v13;
    int v15 = (void *)[a3 objectAtIndexedSubscript:v9];
    [v15 X];
    double v17 = v16;
    [v15 Y];
    objc_msgSend(v7, "addObject:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", a4->tx + v14 * a4->c + a4->a * v12, a4->ty + v14 * a4->d + a4->b * v12, a4->tx + v18 * a4->c + a4->a * v17, a4->ty + v18 * a4->d + a4->b * v17));
  }
  v21[0] = &unk_1EE4A8F60;
  v20[0] = @"inputWidth";
  v20[1] = @"inputColor";
  v20[2] = @"inputMesh";
  v21[1] = +[CIVector vectorWithX:1.0 Y:1.0 Z:0.0 W:1.0];
  v21[2] = v7;
  return (CIImage *)objc_msgSend((id)-[CIFilter valueForKey:](+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CIMeshGenerator", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 3)), "valueForKey:", @"outputImage"), "imageByCompositingOverImage:", self);
}

- (CGPoint)pointWithDictionary:(id)a3 name:(id)a4 index:(int)a5 transformedBy:(CGAffineTransform *)a6
{
  double v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", a4), "objectAtIndexedSubscript:", a5);
  [v7 X];
  double v12 = v8;
  [v7 Y];
  float64x2_t v10 = vaddq_f64(*(float64x2_t *)&a6->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a6->c, v9), *(float64x2_t *)&a6->a, v12));
  double v11 = v10.f64[1];
  result.double x = v10.f64[0];
  result.double y = v11;
  return result;
}

- (id)_dictForFeature:(id)a3 invOrientationTransform:(CGAffineTransform *)a4 extent:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  float64x2_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a5.origin.x, a5.origin.y);
  int v11 = CI_EDIT_RED_EYE_VERSION();
  [(CIImage *)self extent];
  double v13 = v12;
  double v15 = v14;
  float v16 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v11 >= 2 && [a3 landmarks])
    {
      uint64_t v17 = [a3 landmarks];
      long long v18 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v18;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"leftPupil" index:0 transformedBy:&v155];
      double v20 = v19;
      double v114 = v21;
      long long v22 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v22;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"rightPupil" index:0 transformedBy:&v155];
      double v24 = v23;
      double v118 = v25;
      long long v26 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v26;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"innerLips" index:1 transformedBy:&v155];
      double v117 = v27;
      double v121 = v28;
      long long v29 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v29;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"innerLips" index:4 transformedBy:&v155];
      double v31 = v30;
      double v115 = v32;
      long long v33 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v33;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"noseCrest" index:0 transformedBy:&v155];
      double v116 = v34;
      double v120 = v35;
      long long v36 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v36;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"noseCrest" index:2 transformedBy:&v155];
      double v119 = v37;
      double v123 = v38;
      long long v39 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v39;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"leftEye" index:0 transformedBy:&v155];
      double v122 = v40;
      double v125 = v41;
      long long v42 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v42;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"leftEye" index:1 transformedBy:&v155];
      double v124 = v43;
      double v127 = v44;
      long long v45 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v45;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"leftEye" index:2 transformedBy:&v155];
      double v126 = v46;
      double v129 = v47;
      long long v48 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v48;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"leftEye" index:3 transformedBy:&v155];
      double v128 = v49;
      double v131 = v50;
      long long v51 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v51;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"leftEye" index:4 transformedBy:&v155];
      double v130 = v52;
      double v133 = v53;
      long long v54 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v54;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"leftEye" index:5 transformedBy:&v155];
      double v132 = v55;
      double v135 = v56;
      long long v57 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v57;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"leftEye" index:6 transformedBy:&v155];
      double v134 = v58;
      double v137 = v59;
      long long v60 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v60;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"leftEye" index:7 transformedBy:&v155];
      double v136 = v61;
      double v139 = v62;
      long long v63 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v63;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"rightEye" index:0 transformedBy:&v155];
      double v138 = v64;
      double v141 = v65;
      long long v66 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v66;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"rightEye" index:1 transformedBy:&v155];
      double v140 = v67;
      double v143 = v68;
      long long v69 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v69;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"rightEye" index:2 transformedBy:&v155];
      double v142 = v70;
      double v145 = v71;
      long long v72 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v72;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"rightEye" index:3 transformedBy:&v155];
      double v144 = v73;
      double v147 = v74;
      long long v75 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v75;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"rightEye" index:4 transformedBy:&v155];
      double v146 = v76;
      double v149 = v77;
      long long v78 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v78;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"rightEye" index:5 transformedBy:&v155];
      double v148 = v79;
      double v151 = v80;
      long long v81 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v81;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"rightEye" index:6 transformedBy:&v155];
      double v150 = v82;
      double v153 = v83;
      long long v84 = *(_OWORD *)&a4->c;
      long long v155 = *(_OWORD *)&a4->a;
      long long v156 = v84;
      long long v157 = *(_OWORD *)&a4->tx;
      [(CIImage *)self pointWithDictionary:v17 name:@"rightEye" index:7 transformedBy:&v155];
      double v152 = v85;
      double v154 = v86;
      double v87 = v13 / width;
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v20), @"leftEyeX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v114 * (v15 / height)), @"leftEyeY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v24), @"rightEyeX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v118 * (v15 / height)), @"rightEyeY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * ((v117 + v31) * 0.5)), @"mouthCenterX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 + (v121 + v115) * -0.5 * (v15 / height)), @"mouthCenterY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v116), @"noseBridgeX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v120 * (v15 / height)), @"noseBridgeY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v119), @"noseTipX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v123 * (v15 / height)), @"noseTipY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v122), @"leftEyeLeftX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v125 * (v15 / height)), @"leftEyeLeftY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v124), @"leftEyelidNWX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v127 * (v15 / height)), @"leftEyelidNWY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v126), @"leftEyelidUpperX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v129 * (v15 / height)), @"leftEyelidUpperY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v128), @"leftEyelidNEX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v131 * (v15 / height)), @"leftEyelidNEY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v130), @"leftEyeRightX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v133 * (v15 / height)), @"leftEyeRightY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v132), @"leftEyelidSEX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v135 * (v15 / height)), @"leftEyelidSEY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v134), @"leftEyelidLowerX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v137 * (v15 / height)), @"leftEyelidLowerY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v136), @"leftEyelidSWX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v139 * (v15 / height)), @"leftEyelidSWY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v138), @"rightEyeLeftX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v141 * (v15 / height)), @"rightEyeLeftY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v140), @"rightEyelidNWX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v143 * (v15 / height)), @"rightEyelidNWY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v142), @"rightEyelidUpperX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v145 * (v15 / height)), @"rightEyelidUpperY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v144), @"rightEyelidNEX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v147 * (v15 / height)), @"rightEyelidNEY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v146), @"rightEyeRightX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v149 * (v15 / height)), @"rightEyeRightY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v148), @"rightEyelidSEX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v151 * (v15 / height)), @"rightEyelidSEY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v150), @"rightEyelidLowerX");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v16 - v153 * (v15 / height)), @"rightEyelidLowerY");
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v87 * v152), @"rightEyelidSWX");
      uint64_t v88 = [NSNumber numberWithDouble:v16 - v154 * (v15 / height)];
      BOOL v89 = v10;
LABEL_8:
      [v89 setObject:v88 forKeyedSubscript:@"rightEyelidSWY"];
      return v10;
    }
    if ([a3 hasLeftEyePosition])
    {
      v90 = NSNumber;
      [a3 leftEyePosition];
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v90, "numberWithDouble:"), @"leftEyeX");
      int v91 = NSNumber;
      [a3 leftEyePosition];
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v91, "numberWithDouble:", v16 - v92), @"leftEyeY");
    }
    if ([a3 hasRightEyePosition])
    {
      float v93 = NSNumber;
      [a3 rightEyePosition];
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v93, "numberWithDouble:"), @"rightEyeX");
      double v94 = NSNumber;
      [a3 rightEyePosition];
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v94, "numberWithDouble:", v16 - v95), @"rightEyeY");
    }
    if ([a3 hasMouthPosition])
    {
      double v96 = NSNumber;
      [a3 mouthPosition];
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v96, "numberWithDouble:"), @"mouthCenterX");
      unsigned int v97 = NSNumber;
      [a3 mouthPosition];
      double v99 = v16 - v98;
      uint64_t v100 = v97;
LABEL_28:
      objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v100, "numberWithDouble:", v99), @"mouthCenterY");
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([a3 objectForKeyedSubscript:@"leftEyeX"])
      {
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeX"), @"leftEyeX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeY"), @"leftEyeY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeX"), @"rightEyeX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeY"), @"rightEyeY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"mouthCenterX"), @"mouthCenterX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"mouthCenterY"), @"mouthCenterY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"noseBridgeX"), @"noseBridgeX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"noseBridgeY"), @"noseBridgeY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"noseTipX"), @"noseTipX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"noseTipY"), @"noseTipY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeLeftX"), @"leftEyeLeftX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeLeftY"), @"leftEyeLeftY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidNWX"), @"leftEyelidNWX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidNWY"), @"leftEyelidNWY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidUpperX"), @"leftEyelidUpperX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidUpperY"), @"leftEyelidUpperY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidNEX"), @"leftEyelidNEX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidNEY"), @"leftEyelidNEY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeRightX"), @"leftEyeRightX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyeRightY"), @"leftEyeRightY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidSEX"), @"leftEyelidSEX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidSEY"), @"leftEyelidSEY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidLowerX"), @"leftEyelidLowerX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidLowerY"), @"leftEyelidLowerY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidSWX"), @"leftEyelidSWX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"leftEyelidSWY"), @"leftEyelidSWY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeLeftX"), @"rightEyeLeftX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeLeftY"), @"rightEyeLeftY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidNWX"), @"rightEyelidNWX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidNWY"), @"rightEyelidNWY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidUpperX"), @"rightEyelidUpperX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidUpperY"), @"rightEyelidUpperY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidNEX"), @"rightEyelidNEX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidNEY"), @"rightEyelidNEY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeRightX"), @"rightEyeRightX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyeRightY"), @"rightEyeRightY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidSEX"), @"rightEyelidSEX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidSEY"), @"rightEyelidSEY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidLowerX"), @"rightEyelidLowerX");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidLowerY"), @"rightEyelidLowerY");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"rightEyelidSWX"), @"rightEyelidSWX");
        uint64_t v88 = [a3 objectForKeyedSubscript:@"rightEyelidSWY"];
        BOOL v89 = v10;
        goto LABEL_8;
      }
      double v101 = (void *)[a3 valueForKey:@"leftEyePosition"];
      if (v101 || (double v101 = (void *)[a3 valueForKey:@"leftEye"]) != 0)
      {
        unsigned int v102 = NSNumber;
        [v101 X];
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v102, "numberWithDouble:"), @"leftEyeX");
        id v103 = NSNumber;
        [v101 Y];
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v103, "numberWithDouble:", v16 - v104), @"leftEyeY");
      }
      float64x2_t v105 = (void *)[a3 valueForKey:@"rightEyePosition"];
      if (v105 || (float64x2_t v105 = (void *)[a3 valueForKey:@"rightEye"]) != 0)
      {
        float64x2_t v106 = NSNumber;
        [v105 X];
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v106, "numberWithDouble:"), @"rightEyeX");
        float64x2_t v107 = NSNumber;
        [v105 Y];
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v107, "numberWithDouble:", v16 - v108), @"rightEyeY");
      }
      if ([a3 valueForKey:@"leftEyeTouchSize"]) {
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(a3, "valueForKey:", @"leftEyeTouchSize"), @"leftEyeSize");
      }
      if ([a3 valueForKey:@"rightEyeTouchSize"]) {
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(a3, "valueForKey:", @"rightEyeTouchSize"), @"rightEyeSize");
      }
      long long v109 = (void *)[a3 valueForKey:@"mouthPosition"];
      if (v109 || (long long v109 = (void *)[a3 valueForKey:@"mouthCenter"]) != 0)
      {
        long long v110 = NSNumber;
        [v109 X];
        objc_msgSend(v10, "setValue:forKey:", objc_msgSend(v110, "numberWithDouble:"), @"mouthCenterX");
        long long v111 = NSNumber;
        [v109 Y];
        double v99 = v16 - v112;
        uint64_t v100 = v111;
        goto LABEL_28;
      }
    }
  }
  return v10;
}

- (CGAffineTransform)inverseImageTransformForOrientation:(SEL)a3
{
  [(CIImage *)self extent];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  if (a4 < 5)
  {
    uint64_t v14 = v7;
  }
  else
  {
    [(CIImage *)self extent];
    uint64_t v14 = v13;
    [(CIImage *)self extent];
    uint64_t v8 = v15;
  }
  uint64_t v16 = v10;
  uint64_t v17 = v12;
  uint64_t v18 = v14;
  orientationTransform(*(CGRect *)(&v8 - 3), a4, &v20);
  return CGAffineTransformInvert(retstr, &v20);
}

- (id)_autoRedEyeFilterWithFeatures:(id)a3 imageProperties:(id)a4 context:(id)a5 options:(id)a6
{
  v85[1] = *MEMORY[0x1E4F143B8];
  int v11 = CI_EDIT_RED_EYE_VERSION();
  uint64_t v12 = (void *)[a6 valueForKey:@"CIDetectorImageOrientation"];
  if (v12) {
    uint64_t v13 = [v12 intValue];
  }
  else {
    uint64_t v13 = 1;
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v76 = 0u;
  [(CIImage *)self extent];
  orientationTransform(v86, v13, &v76);
  uint64_t v14 = self;
  uint64_t v15 = self;
  if (v11 >= 2)
  {
    uint64_t v14 = self;
    if ([a6 objectForKeyedSubscript:@"fullSizeImage"]) {
      uint64_t v14 = (CIImage *)[a6 objectForKeyedSubscript:@"fullSizeImage"];
    }
    if (v13 == 1)
    {
      uint64_t v15 = self;
    }
    else
    {
      uint64_t v14 = [(CIImage *)v14 imageByApplyingOrientation:v13];
      uint64_t v15 = [(CIImage *)self imageByApplyingOrientation:v13];
    }
  }
  int v70 = v11;
  if (!a5) {
    a5 = +[CIContext _singletonContext];
  }
  uint64_t v16 = (void *)[a4 valueForKey:*MEMORY[0x1E4F2FD40]];
  uint64_t v17 = [v16 valueForKey:*MEMORY[0x1E4F2FD68]];
  uint64_t v18 = (void *)[a4 valueForKey:*MEMORY[0x1E4F2F800]];
  double v19 = (void *)[v18 valueForKey:*MEMORY[0x1E4F2F838]];
  if (v19 && ([v19 intValue] & 1) == 0) {
    return 0;
  }
  unsigned int v67 = v13;
  if (!a3)
  {
    long long v84 = @"CIDetectorBetterEyeLocs";
    v85[0] = MEMORY[0x1E4F1CC38];
    CGAffineTransform v20 = +[CIDetector detectorOfType:context:options:](CIDetector, "detectorOfType:context:options:", @"CIDetectorTypeFace", a5, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1]);
    uint64_t v21 = [a6 valueForKey:@"CIDetectorImageOrientation"];
    if (v21)
    {
      double v82 = @"CIDetectorImageOrientation";
      uint64_t v83 = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    }
    else
    {
      uint64_t v22 = 0;
    }
    a3 = [(CIDetector *)v20 featuresInImage:v15 options:v22];
  }
  id v68 = a5;
  uint64_t v69 = v17;
  id v23 = a6;
  double v24 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v25 = [a3 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v73 != v27) {
          objc_enumerationMutation(a3);
        }
        uint64_t v29 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        [(CIImage *)v15 extent];
        v71[0] = v76;
        v71[1] = v77;
        v71[2] = v78;
        objc_msgSend(v24, "addObject:", -[CIImage _dictForFeature:invOrientationTransform:extent:](v14, "_dictForFeature:invOrientationTransform:extent:", v29, v71));
      }
      uint64_t v26 = [a3 countByEnumeratingWithState:&v72 objects:v81 count:16];
    }
    while (v26);
  }
  if (![v24 count]) {
    return 0;
  }
  [(CIImage *)v14 extent];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  id v66 = v23;
  if ([a3 count])
  {
    [a3 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    long long v39 = (void *)[a3 objectAtIndexedSubscript:0];
    double v40 = v68;
    if (isKindOfClass)
    {
      uint64_t v41 = v69;
      if (![v39 landmarks])
      {
LABEL_36:
        int v70 = 1;
        goto LABEL_37;
      }
    }
    else
    {
      objc_opt_class();
      uint64_t v41 = v69;
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", @"leftEyeX"))
      {
        goto LABEL_36;
      }
    }
    if (v70 == 3)
    {
      long long v42 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v66];
      v80[0] = [NSNumber numberWithDouble:v31];
      v80[1] = [NSNumber numberWithDouble:v33];
      v80[2] = [NSNumber numberWithDouble:v35];
      v80[3] = [NSNumber numberWithDouble:v37];
      objc_msgSend(v42, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v80, 4), @"imageExtent");
      +[CIRedEyeRepair3 supportRectangleWithFaceArray:v24 options:v42];
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      int v70 = 3;
      int v51 = 1;
      goto LABEL_38;
    }
  }
  else
  {
    int v70 = 1;
    double v40 = v68;
    uint64_t v41 = v69;
  }
LABEL_37:
  +[CIRedEyeRepair supportRectangleWithFaceArray:imageSize:](CIRedEyeRepair, "supportRectangleWithFaceArray:imageSize:", v24, v35, v37);
  double v44 = v52;
  double v46 = v53;
  double v48 = v54;
  double v50 = v55;
  int v51 = 0;
LABEL_38:
  size_t v56 = vcvtd_n_u64_f64(ceil(v48), 2uLL);
  long long v57 = malloc_type_calloc(v56, vcvtpd_u64_f64(v50), 0x85FC1C59uLL);
  double v58 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
  double v59 = &kCIFormatBGRA8;
  if (v70 <= 1) {
    double v59 = &kCIFormatRGBA8;
  }
  objc_msgSend(v40, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v14, v57, v56, *v59, v58, v44, v46, v48, v50);
  CGColorSpaceRelease(v58);
  if (v51)
  {
    long long v60 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v66];
    v79[0] = [NSNumber numberWithDouble:v31];
    v79[1] = [NSNumber numberWithDouble:v33];
    v79[2] = [NSNumber numberWithDouble:v35];
    v79[3] = [NSNumber numberWithDouble:v37];
    objc_msgSend(v60, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v79, 4), @"imageExtent");
    objc_msgSend(v60, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v67), @"orientation");
    double v61 = -[CIRedEyeRepair3 initWithExternalBuffer:subRectangle:rowBytes:options:]([CIRedEyeRepair3 alloc], "initWithExternalBuffer:subRectangle:rowBytes:options:", v57, v56, v60, v44, v46, v48, v50);
  }
  else
  {
    double v61 = -[CIRedEyeRepair initWithExternalBuffer:subRectangle:fullSize:rowBytes:cameraModel:]([CIRedEyeRepair alloc], "initWithExternalBuffer:subRectangle:fullSize:rowBytes:cameraModel:", v57, v56, v41, v44, v46, v48, v50, v35, v37);
  }
  double v62 = v61;
  [(CIRedEyeRepair3 *)v61 autoRepairWithFaceArray:v24];
  id v63 = [(CIRedEyeRepair3 *)v62 repairArray];

  if (v57) {
    free(v57);
  }
  if (![v63 count]) {
    return 0;
  }
  double v64 = +[CIFilter filterWithName:@"CIRedEyeCorrections"];
  [(CIFilter *)v64 setValue:self forKey:@"inputImage"];
  [(CIFilter *)v64 setValue:v41 forKey:@"inputCameraModel"];
  [(CIFilter *)v64 setValue:v63 forKey:@"inputCorrectionInfo"];
  return v64;
}

- (id)autoRedEyeFilterWithFeatures:(id)a3 imageProperties:(id)a4 options:(id)a5
{
  if (a3) {
    return [(CIImage *)self _autoRedEyeFilterWithFeatures:a3 imageProperties:a4 context:0 options:a5];
  }
  else {
    return 0;
  }
}

- (id)autoRedEyeFilterWithFeatures:(id)a3 options:(id)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v7 = [(CIImage *)self properties];

  return [(CIImage *)self _autoRedEyeFilterWithFeatures:a3 imageProperties:v7 context:0 options:a4];
}

- (CGPoint)calcIntersection:(CGPoint)a3 slope1:(CGPoint)a4 pt2:(CGPoint)a5 slope2:(CGPoint)a6
{
  CGFloat v6 = ((a5.y - a3.y) * a6.x - (a5.x - a3.x) * a6.y) / (a6.x * a4.y - a4.x * a6.y);
  double v7 = a3.x + v6 * a4.x;
  double v8 = a3.y + v6 * a4.y;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (id)getAutoRotateFilter:(id)a3 ciImage:(id)a4 inputRect:(CGRect)a5 rotateCropRect:(CGRect *)a6 minTiltAngle:(float)a7 maxTiltAngle:(float)a8 detectVerticalLines:(BOOL)a9 thrVertAngle:(float)a10 thrDomAngleDiff:(float)a11
{
  BOOL v12 = a9;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  [a4 extent];
  double v24 = v23;
  [a4 extent];
  uint64_t v25 = (CGImage *)objc_msgSend(a3, "createCGImage:fromRect:", a4, 0.0, 0.0, v24);
  double v26 = width;
  *(float *)&double v27 = a7;
  *(float *)&double v28 = a8;
  *(float *)&double v29 = a10;
  *(float *)&double v30 = a11;
  id v31 = -[CIImage autoRotateFilterFFT:image:inputRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:](self, "autoRotateFilterFFT:image:inputRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:", a3, v25, v12, x, y, width, height, v27, v28, v29, v30);
  CGImageRelease(v25);
  if (!v31) {
    return v31;
  }
  if ([v31 _isIdentity]) {
    return 0;
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v81 = 0u;
  uint64_t v32 = [v31 valueForKey:@"inputTransform"];
  if (v32)
  {
    double v33 = (void *)v32;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v34 = (const char *)[v33 objCType];
      if (!strcmp(v34, "{CGAffineTransform=dddddd}") || !strcmp(v34, "{?=dddddd}")) {
        [v33 getValue:&v81 size:48];
      }
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v33 count] == 6)
      {
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 0), "doubleValue");
        *(void *)&long long v81 = v67;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 1), "doubleValue");
        *((void *)&v81 + 1) = v68;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 2), "doubleValue");
        *(void *)&long long v82 = v69;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 3), "doubleValue");
        *((void *)&v82 + 1) = v70;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 4), "doubleValue");
        *(void *)&long long v83 = v71;
        objc_msgSend((id)objc_msgSend(v33, "objectAtIndex:", 5), "doubleValue");
        *((void *)&v83 + 1) = v72;
      }
      goto LABEL_13;
    }
    long long v85 = 0u;
    long long v86 = 0u;
    long long v84 = 0u;
    [v33 transformStruct];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v36 = 0u;
  }
  else
  {
    long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v81 = *MEMORY[0x1E4F1DAB8];
    long long v82 = v35;
    long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  long long v83 = v36;
LABEL_13:
  double v37 = *(double *)&v83 + *(double *)&v82 * 0.0 + *(double *)&v81 * 0.0;
  double v38 = *((double *)&v82 + 1) * 0.0 + *((double *)&v81 + 1) * 0.0;
  double v39 = *((double *)&v83 + 1) + v38;
  double v40 = *((double *)&v83 + 1)
      + *((double *)&v82 + 1) * 0.0
      + *((double *)&v81 + 1) * width
      - (*((double *)&v83 + 1)
       + v38);
  double v41 = *(double *)&v83 + height * *(double *)&v82 + *(double *)&v81 * 0.0 - v37;
  double v77 = *(double *)&v83 + *(double *)&v82 * 0.0 + *(double *)&v81 * width - v37;
  double v80 = *((double *)&v83 + 1)
      + height * *((double *)&v82 + 1)
      + *((double *)&v81 + 1) * 0.0
      - (*((double *)&v83 + 1)
       + v38);
  double v42 = width * 0.5;
  double v43 = height * 0.5;
  double v44 = height * -0.5;
  double v45 = v26 * -0.5;
  -[CIImage calcIntersection:slope1:pt2:slope2:](self, "calcIntersection:slope1:pt2:slope2:", v42, v43, v42, v44, v37, *((double *)&v83 + 1) + v38);
  double v75 = v47;
  double v76 = v46;
  -[CIImage calcIntersection:slope1:pt2:slope2:](self, "calcIntersection:slope1:pt2:slope2:", v42, v43, v42, v44, v37, v39, v41, v80);
  double v73 = v49;
  double v74 = v48;
  -[CIImage calcIntersection:slope1:pt2:slope2:](self, "calcIntersection:slope1:pt2:slope2:", v42, v43, v45, v44, v37, v39, v77, v40);
  double v78 = v50;
  double v52 = v51;
  -[CIImage calcIntersection:slope1:pt2:slope2:](self, "calcIntersection:slope1:pt2:slope2:", v42, v43, v45, v44, v37, v39, v41, v80);
  if (a6)
  {
    double v55 = (v52 - v43) * (v52 - v43) + (v78 - v42) * (v78 - v42);
    double v56 = (v73 - v43) * (v73 - v43) + (v74 - v42) * (v74 - v42);
    double v57 = (v75 - v43) * (v75 - v43) + (v76 - v42) * (v76 - v42);
    BOOL v58 = v56 < v57;
    if (v56 < v57)
    {
      double v59 = v73;
    }
    else
    {
      double v56 = (v75 - v43) * (v75 - v43) + (v76 - v42) * (v76 - v42);
      double v59 = v75;
    }
    if (v58) {
      double v60 = v74;
    }
    else {
      double v60 = v76;
    }
    BOOL v61 = v55 < v56;
    if (v55 < v56)
    {
      double v62 = v52;
    }
    else
    {
      double v55 = v56;
      double v62 = v59;
    }
    if (v61) {
      double v63 = v78;
    }
    else {
      double v63 = v60;
    }
    if ((v54 - v43) * (v54 - v43) + (v53 - v42) * (v53 - v42) >= v55)
    {
      double v54 = v62;
      double v53 = v63;
    }
    double v64 = vabdd_f64(v54, v43);
    double v65 = vabdd_f64(v53, v42);
    a6->origin.double x = v42 - v65;
    a6->origin.double y = v43 - v64;
    a6->size.double width = v65 + v65;
    a6->size.double height = v64 + v64;
  }
  return v31;
}

- (id)autoRotateFilterFFT:(id)a3 image:(CGImage *)a4 inputRect:(CGRect)a5 minTiltAngle:(float)a6 maxTiltAngle:(float)a7 detectVerticalLines:(BOOL)a8 thrVertAngle:(float)a9 thrDomAngleDiff:(float)a10
{
  BOOL v10 = a8;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  double v23 = [(CIImage *)self properties];
  double v144 = width;
  double v145 = height;
  float v148 = a6;
  if (v23)
  {
    acLog("autoRotateFilterFFT: props exist\n", v16, v17, v18, v19, v20, v21, v22, v136);
    id v24 = [(NSDictionary *)v23 objectForKey:*MEMORY[0x1E4F2FCA0]];
    if (v24) {
      int v32 = [v24 intValue];
    }
    else {
      int v32 = 0;
    }
    acLog("Orientation = %d\n", v25, v26, v27, v28, v29, v30, v31, v32);
    id v35 = [(NSDictionary *)v23 objectForKey:*MEMORY[0x1E4F2FC20]];
    float v43 = 0.0;
    float v44 = 0.0;
    float v45 = 0.0;
    float v46 = 0.0;
    if (v35)
    {
      double v47 = (void *)[v35 objectForKey:kMakerNoteProperty_AccelerationVector];
      acLog("  Found makerNotes\n", v48, v49, v50, v51, v52, v53, v54, v137);
      if (v47)
      {
        objc_msgSend((id)objc_msgSend(v47, "objectAtIndex:", 0), "floatValue");
        float v46 = v55;
        objc_msgSend((id)objc_msgSend(v47, "objectAtIndex:", 1), "floatValue");
        float v44 = v56;
        objc_msgSend((id)objc_msgSend(v47, "objectAtIndex:", 2), "floatValue");
        float v45 = v57;
        double v138 = v46;
        acLog("    Found vector: %.3f,%.3f,%.3f\n", v58, v59, v60, v61, v62, v63, v64, SLOBYTE(v138));
      }
    }
    double v139 = v46;
    acLog("acc = (%.5f, %.5f, %.5f)\n", v36, v37, v38, v39, v40, v41, v42, SLOBYTE(v139));
    float v65 = (float)(v44 * v44) + (float)(v46 * v46);
    float v34 = atan2f(v45, sqrtf(v65));
    float v33 = sqrtf(v65 + (float)(v45 * v45)) + -1.0;
    float v73 = atan2f(v44, v46);
    switch(v32)
    {
      case 1:
        float v43 = flt_1939542E8[v73 < 0.0];
        goto LABEL_13;
      case 3:
        goto LABEL_13;
      case 6:
        float v43 = 1.5708;
        goto LABEL_13;
      case 8:
        float v43 = -1.5708;
LABEL_13:
        float v74 = (float)((float)(v73 + v43) * -180.0) / 3.14159265;
        float v143 = v74;
        double v75 = v74;
        acLog("accelTilt = %.3f deg, accelPitch = %.3f deg, accMagnitudeDev %.3f\n", v66, v67, v68, v69, v70, v71, v72, SLOBYTE(v75));
        LODWORD(v23) = 1;
        break;
      default:
        float v110 = (float)((float)(v73 + 0.0) * -180.0) / 3.14159265;
        float v143 = v110;
        double v111 = (float)(v34 * 180.0) / 3.14159265;
        acLog("accelPitch = %.3f deg, accelMagnitudeDev = %.3f\n", v66, v67, v68, v69, v70, v71, v72, SLOBYTE(v111));
        LODWORD(v23) = 0;
        break;
    }
  }
  else
  {
    float v33 = 0.0;
    float v143 = 0.0;
    float v34 = 0.0;
  }
  float CFPreferenceFloat = getCFPreferenceFloat(@"MaxAccelPitch", @"com.apple.mobileslideshow", 25.0);
  float v77 = getCFPreferenceFloat(@"MaxPixelTilt", @"com.apple.mobileslideshow", 10.0);
  float v78 = getCFPreferenceFloat(@"MinPixelTilt", @"com.apple.mobileslideshow", 1.0);
  float v79 = getCFPreferenceFloat(@"MaxAccelMagDev", @"com.apple.mobileslideshow", 0.03);
  float v87 = getCFPreferenceFloat(@"MaxAccelFFTDiff", @"com.apple.mobileslideshow", 5.0);
  if (a7 == -1.0) {
    float v88 = v77;
  }
  else {
    float v88 = a7;
  }
  if (v148 == -1.0) {
    float v89 = v78;
  }
  else {
    float v89 = v148;
  }
  double v90 = CFPreferenceFloat;
  double v91 = v88;
  double v92 = v89;
  double v142 = v79;
  double v141 = v89;
  acLog("MaxPitch = %.3f, MaxPixelTilt = %.3f, MinPixelTilt = %.3f, MaxAccelMagDev = %.3f, MaxAccelFFTDifff = %.3f\n", v80, v81, v82, v83, v84, v85, v86, SLOBYTE(v90));
  if (fabsf(v33) <= v79) {
    int v93 = (int)v23;
  }
  else {
    int v93 = 0;
  }
  float v94 = v90 * 3.14159265 / 180.0;
  if (fabsf(v34) > v94) {
    return 0;
  }
  double v95 = (double)CGImageGetWidth(a4);
  size_t v96 = CGImageGetHeight(a4);
  float v97 = (float)v96;
  float v98 = v95;
  if (v95 > (double)v96) {
    uint64_t v99 = (int)(float)((float)((float)(v98 / v97) * 256.0) + 0.5);
  }
  else {
    uint64_t v99 = 256;
  }
  if (v95 > (double)v96) {
    uint64_t v100 = 256;
  }
  else {
    uint64_t v100 = (int)(float)((float)((float)(v97 / v98) * 256.0) + 0.5);
  }
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  int v102 = (4 * v99 + 60) & 0xFFFFFFC0;
  id v103 = malloc_type_malloc(v102 * (int)v100, 0xCC9713CDuLL);
  double v104 = CGBitmapContextCreate(v103, (int)v99, (int)v100, 8uLL, v102, DeviceRGB, 5u);
  CGContextSetInterpolationQuality(v104, kCGInterpolationHigh);
  v154.size.CGFloat width = (double)(int)v99;
  v154.size.CGFloat height = (double)(int)v100;
  v154.origin.double x = 0.0;
  v154.origin.double y = 0.0;
  CGContextDrawImage(v104, v154, a4);
  CGContextRelease(v104);
  CGColorSpaceRelease(DeviceRGB);
  float v151 = 0.0;
  if (v10)
  {
    if (a10 == -1.0) {
      float v105 = 0.17453;
    }
    else {
      float v105 = a10 * 3.14159265 / 180.0;
    }
    v150.a = 0.0;
    *(void *)&v150.b = &v150;
    *(void *)&v150.c = 0x2020000000;
    double v112 = (uint64_t (*)(void *, void, uint64_t, uint64_t, uint64_t, uint64_t, CGAffineTransform *, float))gethorizonDetectionFFTAnglesSymbolLoc_ptr;
    *(void *)&v150.d = gethorizonDetectionFFTAnglesSymbolLoc_ptr;
    if (!gethorizonDetectionFFTAnglesSymbolLoc_ptr)
    {
      *(void *)&v152.a = MEMORY[0x1E4F143A8];
      *(void *)&v152.b = 3221225472;
      *(void *)&v152.c = __gethorizonDetectionFFTAnglesSymbolLoc_block_invoke;
      *(void *)&v152.d = &unk_1E57710B8;
      *(void *)&v152.tdouble x = &v150;
      long long v113 = (void *)VisionLibrary();
      double v114 = dlsym(v113, "horizonDetectionFFTAngles");
      *(void *)(*(void *)(*(void *)&v152.tx + 8) + 24) = v114;
      gethorizonDetectionFFTAnglesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v152.tx + 8) + 24);
      double v112 = *(uint64_t (**)(void *, void, uint64_t, uint64_t, uint64_t, uint64_t, CGAffineTransform *, float))(*(void *)&v150.b + 24);
    }
    _Block_object_dispose(&v150, 8);
    if (!v112) {
      -[CIImage(AutoAdjustCrop) autoRotateFilterFFT:image:inputRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:]();
    }
    int v115 = v112(v103, (4 * v99 + 60) & 0xFFFFFFC0, v99, v100, 1, 5, &v152, v105);
    float v109 = *(float *)&v152.a;
    float v151 = *(float *)&v152.a;
    if (a9 == -1.0)
    {
      double v117 = 0.0349065848;
    }
    else
    {
      float v116 = a9 * 3.14159265 / 180.0;
      double v117 = v116;
    }
    if (v115 >= 1)
    {
      uint64_t v118 = v115;
      double v119 = (float *)&v152.a + 1;
      while (*v119 <= 0.1 || fabs(fabsf(*(v119 - 1)) + -1.57079637) >= v117)
      {
        v119 += 2;
        if (!--v118) {
          goto LABEL_52;
        }
      }
      float v151 = 0.0;
      float v109 = 0.0;
    }
LABEL_52:
    double v120 = v109;
    double v121 = fabs(v109);
    if (v121 <= 2.35619449)
    {
      if (v121 < 0.785398163) {
        goto LABEL_57;
      }
      double v122 = v120 + 1.57079633;
    }
    else
    {
      double v122 = v120 + 3.14159265;
    }
    float v109 = v122;
    float v151 = v109;
  }
  else
  {
    v150.a = 0.0;
    *(void *)&v150.b = &v150;
    *(void *)&v150.c = 0x2020000000;
    float64x2_t v106 = (void (*)(void *, void, uint64_t, uint64_t, float *, uint64_t))gethorizonDetectionFFTSymbolLoc_ptr;
    *(void *)&v150.d = gethorizonDetectionFFTSymbolLoc_ptr;
    if (!gethorizonDetectionFFTSymbolLoc_ptr)
    {
      *(void *)&v152.a = MEMORY[0x1E4F143A8];
      *(void *)&v152.b = 3221225472;
      *(void *)&v152.c = __gethorizonDetectionFFTSymbolLoc_block_invoke;
      *(void *)&v152.d = &unk_1E57710B8;
      *(void *)&v152.tdouble x = &v150;
      float64x2_t v107 = (void *)VisionLibrary();
      double v108 = dlsym(v107, "horizonDetectionFFT");
      *(void *)(*(void *)(*(void *)&v152.tx + 8) + 24) = v108;
      gethorizonDetectionFFTSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&v152.tx + 8) + 24);
      float64x2_t v106 = *(void (**)(void *, void, uint64_t, uint64_t, float *, uint64_t))(*(void *)&v150.b + 24);
    }
    _Block_object_dispose(&v150, 8);
    if (!v106) {
      -[CIImage(AutoAdjustCrop) autoRotateFilterFFT:image:inputRect:minTiltAngle:maxTiltAngle:detectVerticalLines:thrVertAngle:thrDomAngleDiff:]();
    }
    v106(v103, (4 * v99 + 60) & 0xFFFFFFC0, v99, v100, &v151, 1);
    float v109 = v151;
  }
LABEL_57:
  free(v103);
  double v140 = (float)(v109 * 180.0) / 3.14159265;
  acLog("FFT detected angle = %.3f deg\n", v123, v124, v125, v126, v127, v128, v129, SLOBYTE(v140));
  float v131 = v92 * 3.14159265 / 180.0;
  float v132 = v151;
  float v133 = fabsf(v151);
  if (v133 >= v131)
  {
    float v130 = v91 * 3.14159265 / 180.0;
    BOOL v134 = v133 > v130;
  }
  else
  {
    BOOL v134 = 1;
  }
  if (v134 || v93 && vabds_f32((float)(v151 * 180.0) / 3.1416, v143) > v87) {
    return 0;
  }
  memset(&v152, 0, sizeof(v152));
  CGAffineTransformMakeTranslation(&v152, v144 * 0.5, v145 * 0.5);
  CGAffineTransform v149 = v152;
  CGAffineTransformRotate(&v150, &v149, v132);
  CGAffineTransform v152 = v150;
  CGAffineTransform v149 = v150;
  CGAffineTransformTranslate(&v150, &v149, v144 * -0.5, v145 * -0.5);
  CGAffineTransform v152 = v150;
  return +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIAffineTransform", @"inputTransform", [MEMORY[0x1E4F29238] valueWithBytes:&v152 objCType:"{CGAffineTransform=dddddd}"], 0, *(void *)&v141, *(void *)&v142, v87);
}

- (void)getAutocropRect:(id)a3 rotateXfrm:(CGAffineTransform *)a4 inputImageRect:(CGRect)a5 clipRect:(CGRect *)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  char v11 = objc_msgSend(a3, "count", a5.origin.x, a5.origin.y);
  acLog("Crop: Based on %d features\n", v12, v13, v14, v15, v16, v17, v18, v11);
  if ([a3 count])
  {
    double v96 = width;
    double v97 = height;
    double x = a6->origin.x;
    double y = a6->origin.y;
    double v21 = a6->size.width;
    double v22 = a6->size.height;
    double v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
    double v98 = v21;
    double v99 = v22;
    if ([a3 count])
    {
      unint64_t v24 = 0;
      double v25 = x + v21;
      double v26 = y + v22;
      CGFloat v27 = 0.0;
      long long v102 = *MEMORY[0x1E4F1DAD8];
      CGSize v100 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      CGPoint v101 = (CGPoint)*MEMORY[0x1E4F1DB28];
      CGFloat v28 = 0.0;
      CGFloat v29 = 0.0;
      CGFloat v30 = 0.0;
      do
      {
        uint64_t v31 = (void *)[a3 objectAtIndex:v24];
        long long v105 = v102;
        *(_OWORD *)float64x2_t v106 = v102;
        v104.origin = v101;
        v104.size = v100;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v32 = (void *)[v31 objectForKey:@"bounds"];
          if (v32) {
            [v32 getValue:&v104];
          }
          float v33 = (void *)[v31 objectForKey:@"leftEyePosition"];
          int v34 = v33 != 0;
          if (v33) {
            [v33 getValue:v106];
          }
          id v35 = (void *)[v31 objectForKey:@"rightEyePosition"];
          if (v35)
          {
            [v35 getValue:&v105];
            int v36 = 1;
          }
          else
          {
            int v36 = 0;
          }
        }
        else
        {
          [v31 bounds];
          v104.origin.double x = v37;
          v104.origin.double y = v38;
          v104.size.CGFloat width = v39;
          v104.size.CGFloat height = v40;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v34 = [v31 hasLeftEyePosition];
            int v36 = [v31 hasRightEyePosition];
            [v31 leftEyePosition];
            v106[0] = v41;
            v106[1] = v42;
            [v31 rightEyePosition];
            *(void *)&long long v105 = v43;
            *((void *)&v105 + 1) = v44;
          }
          else
          {
            int v36 = 0;
            int v34 = 0;
          }
        }
        long long v45 = *(_OWORD *)&a4->c;
        *(_OWORD *)&v103.double a = *(_OWORD *)&a4->a;
        *(_OWORD *)&v103.double c = v45;
        *(_OWORD *)&v103.tdouble x = *(_OWORD *)&a4->tx;
        CGRect v107 = CGRectApplyAffineTransform(v104, &v103);
        CGRect v104 = v107;
        if (v34 && v36)
        {
          double a = a4->a;
          double b = a4->b;
          double c = a4->c;
          double d = a4->d;
          tdouble x = a4->tx;
          tdouble y = a4->ty;
          double v59 = ty + v106[1] * d + b * v106[0];
          v106[0] = tx + v106[1] * c + a4->a * v106[0];
          v106[1] = v59;
          double v60 = ty + d * *((double *)&v105 + 1) + b * *(double *)&v105;
          *(double *)&long long v105 = tx + c * *((double *)&v105 + 1) + a * *(double *)&v105;
          *((double *)&v105 + 1) = v60;
          acLog("  feature%d has left eye at (%.3f,%.3f), right eye at (%.3f,%.3f)\n", v46, v47, v48, v49, v50, v51, v52, v24);
          double v61 = (v106[0] + *(double *)&v105) * 0.5;
          double v62 = (v106[1] + *((double *)&v105 + 1)) * 0.5;
          double v63 = v61 - v104.origin.x;
          if (v61 - v104.origin.x <= v104.origin.x + v104.size.width - v61) {
            double v63 = v104.origin.x + v104.size.width - v61;
          }
          float v64 = v63;
          double v65 = v104.origin.y + v104.size.height - v62;
          if (v62 - v104.origin.y > v65) {
            double v65 = v62 - v104.origin.y;
          }
          float v66 = v65;
          if (v61 - v64 < x)
          {
            float v67 = v61 - x;
            float v64 = v67;
          }
          if (v61 + v64 > v25)
          {
            float v68 = v25 - v61;
            float v64 = v68;
          }
          if (v62 - v66 < y)
          {
            float v69 = v62 - y;
            float v66 = v69;
          }
          if (v62 + v66 > v26) {
            float v66 = v26 - v62;
          }
          v107.origin.double x = v61 - v64;
          v107.origin.double y = v62 - v66;
          v104.size.CGFloat width = (float)(v64 + v64);
          v104.size.CGFloat height = (float)(v66 + v66);
        }
        v104.origin.double x = v107.origin.x - x;
        v104.origin.double y = v107.origin.y - y;
        objc_msgSend(v23, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v104, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
        if (v24)
        {
          v108.origin.double x = v27;
          v108.origin.double y = v28;
          v108.size.CGFloat width = v29;
          v108.size.CGFloat height = v30;
          CGRect v109 = CGRectUnion(v108, v104);
          CGFloat v27 = v109.origin.x;
          CGFloat v28 = v109.origin.y;
          CGFloat v29 = v109.size.width;
          CGFloat v30 = v109.size.height;
        }
        else
        {
          CGFloat v28 = v104.origin.y;
          CGFloat v27 = v104.origin.x;
          CGFloat v30 = v104.size.height;
          CGFloat v29 = v104.size.width;
        }
        ++v24;
      }
      while ([a3 count] > v24);
    }
    else
    {
      CGFloat v30 = 0.0;
      CGFloat v29 = 0.0;
      CGFloat v28 = 0.0;
      CGFloat v27 = 0.0;
    }
    uint64_t v70 = objc_alloc_init(AutoCropper);
    id v71 = [(AutoCropper *)v70 clusterRects:v23];
    memset(&v103, 0, 32);
    objc_msgSend((id)objc_msgSend(v71, "objectAtIndex:", 0), "getValue:", &v103);
    -[AutoCropper computeClippingWithinSize:forImportantRect:andType:restrictRect:](v70, "computeClippingWithinSize:forImportantRect:andType:restrictRect:", 0, v98, v99, v103.a, v103.b, v103.c, v103.d, *(void *)&v27, *(void *)&v28, *(void *)&v29, *(void *)&v30);
    a6->origin.double x = v72;
    a6->origin.double y = v73;
    a6->size.CGFloat width = v74;
    a6->size.CGFloat height = v75;
    float v76 = v96 * v97;
    *(float *)&CGFloat v72 = v74 * v75;
    double v77 = (float)((float)(*(float *)&v72 * 100.0) / v76);
    acLog("  clip overall %% = %.3f\n", v78, v79, v80, v81, v82, v83, v84, SLOBYTE(v77));
    double v92 = a6->size.width * a6->size.height;
    if (v92 >= (float)(v76 * 0.75))
    {
      if (v92 <= (float)(v76 * 0.99))
      {
        CGFloat v94 = y + a6->origin.y;
        a6->origin.double x = x + a6->origin.x;
        a6->origin.double y = v94;
        goto LABEL_42;
      }
      int v93 = "    too little clipping - reverting back\n";
    }
    else
    {
      int v93 = "    too much clipping - reverting back to rotated crop only\n";
    }
    acLog(v93, v85, v86, v87, v88, v89, v90, v91, v95);
    a6->origin.double x = x;
    a6->origin.double y = y;
    a6->size.CGFloat width = v98;
    a6->size.CGFloat height = v99;
LABEL_42:
  }
}

- (CIImage)imageWithExtent:(CGRect)a3 processorDescription:(id)a4 argumentDigest:(unint64_t)a5 inputFormat:(int)a6 outputFormat:(int)a7 options:(id)a8 roiCallback:(id)a9 processor:(id)a10
{
  uint64_t v11 = *(void *)&a7;
  uint64_t v12 = *(void *)&a6;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (CGRectIsEmpty(a3))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    if (a10)
    {
      if (kCIFormatAllowSRGB != v12) {
        LODWORD(v12) = CI::format_modernize(v12, (CI *)"-[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:]", v16);
      }
      if (!v12
        || v12 == 274
        || v12 == kCIFormatAllowSRGB
        || (CI::ProcessorImage::format_is_supported(v12, 1) & 1) != 0)
      {
        if (kCIFormatAllowSRGB == v11
          || (int v18 = CI::format_modernize(v11, (CI *)"-[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:]", v16)) == 0|| v18 == kCIFormatAllowSRGB|| (CI::ProcessorImage::format_is_supported(v18, 0) & 1) != 0)
        {
          if (!a5)
          {
            uint64_t v19 = ci_logger_performance();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CGAffineTransform buf = 136446466;
              uint64_t v49 = "-[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFo"
                    "rmat:options:roiCallback:processor:]";
              __int16 v50 = 2114;
              id v51 = a4;
              _os_log_impl(&dword_193671000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s argumentDigest is 0 which will prevent CoreImage from caching %{public}@ optimally.", buf, 0x16u);
            }
          }
          objc_msgSend((id)objc_msgSend(a8, "objectForKey:", @"kCIImageAlphaOne"), "BOOLValue");
          [(CIImage *)self _internalRepresentation];
          CGFloat v28 = (void *)[a8 objectForKeyedSubscript:@"kCIImageProcessorSynchronizeInputs"];
          if (v28) {
            [v28 BOOLValue];
          }
          CGFloat v29 = (void *)[a8 objectForKeyedSubscript:@"kCIImageProcessorAllowPartialOutputRegion"];
          if (v29) {
            [v29 BOOLValue];
          }
          CGFloat v30 = (void *)[a8 objectForKeyedSubscript:@"kCIImageProcessorAllowCompressedInputsAndOutputs"];
          if (v30) {
            [v30 BOOLValue];
          }
          uint64_t v31 = (void *)[a8 objectForKeyedSubscript:@"kCIImageProcessorCanOutputLossyCompressed"];
          if (v31) {
            [v31 BOOLValue];
          }
          operator new();
        }
        int v32 = ci_logger_api();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:](v32, v33, v34, v35, v36, v37, v38, v39);
        }
      }
      else
      {
        CGFloat v40 = ci_logger_api();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:](v40, v41, v42, v43, v44, v45, v46, v47);
        }
      }
    }
    else
    {
      uint64_t v20 = ci_logger_api();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[CIImage(CIImageProcessor) imageWithExtent:processorDescription:argumentDigest:inputFormat:outputFormat:options:roiCallback:processor:](v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    return 0;
  }
}

double *__136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor___block_invoke@<X0>(uint64_t a1@<X0>, double **a2@<X8>)
{
  double v3 = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  CGPoint result = (double *)operator new(0x20uLL);
  a2[1] = result + 4;
  a2[2] = result + 4;
  *CGPoint result = v3;
  *((void *)result + 1) = v5;
  *((void *)result + 2) = v7;
  *((void *)result + 3) = v9;
  *a2 = result;
  return result;
}

void __136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor___block_invoke_2(uint64_t a1, uint64_t **a2, long long **a3, void **a4, double **a5, _DWORD **a6, uint64_t a7, long long *a8, double a9, double a10, double a11, double a12, uint64_t a13, unsigned __int8 a14, uint64_t a15)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = [CIImageProcessorInput alloc];
  uint64_t v28 = **a2;
  long long v43 = **a3;
  CGFloat v29 = -[CIImageProcessorInput initWithSurface:texture:digest:allowSRGB:bounds:context:](v27, "initWithSurface:texture:digest:allowSRGB:bounds:context:", v28, &v43, **a4, **a6 & 1, a15, **a5, (*a5)[1], (*a5)[2], (*a5)[3]);
  long long v43 = 0uLL;
  CGFloat v30 = [CIImageProcessorOutput alloc];
  long long v42 = *a8;
  uint64_t v31 = -[CIImageProcessorInOut initWithSurface:texture:digest:allowSRGB:bounds:context:](v30, "initWithSurface:texture:digest:allowSRGB:bounds:context:", a7, &v42, a13, a14, a15, a9, a10, a11, a12);
  long long v42 = 0uLL;
  uint64_t v33 = (void *)MEMORY[0x199702DB0](v31, v32);
  uint64_t v34 = ci_signpost_log_render();
  os_signpost_id_t v35 = (*(uint64_t (**)(uint64_t))(*(void *)a15 + 272))(a15) << 32;
  if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    uint64_t v36 = *(void *)(a1 + 32);
    *(_DWORD *)CGAffineTransform buf = 138543362;
    uint64_t v46 = v36;
    _os_signpost_emit_with_name_impl(&dword_193671000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v35, "processor_process", "%{public}@", buf, 0xCu);
  }
  uint64_t v37 = (*(uint64_t (**)(uint64_t))(*(void *)a15 + 272))(a15);
  TimerBase::TimerBase((uint64_t)buf, v37, 0, (uint64_t)"processor_process", 0);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _ZZZ136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor__EUb_EN13SignpostTimerD1Ev((TimerBase *)buf);
  uint64_t v38 = ci_signpost_log_render();
  os_signpost_id_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)a15 + 272))(a15) << 32;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    uint64_t v40 = *(void *)(a1 + 32);
    *(_DWORD *)CGAffineTransform buf = 138543362;
    uint64_t v46 = v40;
    _os_signpost_emit_with_name_impl(&dword_193671000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v39, "processor_postprocess", "%{public}@", buf, 0xCu);
  }
  uint64_t v41 = (*(uint64_t (**)(uint64_t))(*(void *)a15 + 272))(a15);
  TimerBase::TimerBase((uint64_t)buf, v41, 0, (uint64_t)"processor_postprocess", 0);
  uint64_t v44 = v29;
  post_process((void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1], v31, a15);
  _ZZZ136__CIImage_CIImageProcessor__imageWithExtent_processorDescription_argumentDigest_inputFormat_outputFormat_options_roiCallback_processor__EUb_EN13SignpostTimerD1E_0v((TimerBase *)buf);
}

+ (CIImage)imageWithImageProvider:(id)a3 userInfo:(id)a4 size:(CGSize)a5 format:(int)a6 flipped:(BOOL)a7 colorSpace:(CGColorSpace *)a8
{
  uint64_t v8 = -[CIImage initWithImageProvider:userInfo:size:format:flipped:colorSpace:]([CIImage alloc], "initWithImageProvider:userInfo:size:format:flipped:colorSpace:", a3, a4, *(void *)&a6, a7, a8, a5.width, a5.height);

  return v8;
}

+ (CIImage)imageWithImageProvider:(id)p size:(size_t)width :(size_t)height format:(CIFormat)f colorSpace:(CGColorSpaceRef)cs options:(NSDictionary *)options
{
  uint64_t v8 = [[CIImage alloc] initWithImageProvider:p size:width :height format:*(void *)&f colorSpace:cs options:options];

  return v8;
}

- (CIImage)initWithImageProvider:(id)a3 userInfo:(id)a4 size:(CGSize)a5 format:(int)a6 flipped:(BOOL)a7 colorSpace:(CGColorSpace *)a8
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"user_info";
  v10[1] = @"CIImageFlipped";
  uint64_t v8 = MEMORY[0x1E4F1CC28];
  if (a7) {
    uint64_t v8 = MEMORY[0x1E4F1CC38];
  }
  v11[0] = a4;
  v11[1] = v8;
  return -[CIImage initWithImageProvider:size::format:colorSpace:options:](self, "initWithImageProvider:size::format:colorSpace:options:", a3, (unint64_t)a5.width, (unint64_t)a5.height, *(void *)&a6, a8, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2]);
}

- (CIImage)initWithImageProvider:(id)p size:(size_t)width :(size_t)height format:(CIFormat)f colorSpace:(CGColorSpaceRef)cs options:(NSDictionary *)options
{
  uint64_t v10 = *(void *)&f;
  NSSelectorFromString(&cfstr_Provideimageda.isa);
  if (objc_opt_respondsToSelector())
  {
    unsigned int v30 = CI::format_modernize(v10, (CI *)"-[CIImage(CIImageProvider) initWithImageProvider:size::format:colorSpace:options:]", v15);
    NSSelectorFromString(&cfstr_Provideimagete.isa);
    char v16 = objc_opt_respondsToSelector() ^ 1;
    id v17 = [(NSDictionary *)options objectForKey:@"user_info"];
    BOOL v18 = CI_LOG_IMAGE_PROVIDER() != 0;
    uint64_t v19 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:options];
    if (![(NSDictionary *)options objectForKey:@"kCIImageProviderName"])
    {
      uint64_t v20 = (objc_class *)objc_opt_class();
      [v19 setObject:NSStringFromClass(v20) forKey:@"kCIImageProviderName"];
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __82__CIImage_CIImageProvider__initWithImageProvider_size::format_colorSpace_options___block_invoke;
    v31[3] = &unk_1E5772328;
    BOOL v32 = v18;
    v31[6] = width;
    v31[7] = height;
    v31[4] = p;
    v31[5] = v17;
    return (CIImage *)[(CIImage *)self _initWithImageProvider:v31 width:width height:height format:v30 colorSpace:cs surfaceCache:v16 & 1 options:v19];
  }
  else
  {
    uint64_t v22 = ci_logger_api();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      [(CIImage(CIImageProvider) *)v22 initWithImageProvider:v24 size:v25 :v26 format:v27 colorSpace:v28 options:v29];
    }

    return 0;
  }
}

uint64_t __82__CIImage_CIImageProvider__initWithImageProvider_size::format_colorSpace_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [(id)objc_opt_class() description];
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v18 = *(void *)(a1 + 56);
      *(_DWORD *)CGAffineTransform buf = 138544642;
      uint64_t v21 = v15;
      __int16 v22 = 2048;
      uint64_t v23 = v16;
      __int16 v24 = 2048;
      uint64_t v25 = v17;
      __int16 v26 = 2048;
      uint64_t v27 = v18;
      __int16 v28 = 2048;
      uint64_t v29 = a4;
      __int16 v30 = 2048;
      uint64_t v31 = a5;
      _os_log_impl(&dword_193671000, v14, OS_LOG_TYPE_INFO, "CIImageProvider <%{public}@ %p> %zux%zu at %zu,%zu", buf, 0x3Eu);
    }
  }
  return [*(id *)(a1 + 32) provideImageData:a2 bytesPerRow:a3 origin:a4 :a5 size:a6 :a7 userInfo:*(void *)(a1 + 40)];
}

- (CIImage)initWithImageProvider:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7 options:(id)a8
{
  return (CIImage *)-[CIImage _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:](self, "_initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:", a3, a4, a5, CI::format_modernize(*(uint64_t *)&a6, (CI *)"-[CIImage(CIImageProvider) initWithImageProvider:width:height:format:colorSpace:options:]", (const char *)a3), a7, 1, a8);
}

- (id)_initWithImageProvider:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(int)a6 colorSpace:(CGColorSpace *)a7 surfaceCache:(BOOL)a8 options:(id)a9
{
  if (!a3 || !a4 || !a5)
  {

    return 0;
  }
  int v12 = CI::format_modernize(*(uint64_t *)&a6, (CI *)"-[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:]", (const char *)a3);
  if (CI::format_is_supported_source_provider(v12) && !CI::format_is_ycc_biplanar(v12))
  {
    if ([a9 objectForKey:@"CIImageFlipped"]) {
      objc_msgSend((id)objc_msgSend(a9, "objectForKey:", @"CIImageFlipped"), "BOOLValue");
    }
    if (!CI::format_has_unpremul_alpha(v12)) {
      CI::format_has_alpha(v12);
    }
    if ([a9 objectForKey:@"CIImagePremultiplied"]) {
      objc_msgSend((id)objc_msgSend(a9, "objectForKey:", @"CIImagePremultiplied"), "BOOLValue");
    }
    objc_msgSend((id)objc_msgSend(a9, "objectForKey:", @"kCIImageAlphaOne"), "BOOLValue");
    CI::format_is_ycc(v12);
    objc_msgSend((id)objc_msgSend(a9, "objectForKey:", @"CIImageEdgesAreClear"), "BOOLValue");
    if ((objc_msgSend((id)objc_msgSend(a9, "objectForKey:", @"CIImageClampToEdge"), "BOOLValue") & 1) == 0
      && objc_msgSend((id)objc_msgSend(a9, "objectForKey:", @"CIImageEdgeRepeat"), "BOOLValue"))
    {
      NSLog(&cfstr_CiimageKciimag.isa);
    }
    if ([a9 objectForKey:@"CIImageNearestSampling"]) {
      objc_msgSend((id)objc_msgSend(a9, "objectForKey:", @"CIImageNearestSampling"), "BOOLValue");
    }
    if ([a9 objectForKey:@"kCIImageCacheHint"])
    {
      objc_msgSend((id)objc_msgSend(a9, "objectForKey:", @"kCIImageCacheHint"), "BOOLValue");
      if (!a7) {
        goto LABEL_28;
      }
    }
    else if (!a7)
    {
      goto LABEL_28;
    }
    if ((CGColorSpace *)[MEMORY[0x1E4F1CA98] null] != a7) {
      CI_NO_CM();
    }
LABEL_28:
    [a9 objectForKey:@"CIImageProperties"];
    if (a4 <= 0x3FF) {
      unint64_t v22 = a4;
    }
    else {
      unint64_t v22 = 512;
    }
    if (a5 <= 0x3FF) {
      unint64_t v23 = a5;
    }
    else {
      unint64_t v23 = 512;
    }
    if ([a9 objectForKey:@"kCIImageProviderName"])
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
    long long v166 = 0uLL;
    uint64_t v167 = 0;
    __int16 v24 = (void *)[a9 objectForKey:@"tile_size"];
    unint64_t v25 = a4;
    unint64_t v26 = a5;
    if (v24)
    {
      if ([v24 isEqual:@"kCIImageProviderMaximumTileSize"])
      {
        if (max_safe_tile_size(void)::onceToken != -1) {
          dispatch_once(&max_safe_tile_size(void)::onceToken, &__block_literal_global_41);
        }
        if (max_safe_tile_size(void)::max_size >= a4) {
          unint64_t v25 = a4;
        }
        else {
          unint64_t v25 = max_safe_tile_size(void)::max_size;
        }
        if (max_safe_tile_size(void)::max_size >= a5) {
          unint64_t v26 = a5;
        }
        else {
          unint64_t v26 = max_safe_tile_size(void)::max_size;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v25 = v22;
          unint64_t v26 = v23;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v27 = objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 0), "intValue");
            int v28 = objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 1), "intValue");
            if (v27 >= 1) {
              unint64_t v25 = v27;
            }
            else {
              unint64_t v25 = v22;
            }
            if (v28 >= 1) {
              unint64_t v26 = v28;
            }
            else {
              unint64_t v26 = v23;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              LODWORD(v25) = [v24 intValue];
              unint64_t v29 = (int)v25;
              BOOL v30 = (int)v25 < 1;
              if ((int)v25 >= 1) {
                unint64_t v25 = (int)v25;
              }
              else {
                unint64_t v25 = v22;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                double v144 = ci_logger_api();
                if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR)) {
                  -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.8(v144, v145, v146, v147, v148, v149, v150, v151);
                }

                goto LABEL_190;
              }
              [v24 X];
              double v32 = v31;
              [v24 Y];
              int v34 = (int)v33;
              if ((int)v32 >= 1) {
                unint64_t v25 = (int)v32;
              }
              else {
                unint64_t v25 = v22;
              }
              unint64_t v29 = v34;
              BOOL v30 = v34 < 1;
            }
            if (v30) {
              unint64_t v26 = v23;
            }
            else {
              unint64_t v26 = v29;
            }
          }
        }
      }
    }
    if (v25 && v26 && (v25 < a4 || v26 < a5))
    {
      CI::Tileable::TileRectGridMakeEqualSizedTilesWithImageSize(v25, v26, a4, a5, (uint64_t *)&v164);
      std::vector<std::vector<IRect>>::__vdeallocate((uint64_t *)&v166);
      long long v166 = v164;
      uint64_t v167 = v165[0];
      v165[0] = 0;
      long long v164 = 0uLL;
      v161 = (void **)&v164;
      std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100](&v161);
    }
    os_signpost_id_t v35 = (void *)[a9 objectForKey:@"kCIImageProviderTileWidthArray"];
    uint64_t v36 = (void *)[a9 objectForKey:@"kCIImageProviderTileHeightArray"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_191:
        if (!getContentDigestFromOptions((NSDictionary *)a9, &cfstr_Kciimageconten_0.isa)) {
          getContentDigestFromOptions((NSDictionary *)a9, &cfstr_Kciimageprovid_1.isa);
        }
        if ([a9 objectForKey:@"kCIImageContentHeadroom"]) {
          objc_msgSend((id)objc_msgSend(a9, "objectForKey:", @"kCIImageContentHeadroom"), "floatValue");
        }
        operator new();
      }
    }
    long long v164 = 0uLL;
    v165[0] = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v37 = 0;
      for (unint64_t i = 0; i < [v35 count]; ++i)
      {
        [v35 objectAtIndexedSubscript:i];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v93 = ci_logger_api();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
            -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:](v93, v94, v95, v96, v97, v98, v99, v100);
          }
          goto LABEL_150;
        }
        if ((int)objc_msgSend((id)objc_msgSend(v35, "objectAtIndexedSubscript:", i), "intValue") <= 0)
        {
          CGPoint v101 = ci_logger_api();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
            -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:](v101, v102, v103, v104, v105, v106, v107, v108);
          }
          goto LABEL_150;
        }
        int v39 = objc_msgSend((id)objc_msgSend(v35, "objectAtIndexedSubscript:", i), "intValue");
        uint64_t v40 = v39;
        uint64_t v41 = (char *)*((void *)&v164 + 1);
        if (*((void *)&v164 + 1) >= v165[0])
        {
          long long v43 = (char *)v164;
          uint64_t v44 = (uint64_t)(*((void *)&v164 + 1) - v164) >> 3;
          unint64_t v45 = v44 + 1;
          if ((unint64_t)(v44 + 1) >> 61) {
            abort();
          }
          uint64_t v46 = v165[0] - v164;
          if ((uint64_t)(v165[0] - v164) >> 2 > v45) {
            unint64_t v45 = v46 >> 2;
          }
          if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v47 = v45;
          }
          if (v47)
          {
            uint64_t v48 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)v165, v47);
            uint64_t v41 = (char *)*((void *)&v164 + 1);
            long long v43 = (char *)v164;
          }
          else
          {
            uint64_t v48 = 0;
          }
          uint64_t v49 = &v48[8 * v44];
          *(void *)uint64_t v49 = v40;
          long long v42 = v49 + 8;
          while (v41 != v43)
          {
            uint64_t v50 = *((void *)v41 - 1);
            v41 -= 8;
            *((void *)v49 - 1) = v50;
            v49 -= 8;
          }
          *(void *)&long long v164 = v49;
          *((void *)&v164 + 1) = v42;
          v165[0] = &v48[8 * v47];
          if (v43) {
            operator delete(v43);
          }
        }
        else
        {
          **((void **)&v164 + 1) = v39;
          long long v42 = v41 + 8;
        }
        *((void *)&v164 + 1) = v42;
        v37 += (int)objc_msgSend((id)objc_msgSend(v35, "objectAtIndexedSubscript:", i), "intValue");
      }
    }
    else
    {
      if (v35)
      {
        id v51 = ci_logger_api();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.7(v51, v52, v53, v54, v55, v56, v57, v58);
        }
LABEL_150:

        int v109 = 1;
LABEL_187:
        if ((void)v164)
        {
          *((void *)&v164 + 1) = v164;
          operator delete((void *)v164);
        }
        if (v109)
        {
LABEL_190:
          *(void *)&long long v164 = &v166;
          std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v164);
          return 0;
        }
        goto LABEL_191;
      }
      unint64_t v37 = 0;
    }
    if (v37 < a4)
    {
      double v59 = (void *)*((void *)&v164 + 1);
      do
      {
        uint64_t v60 = *(v59 - 1);
        if ((unint64_t)v59 >= v165[0])
        {
          double v62 = (void *)v164;
          uint64_t v63 = (uint64_t)((uint64_t)v59 - v164) >> 3;
          unint64_t v64 = v63 + 1;
          if ((unint64_t)(v63 + 1) >> 61) {
            abort();
          }
          uint64_t v65 = v165[0] - v164;
          if ((uint64_t)(v165[0] - v164) >> 2 > v64) {
            unint64_t v64 = v65 >> 2;
          }
          if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v66 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v66 = v64;
          }
          if (v66)
          {
            float v67 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)v165, v66);
            uint64_t v68 = *(v59 - 1);
            double v59 = (void *)*((void *)&v164 + 1);
            double v62 = (void *)v164;
          }
          else
          {
            float v67 = 0;
            uint64_t v68 = *(v59 - 1);
          }
          float v69 = &v67[8 * v63];
          *(void *)float v69 = v68;
          double v61 = v69 + 8;
          while (v59 != v62)
          {
            uint64_t v70 = *--v59;
            *((void *)v69 - 1) = v70;
            v69 -= 8;
          }
          *(void *)&long long v164 = v69;
          *((void *)&v164 + 1) = v61;
          v165[0] = &v67[8 * v66];
          if (v62) {
            operator delete(v62);
          }
        }
        else
        {
          *double v59 = v60;
          double v61 = v59 + 1;
        }
        v37 += v60;
        *((void *)&v164 + 1) = v61;
        double v59 = v61;
      }
      while (v37 < a4);
    }
    v161 = 0;
    v162 = 0;
    v163 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v71 = 0;
      for (unint64_t j = 0; j < [v36 count]; ++j)
      {
        [v36 objectAtIndexedSubscript:j];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v128 = ci_logger_api();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
            -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.5(v128, v129, v130, v131, v132, v133, v134, v135);
          }
          goto LABEL_184;
        }
        if ((int)objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", j), "intValue") <= 0)
        {
          char v136 = ci_logger_api();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
            -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.4(v136, v137, v138, v139, v140, v141, v142, v143);
          }
          goto LABEL_184;
        }
        int v73 = objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", j), "intValue");
        double v74 = (void *)v73;
        double v75 = v162;
        if (v162 >= (void **)v163)
        {
          double v77 = v161;
          uint64_t v78 = v162 - v161;
          unint64_t v79 = v78 + 1;
          if ((unint64_t)(v78 + 1) >> 61) {
            abort();
          }
          uint64_t v80 = v163 - (char *)v161;
          if ((v163 - (char *)v161) >> 2 > v79) {
            unint64_t v79 = v80 >> 2;
          }
          if ((unint64_t)v80 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v81 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v81 = v79;
          }
          if (v81)
          {
            uint64_t v82 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)&v163, v81);
            double v77 = v161;
            double v75 = v162;
          }
          else
          {
            uint64_t v82 = 0;
          }
          uint64_t v83 = (void **)&v82[8 * v78];
          *uint64_t v83 = v74;
          float v76 = v83 + 1;
          while (v75 != v77)
          {
            uint64_t v84 = *--v75;
            *--uint64_t v83 = v84;
          }
          v161 = v83;
          v162 = v76;
          v163 = &v82[8 * v81];
          if (v77) {
            operator delete(v77);
          }
        }
        else
        {
          *v162 = (void *)v73;
          float v76 = v75 + 1;
        }
        v162 = v76;
        v71 += (int)objc_msgSend((id)objc_msgSend(v36, "objectAtIndexedSubscript:", j), "intValue");
      }
    }
    else
    {
      if (v35)
      {
        uint64_t v85 = ci_logger_api();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
          -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:].cold.6(v85, v86, v87, v88, v89, v90, v91, v92);
        }
LABEL_184:

        int v109 = 1;
        goto LABEL_185;
      }
      unint64_t v71 = 0;
    }
    if (v71 < a5)
    {
      float v110 = v162;
      do
      {
        double v111 = *(v110 - 1);
        if (v110 >= (void **)v163)
        {
          long long v113 = v161;
          uint64_t v114 = v110 - v161;
          unint64_t v115 = v114 + 1;
          if ((unint64_t)(v114 + 1) >> 61) {
            abort();
          }
          uint64_t v116 = v163 - (char *)v161;
          if ((v163 - (char *)v161) >> 2 > v115) {
            unint64_t v115 = v116 >> 2;
          }
          if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v117 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v117 = v115;
          }
          if (v117)
          {
            uint64_t v118 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)&v163, v117);
            double v119 = *(v110 - 1);
            long long v113 = v161;
            float v110 = v162;
          }
          else
          {
            uint64_t v118 = 0;
            double v119 = *(v110 - 1);
          }
          double v120 = (void **)&v118[8 * v114];
          *double v120 = v119;
          double v112 = v120 + 1;
          while (v110 != v113)
          {
            double v121 = *--v110;
            *--double v120 = v121;
          }
          v161 = v120;
          v162 = v112;
          v163 = &v118[8 * v117];
          if (v113) {
            operator delete(v113);
          }
        }
        else
        {
          *float v110 = v111;
          double v112 = v110 + 1;
        }
        v71 += (unint64_t)v111;
        v162 = v112;
        float v110 = v112;
      }
      while (v71 < a5);
    }
    __dst = 0;
    uint64_t v158 = 0;
    long long v156 = 0;
    long long v122 = v164;
    int64_t v123 = *((void *)&v164 + 1) - v164;
    if (*((void *)&v164 + 1) != (void)v164)
    {
      std::vector<unsigned long>::__vallocate[abi:nn180100](&v156, v123 >> 3);
      uint64_t v124 = (char *)__dst;
      memmove(__dst, (const void *)v122, v123);
      __dst = &v124[8 * (v123 >> 3)];
    }
    __p = 0;
    CGRect v154 = 0;
    uint64_t v155 = 0;
    uint64_t v125 = v161;
    int64_t v126 = (char *)v162 - (char *)v161;
    if (v162 != v161)
    {
      std::vector<unsigned long>::__vallocate[abi:nn180100](&__p, v126 >> 3);
      uint64_t v127 = (char *)v154;
      memmove(v154, v125, v126);
      CGRect v154 = &v127[8 * (v126 >> 3)];
    }
    CI::Tileable::TileRectGridMakeFromWidthAndHeightArrays((uint64_t *)&v156, (int **)&__p, (uint64_t *)&v159);
    std::vector<std::vector<IRect>>::__vdeallocate((uint64_t *)&v166);
    long long v166 = v159;
    uint64_t v167 = v160;
    uint64_t v160 = 0;
    long long v159 = 0uLL;
    v168 = (void **)&v159;
    std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100](&v168);
    if (__p)
    {
      CGRect v154 = __p;
      operator delete(__p);
    }
    if (v156)
    {
      __dst = v156;
      operator delete(v156);
    }
    int v109 = 0;
LABEL_185:
    if (v161)
    {
      v162 = v161;
      operator delete(v161);
    }
    goto LABEL_187;
  }
  uint64_t v13 = CI::name_for_format(v12);
  uint64_t v14 = ci_logger_api();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CIImage(CIImageProvider) _initWithImageProvider:width:height:format:colorSpace:surfaceCache:options:]((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
  }

  return 0;
}

uint64_t __103__CIImage_CIImageProvider___initWithImageProvider_width_height_format_colorSpace_surfaceCache_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

+ (CIImage)imageWithYCCImage:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  return (CIImage *)[a1 imageWithYCCImage:a3 matrix:*(void *)&a4 fullRange:a5 precision:8 colorSpace:a6];
}

+ (CIImage)imageWithYCCImage:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 precision:(int)a6 colorSpace:(CGColorSpace *)a7
{
  v16[3] = *(double *)MEMORY[0x1E4F143B8];
  ycc_to_rgb_bias_matridouble x = get_ycc_to_rgb_bias_matrix(a4, a5, a6, v15, v14, v13, v16);
  int v11 = v10;
  CGPoint result = 0;
  if (a3 && v11)
  {
    objc_msgSend(a3, "extent", ycc_to_rgb_bias_matrix);
    if (CGRectIsEmpty(v17))
    {
      return (CIImage *)a3;
    }
    else
    {
      CGPoint result = applyColorMatrix((CIImage *)a3, v15, v14, v13, v16);
      if (a7) {
        return [(CIImage *)result imageByColorMatchingColorSpaceToWorkingSpace:a7];
      }
    }
  }
  return result;
}

+ (CIImage)imageWithYImage:(id)a3 CrCbImage:(id)a4 CrCbScale:(int)a5 matrix:(int)a6 fullRange:(BOOL)a7 colorSpace:(CGColorSpace *)a8
{
  return (CIImage *)[a1 imageWithYImage:a3 CrCbImage:a4 CrCbScale:*(void *)&a5 matrix:*(void *)&a6 fullRange:a7 precision:8 colorSpace:a8];
}

+ (CIImage)imageWithYImage:(id)a3 CrCbImage:(id)a4 CrCbScale:(int)a5 matrix:(int)a6 fullRange:(BOOL)a7 precision:(int)a8 colorSpace:(CGColorSpace *)a9
{
  uint64_t v9 = *(void *)&a8;
  BOOL v10 = a7;
  uint64_t v11 = *(void *)&a6;
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = +[CIKernel kernelWithInternalRepresentation:&CI::_yccCombiner];
  uint64_t v16 = (void *)[a4 imageByClampingToExtent];
  CGAffineTransformMakeScale(&v23, (double)a5, (double)a5);
  uint64_t v17 = [v16 imageByApplyingTransform:&v23];
  [a3 extent];
  v24[0] = a3;
  v24[1] = v17;
  return +[CIImage imageWithYCCImage:matrix:fullRange:precision:colorSpace:](CIImage, "imageWithYCCImage:matrix:fullRange:precision:colorSpace:", -[CIColorKernel applyWithExtent:arguments:](v15, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2], v18, v19, v20, v21), v11, v10, v9, a9);
}

+ (id)imageYCC444:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 colorSpace:(CGColorSpace *)a6
{
  return (id)[a1 imageYCC444:a3 matrix:*(void *)&a4 fullRange:a5 precision:8 colorSpace:a6];
}

+ (id)imageYCC444:(id)a3 matrix:(int)a4 fullRange:(BOOL)a5 precision:(int)a6 colorSpace:(CGColorSpace *)a7
{
  double v14[3] = *(double *)MEMORY[0x1E4F143B8];
  rgb_to_ycc_matridouble x = get_rgb_to_ycc_matrix(a4, a5, a6, v14, (uint64_t)v13, (uint64_t)v12, (uint64_t)v11);
  id result = 0;
  if (a3 && rgb_to_ycc_matrix)
  {
    [a3 extent];
    if (CGRectIsEmpty(v15))
    {
      return a3;
    }
    else
    {
      if (a7) {
        a3 = (id)[a3 imageByColorMatchingWorkingSpaceToColorSpace:a7];
      }
      if (([a3 isOpaque] & 1) == 0)
      {
        [a3 extent];
        a3 = (id)objc_msgSend(a3, "imageBySettingAlphaOneInExtent:");
      }
      return applyColorMatrix((CIImage *)a3, v13, v12, v11, v14);
    }
  }
  return result;
}

- (id)localLightStatisticsWithProxy:(BOOL)a3
{
  uint64_t v3 = ((uint64_t (*)(CIImage *, SEL, BOOL))MEMORY[0x1F4188790])(self, a2, a3);
  int v87 = v4;
  uint64_t v5 = (CIImage *)v3;
  v103[256] = *MEMORY[0x1E4F143B8];
  id v18 = +[CIContext _cachedContext:@"CILocalLight-stats" options:0];
  [(CIImage *)v5 extent];
  CGRect v105 = CGRectIntegral(v104);
  double x = v105.origin.x;
  double y = v105.origin.y;
  double width = v105.size.width;
  double height = v105.size.height;
  [(CIImage *)v5 extent];
  unint64_t v11 = (unint64_t)v10;
  [(CIImage *)v5 extent];
  unint64_t v13 = (unint64_t)v12;
  uint64_t v14 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:4 * v11 * (unint64_t)v12];
  uint64_t v15 = [v14 bytes];
  uint64_t v85 = v18;
  uint64_t v86 = v5;
  objc_msgSend(v18, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v5, objc_msgSend(v14, "mutableBytes"), 4 * v11, 264, 0, x, y, width, height);
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  LODWORD(v18) = 0;
  uint64_t v19 = (int)llroundf((float)v13 / 31.0);
  uint64_t v95 = (int)llroundf((float)v11 / 31.0);
  unint64_t v91 = v13;
  unint64_t v89 = v13 - 1;
  uint64_t v20 = v15 + 2;
  uint64_t v88 = 4 * v11 * v19;
  uint64_t v90 = v19;
  do
  {
    uint64_t v21 = 0;
    uint64_t v93 = v17;
    uint64_t v94 = v16;
    unint64_t v22 = v17 * v19;
    if (v17 * v19 + v19 <= v89) {
      unint64_t v23 = v17 * v19 + v19;
    }
    else {
      unint64_t v23 = v91;
    }
    id v18 = (id)(int)v18;
    uint64_t v24 = v23 + v16;
    uint64_t v92 = v20;
    unint64_t v25 = (unsigned char *)v20;
    do
    {
      unint64_t v26 = v21 * v95;
      bzero(v103, 0x800uLL);
      unint64_t v30 = v21 * v95 + v95;
      if (v30 > v11 - 1) {
        unint64_t v30 = v11;
      }
      if (v30 > v26)
      {
        double v31 = v25;
        do
        {
          double v32 = v31;
          uint64_t v33 = v24;
          if (v23 > v22)
          {
            do
            {
              LOBYTE(v27) = *(v32 - 2);
              LOBYTE(v28) = *(v32 - 1);
              LOBYTE(v29) = *v32;
              double v29 = (double)*(unint64_t *)&v29 / 255.0;
              double v34 = ((double)*(unint64_t *)&v27 / 255.0 + (double)v28 / 255.0 + v29) / 3.0;
              unint64_t v28 = 0x4070000000000000;
              int v35 = (int)fmin(floor(v34 * 256.0), 255.0);
              double v27 = 1.0 / (double)(v30 * v23) + *(double *)&v103[v35];
              *(double *)&v103[v35] = v27;
              v32 += 4 * v11;
              --v33;
            }
            while (v33);
          }
          ++v26;
          v31 += 4;
        }
        while (v26 != v30);
      }
      id v18 = (char *)v18 + 1;
      ++v21;
      v25 += 4 * v95;
    }
    while (v21 != 31);
    uint64_t v17 = v93 + 1;
    uint64_t v19 = v90;
    uint64_t v16 = v94 - v90;
    uint64_t v20 = v92 + v88;
  }
  while (v93 != 30);
  uint64_t v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:1922];
  uint64_t v37 = [v36 mutableBytes];
  uint64_t v38 = 0;
  int v39 = (double *)v102;
  do
  {
    float v40 = *(v39 - 1) * 2.44125725 + -1.0619469;
    float v41 = *v39;
    long long v42 = (unsigned char *)(v37 + v38);
    unsigned char *v42 = llround((v40 + 1.2) * 0.29412 * 255.0);
    v42[1] = llroundf(v41 * 255.0);
    v38 += 2;
    v39 += 10;
  }
  while (v38 != 1922);
  long long v43 = v36;
  uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2];
  unint64_t v45 = (unsigned char *)[v44 mutableBytes];
  uint64_t v46 = (double *)v102;
  float v47 = 0.0;
  uint64_t v48 = 961;
  float v49 = 0.0;
  do
  {
    float v50 = *(v46 - 1) * 2.44125725 + -1.0619469;
    float v51 = *v46;
    float v49 = v49 + v50;
    float v47 = v47 + v51;
    v46 += 10;
    --v48;
  }
  while (v48);
  *unint64_t v45 = llround(((float)(v49 / 961.0) + 1.2) * 0.29412 * 255.0);
  v45[1] = llroundf((float)(v47 / 961.0) * 255.0);
  id v52 = v44;
  id v53 = v52;
  double v54 = 0.0;
  uint64_t v55 = 961;
  uint64_t v56 = 7;
  double v57 = 0.0;
  do
  {
    double v58 = *(double *)&v101[v56 + 5];
    if (v58 > v57) {
      double v57 = *(double *)&v101[v56 + 5];
    }
    double v54 = v54 + v58;
    v56 += 10;
    --v55;
  }
  while (v55);
  if (v57 + v54 / -961.0 <= 0.5) {
    double v59 = v57;
  }
  else {
    double v59 = v57 * 0.45;
  }
  double v60 = fabs(v59);
  if (!v87 || v60 < 1.0e-10)
  {
    v100[0] = @"lightMap";
    v100[1] = @"lightMapWidth";
    v101[0] = v43;
    v101[1] = &unk_1EE4AAB20;
    v100[2] = @"lightMapHeight";
    v100[3] = @"lightMapAvg";
    v101[2] = &unk_1EE4AAB20;
    v101[3] = v52;
    v100[4] = @"localAutoValue";
    BOOL v69 = v60 < 1.0e-10;
    double v70 = 0.0;
    if (!v69) {
      double v70 = v59;
    }
    v101[4] = [NSNumber numberWithDouble:v70];
    unint64_t v66 = (void *)MEMORY[0x1E4F1C9E8];
    float v67 = v101;
    uint64_t v68 = v100;
    goto LABEL_35;
  }
  double v61 = _lightMapImageFromData(v43, (NSNumber *)&unk_1EE4AAB20, (NSNumber *)&unk_1EE4AAB20);
  double v62 = _scaledLightMapImage(v61, v86);
  if (!v62
    || (uint64_t v63 = v62, [(CIImage *)v62 extent], v64 < 31.0)
    || ([(CIImage *)v63 extent], v65 < 31.0))
  {
    v98[0] = @"lightMap";
    v98[1] = @"lightMapWidth";
    v99[0] = v43;
    v99[1] = &unk_1EE4AAB20;
    v98[2] = @"lightMapHeight";
    v98[3] = @"lightMapAvg";
    v99[2] = &unk_1EE4AAB20;
    v99[3] = v53;
    v98[4] = @"localAutoValue";
    v99[4] = [NSNumber numberWithDouble:v59];
    unint64_t v66 = (void *)MEMORY[0x1E4F1C9E8];
    float v67 = v99;
    uint64_t v68 = v98;
LABEL_35:
    uint64_t v71 = 5;
    return (id)[v66 dictionaryWithObjects:v67 forKeys:v68 count:v71];
  }
  [(CIImage *)v63 extent];
  unint64_t v74 = (unint64_t)v73;
  [(CIImage *)v63 extent];
  unint64_t v76 = (unint64_t)v75;
  unint64_t v77 = 2 * ((v74 & 1) + v74);
  uint64_t v78 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v77 * (unint64_t)v75];
  uint64_t v79 = [v78 mutableBytes];
  [(CIImage *)v63 extent];
  objc_msgSend(v85, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v63, v79, v77, 262, 0);
  if (v74)
  {
    uint64_t v80 = 2 * v74;
    uint64_t v81 = [v78 mutableBytes];
    if (v76 >= 2)
    {
      unint64_t v82 = v76 - 1;
      uint64_t v83 = (char *)(v81 + v80 + 2);
      uint64_t v84 = (char *)(v81 + v80);
      do
      {
        memcpy(v84, v83, 2 * v74);
        v83 += v80 + 2;
        v84 += v80;
        --v82;
      }
      while (v82);
    }
    [v78 setLength:v80 * v76];
  }
  v96[0] = @"lightMap";
  v96[1] = @"lightMapWidth";
  v97[0] = v43;
  v97[1] = &unk_1EE4AAB20;
  v96[2] = @"lightMapHeight";
  v96[3] = @"lightMapAvg";
  v97[2] = &unk_1EE4AAB20;
  v97[3] = v53;
  v96[4] = @"localAutoValue";
  v97[4] = [NSNumber numberWithDouble:v59];
  v97[5] = v78;
  v96[5] = @"proxyLightMap";
  v96[6] = @"proxyLightMapWidth";
  v97[6] = [NSNumber numberWithUnsignedLong:v74];
  v96[7] = @"proxyLightMapHeight";
  v97[7] = [NSNumber numberWithUnsignedLong:v76];
  unint64_t v66 = (void *)MEMORY[0x1E4F1C9E8];
  float v67 = v97;
  uint64_t v68 = v96;
  uint64_t v71 = 8;
  return (id)[v66 dictionaryWithObjects:v67 forKeys:v68 count:v71];
}

- (id)localLightStatistics
{
  return [(CIImage *)self localLightStatisticsWithProxy:1];
}

- (id)localLightStatisticsNoProxy
{
  return [(CIImage *)self localLightStatisticsWithProxy:0];
}

- (id)autoPerspectiveFilterWithOptions:(id)a3
{
  uint64_t v5 = (objc_class *)CIPerspectiveAutoCalcDefaultImpl();
  uint64_t v6 = (void *)[a3 valueForKey:@"version"];
  if (v6)
  {
    uint64_t v7 = v6;
    if ([v6 isEqual:@"v1"]) {
      uint64_t v5 = (objc_class *)objc_opt_class();
    }
    if ([v7 isEqual:@"v2"]) {
      uint64_t v5 = (objc_class *)objc_opt_class();
    }
  }
  uint64_t v8 = objc_msgSend(a3, "valueForKey:", @"focalLength", 0x403C000000000000, 0x3FD0C152382D7365, 0x3FC657184AE74487, 0x3FE0C152382D7365, vdupq_n_s64(0x3FE0C152382D7365uLL), 0);
  if (v8)
  {
    [v8 doubleValue];
    v26[0] = v9;
  }
  double v10 = objc_msgSend(a3, "valueForKey:", @"lineSearchRangeV", *(void *)&v26[0]);
  if (v10)
  {
    [v10 doubleValue];
    v26[1] = v11;
  }
  double v12 = (void *)[a3 valueForKey:@"lineSearchRangeH"];
  if (v12)
  {
    [v12 doubleValue];
    v26[2] = v13;
  }
  uint64_t v14 = (void *)[a3 valueForKey:@"pitchLimit"];
  if (v14)
  {
    [v14 doubleValue];
    v26[3] = v15;
  }
  uint64_t v16 = (void *)[a3 valueForKey:@"yawLimit"];
  if (v16)
  {
    [v16 doubleValue];
    v26[4] = v17;
  }
  id v18 = (void *)[a3 valueForKey:@"rollLimit"];
  if (v18)
  {
    [v18 doubleValue];
    v26[5] = v19;
  }
  *(void *)&v26[6] = [a3 objectForKeyedSubscript:@"saliencyHeatMap"];
  uint64_t v20 = objc_msgSend([v5 alloc], "initWithContext:image:config:", objc_msgSend(a3, "objectForKeyedSubscript:", @"context"), self, v26);
  if ([v20 isMemberOfClass:objc_opt_class()])
  {
    if ([a3 valueForKey:@"minimumPitchCorrectionArea"])
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minimumPitchCorrectionArea"), "doubleValue");
      objc_msgSend(v20, "setMinimumPitchCorrectionAreaCoverage:");
    }
    if ([a3 valueForKey:@"minimumYawCorrectionArea"])
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minimumYawCorrectionArea"), "doubleValue");
      objc_msgSend(v20, "setMinimumYawCorrectionAreaCoverage:");
    }
  }
  if (v20 && ([v20 compute] & 1) != 0)
  {
    uint64_t v21 = +[CIFilter filterWithName:@"CIPerspectiveRotate"];
    [(CIFilter *)v21 setValue:self forKey:@"inputImage"];
    -[CIFilter setValue:forKey:](v21, "setValue:forKey:", [NSNumber numberWithDouble:v26[0]], @"inputFocalLength");
    unint64_t v22 = NSNumber;
    [v20 pitch];
    -[CIFilter setValue:forKey:](v21, "setValue:forKey:", objc_msgSend(v22, "numberWithDouble:"), @"inputPitch");
    unint64_t v23 = NSNumber;
    [v20 yaw];
    -[CIFilter setValue:forKey:](v21, "setValue:forKey:", objc_msgSend(v23, "numberWithDouble:"), @"inputYaw");
    uint64_t v24 = NSNumber;
    [v20 roll];
    -[CIFilter setValue:forKey:](v21, "setValue:forKey:", objc_msgSend(v24, "numberWithDouble:"), @"inputRoll");
  }
  else
  {

    return 0;
  }
  return v21;
}

- (id)autoPerspectiveResultWithOptions:(id)a3
{
  uint64_t v5 = (objc_class *)CIPerspectiveAutoCalcDefaultImpl();
  uint64_t v6 = (void *)[a3 valueForKey:@"version"];
  if (v6)
  {
    uint64_t v7 = v6;
    if ([v6 isEqual:@"v1"]) {
      uint64_t v5 = (objc_class *)objc_opt_class();
    }
    if ([v7 isEqual:@"v2"]) {
      uint64_t v5 = (objc_class *)objc_opt_class();
    }
  }
  uint64_t v8 = objc_msgSend(a3, "valueForKey:", @"focalLength", 0x403C000000000000, 0x3FD0C152382D7365, 0x3FC657184AE74487, 0x3FE0C152382D7365, vdupq_n_s64(0x3FE0C152382D7365uLL), 0);
  if (v8)
  {
    [v8 doubleValue];
    v34[0] = v9;
  }
  double v10 = objc_msgSend(a3, "valueForKey:", @"lineSearchRangeV", *(void *)&v34[0]);
  if (v10)
  {
    [v10 doubleValue];
    v34[1] = v11;
  }
  double v12 = (void *)[a3 valueForKey:@"lineSearchRangeH"];
  if (v12)
  {
    [v12 doubleValue];
    v34[2] = v13;
  }
  uint64_t v14 = (void *)[a3 valueForKey:@"pitchLimit"];
  if (v14)
  {
    [v14 doubleValue];
    void v34[3] = v15;
  }
  uint64_t v16 = (void *)[a3 valueForKey:@"yawLimit"];
  if (v16)
  {
    [v16 doubleValue];
    v34[4] = v17;
  }
  id v18 = (void *)[a3 valueForKey:@"rollLimit"];
  if (v18)
  {
    [v18 doubleValue];
    v34[5] = v19;
  }
  *(void *)&v34[6] = [a3 objectForKeyedSubscript:@"saliencyHeatMap"];
  uint64_t v20 = objc_msgSend([v5 alloc], "initWithContext:image:config:", objc_msgSend(a3, "objectForKeyedSubscript:", @"context"), self, v34);
  uint64_t v21 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"generateDebugImage"), "BOOLValue");
  [v20 setGenerateDebugImage:v21];
  if ([v20 isMemberOfClass:objc_opt_class()])
  {
    if ([a3 valueForKey:@"minimumPitchCorrectionArea"])
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minimumPitchCorrectionArea"), "doubleValue");
      objc_msgSend(v20, "setMinimumPitchCorrectionAreaCoverage:");
    }
    if ([a3 valueForKey:@"minimumYawCorrectionArea"])
    {
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"minimumYawCorrectionArea"), "doubleValue");
      objc_msgSend(v20, "setMinimumYawCorrectionAreaCoverage:");
    }
  }
  [v20 isMemberOfClass:objc_opt_class()];
  if (v20 && ([v20 compute] & 1) != 0)
  {
    unint64_t v22 = +[CIFilter filterWithName:@"CIPerspectiveRotate"];
    [(CIFilter *)v22 setValue:self forKey:@"inputImage"];
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", [NSNumber numberWithDouble:v34[0]], @"inputFocalLength");
    unint64_t v23 = NSNumber;
    [v20 pitch];
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(v23, "numberWithDouble:"), @"inputPitch");
    uint64_t v24 = NSNumber;
    [v20 yaw];
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(v24, "numberWithDouble:"), @"inputYaw");
    unint64_t v25 = NSNumber;
    [v20 roll];
    -[CIFilter setValue:forKey:](v22, "setValue:forKey:", objc_msgSend(v25, "numberWithDouble:"), @"inputRoll");
    unint64_t v26 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v26 setObject:v22 forKeyedSubscript:@"filter"];
    double v27 = NSNumber;
    [v20 confidence];
    objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v27, "numberWithDouble:"), @"confidence");
    if (v21) {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v20, "debugImage"), @"debugImage");
    }
    if ([v20 isMemberOfClass:objc_opt_class()])
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "pitchFailureReason")), @"pitchFailureReason");
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "yawFailureReason")), @"yawFailureReason");
      unint64_t v28 = NSNumber;
      [v20 pitchCorrectionAreaCoverage];
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v28, "numberWithFloat:"), @"pitchCorrectionAreaCoverage");
      double v29 = NSNumber;
      [v20 yawCorrectionAreaCoverage];
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v29, "numberWithFloat:"), @"yawCorrectionAreaCoverage");
    }
    if ([v20 isMemberOfClass:objc_opt_class()])
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "pitchFailureReason")), @"pitchFailureReason");
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "yawFailureReason")), @"yawFailureReason");
      unint64_t v30 = NSNumber;
      [v20 unlimitedPitch];
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v30, "numberWithDouble:"), @"unlimitedPitch");
      double v31 = NSNumber;
      [v20 unlimitedYaw];
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v31, "numberWithDouble:"), @"unlimitedYaw");
      double v32 = NSNumber;
      [v20 unlimitedRoll];
      objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v32, "numberWithDouble:"), @"unlimitedRoll");
    }

    return (id)[v26 copy];
  }
  else
  {

    return 0;
  }
}

- (id)smartBlackAndWhiteStatistics
{
  if (-[CIImage(PrivateSmartBlackAndWhite) smartBlackAndWhiteStatistics]::onceToken != -1) {
    dispatch_once(&-[CIImage(PrivateSmartBlackAndWhite) smartBlackAndWhiteStatistics]::onceToken, &__block_literal_global_62);
  }
  return (id)MEMORY[0x1E4F1CC08];
}

void __66__CIImage_PrivateSmartBlackAndWhite__smartBlackAndWhiteStatistics__block_invoke()
{
}

- (id)smartBlackAndWhiteAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  void v7[7] = *MEMORY[0x1E4F143B8];
  if (-[CIImage(PrivateSmartBlackAndWhite) smartBlackAndWhiteAdjustmentsForValue:andStatistics:]::onceToken != -1) {
    dispatch_once(&-[CIImage(PrivateSmartBlackAndWhite) smartBlackAndWhiteAdjustmentsForValue:andStatistics:]::onceToken, &__block_literal_global_95_0);
  }
  v6[0] = @"inputStrength";
  v6[1] = @"inputNeutralGamma";
  v7[0] = &unk_1EE4A9BF0;
  v7[1] = &unk_1EE4A9BD0;
  void v7[2] = &unk_1EE4A9BD0;
  v6[2] = @"inputTone";
  v6[3] = @"inputHue";
  _OWORD v7[3] = [NSNumber numberWithDouble:a3];
  v7[4] = &unk_1EE4A9BD0;
  void v6[4] = @"inputGrain";
  void v6[5] = @"inputSeed";
  v6[6] = @"inputScaleFactor";
  v7[5] = &unk_1EE4A9BD0;
  v7[6] = &unk_1EE4A9BD0;
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:7];
}

void __90__CIImage_PrivateSmartBlackAndWhite__smartBlackAndWhiteAdjustmentsForValue_andStatistics___block_invoke()
{
}

- (id)smartToneStatistics
{
  uint64_t v2 = (void *)((uint64_t (*)(CIImage *, SEL))MEMORY[0x1F4188790])(self, a2);
  v38[1] = *MEMORY[0x1E4F143B8];
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  if (![v2 properties]) {
    NSLog(&cfstr_WarningSmartto.isa);
  }
  uint64_t v3 = (void *)[v2 properties];
  int v4 = (void *)[v3 valueForKey:*MEMORY[0x1E4F2F800]];
  uint64_t v5 = (void *)[v4 valueForKey:*MEMORY[0x1E4F2F838]];
  double v6 = 1.0;
  if (v5)
  {
    if ([v5 intValue]) {
      double v6 = 0.6;
    }
    else {
      double v6 = 1.0;
    }
  }
  context = (void *)MEMORY[0x199702DB0]();
  uint64_t v37 = @"working_format";
  v38[0] = [NSNumber numberWithInt:2056];
  id v7 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", @"CISmartTone-histogram", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1]);
  [v2 extent];
  CGRect v40 = CGRectIntegral(v39);
  double x = v40.origin.x;
  double y = v40.origin.y;
  double width = v40.size.width;
  double height = v40.size.height;
  unint64_t v12 = (unint64_t)v40.size.width;
  unint64_t v13 = (unint64_t)v40.size.height;
  unint64_t v14 = 4 * (unint64_t)v40.size.width;
  double v15 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v14 * (unint64_t)v40.size.height];
  uint64_t v16 = [v15 bytes];
  v35[0] = @"inputRVector";
  v36[0] = +[CIVector vectorWithX:0.333333343 Y:0.333333343 Z:0.333333343 W:0.0];
  v35[1] = @"inputGVector";
  v36[1] = +[CIVector vectorWithX:0.166666672 Y:0.166666672 Z:0.166666672 W:0.0];
  void v35[2] = @"inputBVector";
  v36[2] = +[CIVector vectorWithX:-1.0 Y:-1.0 Z:-1.0 W:0.0];
  v35[3] = @"inputAVector";
  v36[3] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
  v35[4] = @"inputBiasVector";
  v36[4] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
  objc_msgSend(v7, "render:toBitmap:rowBytes:bounds:format:colorSpace:", objc_msgSend(v2, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v36, v35, 5)), objc_msgSend(v15, "mutableBytes"), v14, 264, 0, x, y, width, height);
  bzero(v34, 0x1000uLL);
  if ((int)v13 >= 1)
  {
    uint64_t v17 = 0;
    double v18 = 1.0 / (double)(v13 * v12);
    double v19 = (unsigned __int8 *)(v16 + 2);
    while (1)
    {
      uint64_t v20 = v19;
      uint64_t v21 = v12;
      if ((int)v12 >= 1) {
        break;
      }
LABEL_17:
      ++v17;
      v19 += v14;
      if (v17 == v13) {
        goto LABEL_18;
      }
    }
    while (1)
    {
      uint64_t v22 = *v20;
      int v23 = (char)*(v20 - 1);
      v34[*(v20 - 2)] = v18 + v34[*(v20 - 2)];
      if (v23 < 0) {
        break;
      }
      if (v22) {
        goto LABEL_12;
      }
LABEL_13:
      v20 += 4;
      if (!--v21) {
        goto LABEL_17;
      }
    }
    v34[2 * v23] = v18 + v34[2 * v23];
    if (!v22) {
      goto LABEL_13;
    }
LABEL_12:
    v34[v22 + 255] = v18 + v34[v22 + 255];
    goto LABEL_13;
  }
LABEL_18:
  v32[0] = @"tonalRange";
  v33[0] = [NSNumber numberWithDouble:*(double *)&v26];
  v32[1] = @"highKey";
  v33[1] = [NSNumber numberWithDouble:*((double *)&v26 + 1)];
  void v32[2] = @"p02";
  v33[2] = [NSNumber numberWithDouble:*(double *)&v27];
  v32[3] = @"p10";
  void v33[3] = [NSNumber numberWithDouble:*((double *)&v27 + 1)];
  v32[4] = @"p25";
  v33[4] = [NSNumber numberWithDouble:*(double *)&v28];
  v32[5] = @"p50";
  v33[5] = [NSNumber numberWithDouble:*((double *)&v28 + 1)];
  v32[6] = @"p98";
  v33[6] = [NSNumber numberWithDouble:*(double *)&v29];
  v32[7] = @"autoValue";
  v33[7] = [NSNumber numberWithDouble:v6 * *((double *)&v29 + 1)];
  v32[8] = @"blackPoint";
  v33[8] = [NSNumber numberWithDouble:*(double *)&v30];
  v32[9] = @"whitePoint";
  v33[9] = [NSNumber numberWithDouble:*((double *)&v30 + 1)];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:10];
}

- (id)smartColorStatistics
{
  uint64_t v2 = (void *)((uint64_t (*)(CIImage *, SEL))MEMORY[0x1F4188790])(self, a2);
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x199702DB0]();
  BOOL v69 = @"working_format";
  uint64_t v70 = [NSNumber numberWithInt:2056];
  id v3 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", @"CISmartColor-histogram", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1]);
  [v2 extent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  unint64_t v12 = (unint64_t)v8;
  unint64_t v13 = (unint64_t)v10;
  unint64_t v14 = 4 * (unint64_t)v8;
  double v15 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v14 * (unint64_t)v10];
  uint64_t v61 = [v15 bytes];
  objc_msgSend(v3, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v2, objc_msgSend(v15, "mutableBytes"), v14, 264, 0, v5, v7, v9, v11);
  bzero(v66, 0x400uLL);
  bzero(v65, 0x400uLL);
  bzero(v72, 0x400uLL);
  bzero(v71, 0x400uLL);
  bzero(v68, 0x400uLL);
  bzero(v67, 0x400uLL);
  if ((int)v13 > 0)
  {
    uint64_t v19 = 0;
    float v20 = 1.0 / (double)(v13 * v12);
    uint64_t v21 = (unsigned char *)(v61 + 2);
    do
    {
      uint64_t v22 = v21;
      uint64_t v23 = v12;
      if ((int)v12 >= 1)
      {
        do
        {
          LOBYTE(v16) = *(v22 - 2);
          LOBYTE(v17) = *(v22 - 1);
          double v24 = (double)*(unint64_t *)&v16 / 255.0;
          double v25 = (double)*(unint64_t *)&v17 / 255.0;
          LOBYTE(v18) = *v22;
          double v26 = (double)*(unint64_t *)&v18 / 255.0;
          double v27 = (v24 + v25 + v26) / 3.0;
          double v16 = v24 * 255.0;
          unsigned int v28 = llround(v16);
          double v17 = v25 * 255.0;
          unsigned int v29 = llround(v17);
          *(float *)&double v17 = *(float *)&v71[4 * v29] + v20;
          unsigned int v30 = llround(v26 * 255.0);
          *(float *)&v72[4 * v28] = *(float *)&v72[4 * v28] + v20;
          *(float *)&double v16 = v68[v30] + v20;
          double v18 = v27 * 255.0;
          *(_DWORD *)&v71[4 * v29] = LODWORD(v17);
          unsigned int v31 = llround(v27 * 255.0);
          *(float *)&double v17 = v67[v31];
          v68[v30] = *(float *)&v16;
          *(float *)&double v16 = *(float *)&v17 + v20;
          v67[v31] = *(float *)&v17 + v20;
          v22 += 4;
          --v23;
        }
        while (v23);
      }
      ++v19;
      v21 += v14;
    }
    while (v19 != v13);
  }
  uint64_t v32 = 0;
  __asm { FMOV            V1.2D, #1.0 }
  do
  {
    float32x4_t v38 = *(float32x4_t *)&v67[v32];
    float32x4_t v39 = vabdq_f32(*(float32x4_t *)&v71[v32 * 4], v38);
    float32x4_t v40 = vmaxnmq_f32(vaddq_f32(vaddq_f32(vabdq_f32(*(float32x4_t *)&v72[v32 * 4], v38), v39), vabdq_f32(*(float32x4_t *)&v68[v32], v38)), (float32x4_t)0);
    *(float32x4_t *)&v66[v32 * 4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vminnmq_f64(vcvtq_f64_f32(*(float32x2_t *)v40.f32), _Q1)), vminnmq_f64(vcvt_hight_f64_f32(v40), _Q1));
    *(float32x4_t *)&v65[v32 * 4] = v39;
    v32 += 4;
  }
  while (v32 != 256);
  uint64_t v41 = 0;
  int v42 = 71362;
  int v43 = 71362;
  do
  {
    *(float *)&int v43 = *(float *)&v43 + *(float *)&v66[v41];
    *(float *)&int v42 = *(float *)&v42 + *(float *)&v65[v41];
    v41 += 4;
  }
  while (v41 != 1024);
  uint64_t v44 = 0;
  float v45 = 0.0;
  float v46 = 0.0;
  do
  {
    float v46 = v46 + *(float *)&v66[v44];
    *(float *)&v72[v44] = v46 / *(float *)&v43;
    float v45 = v45 + *(float *)&v65[v44];
    *(float *)&v71[v44] = v45 / *(float *)&v42;
    v44 += 4;
  }
  while (v44 != 1024);
  unint64_t v47 = 0;
  float v48 = 0.0;
  float v49 = 0.0;
  do
  {
    float v50 = *(float *)&v72[4 * v47];
    if (v50 >= 0.75 && v48 == 0.0) {
      float v48 = (float)v47 / 255.0;
    }
    if (v50 >= 0.98 && v49 == 0.0) {
      float v49 = (float)v47 / 255.0;
    }
    ++v47;
  }
  while (v47 != 256);
  uint64_t v51 = 0;
  float v52 = 0.0;
  do
  {
    if (*(float *)&v71[4 * v51] >= 0.98 && v52 == 0.0) {
      float v52 = (float)(int)v51 / 255.0;
    }
    ++v51;
  }
  while (v51 != 256);
  double v53 = 1.0;
  double v54 = fmax(fmin(1.0 - v49, 1.0), 0.0);
  if (v49 >= 0.99)
  {
    double v55 = vabdd_f64(0.5, v48);
    if (v48 < 0.9) {
      double v54 = v55;
    }
  }
  if (v52 >= v49) {
    double v53 = 2.0;
  }
  float v56 = fmin(v53 * v54, 0.2);
  v63[0] = @"satPercentile75";
  v64[0] = objc_msgSend(NSNumber, "numberWithFloat:");
  v63[1] = @"satPercentile98";
  *(float *)&double v57 = v49;
  v64[1] = [NSNumber numberWithFloat:v57];
  v63[2] = @"satPercentileG98";
  *(float *)&double v58 = v52;
  v64[2] = [NSNumber numberWithFloat:v58];
  v63[3] = @"satAutoValue";
  *(float *)&double v59 = v56;
  v64[3] = [NSNumber numberWithFloat:v59];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:4];
}

+ (id)smartToneAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  void v17[6] = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = fmax(fmin(*((double *)&v11 + 1), 2.0), -2.0);
  double v6 = fmax(fmin(*(double *)&v12, 2.0), -2.0);
  double v7 = fmax(fmin(*((double *)&v12 + 1), 2.0), -2.0);
  double v8 = fmax(fmin(*(double *)&v13, 2.0), -2.0);
  double v9 = fmax(fmin(*((double *)&v13 + 1), 2.0), -2.0);
  v16[0] = @"inputExposure";
  v17[0] = objc_msgSend(NSNumber, "numberWithDouble:", fmax(fmin(*(double *)&v11, 2.0), -2.0));
  v16[1] = @"inputContrast";
  v17[1] = [NSNumber numberWithDouble:v5];
  v16[2] = @"inputBrightness";
  v17[2] = [NSNumber numberWithDouble:v6];
  v16[3] = @"inputShadows";
  v17[3] = [NSNumber numberWithDouble:v7];
  double v16[4] = @"inputHighlights";
  v17[4] = [NSNumber numberWithDouble:v8];
  v16[5] = @"inputBlack";
  v17[5] = [NSNumber numberWithDouble:v9];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];
}

- (id)smartToneAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  return +[CIImage smartToneAdjustmentsForValue:a4 andStatistics:a3];
}

+ (id)smartToneAdjustmentsForValue:(double)a3 localLightAutoValue:(double)a4 andStatistics:(id)a5
{
  v13[8] = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v12[0] = @"inputExposure";
  v13[0] = [NSNumber numberWithDouble:*(double *)&v7];
  v12[1] = @"inputContrast";
  v13[1] = [NSNumber numberWithDouble:*((double *)&v7 + 1)];
  void v12[2] = @"inputBrightness";
  v13[2] = [NSNumber numberWithDouble:*(double *)&v8];
  double v12[3] = @"inputShadows";
  double v13[3] = [NSNumber numberWithDouble:*((double *)&v8 + 1)];
  v12[4] = @"inputHighlights";
  v13[4] = [NSNumber numberWithDouble:*(double *)&v9];
  v12[5] = @"inputBlack";
  v13[5] = [NSNumber numberWithDouble:*((double *)&v9 + 1)];
  v12[6] = @"inputLocalLight";
  v13[6] = [NSNumber numberWithDouble:*(double *)&v10];
  v12[7] = @"inputRawHighlights";
  v13[7] = [NSNumber numberWithDouble:*((double *)&v10 + 1)];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:8];
}

- (id)smartToneAdjustmentsForValue:(double)a3 localLightAutoValue:(double)a4 andStatistics:(id)a5
{
  return +[CIImage smartToneAdjustmentsForValue:a5 localLightAutoValue:a3 andStatistics:a4];
}

+ (id)smartColorAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"satPercentile75"), "floatValue");
  float v7 = v6;
  objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"satPercentile98"), "floatValue");
  float v9 = v8;
  objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"satPercentileG98"), "floatValue");
  float v11 = v10;
  objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"satAutoValue"), "floatValue");
  float v12 = a3;
  double v13 = v9;
  if (v12 == 0.0 || (double v14 = 0.0, v15 = 0.0, v13 >= 0.01))
  {
    double v16 = v12;
    double v17 = (float)(1.0 - v9);
    if (v16 + v16 <= v17)
    {
      float v19 = 0.0;
    }
    else
    {
      float v18 = -(v17 - v12 * 2.0) * 0.75;
      float v19 = v18;
    }
    float v20 = v12 / 3.0;
    float v21 = v16 / (fmaxf(v7, 0.5) * 3.0);
    if (v7 > 0.0) {
      float v20 = v21;
    }
    if (v12 < 0.0) {
      float v20 = v12;
    }
    float v22 = fminf(fmaxf(v20, -1.0), 1.0);
    if (v11 > 0.75 && v13 > 0.9 && v7 < 0.65 && v7 > 0.5) {
      float v19 = -v19;
    }
    double v14 = v22;
    double v15 = fminf(fmaxf(v19 * 0.5, -1.0), 1.0);
  }
  v26[0] = @"inputVibrancy";
  v27[0] = [NSNumber numberWithDouble:v14];
  v26[1] = @"inputContrast";
  v27[1] = [NSNumber numberWithDouble:v15];
  v26[2] = @"inputCast";
  v27[2] = [NSNumber numberWithDouble:0.0];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
}

- (id)smartColorAdjustmentsForValue:(double)a3 andStatistics:(id)a4
{
  return +[CIImage smartColorAdjustmentsForValue:a4 andStatistics:a3];
}

- (id)metalImageByApplyingFilter:(id)a3 withInputParameters:(id)a4
{
  id result = +[CIFilter metalFilterWithName:a3 withInputParameters:a4];
  if (result)
  {
    id v6 = result;
    [result setValue:self forKey:@"inputImage"];
    return (id)[v6 outputImage];
  }
  return result;
}

- (id)metalImageByApplyingFilter:(id)a3
{
  id result = +[CIFilter metalFilterWithName:a3];
  if (result)
  {
    id v5 = result;
    [result setValue:self forKey:@"inputImage"];
    return (id)[v5 outputImage];
  }
  return result;
}

- (void)_initWithIOSurface:options:owner:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_2(&dword_193671000, v0, v1, "[CIImage initWithIOSurface:options:] kCIImageEdgeRepeat option not supported. Ignoring.", v2, v3, v4, v5, v6);
}

- (void)_initWithIOSurface:options:owner:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_2(&dword_193671000, v0, v1, "[CIImage initWithIOSurface:options:] kCIImageSurfaceFormat option value is not compatable with actual format of surface.", v2, v3, v4, v5, v6);
}

- (void)_initWithIOSurface:(uint64_t)a1 options:(NSObject *)a2 owner:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 68289026;
  v2[1] = 4;
  __int16 v3 = 2082;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "[CIImage initWithIOSurface:options:] failed because surface format was %{public}.4s.", (uint8_t *)v2, 0x12u);
}

- (void)_initWithIOSurface:(uint64_t)a3 options:(uint64_t)a4 owner:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initNaiveWithCGImage:options:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_2(&dword_193671000, v0, v1, "[CIImage initWithCGImage:] kCIImageEdgeRepeat option not supported. Ignoring.", v2, v3, v4, v5, v6);
}

- (void)initWithCGImage:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCGImage:(uint64_t)a3 options:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBitmapData:bytesPerRow:size:format:options:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_2(&dword_193671000, v0, v1, "[CIImage initWithBitmapData:] failed because data length was less than height times bytesPerRow.", v2, v3, v4, v5, v6);
}

- (void)initWithBitmapData:bytesPerRow:size:format:options:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_2(&dword_193671000, v0, v1, "[CIImage initWithBitmapData:] failed because the format is not supported.", v2, v3, v4, v5, v6);
}

- (void)initWithBitmapData:(uint64_t)a3 bytesPerRow:(uint64_t)a4 size:(uint64_t)a5 format:(uint64_t)a6 options:(uint64_t)a7 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTexture:(uint64_t)a3 size:(uint64_t)a4 options:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithTexture:size:options:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s kCIImageTextureTarget option value is not supported. Value was %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithMTLTexture:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMTLTexture:(uint64_t)a3 options:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMTLTexture:(uint64_t)a3 options:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initWithCVImageBuffer:options:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_2(&dword_193671000, v0, v1, "[CIImage initWithCVImageBuffer:] kCIImageEdgeRepeat option not supported. Ignoring.", v2, v3, v4, v5, v6);
}

- (void)_initWithCVImageBuffer:options:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_2(&dword_193671000, v0, v1, "[CIImage initWithCVPixelBuffer:optiopns:] failed because it is not a CVPixelBuffer.", v2, v3, v4, v5, v6);
}

- (void)initWithCVPixelBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCVPixelBuffer:(uint64_t)a1 options:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136446722;
  uint64_t v3 = "-[CIImage initWithCVPixelBuffer:options:]";
  __int16 v4 = 1042;
  int v5 = 4;
  __int16 v6 = 2082;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}s failed because its pixel format %{public}.4s is not supported.", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithCVPixelBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCVPixelBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCVImageBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCVImageBuffer:(uint64_t)a3 options:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_imageByApplyingTransform:(uint64_t)a3 highQualityDownsample:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageByColorMatchingWorkingSpaceToColorSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageByColorMatchingColorSpaceToWorkingSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_imageByToneMappingColorSpaceToWorkingSpace:(uint64_t)a3 targetHeadroom:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_imageByToneMappingColorSpaceToWorkingSpace:(uint64_t)a3 targetHeadroom:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageByToneMappingColorSpaceToWorkingSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageByTaggingWithColorSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageBySettingProperties:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)imageBySettingPropertiesNoCopy:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithArrayOfImages:(int)a1 selector:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  uint64_t v3 = "-[CIImage initWithArrayOfImages:selector:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}s object at index %d of array is not a CIImage.", (uint8_t *)&v2, 0x12u);
}

void __25__CIImage_initWithCoder___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setValue:forKeyPath:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_193671000, v0, v1, "%{public}s not supported for keypath %{public}@.", v2, v3, v4, v5, 2u);
}

@end