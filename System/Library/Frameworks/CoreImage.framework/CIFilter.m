@interface CIFilter
+ (BOOL)exchangeImplementationsForClass;
+ (BOOL)supportsSecureCoding;
+ (BOOL)wrapClassIfNeeded:(Class)a3;
+ (CGImageMetadata)_imageMetadataFromFilters:(id)a3 inputImageExtent:(CGRect)a4;
+ (CIFilter)CMYKHalftone;
+ (CIFilter)KMeansFilter;
+ (CIFilter)LabDeltaE;
+ (CIFilter)PDF417BarcodeGenerator;
+ (CIFilter)QRCodeGenerator;
+ (CIFilter)accordionFoldTransitionFilter;
+ (CIFilter)additionCompositingFilter;
+ (CIFilter)affineClampFilter;
+ (CIFilter)affineTileFilter;
+ (CIFilter)areaAverageFilter;
+ (CIFilter)areaHistogramFilter;
+ (CIFilter)areaLogarithmicHistogramFilter;
+ (CIFilter)areaMaximumAlphaFilter;
+ (CIFilter)areaMaximumFilter;
+ (CIFilter)areaMinMaxFilter;
+ (CIFilter)areaMinMaxRedFilter;
+ (CIFilter)areaMinimumAlphaFilter;
+ (CIFilter)areaMinimumFilter;
+ (CIFilter)attributedTextImageGeneratorFilter;
+ (CIFilter)aztecCodeGeneratorFilter;
+ (CIFilter)barcodeGeneratorFilter;
+ (CIFilter)barsSwipeTransitionFilter;
+ (CIFilter)bicubicScaleTransformFilter;
+ (CIFilter)blendWithAlphaMaskFilter;
+ (CIFilter)blendWithBlueMaskFilter;
+ (CIFilter)blendWithMaskFilter;
+ (CIFilter)blendWithRedMaskFilter;
+ (CIFilter)bloomFilter;
+ (CIFilter)blurredRectangleGeneratorFilter;
+ (CIFilter)bokehBlurFilter;
+ (CIFilter)boxBlurFilter;
+ (CIFilter)bumpDistortionFilter;
+ (CIFilter)bumpDistortionLinearFilter;
+ (CIFilter)cannyEdgeDetectorFilter;
+ (CIFilter)checkerboardGeneratorFilter;
+ (CIFilter)circleSplashDistortionFilter;
+ (CIFilter)circularScreenFilter;
+ (CIFilter)circularWrapFilter;
+ (CIFilter)code128BarcodeGeneratorFilter;
+ (CIFilter)colorAbsoluteDifferenceFilter;
+ (CIFilter)colorBlendModeFilter;
+ (CIFilter)colorBurnBlendModeFilter;
+ (CIFilter)colorClampFilter;
+ (CIFilter)colorControlsFilter;
+ (CIFilter)colorCrossPolynomialFilter;
+ (CIFilter)colorCubeFilter;
+ (CIFilter)colorCubeWithColorSpaceFilter;
+ (CIFilter)colorCubesMixedWithMaskFilter;
+ (CIFilter)colorCurvesFilter;
+ (CIFilter)colorDodgeBlendModeFilter;
+ (CIFilter)colorInvertFilter;
+ (CIFilter)colorMapFilter;
+ (CIFilter)colorMatrixFilter;
+ (CIFilter)colorMonochromeFilter;
+ (CIFilter)colorPolynomialFilter;
+ (CIFilter)colorPosterizeFilter;
+ (CIFilter)colorThresholdFilter;
+ (CIFilter)colorThresholdOtsuFilter;
+ (CIFilter)columnAverageFilter;
+ (CIFilter)comicEffectFilter;
+ (CIFilter)convertLabToRGBFilter;
+ (CIFilter)convertRGBtoLabFilter;
+ (CIFilter)convolution3X3Filter;
+ (CIFilter)convolution5X5Filter;
+ (CIFilter)convolution7X7Filter;
+ (CIFilter)convolution9HorizontalFilter;
+ (CIFilter)convolution9VerticalFilter;
+ (CIFilter)convolutionRGB3X3Filter;
+ (CIFilter)convolutionRGB5X5Filter;
+ (CIFilter)convolutionRGB7X7Filter;
+ (CIFilter)convolutionRGB9HorizontalFilter;
+ (CIFilter)convolutionRGB9VerticalFilter;
+ (CIFilter)copyMachineTransitionFilter;
+ (CIFilter)coreMLModelFilter;
+ (CIFilter)crystallizeFilter;
+ (CIFilter)darkenBlendModeFilter;
+ (CIFilter)depthOfFieldFilter;
+ (CIFilter)depthToDisparityFilter;
+ (CIFilter)differenceBlendModeFilter;
+ (CIFilter)discBlurFilter;
+ (CIFilter)disintegrateWithMaskTransitionFilter;
+ (CIFilter)disparityToDepthFilter;
+ (CIFilter)displacementDistortionFilter;
+ (CIFilter)dissolveTransitionFilter;
+ (CIFilter)ditherFilter;
+ (CIFilter)divideBlendModeFilter;
+ (CIFilter)documentEnhancerFilter;
+ (CIFilter)dotScreenFilter;
+ (CIFilter)drosteFilter;
+ (CIFilter)edgePreserveUpsampleFilter;
+ (CIFilter)edgeWorkFilter;
+ (CIFilter)edgesFilter;
+ (CIFilter)eightfoldReflectedTileFilter;
+ (CIFilter)exclusionBlendModeFilter;
+ (CIFilter)exposureAdjustFilter;
+ (CIFilter)falseColorFilter;
+ (CIFilter)filterWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer properties:(NSDictionary *)properties options:(NSDictionary *)options;
+ (CIFilter)filterWithImageData:(NSData *)data options:(NSDictionary *)options;
+ (CIFilter)filterWithImageURL:(NSURL *)url options:(NSDictionary *)options;
+ (CIFilter)filterWithName:(NSString *)name;
+ (CIFilter)filterWithName:(NSString *)name keysAndValues:(id)key0;
+ (CIFilter)filterWithName:(NSString *)name withInputParameters:(NSDictionary *)params;
+ (CIFilter)filterWithName:(id)a3 compatibilityVersion:(int)a4;
+ (CIFilter)filterWithName:(id)a3 compatibilityVersion:(int)a4 keysAndValues:(id)a5;
+ (CIFilter)filterWithName:(id)a3 setDefaults:(BOOL)a4;
+ (CIFilter)filterWithString:(id)a3;
+ (CIFilter)flashTransitionFilter;
+ (CIFilter)fourfoldReflectedTileFilter;
+ (CIFilter)fourfoldRotatedTileFilter;
+ (CIFilter)fourfoldTranslatedTileFilter;
+ (CIFilter)gaborGradientsFilter;
+ (CIFilter)gammaAdjustFilter;
+ (CIFilter)gaussianBlurFilter;
+ (CIFilter)gaussianGradientFilter;
+ (CIFilter)glassDistortionFilter;
+ (CIFilter)glassLozengeFilter;
+ (CIFilter)glideReflectedTileFilter;
+ (CIFilter)gloomFilter;
+ (CIFilter)hardLightBlendModeFilter;
+ (CIFilter)hatchedScreenFilter;
+ (CIFilter)heightFieldFromMaskFilter;
+ (CIFilter)hexagonalPixellateFilter;
+ (CIFilter)highlightShadowAdjustFilter;
+ (CIFilter)histogramDisplayFilter;
+ (CIFilter)holeDistortionFilter;
+ (CIFilter)hueAdjustFilter;
+ (CIFilter)hueBlendModeFilter;
+ (CIFilter)hueSaturationValueGradientFilter;
+ (CIFilter)kaleidoscopeFilter;
+ (CIFilter)keystoneCorrectionCombinedFilter;
+ (CIFilter)keystoneCorrectionHorizontalFilter;
+ (CIFilter)keystoneCorrectionVerticalFilter;
+ (CIFilter)lanczosScaleTransformFilter;
+ (CIFilter)lenticularHaloGeneratorFilter;
+ (CIFilter)lightTunnelFilter;
+ (CIFilter)lightenBlendModeFilter;
+ (CIFilter)lineOverlayFilter;
+ (CIFilter)lineScreenFilter;
+ (CIFilter)linearBurnBlendModeFilter;
+ (CIFilter)linearDodgeBlendModeFilter;
+ (CIFilter)linearGradientFilter;
+ (CIFilter)linearLightBlendModeFilter;
+ (CIFilter)linearToSRGBToneCurveFilter;
+ (CIFilter)luminosityBlendModeFilter;
+ (CIFilter)maskToAlphaFilter;
+ (CIFilter)maskedVariableBlurFilter;
+ (CIFilter)maximumComponentFilter;
+ (CIFilter)maximumCompositingFilter;
+ (CIFilter)medianFilter;
+ (CIFilter)meshGeneratorFilter;
+ (CIFilter)minimumComponentFilter;
+ (CIFilter)minimumCompositingFilter;
+ (CIFilter)mixFilter;
+ (CIFilter)modTransitionFilter;
+ (CIFilter)morphologyGradientFilter;
+ (CIFilter)morphologyMaximumFilter;
+ (CIFilter)morphologyMinimumFilter;
+ (CIFilter)morphologyRectangleMaximumFilter;
+ (CIFilter)morphologyRectangleMinimumFilter;
+ (CIFilter)motionBlurFilter;
+ (CIFilter)multiplyBlendModeFilter;
+ (CIFilter)multiplyCompositingFilter;
+ (CIFilter)ninePartStretchedFilter;
+ (CIFilter)ninePartTiledFilter;
+ (CIFilter)noiseReductionFilter;
+ (CIFilter)opTileFilter;
+ (CIFilter)overlayBlendModeFilter;
+ (CIFilter)pageCurlTransitionFilter;
+ (CIFilter)pageCurlWithShadowTransitionFilter;
+ (CIFilter)paletteCentroidFilter;
+ (CIFilter)palettizeFilter;
+ (CIFilter)parallelogramTileFilter;
+ (CIFilter)personSegmentationFilter;
+ (CIFilter)perspectiveCorrectionFilter;
+ (CIFilter)perspectiveRotateFilter;
+ (CIFilter)perspectiveTileFilter;
+ (CIFilter)perspectiveTransformFilter;
+ (CIFilter)perspectiveTransformWithExtentFilter;
+ (CIFilter)photoEffectChromeFilter;
+ (CIFilter)photoEffectFadeFilter;
+ (CIFilter)photoEffectInstantFilter;
+ (CIFilter)photoEffectMonoFilter;
+ (CIFilter)photoEffectNoirFilter;
+ (CIFilter)photoEffectProcessFilter;
+ (CIFilter)photoEffectTonalFilter;
+ (CIFilter)photoEffectTransferFilter;
+ (CIFilter)pinLightBlendModeFilter;
+ (CIFilter)pinchDistortionFilter;
+ (CIFilter)pixellateFilter;
+ (CIFilter)pointillizeFilter;
+ (CIFilter)radialGradientFilter;
+ (CIFilter)randomGeneratorFilter;
+ (CIFilter)rippleTransitionFilter;
+ (CIFilter)roundedRectangleGeneratorFilter;
+ (CIFilter)roundedRectangleStrokeGeneratorFilter;
+ (CIFilter)rowAverageFilter;
+ (CIFilter)sRGBToneCurveToLinearFilter;
+ (CIFilter)saliencyMapFilter;
+ (CIFilter)saturationBlendModeFilter;
+ (CIFilter)screenBlendModeFilter;
+ (CIFilter)sepiaToneFilter;
+ (CIFilter)shadedMaterialFilter;
+ (CIFilter)sharpenLuminanceFilter;
+ (CIFilter)sixfoldReflectedTileFilter;
+ (CIFilter)sixfoldRotatedTileFilter;
+ (CIFilter)smoothLinearGradientFilter;
+ (CIFilter)sobelGradientsFilter;
+ (CIFilter)softLightBlendModeFilter;
+ (CIFilter)sourceAtopCompositingFilter;
+ (CIFilter)sourceInCompositingFilter;
+ (CIFilter)sourceOutCompositingFilter;
+ (CIFilter)sourceOverCompositingFilter;
+ (CIFilter)spotColorFilter;
+ (CIFilter)spotLightFilter;
+ (CIFilter)starShineGeneratorFilter;
+ (CIFilter)straightenFilter;
+ (CIFilter)stretchCropFilter;
+ (CIFilter)stripesGeneratorFilter;
+ (CIFilter)subtractBlendModeFilter;
+ (CIFilter)sunbeamsGeneratorFilter;
+ (CIFilter)swipeTransitionFilter;
+ (CIFilter)temperatureAndTintFilter;
+ (CIFilter)textImageGeneratorFilter;
+ (CIFilter)thermalFilter;
+ (CIFilter)toneCurveFilter;
+ (CIFilter)torusLensDistortionFilter;
+ (CIFilter)triangleKaleidoscopeFilter;
+ (CIFilter)triangleTileFilter;
+ (CIFilter)twelvefoldReflectedTileFilter;
+ (CIFilter)twirlDistortionFilter;
+ (CIFilter)unsharpMaskFilter;
+ (CIFilter)vibranceFilter;
+ (CIFilter)vignetteEffectFilter;
+ (CIFilter)vignetteFilter;
+ (CIFilter)vividLightBlendModeFilter;
+ (CIFilter)vortexDistortionFilter;
+ (CIFilter)whitePointAdjustFilter;
+ (CIFilter)xRayFilter;
+ (CIFilter)zoomBlurFilter;
+ (NSArray)filterArrayFromSerializedXMP:(NSData *)xmpData inputImageExtent:(CGRect)extent error:(NSError *)outError;
+ (NSArray)filterNamesInCategories:(NSArray *)categories;
+ (NSArray)filterNamesInCategory:(NSString *)category;
+ (NSArray)supportedRawCameraModels;
+ (NSData)serializedXMPFromFilters:(NSArray *)filters inputImageExtent:(CGRect)extent;
+ (NSString)localizedDescriptionForFilterName:(NSString *)filterName;
+ (NSString)localizedNameForCategory:(NSString *)category;
+ (NSString)localizedNameForFilterName:(NSString *)filterName;
+ (NSURL)localizedReferenceDocumentationForFilterName:(NSString *)filterName;
+ (id)_filterArrayFromImageMetadata:(CGImageMetadata *)a3 inputImageExtent:(CGRect)a4;
+ (id)_filterArrayFromProperties:(id)a3;
+ (id)_filterArrayFromProperties:(id)a3 inputImageExtent:(CGRect)a4;
+ (id)_propertyArrayFromFilters:(id)a3 inputImageExtent:(CGRect)a4;
+ (id)allCategories:(BOOL)a3;
+ (id)areaAlphaWeightedHistogramFilter;
+ (id)areaBoundsRedFilter;
+ (id)customAttributes;
+ (id)filterName:(id)a3 append:(id)a4 arguments:(id)a5;
+ (id)filterName:(id)a3 prepend:(id)a4 imageName:(id)a5 arguments:(id)a6;
+ (id)filterName:(id)a3 replacement:(id)a4;
+ (id)filterName:(id)a3 replacement:(id)a4 arguments:(id)a5;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)maximumScaleTransformFilter;
+ (id)metalFilterWithName:(id)a3;
+ (id)metalFilterWithName:(id)a3 withInputParameters:(id)a4;
+ (id)prewarmedFilterFromString:(id)a3;
+ (id)toneMapHeadroomFilter;
+ (int)getMinMaxSimulatedApertureFrom:(__CFData *)a3 minValue:(float *)a4 maxValue:(float *)a5 version:(int *)a6;
+ (int)maxSDOFRenderingVersionSupported;
+ (int)minSDOFRenderingVersionSupported;
+ (unsigned)indexForWrapperNumber:(unsigned int)a3;
+ (void)addFilterToSkip:(id)a3;
+ (void)clearCache;
+ (void)registerFilterName:(NSString *)name constructor:(id)anObject classAttributes:(NSDictionary *)attributes;
+ (void)unregisterFilterName:(id)a3;
- (BOOL)_filterClassInCategory:(id)a3;
- (BOOL)_isIdentity;
- (BOOL)isEnabled;
- (BOOL)verifyPrewarmedFilter:(id)a3;
- (CIFilter)initWithCoder:(id)a3;
- (CIImage)apply:(CIKernel *)k;
- (CIImage)apply:(CIKernel *)k arguments:(NSArray *)args options:(NSDictionary *)dict;
- (CIImage)outputImage;
- (NSArray)inputKeys;
- (NSArray)outputKeys;
- (NSDictionary)attributes;
- (NSString)name;
- (id)_append:(id)a3 image:(id)a4;
- (id)_appendSingleFilterTo:(id)a3 filterAndSettings:(id)a4;
- (id)_copyFilterWithZone:(_NSZone *)a3;
- (id)_serializedXMPString;
- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inSpace:(CGColorSpace *)a6;
- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inoutSpace:(CGColorSpace *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customAttributes;
- (id)debugDescription;
- (id)debugQuickLookObject;
- (id)description;
- (id)outputImageCatchAll:(unsigned int)a3;
- (id)prewarmingString;
- (id)userInfo;
- (id)valueForUndefinedKey:(id)a3;
- (id)wrappedOutputImage10;
- (id)wrappedOutputImage11;
- (id)wrappedOutputImage12;
- (id)wrappedOutputImage13;
- (id)wrappedOutputImage14;
- (id)wrappedOutputImage15;
- (id)wrappedOutputImage16;
- (id)wrappedOutputImage17;
- (id)wrappedOutputImage18;
- (id)wrappedOutputImage19;
- (id)wrappedOutputImage20;
- (id)wrappedOutputImage21;
- (id)wrappedOutputImage22;
- (id)wrappedOutputImage23;
- (id)wrappedOutputImage24;
- (id)wrappedOutputImage25;
- (id)wrappedOutputImage26;
- (id)wrappedOutputImage27;
- (id)wrappedOutputImage28;
- (id)wrappedOutputImage29;
- (id)wrappedOutputImage30;
- (id)wrappedOutputImage31;
- (id)wrappedOutputImage32;
- (id)wrappedOutputImage33;
- (id)wrappedOutputImage34;
- (id)wrappedOutputImage35;
- (id)wrappedOutputImage36;
- (id)wrappedOutputImage37;
- (id)wrappedOutputImage38;
- (id)wrappedOutputImage39;
- (id)wrappedOutputImage40;
- (id)wrappedOutputImage41;
- (id)wrappedOutputImage42;
- (id)wrappedOutputImage43;
- (id)wrappedOutputImage44;
- (id)wrappedOutputImage45;
- (id)wrappedOutputImage46;
- (id)wrappedOutputImage47;
- (id)wrappedOutputImage48;
- (id)wrappedOutputImage49;
- (id)wrappedOutputImage50;
- (id)wrappedOutputImage51;
- (id)wrappedOutputImage52;
- (id)wrappedOutputImage53;
- (id)wrappedOutputImage54;
- (id)wrappedOutputImage55;
- (id)wrappedOutputImage56;
- (id)wrappedOutputImage57;
- (id)wrappedOutputImage58;
- (id)wrappedOutputImage59;
- (id)wrappedOutputImage60;
- (id)wrappedOutputImage61;
- (id)wrappedOutputImage62;
- (id)wrappedOutputImage63;
- (id)wrappedOutputImage64;
- (id)wrappedOutputImage65;
- (id)wrappedOutputImage66;
- (id)wrappedOutputImage67;
- (id)wrappedOutputImage68;
- (id)wrappedOutputImage69;
- (id)wrappedOutputImage70;
- (id)wrappedOutputImage71;
- (id)wrappedOutputImage72;
- (id)wrappedOutputImage73;
- (id)wrappedOutputImage74;
- (id)wrappedOutputImage75;
- (id)wrappedOutputImage76;
- (id)wrappedOutputImage77;
- (id)wrappedOutputImage78;
- (id)wrappedOutputImage79;
- (id)wrappedOutputImage80;
- (id)wrappedOutputImage81;
- (id)wrappedOutputImage82;
- (id)wrappedOutputImage83;
- (id)wrappedOutputImage84;
- (id)wrappedOutputImage85;
- (id)wrappedOutputImage86;
- (id)wrappedOutputImage87;
- (id)wrappedOutputImage88;
- (id)wrappedOutputImage89;
- (id)wrappedOutputImage90;
- (id)wrappedOutputImage91;
- (id)wrappedOutputImage92;
- (id)wrappedOutputImage93;
- (id)wrappedOutputImage94;
- (id)wrappedOutputImage95;
- (id)wrappedOutputImage96;
- (id)wrappedOutputImage97;
- (id)wrappedOutputImage98;
- (id)wrappedOutputImage99;
- (int)compatibilityVersion;
- (unint64_t)hash;
- (void)_crashed_when_dealloc_called_setValue_nil_forKey_probably_because_the_subclass_already_released_it:(id)a3 className:(const char *)a4 overridesDealloc:(BOOL)a5;
- (void)_prepend:(id)a3;
- (void)_prependSingleFilter:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaults;
- (void)setEnabled:(BOOL)enabled;
- (void)setIdentity;
- (void)setName:(NSString *)aString;
- (void)setUserInfo:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CIFilter

+ (CIFilter)filterWithName:(NSString *)name
{
  return (CIFilter *)[a1 filterWithName:name setDefaults:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_crashed_when_dealloc_called_setValue_nil_forKey_probably_because_the_subclass_already_released_it:(id)a3 className:(const char *)a4 overridesDealloc:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)__str = 0u;
  long long v14 = 0u;
  v9 = (const char *)[a3 UTF8String];
  v10 = "";
  if (v5) {
    v10 = " (e.g. in its dealloc method)";
  }
  uint64_t v11 = snprintf(__str, 0x200uLL, "Crashed in [CIFilter dealloc] releasing the value of %s for %s.\nIf a CIFilter subclass releases an ivar%s, it must be set to nil afterwards.\n", v9, a4, v10);
  qword_1EB466910 = (uint64_t)__str;
  v12 = (void *)MEMORY[0x199702DB0](v11);
  [(CIFilter *)self setValue:0 forKey:a3];
  qword_1EB466910 = 0;
}

void *__64__CIFilter_CIFilterRegistryPrivate__filterWithName_setDefaults___block_invoke(uint64_t a1)
{
  result = (void *)registeredFilterConstructors;
  if (registeredFilterConstructors)
  {
    result = (void *)[(id)registeredFilterConstructors valueForKey:*(void *)(a1 + 32)];
    if (result)
    {
      result = (void *)[result objectForKey:kCIConstructorKey];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if ([a4 isEqualToString:@"__inputVersion"])
  {
    v7 = self->_priv[0];
    if (v7) {

    }
    self->_priv[0] = (void *)[a3 copy];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CIFilter;
    [(CIFilter *)&v8 setValue:a3 forUndefinedKey:a4];
  }
}

- (void)dealloc
{
  id v3 = +[CIFilterClassInfo classInfoForClass:objc_opt_class()];
  v4 = (void *)[v3 inputKeys];
  BOOL v5 = (void *)[v3 inputClasses];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  SEL v7 = NSSelectorFromString(&cfstr_Dealloc.isa);
  uint64_t v8 = [(id)objc_opt_class() instanceMethodForSelector:v7];
  uint64_t v9 = +[CIFilter instanceMethodForSelector:v7];
  if ([v4 count])
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v11 = [v4 objectAtIndexedSubscript:v10];
      v12 = (void *)[v5 objectAtIndexedSubscript:v10];
      if ([v12 length] && (objc_msgSend(v12, "isEqualToString:", @"__WrappedNSNumber") & 1) == 0) {
        [(CIFilter *)self _crashed_when_dealloc_called_setValue_nil_forKey_probably_because_the_subclass_already_released_it:v11 className:v6 overridesDealloc:v8 != v9];
      }
      ++v10;
    }
    while (v10 < [v4 count]);
  }

  v13.receiver = self;
  v13.super_class = (Class)CIFilter;
  [(CIFilter *)&v13 dealloc];
}

- (void)setDefaults
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = +[CIFilterClassDefaults classDefaultsForClass:objc_opt_class()];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(CIFilter *)self inputKeys];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v10 = [v3 objectForKey:v9];
        if (v10) {
          [(CIFilter *)self setValue:v10 forKey:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (NSArray)inputKeys
{
  id v2 = +[CIFilterClassInfo classInfoForClass:objc_opt_class()];

  return (NSArray *)[v2 inputKeys];
}

+ (CIFilter)filterWithName:(id)a3 setDefaults:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3052000000;
  long long v17 = __Block_byref_object_copy__8;
  long long v18 = __Block_byref_object_dispose__8;
  uint64_t v19 = 0;
  uint64_t v6 = filterRegistryIsolationQueue();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__CIFilter_CIFilterRegistryPrivate__filterWithName_setDefaults___block_invoke;
  v13[3] = &unk_1E5771C38;
  v13[4] = a3;
  v13[5] = &v14;
  dispatch_sync(v6, v13);
  if (v15[5])
  {
    SEL v7 = NSSelectorFromString(&cfstr_Filterwithname.isa);
    uint64_t v8 = [(id)v15[5] methodForSelector:v7];
    if (v8 != +[CIFilter methodForSelector:v7])
    {
      uint64_t v9 = (CIFilter *)[(id)v15[5] filterWithName:a3];
      if (!v9) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
  }
  uint64_t v10 = NSClassFromString((NSString *)a3);
  if (v10)
  {
    if ([(objc_class *)v10 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v9 = (CIFilter *)objc_alloc_init(v10);
      if (v9)
      {
LABEL_11:
        if (!v4) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
  }
  if (classNameIsSystemFilter((NSString *)a3))
  {
    long long v11 = NSClassFromString((NSString *)a3);
    if (v11)
    {
      uint64_t v9 = (CIFilter *)objc_alloc_init(v11);
      goto LABEL_11;
    }
  }
  uint64_t v9 = 0;
  if (v4) {
LABEL_14:
  }
    [(CIFilter *)v9 setDefaults];
LABEL_15:
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqualToString:@"__inputVersion"]) {
    return self->_priv[0];
  }
  v6.receiver = self;
  v6.super_class = (Class)CIFilter;
  return [(CIFilter *)&v6 valueForUndefinedKey:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v43[18] = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    BOOL v4 = [(CIFilter *)self inputKeys];
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v10 = (CGColorSpace *)[(CIFilter *)self valueForKey:v9];
          if (v10)
          {
            long long v11 = v10;
            CFTypeID v12 = CFGetTypeID(v10);
            CFTypeID TypeID = CGColorSpaceGetTypeID();
            id v14 = [NSString alloc];
            if (v12 == TypeID)
            {
              long long v15 = (void *)[v14 initWithFormat:@"CICS_%@", v9];
              uint64_t v16 = @"cs_deviceGray";
              switch(CGColorSpaceGetType())
              {
                case 0u:
                  goto LABEL_19;
                case 1u:
                  uint64_t v16 = @"cs_deviceRGB";
                  goto LABEL_19;
                case 2u:
                  uint64_t v16 = @"cs_deviceCMYK";
                  goto LABEL_19;
                case 3u:
                  *(void *)&long long v34 = 0;
                  long long v32 = 0u;
                  long long v33 = 0u;
                  long long v31 = 0u;
                  CGColorSpaceGetCalibratedGrayData();
                  v42[0] = [NSNumber numberWithDouble:*(double *)&v31];
                  v42[1] = [NSNumber numberWithDouble:*((double *)&v31 + 1)];
                  v42[2] = [NSNumber numberWithDouble:*(double *)&v32];
                  v42[3] = [NSNumber numberWithDouble:*((double *)&v32 + 1)];
                  v42[4] = [NSNumber numberWithDouble:*(double *)&v33];
                  v42[5] = [NSNumber numberWithDouble:*((double *)&v33 + 1)];
                  v42[6] = [NSNumber numberWithDouble:*(double *)&v34];
                  long long v20 = (void *)MEMORY[0x1E4F1C978];
                  long long v21 = v42;
                  uint64_t v22 = 7;
                  goto LABEL_18;
                case 4u:
                  long long v38 = 0u;
                  *(_OWORD *)long long v39 = 0u;
                  long long v36 = 0u;
                  long long v37 = 0u;
                  long long v34 = 0u;
                  long long v35 = 0u;
                  long long v32 = 0u;
                  long long v33 = 0u;
                  long long v31 = 0u;
                  CGColorSpaceGetCalibratedRGBData();
                  v43[0] = [NSNumber numberWithDouble:*(double *)&v31];
                  v43[1] = [NSNumber numberWithDouble:*((double *)&v31 + 1)];
                  v43[2] = [NSNumber numberWithDouble:*(double *)&v32];
                  v43[3] = [NSNumber numberWithDouble:*((double *)&v32 + 1)];
                  v43[4] = [NSNumber numberWithDouble:*(double *)&v33];
                  v43[5] = [NSNumber numberWithDouble:*((double *)&v33 + 1)];
                  v43[6] = [NSNumber numberWithDouble:*(double *)&v34];
                  v43[7] = [NSNumber numberWithDouble:*((double *)&v34 + 1)];
                  v43[8] = [NSNumber numberWithDouble:*(double *)&v35];
                  v43[9] = [NSNumber numberWithDouble:*((double *)&v35 + 1)];
                  v43[10] = [NSNumber numberWithDouble:*(double *)&v36];
                  v43[11] = [NSNumber numberWithDouble:*((double *)&v36 + 1)];
                  v43[12] = [NSNumber numberWithDouble:*(double *)&v37];
                  v43[13] = [NSNumber numberWithDouble:*((double *)&v37 + 1)];
                  v43[14] = [NSNumber numberWithDouble:*(double *)&v38];
                  v43[15] = [NSNumber numberWithDouble:*((double *)&v38 + 1)];
                  v43[16] = [NSNumber numberWithDouble:v39[0]];
                  v43[17] = [NSNumber numberWithDouble:v39[1]];
                  long long v20 = (void *)MEMORY[0x1E4F1C978];
                  long long v21 = v43;
                  uint64_t v22 = 18;
                  goto LABEL_18;
                case 5u:
                  long long v35 = 0u;
                  long long v36 = 0u;
                  long long v33 = 0u;
                  long long v34 = 0u;
                  long long v31 = 0u;
                  long long v32 = 0u;
                  CGColorSpaceGetLabData();
                  v41[0] = [NSNumber numberWithDouble:*(double *)&v31];
                  v41[1] = [NSNumber numberWithDouble:*((double *)&v31 + 1)];
                  v41[2] = [NSNumber numberWithDouble:*(double *)&v32];
                  v41[3] = [NSNumber numberWithDouble:*((double *)&v32 + 1)];
                  v41[4] = [NSNumber numberWithDouble:*(double *)&v33];
                  v41[5] = [NSNumber numberWithDouble:*((double *)&v33 + 1)];
                  v41[6] = [NSNumber numberWithDouble:*(double *)&v34];
                  v41[7] = [NSNumber numberWithDouble:*((double *)&v34 + 1)];
                  v41[8] = [NSNumber numberWithDouble:*(double *)&v35];
                  v41[9] = [NSNumber numberWithDouble:*((double *)&v35 + 1)];
                  long long v20 = (void *)MEMORY[0x1E4F1C978];
                  long long v21 = v41;
                  uint64_t v22 = 10;
LABEL_18:
                  uint64_t v16 = (__CFString *)[v20 arrayWithObjects:v21 count:v22];
                  if (v16) {
                    goto LABEL_19;
                  }
                  goto LABEL_21;
                default:
                  CFDataRef v19 = CGColorSpaceCopyICCData(v11);
                  if (!v19) {
                    goto LABEL_21;
                  }
                  uint64_t v16 = (__CFString *)v19;
                  CFAutorelease(v19);
LABEL_19:
                  id v17 = a3;
                  long long v18 = v16;
                  break;
              }
            }
            else
            {
              long long v15 = (void *)[v14 initWithFormat:@"CI_%@", v9];
              id v17 = a3;
              long long v18 = v11;
            }
            [v17 encodeObject:v18 forKey:v15];
LABEL_21:
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v40 count:16];
      }
      while (v6);
    }
    if (-[CIFilter userInfo](self, "userInfo") && -[CIFilter encodeWithCoder:]::onceToken != -1) {
      dispatch_once(&-[CIFilter encodeWithCoder:]::onceToken, &__block_literal_global_27);
    }
    long long v23 = self->_priv[4];
    if (v23) {
      [a3 encodeObject:v23 forKey:@"CIName"];
    }
    uint64_t v24 = [(CIFilter *)self valueForKey:@"__inputVersion"];
    if (v24) {
      [a3 encodeObject:v24 forKey:@"CIVersion"];
    }
  }
  else
  {
    long long v25 = (void *)MEMORY[0x1E4F1CA00];
    [v25 raise:@"CIRequiresKeyedArchiver" format:@"CoreImage requires keyed archiving."];
  }
}

- (id)userInfo
{
  return self->_priv[3];
}

- (CIFilter)initWithCoder:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    return 0;
  }
  uint64_t v5 = [(CIFilter *)self init];
  if (!v5) {
    return 0;
  }
  v69 = v5;
  id obja = (id)MEMORY[0x1E4F1CAD0];
  uint64_t v70 = objc_opt_class();
  uint64_t v68 = objc_opt_class();
  uint64_t v67 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v71 = objc_msgSend(obja, "setWithObjects:", v70, v68, v67, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  long long v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v17 = v69;
  obj = [(CIFilter *)v69 inputKeys];
  uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v74 objects:v78 count:16];
  if (!v18) {
    goto LABEL_34;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v75;
  do
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v75 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(*((void *)&v74 + 1) + 8 * v21);
      long long v23 = (void *)[[NSString alloc] initWithFormat:@"CICS_%@", v22];
      uint64_t v24 = (void *)[a3 decodeObjectOfClasses:v16 forKey:v23];

      if (v24)
      {
        if ([@"cs_deviceGray" isEqual:v24])
        {
          CGColorSpaceRef DeviceGray = CGColorSpaceCreateDeviceGray();
LABEL_27:
          v63 = DeviceGray;
          if (DeviceGray) {
            [(CIFilter *)v69 setValue:DeviceGray forKey:v22];
          }
        }
        else
        {
          if ([@"cs_deviceRGB" isEqual:v24])
          {
            CGColorSpaceRef DeviceGray = CGColorSpaceCreateDeviceRGB();
            goto LABEL_27;
          }
          if ([@"cs_deviceCMYK" isEqual:v24])
          {
            CGColorSpaceRef DeviceGray = CGColorSpaceCreateDeviceCMYK();
            goto LABEL_27;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v24 count] == 7)
            {
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 0), "doubleValue");
              CGFloat whitePoint = v28;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 1), "doubleValue");
              uint64_t v80 = v29;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 2), "doubleValue");
              uint64_t v81 = v30;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 3), "doubleValue");
              CGFloat blackPoint = v31;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 4), "doubleValue");
              uint64_t v93 = v32;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 5), "doubleValue");
              uint64_t v94 = v33;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 6), "doubleValue");
              CGColorSpaceRef DeviceGray = CGColorSpaceCreateCalibratedGray(&whitePoint, &blackPoint, v34);
              goto LABEL_27;
            }
            if ([v24 count] == 10)
            {
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 0), "doubleValue");
              CGFloat blackPoint = v35;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 1), "doubleValue");
              uint64_t v93 = v36;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 2), "doubleValue");
              uint64_t v94 = v37;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 3), "doubleValue");
              CGFloat v89 = v38;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 4), "doubleValue");
              uint64_t v90 = v39;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 5), "doubleValue");
              uint64_t v91 = v40;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 6), "doubleValue");
              CGFloat whitePoint = v41;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 7), "doubleValue");
              uint64_t v80 = v42;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 8), "doubleValue");
              uint64_t v81 = v43;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 9), "doubleValue");
              uint64_t v82 = v44;
              CGColorSpaceRef DeviceGray = CGColorSpaceCreateLab(&blackPoint, &v89, &whitePoint);
              goto LABEL_27;
            }
            if ([v24 count] == 18)
            {
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 0), "doubleValue");
              CGFloat blackPoint = v45;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 1), "doubleValue");
              uint64_t v93 = v46;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 2), "doubleValue");
              uint64_t v94 = v47;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 3), "doubleValue");
              CGFloat v89 = v48;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 4), "doubleValue");
              uint64_t v90 = v49;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 5), "doubleValue");
              uint64_t v91 = v50;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 6), "doubleValue");
              gamma[0] = v51;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 7), "doubleValue");
              gamma[1] = v52;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 8), "doubleValue");
              gamma[2] = v53;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 9), "doubleValue");
              CGFloat whitePoint = v54;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 10), "doubleValue");
              uint64_t v80 = v55;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 11), "doubleValue");
              uint64_t v81 = v56;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 12), "doubleValue");
              uint64_t v82 = v57;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 13), "doubleValue");
              uint64_t v83 = v58;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 14), "doubleValue");
              uint64_t v84 = v59;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 15), "doubleValue");
              uint64_t v85 = v60;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 16), "doubleValue");
              uint64_t v86 = v61;
              objc_msgSend((id)objc_msgSend(v24, "objectAtIndex:", 17), "doubleValue");
              uint64_t v87 = v62;
              CGColorSpaceRef DeviceGray = CGColorSpaceCreateCalibratedRGB(&blackPoint, &v89, gamma, &whitePoint);
              goto LABEL_27;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CGColorSpaceRef DeviceGray = (CGColorSpaceRef)MEMORY[0x199700DD0](v24);
            goto LABEL_27;
          }
          v63 = 0;
        }
        CGColorSpaceRelease(v63);
        goto LABEL_30;
      }
      long long v26 = (void *)[[NSString alloc] initWithFormat:@"CI_%@", v22];
      uint64_t v27 = [a3 decodeObjectOfClasses:v71 forKey:v26];
      if (v27) {
        [(CIFilter *)v69 setValue:v27 forKey:v22];
      }

LABEL_30:
      ++v21;
    }
    while (v19 != v21);
    uint64_t v64 = [(NSArray *)obj countByEnumeratingWithState:&v74 objects:v78 count:16];
    uint64_t v19 = v64;
  }
  while (v64);
LABEL_34:
  if ([a3 containsValueForKey:@"CIUserInfo"]
    && -[CIFilter initWithCoder:]::onceToken != -1)
  {
    dispatch_once(&-[CIFilter initWithCoder:]::onceToken, &__block_literal_global_56_1);
  }
  if ([a3 containsValueForKey:@"CIName"]) {
    v69->_priv[4] = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"CIName"];
  }
  uint64_t v65 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"CIVersion"];
  if (v65) {
    [(CIFilter *)v69 setValue:v65 forKey:@"__inputVersion"];
  }
  return v17;
}

- (NSString)name
{
  if (self->_priv[4]) {
    return (NSString *)self->_priv[4];
  }
  id v3 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v3);
}

- (NSDictionary)attributes
{
  uint64_t v2 = objc_opt_class();

  return (NSDictionary *)+[CIFilterClassAttributes classAttributesForClass:v2];
}

+ (CIFilter)radialGradientFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CIRadialGradient"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__radialGradientFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (radialGradientFilter_onceToken != -1) {
    dispatch_once(&radialGradientFilter_onceToken, block);
  }
  return v2;
}

+ (CIFilter)blendWithMaskFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CIBlendWithMask"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__blendWithMaskFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (blendWithMaskFilter_onceToken != -1) {
    dispatch_once(&blendWithMaskFilter_onceToken, block);
  }
  return v2;
}

- (id)prewarmingString
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = (objc_class *)objc_opt_class();
  [v3 setObject:NSStringFromClass(v4) forKeyedSubscript:@"FILTERNAME"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [(CIFilter *)self inputKeys];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (!v6) {
    goto LABEL_21;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
      uint64_t v11 = (void *)[(CIFilter *)self valueForKey:v10];
      if (v11)
      {
        uint64_t v12 = v11;
        CFTypeID v13 = CFGetTypeID(v11);
        if (!v13 || v13 != CGImageMetadataGetTypeID())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32[0] = @"type";
            v33[0] = [(id)objc_opt_class() description];
            v32[1] = @"extent";
            [v12 extent];
            v33[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
            v32[2] = @"description";
            v33[2] = [v12 description];
            uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
            goto LABEL_15;
          }
          AVCameraCalibrationDataClass();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v16 = AVCameraCalibrationDataDictionary(v12);
LABEL_15:
            id v17 = (void *)v16;
            uint64_t v18 = v3;
          }
          else
          {
            CFTypeID TypeID = CGColorSpaceGetTypeID();
            if (TypeID == CFGetTypeID(v12))
            {
              long long v23 = ci_logger_filter();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                -[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmingString]();
              }
              return 0;
            }
            uint64_t v18 = v3;
            id v17 = v12;
          }
          [v18 setObject:v17 forKeyedSubscript:v10];
          continue;
        }
        CFDataRef XMPData = CGImageMetadataCreateXMPData((CGImageMetadataRef)v12, 0);
        if (!XMPData)
        {
          uint64_t v22 = ci_logger_filter();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmingString].cold.4();
          }
          return 0;
        }
        CFDataRef v15 = XMPData;
        [v3 setObject:XMPData forKeyedSubscript:v10];
        CFRelease(v15);
      }
    }
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_21:
  uint64_t v27 = 0;
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28DB0], "archivedDataWithRootObject:requiringSecureCoding:error:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v3), 0, &v27);
  if (v27)
  {
    uint64_t v21 = ci_logger_filter();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmingString]();
    }
    return 0;
  }
  uint64_t v24 = (void *)[v20 compressedDataUsingAlgorithm:2 error:&v27];
  if (!v27) {
    return (id)[v24 base64EncodedStringWithOptions:1];
  }
  long long v25 = ci_logger_filter();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmingString]();
  }
  return 0;
}

+ (id)prewarmedFilterFromString:(id)a3
{
  id v3 = a3;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:a3 options:1];
    if (!v4) {
      return 0;
    }
    uint64_t v5 = v4;
    uint64_t v54 = 0;
    uint64_t v6 = [v4 decompressedDataUsingAlgorithm:2 error:&v54];

    if (v54)
    {
      uint64_t v7 = ci_logger_filter();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.7();
      }
      return 0;
    }
    CGFloat v48 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v47 = self;
    uint64_t v46 = self;
    uint64_t v45 = self;
    uint64_t v9 = self;
    uint64_t v10 = self;
    uint64_t v11 = self;
    uint64_t v12 = self;
    uint64_t v13 = self;
    uint64_t v14 = self;
    uint64_t v15 = self;
    uint64_t v16 = self;
    uint64_t v17 = self;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v48, "setWithObjects:", v47, v46, v45, v9, v10, v11, v12, v13, v14, v15, v16, v17, self, 0),
                    v6,
                    0);
    if (!v18)
    {
      uint64_t v40 = ci_logger_filter();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:]();
      }
      return 0;
    }
    uint64_t v19 = v18;
    uint64_t v20 = [v18 objectForKeyedSubscript:@"FILTERNAME"];
    if (!v20)
    {
      CGFloat v41 = ci_logger_filter();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:]();
      }
      return 0;
    }
    uint64_t v21 = +[CIFilter filterWithName:v20];
    if (!v21)
    {
      uint64_t v42 = ci_logger_filter();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:]();
      }
      return 0;
    }
    id v3 = v21;
    uint64_t v22 = [(CIFilter *)v21 inputKeys];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v51;
      while (2)
      {
        uint64_t v26 = 0;
        uint64_t v49 = v24;
        do
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void **)(*((void *)&v50 + 1) + 8 * v26);
          uint64_t v28 = [v19 objectForKey:v27];
          if (v28)
          {
            CFDataRef v29 = (const __CFData *)v28;
            if ([v27 isEqualToString:@"inputAuxDataMetadata"]
              && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              CGImageMetadataRef v30 = CGImageMetadataCreateFromXMPData(v29);
              if (!v30)
              {
                uint64_t v43 = ci_logger_filter();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
                  +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.4();
                }
                return 0;
              }
              CGImageMetadataRef v31 = v30;
              [v3 setValue:v30 forKey:@"inputAuxDataMetadata"];
              CFRelease(v31);
            }
            else if ([v27 isEqualToString:@"inputCalibrationData"] {
                   && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            }
            {
              uint64_t v32 = AVFDepthCameraCalibrationDataInitWithDictionary((uint64_t)v29);
              if (!v32)
              {
                uint64_t v44 = ci_logger_filter();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                  +[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.5();
                }
                return 0;
              }
              uint64_t v33 = (void *)v32;
              [v3 setValue:v32 forKey:@"inputCalibrationData"];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ((objc_msgSend((id)-[__CFData objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", @"type"), "isEqualToString:", objc_msgSend((id)objc_opt_class(), "description")) & 1) == 0)+[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:].cold.6(); {
                objc_msgSend((id)-[__CFData objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", @"extent"), "CGRectValue");
                }
                objc_msgSend(v3, "setValue:forKey:", -[CIImage imageByInsertingIntermediate:](-[CIImage imageByCroppingToRect:](+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor whiteColor](CIColor, "whiteColor")), "imageByCroppingToRect:", v36, v37, v38, v39), "imageByInsertingIntermediate:", 0), v27);
                uint64_t v24 = v49;
              }
              else
              {
                [v3 setValue:v29 forKey:v27];
              }
            }
          }
          else if (([v27 isEqualToString:@"inputShape"] & 1) == 0)
          {
            CGFloat v34 = ci_logger_filter();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              uint64_t v35 = [(id)objc_opt_class() description];
              *(_DWORD *)buf = 138543618;
              uint64_t v56 = v35;
              __int16 v57 = 2114;
              uint64_t v58 = v27;
              _os_log_error_impl(&dword_193671000, v34, OS_LOG_TYPE_ERROR, "%{public}@: Unable to find value in dictionary for key %{public}@", buf, 0x16u);
            }
          }
          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
  }
  return v3;
}

- (BOOL)verifyPrewarmedFilter:(id)a3
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  obj = [(CIFilter *)self inputKeys];
  if (!a3) {
    goto LABEL_88;
  }
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (objc_class *)objc_opt_class();
  BOOL v8 = [(NSString *)v6 isEqualToString:NSStringFromClass(v7)];
  if (!v8) {
    return v8;
  }
  id v154 = a3;
  SEL v136 = NSSelectorFromString(&cfstr_Isequalto.isa);
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v158 objects:v170 count:16];
  if (!v9)
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  uint64_t v156 = *(void *)v159;
  int32x4_t v10 = vdupq_n_s32(0x38D1B717u);
  float32x4_t v153 = (float32x4_t)v10;
  v10.i64[0] = 138543362;
  int32x4_t v135 = v10;
LABEL_5:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v159 != v156) {
      objc_enumerationMutation(obj);
    }
    uint64_t v12 = *(void *)(*((void *)&v158 + 1) + 8 * v11);
    uint64_t v13 = (void *)-[CIFilter valueForKey:](self, "valueForKey:", v12, *(_OWORD *)&v135);
    if (!v13) {
      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = (void *)[v154 valueForKey:v12];
      [v13 extent];
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      [v14 extent];
      v173.origin.x = v23;
      v173.origin.y = v24;
      v173.size.width = v25;
      v173.size.height = v26;
      v172.origin.x = v16;
      v172.origin.y = v18;
      v172.size.width = v20;
      v172.size.height = v22;
      if (!CGRectEqualToRect(v172, v173)) {
        -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:]();
      }
      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = (void *)[v154 valueForKey:v12];
      [v13 floatValue];
      float v29 = v28;
      [v27 floatValue];
      if (v29 != v30)
      {
        v105 = ci_logger_filter();
        BOOL v8 = os_log_type_enabled(v105, OS_LOG_TYPE_ERROR);
        if (!v8) {
          return v8;
        }
        uint64_t v106 = [(id)objc_opt_class() description];
        [v13 floatValue];
        float v108 = v107;
        [v27 floatValue];
        *(_DWORD *)v164 = 138544130;
        *(void *)&v164[4] = v106;
        *(_WORD *)&v164[12] = 2114;
        *(void *)&v164[14] = v12;
        *(_WORD *)&v164[22] = 2048;
        double v165 = v108;
        __int16 v166 = 2048;
        double v167 = v109;
        v99 = "%{public}@: Values for %{public}@ are not identical %g != %g";
        goto LABEL_70;
      }
      goto LABEL_27;
    }
    AVCameraCalibrationDataClass();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v75 = (void *)[v154 valueForKey:v12];
      uint64_t v76 = [v13 count];
      if (v76 != [v75 count])
      {
        v105 = ci_logger_filter();
        BOOL v8 = os_log_type_enabled(v105, OS_LOG_TYPE_ERROR);
        if (!v8) {
          return v8;
        }
        uint64_t v110 = [(id)objc_opt_class() description];
        *(double *)&uint64_t v111 = COERCE_DOUBLE([v13 count]);
        double v112 = COERCE_DOUBLE([v75 count]);
        *(_DWORD *)v164 = 138544130;
        *(void *)&v164[4] = v110;
        *(_WORD *)&v164[12] = 2114;
        *(void *)&v164[14] = v12;
        *(_WORD *)&v164[22] = 2048;
        double v165 = *(double *)&v111;
        __int16 v166 = 2048;
        double v167 = v112;
        v99 = "%{public}@: vectors don't have the same # of components for key %{public}@ (%zu != %zu)";
        goto LABEL_70;
      }
      if ([v13 count])
      {
        double v77 = 0.0;
        while (1)
        {
          [v13 valueAtIndex:*(void *)&v77];
          double v79 = v78;
          [v75 valueAtIndex:*(void *)&v77];
          if (vabdd_f64(v79, v80) > 0.0000999999975) {
            break;
          }
          if (++*(void *)&v77 >= (unint64_t)[v13 count]) {
            goto LABEL_27;
          }
        }
        uint64_t v94 = ci_logger_filter();
        BOOL v8 = os_log_type_enabled(v94, OS_LOG_TYPE_ERROR);
        if (!v8) {
          return v8;
        }
        uint64_t v95 = [(id)objc_opt_class() description];
        [v13 valueAtIndex:*(void *)&v77];
        double v97 = v96;
        [v75 valueAtIndex:*(void *)&v77];
        *(_DWORD *)v164 = 138544386;
        *(void *)&v164[4] = v95;
        *(_WORD *)&v164[12] = 2114;
        *(void *)&v164[14] = v12;
        *(_WORD *)&v164[22] = 2048;
        double v165 = v77;
        __int16 v166 = 2048;
        double v167 = v97;
        __int16 v168 = 2048;
        double v169 = v98;
        v99 = "%{public}@: Values for vector (%{public}@) at index %lu are not equal %g != %g";
LABEL_67:
        v103 = v94;
        uint32_t v104 = 52;
        goto LABEL_71;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v81 = (void *)[v154 valueForKey:v12];
        uint64_t v82 = [v13 numberOfComponents];
        if (v82 != [v13 numberOfComponents])
        {
          v105 = ci_logger_filter();
          BOOL v8 = os_log_type_enabled(v105, OS_LOG_TYPE_ERROR);
          if (!v8) {
            return v8;
          }
          uint64_t v120 = [(id)objc_opt_class() description];
          *(double *)&uint64_t v121 = COERCE_DOUBLE([v13 numberOfComponents]);
          double v122 = COERCE_DOUBLE([v81 numberOfComponents]);
          *(_DWORD *)v164 = 138544130;
          *(void *)&v164[4] = v120;
          *(_WORD *)&v164[12] = 2114;
          *(void *)&v164[14] = v12;
          *(_WORD *)&v164[22] = 2048;
          double v165 = *(double *)&v121;
          __int16 v166 = 2048;
          double v167 = v122;
          v99 = "%{public}@: colors don't have the same # of components for key %{public}@ (%zu != %zu)";
LABEL_70:
          v103 = v105;
          uint32_t v104 = 42;
          goto LABEL_71;
        }
        uint64_t v83 = (double *)[v13 components];
        uint64_t v84 = (double *)[v81 components];
        if ([v13 numberOfComponents])
        {
          *(double *)&unint64_t v85 = 0.0;
          while (vabdd_f64(*v83, *v84) <= 0.0000999999975)
          {
            ++v85;
            ++v84;
            ++v83;
            if (v85 >= [v13 numberOfComponents]) {
              goto LABEL_27;
            }
          }
          uint64_t v94 = ci_logger_filter();
          BOOL v8 = os_log_type_enabled(v94, OS_LOG_TYPE_ERROR);
          if (!v8) {
            return v8;
          }
          uint64_t v100 = [(id)objc_opt_class() description];
          double v101 = *v83;
          double v102 = *v84;
          *(_DWORD *)v164 = 138544386;
          *(void *)&v164[4] = v100;
          *(_WORD *)&v164[12] = 2114;
          *(void *)&v164[14] = v12;
          *(_WORD *)&v164[22] = 2048;
          double v165 = *(double *)&v85;
          __int16 v166 = 2048;
          double v167 = v101;
          __int16 v168 = 2048;
          double v169 = v102;
          v99 = "%{public}@: Values for color (%{public}@) at index %lu are not equal %g != %g";
          goto LABEL_67;
        }
      }
      else
      {
        CFTypeID TypeID = CGImageMetadataGetTypeID();
        if (TypeID == CFGetTypeID(v13))
        {
          CFDataRef XMPData = CGImageMetadataCreateXMPData((CGImageMetadataRef)v13, 0);
          CFDataRef v88 = CGImageMetadataCreateXMPData((CGImageMetadataRef)[v154 valueForKey:v12], 0);
          if (([(__CFData *)XMPData isEqualToData:v88] & 1) == 0)
          {
            uint64_t v89 = [v154 valueForKey:v12];
            *(void *)v164 = 0;
            *(void *)&v164[8] = v164;
            *(void *)&v164[16] = 0x2020000000;
            LOBYTE(v165) = 1;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __61__CIFilter_SDOFOnlyPrewarmingPrivate__verifyPrewarmedFilter___block_invoke;
            block[3] = &unk_1E5771890;
            block[6] = v164;
            block[7] = v89;
            block[4] = v13;
            void block[5] = self;
            CGImageMetadataEnumerateTagsUsingBlock((CGImageMetadataRef)v13, 0, 0, block);
            if (!*(unsigned char *)(*(void *)&v164[8] + 24))
            {
              uint64_t v90 = ci_logger_filter();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
              {
                uint64_t v93 = [(id)objc_opt_class() description];
                *(_DWORD *)buf = v135.i32[0];
                uint64_t v163 = v93;
                _os_log_error_impl(&dword_193671000, v90, OS_LOG_TYPE_ERROR, "%{public}@: XMP Image metadata may differ", buf, 0xCu);
              }
            }
            _Block_object_dispose(v164, 8);
          }
          if (XMPData) {
            CFRelease(XMPData);
          }
          if (v88) {
            CFRelease(v88);
          }
          goto LABEL_27;
        }
        CFTypeID v91 = CGColorSpaceGetTypeID();
        if (v91 == CFGetTypeID(v13))
        {
          [v154 valueForKey:v12];
          if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
          {
            v126 = ci_logger_filter();
            BOOL v8 = os_log_type_enabled(v126, OS_LOG_TYPE_ERROR);
            if (!v8) {
              return v8;
            }
            -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:]0();
LABEL_88:
            LOBYTE(v8) = 0;
            return v8;
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v130 = ci_logger_filter();
            BOOL v8 = os_log_type_enabled(v130, OS_LOG_TYPE_ERROR);
            if (!v8) {
              return v8;
            }
            uint64_t v123 = [(id)objc_opt_class() description];
            v124 = (objc_class *)objc_opt_class();
            *(double *)&v125 = COERCE_DOUBLE(NSStringFromClass(v124));
            *(_DWORD *)v164 = 138543874;
            *(void *)&v164[4] = v123;
            *(_WORD *)&v164[12] = 2114;
            *(void *)&v164[14] = v12;
            *(_WORD *)&v164[22] = 2114;
            double v165 = *(double *)&v125;
            v99 = "%{public}@: don't know how to check for equality of contents for key %{public}@ (%{public}@) is nil.";
            goto LABEL_100;
          }
          uint64_t v92 = [v154 valueForKey:v12];
          if (!v92)
          {
            v130 = ci_logger_filter();
            BOOL v8 = os_log_type_enabled(v130, OS_LOG_TYPE_ERROR);
            if (!v8) {
              return v8;
            }
            uint64_t v127 = [(id)objc_opt_class() description];
            v128 = (objc_class *)objc_opt_class();
            *(double *)&v129 = COERCE_DOUBLE(NSStringFromClass(v128));
            *(_DWORD *)v164 = 138543874;
            *(void *)&v164[4] = v127;
            *(_WORD *)&v164[12] = 2114;
            *(void *)&v164[14] = v12;
            *(_WORD *)&v164[22] = 2114;
            double v165 = *(double *)&v129;
            v99 = "%{public}@: object for key %{public}@ (%{public}@) is nil.";
            goto LABEL_100;
          }
          if (![v13 performSelector:v136 withObject:v92])
          {
            v130 = ci_logger_filter();
            BOOL v8 = os_log_type_enabled(v130, OS_LOG_TYPE_ERROR);
            if (!v8) {
              return v8;
            }
            uint64_t v131 = [(id)objc_opt_class() description];
            v132 = (objc_class *)objc_opt_class();
            *(double *)&v133 = COERCE_DOUBLE(NSStringFromClass(v132));
            *(_DWORD *)v164 = 138543874;
            *(void *)&v164[4] = v131;
            *(_WORD *)&v164[12] = 2114;
            *(void *)&v164[14] = v12;
            *(_WORD *)&v164[22] = 2114;
            double v165 = *(double *)&v133;
            v99 = "%{public}@: value for key %{public}@ (%{public}@) differs.";
LABEL_100:
            v103 = v130;
            uint32_t v104 = 32;
LABEL_71:
            _os_log_error_impl(&dword_193671000, v103, OS_LOG_TYPE_ERROR, v99, v164, v104);
            goto LABEL_88;
          }
        }
      }
    }
LABEL_27:
    if (++v11 == v9)
    {
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v158 objects:v170 count:16];
      LOBYTE(v8) = 1;
      if (v9) {
        goto LABEL_5;
      }
      return v8;
    }
  }
  CGImageMetadataRef v31 = (void *)[v154 valueForKey:v12];
  uint64_t v32 = (void *)AVCameraCalibrationDataDictionary(v13);
  uint64_t v33 = AVCameraCalibrationDataDictionary(v31);
  if ([v32 isEqualToDictionary:v33]) {
    goto LABEL_26;
  }
  *(double *)v34.i64 = AVCameraCalibrationDataIntrinsicMatrix(v13);
  float32x4_t v150 = v34;
  float32x4_t v151 = v35;
  float32x4_t v152 = v36;
  *(double *)v37.i64 = AVCameraCalibrationDataIntrinsicMatrix(v31);
  float32x4_t v147 = v37;
  float32x4_t v148 = v38;
  float32x4_t v149 = v39;
  double v40 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(v13);
  double v145 = v41;
  double v146 = v40;
  double v42 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(v31);
  double v44 = v43;
  *(double *)v45.i64 = AVCameraCalibrationDataExtrinsicMatrix(v13);
  float32x4_t v141 = v45;
  float32x4_t v142 = v46;
  float32x4_t v143 = v47;
  float32x4_t v144 = v48;
  *(double *)v49.i64 = AVCameraCalibrationDataExtrinsicMatrix(v31);
  float32x4_t v137 = v49;
  float32x4_t v138 = v50;
  float32x4_t v139 = v51;
  float32x4_t v140 = v52;
  double v54 = AVCameraCalibrationDataPixelSize(v13, v53);
  float v55 = *(float *)&v54;
  double v57 = AVCameraCalibrationDataPixelSize(v31, v56);
  float v58 = *(float *)&v57;
  uint64_t v60 = AVCameraCalibrationDataLensDistortionLookupTable(v13, v59);
  uint64_t v62 = AVCameraCalibrationDataLensDistortionLookupTable(v31, v61);
  uint64_t v64 = AVCameraCalibrationDataInverseLensDistortionLookupTable(v13, v63);
  v66 = AVCameraCalibrationDataInverseLensDistortionLookupTable(v31, v65);
  double v67 = AVCameraCalibrationDataIntrinsicLensDistortionCenter(v13);
  double v69 = v68;
  double v70 = AVCameraCalibrationDataIntrinsicLensDistortionCenter(v13);
  double v72 = v71;
  uint32x4_t v73 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v153, vabdq_f32(v150, v147)), (int8x16_t)vcgeq_f32(v153, vabdq_f32(v151, v148))), (int8x16_t)vcgeq_f32(v153, vabdq_f32(v152, v149)));
  v73.i32[3] = v73.i32[2];
  if ((vminvq_u32(v73) & 0x80000000) == 0)
  {
    v113 = ci_logger_filter();
    BOOL v8 = os_log_type_enabled(v113, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.9();
      goto LABEL_88;
    }
    return v8;
  }
  if (v146 == v42 && v145 == v44)
  {
    uint32x4_t v74 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v153, vabdq_f32(v141, v137)), (int8x16_t)vcgeq_f32(v153, vabdq_f32(v142, v138))), vandq_s8((int8x16_t)vcgeq_f32(v153, vabdq_f32(v143, v139)), (int8x16_t)vcgeq_f32(v153, vabdq_f32(v144, v140))));
    v74.i32[3] = v74.i32[2];
    if ((vminvq_u32(v74) & 0x80000000) == 0)
    {
      v115 = ci_logger_filter();
      BOOL v8 = os_log_type_enabled(v115, OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.7();
      goto LABEL_88;
    }
    if (vabds_f32(v55, v58) > 0.0001)
    {
      v116 = ci_logger_filter();
      BOOL v8 = os_log_type_enabled(v116, OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:]();
      goto LABEL_88;
    }
    if (([v60 isEqualToData:v62] & 1) == 0)
    {
      v117 = ci_logger_filter();
      BOOL v8 = os_log_type_enabled(v117, OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.6();
      goto LABEL_88;
    }
    if (([v64 isEqualToData:v66] & 1) == 0)
    {
      v118 = ci_logger_filter();
      BOOL v8 = os_log_type_enabled(v118, OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.5();
      goto LABEL_88;
    }
    if (v67 != v70 || v69 != v72)
    {
      v119 = ci_logger_filter();
      BOOL v8 = os_log_type_enabled(v119, OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.4();
      goto LABEL_88;
    }
LABEL_26:
    if (([v32 isEqualToDictionary:v33] & 1) == 0) {
      -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:]();
    }
    goto LABEL_27;
  }
  v114 = ci_logger_filter();
  BOOL v8 = os_log_type_enabled(v114, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    -[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:].cold.8();
    goto LABEL_88;
  }
  return v8;
}

uint64_t __61__CIFilter_SDOFOnlyPrewarmingPrivate__verifyPrewarmedFilter___block_invoke(uint64_t a1, CFStringRef path)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v4 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 32), 0, path);
  CGImageMetadataTagRef v5 = CGImageMetadataCopyTagWithPath(*(CGImageMetadataRef *)(a1 + 56), 0, path);
  uint64_t v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    BOOL v8 = (void *)CGImageMetadataTagCopyValue(v4);
    uint64_t v9 = (void *)CGImageMetadataTagCopyValue(v6);
    CGImageMetadataType Type = CGImageMetadataTagGetType(v4);
    CGImageMetadataType v11 = CGImageMetadataTagGetType(v4);
    CGImageMetadataType v12 = v11;
    if (v8) {
      BOOL v13 = v9 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    BOOL v14 = !v13 && Type == v11;
    if (v14 && CFEqual(v8, v9))
    {
LABEL_56:
      CFRelease(v8);
LABEL_57:
      if (v9) {
        CFRelease(v9);
      }
      goto LABEL_59;
    }
    BOOL v15 = Type == kCGImageMetadataTypeArrayOrdered && v12 == kCGImageMetadataTypeArrayOrdered;
    if (v15
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v16 = [v8 count];
      if (v16 == [v9 count])
      {
        if ([v8 count])
        {
          unint64_t v18 = 0;
          *(void *)&long long v17 = 138544386;
          long long v34 = v17;
          do
          {
            double v19 = (CGImageMetadataTag *)objc_msgSend(v8, "objectAtIndexedSubscript:", v18, v34);
            uint64_t v20 = [v9 objectAtIndexedSubscript:v18];
            if (v19)
            {
              double v21 = (CGImageMetadataTag *)v20;
              if (v20)
              {
                CFTypeRef v22 = CGImageMetadataTagCopyValue(v19);
                CFTypeRef v23 = CGImageMetadataTagCopyValue(v21);
                CGFloat v24 = v19;
                CGFloat v25 = v23;
                float32x4_t v35 = v24;
                CFStringRef cf = CGImageMetadataTagCopyName(v24);
                float32x4_t v36 = v21;
                CFStringRef v37 = CGImageMetadataTagCopyName(v21);
                if (v22 && v25 && !CFEqual(v22, v25))
                {
                  CGFloat v26 = v25;
                  uint64_t v27 = ci_logger_filter();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v30 = [(id)objc_opt_class() description];
                    *(_DWORD *)buf = v34;
                    uint64_t v40 = v30;
                    __int16 v41 = 2114;
                    CFStringRef v42 = path;
                    __int16 v43 = 2048;
                    double v44 = (CGImageMetadataTag *)v18;
                    __int16 v45 = 2114;
                    float32x4_t v46 = v35;
                    __int16 v47 = 2114;
                    float32x4_t v48 = v36;
                    _os_log_error_impl(&dword_193671000, v27, OS_LOG_TYPE_ERROR, "%{public}@: XMP Image metadata may differ for array tag %{public}@ at index %lu (%{public}@ != %{public}@)", buf, 0x34u);
                  }
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
                  CGFloat v25 = v26;
                }
                float v28 = v25;
                if (cf && v37 && !CFEqual(cf, v37))
                {
                  float v29 = ci_logger_filter();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v31 = [(id)objc_opt_class() description];
                    *(_DWORD *)buf = v34;
                    uint64_t v40 = v31;
                    __int16 v41 = 2114;
                    CFStringRef v42 = path;
                    __int16 v43 = 2048;
                    double v44 = (CGImageMetadataTag *)v18;
                    __int16 v45 = 2114;
                    float32x4_t v46 = v35;
                    __int16 v47 = 2114;
                    float32x4_t v48 = v36;
                    _os_log_error_impl(&dword_193671000, v29, OS_LOG_TYPE_ERROR, "%{public}@: XMP Image metadata may differ for array tag %{public}@ at index %lu (%{public}@ != %{public}@)", buf, 0x34u);
                  }
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
                }
                if (v22) {
                  CFRelease(v22);
                }
                if (v28) {
                  CFRelease(v28);
                }
                if (cf) {
                  CFRelease(cf);
                }
                if (v37) {
                  CFRelease(v37);
                }
                if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
                  break;
                }
              }
            }
            ++v18;
          }
          while (v18 < [v8 count]);
        }
LABEL_55:
        if (!v8) {
          goto LABEL_57;
        }
        goto LABEL_56;
      }
    }
    else
    {
      uint64_t v32 = ci_logger_filter();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        uint64_t v40 = [(id)objc_opt_class() description];
        __int16 v41 = 2114;
        CFStringRef v42 = path;
        __int16 v43 = 2114;
        double v44 = v4;
        __int16 v45 = 2114;
        float32x4_t v46 = (CGImageMetadataTag *)v9;
        _os_log_error_impl(&dword_193671000, v32, OS_LOG_TYPE_ERROR, "%{public}@: XMP Image metadata may differ for tag %{public}@ (%{public}@ != %{public}@)", buf, 0x2Au);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_55;
  }
  if (!((unint64_t)v4 | (unint64_t)v5)) {
    return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_59:
  if (v4) {
    CFRelease(v4);
  }
  if (v6) {
    CFRelease(v6);
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (unint64_t)hash
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(CIFilter *)self inputKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v3);
      }
      unint64_t v6 = objc_msgSend((id)-[CIFilter valueForKey:](self, "valueForKey:", *(void *)(*((void *)&v10 + 1) + 8 * i)), "hash")+ 33 * v6;
    }
    uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);
  return v6;
}

- (NSArray)outputKeys
{
  id v2 = +[CIFilterClassInfo classInfoForClass:objc_opt_class()];

  return (NSArray *)[v2 outputKeys];
}

- (CIImage)outputImage
{
  return 0;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"outputImage"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_msgSend(+[CIFilterClassInfo classInfoForClass:](CIFilterClassInfo, "classInfoForClass:", objc_opt_class()), "inputKeys");
    return (id)[v5 setWithArray:v6];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CIFilter;
    return objc_msgSendSuper2(&v8, sel_keyPathsForValuesAffectingValueForKey_, a3);
  }
}

void __28__CIFilter_encodeWithCoder___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136446210;
    id v2 = "-[CIFilter encodeWithCoder:]_block_invoke";
    _os_log_impl(&dword_193671000, v0, OS_LOG_TYPE_INFO, "%{public}s option CIUserInfo is no longer encoded for security.", (uint8_t *)&v1, 0xCu);
  }
}

void __26__CIFilter_initWithCoder___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136446210;
    id v2 = "-[CIFilter initWithCoder:]_block_invoke";
    _os_log_impl(&dword_193671000, v0, OS_LOG_TYPE_INFO, "%{public}s option CIUserInfo is no longer encoded for security.", (uint8_t *)&v1, 0xCu);
  }
}

- (id)_copyFilterWithZone:(_NSZone *)a3
{
  uint64_t v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(CIFilter *)self _copyFilterWithZone:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(CIFilter *)self inputKeys];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [(CIFilter *)self valueForKey:v10];
        if (v11) {
          [v4 setValue:v11 forKey:v10];
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  uint64_t v12 = [(CIFilter *)self valueForKey:@"__inputVersion"];
  if (v12) {
    [v4 setValue:v12 forKey:@"__inputVersion"];
  }
  long long v13 = self->_priv[4];
  if (v13)
  {
    CFRetain(v13);
    v4[5] = self->_priv[4];
  }
  return v4;
}

- (id)description
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __23__CIFilter_description__block_invoke;
  v3[3] = &unk_1E5771158;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

size_t __23__CIFilter_description__block_invoke(uint64_t a1, FILE *a2)
{
  uint64_t v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p", v4, *(const void **)(a1 + 32));
  uint64_t v5 = (void *)[*(id *)(a1 + 32) valueForKey:@"__inputVersion"];
  if (v5) {
    fprintf(a2, " %s", (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String"));
  }
  int v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "inputKeys"), "count");
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v6;
    do
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "inputKeys"), "objectAtIndex:", v7);
      uint64_t v10 = (void *)[*(id *)(a1 + 32) valueForKey:v9];
      uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
      if (v10) {
        uint64_t v12 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
      }
      else {
        uint64_t v12 = "nil";
      }
      fprintf(a2, " %s=%s", v11, v12);
      ++v7;
    }
    while (v8 != v7);
  }

  return fwrite(">\n", 2uLL, 1uLL, a2);
}

- (id)debugDescription
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__CIFilter_debugDescription__block_invoke;
  v3[3] = &unk_1E5771158;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __28__CIFilter_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  uint64_t v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p>\n", v4, *(const void **)(a1 + 32));
  uint64_t v5 = (void *)[*(id *)(a1 + 32) valueForKey:@"__inputVersion"];
  if (v5) {
    fprintf(a2, "    version=%s\n", (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String"));
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "inputKeys"), "count");
  if ((int)result >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = result;
    do
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "inputKeys"), "objectAtIndex:", v7);
      uint64_t v10 = (objc_object *)[*(id *)(a1 + 32) valueForKey:v9];
      fprintf(a2, "    %s=", (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        && CGAffineTransformFromObject(v10, &v11))
      {
        uint64_t result = fprintf(a2, "(a:%g b:%g c:%g d:%g tx:%g ty:%g)\n");
      }
      else if (v10)
      {
        objc_msgSend((id)-[objc_object description](v10, "description"), "UTF8String");
        uint64_t result = fprintf(a2, "%s\n");
      }
      else
      {
        uint64_t result = fwrite("nil\n", 4uLL, 1uLL, a2);
      }
      ++v7;
    }
    while (v8 != v7);
  }
  return result;
}

- (id)debugQuickLookObject
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CIFilter *)self attributes];
  id v4 = [(NSDictionary *)v3 objectForKeyedSubscript:@"CIAttributeFilterCategories"];
  uint64_t v5 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithMarkdownString:objc_msgSend(NSString, "stringWithFormat:", @"**%@**", objc_msgSend((id)objc_opt_class(), "description")), 0, 0, 0 options baseURL error];
  [(NSMutableAttributedString *)v5 appendAttributedString:v6];

  appendAttrStr(v5, &stru_1EE46B1A0.isa);
  uint64_t v7 = +[CIFilter localizedDescriptionForFilterName:[(CIFilter *)self name]];
  if (v7) {
    appendAttrStr(v5, v7);
  }
  appendAttrStr(v5, &stru_1EE46B1C0.isa);
  if (v4)
  {
    appendAttrStr(v5, &cfstr_Categories.isa);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v8 = [v4 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v12 hasPrefix:@"CICategory"])
          {
            appendAttrStr(v5, &stru_1EE46B220.isa);
            appendAttrStr(v5, (NSString *)[v12 substringFromIndex:10]);
          }
        }
        uint64_t v9 = [v4 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v9);
    }
    appendAttrStr(v5, &stru_1EE46B1A0.isa);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v13 = [(CIFilter *)self inputKeys];
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(NSString **)(*((void *)&v33 + 1) + 8 * j);
        id v19 = [(NSDictionary *)v3 objectForKeyedSubscript:v18];
        appendAttrStr(v5, &stru_1EE46B1A0.isa);
        appendAttrStrCode(v5, v18);
        uint64_t v20 = [v19 objectForKeyedSubscript:@"CIAttributeClass"];
        if (v20)
        {
          double v21 = (NSString *)v20;
          appendAttrStr(v5, &stru_1EE46B240.isa);
          appendAttrStrCode(v5, v21);
          appendAttrStr(v5, &stru_1EE46B260.isa);
        }
        appendAttrStr(v5, &stru_1EE46B1A0.isa);
        if ([v19 objectForKeyedSubscript:@"CIAttributeDescription"])
        {
          appendAttrStr(v5, (NSString *)[v19 objectForKeyedSubscript:@"CIAttributeDescription"]);
          appendAttrStr(v5, &stru_1EE46B1A0.isa);
        }
        uint64_t v22 = [v19 objectForKeyedSubscript:@"CIAttributeDefault"];
        if (v22)
        {
          CFTypeRef v23 = (void *)v22;
          appendAttrStr(v5, &cfstr_Default.isa);
          appendAttrStr(v5, (NSString *)[v23 description]);
          appendAttrStr(v5, &stru_1EE46B1A0.isa);
        }
        uint64_t v24 = [v19 objectForKeyedSubscript:@"CIAttributeMin"];
        if (v24)
        {
          CGFloat v25 = (void *)v24;
          appendAttrStr(v5, &cfstr_Min.isa);
          appendAttrStr(v5, (NSString *)[v25 description]);
          appendAttrStr(v5, &stru_1EE46B1A0.isa);
        }
        uint64_t v26 = [v19 objectForKeyedSubscript:@"CIAttributeMax"];
        if (v26)
        {
          uint64_t v27 = (void *)v26;
          appendAttrStr(v5, &cfstr_Max.isa);
          appendAttrStr(v5, (NSString *)[v27 description]);
          appendAttrStr(v5, &stru_1EE46B1A0.isa);
        }
        uint64_t v28 = [v19 objectForKeyedSubscript:@"CIAttributeSliderMin"];
        if (v28)
        {
          float v29 = (void *)v28;
          appendAttrStr(v5, &cfstr_SliderMin.isa);
          appendAttrStr(v5, (NSString *)[v29 description]);
          appendAttrStr(v5, &stru_1EE46B1A0.isa);
        }
        uint64_t v30 = [v19 objectForKeyedSubscript:@"CIAttributeSliderMax"];
        if (v30)
        {
          uint64_t v31 = (void *)v30;
          appendAttrStr(v5, &cfstr_SliderMax.isa);
          appendAttrStr(v5, (NSString *)[v31 description]);
          appendAttrStr(v5, &stru_1EE46B1A0.isa);
        }
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v15);
  }
  return v5;
}

+ (NSData)serializedXMPFromFilters:(NSArray *)filters inputImageExtent:(CGRect)extent
{
  double height = extent.size.height;
  double width = extent.size.width;
  double y = extent.origin.y;
  double x = extent.origin.x;
  if (![(NSArray *)filters count]
    || !objc_msgSend((id)objc_msgSend(a1, "_propertyArrayFromFilters:inputImageExtent:", filters, x, y, width, height), "count"))
  {
    return 0;
  }
  SerializedData = (NSData *)CGImageMetadataCreateSerializedData();
  CGAffineTransform v11 = SerializedData;
  if (SerializedData) {
    CFAutorelease(SerializedData);
  }
  return v11;
}

+ (NSArray)filterArrayFromSerializedXMP:(NSData *)xmpData inputImageExtent:(CGRect)extent error:(NSError *)outError
{
  double height = extent.size.height;
  double width = extent.size.width;
  double y = extent.origin.y;
  double x = extent.origin.x;
  if (outError) {
    *outError = 0;
  }
  if (!xmpData) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  CFArrayRef v10 = (const __CFArray *)CGImageMetadataCreateFromData();
  if (!v10) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  CFArrayRef v11 = v10;
  if (CFArrayGetCount(v10)) {
    uint64_t v12 = (NSArray *)objc_msgSend(a1, "_filterArrayFromProperties:inputImageExtent:", v11, x, y, width, height);
  }
  else {
    uint64_t v12 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  CFRelease(v11);
  return v12;
}

- (CIImage)apply:(CIKernel *)k arguments:(NSArray *)args options:(NSDictionary *)dict
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!k || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v20 = ci_logger_api();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CIFilter apply:arguments:options:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
    return 0;
  }
  double v9 = *MEMORY[0x1E4F1DB10];
  double v10 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  id v13 = [(NSDictionary *)dict objectForKey:@"extent"];
  id v14 = [(NSDictionary *)dict objectForKey:@"definition"];
  if (v14)
  {
    uint64_t v15 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 count] == 4)
    {
      objc_msgSend((id)objc_msgSend(v15, "objectAtIndex:", 0), "doubleValue");
      double v9 = v16;
      objc_msgSend((id)objc_msgSend(v15, "objectAtIndex:", 1), "doubleValue");
      double v10 = v17;
      objc_msgSend((id)objc_msgSend(v15, "objectAtIndex:", 2), "doubleValue");
      double v11 = v18;
      id v19 = v15;
LABEL_17:
      objc_msgSend((id)objc_msgSend(v19, "objectAtIndex:", 3), "doubleValue");
      double v12 = v37;
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 extent];
      double v9 = v30;
      double v10 = v31;
      double v11 = v32;
      double v12 = v33;
      goto LABEL_22;
    }
    long long v38 = ci_logger_api();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[CIFilter apply:arguments:options:](v38, v39, v40, v41, v42, v43, v44, v45);
    }
    return 0;
  }
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 count] == 4)
    {
      objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 0), "doubleValue");
      double v9 = v34;
      objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 1), "doubleValue");
      double v10 = v35;
      objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", 2), "doubleValue");
      double v11 = v36;
      id v19 = v13;
      goto LABEL_17;
    }
    float32x4_t v46 = ci_logger_api();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v60 = "-[CIFilter apply:arguments:options:]";
      _os_log_impl(&dword_193671000, v46, OS_LOG_TYPE_INFO, "%{public}s kCIApplyOptionExtent is not an NSArray with four elements. Ignoring.", buf, 0xCu);
    }
  }
LABEL_22:
  id v47 = [(NSDictionary *)dict objectForKey:@"user_info"];
  float32x4_t v48 = [(CIKernel *)k ROISelector];
  SEL v49 = NSSelectorFromString(&cfstr_RegionofDestre.isa);
  SEL v50 = NSSelectorFromString(&cfstr_RegionofDestre_0.isa);
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (float32x4_t v48 = v49, (objc_opt_respondsToSelector() & 1) != 0)
    || (float32x4_t v48 = v50, (objc_opt_respondsToSelector() & 1) != 0))
  {
    uint64_t v51 = [(CIFilter *)self methodForSelector:v48];
  }
  else
  {
    uint64_t v51 = 0;
  }
  NSClassFromString(&cfstr_Dgcurvesfilter.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  NSClassFromString(&cfstr_Pxsoftproofing.isa);
  if (objc_opt_isKindOfClass())
  {
    if (-[CIFilter apply:arguments:options:]::onceToken != -1) {
      dispatch_once(&-[CIFilter apply:arguments:options:]::onceToken, &__block_literal_global_121);
    }
    int v53 = 2;
  }
  else
  {
    int v53 = isKindOfClass & 1;
  }
  NSClassFromString(&cfstr_PxCifNoise.isa);
  if (objc_opt_isKindOfClass())
  {
    if (-[CIFilter apply:arguments:options:]::onceToken != -1) {
      dispatch_once(&-[CIFilter apply:arguments:options:]::onceToken, &__block_literal_global_127);
    }
    int v53 = 3;
  }
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __36__CIFilter_apply_arguments_options___block_invoke_128;
  v57[3] = &unk_1E5771918;
  int v58 = v53;
  v57[6] = v51;
  v57[7] = v50;
  v57[4] = self;
  v57[5] = v47;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v54 = (CIImage *)-[CIKernel applyWithExtent:arguments:](k, "applyWithExtent:arguments:", args, v9, v10, v11, v12);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v54 = (CIImage *)-[CIKernel applyWithExtent:roiCallback:inputImage:arguments:](k, "applyWithExtent:roiCallback:inputImage:arguments:", v57, -[NSArray objectAtIndex:](args, "objectAtIndex:", 0), -[NSArray subarrayWithRange:](args, "subarrayWithRange:", 1, [(NSArray *)args count] - 1), v9, v10, v11, v12);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v28 = 0;
        goto LABEL_42;
      }
      double v54 = -[CIKernel applyWithExtent:roiCallback:arguments:](k, "applyWithExtent:roiCallback:arguments:", v57, args, v9, v10, v11, v12);
    }
  }
  uint64_t v28 = v54;
LABEL_42:
  id v55 = [(NSDictionary *)dict objectForKey:@"color_space"];
  if (v55)
  {
    id v56 = v55;
    if (v55 != (id)[MEMORY[0x1E4F1CA98] null]) {
      return [(CIImage *)v28 imageByColorMatchingColorSpaceToWorkingSpace:v56];
    }
  }
  return v28;
}

void __36__CIFilter_apply_arguments_options___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136446210;
    id v2 = "-[CIFilter apply:arguments:options:]_block_invoke";
    _os_log_impl(&dword_193671000, v0, OS_LOG_TYPE_INFO, "%{public}s The filter PXSoftProofingFilter has an incorrect ROI method for sampler index 1.  This may fail in the future.", (uint8_t *)&v1, 0xCu);
  }
}

void __36__CIFilter_apply_arguments_options___block_invoke_125()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = ci_logger_api();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    int v1 = 136446210;
    id v2 = "-[CIFilter apply:arguments:options:]_block_invoke";
    _os_log_impl(&dword_193671000, v0, OS_LOG_TYPE_INFO, "%{public}s The filter PX_CIF_Noise has an incorrect ROI method for sampler index 1.  This may fail in the future.", (uint8_t *)&v1, 0xCu);
  }
}

void __36__CIFilter_apply_arguments_options___block_invoke_128(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  int v6 = *(_DWORD *)(a1 + 64);
  if ((a2 || v6 != 1) && (a2 != 1 || v6 != 2))
  {
    if (a2 == 1 && v6 == 3)
    {
      CGRectInset(*(CGRect *)&a3, -1.0, -1.0);
    }
    else
    {
      uint64_t v7 = *(void (**)(void, void, uint64_t, void))(a1 + 48);
      if (v7) {
        v7(*(void *)(a1 + 32), *(void *)(a1 + 56), a2, *(void *)(a1 + 40));
      }
    }
  }
}

- (CIImage)apply:(CIKernel *)k
{
  va_start(va, k);
  uint64_t v27 = va_arg(va, void);
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (k && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    int v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    va_copy(v19, va);
    uint64_t v8 = v27;
    if (v27)
    {
      int v9 = 0;
      char v10 = 0;
      *(void *)&long long v7 = 138543874;
      long long v18 = v7;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v10) {
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  double v17 = ci_logger_api();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                    [(CIFilter *)(uint64_t)self apply:v17];
                  }
                  return 0;
                }
              }
            }
          }
        }
        objc_msgSend(v5, "addObject:", v8, v18);
        char v10 = 0;
LABEL_18:
        uint64_t v13 = va_arg(v19, void);
        uint64_t v8 = v13;
        ++v9;
        if (!v13) {
          return -[CIFilter apply:arguments:options:](self, "apply:arguments:options:", k, v5, v6, v18);
        }
      }
      uint64_t v11 = va_arg(v19, void);
      if (v11)
      {
        [v6 setValue:v11 forKey:v8];
      }
      else
      {
        double v12 = ci_logger_api();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = [(id)objc_opt_class() description];
          *(_DWORD *)buf = v18;
          uint64_t v21 = v14;
          __int16 v22 = 2114;
          uint64_t v23 = v8;
          __int16 v24 = 1024;
          int v25 = v9;
          _os_log_error_impl(&dword_193671000, v12, OS_LOG_TYPE_ERROR, "[%{public}@ apply:...] The last key \"%{public}@\" at index %d is followed by nil. It will be ignored.", buf, 0x1Cu);
        }
      }
LABEL_17:
      char v10 = 1;
      goto LABEL_18;
    }
    return -[CIFilter apply:arguments:options:](self, "apply:arguments:options:", k, v5, v6, v18);
  }
  else
  {
    uint64_t v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CIFilter apply:]((uint64_t)self, v15);
    }
    return 0;
  }
}

- (void)setName:(NSString *)aString
{
  id v5 = self->_priv[4];
  self->_priv[4] = (void *)[(NSString *)aString copy];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  self->_enabled = enabled;
}

+ (void)clearCache
{
  +[CIFilterClassDefaults clearCache];
  +[CIFilterClassCategories clearCache];
  +[CIFilterClassAttributes clearCache];

  +[CIFilterClassInfo clearCache];
}

+ (id)customAttributes
{
  return 0;
}

- (id)customAttributes
{
  return 0;
}

- (BOOL)_filterClassInCategory:(id)a3
{
  id v4 = +[CIFilterClassCategories classCategoriesForClass:objc_opt_class()];

  return [v4 containsObject:a3];
}

- (BOOL)_isIdentity
{
  return 0;
}

- (void)setIdentity
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CIFilter *)self attributes];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(CIFilter *)self inputKeys];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(NSDictionary *)v3 objectForKey:v9];
        uint64_t v11 = [v10 valueForKey:@"CIAttributeIdentity"];
        if (!v11)
        {
          uint64_t v11 = [v10 valueForKey:@"CIAttributeDefault"];
          if (!v11) {
            continue;
          }
        }
        [(CIFilter *)self setValue:v11 forKey:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)setUserInfo:(id)a3
{
  id v4 = self->_priv[3];
  if (v4 != a3)
  {
    id v6 = v4;
    self->_priv[3] = a3;
  }
}

+ (CIFilter)filterWithString:(id)a3
{
  uint64_t v3 = (void *)[a3 componentsSeparatedByString:@","];
  if (![v3 count]) {
    return 0;
  }
  id v4 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", [v3 objectAtIndex:0]);
  if (v4 && (unint64_t)[v3 count] >= 2)
  {
    uint64_t v5 = 1;
    unint64_t v6 = 0x1E4F29000uLL;
    uint64_t v7 = @"input%@";
    uint64_t v8 = @"nil";
    uint64_t v9 = @"[";
    while (1)
    {
      id v10 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v5), "componentsSeparatedByString:", @"=");
      if ([v10 count] != 2) {
        goto LABEL_19;
      }
      uint64_t v11 = objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", v7, objc_msgSend(v10, "objectAtIndex:", 0));
      if (![(NSArray *)[(CIFilter *)v4 inputKeys] containsObject:v11]) {
        goto LABEL_19;
      }
      long long v12 = (void *)[v10 objectAtIndex:1];
      if ([v12 isEqual:v8]) {
        break;
      }
      if ([v12 hasPrefix:v9] && (unint64_t)objc_msgSend(v12, "length") >= 3)
      {
        long long v14 = +[CIVector vectorWithString:v12];
        goto LABEL_17;
      }
      if ([v12 hasPrefix:@"\""]
        && (unint64_t)[v12 length] >= 3)
      {
        long long v14 = (CIVector *)objc_msgSend(v12, "substringWithRange:", 1, objc_msgSend(v12, "length") - 2);
        goto LABEL_17;
      }
      if ([v12 length])
      {
        long long v15 = v7;
        unint64_t v16 = v6;
        uint64_t v17 = v8;
        long long v18 = v9;
        va_list v19 = NSNumber;
        [v12 doubleValue];
        uint64_t v20 = v19;
        uint64_t v9 = v18;
        uint64_t v8 = v17;
        unint64_t v6 = v16;
        uint64_t v7 = v15;
        long long v14 = (CIVector *)objc_msgSend(v20, "numberWithDouble:");
LABEL_17:
        long long v13 = v14;
LABEL_18:
        [(CIFilter *)v4 setValue:v13 forKey:v11];
      }
LABEL_19:
      if ([v3 count] <= (unint64_t)++v5) {
        return v4;
      }
    }
    long long v13 = 0;
    goto LABEL_18;
  }
  return v4;
}

- (id)_serializedXMPString
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![(CIFilter *)self _filterClassInCategory:@"CICategoryXMPSerializable"]) {
    return 0;
  }
  uint64_t v3 = [(CIFilter *)self name];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(CIFilter *)self inputKeys];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v24 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * v8);
      id v10 = (void *)[(CIFilter *)self valueForKey:v9];
      if ([v9 isEqual:@"inputImage"]) {
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = NSString;
        uint64_t v12 = [v9 substringFromIndex:5];
        uint64_t v13 = [v10 stringValue];
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v11 = NSString;
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [v10 length]
            && ([v10 rangeOfString:@","], !v16))
          {
            uint64_t v15 = [NSString stringWithFormat:@"%@,%@=\"%s\", v3, objc_msgSend(v9, "substringFromIndex:", 5), objc_msgSend(v10, "UTF8String"")];
          }
          else
          {
            if (v10)
            {
              long long v18 = ci_logger_api();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                uint64_t v20 = [(CIFilter *)self name];
                uint64_t v21 = [(id)objc_opt_class() description];
                *(_DWORD *)buf = 138543874;
                uint64_t v28 = v20;
                __int16 v29 = 2114;
                double v30 = v9;
                __int16 v31 = 2114;
                uint64_t v32 = v21;
                _os_log_error_impl(&dword_193671000, v18, OS_LOG_TYPE_ERROR, "CIFilter %{public}@ cannot be serialized because %{public}@ value is a %{public}@. Only NSString, NSNumber and CIVector is supported at this time.", buf, 0x20u);
              }
              return 0;
            }
            uint64_t v15 = [NSString stringWithFormat:@"%@,%@=nil", v3, objc_msgSend(v9, "substringFromIndex:", 5), v22];
          }
          goto LABEL_18;
        }
        uint64_t v12 = [v9 substringFromIndex:5];
        uint64_t v13 = [v10 stringRepresentation];
      }
      uint64_t v15 = [v11 stringWithFormat:@"%@,%@=%@", v3, v12, v13];
LABEL_18:
      uint64_t v3 = (NSString *)v15;
LABEL_19:
      if (v6 == ++v8)
      {
        uint64_t v17 = [(NSArray *)v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
        uint64_t v6 = v17;
        if (v17) {
          goto LABEL_4;
        }
        return v3;
      }
    }
  }
  return v3;
}

+ (id)_propertyArrayFromFilters:(id)a3 inputImageExtent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v63 = (void *)[MEMORY[0x1E4F1CA48] array];
  obuint64_t j = a3;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    int v13 = 0;
    int v14 = 0;
    uint64_t v15 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v74 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        long long v18 = objc_opt_class();
        if ([v18 isSubclassOfClass:objc_opt_class()]
          && [v17 conformsToProtocol:&unk_1EE4B0E60])
        {
          int v19 = objc_msgSend((id)objc_msgSend(v17, "name"), "isEqual:", @"CIAffineTransform");
          if (v19) {
            unint64_t v12 = (unint64_t)v17;
          }
          v14 += v19;
          int v20 = objc_msgSend((id)objc_msgSend(v17, "name"), "isEqual:", @"CICrop");
          if (v20) {
            unint64_t v11 = (unint64_t)v17;
          }
          v13 += v20;
          uint64_t v21 = [v17 _outputProperties];
          if (v21) {
            [v63 addObjectsFromArray:v21];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    int v13 = 0;
    int v14 = 0;
  }
  if (v14 <= 1 && v13 <= 1 && v14 + v13 >= 1)
  {
    if (!(v12 | v11)) {
      +[CIFilter(Private) _propertyArrayFromFilters:inputImageExtent:]();
    }
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v72.double a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v72.double c = v22;
    *(_OWORD *)&v72.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (v12) {
      CGAffineTransformFromObject((objc_object *)[(id)v12 valueForKey:@"inputTransform"], &v72);
    }
    if (v11)
    {
      objc_msgSend((id)objc_msgSend((id)v11, "valueForKey:", @"inputRectangle"), "CGRectValue");
      v84.origin.CGFloat x = v23;
      v84.origin.CGFloat y = v24;
      v84.size.double width = v25;
      v84.size.double height = v26;
      v81.origin.CGFloat x = x;
      v81.origin.CGFloat y = y;
      v81.size.double width = width;
      v81.size.double height = height;
      CGRect v82 = CGRectIntersection(v81, v84);
      double v27 = v82.size.width;
      double v28 = v82.size.height;
      double c = v72.c;
      double d = v72.d;
      double a = v72.a;
      double b = v72.b;
    }
    else
    {
      double b = v72.b;
      if (fabs(v72.b) >= 0.0001 || (double c = v72.c, fabs(v72.c) >= 0.0001))
      {
        double a = v72.a;
        if (fabs(v72.a) >= 0.0001) {
          goto LABEL_54;
        }
        double d = v72.d;
        if (fabs(v72.d) >= 0.0001) {
          goto LABEL_54;
        }
        double c = v72.c;
      }
      else
      {
        double a = v72.a;
        double d = v72.d;
      }
      if (fabs(fabs(a * d - c * v72.b) + -1.0) >= 0.01) {
        goto LABEL_54;
      }
      CGAffineTransform v71 = v72;
      v83.origin.CGFloat x = x;
      v83.origin.CGFloat y = y;
      v83.size.double width = width;
      v83.size.double height = height;
      CGRect v82 = CGRectApplyAffineTransform(v83, &v71);
      double v27 = v61;
      double v28 = v62;
    }
    v72.tCGFloat x = v72.tx - v82.origin.x;
    v72.tCGFloat y = v72.ty - v82.origin.y;
    CGAffineTransform v69 = v72;
    memset(&v70, 0, sizeof(v70));
    CGAffineTransformInvert(&v70, &v69);
    double v33 = atan2(d - c, b - a) + -2.35619449;
    if (v33 >= -3.14159265) {
      double v34 = -v33;
    }
    else {
      double v34 = -6.28318531 - v33;
    }
    double v35 = v34 * 57.2957795;
    if (fabs(v35) >= 0.01) {
      double v36 = v35;
    }
    else {
      double v36 = 0.0;
    }
    double v37 = v70.tx + v28 * v70.c + v70.a * 0.0;
    CGFloat v38 = v70.ty + v28 * v70.d + v70.b * 0.0;
    double v39 = v70.tx + v70.c * 0.0 + v70.a * v27;
    double v40 = height - v38;
    double v41 = height - (v70.ty + v70.d * 0.0 + v70.b * v27);
    BOOL v42 = v37 >= 0.0 && v37 <= width;
    if (!v42
      || (v39 >= 0.0 ? (BOOL v43 = v39 <= width) : (BOOL v43 = 0),
          !v43
       || (v41 >= 0.0 ? (BOOL v44 = v41 <= height) : (BOOL v44 = 0), !v44
                                                        || (v40 >= 0.0 ? (BOOL v45 = v40 <= height) : (BOOL v45 = 0), !v45))))
    {
      float32x4_t v46 = ci_logger_api();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        +[CIFilter(Private) _propertyArrayFromFilters:inputImageExtent:](v46, v47, v48, v49, v50, v51, v52, v53);
      }
    }
    v78[0] = metadataPropertyWithDouble(v36);
    v78[1] = metadataPropertyWithDouble(fmax(fmin(v40 / height, 1.0), 0.0));
    v78[2] = metadataPropertyWithDouble(fmax(fmin(v41 / height, 1.0), 0.0));
    v78[3] = metadataPropertyWithDouble(fmax(fmin(v37 / width, 1.0), 0.0));
    v78[4] = metadataPropertyWithDouble(fmax(fmin(v39 / width, 1.0), 0.0));
    v78[5] = metadataPropertyWithBool();
    v78[6] = metadataPropertyWithBool();
    objc_msgSend(v63, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v78, 7));
  }
LABEL_54:
  double v54 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v55 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v56; ++j)
      {
        if (*(void *)v66 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = [*(id *)(*((void *)&v65 + 1) + 8 * j) _serializedXMPString];
        if (v59) {
          [v54 addObject:v59];
        }
      }
      uint64_t v56 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v56);
  }
  if ([v54 count]) {
    [v63 addObject:metadataPropertyWithArray(@"http://ns.apple.com/adjustment-settings/1.0/", @"aas", @"Filters", v54)];
  }
  return v63;
}

+ (id)_filterArrayFromProperties:(id)a3 inputImageExtent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a4.origin.x, a4.origin.y);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v7 = [&unk_1EE4AB888 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v58 != v11) {
          objc_enumerationMutation(&unk_1EE4AB888);
        }
        int v13 = *(NSString **)(*((void *)&v57 + 1) + 8 * i);
        Class v14 = NSClassFromString(v13);
        if (v14)
        {
          uint64_t v15 = v14;
          if ([(objc_class *)v14 isSubclassOfClass:objc_opt_class()])
          {
            if ([(objc_class *)v15 conformsToProtocol:&unk_1EE4B0E60])
            {
              id v16 = (id)[[v15 alloc] _initFromProperties:a3];
              if (v16)
              {
                unint64_t v17 = (unint64_t)v16;
                [v6 addObject:v16];
                if ([(NSString *)v13 isEqual:@"CIAffineTransform"]) {
                  unint64_t v10 = v17;
                }
                if ([(NSString *)v13 isEqual:@"CICrop"]) {
                  unint64_t v9 = v17;
                }
              }
            }
          }
        }
      }
      uint64_t v8 = [&unk_1EE4AB888 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
  }
  double v55 = 0.0;
  double v56 = 0.0;
  double v53 = 0.0;
  double v54 = 0.0;
  double v52 = 0.0;
  __int16 v51 = 0;
  if (!(v10 | v9))
  {
    long long v18 = +[CIFilter filterWithName:@"CIAffineTransform"];
    int v19 = +[CIFilter filterWithName:@"CICrop"];
    if (metadataPropertyArrayGetBool((uint64_t)a3, @"http://ns.adobe.com/camera-raw-settings/1.0/", @"HasCrop", (BOOL *)&v51 + 1))
    {
      if (metadataPropertyArrayGetBool((uint64_t)a3, @"http://ns.adobe.com/camera-raw-settings/1.0/", @"AlreadyApplied", (BOOL *)&v51)&& HIBYTE(v51)&& !(_BYTE)v51)
      {
        v62[0] = v18;
        v62[1] = v19;
        objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v62, 2));
        if ((metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.adobe.com/camera-raw-settings/1.0/", @"CropTop", &v54) & 1) == 0)double v54 = 0.0; {
        if ((metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.adobe.com/camera-raw-settings/1.0/", @"CropBottom", &v53) & 1) == 0)double v53 = 1.0;
        }
        if ((metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.adobe.com/camera-raw-settings/1.0/", @"CropLeft", &v56) & 1) == 0)double v56 = 0.0; {
        if ((metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.adobe.com/camera-raw-settings/1.0/", @"CropRight", &v55) & 1) == 0)double v55 = 1.0;
        }
        if (metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.adobe.com/camera-raw-settings/1.0/", @"CropAngle", &v52))
        {
          double v20 = v52 * -0.0174532925;
        }
        else
        {
          double v52 = 0.0;
          double v20 = -0.0;
        }
        double v21 = width * v56;
        double v22 = width * v55;
        double v23 = height - height * v54;
        double v24 = height - height * v53;
        memset(&v50, 0, sizeof(v50));
        CGAffineTransformMakeRotation(&v50, -v20);
        double v25 = tan(v20 + -1.57079633);
        double v26 = v25;
        if (v20 <= 0.0)
        {
          double v27 = v21 + -1.0;
          double v28 = tan(v20 + 3.14159265);
          double v29 = 1.0;
        }
        else
        {
          double v26 = -v25;
          double v27 = v21 + 1.0;
          double v28 = -tan(v20 + 3.14159265);
          double v29 = -1.0;
        }
        double v30 = v23 - v26 - v23;
        double v31 = ((v23 - v24) * (v22 + v29 - v22) - (v21 - v22) * (v24 + v28 - v24))
            / ((v27 - v21) * (v24 + v28 - v24) - v30 * (v22 + v29 - v22));
        CGFloat v32 = v21 + v31 * (v27 - v21);
        CGFloat v33 = v23 + v31 * v30;
        CGAffineTransform v48 = v50;
        memset(&v49, 0, sizeof(v49));
        CGAffineTransformInvert(&v49, &v48);
        v49.tCGFloat x = v32;
        v49.tCGFloat y = v33;
        CGAffineTransform v46 = v49;
        memset(&v47, 0, sizeof(v47));
        CGAffineTransformInvert(&v47, &v46);
        -[CIFilter setValue:forKey:](v18, "setValue:forKey:", [MEMORY[0x1E4F29238] valueWithBytes:&v47 objCType:"{CGAffineTransform=dddddd}"], @"inputTransform");
        [(CIFilter *)v19 setValue:+[CIVector vectorWithX:0.0 Y:0.0 Z:vabdd_f64(v49.tx + v24 * v49.c + v49.a * v22, v49.tx + v23 * v49.c + v49.a * v21) W:vabdd_f64(v49.ty + v23 * v49.d + v49.b * v21, v49.ty + v24 * v49.d + v49.b * v22)] forKey:@"inputRectangle"];
      }
    }
  }
  ArrayOfStrings = (void *)metadataPropertyArrayGetArrayOfStrings();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v35 = [ArrayOfStrings countByEnumeratingWithState:&v42 objects:v61 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v43 != v37) {
          objc_enumerationMutation(ArrayOfStrings);
        }
        double v39 = +[CIFilter filterWithString:*(void *)(*((void *)&v42 + 1) + 8 * j)];
        if (v39) {
          [v6 addObject:v39];
        }
      }
      uint64_t v36 = [ArrayOfStrings countByEnumeratingWithState:&v42 objects:v61 count:16];
    }
    while (v36);
  }
  return v6;
}

+ (CGImageMetadata)_imageMetadataFromFilters:(id)a3 inputImageExtent:(CGRect)a4
{
  uint64_t result = +[CIFilter _propertyArrayFromFilters:inputImageExtent:](CIFilter, "_propertyArrayFromFilters:inputImageExtent:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  if (result)
  {
    return (CGImageMetadata *)MEMORY[0x1F40E97B0]();
  }
  return result;
}

+ (id)_filterArrayFromImageMetadata:(CGImageMetadata *)a3 inputImageExtent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id result = (id)CGImageMetadataCreateMetadataProperties();
  if (result)
  {
    id v9 = result;
    id v10 = +[CIFilter _filterArrayFromProperties:inputImageExtent:](CIFilter, "_filterArrayFromProperties:inputImageExtent:", result, x, y, width, height);
    CFRelease(v9);
    return v10;
  }
  return result;
}

+ (id)_filterArrayFromProperties:(id)a3
{
  uint64_t v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    +[CIFilter(Private) _filterArrayFromProperties:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
  return 0;
}

+ (CIFilter)gaussianGradientFilter
{
  id v2 = +[CIFilter filterWithName:@"CIGaussianGradient"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__gaussianGradientFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (gaussianGradientFilter_onceToken != -1) {
    dispatch_once(&gaussianGradientFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__gaussianGradientFilter__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    BOOL v4 = [NSStringFromSelector(sel_color0) isEqualToString:@"inputImage"];
    char v5 = [v3 instancesRespondToSelector:sel_color0];
    if (v4)
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color0, (IMP)iiGetter, "@@:");
      }
      char v6 = [v3 instancesRespondToSelector:sel_setColor0_];
      uint64_t v7 = (void (*)(void))iiSetter;
      if ((v6 & 1) == 0) {
LABEL_8:
      }
        class_addMethod((Class)v3, sel_setColor0_, v7, "v@:@");
    }
    else
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color0, (IMP)objGetter, "@@:");
      }
      char v16 = [v3 instancesRespondToSelector:sel_setColor0_];
      uint64_t v7 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v8 = objc_opt_class();
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v9 = (void *)v8;
  BOOL v10 = [NSStringFromSelector(sel_color1) isEqualToString:@"inputImage"];
  char v11 = [v9 instancesRespondToSelector:sel_color1];
  if (v10)
  {
    if ((v11 & 1) == 0) {
      class_addMethod((Class)v9, sel_color1, (IMP)iiGetter, "@@:");
    }
    char v12 = [v9 instancesRespondToSelector:sel_setColor1_];
    int v13 = (void (*)(void))iiSetter;
    if ((v12 & 1) == 0) {
LABEL_14:
    }
      class_addMethod((Class)v9, sel_setColor1_, v13, "v@:@");
  }
  else
  {
    if ((v11 & 1) == 0) {
      class_addMethod((Class)v9, sel_color1, (IMP)objGetter, "@@:");
    }
    char v17 = [v9 instancesRespondToSelector:sel_setColor1_];
    int v13 = (void (*)(void))objSetter;
    if ((v17 & 1) == 0) {
      goto LABEL_14;
    }
  }
LABEL_15:
  id result = (objc_class *)objc_opt_class();
  if (result)
  {
    uint64_t v15 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v15, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)hueSaturationValueGradientFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CIHueSaturationValueGradient"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__hueSaturationValueGradientFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (hueSaturationValueGradientFilter_onceToken != -1) {
    dispatch_once(&hueSaturationValueGradientFilter_onceToken, block);
  }
  return v2;
}

uint64_t __54__CIFilter_Builtins__hueSaturationValueGradientFilter__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_value, (IMP)floatGetter, "f@:");
    class_addMethod(v1, sel_setValue_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    uint64_t v3 = v2;
    class_addMethod(v2, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  BOOL v4 = (objc_class *)objc_opt_class();
  if (v4)
  {
    char v5 = v4;
    class_addMethod(v4, sel_softness, (IMP)floatGetter, "f@:");
    class_addMethod(v5, sel_setSoftness_, (IMP)floatSetter, "v@:f");
  }
  char v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    uint64_t v7 = v6;
    class_addMethod(v6, sel_dither, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setDither_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = objc_opt_class();
  if (result)
  {
    uint64_t v9 = (void *)result;
    BOOL v10 = [NSStringFromSelector(sel_colorSpace) isEqualToString:@"inputImage"];
    char v11 = [v9 instancesRespondToSelector:sel_colorSpace];
    if (v10)
    {
      if ((v11 & 1) == 0) {
        class_addMethod((Class)v9, sel_colorSpace, (IMP)iiGetter, "@@:");
      }
      uint64_t result = [v9 instancesRespondToSelector:sel_setColorSpace_];
      char v12 = (void (*)(void))iiSetter;
      if ((result & 1) == 0)
      {
LABEL_14:
        return class_addMethod((Class)v9, sel_setColorSpace_, v12, "v@:@");
      }
    }
    else
    {
      if ((v11 & 1) == 0) {
        class_addMethod((Class)v9, sel_colorSpace, (IMP)objGetter, "@@:");
      }
      uint64_t result = [v9 instancesRespondToSelector:sel_setColorSpace_];
      char v12 = (void (*)(void))objSetter;
      if ((result & 1) == 0) {
        goto LABEL_14;
      }
    }
  }
  return result;
}

+ (CIFilter)linearGradientFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CILinearGradient"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__linearGradientFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (linearGradientFilter_onceToken != -1) {
    dispatch_once(&linearGradientFilter_onceToken, block);
  }
  return v2;
}

uint64_t __42__CIFilter_Builtins__linearGradientFilter__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    uint64_t v3 = v2;
    class_addMethod(v2, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v3, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v4 = objc_opt_class();
  if (v4)
  {
    char v5 = (void *)v4;
    BOOL v6 = [NSStringFromSelector(sel_color0) isEqualToString:@"inputImage"];
    char v7 = [v5 instancesRespondToSelector:sel_color0];
    if (v6)
    {
      if ((v7 & 1) == 0) {
        class_addMethod((Class)v5, sel_color0, (IMP)iiGetter, "@@:");
      }
      char v8 = [v5 instancesRespondToSelector:sel_setColor0_];
      uint64_t v9 = (void (*)(void))iiSetter;
      if ((v8 & 1) == 0) {
LABEL_10:
      }
        class_addMethod((Class)v5, sel_setColor0_, v9, "v@:@");
    }
    else
    {
      if ((v7 & 1) == 0) {
        class_addMethod((Class)v5, sel_color0, (IMP)objGetter, "@@:");
      }
      char v15 = [v5 instancesRespondToSelector:sel_setColor0_];
      uint64_t v9 = (void (*)(void))objSetter;
      if ((v15 & 1) == 0) {
        goto LABEL_10;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v11 = (void *)result;
  BOOL v12 = [NSStringFromSelector(sel_color1) isEqualToString:@"inputImage"];
  char v13 = [v11 instancesRespondToSelector:sel_color1];
  if (v12)
  {
    if ((v13 & 1) == 0) {
      class_addMethod((Class)v11, sel_color1, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v11 instancesRespondToSelector:sel_setColor1_];
    Class v14 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_16:
      return class_addMethod((Class)v11, sel_setColor1_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0) {
      class_addMethod((Class)v11, sel_color1, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v11 instancesRespondToSelector:sel_setColor1_];
    Class v14 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_16;
    }
  }
  return result;
}

uint64_t __42__CIFilter_Builtins__radialGradientFilter__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    uint64_t v3 = v2;
    class_addMethod(v2, sel_radius0, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setRadius0_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v4 = (objc_class *)objc_opt_class();
  if (v4)
  {
    char v5 = v4;
    class_addMethod(v4, sel_radius1, (IMP)floatGetter, "f@:");
    class_addMethod(v5, sel_setRadius1_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v6 = objc_opt_class();
  if (v6)
  {
    char v7 = (void *)v6;
    BOOL v8 = [NSStringFromSelector(sel_color0) isEqualToString:@"inputImage"];
    char v9 = [v7 instancesRespondToSelector:sel_color0];
    if (v8)
    {
      if ((v9 & 1) == 0) {
        class_addMethod((Class)v7, sel_color0, (IMP)iiGetter, "@@:");
      }
      char v10 = [v7 instancesRespondToSelector:sel_setColor0_];
      char v11 = (void (*)(void))iiSetter;
      if ((v10 & 1) == 0) {
LABEL_12:
      }
        class_addMethod((Class)v7, sel_setColor0_, v11, "v@:@");
    }
    else
    {
      if ((v9 & 1) == 0) {
        class_addMethod((Class)v7, sel_color0, (IMP)objGetter, "@@:");
      }
      char v17 = [v7 instancesRespondToSelector:sel_setColor0_];
      char v11 = (void (*)(void))objSetter;
      if ((v17 & 1) == 0) {
        goto LABEL_12;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v13 = (void *)result;
  BOOL v14 = [NSStringFromSelector(sel_color1) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_color1];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_color1, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setColor1_];
    char v16 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_18:
      return class_addMethod((Class)v13, sel_setColor1_, v16, "v@:@");
    }
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_color1, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setColor1_];
    char v16 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_18;
    }
  }
  return result;
}

+ (CIFilter)smoothLinearGradientFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CISmoothLinearGradient"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__smoothLinearGradientFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (smoothLinearGradientFilter_onceToken != -1) {
    dispatch_once(&smoothLinearGradientFilter_onceToken, block);
  }
  return v2;
}

uint64_t __48__CIFilter_Builtins__smoothLinearGradientFilter__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    uint64_t v3 = v2;
    class_addMethod(v2, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v3, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v4 = objc_opt_class();
  if (v4)
  {
    char v5 = (void *)v4;
    BOOL v6 = [NSStringFromSelector(sel_color0) isEqualToString:@"inputImage"];
    char v7 = [v5 instancesRespondToSelector:sel_color0];
    if (v6)
    {
      if ((v7 & 1) == 0) {
        class_addMethod((Class)v5, sel_color0, (IMP)iiGetter, "@@:");
      }
      char v8 = [v5 instancesRespondToSelector:sel_setColor0_];
      char v9 = (void (*)(void))iiSetter;
      if ((v8 & 1) == 0) {
LABEL_10:
      }
        class_addMethod((Class)v5, sel_setColor0_, v9, "v@:@");
    }
    else
    {
      if ((v7 & 1) == 0) {
        class_addMethod((Class)v5, sel_color0, (IMP)objGetter, "@@:");
      }
      char v15 = [v5 instancesRespondToSelector:sel_setColor0_];
      char v9 = (void (*)(void))objSetter;
      if ((v15 & 1) == 0) {
        goto LABEL_10;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v11 = (void *)result;
  BOOL v12 = [NSStringFromSelector(sel_color1) isEqualToString:@"inputImage"];
  char v13 = [v11 instancesRespondToSelector:sel_color1];
  if (v12)
  {
    if ((v13 & 1) == 0) {
      class_addMethod((Class)v11, sel_color1, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v11 instancesRespondToSelector:sel_setColor1_];
    BOOL v14 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_16:
      return class_addMethod((Class)v11, sel_setColor1_, v14, "v@:@");
    }
  }
  else
  {
    if ((v13 & 1) == 0) {
      class_addMethod((Class)v11, sel_color1, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v11 instancesRespondToSelector:sel_setColor1_];
    BOOL v14 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_16;
    }
  }
  return result;
}

+ (CIFilter)sharpenLuminanceFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CISharpenLuminance"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__sharpenLuminanceFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (sharpenLuminanceFilter_onceToken != -1) {
    dispatch_once(&sharpenLuminanceFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__sharpenLuminanceFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  BOOL v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_sharpness, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)unsharpMaskFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIUnsharpMask"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__unsharpMaskFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (unsharpMaskFilter_onceToken != -1) {
    dispatch_once(&unsharpMaskFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__unsharpMaskFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  BOOL v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)circularScreenFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CICircularScreen"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__circularScreenFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (circularScreenFilter_onceToken != -1) {
    dispatch_once(&circularScreenFilter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__circularScreenFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  BOOL v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)CMYKHalftone
{
  BOOL v2 = +[CIFilter filterWithName:@"CICMYKHalftone"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__CMYKHalftone__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (CMYKHalftone_onceToken != -1) {
    dispatch_once(&CMYKHalftone_onceToken, block);
  }
  return v2;
}

objc_class *__34__CIFilter_Builtins__CMYKHalftone__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v18 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v18 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  BOOL v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_sharpness, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  BOOL v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_grayComponentReplacement, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setGrayComponentReplacement_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v17 = result;
    class_addMethod(result, sel_underColorRemoval, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v17, sel_setUnderColorRemoval_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)dotScreenFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDotScreen"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__dotScreenFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (dotScreenFilter_onceToken != -1) {
    dispatch_once(&dotScreenFilter_onceToken, block);
  }
  return v2;
}

objc_class *__37__CIFilter_Builtins__dotScreenFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  BOOL v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)hatchedScreenFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIHatchedScreen"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__hatchedScreenFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (hatchedScreenFilter_onceToken != -1) {
    dispatch_once(&hatchedScreenFilter_onceToken, block);
  }
  return v2;
}

objc_class *__41__CIFilter_Builtins__hatchedScreenFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  BOOL v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)lineScreenFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILineScreen"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__lineScreenFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (lineScreenFilter_onceToken != -1) {
    dispatch_once(&lineScreenFilter_onceToken, block);
  }
  return v2;
}

objc_class *__38__CIFilter_Builtins__lineScreenFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  BOOL v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)bicubicScaleTransformFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBicubicScaleTransform"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__bicubicScaleTransformFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (bicubicScaleTransformFilter_onceToken != -1) {
    dispatch_once(&bicubicScaleTransformFilter_onceToken, block);
  }
  return v2;
}

objc_class *__49__CIFilter_Builtins__bicubicScaleTransformFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  BOOL v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_aspectRatio, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAspectRatio_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_parameterB, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setParameterB_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_parameterC, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setParameterC_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)edgePreserveUpsampleFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIEdgePreserveUpsampleFilter"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__edgePreserveUpsampleFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (edgePreserveUpsampleFilter_onceToken != -1) {
    dispatch_once(&edgePreserveUpsampleFilter_onceToken, block);
  }
  return v2;
}

objc_class *__48__CIFilter_Builtins__edgePreserveUpsampleFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_smallImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_smallImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_smallImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setSmallImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setSmallImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_smallImage, (IMP)objGetter, "@@:");
    }
    char v17 = [v7 instancesRespondToSelector:sel_setSmallImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v17 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_spatialSigma, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setSpatialSigma_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_lumaSigma, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v15, sel_setLumaSigma_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)keystoneCorrectionCombinedFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIKeystoneCorrectionCombined"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__keystoneCorrectionCombinedFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (keystoneCorrectionCombinedFilter_onceToken != -1) {
    dispatch_once(&keystoneCorrectionCombinedFilter_onceToken, block);
  }
  return v2;
}

objc_class *__54__CIFilter_Builtins__keystoneCorrectionCombinedFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_focalLength, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setFocalLength_, (IMP)floatSetter, "v@:f");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v13, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v15, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)keystoneCorrectionHorizontalFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIKeystoneCorrectionHorizontal"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CIFilter_Builtins__keystoneCorrectionHorizontalFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (keystoneCorrectionHorizontalFilter_onceToken != -1) {
    dispatch_once(&keystoneCorrectionHorizontalFilter_onceToken, block);
  }
  return v2;
}

objc_class *__56__CIFilter_Builtins__keystoneCorrectionHorizontalFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_focalLength, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setFocalLength_, (IMP)floatSetter, "v@:f");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v13, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v15, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)keystoneCorrectionVerticalFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIKeystoneCorrectionVertical"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__keystoneCorrectionVerticalFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (keystoneCorrectionVerticalFilter_onceToken != -1) {
    dispatch_once(&keystoneCorrectionVerticalFilter_onceToken, block);
  }
  return v2;
}

objc_class *__54__CIFilter_Builtins__keystoneCorrectionVerticalFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_focalLength, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setFocalLength_, (IMP)floatSetter, "v@:f");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v13, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v15, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)lanczosScaleTransformFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILanczosScaleTransform"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__lanczosScaleTransformFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (lanczosScaleTransformFilter_onceToken != -1) {
    dispatch_once(&lanczosScaleTransformFilter_onceToken, block);
  }
  return v2;
}

objc_class *__49__CIFilter_Builtins__lanczosScaleTransformFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_aspectRatio, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setAspectRatio_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (id)maximumScaleTransformFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMaximumScaleTransform"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__maximumScaleTransformFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (maximumScaleTransformFilter_onceToken != -1) {
    dispatch_once(&maximumScaleTransformFilter_onceToken, block);
  }
  return v2;
}

objc_class *__49__CIFilter_Builtins__maximumScaleTransformFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_aspectRatio, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setAspectRatio_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)perspectiveCorrectionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPerspectiveCorrection"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__perspectiveCorrectionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (perspectiveCorrectionFilter_onceToken != -1) {
    dispatch_once(&perspectiveCorrectionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__49__CIFilter_Builtins__perspectiveCorrectionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v13, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_crop, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v15, sel_setCrop_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)perspectiveRotateFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPerspectiveRotate"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__perspectiveRotateFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (perspectiveRotateFilter_onceToken != -1) {
    dispatch_once(&perspectiveRotateFilter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__perspectiveRotateFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_focalLength, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setFocalLength_, (IMP)floatSetter, "v@:f");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_pitch, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setPitch_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, "yaw", (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setYaw_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_roll, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setRoll_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)perspectiveTransformFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPerspectiveTransform"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__perspectiveTransformFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (perspectiveTransformFilter_onceToken != -1) {
    dispatch_once(&perspectiveTransformFilter_onceToken, block);
  }
  return v2;
}

objc_class *__48__CIFilter_Builtins__perspectiveTransformFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v13, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)perspectiveTransformWithExtentFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPerspectiveTransformWithExtent"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CIFilter_Builtins__perspectiveTransformWithExtentFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (perspectiveTransformWithExtentFilter_onceToken != -1) {
    dispatch_once(&perspectiveTransformWithExtentFilter_onceToken, block);
  }
  return v2;
}

objc_class *__58__CIFilter_Builtins__perspectiveTransformWithExtentFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v13, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v15, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)straightenFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIStraightenFilter"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__straightenFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (straightenFilter_onceToken != -1) {
    dispatch_once(&straightenFilter_onceToken, block);
  }
  return v2;
}

objc_class *__38__CIFilter_Builtins__straightenFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)accordionFoldTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAccordionFoldTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__accordionFoldTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (accordionFoldTransitionFilter_onceToken != -1) {
    dispatch_once(&accordionFoldTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__51__CIFilter_Builtins__accordionFoldTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v20 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v20 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v21 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v21 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_bottomHeight, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setBottomHeight_, (IMP)floatSetter, "v@:f");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_numberOfFolds, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setNumberOfFolds_, (IMP)floatSetter, "v@:f");
  }
  char v16 = (objc_class *)objc_opt_class();
  if (v16)
  {
    char v17 = v16;
    class_addMethod(v16, sel_foldShadowAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v17, sel_setFoldShadowAmount_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    int v19 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v19, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)barsSwipeTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBarsSwipeTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__barsSwipeTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (barsSwipeTransitionFilter_onceToken != -1) {
    dispatch_once(&barsSwipeTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__47__CIFilter_Builtins__barsSwipeTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v20 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v20 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v21 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v21 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  char v16 = (objc_class *)objc_opt_class();
  if (v16)
  {
    char v17 = v16;
    class_addMethod(v16, sel_barOffset, (IMP)floatGetter, "f@:");
    class_addMethod(v17, sel_setBarOffset_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    int v19 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v19, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)copyMachineTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CICopyMachineTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__copyMachineTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (copyMachineTransitionFilter_onceToken != -1) {
    dispatch_once(&copyMachineTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__49__CIFilter_Builtins__copyMachineTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v28 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v28 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v29 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v29 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v13, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  uint64_t v14 = objc_opt_class();
  if (v14)
  {
    char v15 = (void *)v14;
    BOOL v16 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v17 = [v15 instancesRespondToSelector:sel_color];
    if (v16)
    {
      if ((v17 & 1) == 0) {
        class_addMethod((Class)v15, sel_color, (IMP)iiGetter, "@@:");
      }
      char v18 = [v15 instancesRespondToSelector:sel_setColor_];
      int v19 = (void (*)(void))iiSetter;
      if ((v18 & 1) == 0) {
LABEL_20:
      }
        class_addMethod((Class)v15, sel_setColor_, v19, "v@:@");
    }
    else
    {
      if ((v17 & 1) == 0) {
        class_addMethod((Class)v15, sel_color, (IMP)objGetter, "@@:");
      }
      char v30 = [v15 instancesRespondToSelector:sel_setColor_];
      int v19 = (void (*)(void))objSetter;
      if ((v30 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  char v20 = (objc_class *)objc_opt_class();
  if (v20)
  {
    char v21 = v20;
    class_addMethod(v20, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v21, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  double v22 = (objc_class *)objc_opt_class();
  if (v22)
  {
    double v23 = v22;
    class_addMethod(v22, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v23, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  double v24 = (objc_class *)objc_opt_class();
  if (v24)
  {
    double v25 = v24;
    class_addMethod(v24, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v25, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    double v27 = result;
    class_addMethod(result, sel_opacity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v27, sel_setOpacity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)disintegrateWithMaskTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDisintegrateWithMaskTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CIFilter_Builtins__disintegrateWithMaskTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (disintegrateWithMaskTransitionFilter_onceToken != -1) {
    dispatch_once(&disintegrateWithMaskTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__58__CIFilter_Builtins__disintegrateWithMaskTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v26 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v26 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v27 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v27 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_maskImage) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_maskImage];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setMaskImage_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)objGetter, "@@:");
    }
    char v28 = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v17 = (void (*)(void))objSetter;
    if ((v28 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  char v18 = (objc_class *)objc_opt_class();
  if (v18)
  {
    int v19 = v18;
    class_addMethod(v18, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v19, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  char v20 = (objc_class *)objc_opt_class();
  if (v20)
  {
    char v21 = v20;
    class_addMethod(v20, sel_shadowRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v21, sel_setShadowRadius_, (IMP)floatSetter, "v@:f");
  }
  double v22 = (objc_class *)objc_opt_class();
  if (v22)
  {
    double v23 = v22;
    class_addMethod(v22, sel_shadowDensity, (IMP)floatGetter, "f@:");
    class_addMethod(v23, sel_setShadowDensity_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    double v25 = result;
    class_addMethod(result, sel_shadowOffset, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v25, sel_setShadowOffset_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)dissolveTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDissolveTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__dissolveTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (dissolveTransitionFilter_onceToken != -1) {
    dispatch_once(&dissolveTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__dissolveTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)flashTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIFlashTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__flashTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (flashTransitionFilter_onceToken != -1) {
    dispatch_once(&flashTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__flashTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v32 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v32 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v33 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v33 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v13, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v15, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  uint64_t v16 = objc_opt_class();
  if (v16)
  {
    char v17 = (void *)v16;
    BOOL v18 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v19 = [v17 instancesRespondToSelector:sel_color];
    if (v18)
    {
      if ((v19 & 1) == 0) {
        class_addMethod((Class)v17, sel_color, (IMP)iiGetter, "@@:");
      }
      char v20 = [v17 instancesRespondToSelector:sel_setColor_];
      char v21 = (void (*)(void))iiSetter;
      if ((v20 & 1) == 0) {
LABEL_22:
      }
        class_addMethod((Class)v17, sel_setColor_, v21, "v@:@");
    }
    else
    {
      if ((v19 & 1) == 0) {
        class_addMethod((Class)v17, sel_color, (IMP)objGetter, "@@:");
      }
      char v34 = [v17 instancesRespondToSelector:sel_setColor_];
      char v21 = (void (*)(void))objSetter;
      if ((v34 & 1) == 0) {
        goto LABEL_22;
      }
    }
  }
  double v22 = (objc_class *)objc_opt_class();
  if (v22)
  {
    double v23 = v22;
    class_addMethod(v22, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v23, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  double v24 = (objc_class *)objc_opt_class();
  if (v24)
  {
    double v25 = v24;
    class_addMethod(v24, sel_maxStriationRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v25, sel_setMaxStriationRadius_, (IMP)floatSetter, "v@:f");
  }
  char v26 = (objc_class *)objc_opt_class();
  if (v26)
  {
    char v27 = v26;
    class_addMethod(v26, sel_striationStrength, (IMP)floatGetter, "f@:");
    class_addMethod(v27, sel_setStriationStrength_, (IMP)floatSetter, "v@:f");
  }
  char v28 = (objc_class *)objc_opt_class();
  if (v28)
  {
    char v29 = v28;
    class_addMethod(v28, sel_striationContrast, (IMP)floatGetter, "f@:");
    class_addMethod(v29, sel_setStriationContrast_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    double v31 = result;
    class_addMethod(result, sel_fadeThreshold, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v31, sel_setFadeThreshold_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)modTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIModTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__modTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (modTransitionFilter_onceToken != -1) {
    dispatch_once(&modTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__41__CIFilter_Builtins__modTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v22 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v22 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v23 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v23 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v13, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v16 = (objc_class *)objc_opt_class();
  if (v16)
  {
    char v17 = v16;
    class_addMethod(v16, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v17, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  BOOL v18 = (objc_class *)objc_opt_class();
  if (v18)
  {
    char v19 = v18;
    class_addMethod(v18, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v19, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v21 = result;
    class_addMethod(result, sel_compression, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v21, sel_setCompression_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)pageCurlTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPageCurlTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__pageCurlTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (pageCurlTransitionFilter_onceToken != -1) {
    dispatch_once(&pageCurlTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__pageCurlTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v32 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v32 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v33 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v33 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_backsideImage) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_backsideImage];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_backsideImage, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setBacksideImage_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setBacksideImage_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_backsideImage, (IMP)objGetter, "@@:");
    }
    char v34 = [v13 instancesRespondToSelector:sel_setBacksideImage_];
    char v17 = (void (*)(void))objSetter;
    if ((v34 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t v18 = objc_opt_class();
  if (!v18) {
    goto LABEL_25;
  }
  char v19 = (void *)v18;
  BOOL v20 = [NSStringFromSelector(sel_shadingImage) isEqualToString:@"inputImage"];
  char v21 = [v19 instancesRespondToSelector:sel_shadingImage];
  if (v20)
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_shadingImage, (IMP)iiGetter, "@@:");
    }
    char v22 = [v19 instancesRespondToSelector:sel_setShadingImage_];
    char v23 = (void (*)(void))iiSetter;
    if ((v22 & 1) == 0) {
LABEL_24:
    }
      class_addMethod((Class)v19, sel_setShadingImage_, v23, "v@:@");
  }
  else
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_shadingImage, (IMP)objGetter, "@@:");
    }
    char v35 = [v19 instancesRespondToSelector:sel_setShadingImage_];
    char v23 = (void (*)(void))objSetter;
    if ((v35 & 1) == 0) {
      goto LABEL_24;
    }
  }
LABEL_25:
  double v24 = (objc_class *)objc_opt_class();
  if (v24)
  {
    double v25 = v24;
    class_addMethod(v24, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v25, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  char v26 = (objc_class *)objc_opt_class();
  if (v26)
  {
    char v27 = v26;
    class_addMethod(v26, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v27, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  char v28 = (objc_class *)objc_opt_class();
  if (v28)
  {
    char v29 = v28;
    class_addMethod(v28, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v29, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    double v31 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v31, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)pageCurlWithShadowTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPageCurlWithShadowTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CIFilter_Builtins__pageCurlWithShadowTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (pageCurlWithShadowTransitionFilter_onceToken != -1) {
    dispatch_once(&pageCurlWithShadowTransitionFilter_onceToken, block);
  }
  return v2;
}

uint64_t __56__CIFilter_Builtins__pageCurlWithShadowTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v35 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v35 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v36 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v36 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_backsideImage) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_backsideImage];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_backsideImage, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setBacksideImage_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setBacksideImage_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_backsideImage, (IMP)objGetter, "@@:");
    }
    char v37 = [v13 instancesRespondToSelector:sel_setBacksideImage_];
    char v17 = (void (*)(void))objSetter;
    if ((v37 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t v18 = (objc_class *)objc_opt_class();
  if (v18)
  {
    char v19 = v18;
    class_addMethod(v18, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v19, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  BOOL v20 = (objc_class *)objc_opt_class();
  if (v20)
  {
    char v21 = v20;
    class_addMethod(v20, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v21, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  char v22 = (objc_class *)objc_opt_class();
  if (v22)
  {
    char v23 = v22;
    class_addMethod(v22, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v23, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  double v24 = (objc_class *)objc_opt_class();
  if (v24)
  {
    double v25 = v24;
    class_addMethod(v24, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v25, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  char v26 = (objc_class *)objc_opt_class();
  if (v26)
  {
    char v27 = v26;
    class_addMethod(v26, sel_shadowSize, (IMP)floatGetter, "f@:");
    class_addMethod(v27, sel_setShadowSize_, (IMP)floatSetter, "v@:f");
  }
  char v28 = (objc_class *)objc_opt_class();
  if (v28)
  {
    char v29 = v28;
    class_addMethod(v28, sel_shadowAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v29, sel_setShadowAmount_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = objc_opt_class();
  if (result)
  {
    double v31 = (void *)result;
    BOOL v32 = [NSStringFromSelector(sel_shadowExtent) isEqualToString:@"inputImage"];
    char v33 = [v31 instancesRespondToSelector:sel_shadowExtent];
    if (v32)
    {
      if ((v33 & 1) == 0) {
        class_addMethod((Class)v31, sel_shadowExtent, (IMP)iiGetter, "@@:");
      }
      uint64_t result = [v31 instancesRespondToSelector:sel_setShadowExtent_];
      char v34 = (void (*)(void))iiSetter;
      if ((result & 1) == 0)
      {
LABEL_36:
        return class_addMethod((Class)v31, sel_setShadowExtent_, v34, "v@:@");
      }
    }
    else
    {
      if ((v33 & 1) == 0) {
        class_addMethod((Class)v31, sel_shadowExtent, (IMP)objGetter, "@@:");
      }
      uint64_t result = [v31 instancesRespondToSelector:sel_setShadowExtent_];
      char v34 = (void (*)(void))objSetter;
      if ((result & 1) == 0) {
        goto LABEL_36;
      }
    }
  }
  return result;
}

+ (CIFilter)rippleTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIRippleTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__rippleTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (rippleTransitionFilter_onceToken != -1) {
    dispatch_once(&rippleTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__rippleTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v28 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v28 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v29 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v29 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_shadingImage) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_shadingImage];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_shadingImage, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setShadingImage_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setShadingImage_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_shadingImage, (IMP)objGetter, "@@:");
    }
    char v30 = [v13 instancesRespondToSelector:sel_setShadingImage_];
    char v17 = (void (*)(void))objSetter;
    if ((v30 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t v18 = (objc_class *)objc_opt_class();
  if (v18)
  {
    char v19 = v18;
    class_addMethod(v18, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v19, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v20 = (objc_class *)objc_opt_class();
  if (v20)
  {
    char v21 = v20;
    class_addMethod(v20, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v21, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  char v22 = (objc_class *)objc_opt_class();
  if (v22)
  {
    char v23 = v22;
    class_addMethod(v22, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v23, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  double v24 = (objc_class *)objc_opt_class();
  if (v24)
  {
    double v25 = v24;
    class_addMethod(v24, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v25, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v27 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v27, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)swipeTransitionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISwipeTransition"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__swipeTransitionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (swipeTransitionFilter_onceToken != -1) {
    dispatch_once(&swipeTransitionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__swipeTransitionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v28 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v28 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_targetImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_targetImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTargetImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_targetImage, (IMP)objGetter, "@@:");
    }
    char v29 = [v7 instancesRespondToSelector:sel_setTargetImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v29 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v13, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  uint64_t v14 = objc_opt_class();
  if (v14)
  {
    char v15 = (void *)v14;
    BOOL v16 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v17 = [v15 instancesRespondToSelector:sel_color];
    if (v16)
    {
      if ((v17 & 1) == 0) {
        class_addMethod((Class)v15, sel_color, (IMP)iiGetter, "@@:");
      }
      char v18 = [v15 instancesRespondToSelector:sel_setColor_];
      char v19 = (void (*)(void))iiSetter;
      if ((v18 & 1) == 0) {
LABEL_20:
      }
        class_addMethod((Class)v15, sel_setColor_, v19, "v@:@");
    }
    else
    {
      if ((v17 & 1) == 0) {
        class_addMethod((Class)v15, sel_color, (IMP)objGetter, "@@:");
      }
      char v30 = [v15 instancesRespondToSelector:sel_setColor_];
      char v19 = (void (*)(void))objSetter;
      if ((v30 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  BOOL v20 = (objc_class *)objc_opt_class();
  if (v20)
  {
    char v21 = v20;
    class_addMethod(v20, sel_time, (IMP)floatGetter, "f@:");
    class_addMethod(v21, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  char v22 = (objc_class *)objc_opt_class();
  if (v22)
  {
    char v23 = v22;
    class_addMethod(v22, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v23, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  double v24 = (objc_class *)objc_opt_class();
  if (v24)
  {
    double v25 = v24;
    class_addMethod(v24, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v25, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v27 = result;
    class_addMethod(result, sel_opacity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v27, sel_setOpacity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)additionCompositingFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAdditionCompositing"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__additionCompositingFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (additionCompositingFilter_onceToken != -1) {
    dispatch_once(&additionCompositingFilter_onceToken, block);
  }
  return v2;
}

uint64_t __47__CIFilter_Builtins__additionCompositingFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)colorBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__colorBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorBlendModeFilter_onceToken != -1) {
    dispatch_once(&colorBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __42__CIFilter_Builtins__colorBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)colorBurnBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorBurnBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__colorBurnBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorBurnBlendModeFilter_onceToken != -1) {
    dispatch_once(&colorBurnBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __46__CIFilter_Builtins__colorBurnBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)colorDodgeBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorDodgeBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__colorDodgeBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorDodgeBlendModeFilter_onceToken != -1) {
    dispatch_once(&colorDodgeBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __47__CIFilter_Builtins__colorDodgeBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)darkenBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDarkenBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__darkenBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (darkenBlendModeFilter_onceToken != -1) {
    dispatch_once(&darkenBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __43__CIFilter_Builtins__darkenBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)differenceBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDifferenceBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__differenceBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (differenceBlendModeFilter_onceToken != -1) {
    dispatch_once(&differenceBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __47__CIFilter_Builtins__differenceBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)divideBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDivideBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__divideBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (divideBlendModeFilter_onceToken != -1) {
    dispatch_once(&divideBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __43__CIFilter_Builtins__divideBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)exclusionBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIExclusionBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__exclusionBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (exclusionBlendModeFilter_onceToken != -1) {
    dispatch_once(&exclusionBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __46__CIFilter_Builtins__exclusionBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)hardLightBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIHardLightBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__hardLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (hardLightBlendModeFilter_onceToken != -1) {
    dispatch_once(&hardLightBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __46__CIFilter_Builtins__hardLightBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)hueBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIHueBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__hueBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (hueBlendModeFilter_onceToken != -1) {
    dispatch_once(&hueBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __40__CIFilter_Builtins__hueBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)lightenBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILightenBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__lightenBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (lightenBlendModeFilter_onceToken != -1) {
    dispatch_once(&lightenBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __44__CIFilter_Builtins__lightenBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)linearBurnBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILinearBurnBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__linearBurnBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (linearBurnBlendModeFilter_onceToken != -1) {
    dispatch_once(&linearBurnBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __47__CIFilter_Builtins__linearBurnBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)linearDodgeBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILinearDodgeBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__linearDodgeBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (linearDodgeBlendModeFilter_onceToken != -1) {
    dispatch_once(&linearDodgeBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __48__CIFilter_Builtins__linearDodgeBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)linearLightBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILinearLightBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__linearLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (linearLightBlendModeFilter_onceToken != -1) {
    dispatch_once(&linearLightBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __48__CIFilter_Builtins__linearLightBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)luminosityBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILuminosityBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__luminosityBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (luminosityBlendModeFilter_onceToken != -1) {
    dispatch_once(&luminosityBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __47__CIFilter_Builtins__luminosityBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)maximumCompositingFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMaximumCompositing"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__maximumCompositingFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (maximumCompositingFilter_onceToken != -1) {
    dispatch_once(&maximumCompositingFilter_onceToken, block);
  }
  return v2;
}

uint64_t __46__CIFilter_Builtins__maximumCompositingFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)minimumCompositingFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMinimumCompositing"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__minimumCompositingFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (minimumCompositingFilter_onceToken != -1) {
    dispatch_once(&minimumCompositingFilter_onceToken, block);
  }
  return v2;
}

uint64_t __46__CIFilter_Builtins__minimumCompositingFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)multiplyBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMultiplyBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__multiplyBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (multiplyBlendModeFilter_onceToken != -1) {
    dispatch_once(&multiplyBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __45__CIFilter_Builtins__multiplyBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)multiplyCompositingFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMultiplyCompositing"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__multiplyCompositingFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (multiplyCompositingFilter_onceToken != -1) {
    dispatch_once(&multiplyCompositingFilter_onceToken, block);
  }
  return v2;
}

uint64_t __47__CIFilter_Builtins__multiplyCompositingFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)overlayBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIOverlayBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__overlayBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (overlayBlendModeFilter_onceToken != -1) {
    dispatch_once(&overlayBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __44__CIFilter_Builtins__overlayBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)pinLightBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPinLightBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__pinLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (pinLightBlendModeFilter_onceToken != -1) {
    dispatch_once(&pinLightBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __45__CIFilter_Builtins__pinLightBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)saturationBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISaturationBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__saturationBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (saturationBlendModeFilter_onceToken != -1) {
    dispatch_once(&saturationBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __47__CIFilter_Builtins__saturationBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)screenBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIScreenBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__screenBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (screenBlendModeFilter_onceToken != -1) {
    dispatch_once(&screenBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __43__CIFilter_Builtins__screenBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)softLightBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISoftLightBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__softLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (softLightBlendModeFilter_onceToken != -1) {
    dispatch_once(&softLightBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __46__CIFilter_Builtins__softLightBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)sourceAtopCompositingFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISourceAtopCompositing"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__sourceAtopCompositingFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (sourceAtopCompositingFilter_onceToken != -1) {
    dispatch_once(&sourceAtopCompositingFilter_onceToken, block);
  }
  return v2;
}

uint64_t __49__CIFilter_Builtins__sourceAtopCompositingFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)sourceInCompositingFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISourceInCompositing"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__sourceInCompositingFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (sourceInCompositingFilter_onceToken != -1) {
    dispatch_once(&sourceInCompositingFilter_onceToken, block);
  }
  return v2;
}

uint64_t __47__CIFilter_Builtins__sourceInCompositingFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)sourceOutCompositingFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISourceOutCompositing"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__sourceOutCompositingFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (sourceOutCompositingFilter_onceToken != -1) {
    dispatch_once(&sourceOutCompositingFilter_onceToken, block);
  }
  return v2;
}

uint64_t __48__CIFilter_Builtins__sourceOutCompositingFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)sourceOverCompositingFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISourceOverCompositing"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__sourceOverCompositingFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (sourceOverCompositingFilter_onceToken != -1) {
    dispatch_once(&sourceOverCompositingFilter_onceToken, block);
  }
  return v2;
}

uint64_t __49__CIFilter_Builtins__sourceOverCompositingFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)subtractBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISubtractBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__subtractBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (subtractBlendModeFilter_onceToken != -1) {
    dispatch_once(&subtractBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __45__CIFilter_Builtins__subtractBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)vividLightBlendModeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIVividLightBlendMode"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__vividLightBlendModeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (vividLightBlendModeFilter_onceToken != -1) {
    dispatch_once(&vividLightBlendModeFilter_onceToken, block);
  }
  return v2;
}

uint64_t __47__CIFilter_Builtins__vividLightBlendModeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setBackgroundImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)colorAbsoluteDifferenceFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorAbsoluteDifference"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__colorAbsoluteDifferenceFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorAbsoluteDifferenceFilter_onceToken != -1) {
    dispatch_once(&colorAbsoluteDifferenceFilter_onceToken, block);
  }
  return v2;
}

uint64_t __51__CIFilter_Builtins__colorAbsoluteDifferenceFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_inputImage2) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_inputImage2];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_inputImage2, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setImage2_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setImage2_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_inputImage2, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setImage2_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)colorClampFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorClamp"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__colorClampFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorClampFilter_onceToken != -1) {
    dispatch_once(&colorClampFilter_onceToken, block);
  }
  return v2;
}

uint64_t __38__CIFilter_Builtins__colorClampFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v17 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v17 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_minComponents) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_minComponents];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_minComponents, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setMinComponents_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setMinComponents_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_minComponents, (IMP)objGetter, "@@:");
    }
    char v18 = [v7 instancesRespondToSelector:sel_setMinComponents_];
    char v11 = (void (*)(void))objSetter;
    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v13 = (void *)result;
  BOOL v14 = [NSStringFromSelector(sel_maxComponents) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_maxComponents];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maxComponents, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaxComponents_];
    BOOL v16 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_18:
      return class_addMethod((Class)v13, sel_setMaxComponents_, v16, "v@:@");
    }
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maxComponents, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaxComponents_];
    BOOL v16 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_18;
    }
  }
  return result;
}

+ (CIFilter)colorControlsFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorControls"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__colorControlsFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorControlsFilter_onceToken != -1) {
    dispatch_once(&colorControlsFilter_onceToken, block);
  }
  return v2;
}

objc_class *__41__CIFilter_Builtins__colorControlsFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_saturation, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setSaturation_, (IMP)floatSetter, "v@:f");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_brightness, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setBrightness_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_contrast, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setContrast_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)colorMatrixFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorMatrix"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__colorMatrixFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorMatrixFilter_onceToken != -1) {
    dispatch_once(&colorMatrixFilter_onceToken, block);
  }
  return v2;
}

uint64_t __39__CIFilter_Builtins__colorMatrixFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v35 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v35 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_RVector) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_RVector];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_RVector, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setRVector_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setRVector_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_RVector, (IMP)objGetter, "@@:");
    }
    char v36 = [v7 instancesRespondToSelector:sel_setRVector_];
    char v11 = (void (*)(void))objSetter;
    if ((v36 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_GVector) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_GVector];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_GVector, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setGVector_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setGVector_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_GVector, (IMP)objGetter, "@@:");
    }
    char v37 = [v13 instancesRespondToSelector:sel_setGVector_];
    char v17 = (void (*)(void))objSetter;
    if ((v37 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t v18 = objc_opt_class();
  if (!v18) {
    goto LABEL_25;
  }
  char v19 = (void *)v18;
  BOOL v20 = [NSStringFromSelector(sel_BVector) isEqualToString:@"inputImage"];
  char v21 = [v19 instancesRespondToSelector:sel_BVector];
  if (v20)
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_BVector, (IMP)iiGetter, "@@:");
    }
    char v22 = [v19 instancesRespondToSelector:sel_setBVector_];
    char v23 = (void (*)(void))iiSetter;
    if ((v22 & 1) == 0) {
LABEL_24:
    }
      class_addMethod((Class)v19, sel_setBVector_, v23, "v@:@");
  }
  else
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_BVector, (IMP)objGetter, "@@:");
    }
    char v38 = [v19 instancesRespondToSelector:sel_setBVector_];
    char v23 = (void (*)(void))objSetter;
    if ((v38 & 1) == 0) {
      goto LABEL_24;
    }
  }
LABEL_25:
  uint64_t v24 = objc_opt_class();
  if (!v24) {
    goto LABEL_31;
  }
  double v25 = (void *)v24;
  BOOL v26 = [NSStringFromSelector(sel_AVector) isEqualToString:@"inputImage"];
  char v27 = [v25 instancesRespondToSelector:sel_AVector];
  if (v26)
  {
    if ((v27 & 1) == 0) {
      class_addMethod((Class)v25, sel_AVector, (IMP)iiGetter, "@@:");
    }
    char v28 = [v25 instancesRespondToSelector:sel_setAVector_];
    char v29 = (void (*)(void))iiSetter;
    if ((v28 & 1) == 0) {
LABEL_30:
    }
      class_addMethod((Class)v25, sel_setAVector_, v29, "v@:@");
  }
  else
  {
    if ((v27 & 1) == 0) {
      class_addMethod((Class)v25, sel_AVector, (IMP)objGetter, "@@:");
    }
    char v39 = [v25 instancesRespondToSelector:sel_setAVector_];
    char v29 = (void (*)(void))objSetter;
    if ((v39 & 1) == 0) {
      goto LABEL_30;
    }
  }
LABEL_31:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  double v31 = (void *)result;
  BOOL v32 = [NSStringFromSelector(sel_biasVector) isEqualToString:@"inputImage"];
  char v33 = [v31 instancesRespondToSelector:sel_biasVector];
  if (v32)
  {
    if ((v33 & 1) == 0) {
      class_addMethod((Class)v31, sel_biasVector, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v31 instancesRespondToSelector:sel_setBiasVector_];
    char v34 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_36:
      return class_addMethod((Class)v31, sel_setBiasVector_, v34, "v@:@");
    }
  }
  else
  {
    if ((v33 & 1) == 0) {
      class_addMethod((Class)v31, sel_biasVector, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v31 instancesRespondToSelector:sel_setBiasVector_];
    char v34 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_36;
    }
  }
  return result;
}

+ (CIFilter)colorPolynomialFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorPolynomial"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__colorPolynomialFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorPolynomialFilter_onceToken != -1) {
    dispatch_once(&colorPolynomialFilter_onceToken, block);
  }
  return v2;
}

uint64_t __43__CIFilter_Builtins__colorPolynomialFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v29 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v29 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_redCoefficients) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_redCoefficients];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_redCoefficients, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setRedCoefficients_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setRedCoefficients_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_redCoefficients, (IMP)objGetter, "@@:");
    }
    char v30 = [v7 instancesRespondToSelector:sel_setRedCoefficients_];
    char v11 = (void (*)(void))objSetter;
    if ((v30 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_greenCoefficients) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_greenCoefficients];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_greenCoefficients, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setGreenCoefficients_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setGreenCoefficients_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_greenCoefficients, (IMP)objGetter, "@@:");
    }
    char v31 = [v13 instancesRespondToSelector:sel_setGreenCoefficients_];
    char v17 = (void (*)(void))objSetter;
    if ((v31 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t v18 = objc_opt_class();
  if (!v18) {
    goto LABEL_25;
  }
  char v19 = (void *)v18;
  BOOL v20 = [NSStringFromSelector(sel_blueCoefficients) isEqualToString:@"inputImage"];
  char v21 = [v19 instancesRespondToSelector:sel_blueCoefficients];
  if (v20)
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_blueCoefficients, (IMP)iiGetter, "@@:");
    }
    char v22 = [v19 instancesRespondToSelector:sel_setBlueCoefficients_];
    char v23 = (void (*)(void))iiSetter;
    if ((v22 & 1) == 0) {
LABEL_24:
    }
      class_addMethod((Class)v19, sel_setBlueCoefficients_, v23, "v@:@");
  }
  else
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_blueCoefficients, (IMP)objGetter, "@@:");
    }
    char v32 = [v19 instancesRespondToSelector:sel_setBlueCoefficients_];
    char v23 = (void (*)(void))objSetter;
    if ((v32 & 1) == 0) {
      goto LABEL_24;
    }
  }
LABEL_25:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  double v25 = (void *)result;
  BOOL v26 = [NSStringFromSelector(sel_alphaCoefficients) isEqualToString:@"inputImage"];
  char v27 = [v25 instancesRespondToSelector:sel_alphaCoefficients];
  if (v26)
  {
    if ((v27 & 1) == 0) {
      class_addMethod((Class)v25, sel_alphaCoefficients, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v25 instancesRespondToSelector:sel_setAlphaCoefficients_];
    char v28 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_30:
      return class_addMethod((Class)v25, sel_setAlphaCoefficients_, v28, "v@:@");
    }
  }
  else
  {
    if ((v27 & 1) == 0) {
      class_addMethod((Class)v25, sel_alphaCoefficients, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v25 instancesRespondToSelector:sel_setAlphaCoefficients_];
    char v28 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_30;
    }
  }
  return result;
}

+ (CIFilter)colorThresholdFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorThreshold"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__colorThresholdFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorThresholdFilter_onceToken != -1) {
    dispatch_once(&colorThresholdFilter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__colorThresholdFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_threshold, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setThreshold_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)colorThresholdOtsuFilter
{
  return +[CIFilter filterWithName:@"CIColorThresholdOtsu"];
}

+ (CIFilter)depthToDisparityFilter
{
  return +[CIFilter filterWithName:@"CIDepthToDisparity"];
}

+ (CIFilter)disparityToDepthFilter
{
  return +[CIFilter filterWithName:@"CIDisparityToDepth"];
}

+ (CIFilter)exposureAdjustFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIExposureAdjust"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__exposureAdjustFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (exposureAdjustFilter_onceToken != -1) {
    dispatch_once(&exposureAdjustFilter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__exposureAdjustFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_EV, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setEV_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)gammaAdjustFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIGammaAdjust"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__gammaAdjustFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (gammaAdjustFilter_onceToken != -1) {
    dispatch_once(&gammaAdjustFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__gammaAdjustFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_power, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setPower_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)hueAdjustFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIHueAdjust"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__hueAdjustFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (hueAdjustFilter_onceToken != -1) {
    dispatch_once(&hueAdjustFilter_onceToken, block);
  }
  return v2;
}

objc_class *__37__CIFilter_Builtins__hueAdjustFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)linearToSRGBToneCurveFilter
{
  return +[CIFilter filterWithName:@"CILinearToSRGBToneCurve"];
}

+ (CIFilter)sRGBToneCurveToLinearFilter
{
  return +[CIFilter filterWithName:@"CISRGBToneCurveToLinear"];
}

+ (CIFilter)temperatureAndTintFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CITemperatureAndTint"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__temperatureAndTintFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (temperatureAndTintFilter_onceToken != -1) {
    dispatch_once(&temperatureAndTintFilter_onceToken, block);
  }
  return v2;
}

uint64_t __46__CIFilter_Builtins__temperatureAndTintFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v17 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v17 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_neutral) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_neutral];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_neutral, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setNeutral_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setNeutral_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_neutral, (IMP)objGetter, "@@:");
    }
    char v18 = [v7 instancesRespondToSelector:sel_setNeutral_];
    char v11 = (void (*)(void))objSetter;
    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v13 = (void *)result;
  BOOL v14 = [NSStringFromSelector(sel_targetNeutral) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_targetNeutral];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_targetNeutral, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setTargetNeutral_];
    char v16 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_18:
      return class_addMethod((Class)v13, sel_setTargetNeutral_, v16, "v@:@");
    }
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_targetNeutral, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setTargetNeutral_];
    char v16 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_18;
    }
  }
  return result;
}

+ (CIFilter)toneCurveFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIToneCurve"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__toneCurveFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (toneCurveFilter_onceToken != -1) {
    dispatch_once(&toneCurveFilter_onceToken, block);
  }
  return v2;
}

objc_class *__37__CIFilter_Builtins__toneCurveFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_point2, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setPoint2_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_point3, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v13, sel_setPoint3_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_point4, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v15, sel_setPoint4_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (id)toneMapHeadroomFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIToneMapHeadroom"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__toneMapHeadroomFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (toneMapHeadroomFilter_onceToken != -1) {
    dispatch_once(&toneMapHeadroomFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__toneMapHeadroomFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_sourceHeadroom, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setSourceHeadroom_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_targetHeadroom, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setTargetHeadroom_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)vibranceFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIVibrance"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__vibranceFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (vibranceFilter_onceToken != -1) {
    dispatch_once(&vibranceFilter_onceToken, block);
  }
  return v2;
}

objc_class *__36__CIFilter_Builtins__vibranceFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_amount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)whitePointAdjustFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIWhitePointAdjust"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__whitePointAdjustFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (whitePointAdjustFilter_onceToken != -1) {
    dispatch_once(&whitePointAdjustFilter_onceToken, block);
  }
  return v2;
}

uint64_t __44__CIFilter_Builtins__whitePointAdjustFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_color];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_color, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setColor_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setColor_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_color, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setColor_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)colorCrossPolynomialFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorCrossPolynomial"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__colorCrossPolynomialFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorCrossPolynomialFilter_onceToken != -1) {
    dispatch_once(&colorCrossPolynomialFilter_onceToken, block);
  }
  return v2;
}

uint64_t __48__CIFilter_Builtins__colorCrossPolynomialFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v23 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v23 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_redCoefficients) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_redCoefficients];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_redCoefficients, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setRedCoefficients_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setRedCoefficients_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_redCoefficients, (IMP)objGetter, "@@:");
    }
    char v24 = [v7 instancesRespondToSelector:sel_setRedCoefficients_];
    char v11 = (void (*)(void))objSetter;
    if ((v24 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_greenCoefficients) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_greenCoefficients];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_greenCoefficients, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setGreenCoefficients_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setGreenCoefficients_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_greenCoefficients, (IMP)objGetter, "@@:");
    }
    char v25 = [v13 instancesRespondToSelector:sel_setGreenCoefficients_];
    char v17 = (void (*)(void))objSetter;
    if ((v25 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v19 = (void *)result;
  BOOL v20 = [NSStringFromSelector(sel_blueCoefficients) isEqualToString:@"inputImage"];
  char v21 = [v19 instancesRespondToSelector:sel_blueCoefficients];
  if (v20)
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_blueCoefficients, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v19 instancesRespondToSelector:sel_setBlueCoefficients_];
    char v22 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_24:
      return class_addMethod((Class)v19, sel_setBlueCoefficients_, v22, "v@:@");
    }
  }
  else
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_blueCoefficients, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v19 instancesRespondToSelector:sel_setBlueCoefficients_];
    char v22 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_24;
    }
  }
  return result;
}

+ (CIFilter)colorCubeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorCube"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__colorCubeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorCubeFilter_onceToken != -1) {
    dispatch_once(&colorCubeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__37__CIFilter_Builtins__colorCubeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_cubeDimension, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setCubeDimension_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v8 = objc_opt_class();
  if (v8)
  {
    char v9 = (void *)v8;
    BOOL v10 = [NSStringFromSelector(sel_cubeData) isEqualToString:@"inputImage"];
    char v11 = [v9 instancesRespondToSelector:sel_cubeData];
    if (v10)
    {
      if ((v11 & 1) == 0) {
        class_addMethod((Class)v9, sel_cubeData, (IMP)iiGetter, "@@:");
      }
      char v12 = [v9 instancesRespondToSelector:sel_setCubeData_];
      char v13 = (void (*)(void))iiSetter;
      if ((v12 & 1) == 0) {
LABEL_14:
      }
        class_addMethod((Class)v9, sel_setCubeData_, v13, "v@:@");
    }
    else
    {
      if ((v11 & 1) == 0) {
        class_addMethod((Class)v9, sel_cubeData, (IMP)objGetter, "@@:");
      }
      char v17 = [v9 instancesRespondToSelector:sel_setCubeData_];
      char v13 = (void (*)(void))objSetter;
      if ((v17 & 1) == 0) {
        goto LABEL_14;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v15, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)colorCubesMixedWithMaskFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorCubesMixedWithMask"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__colorCubesMixedWithMaskFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorCubesMixedWithMaskFilter_onceToken != -1) {
    dispatch_once(&colorCubesMixedWithMaskFilter_onceToken, block);
  }
  return v2;
}

objc_class *__51__CIFilter_Builtins__colorCubesMixedWithMaskFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v34 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v34 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_maskImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_maskImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_maskImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setMaskImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setMaskImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_maskImage, (IMP)objGetter, "@@:");
    }
    char v35 = [v7 instancesRespondToSelector:sel_setMaskImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v35 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_cubeDimension, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setCubeDimension_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v14 = objc_opt_class();
  if (v14)
  {
    char v15 = (void *)v14;
    BOOL v16 = [NSStringFromSelector(sel_cube0Data) isEqualToString:@"inputImage"];
    char v17 = [v15 instancesRespondToSelector:sel_cube0Data];
    if (v16)
    {
      if ((v17 & 1) == 0) {
        class_addMethod((Class)v15, sel_cube0Data, (IMP)iiGetter, "@@:");
      }
      char v18 = [v15 instancesRespondToSelector:sel_setCube0Data_];
      char v19 = (void (*)(void))iiSetter;
      if ((v18 & 1) == 0) {
LABEL_20:
      }
        class_addMethod((Class)v15, sel_setCube0Data_, v19, "v@:@");
    }
    else
    {
      if ((v17 & 1) == 0) {
        class_addMethod((Class)v15, sel_cube0Data, (IMP)objGetter, "@@:");
      }
      char v36 = [v15 instancesRespondToSelector:sel_setCube0Data_];
      char v19 = (void (*)(void))objSetter;
      if ((v36 & 1) == 0) {
        goto LABEL_20;
      }
    }
  }
  uint64_t v20 = objc_opt_class();
  if (!v20) {
    goto LABEL_27;
  }
  char v21 = (void *)v20;
  BOOL v22 = [NSStringFromSelector(sel_cube1Data) isEqualToString:@"inputImage"];
  char v23 = [v21 instancesRespondToSelector:sel_cube1Data];
  if (v22)
  {
    if ((v23 & 1) == 0) {
      class_addMethod((Class)v21, sel_cube1Data, (IMP)iiGetter, "@@:");
    }
    char v24 = [v21 instancesRespondToSelector:sel_setCube1Data_];
    char v25 = (void (*)(void))iiSetter;
    if ((v24 & 1) == 0) {
LABEL_26:
    }
      class_addMethod((Class)v21, sel_setCube1Data_, v25, "v@:@");
  }
  else
  {
    if ((v23 & 1) == 0) {
      class_addMethod((Class)v21, sel_cube1Data, (IMP)objGetter, "@@:");
    }
    char v37 = [v21 instancesRespondToSelector:sel_setCube1Data_];
    char v25 = (void (*)(void))objSetter;
    if ((v37 & 1) == 0) {
      goto LABEL_26;
    }
  }
LABEL_27:
  uint64_t v26 = objc_opt_class();
  if (!v26) {
    goto LABEL_33;
  }
  char v27 = (void *)v26;
  BOOL v28 = [NSStringFromSelector(sel_colorSpace) isEqualToString:@"inputImage"];
  char v29 = [v27 instancesRespondToSelector:sel_colorSpace];
  if (v28)
  {
    if ((v29 & 1) == 0) {
      class_addMethod((Class)v27, sel_colorSpace, (IMP)iiGetter, "@@:");
    }
    char v30 = [v27 instancesRespondToSelector:sel_setColorSpace_];
    char v31 = (void (*)(void))iiSetter;
    if ((v30 & 1) == 0) {
LABEL_32:
    }
      class_addMethod((Class)v27, sel_setColorSpace_, v31, "v@:@");
  }
  else
  {
    if ((v29 & 1) == 0) {
      class_addMethod((Class)v27, sel_colorSpace, (IMP)objGetter, "@@:");
    }
    char v38 = [v27 instancesRespondToSelector:sel_setColorSpace_];
    char v31 = (void (*)(void))objSetter;
    if ((v38 & 1) == 0) {
      goto LABEL_32;
    }
  }
LABEL_33:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v33 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v33, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)colorCubeWithColorSpaceFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorCubeWithColorSpace"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__colorCubeWithColorSpaceFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorCubeWithColorSpaceFilter_onceToken != -1) {
    dispatch_once(&colorCubeWithColorSpaceFilter_onceToken, block);
  }
  return v2;
}

objc_class *__51__CIFilter_Builtins__colorCubeWithColorSpaceFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v22 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v22 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_cubeDimension, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setCubeDimension_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v8 = objc_opt_class();
  if (v8)
  {
    char v9 = (void *)v8;
    BOOL v10 = [NSStringFromSelector(sel_cubeData) isEqualToString:@"inputImage"];
    char v11 = [v9 instancesRespondToSelector:sel_cubeData];
    if (v10)
    {
      if ((v11 & 1) == 0) {
        class_addMethod((Class)v9, sel_cubeData, (IMP)iiGetter, "@@:");
      }
      char v12 = [v9 instancesRespondToSelector:sel_setCubeData_];
      char v13 = (void (*)(void))iiSetter;
      if ((v12 & 1) == 0) {
LABEL_14:
      }
        class_addMethod((Class)v9, sel_setCubeData_, v13, "v@:@");
    }
    else
    {
      if ((v11 & 1) == 0) {
        class_addMethod((Class)v9, sel_cubeData, (IMP)objGetter, "@@:");
      }
      char v23 = [v9 instancesRespondToSelector:sel_setCubeData_];
      char v13 = (void (*)(void))objSetter;
      if ((v23 & 1) == 0) {
        goto LABEL_14;
      }
    }
  }
  uint64_t v14 = objc_opt_class();
  if (!v14) {
    goto LABEL_21;
  }
  char v15 = (void *)v14;
  BOOL v16 = [NSStringFromSelector(sel_colorSpace) isEqualToString:@"inputImage"];
  char v17 = [v15 instancesRespondToSelector:sel_colorSpace];
  if (v16)
  {
    if ((v17 & 1) == 0) {
      class_addMethod((Class)v15, sel_colorSpace, (IMP)iiGetter, "@@:");
    }
    char v18 = [v15 instancesRespondToSelector:sel_setColorSpace_];
    char v19 = (void (*)(void))iiSetter;
    if ((v18 & 1) == 0) {
LABEL_20:
    }
      class_addMethod((Class)v15, sel_setColorSpace_, v19, "v@:@");
  }
  else
  {
    if ((v17 & 1) == 0) {
      class_addMethod((Class)v15, sel_colorSpace, (IMP)objGetter, "@@:");
    }
    char v24 = [v15 instancesRespondToSelector:sel_setColorSpace_];
    char v19 = (void (*)(void))objSetter;
    if ((v24 & 1) == 0) {
      goto LABEL_20;
    }
  }
LABEL_21:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v21 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v21, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)colorCurvesFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorCurves"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__colorCurvesFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorCurvesFilter_onceToken != -1) {
    dispatch_once(&colorCurvesFilter_onceToken, block);
  }
  return v2;
}

uint64_t __39__CIFilter_Builtins__colorCurvesFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v23 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v23 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_curvesData) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_curvesData];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_curvesData, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setCurvesData_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setCurvesData_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_curvesData, (IMP)objGetter, "@@:");
    }
    char v24 = [v7 instancesRespondToSelector:sel_setCurvesData_];
    char v11 = (void (*)(void))objSetter;
    if ((v24 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_curvesDomain) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_curvesDomain];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_curvesDomain, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setCurvesDomain_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setCurvesDomain_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_curvesDomain, (IMP)objGetter, "@@:");
    }
    char v25 = [v13 instancesRespondToSelector:sel_setCurvesDomain_];
    char v17 = (void (*)(void))objSetter;
    if ((v25 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v19 = (void *)result;
  BOOL v20 = [NSStringFromSelector(sel_colorSpace) isEqualToString:@"inputImage"];
  char v21 = [v19 instancesRespondToSelector:sel_colorSpace];
  if (v20)
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_colorSpace, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v19 instancesRespondToSelector:sel_setColorSpace_];
    char v22 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_24:
      return class_addMethod((Class)v19, sel_setColorSpace_, v22, "v@:@");
    }
  }
  else
  {
    if ((v21 & 1) == 0) {
      class_addMethod((Class)v19, sel_colorSpace, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v19 instancesRespondToSelector:sel_setColorSpace_];
    char v22 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_24;
    }
  }
  return result;
}

+ (CIFilter)colorInvertFilter
{
  return +[CIFilter filterWithName:@"CIColorInvert"];
}

+ (CIFilter)colorMapFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorMap"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__colorMapFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorMapFilter_onceToken != -1) {
    dispatch_once(&colorMapFilter_onceToken, block);
  }
  return v2;
}

uint64_t __36__CIFilter_Builtins__colorMapFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_gradientImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_gradientImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_gradientImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setGradientImage_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setGradientImage_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_gradientImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setGradientImage_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)colorMonochromeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorMonochrome"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__colorMonochromeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorMonochromeFilter_onceToken != -1) {
    dispatch_once(&colorMonochromeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__colorMonochromeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_color];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_color, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setColor_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setColor_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_color, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setColor_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)colorPosterizeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColorPosterize"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__colorPosterizeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (colorPosterizeFilter_onceToken != -1) {
    dispatch_once(&colorPosterizeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__colorPosterizeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_levels, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setLevels_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convertLabToRGBFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvertLabToRGB"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__convertLabToRGBFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convertLabToRGBFilter_onceToken != -1) {
    dispatch_once(&convertLabToRGBFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__convertLabToRGBFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_normalize, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setNormalize_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)convertRGBtoLabFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvertRGBtoLab"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__convertRGBtoLabFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convertRGBtoLabFilter_onceToken != -1) {
    dispatch_once(&convertRGBtoLabFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__convertRGBtoLabFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_normalize, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setNormalize_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)ditherFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDither"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__ditherFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (ditherFilter_onceToken != -1) {
    dispatch_once(&ditherFilter_onceToken, block);
  }
  return v2;
}

objc_class *__34__CIFilter_Builtins__ditherFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)documentEnhancerFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDocumentEnhancer"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__documentEnhancerFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (documentEnhancerFilter_onceToken != -1) {
    dispatch_once(&documentEnhancerFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__documentEnhancerFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_amount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)falseColorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIFalseColor"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__falseColorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (falseColorFilter_onceToken != -1) {
    dispatch_once(&falseColorFilter_onceToken, block);
  }
  return v2;
}

uint64_t __38__CIFilter_Builtins__falseColorFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v17 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v17 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_color0) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_color0];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_color0, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setColor0_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setColor0_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_color0, (IMP)objGetter, "@@:");
    }
    char v18 = [v7 instancesRespondToSelector:sel_setColor0_];
    char v11 = (void (*)(void))objSetter;
    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v13 = (void *)result;
  BOOL v14 = [NSStringFromSelector(sel_color1) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_color1];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_color1, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setColor1_];
    char v16 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_18:
      return class_addMethod((Class)v13, sel_setColor1_, v16, "v@:@");
    }
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_color1, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setColor1_];
    char v16 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_18;
    }
  }
  return result;
}

+ (CIFilter)LabDeltaE
{
  BOOL v2 = +[CIFilter filterWithName:@"CILabDeltaE"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CIFilter_Builtins__LabDeltaE__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (LabDeltaE_onceToken != -1) {
    dispatch_once(&LabDeltaE_onceToken, block);
  }
  return v2;
}

uint64_t __31__CIFilter_Builtins__LabDeltaE__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_image2) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_image2];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_image2, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setImage2_];
    char v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setImage2_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_image2, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setImage2_];
    char v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)maskToAlphaFilter
{
  return +[CIFilter filterWithName:@"CIMaskToAlpha"];
}

+ (CIFilter)maximumComponentFilter
{
  return +[CIFilter filterWithName:@"CIMaximumComponent"];
}

+ (CIFilter)minimumComponentFilter
{
  return +[CIFilter filterWithName:@"CIMinimumComponent"];
}

+ (CIFilter)paletteCentroidFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPaletteCentroid"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__paletteCentroidFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (paletteCentroidFilter_onceToken != -1) {
    dispatch_once(&paletteCentroidFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__paletteCentroidFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_paletteImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_paletteImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_paletteImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setPaletteImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setPaletteImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_paletteImage, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setPaletteImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_perceptual, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v13, sel_setPerceptual_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)palettizeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPalettize"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__palettizeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (palettizeFilter_onceToken != -1) {
    dispatch_once(&palettizeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__37__CIFilter_Builtins__palettizeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_paletteImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_paletteImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_paletteImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setPaletteImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setPaletteImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_paletteImage, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setPaletteImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_perceptual, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v13, sel_setPerceptual_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectChromeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPhotoEffectChrome"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__photoEffectChromeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (photoEffectChromeFilter_onceToken != -1) {
    dispatch_once(&photoEffectChromeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__photoEffectChromeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectFadeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPhotoEffectFade"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__photoEffectFadeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (photoEffectFadeFilter_onceToken != -1) {
    dispatch_once(&photoEffectFadeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__photoEffectFadeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectInstantFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPhotoEffectInstant"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__photoEffectInstantFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (photoEffectInstantFilter_onceToken != -1) {
    dispatch_once(&photoEffectInstantFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__photoEffectInstantFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectMonoFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPhotoEffectMono"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__photoEffectMonoFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (photoEffectMonoFilter_onceToken != -1) {
    dispatch_once(&photoEffectMonoFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__photoEffectMonoFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectNoirFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPhotoEffectNoir"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__photoEffectNoirFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (photoEffectNoirFilter_onceToken != -1) {
    dispatch_once(&photoEffectNoirFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__photoEffectNoirFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectProcessFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPhotoEffectProcess"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__photoEffectProcessFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (photoEffectProcessFilter_onceToken != -1) {
    dispatch_once(&photoEffectProcessFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__photoEffectProcessFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectTonalFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPhotoEffectTonal"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__photoEffectTonalFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (photoEffectTonalFilter_onceToken != -1) {
    dispatch_once(&photoEffectTonalFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__photoEffectTonalFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)photoEffectTransferFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPhotoEffectTransfer"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__photoEffectTransferFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (photoEffectTransferFilter_onceToken != -1) {
    dispatch_once(&photoEffectTransferFilter_onceToken, block);
  }
  return v2;
}

objc_class *__47__CIFilter_Builtins__photoEffectTransferFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extrapolate, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v7, sel_setExtrapolate_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)sepiaToneFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISepiaTone"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__sepiaToneFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (sepiaToneFilter_onceToken != -1) {
    dispatch_once(&sepiaToneFilter_onceToken, block);
  }
  return v2;
}

objc_class *__37__CIFilter_Builtins__sepiaToneFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)thermalFilter
{
  return +[CIFilter filterWithName:@"CIThermal"];
}

+ (CIFilter)vignetteFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIVignette"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__vignetteFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (vignetteFilter_onceToken != -1) {
    dispatch_once(&vignetteFilter_onceToken, block);
  }
  return v2;
}

objc_class *__36__CIFilter_Builtins__vignetteFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_intensity, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)vignetteEffectFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIVignetteEffect"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__vignetteEffectFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (vignetteEffectFilter_onceToken != -1) {
    dispatch_once(&vignetteEffectFilter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__vignetteEffectFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_intensity, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_falloff, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setFalloff_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)xRayFilter
{
  return +[CIFilter filterWithName:@"CIXRay"];
}

+ (CIFilter)bumpDistortionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBumpDistortion"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__bumpDistortionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (bumpDistortionFilter_onceToken != -1) {
    dispatch_once(&bumpDistortionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__bumpDistortionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)bumpDistortionLinearFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBumpDistortionLinear"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__bumpDistortionLinearFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (bumpDistortionLinearFilter_onceToken != -1) {
    dispatch_once(&bumpDistortionLinearFilter_onceToken, block);
  }
  return v2;
}

objc_class *__48__CIFilter_Builtins__bumpDistortionLinearFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)circleSplashDistortionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CICircleSplashDistortion"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__circleSplashDistortionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (circleSplashDistortionFilter_onceToken != -1) {
    dispatch_once(&circleSplashDistortionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__50__CIFilter_Builtins__circleSplashDistortionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)circularWrapFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CICircularWrap"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__circularWrapFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (circularWrapFilter_onceToken != -1) {
    dispatch_once(&circularWrapFilter_onceToken, block);
  }
  return v2;
}

objc_class *__40__CIFilter_Builtins__circularWrapFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)displacementDistortionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDisplacementDistortion"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__displacementDistortionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (displacementDistortionFilter_onceToken != -1) {
    dispatch_once(&displacementDistortionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__50__CIFilter_Builtins__displacementDistortionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_displacementImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_displacementImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_displacementImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setDisplacementImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setDisplacementImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_displacementImage, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setDisplacementImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)drosteFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDroste"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__drosteFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (drosteFilter_onceToken != -1) {
    dispatch_once(&drosteFilter_onceToken, block);
  }
  return v2;
}

objc_class *__34__CIFilter_Builtins__drosteFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v18 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v18 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_insetPoint0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setInsetPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_insetPoint1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setInsetPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_strands, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setStrands_, (IMP)floatSetter, "v@:f");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_periodicity, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setPeriodicity_, (IMP)floatSetter, "v@:f");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_rotation, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setRotation_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v17 = result;
    class_addMethod(result, sel_zoom, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v17, sel_setZoom_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)glassDistortionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIGlassDistortion"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__glassDistortionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (glassDistortionFilter_onceToken != -1) {
    dispatch_once(&glassDistortionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__glassDistortionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_textureImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_textureImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_textureImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setTextureImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setTextureImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_textureImage, (IMP)objGetter, "@@:");
    }
    char v17 = [v7 instancesRespondToSelector:sel_setTextureImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v17 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v13, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v15, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)glassLozengeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIGlassLozenge"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__glassLozengeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (glassLozengeFilter_onceToken != -1) {
    dispatch_once(&glassLozengeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__40__CIFilter_Builtins__glassLozengeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_refraction, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setRefraction_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)holeDistortionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIHoleDistortion"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__holeDistortionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (holeDistortionFilter_onceToken != -1) {
    dispatch_once(&holeDistortionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__holeDistortionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)lightTunnelFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILightTunnel"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__lightTunnelFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (lightTunnelFilter_onceToken != -1) {
    dispatch_once(&lightTunnelFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__lightTunnelFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_rotation, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRotation_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)ninePartStretchedFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CINinePartStretched"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__ninePartStretchedFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (ninePartStretchedFilter_onceToken != -1) {
    dispatch_once(&ninePartStretchedFilter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__ninePartStretchedFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_breakpoint0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setBreakpoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_breakpoint1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setBreakpoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_growAmount, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v11, sel_setGrowAmount_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)ninePartTiledFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CINinePartTiled"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__ninePartTiledFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (ninePartTiledFilter_onceToken != -1) {
    dispatch_once(&ninePartTiledFilter_onceToken, block);
  }
  return v2;
}

objc_class *__41__CIFilter_Builtins__ninePartTiledFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_breakpoint0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setBreakpoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_breakpoint1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setBreakpoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_growAmount, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setGrowAmount_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_flipYTiles, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v13, sel_setFlipYTiles_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)pinchDistortionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPinchDistortion"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__pinchDistortionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (pinchDistortionFilter_onceToken != -1) {
    dispatch_once(&pinchDistortionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__pinchDistortionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)stretchCropFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIStretchCrop"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__stretchCropFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (stretchCropFilter_onceToken != -1) {
    dispatch_once(&stretchCropFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__stretchCropFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_size, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setSize_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_cropAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setCropAmount_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_centerStretchAmount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setCenterStretchAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)torusLensDistortionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CITorusLensDistortion"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__torusLensDistortionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (torusLensDistortionFilter_onceToken != -1) {
    dispatch_once(&torusLensDistortionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__47__CIFilter_Builtins__torusLensDistortionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_refraction, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setRefraction_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)twirlDistortionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CITwirlDistortion"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__twirlDistortionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (twirlDistortionFilter_onceToken != -1) {
    dispatch_once(&twirlDistortionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__twirlDistortionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)vortexDistortionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIVortexDistortion"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__vortexDistortionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (vortexDistortionFilter_onceToken != -1) {
    dispatch_once(&vortexDistortionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__vortexDistortionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)affineClampFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAffineClamp"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__affineClampFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (affineClampFilter_onceToken != -1) {
    dispatch_once(&affineClampFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__affineClampFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_transform, (IMP)transformGetter, "{CGAffineTransform=dddddd}@:");
    return (objc_class *)class_addMethod(v7, sel_setTransform_, (IMP)transformSetter, "v@:{CGAffineTransform=dddddd}");
  }
  return result;
}

+ (CIFilter)affineTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAffineTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__affineTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (affineTileFilter_onceToken != -1) {
    dispatch_once(&affineTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__38__CIFilter_Builtins__affineTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_transform, (IMP)transformGetter, "{CGAffineTransform=dddddd}@:");
    return (objc_class *)class_addMethod(v7, sel_setTransform_, (IMP)transformSetter, "v@:{CGAffineTransform=dddddd}");
  }
  return result;
}

+ (CIFilter)eightfoldReflectedTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIEightfoldReflectedTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__eightfoldReflectedTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (eightfoldReflectedTileFilter_onceToken != -1) {
    dispatch_once(&eightfoldReflectedTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__50__CIFilter_Builtins__eightfoldReflectedTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)fourfoldReflectedTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIFourfoldReflectedTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__fourfoldReflectedTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (fourfoldReflectedTileFilter_onceToken != -1) {
    dispatch_once(&fourfoldReflectedTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__49__CIFilter_Builtins__fourfoldReflectedTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_acuteAngle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setAcuteAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)fourfoldRotatedTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIFourfoldRotatedTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__fourfoldRotatedTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (fourfoldRotatedTileFilter_onceToken != -1) {
    dispatch_once(&fourfoldRotatedTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__47__CIFilter_Builtins__fourfoldRotatedTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)fourfoldTranslatedTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIFourfoldTranslatedTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__fourfoldTranslatedTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (fourfoldTranslatedTileFilter_onceToken != -1) {
    dispatch_once(&fourfoldTranslatedTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__50__CIFilter_Builtins__fourfoldTranslatedTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_acuteAngle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setAcuteAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)glideReflectedTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIGlideReflectedTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__glideReflectedTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (glideReflectedTileFilter_onceToken != -1) {
    dispatch_once(&glideReflectedTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__glideReflectedTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)kaleidoscopeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIKaleidoscope"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__kaleidoscopeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (kaleidoscopeFilter_onceToken != -1) {
    dispatch_once(&kaleidoscopeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__40__CIFilter_Builtins__kaleidoscopeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_count, (IMP)intGetter, "q@:");
    class_addMethod(v7, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)opTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIOpTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__opTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (opTileFilter_onceToken != -1) {
    dispatch_once(&opTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__34__CIFilter_Builtins__opTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)parallelogramTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIParallelogramTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__parallelogramTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (parallelogramTileFilter_onceToken != -1) {
    dispatch_once(&parallelogramTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__parallelogramTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_acuteAngle, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setAcuteAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)perspectiveTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPerspectiveTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CIFilter_Builtins__perspectiveTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (perspectiveTileFilter_onceToken != -1) {
    dispatch_once(&perspectiveTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__43__CIFilter_Builtins__perspectiveTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_topLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setTopLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_topRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setTopRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_bottomRight, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v11, sel_setBottomRight_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bottomLeft, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v13, sel_setBottomLeft_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)sixfoldReflectedTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISixfoldReflectedTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__sixfoldReflectedTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (sixfoldReflectedTileFilter_onceToken != -1) {
    dispatch_once(&sixfoldReflectedTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__48__CIFilter_Builtins__sixfoldReflectedTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)sixfoldRotatedTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISixfoldRotatedTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__sixfoldRotatedTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (sixfoldRotatedTileFilter_onceToken != -1) {
    dispatch_once(&sixfoldRotatedTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__sixfoldRotatedTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)triangleKaleidoscopeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CITriangleKaleidoscope"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__triangleKaleidoscopeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (triangleKaleidoscopeFilter_onceToken != -1) {
    dispatch_once(&triangleKaleidoscopeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__48__CIFilter_Builtins__triangleKaleidoscopeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_point, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setPoint_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_size, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setSize_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_rotation, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setRotation_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_decay, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setDecay_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)triangleTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CITriangleTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__triangleTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (triangleTileFilter_onceToken != -1) {
    dispatch_once(&triangleTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__40__CIFilter_Builtins__triangleTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)twelvefoldReflectedTileFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CITwelvefoldReflectedTile"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__twelvefoldReflectedTileFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (twelvefoldReflectedTileFilter_onceToken != -1) {
    dispatch_once(&twelvefoldReflectedTileFilter_onceToken, block);
  }
  return v2;
}

objc_class *__51__CIFilter_Builtins__twelvefoldReflectedTileFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_angle, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_width, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)attributedTextImageGeneratorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAttributedTextImageGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CIFilter_Builtins__attributedTextImageGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (attributedTextImageGeneratorFilter_onceToken != -1) {
    dispatch_once(&attributedTextImageGeneratorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__56__CIFilter_Builtins__attributedTextImageGeneratorFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_text) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_text];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_text, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setText_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setText_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_text, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setText_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_scaleFactor, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setScaleFactor_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_padding, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setPadding_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)aztecCodeGeneratorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAztecCodeGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__aztecCodeGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (aztecCodeGeneratorFilter_onceToken != -1) {
    dispatch_once(&aztecCodeGeneratorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__aztecCodeGeneratorFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_message) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_message];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_message, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setMessage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setMessage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_message, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setMessage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_correctionLevel, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setCorrectionLevel_, (IMP)floatSetter, "v@:f");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_layers, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setLayers_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_compactStyle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setCompactStyle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)barcodeGeneratorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBarcodeGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__barcodeGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (barcodeGeneratorFilter_onceToken != -1) {
    dispatch_once(&barcodeGeneratorFilter_onceToken, block);
  }
  return v2;
}

uint64_t __44__CIFilter_Builtins__barcodeGeneratorFilter__block_invoke()
{
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  int v1 = (void *)result;
  BOOL v2 = [NSStringFromSelector(sel_barcodeDescriptor) isEqualToString:@"inputImage"];
  char v3 = [v1 instancesRespondToSelector:sel_barcodeDescriptor];
  if (v2)
  {
    if ((v3 & 1) == 0) {
      class_addMethod((Class)v1, sel_barcodeDescriptor, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v1 instancesRespondToSelector:sel_setBarcodeDescriptor_];
    char v4 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_6:
      return class_addMethod((Class)v1, sel_setBarcodeDescriptor_, v4, "v@:@");
    }
  }
  else
  {
    if ((v3 & 1) == 0) {
      class_addMethod((Class)v1, sel_barcodeDescriptor, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v1 instancesRespondToSelector:sel_setBarcodeDescriptor_];
    char v4 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_6;
    }
  }
  return result;
}

+ (CIFilter)blurredRectangleGeneratorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBlurredRectangleGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CIFilter_Builtins__blurredRectangleGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (blurredRectangleGeneratorFilter_onceToken != -1) {
    dispatch_once(&blurredRectangleGeneratorFilter_onceToken, block);
  }
  return v2;
}

uint64_t __53__CIFilter_Builtins__blurredRectangleGeneratorFilter__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v1, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  BOOL v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    char v3 = v2;
    class_addMethod(v2, sel_sigma, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setSigma_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = objc_opt_class();
  if (result)
  {
    char v5 = (void *)result;
    BOOL v6 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v7 = [v5 instancesRespondToSelector:sel_color];
    if (v6)
    {
      if ((v7 & 1) == 0) {
        class_addMethod((Class)v5, sel_color, (IMP)iiGetter, "@@:");
      }
      uint64_t result = [v5 instancesRespondToSelector:sel_setColor_];
      char v8 = (void (*)(void))iiSetter;
      if ((result & 1) == 0)
      {
LABEL_10:
        return class_addMethod((Class)v5, sel_setColor_, v8, "v@:@");
      }
    }
    else
    {
      if ((v7 & 1) == 0) {
        class_addMethod((Class)v5, sel_color, (IMP)objGetter, "@@:");
      }
      uint64_t result = [v5 instancesRespondToSelector:sel_setColor_];
      char v8 = (void (*)(void))objSetter;
      if ((result & 1) == 0) {
        goto LABEL_10;
      }
    }
  }
  return result;
}

+ (CIFilter)checkerboardGeneratorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CICheckerboardGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__checkerboardGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (checkerboardGeneratorFilter_onceToken != -1) {
    dispatch_once(&checkerboardGeneratorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__49__CIFilter_Builtins__checkerboardGeneratorFilter__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    char v3 = (void *)v2;
    BOOL v4 = [NSStringFromSelector(sel_color0) isEqualToString:@"inputImage"];
    char v5 = [v3 instancesRespondToSelector:sel_color0];
    if (v4)
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color0, (IMP)iiGetter, "@@:");
      }
      char v6 = [v3 instancesRespondToSelector:sel_setColor0_];
      char v7 = (void (*)(void))iiSetter;
      if ((v6 & 1) == 0) {
LABEL_8:
      }
        class_addMethod((Class)v3, sel_setColor0_, v7, "v@:@");
    }
    else
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color0, (IMP)objGetter, "@@:");
      }
      char v18 = [v3 instancesRespondToSelector:sel_setColor0_];
      char v7 = (void (*)(void))objSetter;
      if ((v18 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v8 = objc_opt_class();
  if (!v8) {
    goto LABEL_15;
  }
  char v9 = (void *)v8;
  BOOL v10 = [NSStringFromSelector(sel_color1) isEqualToString:@"inputImage"];
  char v11 = [v9 instancesRespondToSelector:sel_color1];
  if (v10)
  {
    if ((v11 & 1) == 0) {
      class_addMethod((Class)v9, sel_color1, (IMP)iiGetter, "@@:");
    }
    char v12 = [v9 instancesRespondToSelector:sel_setColor1_];
    char v13 = (void (*)(void))iiSetter;
    if ((v12 & 1) == 0) {
LABEL_14:
    }
      class_addMethod((Class)v9, sel_setColor1_, v13, "v@:@");
  }
  else
  {
    if ((v11 & 1) == 0) {
      class_addMethod((Class)v9, sel_color1, (IMP)objGetter, "@@:");
    }
    char v19 = [v9 instancesRespondToSelector:sel_setColor1_];
    char v13 = (void (*)(void))objSetter;
    if ((v19 & 1) == 0) {
      goto LABEL_14;
    }
  }
LABEL_15:
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v17 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v17, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)code128BarcodeGeneratorFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CICode128BarcodeGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__code128BarcodeGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (code128BarcodeGeneratorFilter_onceToken != -1) {
    dispatch_once(&code128BarcodeGeneratorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__51__CIFilter_Builtins__code128BarcodeGeneratorFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_message) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_message];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_message, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setMessage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setMessage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_message, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setMessage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  char v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_quietSpace, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setQuietSpace_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_barcodeHeight, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setBarcodeHeight_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)lenticularHaloGeneratorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILenticularHaloGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__lenticularHaloGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (lenticularHaloGeneratorFilter_onceToken != -1) {
    dispatch_once(&lenticularHaloGeneratorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__51__CIFilter_Builtins__lenticularHaloGeneratorFilter__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    char v3 = (void *)v2;
    BOOL v4 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v5 = [v3 instancesRespondToSelector:sel_color];
    if (v4)
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color, (IMP)iiGetter, "@@:");
      }
      char v6 = [v3 instancesRespondToSelector:sel_setColor_];
      char v7 = (void (*)(void))iiSetter;
      if ((v6 & 1) == 0) {
LABEL_8:
      }
        class_addMethod((Class)v3, sel_setColor_, v7, "v@:@");
    }
    else
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color, (IMP)objGetter, "@@:");
      }
      char v20 = [v3 instancesRespondToSelector:sel_setColor_];
      char v7 = (void (*)(void))objSetter;
      if ((v20 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_haloRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setHaloRadius_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_haloWidth, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setHaloWidth_, (IMP)floatSetter, "v@:f");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_haloOverlap, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setHaloOverlap_, (IMP)floatSetter, "v@:f");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_striationStrength, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setStriationStrength_, (IMP)floatSetter, "v@:f");
  }
  char v16 = (objc_class *)objc_opt_class();
  if (v16)
  {
    char v17 = v16;
    class_addMethod(v16, sel_striationContrast, (IMP)floatGetter, "f@:");
    class_addMethod(v17, sel_setStriationContrast_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v19 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v19, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)meshGeneratorFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CIMeshGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__meshGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (meshGeneratorFilter_onceToken != -1) {
    dispatch_once(&meshGeneratorFilter_onceToken, block);
  }
  return v2;
}

uint64_t __41__CIFilter_Builtins__meshGeneratorFilter__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v1, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    char v3 = (void *)v2;
    BOOL v4 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v5 = [v3 instancesRespondToSelector:sel_color];
    if (v4)
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color, (IMP)iiGetter, "@@:");
      }
      char v6 = [v3 instancesRespondToSelector:sel_setColor_];
      char v7 = (void (*)(void))iiSetter;
      if ((v6 & 1) == 0) {
LABEL_8:
      }
        class_addMethod((Class)v3, sel_setColor_, v7, "v@:@");
    }
    else
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color, (IMP)objGetter, "@@:");
      }
      char v13 = [v3 instancesRespondToSelector:sel_setColor_];
      char v7 = (void (*)(void))objSetter;
      if ((v13 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v9 = (void *)result;
  BOOL v10 = [NSStringFromSelector(sel_mesh) isEqualToString:@"inputImage"];
  char v11 = [v9 instancesRespondToSelector:sel_mesh];
  if (v10)
  {
    if ((v11 & 1) == 0) {
      class_addMethod((Class)v9, sel_mesh, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v9 instancesRespondToSelector:sel_setMesh_];
    char v12 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_14:
      return class_addMethod((Class)v9, sel_setMesh_, v12, "v@:@");
    }
  }
  else
  {
    if ((v11 & 1) == 0) {
      class_addMethod((Class)v9, sel_mesh, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v9 instancesRespondToSelector:sel_setMesh_];
    char v12 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_14;
    }
  }
  return result;
}

+ (CIFilter)PDF417BarcodeGenerator
{
  uint64_t v2 = +[CIFilter filterWithName:@"CIPDF417BarcodeGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__PDF417BarcodeGenerator__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (PDF417BarcodeGenerator_onceToken != -1) {
    dispatch_once(&PDF417BarcodeGenerator_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__PDF417BarcodeGenerator__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_message) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_message];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_message, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setMessage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setMessage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_message, (IMP)objGetter, "@@:");
      }
      char v28 = [v1 instancesRespondToSelector:sel_setMessage_];
      char v5 = (void (*)(void))objSetter;
      if ((v28 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  char v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_minWidth, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setMinWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_maxWidth, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setMaxWidth_, (IMP)floatSetter, "v@:f");
  }
  BOOL v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_minHeight, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setMinHeight_, (IMP)floatSetter, "v@:f");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_maxHeight, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setMaxHeight_, (IMP)floatSetter, "v@:f");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_dataColumns, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setDataColumns_, (IMP)floatSetter, "v@:f");
  }
  char v16 = (objc_class *)objc_opt_class();
  if (v16)
  {
    char v17 = v16;
    class_addMethod(v16, sel_rows, (IMP)floatGetter, "f@:");
    class_addMethod(v17, sel_setRows_, (IMP)floatSetter, "v@:f");
  }
  char v18 = (objc_class *)objc_opt_class();
  if (v18)
  {
    char v19 = v18;
    class_addMethod(v18, sel_preferredAspectRatio, (IMP)floatGetter, "f@:");
    class_addMethod(v19, sel_setPreferredAspectRatio_, (IMP)floatSetter, "v@:f");
  }
  char v20 = (objc_class *)objc_opt_class();
  if (v20)
  {
    char v21 = v20;
    class_addMethod(v20, sel_compactionMode, (IMP)floatGetter, "f@:");
    class_addMethod(v21, sel_setCompactionMode_, (IMP)floatSetter, "v@:f");
  }
  char v22 = (objc_class *)objc_opt_class();
  if (v22)
  {
    char v23 = v22;
    class_addMethod(v22, sel_compactStyle, (IMP)floatGetter, "f@:");
    class_addMethod(v23, sel_setCompactStyle_, (IMP)floatSetter, "v@:f");
  }
  char v24 = (objc_class *)objc_opt_class();
  if (v24)
  {
    char v25 = v24;
    class_addMethod(v24, sel_correctionLevel, (IMP)floatGetter, "f@:");
    class_addMethod(v25, sel_setCorrectionLevel_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v27 = result;
    class_addMethod(result, sel_alwaysSpecifyCompaction, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v27, sel_setAlwaysSpecifyCompaction_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)QRCodeGenerator
{
  BOOL v2 = +[CIFilter filterWithName:@"CIQRCodeGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__QRCodeGenerator__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (QRCodeGenerator_onceToken != -1) {
    dispatch_once(&QRCodeGenerator_onceToken, block);
  }
  return v2;
}

uint64_t __37__CIFilter_Builtins__QRCodeGenerator__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_message) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_message];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_message, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setMessage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setMessage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_message, (IMP)objGetter, "@@:");
      }
      char v11 = [v1 instancesRespondToSelector:sel_setMessage_];
      char v5 = (void (*)(void))objSetter;
      if ((v11 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v7 = (void *)result;
  BOOL v8 = [NSStringFromSelector(sel_correctionLevel) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_correctionLevel];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_correctionLevel, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setCorrectionLevel_];
    BOOL v10 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_12:
      return class_addMethod((Class)v7, sel_setCorrectionLevel_, v10, "v@:@");
    }
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_correctionLevel, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v7 instancesRespondToSelector:sel_setCorrectionLevel_];
    BOOL v10 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_12;
    }
  }
  return result;
}

+ (CIFilter)randomGeneratorFilter
{
  return +[CIFilter filterWithName:@"CIRandomGenerator"];
}

+ (CIFilter)roundedRectangleGeneratorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIRoundedRectangleGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CIFilter_Builtins__roundedRectangleGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (roundedRectangleGeneratorFilter_onceToken != -1) {
    dispatch_once(&roundedRectangleGeneratorFilter_onceToken, block);
  }
  return v2;
}

uint64_t __53__CIFilter_Builtins__roundedRectangleGeneratorFilter__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v1, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  BOOL v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    char v3 = v2;
    class_addMethod(v2, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = objc_opt_class();
  if (result)
  {
    char v5 = (void *)result;
    BOOL v6 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v7 = [v5 instancesRespondToSelector:sel_color];
    if (v6)
    {
      if ((v7 & 1) == 0) {
        class_addMethod((Class)v5, sel_color, (IMP)iiGetter, "@@:");
      }
      uint64_t result = [v5 instancesRespondToSelector:sel_setColor_];
      BOOL v8 = (void (*)(void))iiSetter;
      if ((result & 1) == 0)
      {
LABEL_10:
        return class_addMethod((Class)v5, sel_setColor_, v8, "v@:@");
      }
    }
    else
    {
      if ((v7 & 1) == 0) {
        class_addMethod((Class)v5, sel_color, (IMP)objGetter, "@@:");
      }
      uint64_t result = [v5 instancesRespondToSelector:sel_setColor_];
      BOOL v8 = (void (*)(void))objSetter;
      if ((result & 1) == 0) {
        goto LABEL_10;
      }
    }
  }
  return result;
}

+ (CIFilter)roundedRectangleStrokeGeneratorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIRoundedRectangleStrokeGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CIFilter_Builtins__roundedRectangleStrokeGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (roundedRectangleStrokeGeneratorFilter_onceToken != -1) {
    dispatch_once(&roundedRectangleStrokeGeneratorFilter_onceToken, block);
  }
  return v2;
}

uint64_t __59__CIFilter_Builtins__roundedRectangleStrokeGeneratorFilter__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v1, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  BOOL v2 = (objc_class *)objc_opt_class();
  if (v2)
  {
    char v3 = v2;
    class_addMethod(v2, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v3, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  char v4 = (objc_class *)objc_opt_class();
  if (v4)
  {
    char v5 = v4;
    class_addMethod(v4, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v5, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = objc_opt_class();
  if (result)
  {
    char v7 = (void *)result;
    BOOL v8 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v9 = [v7 instancesRespondToSelector:sel_color];
    if (v8)
    {
      if ((v9 & 1) == 0) {
        class_addMethod((Class)v7, sel_color, (IMP)iiGetter, "@@:");
      }
      uint64_t result = [v7 instancesRespondToSelector:sel_setColor_];
      BOOL v10 = (void (*)(void))iiSetter;
      if ((result & 1) == 0)
      {
LABEL_12:
        return class_addMethod((Class)v7, sel_setColor_, v10, "v@:@");
      }
    }
    else
    {
      if ((v9 & 1) == 0) {
        class_addMethod((Class)v7, sel_color, (IMP)objGetter, "@@:");
      }
      uint64_t result = [v7 instancesRespondToSelector:sel_setColor_];
      BOOL v10 = (void (*)(void))objSetter;
      if ((result & 1) == 0) {
        goto LABEL_12;
      }
    }
  }
  return result;
}

+ (CIFilter)starShineGeneratorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIStarShineGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__starShineGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (starShineGeneratorFilter_onceToken != -1) {
    dispatch_once(&starShineGeneratorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__starShineGeneratorFilter__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    char v3 = (void *)v2;
    BOOL v4 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v5 = [v3 instancesRespondToSelector:sel_color];
    if (v4)
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color, (IMP)iiGetter, "@@:");
      }
      char v6 = [v3 instancesRespondToSelector:sel_setColor_];
      char v7 = (void (*)(void))iiSetter;
      if ((v6 & 1) == 0) {
LABEL_8:
      }
        class_addMethod((Class)v3, sel_setColor_, v7, "v@:@");
    }
    else
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color, (IMP)objGetter, "@@:");
      }
      char v20 = [v3 instancesRespondToSelector:sel_setColor_];
      char v7 = (void (*)(void))objSetter;
      if ((v20 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  BOOL v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_crossScale, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setCrossScale_, (IMP)floatSetter, "v@:f");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_crossAngle, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setCrossAngle_, (IMP)floatSetter, "v@:f");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_crossOpacity, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setCrossOpacity_, (IMP)floatSetter, "v@:f");
  }
  char v16 = (objc_class *)objc_opt_class();
  if (v16)
  {
    char v17 = v16;
    class_addMethod(v16, sel_crossWidth, (IMP)floatGetter, "f@:");
    class_addMethod(v17, sel_setCrossWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v19 = result;
    class_addMethod(result, sel_epsilon, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v19, sel_setEpsilon_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)stripesGeneratorFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CIStripesGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__stripesGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (stripesGeneratorFilter_onceToken != -1) {
    dispatch_once(&stripesGeneratorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__stripesGeneratorFilter__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    char v3 = (void *)v2;
    BOOL v4 = [NSStringFromSelector(sel_color0) isEqualToString:@"inputImage"];
    char v5 = [v3 instancesRespondToSelector:sel_color0];
    if (v4)
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color0, (IMP)iiGetter, "@@:");
      }
      char v6 = [v3 instancesRespondToSelector:sel_setColor0_];
      char v7 = (void (*)(void))iiSetter;
      if ((v6 & 1) == 0) {
LABEL_8:
      }
        class_addMethod((Class)v3, sel_setColor0_, v7, "v@:@");
    }
    else
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color0, (IMP)objGetter, "@@:");
      }
      char v18 = [v3 instancesRespondToSelector:sel_setColor0_];
      char v7 = (void (*)(void))objSetter;
      if ((v18 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v8 = objc_opt_class();
  if (!v8) {
    goto LABEL_15;
  }
  char v9 = (void *)v8;
  BOOL v10 = [NSStringFromSelector(sel_color1) isEqualToString:@"inputImage"];
  char v11 = [v9 instancesRespondToSelector:sel_color1];
  if (v10)
  {
    if ((v11 & 1) == 0) {
      class_addMethod((Class)v9, sel_color1, (IMP)iiGetter, "@@:");
    }
    char v12 = [v9 instancesRespondToSelector:sel_setColor1_];
    char v13 = (void (*)(void))iiSetter;
    if ((v12 & 1) == 0) {
LABEL_14:
    }
      class_addMethod((Class)v9, sel_setColor1_, v13, "v@:@");
  }
  else
  {
    if ((v11 & 1) == 0) {
      class_addMethod((Class)v9, sel_color1, (IMP)objGetter, "@@:");
    }
    char v19 = [v9 instancesRespondToSelector:sel_setColor1_];
    char v13 = (void (*)(void))objSetter;
    if ((v19 & 1) == 0) {
      goto LABEL_14;
    }
  }
LABEL_15:
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v17 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v17, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)sunbeamsGeneratorFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CISunbeamsGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__sunbeamsGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (sunbeamsGeneratorFilter_onceToken != -1) {
    dispatch_once(&sunbeamsGeneratorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__sunbeamsGeneratorFilter__block_invoke()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  if (v0)
  {
    int v1 = v0;
    class_addMethod(v0, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v1, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    char v3 = (void *)v2;
    BOOL v4 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v5 = [v3 instancesRespondToSelector:sel_color];
    if (v4)
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color, (IMP)iiGetter, "@@:");
      }
      char v6 = [v3 instancesRespondToSelector:sel_setColor_];
      char v7 = (void (*)(void))iiSetter;
      if ((v6 & 1) == 0) {
LABEL_8:
      }
        class_addMethod((Class)v3, sel_setColor_, v7, "v@:@");
    }
    else
    {
      if ((v5 & 1) == 0) {
        class_addMethod((Class)v3, sel_color, (IMP)objGetter, "@@:");
      }
      char v18 = [v3 instancesRespondToSelector:sel_setColor_];
      char v7 = (void (*)(void))objSetter;
      if ((v18 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_sunRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setSunRadius_, (IMP)floatSetter, "v@:f");
  }
  BOOL v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_maxStriationRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setMaxStriationRadius_, (IMP)floatSetter, "v@:f");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_striationStrength, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setStriationStrength_, (IMP)floatSetter, "v@:f");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_striationContrast, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setStriationContrast_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v17 = result;
    class_addMethod(result, sel_time, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v17, sel_setTime_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)textImageGeneratorFilter
{
  uint64_t v2 = +[CIFilter filterWithName:@"CITextImageGenerator"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__textImageGeneratorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (textImageGeneratorFilter_onceToken != -1) {
    dispatch_once(&textImageGeneratorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__textImageGeneratorFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_text) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_text];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_text, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setText_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setText_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_text, (IMP)objGetter, "@@:");
      }
      char v18 = [v1 instancesRespondToSelector:sel_setText_];
      char v5 = (void (*)(void))objSetter;
      if ((v18 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_fontName) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_fontName];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_fontName, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setFontName_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setFontName_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_fontName, (IMP)objGetter, "@@:");
    }
    char v19 = [v7 instancesRespondToSelector:sel_setFontName_];
    char v11 = (void (*)(void))objSetter;
    if ((v19 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_fontSize, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setFontSize_, (IMP)floatSetter, "v@:f");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_scaleFactor, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setScaleFactor_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v17 = result;
    class_addMethod(result, sel_padding, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v17, sel_setPadding_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)blendWithAlphaMaskFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBlendWithAlphaMask"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__blendWithAlphaMaskFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (blendWithAlphaMaskFilter_onceToken != -1) {
    dispatch_once(&blendWithAlphaMaskFilter_onceToken, block);
  }
  return v2;
}

uint64_t __46__CIFilter_Builtins__blendWithAlphaMaskFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v17 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v17 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setBackgroundImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    char v18 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v13 = (void *)result;
  BOOL v14 = [NSStringFromSelector(sel_maskImage) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_maskImage];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v16 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_18:
      return class_addMethod((Class)v13, sel_setMaskImage_, v16, "v@:@");
    }
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v16 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_18;
    }
  }
  return result;
}

+ (CIFilter)blendWithBlueMaskFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBlendWithBlueMask"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__blendWithBlueMaskFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (blendWithBlueMaskFilter_onceToken != -1) {
    dispatch_once(&blendWithBlueMaskFilter_onceToken, block);
  }
  return v2;
}

uint64_t __45__CIFilter_Builtins__blendWithBlueMaskFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v17 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v17 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setBackgroundImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    char v18 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v13 = (void *)result;
  BOOL v14 = [NSStringFromSelector(sel_maskImage) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_maskImage];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v16 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_18:
      return class_addMethod((Class)v13, sel_setMaskImage_, v16, "v@:@");
    }
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v16 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_18;
    }
  }
  return result;
}

uint64_t __41__CIFilter_Builtins__blendWithMaskFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v17 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v17 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setBackgroundImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    char v18 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v13 = (void *)result;
  BOOL v14 = [NSStringFromSelector(sel_maskImage) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_maskImage];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v16 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_18:
      return class_addMethod((Class)v13, sel_setMaskImage_, v16, "v@:@");
    }
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v16 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_18;
    }
  }
  return result;
}

+ (CIFilter)blendWithRedMaskFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBlendWithRedMask"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__blendWithRedMaskFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (blendWithRedMaskFilter_onceToken != -1) {
    dispatch_once(&blendWithRedMaskFilter_onceToken, block);
  }
  return v2;
}

uint64_t __44__CIFilter_Builtins__blendWithRedMaskFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v17 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v17 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setBackgroundImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    char v18 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v18 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = objc_opt_class();
  if (!result) {
    return result;
  }
  char v13 = (void *)result;
  BOOL v14 = [NSStringFromSelector(sel_maskImage) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_maskImage];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)iiGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v16 = (void (*)(void))iiSetter;
    if ((result & 1) == 0)
    {
LABEL_18:
      return class_addMethod((Class)v13, sel_setMaskImage_, v16, "v@:@");
    }
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_maskImage, (IMP)objGetter, "@@:");
    }
    uint64_t result = [v13 instancesRespondToSelector:sel_setMaskImage_];
    char v16 = (void (*)(void))objSetter;
    if ((result & 1) == 0) {
      goto LABEL_18;
    }
  }
  return result;
}

+ (CIFilter)bloomFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBloom"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CIFilter_Builtins__bloomFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (bloomFilter_onceToken != -1) {
    dispatch_once(&bloomFilter_onceToken, block);
  }
  return v2;
}

objc_class *__33__CIFilter_Builtins__bloomFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)cannyEdgeDetectorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CICannyEdgeDetector"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__cannyEdgeDetectorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (cannyEdgeDetectorFilter_onceToken != -1) {
    dispatch_once(&cannyEdgeDetectorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__cannyEdgeDetectorFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_gaussianSigma, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setGaussianSigma_, (IMP)floatSetter, "v@:f");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_perceptual, (IMP)BOOLGetter, "B@:");
    class_addMethod(v9, sel_setPerceptual_, (IMP)BOOLSetter, "v@:B}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_thresholdHigh, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setThresholdHigh_, (IMP)floatSetter, "v@:f");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_thresholdLow, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setThresholdLow_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_hysteresisPasses, (IMP)intGetter, "q@:");
    return (objc_class *)class_addMethod(v15, sel_setHysteresisPasses_, (IMP)intSetter, "v@:q}");
  }
  return result;
}

+ (CIFilter)comicEffectFilter
{
  return +[CIFilter filterWithName:@"CIComicEffect"];
}

+ (CIFilter)convolution3X3Filter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolution3X3"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__convolution3X3Filter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolution3X3Filter_onceToken != -1) {
    dispatch_once(&convolution3X3Filter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__convolution3X3Filter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolution5X5Filter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolution5X5"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__convolution5X5Filter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolution5X5Filter_onceToken != -1) {
    dispatch_once(&convolution5X5Filter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__convolution5X5Filter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolution7X7Filter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolution7X7"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__convolution7X7Filter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolution7X7Filter_onceToken != -1) {
    dispatch_once(&convolution7X7Filter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__convolution7X7Filter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolution9HorizontalFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolution9Horizontal"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CIFilter_Builtins__convolution9HorizontalFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolution9HorizontalFilter_onceToken != -1) {
    dispatch_once(&convolution9HorizontalFilter_onceToken, block);
  }
  return v2;
}

objc_class *__50__CIFilter_Builtins__convolution9HorizontalFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolution9VerticalFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolution9Vertical"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CIFilter_Builtins__convolution9VerticalFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolution9VerticalFilter_onceToken != -1) {
    dispatch_once(&convolution9VerticalFilter_onceToken, block);
  }
  return v2;
}

objc_class *__48__CIFilter_Builtins__convolution9VerticalFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB3X3Filter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolutionRGB3X3"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__convolutionRGB3X3Filter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolutionRGB3X3Filter_onceToken != -1) {
    dispatch_once(&convolutionRGB3X3Filter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__convolutionRGB3X3Filter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB5X5Filter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolutionRGB5X5"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__convolutionRGB5X5Filter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolutionRGB5X5Filter_onceToken != -1) {
    dispatch_once(&convolutionRGB5X5Filter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__convolutionRGB5X5Filter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB7X7Filter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolutionRGB7X7"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__convolutionRGB7X7Filter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolutionRGB7X7Filter_onceToken != -1) {
    dispatch_once(&convolutionRGB7X7Filter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__convolutionRGB7X7Filter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB9HorizontalFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolutionRGB9Horizontal"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CIFilter_Builtins__convolutionRGB9HorizontalFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolutionRGB9HorizontalFilter_onceToken != -1) {
    dispatch_once(&convolutionRGB9HorizontalFilter_onceToken, block);
  }
  return v2;
}

objc_class *__53__CIFilter_Builtins__convolutionRGB9HorizontalFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)convolutionRGB9VerticalFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIConvolutionRGB9Vertical"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CIFilter_Builtins__convolutionRGB9VerticalFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (convolutionRGB9VerticalFilter_onceToken != -1) {
    dispatch_once(&convolutionRGB9VerticalFilter_onceToken, block);
  }
  return v2;
}

objc_class *__51__CIFilter_Builtins__convolutionRGB9VerticalFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_weights) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_weights];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setWeights_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_weights, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setWeights_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_bias, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setBias_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)coreMLModelFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CICoreMLModelFilter"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__coreMLModelFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (coreMLModelFilter_onceToken != -1) {
    dispatch_once(&coreMLModelFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__coreMLModelFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_model) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_model];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_model, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setModel_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setModel_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_model, (IMP)objGetter, "@@:");
    }
    char v17 = [v7 instancesRespondToSelector:sel_setModel_];
    char v11 = (void (*)(void))objSetter;
    if ((v17 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_headIndex, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setHeadIndex_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_softmaxNormalization, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v15, sel_setSoftmaxNormalization_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)crystallizeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CICrystallize"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__crystallizeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (crystallizeFilter_onceToken != -1) {
    dispatch_once(&crystallizeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__crystallizeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v9, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)depthOfFieldFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDepthOfField"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__depthOfFieldFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (depthOfFieldFilter_onceToken != -1) {
    dispatch_once(&depthOfFieldFilter_onceToken, block);
  }
  return v2;
}

objc_class *__40__CIFilter_Builtins__depthOfFieldFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v18 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v18 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_point0, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setPoint0_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_point1, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v9, sel_setPoint1_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_saturation, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setSaturation_, (IMP)floatSetter, "v@:f");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_unsharpMaskRadius, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setUnsharpMaskRadius_, (IMP)floatSetter, "v@:f");
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_unsharpMaskIntensity, (IMP)floatGetter, "f@:");
    class_addMethod(v15, sel_setUnsharpMaskIntensity_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v17 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v17, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)edgesFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIEdges"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CIFilter_Builtins__edgesFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (edgesFilter_onceToken != -1) {
    dispatch_once(&edgesFilter_onceToken, block);
  }
  return v2;
}

objc_class *__33__CIFilter_Builtins__edgesFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)edgeWorkFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIEdgeWork"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__edgeWorkFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (edgeWorkFilter_onceToken != -1) {
    dispatch_once(&edgeWorkFilter_onceToken, block);
  }
  return v2;
}

objc_class *__36__CIFilter_Builtins__edgeWorkFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)gaborGradientsFilter
{
  return +[CIFilter filterWithName:@"CIGaborGradients"];
}

+ (CIFilter)gloomFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIGloom"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CIFilter_Builtins__gloomFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (gloomFilter_onceToken != -1) {
    dispatch_once(&gloomFilter_onceToken, block);
  }
  return v2;
}

objc_class *__33__CIFilter_Builtins__gloomFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_intensity, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setIntensity_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)heightFieldFromMaskFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIHeightFieldFromMask"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CIFilter_Builtins__heightFieldFromMaskFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (heightFieldFromMaskFilter_onceToken != -1) {
    dispatch_once(&heightFieldFromMaskFilter_onceToken, block);
  }
  return v2;
}

objc_class *__47__CIFilter_Builtins__heightFieldFromMaskFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)hexagonalPixellateFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIHexagonalPixellate"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__hexagonalPixellateFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (hexagonalPixellateFilter_onceToken != -1) {
    dispatch_once(&hexagonalPixellateFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__hexagonalPixellateFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)highlightShadowAdjustFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIHighlightShadowAdjust"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CIFilter_Builtins__highlightShadowAdjustFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (highlightShadowAdjustFilter_onceToken != -1) {
    dispatch_once(&highlightShadowAdjustFilter_onceToken, block);
  }
  return v2;
}

objc_class *__49__CIFilter_Builtins__highlightShadowAdjustFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_shadowAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setShadowAmount_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_highlightAmount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setHighlightAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)lineOverlayFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CILineOverlay"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__lineOverlayFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (lineOverlayFilter_onceToken != -1) {
    dispatch_once(&lineOverlayFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__lineOverlayFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_NRNoiseLevel, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setNRNoiseLevel_, (IMP)floatSetter, "v@:f");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_NRSharpness, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setNRSharpness_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_edgeIntensity, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setEdgeIntensity_, (IMP)floatSetter, "v@:f");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_threshold, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setThreshold_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_contrast, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v15, sel_setContrast_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)mixFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMix"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CIFilter_Builtins__mixFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (mixFilter_onceToken != -1) {
    dispatch_once(&mixFilter_onceToken, block);
  }
  return v2;
}

objc_class *__31__CIFilter_Builtins__mixFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_backgroundImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_backgroundImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setBackgroundImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_backgroundImage, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setBackgroundImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_amount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)personSegmentationFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPersonSegmentation"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__personSegmentationFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (personSegmentationFilter_onceToken != -1) {
    dispatch_once(&personSegmentationFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__personSegmentationFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_qualityLevel, (IMP)uintGetter, "Q@:");
    return (objc_class *)class_addMethod(v7, sel_setQualityLevel_, (IMP)uintSetter, "v@:Q}");
  }
  return result;
}

+ (CIFilter)pixellateFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPixellate"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__pixellateFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (pixellateFilter_onceToken != -1) {
    dispatch_once(&pixellateFilter_onceToken, block);
  }
  return v2;
}

objc_class *__37__CIFilter_Builtins__pixellateFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)pointillizeFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIPointillize"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__pointillizeFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (pointillizeFilter_onceToken != -1) {
    dispatch_once(&pointillizeFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__pointillizeFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    return (objc_class *)class_addMethod(v9, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  return result;
}

+ (CIFilter)saliencyMapFilter
{
  return +[CIFilter filterWithName:@"CISaliencyMapFilter"];
}

+ (CIFilter)shadedMaterialFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIShadedMaterial"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__shadedMaterialFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (shadedMaterialFilter_onceToken != -1) {
    dispatch_once(&shadedMaterialFilter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__shadedMaterialFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_shadingImage) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_shadingImage];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_shadingImage, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setShadingImage_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setShadingImage_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_shadingImage, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setShadingImage_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_scale, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)sobelGradientsFilter
{
  return +[CIFilter filterWithName:@"CISobelGradients"];
}

+ (CIFilter)spotColorFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISpotColor"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__spotColorFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (spotColorFilter_onceToken != -1) {
    dispatch_once(&spotColorFilter_onceToken, block);
  }
  return v2;
}

objc_class *__37__CIFilter_Builtins__spotColorFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v54 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v54 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_centerColor1) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_centerColor1];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_centerColor1, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setCenterColor1_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setCenterColor1_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_centerColor1, (IMP)objGetter, "@@:");
    }
    char v55 = [v7 instancesRespondToSelector:sel_setCenterColor1_];
    char v11 = (void (*)(void))objSetter;
    if ((v55 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_replacementColor1) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_replacementColor1];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_replacementColor1, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setReplacementColor1_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setReplacementColor1_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_replacementColor1, (IMP)objGetter, "@@:");
    }
    char v56 = [v13 instancesRespondToSelector:sel_setReplacementColor1_];
    char v17 = (void (*)(void))objSetter;
    if ((v56 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  char v18 = (objc_class *)objc_opt_class();
  if (v18)
  {
    char v19 = v18;
    class_addMethod(v18, sel_closeness1, (IMP)floatGetter, "f@:");
    class_addMethod(v19, sel_setCloseness1_, (IMP)floatSetter, "v@:f");
  }
  char v20 = (objc_class *)objc_opt_class();
  if (v20)
  {
    char v21 = v20;
    class_addMethod(v20, sel_contrast1, (IMP)floatGetter, "f@:");
    class_addMethod(v21, sel_setContrast1_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v22 = objc_opt_class();
  if (v22)
  {
    char v23 = (void *)v22;
    BOOL v24 = [NSStringFromSelector(sel_centerColor2) isEqualToString:@"inputImage"];
    char v25 = [v23 instancesRespondToSelector:sel_centerColor2];
    if (v24)
    {
      if ((v25 & 1) == 0) {
        class_addMethod((Class)v23, sel_centerColor2, (IMP)iiGetter, "@@:");
      }
      char v26 = [v23 instancesRespondToSelector:sel_setCenterColor2_];
      char v27 = (void (*)(void))iiSetter;
      if ((v26 & 1) == 0) {
LABEL_28:
      }
        class_addMethod((Class)v23, sel_setCenterColor2_, v27, "v@:@");
    }
    else
    {
      if ((v25 & 1) == 0) {
        class_addMethod((Class)v23, sel_centerColor2, (IMP)objGetter, "@@:");
      }
      char v57 = [v23 instancesRespondToSelector:sel_setCenterColor2_];
      char v27 = (void (*)(void))objSetter;
      if ((v57 & 1) == 0) {
        goto LABEL_28;
      }
    }
  }
  uint64_t v28 = objc_opt_class();
  if (!v28) {
    goto LABEL_35;
  }
  char v29 = (void *)v28;
  BOOL v30 = [NSStringFromSelector(sel_replacementColor2) isEqualToString:@"inputImage"];
  char v31 = [v29 instancesRespondToSelector:sel_replacementColor2];
  if (v30)
  {
    if ((v31 & 1) == 0) {
      class_addMethod((Class)v29, sel_replacementColor2, (IMP)iiGetter, "@@:");
    }
    char v32 = [v29 instancesRespondToSelector:sel_setReplacementColor2_];
    char v33 = (void (*)(void))iiSetter;
    if ((v32 & 1) == 0) {
LABEL_34:
    }
      class_addMethod((Class)v29, sel_setReplacementColor2_, v33, "v@:@");
  }
  else
  {
    if ((v31 & 1) == 0) {
      class_addMethod((Class)v29, sel_replacementColor2, (IMP)objGetter, "@@:");
    }
    char v58 = [v29 instancesRespondToSelector:sel_setReplacementColor2_];
    char v33 = (void (*)(void))objSetter;
    if ((v58 & 1) == 0) {
      goto LABEL_34;
    }
  }
LABEL_35:
  char v34 = (objc_class *)objc_opt_class();
  if (v34)
  {
    char v35 = v34;
    class_addMethod(v34, sel_closeness2, (IMP)floatGetter, "f@:");
    class_addMethod(v35, sel_setCloseness2_, (IMP)floatSetter, "v@:f");
  }
  char v36 = (objc_class *)objc_opt_class();
  if (v36)
  {
    char v37 = v36;
    class_addMethod(v36, sel_contrast2, (IMP)floatGetter, "f@:");
    class_addMethod(v37, sel_setContrast2_, (IMP)floatSetter, "v@:f");
  }
  uint64_t v38 = objc_opt_class();
  if (v38)
  {
    char v39 = (void *)v38;
    BOOL v40 = [NSStringFromSelector(sel_centerColor3) isEqualToString:@"inputImage"];
    char v41 = [v39 instancesRespondToSelector:sel_centerColor3];
    if (v40)
    {
      if ((v41 & 1) == 0) {
        class_addMethod((Class)v39, sel_centerColor3, (IMP)iiGetter, "@@:");
      }
      char v42 = [v39 instancesRespondToSelector:sel_setCenterColor3_];
      long long v43 = (void (*)(void))iiSetter;
      if ((v42 & 1) == 0) {
LABEL_44:
      }
        class_addMethod((Class)v39, sel_setCenterColor3_, v43, "v@:@");
    }
    else
    {
      if ((v41 & 1) == 0) {
        class_addMethod((Class)v39, sel_centerColor3, (IMP)objGetter, "@@:");
      }
      char v59 = [v39 instancesRespondToSelector:sel_setCenterColor3_];
      long long v43 = (void (*)(void))objSetter;
      if ((v59 & 1) == 0) {
        goto LABEL_44;
      }
    }
  }
  uint64_t v44 = objc_opt_class();
  if (!v44) {
    goto LABEL_51;
  }
  long long v45 = (void *)v44;
  BOOL v46 = [NSStringFromSelector(sel_replacementColor3) isEqualToString:@"inputImage"];
  char v47 = [v45 instancesRespondToSelector:sel_replacementColor3];
  if (v46)
  {
    if ((v47 & 1) == 0) {
      class_addMethod((Class)v45, sel_replacementColor3, (IMP)iiGetter, "@@:");
    }
    char v48 = [v45 instancesRespondToSelector:sel_setReplacementColor3_];
    CGAffineTransform v49 = (void (*)(void))iiSetter;
    if ((v48 & 1) == 0) {
LABEL_50:
    }
      class_addMethod((Class)v45, sel_setReplacementColor3_, v49, "v@:@");
  }
  else
  {
    if ((v47 & 1) == 0) {
      class_addMethod((Class)v45, sel_replacementColor3, (IMP)objGetter, "@@:");
    }
    char v60 = [v45 instancesRespondToSelector:sel_setReplacementColor3_];
    CGAffineTransform v49 = (void (*)(void))objSetter;
    if ((v60 & 1) == 0) {
      goto LABEL_50;
    }
  }
LABEL_51:
  CGAffineTransform v50 = (objc_class *)objc_opt_class();
  if (v50)
  {
    __int16 v51 = v50;
    class_addMethod(v50, sel_closeness3, (IMP)floatGetter, "f@:");
    class_addMethod(v51, sel_setCloseness3_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    double v53 = result;
    class_addMethod(result, sel_contrast3, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v53, sel_setContrast3_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)spotLightFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CISpotLight"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__spotLightFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (spotLightFilter_onceToken != -1) {
    dispatch_once(&spotLightFilter_onceToken, block);
  }
  return v2;
}

uint64_t __37__CIFilter_Builtins__spotLightFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v27 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v27 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_lightPosition) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_lightPosition];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_lightPosition, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setLightPosition_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setLightPosition_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_lightPosition, (IMP)objGetter, "@@:");
    }
    char v28 = [v7 instancesRespondToSelector:sel_setLightPosition_];
    char v11 = (void (*)(void))objSetter;
    if ((v28 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t v12 = objc_opt_class();
  if (!v12) {
    goto LABEL_19;
  }
  char v13 = (void *)v12;
  BOOL v14 = [NSStringFromSelector(sel_lightPointsAt) isEqualToString:@"inputImage"];
  char v15 = [v13 instancesRespondToSelector:sel_lightPointsAt];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_lightPointsAt, (IMP)iiGetter, "@@:");
    }
    char v16 = [v13 instancesRespondToSelector:sel_setLightPointsAt_];
    char v17 = (void (*)(void))iiSetter;
    if ((v16 & 1) == 0) {
LABEL_18:
    }
      class_addMethod((Class)v13, sel_setLightPointsAt_, v17, "v@:@");
  }
  else
  {
    if ((v15 & 1) == 0) {
      class_addMethod((Class)v13, sel_lightPointsAt, (IMP)objGetter, "@@:");
    }
    char v29 = [v13 instancesRespondToSelector:sel_setLightPointsAt_];
    char v17 = (void (*)(void))objSetter;
    if ((v29 & 1) == 0) {
      goto LABEL_18;
    }
  }
LABEL_19:
  char v18 = (objc_class *)objc_opt_class();
  if (v18)
  {
    char v19 = v18;
    class_addMethod(v18, sel_brightness, (IMP)floatGetter, "f@:");
    class_addMethod(v19, sel_setBrightness_, (IMP)floatSetter, "v@:f");
  }
  char v20 = (objc_class *)objc_opt_class();
  if (v20)
  {
    char v21 = v20;
    class_addMethod(v20, sel_concentration, (IMP)floatGetter, "f@:");
    class_addMethod(v21, sel_setConcentration_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = objc_opt_class();
  if (result)
  {
    char v23 = (void *)result;
    BOOL v24 = [NSStringFromSelector(sel_color) isEqualToString:@"inputImage"];
    char v25 = [v23 instancesRespondToSelector:sel_color];
    if (v24)
    {
      if ((v25 & 1) == 0) {
        class_addMethod((Class)v23, sel_color, (IMP)iiGetter, "@@:");
      }
      uint64_t result = [v23 instancesRespondToSelector:sel_setColor_];
      char v26 = (void (*)(void))iiSetter;
      if ((result & 1) == 0)
      {
LABEL_28:
        return class_addMethod((Class)v23, sel_setColor_, v26, "v@:@");
      }
    }
    else
    {
      if ((v25 & 1) == 0) {
        class_addMethod((Class)v23, sel_color, (IMP)objGetter, "@@:");
      }
      uint64_t result = [v23 instancesRespondToSelector:sel_setColor_];
      char v26 = (void (*)(void))objSetter;
      if ((result & 1) == 0) {
        goto LABEL_28;
      }
    }
  }
  return result;
}

+ (CIFilter)bokehBlurFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBokehBlur"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CIFilter_Builtins__bokehBlurFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (bokehBlurFilter_onceToken != -1) {
    dispatch_once(&bokehBlurFilter_onceToken, block);
  }
  return v2;
}

objc_class *__37__CIFilter_Builtins__bokehBlurFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  BOOL v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_ringAmount, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setRingAmount_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_ringSize, (IMP)floatGetter, "f@:");
    class_addMethod(v11, sel_setRingSize_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_softness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setSoftness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)boxBlurFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIBoxBlur"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CIFilter_Builtins__boxBlurFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (boxBlurFilter_onceToken != -1) {
    dispatch_once(&boxBlurFilter_onceToken, block);
  }
  return v2;
}

objc_class *__35__CIFilter_Builtins__boxBlurFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)discBlurFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIDiscBlur"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__discBlurFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (discBlurFilter_onceToken != -1) {
    dispatch_once(&discBlurFilter_onceToken, block);
  }
  return v2;
}

objc_class *__36__CIFilter_Builtins__discBlurFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)gaussianBlurFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIGaussianBlur"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CIFilter_Builtins__gaussianBlurFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (gaussianBlurFilter_onceToken != -1) {
    dispatch_once(&gaussianBlurFilter_onceToken, block);
  }
  return v2;
}

objc_class *__40__CIFilter_Builtins__gaussianBlurFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)maskedVariableBlurFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMaskedVariableBlur"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__maskedVariableBlurFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (maskedVariableBlurFilter_onceToken != -1) {
    dispatch_once(&maskedVariableBlurFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__maskedVariableBlurFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v14 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v14 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = objc_opt_class();
  if (!v6) {
    goto LABEL_13;
  }
  char v7 = (void *)v6;
  BOOL v8 = [NSStringFromSelector(sel_mask) isEqualToString:@"inputImage"];
  char v9 = [v7 instancesRespondToSelector:sel_mask];
  if (v8)
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_mask, (IMP)iiGetter, "@@:");
    }
    char v10 = [v7 instancesRespondToSelector:sel_setMask_];
    char v11 = (void (*)(void))iiSetter;
    if ((v10 & 1) == 0) {
LABEL_12:
    }
      class_addMethod((Class)v7, sel_setMask_, v11, "v@:@");
  }
  else
  {
    if ((v9 & 1) == 0) {
      class_addMethod((Class)v7, sel_mask, (IMP)objGetter, "@@:");
    }
    char v15 = [v7 instancesRespondToSelector:sel_setMask_];
    char v11 = (void (*)(void))objSetter;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
LABEL_13:
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v13 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v13, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)medianFilter
{
  return +[CIFilter filterWithName:@"CIMedianFilter"];
}

+ (CIFilter)morphologyGradientFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMorphologyGradient"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CIFilter_Builtins__morphologyGradientFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (morphologyGradientFilter_onceToken != -1) {
    dispatch_once(&morphologyGradientFilter_onceToken, block);
  }
  return v2;
}

objc_class *__46__CIFilter_Builtins__morphologyGradientFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)morphologyMaximumFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMorphologyMaximum"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__morphologyMaximumFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (morphologyMaximumFilter_onceToken != -1) {
    dispatch_once(&morphologyMaximumFilter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__morphologyMaximumFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)morphologyMinimumFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMorphologyMinimum"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CIFilter_Builtins__morphologyMinimumFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (morphologyMinimumFilter_onceToken != -1) {
    dispatch_once(&morphologyMinimumFilter_onceToken, block);
  }
  return v2;
}

objc_class *__45__CIFilter_Builtins__morphologyMinimumFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_radius, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)morphologyRectangleMaximumFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMorphologyRectangleMaximum"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__morphologyRectangleMaximumFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (morphologyRectangleMaximumFilter_onceToken != -1) {
    dispatch_once(&morphologyRectangleMaximumFilter_onceToken, block);
  }
  return v2;
}

objc_class *__54__CIFilter_Builtins__morphologyRectangleMaximumFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_height, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setHeight_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)morphologyRectangleMinimumFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMorphologyRectangleMinimum"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__morphologyRectangleMinimumFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (morphologyRectangleMinimumFilter_onceToken != -1) {
    dispatch_once(&morphologyRectangleMinimumFilter_onceToken, block);
  }
  return v2;
}

objc_class *__54__CIFilter_Builtins__morphologyRectangleMinimumFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_width, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setWidth_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_height, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setHeight_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)motionBlurFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIMotionBlur"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__motionBlurFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (motionBlurFilter_onceToken != -1) {
    dispatch_once(&motionBlurFilter_onceToken, block);
  }
  return v2;
}

objc_class *__38__CIFilter_Builtins__motionBlurFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_radius, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setRadius_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_angle, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setAngle_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)noiseReductionFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CINoiseReduction"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CIFilter_Builtins__noiseReductionFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (noiseReductionFilter_onceToken != -1) {
    dispatch_once(&noiseReductionFilter_onceToken, block);
  }
  return v2;
}

objc_class *__42__CIFilter_Builtins__noiseReductionFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_noiseLevel, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setNoiseLevel_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_sharpness, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setSharpness_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)zoomBlurFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIZoomBlur"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__CIFilter_Builtins__zoomBlurFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (zoomBlurFilter_onceToken != -1) {
    dispatch_once(&zoomBlurFilter_onceToken, block);
  }
  return v2;
}

objc_class *__36__CIFilter_Builtins__zoomBlurFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v10 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v10 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_center, (IMP)pointGetter, "{CGPoint=dd}@:");
    class_addMethod(v7, sel_setCenter_, (IMP)pointSetter, "v@:{CGPoint=dd}}");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v9 = result;
    class_addMethod(result, sel_amount, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v9, sel_setAmount_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)areaAverageFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaAverage"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__areaAverageFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaAverageFilter_onceToken != -1) {
    dispatch_once(&areaAverageFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__areaAverageFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaHistogramFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaHistogram"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__areaHistogramFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaHistogramFilter_onceToken != -1) {
    dispatch_once(&areaHistogramFilter_onceToken, block);
  }
  return v2;
}

objc_class *__41__CIFilter_Builtins__areaHistogramFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_count, (IMP)intGetter, "q@:");
    return (objc_class *)class_addMethod(v11, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  return result;
}

+ (id)areaAlphaWeightedHistogramFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaAlphaWeightedHistogram"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_Builtins__areaAlphaWeightedHistogramFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaAlphaWeightedHistogramFilter_onceToken != -1) {
    dispatch_once(&areaAlphaWeightedHistogramFilter_onceToken, block);
  }
  return v2;
}

objc_class *__54__CIFilter_Builtins__areaAlphaWeightedHistogramFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_count, (IMP)intGetter, "q@:");
    return (objc_class *)class_addMethod(v11, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  return result;
}

+ (CIFilter)areaLogarithmicHistogramFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaLogarithmicHistogram"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CIFilter_Builtins__areaLogarithmicHistogramFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaLogarithmicHistogramFilter_onceToken != -1) {
    dispatch_once(&areaLogarithmicHistogramFilter_onceToken, block);
  }
  return v2;
}

objc_class *__52__CIFilter_Builtins__areaLogarithmicHistogramFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v16 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v16 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_scale, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setScale_, (IMP)floatSetter, "v@:f");
  }
  char v10 = (objc_class *)objc_opt_class();
  if (v10)
  {
    char v11 = v10;
    class_addMethod(v10, sel_count, (IMP)intGetter, "q@:");
    class_addMethod(v11, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  char v12 = (objc_class *)objc_opt_class();
  if (v12)
  {
    char v13 = v12;
    class_addMethod(v12, sel_minimumStop, (IMP)floatGetter, "f@:");
    class_addMethod(v13, sel_setMinimumStop_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v15 = result;
    class_addMethod(result, sel_maximumStop, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v15, sel_setMaximumStop_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)areaMaximumFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaMaximum"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__areaMaximumFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaMaximumFilter_onceToken != -1) {
    dispatch_once(&areaMaximumFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__areaMaximumFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMaximumAlphaFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaMaximumAlpha"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__areaMaximumAlphaFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaMaximumAlphaFilter_onceToken != -1) {
    dispatch_once(&areaMaximumAlphaFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__areaMaximumAlphaFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMinimumFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaMinimum"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CIFilter_Builtins__areaMinimumFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaMinimumFilter_onceToken != -1) {
    dispatch_once(&areaMinimumFilter_onceToken, block);
  }
  return v2;
}

objc_class *__39__CIFilter_Builtins__areaMinimumFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMinimumAlphaFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaMinimumAlpha"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__areaMinimumAlphaFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaMinimumAlphaFilter_onceToken != -1) {
    dispatch_once(&areaMinimumAlphaFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__areaMinimumAlphaFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMinMaxFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaMinMax"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__areaMinMaxFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaMinMaxFilter_onceToken != -1) {
    dispatch_once(&areaMinMaxFilter_onceToken, block);
  }
  return v2;
}

objc_class *__38__CIFilter_Builtins__areaMinMaxFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)areaMinMaxRedFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaMinMaxRed"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__areaMinMaxRedFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaMinMaxRedFilter_onceToken != -1) {
    dispatch_once(&areaMinMaxRedFilter_onceToken, block);
  }
  return v2;
}

objc_class *__41__CIFilter_Builtins__areaMinMaxRedFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (id)areaBoundsRedFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIAreaBoundsRed"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__areaBoundsRedFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (areaBoundsRedFilter_onceToken != -1) {
    dispatch_once(&areaBoundsRedFilter_onceToken, block);
  }
  return v2;
}

objc_class *__41__CIFilter_Builtins__areaBoundsRedFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)columnAverageFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIColumnAverage"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CIFilter_Builtins__columnAverageFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (columnAverageFilter_onceToken != -1) {
    dispatch_once(&columnAverageFilter_onceToken, block);
  }
  return v2;
}

objc_class *__41__CIFilter_Builtins__columnAverageFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (CIFilter)histogramDisplayFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIHistogramDisplayFilter"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CIFilter_Builtins__histogramDisplayFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (histogramDisplayFilter_onceToken != -1) {
    dispatch_once(&histogramDisplayFilter_onceToken, block);
  }
  return v2;
}

objc_class *__44__CIFilter_Builtins__histogramDisplayFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v12 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_height, (IMP)floatGetter, "f@:");
    class_addMethod(v7, sel_setHeight_, (IMP)floatSetter, "v@:f");
  }
  char v8 = (objc_class *)objc_opt_class();
  if (v8)
  {
    char v9 = v8;
    class_addMethod(v8, sel_highLimit, (IMP)floatGetter, "f@:");
    class_addMethod(v9, sel_setHighLimit_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v11 = result;
    class_addMethod(result, sel_lowLimit, (IMP)floatGetter, "f@:");
    return (objc_class *)class_addMethod(v11, sel_setLowLimit_, (IMP)floatSetter, "v@:f");
  }
  return result;
}

+ (CIFilter)KMeansFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIKMeans"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CIFilter_Builtins__KMeansFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (KMeansFilter_onceToken != -1) {
    dispatch_once(&KMeansFilter_onceToken, block);
  }
  return v2;
}

objc_class *__34__CIFilter_Builtins__KMeansFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v20 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v20 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  if (v6)
  {
    char v7 = v6;
    class_addMethod(v6, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  uint64_t v8 = objc_opt_class();
  if (v8)
  {
    char v9 = (void *)v8;
    BOOL v10 = [NSStringFromSelector(sel_inputMeans) isEqualToString:@"inputImage"];
    char v11 = [v9 instancesRespondToSelector:sel_inputMeans];
    if (v10)
    {
      if ((v11 & 1) == 0) {
        class_addMethod((Class)v9, sel_inputMeans, (IMP)iiGetter, "@@:");
      }
      char v12 = [v9 instancesRespondToSelector:sel_setInputMeans_];
      char v13 = (void (*)(void))iiSetter;
      if ((v12 & 1) == 0) {
LABEL_14:
      }
        class_addMethod((Class)v9, sel_setInputMeans_, v13, "v@:@");
    }
    else
    {
      if ((v11 & 1) == 0) {
        class_addMethod((Class)v9, sel_inputMeans, (IMP)objGetter, "@@:");
      }
      char v21 = [v9 instancesRespondToSelector:sel_setInputMeans_];
      char v13 = (void (*)(void))objSetter;
      if ((v21 & 1) == 0) {
        goto LABEL_14;
      }
    }
  }
  char v14 = (objc_class *)objc_opt_class();
  if (v14)
  {
    char v15 = v14;
    class_addMethod(v14, sel_count, (IMP)intGetter, "q@:");
    class_addMethod(v15, sel_setCount_, (IMP)intSetter, "v@:q}");
  }
  char v16 = (objc_class *)objc_opt_class();
  if (v16)
  {
    char v17 = v16;
    class_addMethod(v16, sel_passes, (IMP)floatGetter, "f@:");
    class_addMethod(v17, sel_setPasses_, (IMP)floatSetter, "v@:f");
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v19 = result;
    class_addMethod(result, sel_perceptual, (IMP)BOOLGetter, "B@:");
    return (objc_class *)class_addMethod(v19, sel_setPerceptual_, (IMP)BOOLSetter, "v@:B}");
  }
  return result;
}

+ (CIFilter)rowAverageFilter
{
  BOOL v2 = +[CIFilter filterWithName:@"CIRowAverage"];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CIFilter_Builtins__rowAverageFilter__block_invoke;
  block[3] = &unk_1E5771BE8;
  block[4] = v2;
  if (rowAverageFilter_onceToken != -1) {
    dispatch_once(&rowAverageFilter_onceToken, block);
  }
  return v2;
}

objc_class *__38__CIFilter_Builtins__rowAverageFilter__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  if (v0)
  {
    int v1 = (void *)v0;
    BOOL v2 = [NSStringFromSelector(sel_inputImage) isEqualToString:@"inputImage"];
    char v3 = [v1 instancesRespondToSelector:sel_inputImage];
    if (v2)
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)iiGetter, "@@:");
      }
      char v4 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))iiSetter;
      if ((v4 & 1) == 0) {
LABEL_6:
      }
        class_addMethod((Class)v1, sel_setInputImage_, v5, "v@:@");
    }
    else
    {
      if ((v3 & 1) == 0) {
        class_addMethod((Class)v1, sel_inputImage, (IMP)objGetter, "@@:");
      }
      char v8 = [v1 instancesRespondToSelector:sel_setInputImage_];
      char v5 = (void (*)(void))objSetter;
      if ((v8 & 1) == 0) {
        goto LABEL_6;
      }
    }
  }
  uint64_t result = (objc_class *)objc_opt_class();
  if (result)
  {
    char v7 = result;
    class_addMethod(result, sel_extent, (IMP)rectGetter, "{CGRect={CGPoint=dd}{CGSize=dd}}@:");
    return (objc_class *)class_addMethod(v7, sel_setExtent_, (IMP)rectSetter, "v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
  }
  return result;
}

+ (unsigned)indexForWrapperNumber:(unsigned int)a3
{
  return a3 + 10;
}

+ (BOOL)exchangeImplementationsForClass
{
  BOOL v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = [(id)wrappedClasses count];
  if (v3 == 89)
  {
    NSLog(&cfstr_CanTWrapAnymor.isa);
    uint64_t v6 = NSStringFromClass(v2);
    NSLog(&cfstr_WillNotBeWrapp.isa, v6);
  }
  else
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", v2), "hash"));
    char v5 = (void *)wrappedClasses;
    objc_sync_enter((id)wrappedClasses);
    if ([(id)wrappedClasses containsObject:v4])
    {
      objc_sync_exit(v5);
    }
    else
    {
      [(id)wrappedClasses addObject:v4];
      objc_sync_exit(v5);
      ++exchangeImplementationsForClass_count;
      char v8 = NSSelectorFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"wrappedOutputImage%d", -[objc_class indexForWrapperNumber:](v2, "indexForWrapperNumber:")));
      InstanceMethodouble d = class_getInstanceMethod(v2, sel_outputImage);
      BOOL v10 = class_getInstanceMethod(v2, v8);
      Implementation = method_getImplementation(v10);
      TypeEncoding = method_getTypeEncoding(v10);
      if (class_addMethod(v2, sel_outputImage, Implementation, TypeEncoding))
      {
        char v13 = method_getImplementation(InstanceMethod);
        char v14 = method_getTypeEncoding(InstanceMethod);
        class_replaceMethod(v2, v8, v13, v14);
      }
      else
      {
        method_exchangeImplementations(InstanceMethod, v10);
      }
    }
  }
  return v3 != 89;
}

+ (BOOL)wrapClassIfNeeded:(Class)a3
{
  if (enableFilterInterposing_onceToken != -1) {
    dispatch_once(&enableFilterInterposing_onceToken, &__block_literal_global_137);
  }
  if (!enableFilterInterposing_enableFilterposing) {
    return 0;
  }
  if (wrapClassIfNeeded__onceToken != -1) {
    dispatch_once(&wrapClassIfNeeded__onceToken, &__block_literal_global_28);
  }
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", a3), "hash"));
  char v5 = (void *)wrappedClasses;
  objc_sync_enter((id)wrappedClasses);
  LOBYTE(v4) = [(id)wrappedClasses containsObject:v4];
  objc_sync_exit(v5);
  if (v4) {
    return 1;
  }

  return [(objc_class *)a3 exchangeImplementationsForClass];
}

id __42__CIFilter_Interposer__wrapClassIfNeeded___block_invoke()
{
  wrappedClasses = (uint64_t)(id)[MEMORY[0x1E4F1CA80] set];
  filtersToSkip = (uint64_t)(id)[MEMORY[0x1E4F1CA80] set];
  appendFilters = (uint64_t)(id)[MEMORY[0x1E4F1CA60] dictionary];
  id result = (id)[MEMORY[0x1E4F1CA60] dictionary];
  prependFilters = (uint64_t)result;
  if (!replacementFilters)
  {
    id result = (id)[MEMORY[0x1E4F1CA60] dictionary];
    replacementFilters = (uint64_t)result;
  }
  return result;
}

- (void)_prependSingleFilter:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 && [a3 count] == 3)
  {
    uint64_t v5 = [a3 objectAtIndexedSubscript:0];
    uint64_t v6 = [a3 objectAtIndexedSubscript:1];
    uint64_t v7 = [a3 objectAtIndexedSubscript:2];
    if ([(NSArray *)[(CIFilter *)self inputKeys] containsObject:v6])
    {
      if (v5 && v7)
      {
        char v8 = +[CIFilter filterWithName:v5];
        [(CIFilter *)v8 setDefaults];
        [(CIFilter *)v8 setValuesForKeysWithDictionary:v7];
        char v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", -[CIFilter inputKeys](v8, "inputKeys"));
        objc_msgSend(v9, "intersectSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[CIFilter inputKeys](self, "inputKeys")));
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              uint64_t v15 = [(CIFilter *)self valueForKey:v14];
              if (v15) {
                [(CIFilter *)v8 setValue:v15 forKey:v14];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v11);
        }
        if (([v9 containsObject:@"inputImage"] & 1) == 0)
        {
          uint64_t v16 = [(CIFilter *)self valueForKey:v6];
          if ([(NSArray *)[(CIFilter *)v8 inputKeys] containsObject:@"inputImage"])
          {
            [(CIFilter *)v8 setValue:v16 forKey:@"inputImage"];
          }
        }
        [(CIFilter *)self setValue:[(CIFilter *)v8 outputImage] forKey:v6];
      }
    }
    else
    {
      uint64_t v17 = [(id)objc_opt_class() description];
      NSLog(&cfstr_NoInputOnFilte.isa, v17, v6);
    }
  }
}

- (void)_prepend:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)prependFilters;
  objc_sync_enter((id)prependFilters);
  uint64_t v6 = (void *)[(id)prependFilters objectForKey:a3];
  objc_sync_exit(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [(CIFilter *)self _prependSingleFilter:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_appendSingleFilterTo:(id)a3 filterAndSettings:(id)a4
{
  if (!a4) {
    return a3;
  }
  if ([a4 count] != 2) {
    return a3;
  }
  uint64_t v7 = [a4 objectAtIndexedSubscript:0];
  uint64_t v8 = [a4 objectAtIndexedSubscript:1];
  if (!v7) {
    return a3;
  }
  uint64_t v9 = v8;
  if (!v8) {
    return a3;
  }
  long long v10 = +[CIFilter filterWithName:v7];
  [(CIFilter *)v10 setDefaults];
  [(CIFilter *)v10 setValuesForKeysWithDictionary:v9];
  if ([(NSArray *)[(CIFilter *)v10 inputKeys] containsObject:@"inputImage"]) {
    [(CIFilter *)v10 setValue:a3 forKey:@"inputImage"];
  }
  if ([(NSArray *)[(CIFilter *)v10 inputKeys] containsObject:@"inputOriginalFilter"])
  {
    [(CIFilter *)v10 setValue:self forKey:@"inputOriginalFilter"];
  }

  return [(CIFilter *)v10 outputImage];
}

- (id)_append:(id)a3 image:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)appendFilters;
  objc_sync_enter((id)appendFilters);
  uint64_t v8 = (void *)[(id)appendFilters objectForKey:a3];
  objc_sync_exit(v7);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        a4 = [(CIFilter *)self _appendSingleFilterTo:a4 filterAndSettings:*(void *)(*((void *)&v13 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  return a4;
}

- (id)outputImageCatchAll:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", objc_opt_class()), "hash"));
  uint64_t v8 = (void *)filtersToSkip;
  objc_sync_enter((id)filtersToSkip);
  LODWORD(v7) = [(id)filtersToSkip containsObject:v7];
  objc_sync_exit(v8);
  if (v7)
  {
    id result = (id)[(CIFilter *)self valueForKey:@"inputImage"];
    if (!result)
    {
      return +[CIImage emptyImage];
    }
  }
  else
  {
    [(CIFilter *)self _prepend:v6];
    uint64_t v10 = -[CIFilter performSelector:](self, "performSelector:", NSSelectorFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"wrappedOutputImage%d", v3)));
    uint64_t v11 = (void *)replacementFilters;
    objc_sync_enter((id)replacementFilters);
    long long v12 = (void *)[(id)replacementFilters objectForKeyedSubscript:v6];
    objc_sync_exit(v11);
    if (v12)
    {
      if ([v12 count] == 2)
      {
        long long v13 = metaFilterForFilter([v12 objectAtIndexedSubscript:0], (objc_object *)self);
        if (v13)
        {
          long long v14 = v13;
          -[objc_object setValuesForKeysWithDictionary:](v13, "setValuesForKeysWithDictionary:", [v12 objectAtIndexedSubscript:1]);
          [(objc_object *)v14 setValue:v10 forKey:@"inputOutputImage"];
          uint64_t v10 = [(objc_object *)v14 outputImage];
        }
      }
    }
    return [(CIFilter *)self _append:v6 image:v10];
  }
  return result;
}

+ (id)filterName:(id)a3 append:(id)a4 arguments:(id)a5
{
  if (![a1 wrapClassIfNeeded:NSClassFromString((NSString *)a3)]) {
    return 0;
  }
  if (a5) {
    id v8 = a5;
  }
  else {
    id v8 = (id)MEMORY[0x1E4F1CC08];
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", a4, v9, 0);
  uint64_t v11 = (void *)appendFilters;
  objc_sync_enter((id)appendFilters);
  long long v12 = (void *)[(id)appendFilters valueForKey:a3];
  if (!v12) {
    long long v12 = (void *)[MEMORY[0x1E4F1CA48] array];
  }
  [v12 addObject:v10];
  [(id)appendFilters setValue:v12 forKey:a3];
  objc_sync_exit(v11);
  return v9;
}

+ (id)filterName:(id)a3 prepend:(id)a4 imageName:(id)a5 arguments:(id)a6
{
  if (![a1 wrapClassIfNeeded:NSClassFromString((NSString *)a3)]) {
    return 0;
  }
  if (a6) {
    id v10 = a6;
  }
  else {
    id v10 = (id)MEMORY[0x1E4F1CC08];
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", a4, a5, v11, 0);
  long long v13 = (void *)prependFilters;
  objc_sync_enter((id)prependFilters);
  long long v14 = (void *)[(id)prependFilters valueForKey:a3];
  if (!v14) {
    long long v14 = (void *)[MEMORY[0x1E4F1CA48] array];
  }
  [v14 addObject:v12];
  [(id)prependFilters setValue:v14 forKey:a3];
  objc_sync_exit(v13);
  return v11;
}

- (id)wrappedOutputImage10
{
  return [(CIFilter *)self outputImageCatchAll:10];
}

- (id)wrappedOutputImage11
{
  return [(CIFilter *)self outputImageCatchAll:11];
}

- (id)wrappedOutputImage12
{
  return [(CIFilter *)self outputImageCatchAll:12];
}

- (id)wrappedOutputImage13
{
  return [(CIFilter *)self outputImageCatchAll:13];
}

- (id)wrappedOutputImage14
{
  return [(CIFilter *)self outputImageCatchAll:14];
}

- (id)wrappedOutputImage15
{
  return [(CIFilter *)self outputImageCatchAll:15];
}

- (id)wrappedOutputImage16
{
  return [(CIFilter *)self outputImageCatchAll:16];
}

- (id)wrappedOutputImage17
{
  return [(CIFilter *)self outputImageCatchAll:17];
}

- (id)wrappedOutputImage18
{
  return [(CIFilter *)self outputImageCatchAll:18];
}

- (id)wrappedOutputImage19
{
  return [(CIFilter *)self outputImageCatchAll:19];
}

- (id)wrappedOutputImage20
{
  return [(CIFilter *)self outputImageCatchAll:20];
}

- (id)wrappedOutputImage21
{
  return [(CIFilter *)self outputImageCatchAll:21];
}

- (id)wrappedOutputImage22
{
  return [(CIFilter *)self outputImageCatchAll:22];
}

- (id)wrappedOutputImage23
{
  return [(CIFilter *)self outputImageCatchAll:23];
}

- (id)wrappedOutputImage24
{
  return [(CIFilter *)self outputImageCatchAll:24];
}

- (id)wrappedOutputImage25
{
  return [(CIFilter *)self outputImageCatchAll:25];
}

- (id)wrappedOutputImage26
{
  return [(CIFilter *)self outputImageCatchAll:26];
}

- (id)wrappedOutputImage27
{
  return [(CIFilter *)self outputImageCatchAll:27];
}

- (id)wrappedOutputImage28
{
  return [(CIFilter *)self outputImageCatchAll:28];
}

- (id)wrappedOutputImage29
{
  return [(CIFilter *)self outputImageCatchAll:29];
}

- (id)wrappedOutputImage30
{
  return [(CIFilter *)self outputImageCatchAll:30];
}

- (id)wrappedOutputImage31
{
  return [(CIFilter *)self outputImageCatchAll:31];
}

- (id)wrappedOutputImage32
{
  return [(CIFilter *)self outputImageCatchAll:32];
}

- (id)wrappedOutputImage33
{
  return [(CIFilter *)self outputImageCatchAll:33];
}

- (id)wrappedOutputImage34
{
  return [(CIFilter *)self outputImageCatchAll:34];
}

- (id)wrappedOutputImage35
{
  return [(CIFilter *)self outputImageCatchAll:35];
}

- (id)wrappedOutputImage36
{
  return [(CIFilter *)self outputImageCatchAll:36];
}

- (id)wrappedOutputImage37
{
  return [(CIFilter *)self outputImageCatchAll:37];
}

- (id)wrappedOutputImage38
{
  return [(CIFilter *)self outputImageCatchAll:38];
}

- (id)wrappedOutputImage39
{
  return [(CIFilter *)self outputImageCatchAll:39];
}

- (id)wrappedOutputImage40
{
  return [(CIFilter *)self outputImageCatchAll:40];
}

- (id)wrappedOutputImage41
{
  return [(CIFilter *)self outputImageCatchAll:41];
}

- (id)wrappedOutputImage42
{
  return [(CIFilter *)self outputImageCatchAll:42];
}

- (id)wrappedOutputImage43
{
  return [(CIFilter *)self outputImageCatchAll:43];
}

- (id)wrappedOutputImage44
{
  return [(CIFilter *)self outputImageCatchAll:44];
}

- (id)wrappedOutputImage45
{
  return [(CIFilter *)self outputImageCatchAll:45];
}

- (id)wrappedOutputImage46
{
  return [(CIFilter *)self outputImageCatchAll:46];
}

- (id)wrappedOutputImage47
{
  return [(CIFilter *)self outputImageCatchAll:47];
}

- (id)wrappedOutputImage48
{
  return [(CIFilter *)self outputImageCatchAll:48];
}

- (id)wrappedOutputImage49
{
  return [(CIFilter *)self outputImageCatchAll:49];
}

- (id)wrappedOutputImage50
{
  return [(CIFilter *)self outputImageCatchAll:50];
}

- (id)wrappedOutputImage51
{
  return [(CIFilter *)self outputImageCatchAll:51];
}

- (id)wrappedOutputImage52
{
  return [(CIFilter *)self outputImageCatchAll:52];
}

- (id)wrappedOutputImage53
{
  return [(CIFilter *)self outputImageCatchAll:53];
}

- (id)wrappedOutputImage54
{
  return [(CIFilter *)self outputImageCatchAll:54];
}

- (id)wrappedOutputImage55
{
  return [(CIFilter *)self outputImageCatchAll:55];
}

- (id)wrappedOutputImage56
{
  return [(CIFilter *)self outputImageCatchAll:56];
}

- (id)wrappedOutputImage57
{
  return [(CIFilter *)self outputImageCatchAll:57];
}

- (id)wrappedOutputImage58
{
  return [(CIFilter *)self outputImageCatchAll:58];
}

- (id)wrappedOutputImage59
{
  return [(CIFilter *)self outputImageCatchAll:59];
}

- (id)wrappedOutputImage60
{
  return [(CIFilter *)self outputImageCatchAll:60];
}

- (id)wrappedOutputImage61
{
  return [(CIFilter *)self outputImageCatchAll:61];
}

- (id)wrappedOutputImage62
{
  return [(CIFilter *)self outputImageCatchAll:62];
}

- (id)wrappedOutputImage63
{
  return [(CIFilter *)self outputImageCatchAll:63];
}

- (id)wrappedOutputImage64
{
  return [(CIFilter *)self outputImageCatchAll:64];
}

- (id)wrappedOutputImage65
{
  return [(CIFilter *)self outputImageCatchAll:65];
}

- (id)wrappedOutputImage66
{
  return [(CIFilter *)self outputImageCatchAll:66];
}

- (id)wrappedOutputImage67
{
  return [(CIFilter *)self outputImageCatchAll:67];
}

- (id)wrappedOutputImage68
{
  return [(CIFilter *)self outputImageCatchAll:68];
}

- (id)wrappedOutputImage69
{
  return [(CIFilter *)self outputImageCatchAll:69];
}

- (id)wrappedOutputImage70
{
  return [(CIFilter *)self outputImageCatchAll:70];
}

- (id)wrappedOutputImage71
{
  return [(CIFilter *)self outputImageCatchAll:71];
}

- (id)wrappedOutputImage72
{
  return [(CIFilter *)self outputImageCatchAll:72];
}

- (id)wrappedOutputImage73
{
  return [(CIFilter *)self outputImageCatchAll:73];
}

- (id)wrappedOutputImage74
{
  return [(CIFilter *)self outputImageCatchAll:74];
}

- (id)wrappedOutputImage75
{
  return [(CIFilter *)self outputImageCatchAll:75];
}

- (id)wrappedOutputImage76
{
  return [(CIFilter *)self outputImageCatchAll:76];
}

- (id)wrappedOutputImage77
{
  return [(CIFilter *)self outputImageCatchAll:77];
}

- (id)wrappedOutputImage78
{
  return [(CIFilter *)self outputImageCatchAll:78];
}

- (id)wrappedOutputImage79
{
  return [(CIFilter *)self outputImageCatchAll:79];
}

- (id)wrappedOutputImage80
{
  return [(CIFilter *)self outputImageCatchAll:80];
}

- (id)wrappedOutputImage81
{
  return [(CIFilter *)self outputImageCatchAll:81];
}

- (id)wrappedOutputImage82
{
  return [(CIFilter *)self outputImageCatchAll:82];
}

- (id)wrappedOutputImage83
{
  return [(CIFilter *)self outputImageCatchAll:83];
}

- (id)wrappedOutputImage84
{
  return [(CIFilter *)self outputImageCatchAll:84];
}

- (id)wrappedOutputImage85
{
  return [(CIFilter *)self outputImageCatchAll:85];
}

- (id)wrappedOutputImage86
{
  return [(CIFilter *)self outputImageCatchAll:86];
}

- (id)wrappedOutputImage87
{
  return [(CIFilter *)self outputImageCatchAll:87];
}

- (id)wrappedOutputImage88
{
  return [(CIFilter *)self outputImageCatchAll:88];
}

- (id)wrappedOutputImage89
{
  return [(CIFilter *)self outputImageCatchAll:89];
}

- (id)wrappedOutputImage90
{
  return [(CIFilter *)self outputImageCatchAll:90];
}

- (id)wrappedOutputImage91
{
  return [(CIFilter *)self outputImageCatchAll:91];
}

- (id)wrappedOutputImage92
{
  return [(CIFilter *)self outputImageCatchAll:92];
}

- (id)wrappedOutputImage93
{
  return [(CIFilter *)self outputImageCatchAll:93];
}

- (id)wrappedOutputImage94
{
  return [(CIFilter *)self outputImageCatchAll:94];
}

- (id)wrappedOutputImage95
{
  return [(CIFilter *)self outputImageCatchAll:95];
}

- (id)wrappedOutputImage96
{
  return [(CIFilter *)self outputImageCatchAll:96];
}

- (id)wrappedOutputImage97
{
  return [(CIFilter *)self outputImageCatchAll:97];
}

- (id)wrappedOutputImage98
{
  return [(CIFilter *)self outputImageCatchAll:98];
}

- (id)wrappedOutputImage99
{
  return [(CIFilter *)self outputImageCatchAll:99];
}

+ (void)addFilterToSkip:(id)a3
{
  Class v4 = NSClassFromString((NSString *)a3);
  if (v4)
  {
    Class v5 = v4;
    if ([a1 wrapClassIfNeeded:v4])
    {
      uint64_t v6 = (void *)filtersToSkip;
      objc_sync_enter((id)filtersToSkip);
      objc_msgSend((id)filtersToSkip, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29238], "valueWithPointer:", v5), "hash")));
      objc_sync_exit(v6);
    }
  }
}

+ (id)filterName:(id)a3 replacement:(id)a4 arguments:(id)a5
{
  if (![a1 wrapClassIfNeeded:NSClassFromString((NSString *)a3)]) {
    return 0;
  }
  id v8 = +[CIFilter filterWithName:a4 withInputParameters:a5];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  if (!replacementFilters) {
    replacementFilters = (uint64_t)(id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  id v10 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a5];
  uint64_t v11 = (void *)replacementFilters;
  objc_sync_enter((id)replacementFilters);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v9, v10, 0);
  [(id)replacementFilters setObject:v12 forKeyedSubscript:a3];
  objc_sync_exit(v11);
  return v10;
}

+ (id)filterName:(id)a3 replacement:(id)a4
{
  return (id)[a1 filterName:a3 replacement:a4 arguments:MEMORY[0x1E4F1CC08]];
}

+ (CIFilter)filterWithName:(NSString *)name keysAndValues:(id)key0
{
  va_start(va, key0);
  uint64_t v6 = (void *)MEMORY[0x199702DB0](a1, a2);
  uint64_t v7 = +[CIFilter filterWithName:name];
  if (v7)
  {
    id v8 = v7;
    va_copy(v12, va);
    if (key0)
    {
      do
      {
        [(CIFilter *)v8 setValue:*(void *)v12 forKey:key0];
        uint64_t v9 = (id *)(v12 + 8);
        v12 += 16;
        key0 = *v9;
      }
      while (*v9);
    }
    id v10 = v8;
    return v8;
  }
  else
  {
    return 0;
  }
}

+ (CIFilter)filterWithName:(NSString *)name withInputParameters:(NSDictionary *)params
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x199702DB0](a1, a2);
  uint64_t v7 = +[CIFilter filterWithName:name setDefaults:1];
  if (v7)
  {
    id v8 = v7;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    NSUInteger v9 = [(NSDictionary *)params countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      NSUInteger v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(params);
          }
          [(CIFilter *)v8 setValue:[(NSDictionary *)params objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * v12)] forKey:*(void *)(*((void *)&v15 + 1) + 8 * v12)];
          ++v12;
        }
        while (v10 != v12);
        NSUInteger v10 = [(NSDictionary *)params countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    long long v13 = v8;
    return v8;
  }
  else
  {
    return 0;
  }
}

+ (NSArray)filterNamesInCategory:(NSString *)category
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (category)
  {
    v5[0] = category;
    categordouble y = (NSString *)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  return (NSArray *)[a1 filterNamesInCategories:category];
}

+ (NSArray)filterNamesInCategories:(NSArray *)categories
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:categories];
  char v4 = objc_msgSend(v3, "containsObject:");
  Class v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [&unk_1EE4AB8A0 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(&unk_1EE4AB8A0);
        }
        NSUInteger v10 = *(NSString **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", +[CIFilterClassCategories classCategoriesForClass:](CIFilterClassCategories, "classCategoriesForClass:", NSClassFromString(v10)));
        if ([v3 isSubsetOfSet:v11]
          && ((v4 & 1) != 0 || ([v11 containsObject:@"CICategoryApplePrivate"] & 1) == 0))
        {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [&unk_1EE4AB8A0 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__CIFilter_CIFilterRegistry__filterNamesInCategories___block_invoke;
  v15[3] = &unk_1E5771C10;
  char v16 = v4;
  v15[4] = v3;
  v15[5] = v5;
  register_more_builtins((uint64_t)v15);
  uint64_t v12 = filterRegistryIsolationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CIFilter_CIFilterRegistry__filterNamesInCategories___block_invoke_2;
  block[3] = &unk_1E57710E0;
  block[4] = v3;
  void block[5] = v5;
  dispatch_sync(v12, block);
  return (NSArray *)[v5 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
}

uint64_t __54__CIFilter_CIFilterRegistry__filterNamesInCategories___block_invoke(uint64_t a1, NSString *aClassName)
{
  char v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", +[CIFilterClassCategories classCategoriesForClass:](CIFilterClassCategories, "classCategoriesForClass:", NSClassFromString(aClassName)));
  uint64_t result = [*(id *)(a1 + 32) isSubsetOfSet:v4];
  if (result)
  {
    if (*(unsigned char *)(a1 + 48)
      || (uint64_t result = [v4 containsObject:@"CICategoryApplePrivate"], (result & 1) == 0))
    {
      uint64_t v6 = *(void **)(a1 + 40);
      return [v6 addObject:aClassName];
    }
  }
  return result;
}

uint64_t __54__CIFilter_CIFilterRegistry__filterNamesInCategories___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v2 = (void *)registeredFilterConstructors;
  uint64_t result = [(id)registeredFilterConstructors countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend((id)objc_msgSend((id)registeredFilterConstructors, "valueForKey:", v7), "objectForKey:", @"CIAttributeFilterCategories");
        if (objc_msgSend(*(id *)(a1 + 32), "isSubsetOfSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v8)))objc_msgSend(*(id *)(a1 + 40), "addObject:", v7); {
        ++v6;
        }
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

+ (void)registerFilterName:(NSString *)name constructor:(id)anObject classAttributes:(NSDictionary *)attributes
{
  if (name)
  {
    if (!anObject) {
      NSLog(&cfstr_CifilterRegist_0.isa, a2, name);
    }
    uint64_t v8 = objc_opt_class();
    if (v8 == objc_opt_class())
    {
      NSLog(&cfstr_CifilterRegist_1.isa, v9, name);
    }
    else
    {
      SEL v10 = NSSelectorFromString(&cfstr_Filterwithname.isa);
      if (objc_opt_respondsToSelector())
      {
        if ((id)objc_opt_class() == anObject)
        {
          if ([anObject isSubclassOfClass:objc_opt_class()])
          {
            uint64_t v12 = [anObject methodForSelector:v10];
            if (v12 == +[CIFilter methodForSelector:v10]) {
              NSLog(&cfstr_CifilterRegist_3.isa, name);
            }
          }
        }
        id v13 = (id)[(NSDictionary *)attributes mutableCopy];
        if (!v13) {
          id v13 = (id)[MEMORY[0x1E4F1CA60] dictionary];
        }
        if (anObject) {
          [v13 setObject:anObject forKey:kCIConstructorKey];
        }
        uint64_t v14 = filterRegistryIsolationQueue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __77__CIFilter_CIFilterRegistry__registerFilterName_constructor_classAttributes___block_invoke;
        block[3] = &unk_1E57710E0;
        block[4] = v13;
        void block[5] = name;
        dispatch_sync(v14, block);
        uint64_t v15 = [MEMORY[0x1E4F28EA0] notificationWithName:kCIFilterAddedNotification object:name];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EC0], "defaultQueue"), "enqueueNotification:postingStyle:coalesceMask:forModes:", v15, 1, 0, 0);
      }
      else
      {
        NSLog(&cfstr_CifilterRegist_2.isa, v11, name);
      }
    }
  }
  else
  {
    NSLog(&cfstr_CifilterRegist.isa, a2);
  }
}

uint64_t __77__CIFilter_CIFilterRegistry__registerFilterName_constructor_classAttributes___block_invoke(uint64_t a1)
{
  id v2 = (id)registeredFilterConstructors;
  if (!registeredFilterConstructors)
  {
    id v2 = (id)[MEMORY[0x1E4F1CA60] dictionary];
    registeredFilterConstructors = (uint64_t)v2;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 setObject:v3 forKey:v4];
}

+ (NSString)localizedNameForFilterName:(NSString *)filterName
{
  id v3 = +[CIFilterClassAttributes classAttributesForName:filterName];

  return (NSString *)[v3 valueForKey:@"CIAttributeFilterDisplayName"];
}

+ (NSString)localizedNameForCategory:(NSString *)category
{
  uint64_t v4 = (void *)bundleForCIFilter();

  return (NSString *)[v4 localizedStringForKey:category value:0 table:@"Categories"];
}

+ (NSString)localizedDescriptionForFilterName:(NSString *)filterName
{
  uint64_t v4 = (NSString *)objc_msgSend(+[CIFilterClassAttributes classAttributesForName:](CIFilterClassAttributes, "classAttributesForName:"), "valueForKey:", @"CIAttributeDescription");
  Class v5 = NSClassFromString(filterName);
  if (v4) {
    return v4;
  }
  uint64_t v7 = v5;
  if (classNameIsSystemFilter(filterName))
  {
    uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:v7];
    uint64_t v9 = [(NSString *)filterName stringByAppendingString:@".description"];
    SEL v10 = @"Filters";
    uint64_t v11 = (void *)v8;
    uint64_t v12 = 0;
  }
  else
  {
    if (!classIsBuiltinFilter(v7)) {
      return filterName;
    }
    id v13 = (void *)bundleForCIFilter();
    uint64_t v12 = [v13 localizedStringForKey:filterName value:0 table:@"Filters"];
    SEL v10 = @"Descriptions";
    uint64_t v11 = v13;
    uint64_t v9 = filterName;
  }

  return (NSString *)[v11 localizedStringForKey:v9 value:v12 table:v10];
}

+ (NSURL)localizedReferenceDocumentationForFilterName:(NSString *)filterName
{
  id v3 = +[CIFilterClassAttributes classAttributesForName:filterName];

  return (NSURL *)[v3 valueForKey:@"CIAttributeReferenceDocumentation"];
}

- (int)compatibilityVersion
{
  id v2 = (void *)[(CIFilter *)self valueForKey:@"__inputVersion"];

  return [v2 intValue];
}

+ (CIFilter)filterWithName:(id)a3 compatibilityVersion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  Class v5 = (CIFilter *)[a1 filterWithName:a3];
  if (v4 != -1) {
    -[CIFilter setValue:forKey:](v5, "setValue:forKey:", [NSNumber numberWithInt:v4], @"__inputVersion");
  }
  return v5;
}

+ (CIFilter)filterWithName:(id)a3 compatibilityVersion:(int)a4 keysAndValues:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = +[CIFilter filterWithName:a3];
  if (v6 != -1) {
    -[CIFilter setValue:forKey:](v7, "setValue:forKey:", [NSNumber numberWithInt:v6], @"__inputVersion");
  }
  if (v7)
  {
    SEL v10 = &v11;
    if (a5)
    {
      do
      {
        [(CIFilter *)v7 setValue:*v10 forKey:a5];
        uint64_t v8 = (id *)(v10 + 1);
        v10 += 2;
        a5 = *v8;
      }
      while (*v8);
    }
  }
  return v7;
}

+ (id)allCategories:(BOOL)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v21 = @"CICategoryGeometryAdjustment";
    uint64_t v22 = @"CICategoryDistortionEffect";
    uint64_t v23 = @"CICategoryBlur";
    BOOL v24 = @"CICategorySharpen";
    char v25 = @"CICategoryColorAdjustment";
    char v26 = @"CICategoryColorEffect";
    char v27 = @"CICategoryStylize";
    char v28 = @"CICategoryHalftoneEffect";
    char v29 = @"CICategoryTileEffect";
    BOOL v30 = @"CICategoryGenerator";
    char v31 = @"CICategoryReduction";
    char v32 = @"CICategoryGradient";
    char v33 = @"CICategoryTransition";
    char v34 = @"CICategoryCompositeOperation";
    char v35 = @"CICategoryApplePrivate";
    id v3 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v4 = &v21;
    uint64_t v5 = 15;
  }
  else
  {
    uint64_t v7 = @"CICategoryGeometryAdjustment";
    uint64_t v8 = @"CICategoryDistortionEffect";
    uint64_t v9 = @"CICategoryBlur";
    SEL v10 = @"CICategorySharpen";
    uint64_t v11 = @"CICategoryColorAdjustment";
    uint64_t v12 = @"CICategoryColorEffect";
    id v13 = @"CICategoryStylize";
    uint64_t v14 = @"CICategoryHalftoneEffect";
    uint64_t v15 = @"CICategoryTileEffect";
    char v16 = @"CICategoryGenerator";
    long long v17 = @"CICategoryReduction";
    long long v18 = @"CICategoryGradient";
    long long v19 = @"CICategoryTransition";
    long long v20 = @"CICategoryCompositeOperation";
    id v3 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v4 = &v7;
    uint64_t v5 = 14;
  }
  return (id)objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21,
               v22,
               v23,
               v24,
               v25,
               v26,
               v27,
               v28,
               v29,
               v30,
               v31,
               v32,
               v33,
               v34,
               v35,
               v36);
}

+ (void)unregisterFilterName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = filterRegistryIsolationQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__CIFilter_CIFilterRegistryPrivate__unregisterFilterName___block_invoke;
    block[3] = &unk_1E5771BE8;
    block[4] = a3;
    dispatch_sync(v4, block);
  }
  else
  {
    NSLog(&cfstr_CifilterUnregi.isa, a2);
  }
}

uint64_t __58__CIFilter_CIFilterRegistryPrivate__unregisterFilterName___block_invoke(uint64_t result)
{
  if (registeredFilterConstructors) {
    return [(id)registeredFilterConstructors removeObjectForKey:*(void *)(result + 32)];
  }
  return result;
}

+ (CIFilter)filterWithImageURL:(NSURL *)url options:(NSDictionary *)options
{
  if ([(NSURL *)url isFileURL]
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isReadableFileAtPath:", -[NSURL path](url, "path")) & 1) == 0)
  {
    uint64_t v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CIFilter(CIRAWFilter) filterWithImageURL:options:]((uint64_t)url, v7);
    }
    return 0;
  }
  else
  {
    return (CIFilter *)+[CIRAWFilterImpl filterWithImageURL:url options:options];
  }
}

+ (CIFilter)filterWithImageData:(NSData *)data options:(NSDictionary *)options
{
  return (CIFilter *)+[CIRAWFilterImpl filterWithImageData:data options:options];
}

+ (CIFilter)filterWithCVPixelBuffer:(CVPixelBufferRef)pixelBuffer properties:(NSDictionary *)properties options:(NSDictionary *)options
{
  return (CIFilter *)+[CIRAWFilterImpl filterWithCVPixelBuffer:pixelBuffer properties:properties options:options];
}

+ (NSArray)supportedRawCameraModels
{
  return (NSArray *)+[CIRAWFilterImpl supportedRawCameraModels];
}

- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inoutSpace:(CGColorSpace *)a6
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSLog(&cfstr_KernelShouldBe.isa, [a3 name]);
    return 0;
  }
  if (a6) {
    id v8 = (id)[v8 imageByColorMatchingWorkingSpaceToColorSpace:a6];
  }
  v12[0] = v8;
  uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 1), "arrayByAddingObjectsFromArray:", a5);
  [v8 extent];
  id result = (id)objc_msgSend(a3, "applyWithExtent:arguments:", v10);
  if (a6) {
    return (id)[result imageByColorMatchingColorSpaceToWorkingSpace:a6];
  }
  return result;
}

- (id)apply:(id)a3 image:(id)a4 arguments:(id)a5 inSpace:(CGColorSpace *)a6
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSLog(&cfstr_KernelShouldBe.isa, [a3 name]);
    return 0;
  }
  if (a6) {
    id v8 = (id)[v8 imageByColorMatchingWorkingSpaceToColorSpace:a6];
  }
  v12[0] = v8;
  uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 1), "arrayByAddingObjectsFromArray:", a5);
  [v8 extent];
  return (id)objc_msgSend(a3, "applyWithExtent:arguments:", v10);
}

+ (id)metalFilterWithName:(id)a3 withInputParameters:(id)a4
{
  if (a4) {
    id v5 = a4;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CC08];
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  [v6 setObject:a3 forKeyedSubscript:@"inputFilterName"];

  return +[CIFilter filterWithName:@"CIMetalWrapper" withInputParameters:v6];
}

+ (id)metalFilterWithName:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"inputFilterName";
  v5[0] = a3;
  return +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CIMetalWrapper", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

+ (int)minSDOFRenderingVersionSupported
{
  return 4;
}

+ (int)maxSDOFRenderingVersionSupported
{
  SEL v2 = NSSelectorFromString(&cfstr_Getunifiedrend.isa);
  if (!v2) {
    return 4;
  }
  SEL v3 = v2;
  envCCSDOFMetadataClass();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 4;
  }
  uint64_t v6 = (uint64_t (*)(uint64_t, SEL))[(id)envCCSDOFMetadataClass() methodForSelector:v3];
  uint64_t v4 = envCCSDOFMetadataClass();

  return v6(v4, v3);
}

+ (int)getMinMaxSimulatedApertureFrom:(__CFData *)a3 minValue:(float *)a4 maxValue:(float *)a5 version:(int *)a6
{
  int v6 = -1;
  if (!a4) {
    return v6;
  }
  if (!a5) {
    return v6;
  }
  if (!a6) {
    return v6;
  }
  *a4 = 0.0;
  *a5 = 0.0;
  *a6 = 0;
  if (!a3) {
    return v6;
  }
  uint64_t v59 = 0;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  memset(v35, 0, sizeof(v35));
  if ((unint64_t)[(__CFData *)a3 length] < 0xC) {
    return 1;
  }
  [(__CFData *)a3 getBytes:v33 length:12];
  int v11 = v34;
  *a6 = v34;
  switch(v11)
  {
    case 3:
      int v12 = FigDepthBlurEffectRenderingParametersV3FromCFData(a3, v35);
      break;
    case 2:
      int v12 = FigDepthBlurEffectRenderingParametersV2FromCFData(a3, (char *)v35, &v32);
      break;
    case 1:
      int v12 = FigDepthBlurEffectRenderingParametersV1FromCFData(a3, v35);
      break;
    default:
      goto LABEL_17;
  }
  int v6 = v12;
  int v11 = *a6;
  if (v12) {
    goto LABEL_18;
  }
  if (v11 == 3 || v11 == 2)
  {
    int v6 = 0;
    *a4 = *((float *)&v36 + 1);
    *a5 = *((float *)&v46 + 3);
    return v6;
  }
LABEL_17:
  int v6 = 1;
LABEL_18:
  if (v11 >= 4)
  {
    if (v11 <= +[CIFilter maxSDOFRenderingVersionSupported])
    {
      SEL v14 = NSSelectorFromString(&cfstr_Getrenderingpa.isa);
      if (v14)
      {
        SEL v15 = v14;
        uint64_t v16 = [(id)envCCSDOFMetadataClass() methodForSelector:v14];
        if (v16)
        {
          long long v17 = (uint64_t (*)(uint64_t, SEL, __CFData *))v16;
          envCCSDOFMetadataClass();
          if (objc_opt_respondsToSelector())
          {
            uint64_t v18 = envCCSDOFMetadataClass();
            uint64_t v19 = v17(v18, v15, a3);
            if (v19)
            {
              long long v20 = (void *)v19;
              SEL v21 = NSSelectorFromString(&cfstr_Minsimulatedap.isa);
              if (v21)
              {
                SEL v22 = v21;
                uint64_t v23 = [(id)envCCSDOFMetadataClass() methodForSelector:v21];
                if (v23)
                {
                  BOOL v24 = (float (*)(uint64_t, SEL, void *))v23;
                  envCCSDOFMetadataClass();
                  if (objc_opt_respondsToSelector())
                  {
                    uint64_t v25 = envCCSDOFMetadataClass();
                    *a4 = v24(v25, v22, v20);
                  }
                }
              }
              SEL v26 = NSSelectorFromString(&cfstr_Maxsimulatedap.isa);
              if (v26)
              {
                SEL v27 = v26;
                uint64_t v28 = [(id)envCCSDOFMetadataClass() methodForSelector:v26];
                if (v28)
                {
                  char v29 = (float (*)(uint64_t, SEL, void *))v28;
                  envCCSDOFMetadataClass();
                  if (objc_opt_respondsToSelector())
                  {
                    uint64_t v30 = envCCSDOFMetadataClass();
                    *a5 = v29(v30, v27, v20);
                  }
                }
              }
              int v6 = *a4 <= 0.0 || *a5 <= 0.0;
              free(v20);
            }
          }
        }
      }
    }
    else
    {
      id v13 = ci_logger_render();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[CIFilter(PrivateDepthUtilities) getMinMaxSimulatedApertureFrom:minValue:maxValue:version:](a6, v13);
      }
      return 3;
    }
  }
  return v6;
}

- (void)apply:(uint64_t)a3 arguments:(uint64_t)a4 options:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)apply:(uint64_t)a3 arguments:(uint64_t)a4 options:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)apply:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = [(id)objc_opt_class() description];
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "[%{public}@ apply:...] First argument should be CIKernel.", (uint8_t *)&v3, 0xCu);
}

- (void)apply:(NSObject *)a3 .cold.2(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138543618;
  uint64_t v6 = [(id)objc_opt_class() description];
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_193671000, a3, OS_LOG_TYPE_ERROR, "[%{public}@ apply:...] Argument at index %d should be a CIImage, CISampler, CIVector, or NSNumber.", (uint8_t *)&v5, 0x12u);
}

@end