@interface CIRAWFilter
+ (CIRAWFilter)filterWithCVPixelBuffer:(CVPixelBufferRef)buffer properties:(NSDictionary *)properties;
+ (CIRAWFilter)filterWithImageData:(NSData *)data identifierHint:(NSString *)identifierHint;
+ (CIRAWFilter)filterWithImageURL:(NSURL *)url;
+ (CIRAWFilter)filterWithImageURL:(id)a3 options:(id)a4;
+ (NSArray)supportedCameraModels;
+ (id)customAttributes;
- (BOOL)isColorNoiseReductionSupported;
- (BOOL)isContrastSupported;
- (BOOL)isDetailSupported;
- (BOOL)isDraftModeEnabled;
- (BOOL)isGamutMappingEnabled;
- (BOOL)isLensCorrectionEnabled;
- (BOOL)isLensCorrectionSupported;
- (BOOL)isLocalToneMapSupported;
- (BOOL)isLuminanceNoiseReductionSupported;
- (BOOL)isMoireReductionSupported;
- (BOOL)isSharpnessSupported;
- (CGImagePropertyOrientation)orientation;
- (CGPoint)neutralChromaticity;
- (CGPoint)neutralLocation;
- (CGSize)nativeSize;
- (CIFilter)linearSpaceFilter;
- (CIImage)portraitEffectsMatte;
- (CIImage)previewImage;
- (CIImage)semanticSegmentationGlassesMatte;
- (CIImage)semanticSegmentationHairMatte;
- (CIImage)semanticSegmentationSkinMatte;
- (CIImage)semanticSegmentationSkyMatte;
- (CIImage)semanticSegmentationTeethMatte;
- (CIRAWDecoderVersion)decoderVersion;
- (CIRAWFilter)initWithCVPixelBuffer:(__CVBuffer *)a3 properties:(id)a4;
- (CIRAWFilter)initWithImageData:(id)a3 identifierHint:(id)a4;
- (CIRAWFilter)initWithImageURL:(id)a3;
- (CIRAWFilterImpl)filterImplementation;
- (NSArray)supportedDecoderVersions;
- (NSData)imageData;
- (NSDictionary)properties;
- (NSString)imageDataHint;
- (NSURL)imageURL;
- (float)baselineExposure;
- (float)boostAmount;
- (float)boostShadowAmount;
- (float)colorNoiseReductionAmount;
- (float)contrastAmount;
- (float)detailAmount;
- (float)exposure;
- (float)extendedDynamicRangeAmount;
- (float)localToneMapAmount;
- (float)luminanceNoiseReductionAmount;
- (float)moireReductionAmount;
- (float)neutralTemperature;
- (float)neutralTint;
- (float)scaleFactor;
- (float)shadowBias;
- (float)sharpnessAmount;
- (id)attributes;
- (id)auxImageWithKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)outputImage;
- (void)dealloc;
- (void)setBaselineExposure:(float)baselineExposure;
- (void)setBoostAmount:(float)boostAmount;
- (void)setBoostShadowAmount:(float)boostShadowAmount;
- (void)setColorNoiseReductionAmount:(float)colorNoiseReductionAmount;
- (void)setContrastAmount:(float)contrastAmount;
- (void)setDecoderVersion:(CIRAWDecoderVersion)decoderVersion;
- (void)setDetailAmount:(float)detailAmount;
- (void)setDraftModeEnabled:(BOOL)draftModeEnabled;
- (void)setExposure:(float)exposure;
- (void)setExtendedDynamicRangeAmount:(float)extendedDynamicRangeAmount;
- (void)setFilterImplementation:(id)a3;
- (void)setGamutMappingEnabled:(BOOL)gamutMappingEnabled;
- (void)setImageData:(id)a3;
- (void)setImageDataHint:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setLensCorrectionEnabled:(BOOL)lensCorrectionEnabled;
- (void)setLinearSpaceFilter:(CIFilter *)linearSpaceFilter;
- (void)setLocalToneMapAmount:(float)localToneMapAmount;
- (void)setLuminanceNoiseReductionAmount:(float)luminanceNoiseReductionAmount;
- (void)setMoireReductionAmount:(float)moireReductionAmount;
- (void)setNeutralChromaticity:(CGPoint)neutralChromaticity;
- (void)setNeutralLocation:(CGPoint)neutralLocation;
- (void)setNeutralTemperature:(float)neutralTemperature;
- (void)setNeutralTint:(float)neutralTint;
- (void)setOrientation:(CGImagePropertyOrientation)orientation;
- (void)setScaleFactor:(float)scaleFactor;
- (void)setShadowBias:(float)shadowBias;
- (void)setSharpnessAmount:(float)sharpnessAmount;
@end

@implementation CIRAWFilter

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryStillImage";
  v3[1] = @"CICategoryHighDynamicRange";
  v3[2] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  v5[1] = @"12.0";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"15.0";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (CGSize)nativeSize
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"outputNativeSize"];
  [v2 X];
  double v4 = v3;
  [v2 Y];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = (void *)MEMORY[0x199702DB0](self, a2);
  v8.receiver = self;
  v8.super_class = (Class)CIRAWFilter;
  id v6 = [(CIFilter *)&v8 copyWithZone:a3];
  objc_msgSend(v6, "setFilterImplementation:", (id)-[CIRAWFilterImpl copy](self->filterImplementation, "copy"));
  objc_msgSend(v6, "setImageURL:", (id)-[NSURL copy](self->imageURL, "copy"));
  objc_msgSend(v6, "setImageData:", (id)-[NSData copy](self->imageData, "copy"));
  objc_msgSend(v6, "setImageDataHint:", (id)-[NSString copy](self->imageDataHint, "copy"));
  return v6;
}

- (id)outputImage
{
  v2 = [(CIRAWFilter *)self filterImplementation];

  return [(CIRAWFilterImpl *)v2 outputImage];
}

- (NSDictionary)properties
{
  v2 = [(CIRAWFilter *)self filterImplementation];

  return (NSDictionary *)[(CIRAWFilterImpl *)v2 valueForKey:@"properties"];
}

- (CGImagePropertyOrientation)orientation
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputImageOrientation"];

  return [v2 intValue];
}

- (void)setOrientation:(CGImagePropertyOrientation)orientation
{
  uint64_t v3 = *(void *)&orientation;
  double v4 = [(CIRAWFilter *)self filterImplementation];
  uint64_t v5 = [NSNumber numberWithInt:v3];

  [(CIRAWFilterImpl *)v4 setValue:v5 forKey:@"inputImageOrientation"];
}

- (BOOL)isDraftModeEnabled
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputDraftMode"];

  return [v2 BOOLValue];
}

- (void)setDraftModeEnabled:(BOOL)draftModeEnabled
{
  BOOL v3 = draftModeEnabled;
  double v4 = [(CIRAWFilter *)self filterImplementation];
  uint64_t v5 = [NSNumber numberWithBool:v3];

  [(CIRAWFilterImpl *)v4 setValue:v5 forKey:@"inputDraftMode"];
}

- (NSArray)supportedDecoderVersions
{
  v19[6] = *MEMORY[0x1E4F143B8];
  v18[0] = @"8";
  v18[1] = @"8.dng";
  v19[0] = @"8";
  v19[1] = @"8.dng";
  v18[2] = @"7";
  v18[3] = @"7.dng";
  v19[2] = @"7";
  v19[3] = @"7.dng";
  v18[4] = @"6";
  v18[5] = @"6.dng";
  v19[4] = @"6";
  v19[5] = @"6.dng";
  BOOL v3 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  double v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"supportedDecoderVersions"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
        if (v10) {
          [v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }
  if ([v4 count]) {
    return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:v4];
  }
  v16 = @"None";
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
}

- (CIRAWDecoderVersion)decoderVersion
{
  v2 = [(CIRAWFilter *)self filterImplementation];

  return (CIRAWDecoderVersion)[(CIRAWFilterImpl *)v2 valueForKey:@"inputDecoderVersion"];
}

- (void)setDecoderVersion:(CIRAWDecoderVersion)decoderVersion
{
  double v4 = [(CIRAWFilter *)self filterImplementation];

  [(CIRAWFilterImpl *)v4 setValue:decoderVersion forKey:@"inputDecoderVersion"];
}

- (float)scaleFactor
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputScaleFactor"];

  [v2 floatValue];
  return result;
}

- (void)setScaleFactor:(float)scaleFactor
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = scaleFactor;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputScaleFactor"];
}

- (float)exposure
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputEV"];

  [v2 floatValue];
  return result;
}

- (void)setExposure:(float)exposure
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = exposure;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputEV"];
}

- (float)shadowBias
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputBias"];

  [v2 floatValue];
  return result;
}

- (void)setShadowBias:(float)shadowBias
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = shadowBias;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputBias"];
}

- (float)baselineExposure
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputBaselineExposure"];

  [v2 floatValue];
  return result;
}

- (void)setBaselineExposure:(float)baselineExposure
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = baselineExposure;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputBaselineExposure"];
}

- (float)boostAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputBoost"];

  [v2 floatValue];
  return result;
}

- (void)setBoostAmount:(float)boostAmount
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = boostAmount;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputBoost"];
}

- (float)boostShadowAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputBoostShadowAmount"];

  [v2 floatValue];
  return result;
}

- (void)setBoostShadowAmount:(float)boostShadowAmount
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = boostShadowAmount;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputBoostShadowAmount"];
}

- (BOOL)isGamutMappingEnabled
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", @"inputDisableGamutMap"), "BOOLValue") ^ 1;
}

- (void)setGamutMappingEnabled:(BOOL)gamutMappingEnabled
{
  BOOL v3 = gamutMappingEnabled;
  double v4 = [(CIRAWFilter *)self filterImplementation];
  uint64_t v5 = [NSNumber numberWithInt:!v3];

  [(CIRAWFilterImpl *)v4 setValue:v5 forKey:@"inputDisableGamutMap"];
}

- (BOOL)isLensCorrectionSupported
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"activeKeys"];

  return [v2 containsObject:@"inputEnableVendorLensCorrection"];
}

- (BOOL)isLensCorrectionEnabled
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputEnableVendorLensCorrection"];

  return [v2 BOOLValue];
}

- (void)setLensCorrectionEnabled:(BOOL)lensCorrectionEnabled
{
  BOOL v3 = lensCorrectionEnabled;
  double v4 = [(CIRAWFilter *)self filterImplementation];
  uint64_t v5 = [NSNumber numberWithBool:v3];

  [(CIRAWFilterImpl *)v4 setValue:v5 forKey:@"inputEnableVendorLensCorrection"];
}

- (BOOL)isLuminanceNoiseReductionSupported
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"activeKeys"];

  return [v2 containsObject:@"inputLuminanceNoiseReductionAmount"];
}

- (float)luminanceNoiseReductionAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputLuminanceNoiseReductionAmount"];

  [v2 floatValue];
  return result;
}

- (void)setLuminanceNoiseReductionAmount:(float)luminanceNoiseReductionAmount
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = luminanceNoiseReductionAmount;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputLuminanceNoiseReductionAmount"];
}

- (BOOL)isColorNoiseReductionSupported
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"activeKeys"];

  return [v2 containsObject:@"inputColorNoiseReductionAmount"];
}

- (float)colorNoiseReductionAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputColorNoiseReductionAmount"];

  [v2 floatValue];
  return result;
}

- (void)setColorNoiseReductionAmount:(float)colorNoiseReductionAmount
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = colorNoiseReductionAmount;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputColorNoiseReductionAmount"];
}

- (BOOL)isSharpnessSupported
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"activeKeys"];

  return [v2 containsObject:@"inputNoiseReductionSharpnessAmount"];
}

- (float)sharpnessAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputNoiseReductionSharpnessAmount"];

  [v2 floatValue];
  return result;
}

- (void)setSharpnessAmount:(float)sharpnessAmount
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = sharpnessAmount;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputNoiseReductionSharpnessAmount"];
}

- (BOOL)isContrastSupported
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"activeKeys"];

  return [v2 containsObject:@"inputNoiseReductionContrastAmount"];
}

- (float)contrastAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputNoiseReductionContrastAmount"];

  [v2 floatValue];
  return result;
}

- (void)setContrastAmount:(float)contrastAmount
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = contrastAmount;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputNoiseReductionContrastAmount"];
}

- (BOOL)isDetailSupported
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"activeKeys"];

  return [v2 containsObject:@"inputNoiseReductionDetailAmount"];
}

- (float)detailAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputNoiseReductionDetailAmount"];

  [v2 floatValue];
  return result;
}

- (void)setDetailAmount:(float)detailAmount
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = detailAmount;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputNoiseReductionDetailAmount"];
}

- (BOOL)isMoireReductionSupported
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"activeKeys"];

  return [v2 containsObject:@"inputMoireAmount"];
}

- (float)moireReductionAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputMoireAmount"];

  [v2 floatValue];
  return result;
}

- (void)setMoireReductionAmount:(float)moireReductionAmount
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = moireReductionAmount;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputMoireAmount"];
}

- (BOOL)isLocalToneMapSupported
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"activeKeys"];

  return [v2 containsObject:@"inputLocalToneMapAmount"];
}

- (float)localToneMapAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputLocalToneMapAmount"];

  [v2 floatValue];
  return result;
}

- (void)setLocalToneMapAmount:(float)localToneMapAmount
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = localToneMapAmount;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputLocalToneMapAmount"];
}

- (float)extendedDynamicRangeAmount
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputEnableEDRMode"];

  [v2 floatValue];
  return result;
}

- (void)setExtendedDynamicRangeAmount:(float)extendedDynamicRangeAmount
{
  float v3 = fminf(fmaxf(extendedDynamicRangeAmount, 0.0), 2.0);
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = v3;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputEnableEDRMode"];
}

- (CGPoint)neutralChromaticity
{
  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", @"inputNeutralChromaticityX"), "floatValue");
  float v4 = v3;
  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", @"inputNeutralChromaticityY"), "floatValue");
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)setNeutralChromaticity:(CGPoint)neutralChromaticity
{
  double y = neutralChromaticity.y;
  double x = neutralChromaticity.x;
  double v6 = [(CIRAWFilter *)self filterImplementation];
  -[CIRAWFilterImpl setValue:forKey:](v6, "setValue:forKey:", [NSNumber numberWithDouble:x], @"inputNeutralChromaticityX");
  double v7 = [(CIRAWFilter *)self filterImplementation];
  uint64_t v8 = [NSNumber numberWithDouble:y];

  [(CIRAWFilterImpl *)v7 setValue:v8 forKey:@"inputNeutralChromaticityY"];
}

- (CGPoint)neutralLocation
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputNeutralLocation"];
  [v2 X];
  double v4 = v3;
  [v2 Y];
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (void)setNeutralLocation:(CGPoint)neutralLocation
{
  double v4 = +[CIVector vectorWithX:neutralLocation.x Y:neutralLocation.y];
  double v5 = [(CIRAWFilter *)self filterImplementation];

  [(CIRAWFilterImpl *)v5 setValue:v4 forKey:@"inputNeutralLocation"];
}

- (float)neutralTemperature
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputNeutralTemperature"];

  [v2 floatValue];
  return result;
}

- (void)setNeutralTemperature:(float)neutralTemperature
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = neutralTemperature;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputNeutralTemperature"];
}

- (float)neutralTint
{
  v2 = (void *)[(CIRAWFilterImpl *)[(CIRAWFilter *)self filterImplementation] valueForKey:@"inputNeutralTint"];

  [v2 floatValue];
  return result;
}

- (void)setNeutralTint:(float)neutralTint
{
  double v4 = [(CIRAWFilter *)self filterImplementation];
  *(float *)&double v5 = neutralTint;
  uint64_t v6 = [NSNumber numberWithFloat:v5];

  [(CIRAWFilterImpl *)v4 setValue:v6 forKey:@"inputNeutralTint"];
}

- (CIFilter)linearSpaceFilter
{
  v2 = [(CIRAWFilter *)self filterImplementation];

  return (CIFilter *)[(CIRAWFilterImpl *)v2 valueForKey:@"inputLinearSpaceFilter"];
}

- (void)setLinearSpaceFilter:(CIFilter *)linearSpaceFilter
{
  double v4 = [(CIRAWFilter *)self filterImplementation];

  [(CIRAWFilterImpl *)v4 setValue:linearSpaceFilter forKey:@"inputLinearSpaceFilter"];
}

- (CIImage)previewImage
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(CIRAWFilter *)self imageURL])
  {
    double v3 = CGImageSourceCreateWithURL((CFURLRef)[(CIRAWFilter *)self imageURL], 0);
  }
  else
  {
    if (![(CIRAWFilter *)self imageData]) {
      return 0;
    }
    if ([(CIRAWFilter *)self imageDataHint])
    {
      uint64_t v10 = *MEMORY[0x1E4F2FF78];
      v11[0] = [(CIRAWFilter *)self imageDataHint];
      CFDictionaryRef v4 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    }
    else
    {
      CFDictionaryRef v4 = 0;
    }
    double v3 = CGImageSourceCreateWithData((CFDataRef)[(CIRAWFilter *)self imageData], v4);
  }
  double v5 = v3;
  if (!v3) {
    return 0;
  }
  ThumbnailAtIndedouble x = CGImageSourceCreateThumbnailAtIndex(v3, 0, 0);
  if (ThumbnailAtIndex)
  {
    double v7 = ThumbnailAtIndex;
    uint64_t v8 = +[CIImage imageWithCGImage:ThumbnailAtIndex];
    CGImageRelease(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)auxImageWithKey:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if ([(CIRAWFilter *)self imageDataHint])
  {
    v15[0] = MEMORY[0x1E4F1CC38];
    uint64_t v5 = *MEMORY[0x1E4F2FF78];
    v14[0] = a3;
    v14[1] = v5;
    v15[1] = [(CIRAWFilter *)self imageDataHint];
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    double v7 = v15;
    uint64_t v8 = (id *)v14;
    uint64_t v9 = 2;
  }
  else
  {
    id v12 = a3;
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
    double v7 = &v13;
    uint64_t v8 = &v12;
    uint64_t v9 = 1;
  }
  uint64_t v10 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:v9];
  if ([(CIRAWFilter *)self imageURL]) {
    return +[CIImage imageWithContentsOfURL:[(CIRAWFilter *)self imageURL] options:v10];
  }
  id result = [(CIRAWFilter *)self imageData];
  if (result) {
    return +[CIImage imageWithData:[(CIRAWFilter *)self imageData] options:v10];
  }
  return result;
}

- (CIImage)portraitEffectsMatte
{
  return (CIImage *)[(CIRAWFilter *)self auxImageWithKey:@"kCIImageAuxiliaryPortraitEffectsMatte"];
}

- (CIImage)semanticSegmentationSkinMatte
{
  return (CIImage *)[(CIRAWFilter *)self auxImageWithKey:@"kCIImageAuxiliarySemanticSegmentationSkinMatte"];
}

- (CIImage)semanticSegmentationHairMatte
{
  return (CIImage *)[(CIRAWFilter *)self auxImageWithKey:@"kCIImageAuxiliarySemanticSegmentationHairMatte"];
}

- (CIImage)semanticSegmentationGlassesMatte
{
  return (CIImage *)[(CIRAWFilter *)self auxImageWithKey:@"kCIImageAuxiliarySemanticSegmentationGlassesMatte"];
}

- (CIImage)semanticSegmentationSkyMatte
{
  return (CIImage *)[(CIRAWFilter *)self auxImageWithKey:@"kCIImageAuxiliarySemanticSegmentationSkyMatte"];
}

- (CIImage)semanticSegmentationTeethMatte
{
  return (CIImage *)[(CIRAWFilter *)self auxImageWithKey:@"kCIImageAuxiliarySemanticSegmentationTeethMatte"];
}

- (CIRAWFilter)initWithImageURL:(id)a3
{
  if (self)
  {
    self->filterImplementation = (CIRAWFilterImpl *)+[CIRAWFilterImpl filterWithImageURL:a3 options:0];
    self->imageURL = (NSURL *)a3;
  }
  return self;
}

- (CIRAWFilter)initWithImageData:(id)a3 identifierHint:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if (a4)
    {
      uint64_t v9 = *MEMORY[0x1E4F2FF78];
      v10[0] = a4;
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      uint64_t v7 = 0;
    }
    self->filterImplementation = (CIRAWFilterImpl *)+[CIRAWFilterImpl filterWithImageData:a3 options:v7];
    self->imageData = (NSData *)a3;
    self->imageDataHint = (NSString *)a4;
  }
  return self;
}

- (CIRAWFilter)initWithCVPixelBuffer:(__CVBuffer *)a3 properties:(id)a4
{
  if (self) {
    self->filterImplementation = (CIRAWFilterImpl *)+[CIRAWFilterImpl filterWithCVPixelBuffer:a3 properties:a4 options:0];
  }
  return self;
}

+ (NSArray)supportedCameraModels
{
  id result = +[CIRAWFilterImpl supportedRawCameraModels];
  if (!result) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

+ (CIRAWFilter)filterWithImageURL:(NSURL *)url
{
  double v3 = (void *)[objc_alloc((Class)a1) initWithImageURL:url];

  return (CIRAWFilter *)v3;
}

+ (CIRAWFilter)filterWithImageURL:(id)a3 options:(id)a4
{
  CFDictionaryRef v4 = (void *)[objc_alloc((Class)a1) initWithImageURL:a3];

  return (CIRAWFilter *)v4;
}

+ (CIRAWFilter)filterWithImageData:(NSData *)data identifierHint:(NSString *)identifierHint
{
  CFDictionaryRef v4 = (void *)[objc_alloc((Class)a1) initWithImageData:data identifierHint:identifierHint];

  return (CIRAWFilter *)v4;
}

+ (CIRAWFilter)filterWithCVPixelBuffer:(CVPixelBufferRef)buffer properties:(NSDictionary *)properties
{
  CFDictionaryRef v4 = (void *)[objc_alloc((Class)a1) initWithCVPixelBuffer:buffer properties:properties];

  return (CIRAWFilter *)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CIRAWFilter;
  [(CIFilter *)&v3 dealloc];
}

- (id)attributes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__CIRAWFilter_attributes__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = self;
  if (attributes_onceToken != -1) {
    dispatch_once(&attributes_onceToken, block);
  }
  return (id)attributes_rawFilterAttributes;
}

void __25__CIRAWFilter_attributes__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x199702DB0]();
  [*(id *)(a1 + 32) filterImplementation];
  objc_super v3 = objc_msgSend(+[CIFilterClassAttributes classAttributesForClass:](CIFilterClassAttributes, "classAttributesForClass:", objc_opt_class()), "mutableCopy");
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)CIRAWFilter;
  objc_msgSend(v3, "addEntriesFromDictionary:", objc_msgSendSuper2(&v4, sel_attributes));
  attributes_rawFilterAttributes = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v3];
}

- (CIRAWFilterImpl)filterImplementation
{
  return (CIRAWFilterImpl *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFilterImplementation:(id)a3
{
}

- (NSURL)imageURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setImageURL:(id)a3
{
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setImageData:(id)a3
{
}

- (NSString)imageDataHint
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setImageDataHint:(id)a3
{
}

@end