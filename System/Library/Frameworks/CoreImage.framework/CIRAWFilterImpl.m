@interface CIRAWFilterImpl
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)applyMatrix:(const double *)a3 toCIImage:(id)a4;
+ (id)customAttributes;
+ (id)filterWithCVPixelBuffer:(__CVBuffer *)a3 properties:(id)a4 options:(id)a5;
+ (id)filterWithImageData:(id)a3 options:(id)a4;
+ (id)filterWithImageURL:(id)a3 options:(id)a4;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
+ (id)matteOptionNameFromOptions:(id)a3;
+ (id)optionKeys;
+ (id)supportedRawCameraModels;
+ (void)convertNeutralTemperature:(id)a3 tint:(id)a4 toX:(id *)a5 y:(id *)a6;
+ (void)convertNeutralX:(id)a3 y:(id)a4 toTemperature:(id *)a5 tint:(id *)a6;
- (BOOL)isRawSource;
- (CGAffineTransform)getOrientationTransform:(SEL)a3;
- (CGAffineTransform)getScaleTransform:(SEL)a3;
- (CGSize)nativeSize;
- (CIRAWFilterImpl)init;
- (CIRAWFilterImpl)initWithCVPixelBuffer:(__CVBuffer *)a3 properties:(id)a4 options:(id)a5;
- (CIRAWFilterImpl)initWithImageSource:(CGImageSource *)a3 options:(id)a4;
- (NSArray)filters;
- (NSDictionary)rawDictionary;
- (NSDictionary)rawReconstructionDefaultsDictionary;
- (NSNumber)sushiMode;
- (id)RAWFiltersValueForKeyPath:(id)a3;
- (id)activeKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultBoostShadowAmount;
- (id)defaultDecoderVersion;
- (id)defaultImageOrientation;
- (id)defaultInputBaselineExposureAmount;
- (id)defaultInputBiasAmount;
- (id)defaultInputColorNoiseReductionAmount;
- (id)defaultInputEnableEDRMode;
- (id)defaultInputEnableVendorLensCorrection;
- (id)defaultInputHueMagBMAmount;
- (id)defaultInputHueMagCBAmount;
- (id)defaultInputHueMagGCAmount;
- (id)defaultInputHueMagMRAmount;
- (id)defaultInputHueMagRYAmount;
- (id)defaultInputHueMagYGAmount;
- (id)defaultInputLocalToneMapAmount;
- (id)defaultInputLuminanceNoiseReductionAmount;
- (id)defaultInputMoireAmount;
- (id)defaultInputNoiseReductionContrastAmount;
- (id)defaultInputNoiseReductionDetailAmount;
- (id)defaultInputNoiseReductionSharpnessAmount;
- (id)defaultInputReturnDemosaiced;
- (id)defaultNeutralChromaticityX;
- (id)defaultNeutralChromaticityY;
- (id)defaultNeutralTemperature;
- (id)defaultNeutralTint;
- (id)inputBaselineExposure;
- (id)inputBias;
- (id)inputDisableGamutMap;
- (id)inputHueMagBM;
- (id)inputHueMagCB;
- (id)inputHueMagGC;
- (id)inputHueMagMR;
- (id)inputHueMagRY;
- (id)inputHueMagYG;
- (id)inputImage;
- (id)inputLinearSpaceFilter;
- (id)inputNeutralChromaticityX;
- (id)inputNeutralChromaticityY;
- (id)inputNeutralLocation;
- (id)inputNeutralTemperature;
- (id)inputNeutralTint;
- (id)outputImage;
- (id)outputKeys;
- (id)outputNativeSize;
- (id)properties;
- (id)rawOptions;
- (id)rawOptionsWithSubsampling:(BOOL)a3;
- (id)supportedDecoderVersions;
- (id)supportedSushiModes;
- (id)transformedImageIgnoringOrientation:(BOOL)a3 andIgnoringScaleFactor:(BOOL)a4;
- (id)whitePoint;
- (id)whitePointArray;
- (int)rawMajorVersion;
- (int)subsampling;
- (void)dealloc;
- (void)getWhitePointVectorsR:(id *)a3 g:(id *)a4 b:(id *)a5;
- (void)invalidateFilters;
- (void)invalidateInputImage;
- (void)setDefaults;
- (void)setInputBaselineExposure:(id)a3;
- (void)setInputBias:(id)a3;
- (void)setInputBoost:(id)a3;
- (void)setInputBoostShadowAmount:(id)a3;
- (void)setInputColorNoiseReductionAmount:(id)a3;
- (void)setInputDecoderVersion:(id)a3;
- (void)setInputDisableGamutMap:(id)a3;
- (void)setInputDraftMode:(id)a3;
- (void)setInputEV:(id)a3;
- (void)setInputEnableEDRMode:(id)a3;
- (void)setInputEnableNoiseTracking:(id)a3;
- (void)setInputEnableSharpening:(id)a3;
- (void)setInputEnableVendorLensCorrection:(id)a3;
- (void)setInputHueMagBM:(id)a3;
- (void)setInputHueMagCB:(id)a3;
- (void)setInputHueMagGC:(id)a3;
- (void)setInputHueMagMR:(id)a3;
- (void)setInputHueMagRY:(id)a3;
- (void)setInputHueMagYG:(id)a3;
- (void)setInputIgnoreOrientation:(id)a3;
- (void)setInputImageOrientation:(id)a3;
- (void)setInputLinearSpaceFilter:(id)a3;
- (void)setInputLocalToneMapAmount:(id)a3;
- (void)setInputLuminanceNoiseReductionAmount:(id)a3;
- (void)setInputMoireAmount:(id)a3;
- (void)setInputNeutralChromaticityX:(id)a3;
- (void)setInputNeutralChromaticityY:(id)a3;
- (void)setInputNeutralLocation:(id)a3;
- (void)setInputNeutralTemperature:(id)a3;
- (void)setInputNeutralTint:(id)a3;
- (void)setInputNoiseReductionAmount:(id)a3;
- (void)setInputNoiseReductionContrastAmount:(id)a3;
- (void)setInputNoiseReductionDetailAmount:(id)a3;
- (void)setInputNoiseReductionSharpnessAmount:(id)a3;
- (void)setInputRequestedSushiMode:(id)a3;
- (void)setInputReturnDemosaiced:(id)a3;
- (void)setInputScaleFactor:(id)a3;
- (void)setTempTintAtPoint:(CGPoint)a3;
- (void)updateChomaticityXAndY;
- (void)updateTemperatureAndTint;
@end

@implementation CIRAWFilterImpl

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"outputImage"]) {
    return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"inputBoostShadowAmount", @"inputBaselineExposure", @"inputBias", @"inputEnableNoiseTracking", @"inputNoiseReductionAmount", @"inputLuminanceNoiseReductionAmount", @"inputColorNoiseReductionAmount", @"inputNoiseReductionSharpnessAmount", @"inputNoiseReductionContrastAmount", @"inputNoiseReductionDetailAmount", @"inputEnableVendorLensCorrection", @"inputEnableSharpening", @"inputBoost", @"inputNeutralChromaticityX", @"inputNeutralChromaticityY", @"inputNeutralLocation", @"inputScaleFactor",
  }
                 @"inputDraftMode",
                 @"inputIgnoreOrientation",
                 @"inputImageOrientation",
                 @"inputDecoderVersion",
                 @"inputEV",
                 @"inputDisableGamutMap",
                 @"inputLinearSpaceFilter",
                 @"inputMoireAmount",
                 @"inputReturnDemosaiced",
                 @"inputEnableEDRMode",
                 @"inputLocalToneMapAmount",
                 0);
  if ([a3 isEqualToString:@"outputNativeSize"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    return (id)[v6 setWithObject:@"inputDecoderVersion"];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CIRAWFilterImpl;
    return objc_msgSendSuper2(&v7, sel_keyPathsForValuesAffectingValueForKey_, a3);
  }
}

+ (id)filterWithImageData:(id)a3 options:(id)a4
{
  id result = CGImageSourceCreateWithData((CFDataRef)a3, (CFDictionaryRef)a4);
  if (result)
  {
    id v7 = result;
    id v8 = (id)[objc_alloc((Class)a1) initWithImageSource:result options:a4];
    CFRelease(v7);
    return v8;
  }
  return result;
}

+ (id)filterWithImageURL:(id)a3 options:(id)a4
{
  if ([a3 isFileURL])
  {
    uint64_t v7 = *MEMORY[0x1E4F2FF78];
    if (![a4 objectForKeyedSubscript:*MEMORY[0x1E4F2FF78]])
    {
      objc_msgSend((id)objc_msgSend(a3, "path"), "pathExtension");
      uint64_t TypeWithExtension = CGImageSourceGetTypeWithExtension();
      a4 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a4];
      [a4 setObject:TypeWithExtension forKeyedSubscript:v7];
    }
  }
  id result = CGImageSourceCreateWithURL((CFURLRef)a3, (CFDictionaryRef)a4);
  if (result)
  {
    id v10 = result;
    id v11 = (id)[objc_alloc((Class)a1) initWithImageSource:result options:a4];
    CFRelease(v10);
    return v11;
  }
  return result;
}

+ (id)filterWithCVPixelBuffer:(__CVBuffer *)a3 properties:(id)a4 options:(id)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithCVPixelBuffer:a3 properties:a4 options:a5];

  return v5;
}

+ (id)supportedRawCameraModels
{
  CFArrayRef v2 = CGImageSourceCopyTypeIdentifiers();
  if (v2) {
    CFRelease(v2);
  }
  v3 = (uint64_t (*)(uint64_t))dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CreateListOfSupportedCamerasAndVersions");
  if (v3)
  {
    v4 = (const void *)v3(1);
    v3 = (id)CFMakeCollectable(v4);
  }
  v5 = (void *)[v3 allKeys];

  return (id)[v5 sortedArrayUsingSelector:sel_compare_];
}

- (CIRAWFilterImpl)init
{
  v3.receiver = self;
  v3.super_class = (Class)CIRAWFilterImpl;
  return [(CIRAWFilterImpl *)&v3 init];
}

- (void)dealloc
{
  inputImageSource = self->_inputImageSource;
  if (inputImageSource)
  {
    CFRelease(inputImageSource);
    self->_inputImageSource = 0;
  }

  self->_inputImageAndProperties = 0;
  self->_baseImageProperties = 0;

  self->_rawDictionary = 0;
  self->_rawReconstructionDefaultsDictionary = 0;

  self->_supportedSushiModes = 0;
  self->_supportedDecoderVersions = 0;

  self->_filters = 0;
  self->_typeIdentifierHint = 0;

  self->_inputImage = 0;
  self->_defaultOrientation = 0;

  self->inputNeutralChromaticityX = 0;
  self->inputNeutralChromaticityY = 0;

  self->inputNeutralTemperature = 0;
  self->inputNeutralTint = 0;

  self->inputNeutralLocation = 0;
  self->inputEV = 0;

  self->inputBoost = 0;
  self->inputDraftMode = 0;

  self->inputScaleFactor = 0;
  self->inputIgnoreOrientation = 0;

  self->inputImageOrientation = 0;
  self->inputEnableSharpening = 0;

  self->inputEnableNoiseTracking = 0;
  self->inputNoiseReductionAmount = 0;

  self->inputEnableVendorLensCorrection = 0;
  self->inputLuminanceNoiseReductionAmount = 0;

  self->inputColorNoiseReductionAmount = 0;
  self->inputNoiseReductionSharpnessAmount = 0;

  self->inputNoiseReductionContrastAmount = 0;
  self->inputNoiseReductionDetailAmount = 0;

  self->inputMoireAmount = 0;
  self->inputDecoderVersion = 0;

  self->inputBoostShadowAmount = 0;
  self->inputBias = 0;

  self->inputLinearSpaceFilter = 0;
  self->inputBaselineExposure = 0;

  self->inputHueMagMR = 0;
  self->inputHueMagRY = 0;

  self->inputHueMagYG = 0;
  self->inputHueMagGC = 0;

  self->inputHueMagCB = 0;
  self->inputHueMagBM = 0;

  self->inputDisableGamutMap = 0;
  self->inputEnableEDRMode = 0;

  self->inputLocalToneMapAmount = 0;
  self->inputReturnDemosaiced = 0;
  self->_calledDealloc = 1;
  v4.receiver = self;
  v4.super_class = (Class)CIRAWFilterImpl;
  [(CIFilter *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  [v4 setDefaults];
  *((void *)v4 + 10) = self->_inputImageSource;
  inputImageSource = self->_inputImageSource;
  if (inputImageSource) {
    CFRetain(inputImageSource);
  }
  v4[121] = 0;
  v4[120] = self->_isRawSource;
  *(CGSize *)(v4 + 104) = self->_nativeSize;
  *((void *)v4 + 11) = [(NSArray *)self->_inputImageAndProperties copy];
  *((void *)v4 + 17) = [(NSDictionary *)self->_baseImageProperties copy];
  *((void *)v4 + 18) = (id)dictionaryDeepCopy(self->_rawDictionary);
  *((void *)v4 + 19) = (id)dictionaryDeepCopy(self->_rawReconstructionDefaultsDictionary);
  *((void *)v4 + 20) = [(NSArray *)self->_supportedSushiModes copy];
  *((void *)v4 + 21) = [(NSArray *)self->_supportedDecoderVersions copy];
  *((void *)v4 + 23) = [self->_typeIdentifierHint copy];
  *((void *)v4 + 24) = [(NSNumber *)self->_defaultOrientation copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = objc_msgSend((id)objc_opt_class(), "optionKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [(CIRAWFilterImpl *)self valueForKey:v11];
        if (v12) {
          [v4 setValue:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  return v4;
}

- (void)setDefaults
{
  [(CIRAWFilterImpl *)self setInputLuminanceNoiseReductionAmount:[(CIRAWFilterImpl *)self defaultInputLuminanceNoiseReductionAmount]];
  [(CIRAWFilterImpl *)self setInputColorNoiseReductionAmount:[(CIRAWFilterImpl *)self defaultInputColorNoiseReductionAmount]];
  [(CIRAWFilterImpl *)self setInputNoiseReductionContrastAmount:[(CIRAWFilterImpl *)self defaultInputNoiseReductionContrastAmount]];
  [(CIRAWFilterImpl *)self setInputNoiseReductionDetailAmount:[(CIRAWFilterImpl *)self defaultInputNoiseReductionDetailAmount]];
  [(CIRAWFilterImpl *)self setInputNoiseReductionSharpnessAmount:[(CIRAWFilterImpl *)self defaultInputNoiseReductionSharpnessAmount]];
  [(CIRAWFilterImpl *)self setInputMoireAmount:[(CIRAWFilterImpl *)self defaultInputMoireAmount]];
  [(CIRAWFilterImpl *)self setInputEnableVendorLensCorrection:[(CIRAWFilterImpl *)self defaultInputEnableVendorLensCorrection]];
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  [(CIRAWFilterImpl *)self setInputIgnoreOrientation:MEMORY[0x1E4F1CC28]];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(CIRAWFilterImpl *)self setInputEnableNoiseTracking:MEMORY[0x1E4F1CC38]];
  [(CIRAWFilterImpl *)self setInputNoiseReductionAmount:&unk_1EE4A98B0];
  [(CIRAWFilterImpl *)self setInputEnableSharpening:v4];
  [(CIRAWFilterImpl *)self setInputDraftMode:v3];
  [(CIRAWFilterImpl *)self setInputScaleFactor:&unk_1EE4A98C0];
  [(CIRAWFilterImpl *)self setInputBoost:&unk_1EE4A98C0];
  [(CIRAWFilterImpl *)self setInputBoostShadowAmount:[(CIRAWFilterImpl *)self defaultBoostShadowAmount]];
  [(CIRAWFilterImpl *)self setInputImageOrientation:[(CIRAWFilterImpl *)self defaultImageOrientation]];
  [(CIRAWFilterImpl *)self setInputDecoderVersion:[(CIRAWFilterImpl *)self defaultDecoderVersion]];
  [(CIRAWFilterImpl *)self setInputEV:&unk_1EE4A98B0];
  [(CIRAWFilterImpl *)self setInputBaselineExposure:[(CIRAWFilterImpl *)self defaultInputBaselineExposureAmount]];
  [(CIRAWFilterImpl *)self setInputBias:[(CIRAWFilterImpl *)self defaultInputBiasAmount]];
  [(CIRAWFilterImpl *)self setInputHueMagMR:[(CIRAWFilterImpl *)self defaultInputHueMagMRAmount]];
  [(CIRAWFilterImpl *)self setInputHueMagRY:[(CIRAWFilterImpl *)self defaultInputHueMagRYAmount]];
  [(CIRAWFilterImpl *)self setInputHueMagYG:[(CIRAWFilterImpl *)self defaultInputHueMagYGAmount]];
  [(CIRAWFilterImpl *)self setInputHueMagGC:[(CIRAWFilterImpl *)self defaultInputHueMagGCAmount]];
  [(CIRAWFilterImpl *)self setInputHueMagCB:[(CIRAWFilterImpl *)self defaultInputHueMagCBAmount]];
  [(CIRAWFilterImpl *)self setInputHueMagBM:[(CIRAWFilterImpl *)self defaultInputHueMagBMAmount]];
  [(CIRAWFilterImpl *)self setInputDisableGamutMap:v3];
  [(CIRAWFilterImpl *)self setInputNeutralTemperature:[(CIRAWFilterImpl *)self defaultNeutralTemperature]];
  [(CIRAWFilterImpl *)self setInputNeutralTint:[(CIRAWFilterImpl *)self defaultNeutralTint]];
  [(CIRAWFilterImpl *)self setInputNeutralChromaticityX:[(CIRAWFilterImpl *)self defaultNeutralChromaticityX]];
  [(CIRAWFilterImpl *)self setInputNeutralChromaticityY:[(CIRAWFilterImpl *)self defaultNeutralChromaticityY]];
  [(CIRAWFilterImpl *)self setInputEnableEDRMode:[(CIRAWFilterImpl *)self defaultInputEnableEDRMode]];
  [(CIRAWFilterImpl *)self setInputLocalToneMapAmount:[(CIRAWFilterImpl *)self defaultInputLocalToneMapAmount]];
  id v5 = [(CIRAWFilterImpl *)self defaultInputReturnDemosaiced];

  [(CIRAWFilterImpl *)self setInputReturnDemosaiced:v5];
}

+ (id)customAttributes
{
  v77[36] = *MEMORY[0x1E4F143B8];
  v76[0] = @"inputLuminanceNoiseReductionAmount";
  v74[0] = @"CIAttributeClass";
  v74[1] = @"CIAttributeDefault";
  v75[0] = @"NSNumber";
  v75[1] = &unk_1EE4A98B0;
  v74[2] = @"CIAttributeMin";
  v74[3] = @"CIAttributeMax";
  v75[2] = &unk_1EE4A98B0;
  v75[3] = &unk_1EE4A98C0;
  v74[4] = @"CIAttributeType";
  v75[4] = @"CIAttributeTypeScalar";
  v77[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:5];
  v76[1] = @"inputColorNoiseReductionAmount";
  v72[0] = @"CIAttributeClass";
  v72[1] = @"CIAttributeDefault";
  v73[0] = @"NSNumber";
  v73[1] = &unk_1EE4A98B0;
  v72[2] = @"CIAttributeMin";
  v72[3] = @"CIAttributeMax";
  v73[2] = &unk_1EE4A98B0;
  v73[3] = &unk_1EE4A98C0;
  v72[4] = @"CIAttributeType";
  v73[4] = @"CIAttributeTypeScalar";
  v77[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:5];
  v76[2] = @"inputMoireAmount";
  v70[0] = @"CIAttributeClass";
  v70[1] = @"CIAttributeDefault";
  v71[0] = @"NSNumber";
  v71[1] = &unk_1EE4A98B0;
  v70[2] = @"CIAttributeMin";
  v70[3] = @"CIAttributeMax";
  v71[2] = &unk_1EE4A98B0;
  v71[3] = &unk_1EE4A98C0;
  v70[4] = @"CIAttributeType";
  v71[4] = @"CIAttributeTypeScalar";
  v77[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:5];
  v76[3] = @"inputNoiseReductionContrastAmount";
  v68[0] = @"CIAttributeClass";
  v68[1] = @"CIAttributeDefault";
  v69[0] = @"NSNumber";
  v69[1] = &unk_1EE4A98B0;
  v68[2] = @"CIAttributeMin";
  v68[3] = @"CIAttributeMax";
  v69[2] = &unk_1EE4A98B0;
  v69[3] = &unk_1EE4A98C0;
  v68[4] = @"CIAttributeType";
  v69[4] = @"CIAttributeTypeScalar";
  v77[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:5];
  v76[4] = @"inputNoiseReductionDetailAmount";
  v66[0] = @"CIAttributeClass";
  v66[1] = @"CIAttributeDefault";
  v67[0] = @"NSNumber";
  v67[1] = &unk_1EE4A98B0;
  v66[2] = @"CIAttributeMin";
  v66[3] = @"CIAttributeMax";
  v67[2] = &unk_1EE4A98B0;
  v67[3] = &unk_1EE4A98C0;
  v66[4] = @"CIAttributeType";
  v67[4] = @"CIAttributeTypeScalar";
  v77[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:5];
  v76[5] = @"inputNoiseReductionSharpnessAmount";
  v64[0] = @"CIAttributeClass";
  v64[1] = @"CIAttributeDefault";
  v65[0] = @"NSNumber";
  v65[1] = &unk_1EE4A98B0;
  v64[2] = @"CIAttributeMin";
  v64[3] = @"CIAttributeMax";
  v65[2] = &unk_1EE4A98B0;
  v65[3] = &unk_1EE4A98C0;
  v64[4] = @"CIAttributeType";
  v65[4] = @"CIAttributeTypeScalar";
  v77[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:5];
  v76[6] = @"inputEnableVendorLensCorrection";
  v62[0] = @"CIAttributeClass";
  v62[1] = @"CIAttributeDefault";
  v63[0] = @"NSNumber";
  v63[1] = MEMORY[0x1E4F1CC38];
  v62[2] = @"CIAttributeType";
  v63[2] = @"CIAttributeTypeBoolean";
  v77[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:3];
  v76[7] = @"inputIgnoreOrientation";
  v60[0] = @"CIAttributeClass";
  v60[1] = @"CIAttributeDefault";
  v61[0] = @"NSNumber";
  v61[1] = MEMORY[0x1E4F1CC28];
  v60[2] = @"CIAttributeType";
  v61[2] = @"CIAttributeTypeBoolean";
  v77[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
  v76[8] = @"inputEnableNoiseTracking";
  v58[0] = @"CIAttributeClass";
  v58[1] = @"CIAttributeDefault";
  v59[0] = @"NSNumber";
  v59[1] = MEMORY[0x1E4F1CC38];
  v58[2] = @"CIAttributeType";
  v59[2] = @"CIAttributeTypeBoolean";
  v77[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
  v76[9] = @"inputNoiseReductionAmount";
  v56[0] = @"CIAttributeClass";
  v56[1] = @"CIAttributeMin";
  v57[0] = @"NSNumber";
  v57[1] = &unk_1EE4A98B0;
  v56[2] = @"CIAttributeMax";
  v56[3] = @"CIAttributeType";
  v57[2] = &unk_1EE4A98C0;
  v57[3] = @"CIAttributeTypeScalar";
  v77[9] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];
  v76[10] = @"inputEnableSharpening";
  v54[0] = @"CIAttributeClass";
  v54[1] = @"CIAttributeDefault";
  v55[0] = @"NSNumber";
  v55[1] = MEMORY[0x1E4F1CC38];
  v54[2] = @"CIAttributeType";
  v55[2] = @"CIAttributeTypeBoolean";
  v77[10] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
  v76[11] = @"inputDraftMode";
  v52[0] = @"CIAttributeClass";
  v52[1] = @"CIAttributeDefault";
  v53[0] = @"NSNumber";
  v53[1] = MEMORY[0x1E4F1CC28];
  v52[2] = @"CIAttributeType";
  v53[2] = @"CIAttributeTypeBoolean";
  v77[11] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  v76[12] = @"inputScaleFactor";
  v50[0] = @"CIAttributeClass";
  v50[1] = @"CIAttributeDefault";
  v51[0] = @"NSNumber";
  v51[1] = &unk_1EE4A98C0;
  v50[2] = @"CIAttributeMin";
  v50[3] = @"CIAttributeMax";
  v51[2] = &unk_1EE4A98B0;
  v51[3] = &unk_1EE4A98C0;
  v50[4] = @"CIAttributeIdentity";
  v50[5] = @"CIAttributeType";
  v51[4] = &unk_1EE4A98C0;
  v51[5] = @"CIAttributeTypeScalar";
  v77[12] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:6];
  v76[13] = @"inputBoost";
  v48[0] = @"CIAttributeClass";
  v48[1] = @"CIAttributeDefault";
  v49[0] = @"NSNumber";
  v49[1] = &unk_1EE4A98C0;
  v48[2] = @"CIAttributeMin";
  v48[3] = @"CIAttributeMax";
  v49[2] = &unk_1EE4A98B0;
  v49[3] = &unk_1EE4A98C0;
  v48[4] = @"CIAttributeIdentity";
  v48[5] = @"CIAttributeType";
  v49[4] = &unk_1EE4A98B0;
  v49[5] = @"CIAttributeTypeScalar";
  v77[13] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:6];
  v76[14] = @"inputBoostShadowAmount";
  v46[0] = @"CIAttributeClass";
  v46[1] = @"CIAttributeDefault";
  v47[0] = @"NSNumber";
  v47[1] = &unk_1EE4A98B0;
  v46[2] = @"CIAttributeMin";
  v46[3] = @"CIAttributeMax";
  v47[2] = &unk_1EE4A98B0;
  v47[3] = &unk_1EE4A98D0;
  v46[4] = @"CIAttributeType";
  v47[4] = @"CIAttributeTypeScalar";
  v77[14] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:5];
  v76[15] = @"inputImageOrientation";
  v44[0] = @"CIAttributeClass";
  v44[1] = @"CIAttributeDefault";
  v45[0] = @"NSNumber";
  v45[1] = &unk_1EE4AAD30;
  v44[2] = @"CIAttributeMin";
  v44[3] = @"CIAttributeMax";
  v45[2] = &unk_1EE4AAD30;
  v45[3] = &unk_1EE4AAD48;
  v44[4] = @"CIAttributeIdentity";
  v44[5] = @"CIAttributeType";
  v45[4] = &unk_1EE4AAD30;
  v45[5] = @"CIAttributeTypeInteger";
  v77[15] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:6];
  v76[16] = @"inputDecoderVersion";
  v42[0] = @"CIAttributeClass";
  v42[1] = @"CIAttributeDefault";
  v43[0] = @"NSString";
  v43[1] = &unk_1EE4AAD60;
  v42[2] = *MEMORY[0x1E4F2FED0];
  v43[2] = &unk_1EE4AB918;
  v77[16] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
  v76[17] = @"inputEV";
  v40[0] = @"CIAttributeClass";
  v40[1] = @"CIAttributeDefault";
  v41[0] = @"NSNumber";
  v41[1] = &unk_1EE4A98B0;
  v40[2] = @"CIAttributeSliderMin";
  v40[3] = @"CIAttributeSliderMax";
  v41[2] = &unk_1EE4A98E0;
  v41[3] = &unk_1EE4A98F0;
  v40[4] = @"CIAttributeIdentity";
  v40[5] = @"CIAttributeType";
  v41[4] = &unk_1EE4A98B0;
  v41[5] = @"CIAttributeTypeScalar";
  v77[17] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:6];
  v76[18] = @"inputBaselineExposure";
  v38[0] = @"CIAttributeClass";
  v38[1] = @"CIAttributeDefault";
  v39[0] = @"NSNumber";
  v39[1] = &unk_1EE4A98B0;
  v38[2] = @"CIAttributeIdentity";
  v38[3] = @"CIAttributeType";
  v39[2] = &unk_1EE4A98B0;
  v39[3] = @"CIAttributeTypeScalar";
  v77[18] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];
  v76[19] = @"inputBias";
  v36[0] = @"CIAttributeClass";
  v36[1] = @"CIAttributeDefault";
  v37[0] = @"NSNumber";
  v37[1] = &unk_1EE4A98B0;
  v36[2] = @"CIAttributeMin";
  v36[3] = @"CIAttributeMax";
  v37[2] = &unk_1EE4A98E0;
  v37[3] = &unk_1EE4A9900;
  v36[4] = @"CIAttributeIdentity";
  v36[5] = @"CIAttributeType";
  v37[4] = &unk_1EE4A98B0;
  v37[5] = @"CIAttributeTypeScalar";
  v77[19] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:6];
  v76[20] = @"inputLinearSpaceFilter";
  v34 = @"CIAttributeClass";
  v35 = @"CIFilter";
  v77[20] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v76[21] = @"inputNeutralLocation";
  v32[0] = @"CIAttributeClass";
  v32[1] = @"CIAttributeType";
  v33[0] = @"CIVector";
  v33[1] = @"CIAttributeTypePosition";
  v77[21] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  v76[22] = @"inputNeutralTemperature";
  v30[0] = @"CIAttributeClass";
  v30[1] = @"CIAttributeDefault";
  v31[0] = @"NSNumber";
  v31[1] = &unk_1EE4AAE08;
  v30[2] = @"CIAttributeMin";
  v30[3] = @"CIAttributeSliderMin";
  v31[2] = &unk_1EE4AAE20;
  v31[3] = &unk_1EE4AAE08;
  v30[4] = @"CIAttributeSliderMax";
  v30[5] = @"CIAttributeMax";
  v31[4] = &unk_1EE4A9910;
  v31[5] = &unk_1EE4A9920;
  v30[6] = @"CIAttributeType";
  v31[6] = @"CIAttributeTypeScalar";
  v77[22] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:7];
  v76[23] = @"inputNeutralTint";
  v28[0] = @"CIAttributeClass";
  v28[1] = @"CIAttributeDefault";
  v29[0] = @"NSNumber";
  v29[1] = &unk_1EE4AAD78;
  v28[2] = @"CIAttributeMin";
  v28[3] = @"CIAttributeMax";
  v29[2] = &unk_1EE4A9930;
  v29[3] = &unk_1EE4A9940;
  v28[4] = @"CIAttributeType";
  v29[4] = @"CIAttributeTypeScalar";
  v77[23] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:5];
  v76[24] = @"inputNeutralChromaticityX";
  v26[0] = @"CIAttributeClass";
  v26[1] = @"CIAttributeDefault";
  v27[0] = @"NSNumber";
  v27[1] = &unk_1EE4A9950;
  v26[2] = @"CIAttributeType";
  v27[2] = @"CIAttributeTypeScalar";
  v77[24] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];
  v76[25] = @"inputNeutralChromaticityY";
  v24[0] = @"CIAttributeClass";
  v24[1] = @"CIAttributeDefault";
  v25[0] = @"NSNumber";
  v25[1] = &unk_1EE4A9950;
  v24[2] = @"CIAttributeType";
  v25[2] = @"CIAttributeTypeScalar";
  v77[25] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  v76[26] = @"inputDisableGamutMap";
  v22[0] = @"CIAttributeClass";
  v22[1] = @"CIAttributeDefault";
  v23[0] = @"NSNumber";
  uint64_t v2 = MEMORY[0x1E4F1CC28];
  v23[1] = MEMORY[0x1E4F1CC28];
  v22[2] = @"CIAttributeType";
  v23[2] = @"CIAttributeTypeBoolean";
  v77[26] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v76[27] = @"inputHueMagMR";
  v20[0] = @"CIAttributeClass";
  v20[1] = @"CIAttributeDefault";
  v21[0] = @"NSNumber";
  v21[1] = &unk_1EE4A98B0;
  v20[2] = @"CIAttributeType";
  v21[2] = @"CIAttributeTypeScalar";
  v77[27] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  v76[28] = @"inputHueMagRY";
  v18[0] = @"CIAttributeClass";
  v18[1] = @"CIAttributeDefault";
  v19[0] = @"NSNumber";
  v19[1] = &unk_1EE4A98B0;
  v18[2] = @"CIAttributeType";
  v19[2] = @"CIAttributeTypeScalar";
  v77[28] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v76[29] = @"inputHueMagYG";
  v16[0] = @"CIAttributeClass";
  v16[1] = @"CIAttributeDefault";
  v17[0] = @"NSNumber";
  v17[1] = &unk_1EE4A98B0;
  v16[2] = @"CIAttributeType";
  v17[2] = @"CIAttributeTypeScalar";
  v77[29] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v76[30] = @"inputHueMagGC";
  v14[0] = @"CIAttributeClass";
  v14[1] = @"CIAttributeDefault";
  v15[0] = @"NSNumber";
  v15[1] = &unk_1EE4A98B0;
  v14[2] = @"CIAttributeType";
  v15[2] = @"CIAttributeTypeScalar";
  v77[30] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v76[31] = @"inputHueMagCB";
  v12[0] = @"CIAttributeClass";
  v12[1] = @"CIAttributeDefault";
  v13[0] = @"NSNumber";
  v13[1] = &unk_1EE4A98B0;
  v12[2] = @"CIAttributeType";
  v13[2] = @"CIAttributeTypeScalar";
  v77[31] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v76[32] = @"inputHueMagBM";
  v10[0] = @"CIAttributeClass";
  v10[1] = @"CIAttributeDefault";
  v11[0] = @"NSNumber";
  v11[1] = &unk_1EE4A98B0;
  v10[2] = @"CIAttributeType";
  v11[2] = @"CIAttributeTypeScalar";
  v77[32] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  v76[33] = @"inputReturnDemosaiced";
  v8[0] = @"CIAttributeClass";
  v8[1] = @"CIAttributeDefault";
  v9[0] = @"NSNumber";
  v9[1] = v2;
  v8[2] = @"CIAttributeType";
  v9[2] = @"CIAttributeTypeBoolean";
  v77[33] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  v76[34] = @"inputEnableEDRMode";
  v6[0] = @"CIAttributeClass";
  v6[1] = @"CIAttributeDefault";
  v7[0] = @"NSNumber";
  v7[1] = MEMORY[0x1E4F1CC38];
  v7[2] = @"CIAttributeTypeScalar";
  v6[2] = @"CIAttributeType";
  v77[34] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  v76[35] = @"inputLocalToneMapAmount";
  v4[0] = @"CIAttributeClass";
  v4[1] = @"CIAttributeDefault";
  v5[0] = @"NSNumber";
  v5[1] = &unk_1EE4A98C0;
  v4[2] = @"CIAttributeMin";
  v4[3] = @"CIAttributeMax";
  v5[2] = &unk_1EE4A98B0;
  v5[3] = &unk_1EE4A98C0;
  v4[4] = @"CIAttributeType";
  v5[4] = @"CIAttributeTypeScalar";
  v77[35] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:36];
}

- (id)outputKeys
{
  v3.receiver = self;
  v3.super_class = (Class)CIRAWFilterImpl;
  return [(NSArray *)[(CIFilter *)&v3 outputKeys] arrayByAddingObject:@"outputNativeSize"];
}

- (BOOL)isRawSource
{
  return self->_isRawSource;
}

+ (id)applyMatrix:(const double *)a3 toCIImage:(id)a4
{
  v6 = +[CIFilter filterWithName:@"CIColorMatrix"];
  [(CIFilter *)v6 setDefaults];
  [(CIFilter *)v6 setValue:+[CIVector vectorWithX:*a3 Y:a3[1] Z:a3[2] W:0.0] forKey:@"inputRVector"];
  [(CIFilter *)v6 setValue:+[CIVector vectorWithX:a3[3] Y:a3[4] Z:a3[5] W:0.0] forKey:@"inputGVector"];
  [(CIFilter *)v6 setValue:+[CIVector vectorWithX:a3[6] Y:a3[7] Z:a3[8] W:0.0] forKey:@"inputBVector"];
  [(CIFilter *)v6 setValue:a4 forKey:@"inputImage"];

  return (id)[(CIFilter *)v6 valueForKey:@"outputImage"];
}

+ (id)optionKeys
{
  v3[36] = *MEMORY[0x1E4F143B8];
  v3[0] = @"inputNeutralTemperature";
  v3[1] = @"inputNeutralTint";
  v3[2] = @"inputNeutralChromaticityX";
  v3[3] = @"inputNeutralChromaticityY";
  v3[4] = @"inputBoost";
  v3[5] = @"inputDraftMode";
  v3[6] = @"inputScaleFactor";
  v3[7] = @"inputIgnoreOrientation";
  v3[8] = @"inputImageOrientation";
  v3[9] = @"inputDecoderVersion";
  v3[10] = @"inputEnableNoiseTracking";
  v3[11] = @"inputEnableSharpening";
  v3[12] = @"inputEnableVendorLensCorrection";
  v3[13] = @"inputNoiseReductionAmount";
  v3[14] = @"inputLuminanceNoiseReductionAmount";
  v3[15] = @"inputColorNoiseReductionAmount";
  v3[16] = @"inputNoiseReductionSharpnessAmount";
  v3[17] = @"inputNoiseReductionContrastAmount";
  v3[18] = @"inputNoiseReductionDetailAmount";
  v3[19] = @"inputBoostShadowAmount";
  v3[20] = @"inputBias";
  v3[21] = @"inputBaselineExposure";
  v3[22] = @"inputDisableGamutMap";
  v3[23] = @"inputLinearSpaceFilter";
  v3[24] = @"inputMoireAmount";
  v3[25] = @"inputEV";
  v3[26] = @"inputRequestedSushiMode";
  v3[27] = @"inputHueMagMR";
  v3[28] = @"inputHueMagRY";
  v3[29] = @"inputHueMagYG";
  v3[30] = @"inputHueMagGC";
  v3[31] = @"inputHueMagCB";
  v3[32] = @"inputHueMagBM";
  v3[33] = @"inputReturnDemosaiced";
  v3[34] = @"inputEnableEDRMode";
  v3[35] = @"inputLocalToneMapAmount";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:36];
}

+ (id)matteOptionNameFromOptions:(id)a3
{
  uint64_t v4 = @"kCIImageAuxiliaryPortraitEffectsMatte";
  id v5 = (void *)[a3 valueForKey:@"kCIImageAuxiliaryPortraitEffectsMatte"];
  if (([v5 isEqual:MEMORY[0x1E4F1CC38]] & 1) == 0)
  {
    uint64_t v4 = @"kCIImageAuxiliarySemanticSegmentationSkinMatte";
    v6 = (void *)[a3 valueForKey:@"kCIImageAuxiliarySemanticSegmentationSkinMatte"];
    if (([v6 isEqual:MEMORY[0x1E4F1CC38]] & 1) == 0)
    {
      uint64_t v4 = @"kCIImageAuxiliarySemanticSegmentationHairMatte";
      uint64_t v7 = (void *)[a3 valueForKey:@"kCIImageAuxiliarySemanticSegmentationHairMatte"];
      if (([v7 isEqual:MEMORY[0x1E4F1CC38]] & 1) == 0)
      {
        uint64_t v4 = @"kCIImageAuxiliarySemanticSegmentationTeethMatte";
        uint64_t v8 = (void *)[a3 valueForKey:@"kCIImageAuxiliarySemanticSegmentationTeethMatte"];
        if (([v8 isEqual:MEMORY[0x1E4F1CC38]] & 1) == 0)
        {
          uint64_t v4 = @"kCIImageAuxiliarySemanticSegmentationGlassesMatte";
          uint64_t v9 = (void *)[a3 valueForKey:@"kCIImageAuxiliarySemanticSegmentationGlassesMatte"];
          if (([v9 isEqual:MEMORY[0x1E4F1CC38]] & 1) == 0)
          {
            uint64_t v4 = @"kCIImageAuxiliarySemanticSegmentationSkyMatte";
            id v10 = (void *)[a3 valueForKey:@"kCIImageAuxiliarySemanticSegmentationSkyMatte"];
            if (([v10 isEqual:MEMORY[0x1E4F1CC38]] & 1) == 0)
            {
              uint64_t v4 = @"kCIImageAuxiliaryHDRGainMap";
              uint64_t v11 = (void *)[a3 valueForKey:@"kCIImageAuxiliaryHDRGainMap"];
              if (![v11 isEqual:MEMORY[0x1E4F1CC38]]) {
                return 0;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

- (CIRAWFilterImpl)initWithCVPixelBuffer:(__CVBuffer *)a3 properties:(id)a4 options:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)CIRAWFilterImpl;
  uint64_t v8 = [(CIRAWFilterImpl *)&v33 init];
  if (v8)
  {
    if (!a3 || !a4) {
      goto LABEL_12;
    }
    CFArrayRef v9 = CGImageSourceCopyTypeIdentifiers();
    if (v9) {
      CFRelease(v9);
    }
    id v10 = (uint64_t (*)(__CVBuffer *, id))dlsym((void *)0xFFFFFFFFFFFFFFFELL, "RCCreateCIImageFromBufferAndProperties");
    if (v10
      && (uint64_t v11 = (const void *)v10(a3, a4),
          uint64_t v12 = (id)CFMakeCollectable(v11),
          [v12 count] == 2))
    {
      *((void *)v8 + 11) = v12;
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)(v8 + 104) = _Q0;
      v8[120] = 1;
      v18 = (void *)[a4 valueForKey:*MEMORY[0x1E4F2FCA0]];
      uint64_t v19 = NSNumber;
      if ((int)[v18 intValue] <= 8 && (int)objc_msgSend(v18, "intValue") < 1)
      {
        uint64_t v20 = 1;
      }
      else if ((int)[v18 intValue] <= 8)
      {
        uint64_t v20 = [v18 intValue];
      }
      else
      {
        uint64_t v20 = 8;
      }
      *((void *)v8 + 24) = (id)[v19 numberWithInt:v20];
      *((void *)v8 + 17) = a4;
      *((void *)v8 + 23) = (id)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F2FF78]];
      [v8 setDefaults];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v22 = objc_msgSend((id)objc_opt_class(), "optionKeys", 0);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v30 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v28 = [a5 objectForKeyedSubscript:v27];
            if (v28) {
              [v8 setValue:v28 forKey:v27];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v24);
      }
      *((void *)v8 + 16) = [(id)objc_opt_class() matteOptionNameFromOptions:a5];
    }
    else
    {
LABEL_12:

      return 0;
    }
  }
  return (CIRAWFilterImpl *)v8;
}

- (CIRAWFilterImpl)initWithImageSource:(CGImageSource *)a3 options:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)CIRAWFilterImpl;
  v6 = [(CIRAWFilterImpl *)&v32 init];
  uint64_t v7 = (CIRAWFilterImpl *)v6;
  if (v6)
  {
    if (a3)
    {
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)(v6 + 104) = _Q0;
      *((void *)v6 + 10) = a3;
      CFRetain(a3);
      CFStringRef Type = CGImageSourceGetType(v7->_inputImageSource);
      if (Type) {
        BOOL v14 = CFStringHasSuffix(Type, @"raw-image") != 0;
      }
      else {
        BOOL v14 = 0;
      }
      v7->_isRawSource = v14;
      CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(v7->_inputImageSource, 0, (CFDictionaryRef)&unk_1EE4AB220);
      long long v16 = (id)CFMakeCollectable(v15);
      long long v17 = (void *)[v16 valueForKey:*MEMORY[0x1E4F2FCA0]];
      v18 = NSNumber;
      if ((int)[v17 intValue] <= 8 && (int)objc_msgSend(v17, "intValue") < 1)
      {
        uint64_t v19 = 1;
      }
      else if ((int)[v17 intValue] <= 8)
      {
        uint64_t v19 = [v17 intValue];
      }
      else
      {
        uint64_t v19 = 8;
      }
      v7->_defaultOrientation = (NSNumber *)(id)[v18 numberWithInt:v19];
      v7->_baseImageProperties = (NSDictionary *)v16;
      v7->_typeIdentifierHint = (id)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F2FF78]];
      [(CIRAWFilterImpl *)v7 setDefaults];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v20 = objc_msgSend((id)objc_opt_class(), "optionKeys", 0);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v26 = [a4 objectForKeyedSubscript:v25];
            if (v26) {
              [(CIRAWFilterImpl *)v7 setValue:v26 forKey:v25];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v22);
      }
      v7->_matteOption = (NSString *)[(id)objc_opt_class() matteOptionNameFromOptions:a4];
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (NSNumber)sushiMode
{
  id v3 = [(NSDictionary *)[(CIRAWFilterImpl *)self rawReconstructionDefaultsDictionary] objectForKeyedSubscript:@"kCGImageSourceSupportedSushiLevels"];
  uint64_t v4 = v3;
  if (self->inputRequestedSushiMode && objc_msgSend(v3, "containsObject:"))
  {
    id v5 = NSNumber;
    uint64_t v6 = [(NSString *)self->inputRequestedSushiMode intValue];
    return (NSNumber *)[v5 numberWithInt:v6];
  }
  else if (v4)
  {
    if ([v4 containsObject:@"3"])
    {
      return (NSNumber *)&unk_1EE4AADA8;
    }
    else if ([v4 containsObject:@"2"])
    {
      return (NSNumber *)&unk_1EE4AAD90;
    }
    else
    {
      return (NSNumber *)&unk_1EE4AAD30;
    }
  }
  else
  {
    return 0;
  }
}

- (NSDictionary)rawReconstructionDefaultsDictionary
{
  v17[4] = *MEMORY[0x1E4F143B8];
  if (!self->_baseImageProperties) {
    return (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  if (self->_isRawSource && !self->_rawReconstructionDefaultsDictionary)
  {
    if (self->_inputImageSource)
    {
      inputDecoderVersion = self->inputDecoderVersion;
      if (inputDecoderVersion)
      {
        uint64_t v5 = *MEMORY[0x1E4F2FF20];
        v16[0] = *MEMORY[0x1E4F2FEC8];
        v16[1] = v5;
        v17[0] = MEMORY[0x1E4F1CC38];
        v17[1] = MEMORY[0x1E4F1CC38];
        v16[2] = *MEMORY[0x1E4F2FF38];
        void v16[3] = @"kCGImageSourceShouldUseRawDataForFullSize";
        v17[2] = inputDecoderVersion;
        void v17[3] = MEMORY[0x1E4F1CC38];
        uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v7 = v17;
        uint64_t v8 = v16;
        uint64_t v9 = 4;
      }
      else
      {
        uint64_t v12 = *MEMORY[0x1E4F2FF20];
        v14[0] = *MEMORY[0x1E4F2FEC8];
        v14[1] = v12;
        v15[0] = MEMORY[0x1E4F1CC38];
        v15[1] = MEMORY[0x1E4F1CC38];
        v14[2] = @"kCGImageSourceShouldUseRawDataForFullSize";
        v15[2] = MEMORY[0x1E4F1CC38];
        uint64_t v6 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v7 = v15;
        uint64_t v8 = v14;
        uint64_t v9 = 3;
      }
      CFDictionaryRef v13 = CGImageSourceCopyPropertiesAtIndex(self->_inputImageSource, 0, (CFDictionaryRef)[v6 dictionaryWithObjects:v7 forKeys:v8 count:v9]);
      self->_rawReconstructionDefaultsDictionary = (NSDictionary *)(id)[(__CFDictionary *)v13 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];
      if (v13) {
        CFRelease(v13);
      }
    }
    else
    {
      inputImageAndProperties = self->_inputImageAndProperties;
      if (inputImageAndProperties)
      {
        id v11 = [(NSArray *)inputImageAndProperties objectAtIndexedSubscript:1];
        self->_rawReconstructionDefaultsDictionary = (NSDictionary *)(id)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];
      }
    }
  }
  return self->_rawReconstructionDefaultsDictionary;
}

- (NSDictionary)rawDictionary
{
  if (!self->_baseImageProperties) {
    return (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  BOOL isRawSource = self->_isRawSource;
  id result = self->_rawDictionary;
  if (isRawSource && result == 0)
  {
    inputImageSource = self->_inputImageSource;
    if (inputImageSource)
    {
      CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(inputImageSource, 0, (CFDictionaryRef)[(CIRAWFilterImpl *)self rawOptions]);
      uint64_t v8 = (void *)[(id)(id)CFMakeCollectable(v7) objectForKeyedSubscript:@"{Raw}"];
      uint64_t v9 = (void *)dictionaryDeepCopy(v8);
    }
    else
    {
      id result = (NSDictionary *)self->_inputImageAndProperties;
      if (!result) {
        return result;
      }
      uint64_t v9 = objc_msgSend((id)-[NSDictionary objectAtIndexedSubscript:](result, "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", @"{Raw}");
    }
    id result = v9;
    self->_rawDictionary = result;
  }
  return result;
}

- (int)rawMajorVersion
{
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", @"version"), "doubleValue");
  return vcvtmd_s64_f64(v2);
}

- (NSArray)filters
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id result = self->_filters;
  if (!result)
  {
    id v4 = [(NSDictionary *)[(CIRAWFilterImpl *)self rawDictionary] objectForKeyedSubscript:@"filters"];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (!v6)
    {
      v62 = +[CIFilter filterWithName:@"CIExposureAdjust"];
      [(CIFilter *)v62 setValue:self->inputEV forKey:@"inputEV"];
      [v5 addObject:v62];
      goto LABEL_56;
    }
    uint64_t v7 = v6;
    int v69 = 0;
    int v68 = 0;
    uint64_t v8 = *(void *)v74;
    uint64_t v9 = @"inputExposure";
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = v9;
      if (*(void *)v74 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v12 = *(void **)(*((void *)&v73 + 1) + 8 * v10);
      CFDictionaryRef v13 = (objc_class *)objc_opt_class();
      BOOL v14 = NSStringFromClass(v13);
      if ([(NSString *)v14 isEqualToString:@"RAWDemosaicFilter"]) {
        goto LABEL_19;
      }
      if ([(NSString *)v14 isEqualToString:@"RAWGamutMap"])
      {
        if ([(NSNumber *)self->inputDisableGamutMap BOOLValue]) {
          goto LABEL_19;
        }
        [(NSNumber *)self->inputEnableEDRMode floatValue];
        *(float *)&double v15 = fminf(fmaxf(*(float *)&v15, 0.0), 2.0);
        if (*(float *)&v15 > 0.0)
        {
          *(float *)&double v15 = (float)(*(float *)&v15 * 2.0) + 1.0;
          objc_msgSend(v12, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v15), @"inputGamutMapMax");
        }
      }
      long long v16 = (void *)[v12 copy];
      [v5 addObject:v16];

      if (objc_msgSend((id)objc_msgSend(v16, "inputKeys"), "containsObject:", @"inputDraftMode")) {
        [v16 setValue:self->inputDraftMode forKey:@"inputDraftMode"];
      }
      if ([(NSString *)v14 isEqualToString:@"RAWReduceNoise"])
      {
        [v16 setValue:self->inputLuminanceNoiseReductionAmount forKey:@"inputLNRAmount"];
        [v16 setValue:self->inputColorNoiseReductionAmount forKey:@"inputCNRAmount"];
        [v16 setValue:self->inputNoiseReductionSharpnessAmount forKey:@"inputSharpenAmount"];
        [v16 setValue:self->inputNoiseReductionContrastAmount forKey:@"inputContrastAmount"];
        [v16 setValue:self->inputNoiseReductionDetailAmount forKey:@"inputDetailAmount"];
        inputMoireAmount = self->inputMoireAmount;
        v18 = v16;
        uint64_t v19 = @"inputMoireAmount";
        goto LABEL_18;
      }
      if ([(NSString *)v14 isEqualToString:@"RAWRadialLensCorrection"])
      {
        inputMoireAmount = self->inputEnableVendorLensCorrection;
        v18 = v16;
        uint64_t v19 = @"inputLDCExecuteFlags";
        goto LABEL_18;
      }
      if ([(NSString *)v14 isEqualToString:@"RAWConvert"]) {
        break;
      }
      if ([(NSString *)v14 isEqualToString:@"RAWAdjustTempTint"])
      {
        id v20 = [(CIRAWFilterImpl *)self whitePoint];
        uint64_t v21 = v16;
        uint64_t v22 = @"inputWhitePoint";
        goto LABEL_26;
      }
      if ([(NSString *)v14 isEqualToString:@"RAWAdjustExposureAndBias"])
      {
        uint64_t v9 = v11;
        [v16 setValue:self->inputEV forKey:v11];
        objc_msgSend(v16, "setValue:forKey:", -[CIRAWFilterImpl inputBaselineExposure](self, "inputBaselineExposure"), @"inputBaselineExposure");
        objc_msgSend(v16, "setValue:forKey:", -[CIRAWFilterImpl inputBias](self, "inputBias"), @"inputBias");
        objc_msgSend(-[CIRAWFilterImpl defaultInputLocalToneMapAmount](self, "defaultInputLocalToneMapAmount"), "floatValue");
        if (v23 > 0.0)
        {
          [v16 setValue:&unk_1EE4AAD78 forKey:v11];
          int v68 = 0;
          goto LABEL_20;
        }
        goto LABEL_29;
      }
      if ([(NSString *)v14 isEqualToString:@"RAWHueMagnet"])
      {
        uint64_t v24 = NSNumber;
        [(NSNumber *)self->inputBoost doubleValue];
        double v26 = v25;
        [(NSNumber *)self->inputHueMagMR doubleValue];
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v24, "numberWithDouble:", v26 * v27), @"inputHueMagMR");
        v64 = NSNumber;
        [(NSNumber *)self->inputBoost doubleValue];
        double v29 = v28;
        [(NSNumber *)self->inputHueMagRY doubleValue];
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v64, "numberWithDouble:", v29 * v30), @"inputHueMagRY");
        v65 = NSNumber;
        [(NSNumber *)self->inputBoost doubleValue];
        double v32 = v31;
        [(NSNumber *)self->inputHueMagYG doubleValue];
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v65, "numberWithDouble:", v32 * v33), @"inputHueMagYG");
        v66 = NSNumber;
        [(NSNumber *)self->inputBoost doubleValue];
        double v35 = v34;
        [(NSNumber *)self->inputHueMagGC doubleValue];
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v66, "numberWithDouble:", v35 * v36), @"inputHueMagGC");
        v67 = NSNumber;
        [(NSNumber *)self->inputBoost doubleValue];
        double v38 = v37;
        [(NSNumber *)self->inputHueMagCB doubleValue];
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v67, "numberWithDouble:", v38 * v39), @"inputHueMagCB");
        v40 = NSNumber;
        [(NSNumber *)self->inputBoost doubleValue];
        double v42 = v41;
        [(NSNumber *)self->inputHueMagBM doubleValue];
        inputMoireAmount = (NSNumber *)[v40 numberWithDouble:v42 * v43];
        v18 = v16;
        uint64_t v19 = @"inputHueMagBM";
        goto LABEL_18;
      }
      if (![(NSString *)v14 isEqualToString:@"RAWAdjustColorTRC"])
      {
        if ([(NSString *)v14 isEqualToString:@"RAWAdjustColors"])
        {
          inputMoireAmount = self->inputBoost;
          v18 = v16;
          uint64_t v19 = @"inputBoostAmount";
          goto LABEL_18;
        }
        if ([(NSString *)v14 isEqualToString:@"RAWTemperatureAdjust"])
        {
          uint64_t v9 = v11;
          [v16 setValue:self->inputEV forKey:v11];
          objc_msgSend(v16, "setValue:forKey:", -[CIRAWFilterImpl whitePoint](self, "whitePoint"), @"inputWhitePoint");
          int v69 = 1;
LABEL_29:
          int v68 = 1;
          goto LABEL_20;
        }
        if (self->inputLinearSpaceFilter
          && (v51 = (objc_class *)objc_opt_class(),
              [NSStringFromClass(v51) isEqualToString:@"RAWLinearSpacePlaceholder"]))
        {
          [v5 addObject:self->inputLinearSpaceFilter];
        }
        else if ([(NSString *)v14 isEqualToString:@"RAWProfileGainTableMap"])
        {
          [(NSNumber *)self->inputEnableEDRMode floatValue];
          float v57 = fminf(fmaxf(v56, 0.0), 2.0);
          [(NSNumber *)self->inputLocalToneMapAmount floatValue];
          double v59 = (v57 * -0.2 + 1.0) * v58;
          *(float *)&double v59 = v59;
          inputMoireAmount = (NSNumber *)[NSNumber numberWithFloat:v59];
          v18 = v16;
          uint64_t v19 = @"inputStrength";
LABEL_18:
          [v18 setValue:inputMoireAmount forKey:v19];
        }
LABEL_19:
        uint64_t v9 = v11;
        goto LABEL_20;
      }
      [v16 setValue:self->inputBoost forKey:@"inputBoostAmount"];
      [v16 setValue:self->inputBoostShadowAmount forKey:@"inputBoostShadowAmount"];
      [(NSNumber *)self->inputEnableEDRMode floatValue];
      float v45 = fminf(fmaxf(v44, 0.0), 2.0);
      if (v45 <= 0.0) {
        goto LABEL_19;
      }
      double v46 = v45;
      if (![v16 valueForKey:@"inputReferencePoints"])
      {
        objc_msgSend((id)objc_msgSend(v16, "valueForKey:", @"inputTRCy3"), "doubleValue");
        double v53 = v52;
        objc_msgSend((id)objc_msgSend(v16, "valueForKey:", @"inputTRCs3"), "doubleValue");
        double v55 = (v46 * 0.25 + 1.0 - (v53 + v54 * 0.2)) / 0.3;
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v46 * 0.25 + 1.0), @"inputTRCy4");
        uint64_t v9 = v11;
        uint64_t v48 = [NSNumber numberWithDouble:v55];
        v49 = v16;
        v50 = @"inputTRCs4";
        goto LABEL_46;
      }
      uint64_t v9 = v11;
      if (objc_msgSend((id)objc_msgSend(v16, "inputKeys"), "containsObject:", @"inputBoostHDRAmount"))
      {
        double v47 = v46 * 0.75 + 1.0;
        *(float *)&double v47 = v47;
        uint64_t v48 = [NSNumber numberWithFloat:v47];
        v49 = v16;
        v50 = @"inputBoostHDRAmount";
LABEL_46:
        [v49 setValue:v48 forKey:v50];
      }
LABEL_20:
      if (v7 == ++v10)
      {
        uint64_t v60 = [v4 countByEnumeratingWithState:&v73 objects:v77 count:16];
        uint64_t v7 = v60;
        if (!v60)
        {
          if (v68 & v69) {
            goto LABEL_57;
          }
          if ((v68 & 1) == 0)
          {
            v61 = +[CIFilter filterWithName:@"CIExposureAdjust"];
            [(CIFilter *)v61 setValue:self->inputEV forKey:@"inputEV"];
            [v5 addObject:v61];
          }
          if (v69)
          {
LABEL_57:
            id result = v5;
            self->_filters = result;
            return result;
          }
LABEL_56:
          v63 = +[CIFilter filterWithName:@"CIColorMatrix"];
          [(CIFilter *)v63 setDefaults];
          uint64_t v71 = 0;
          uint64_t v72 = 0;
          uint64_t v70 = 0;
          [(CIRAWFilterImpl *)self getWhitePointVectorsR:&v72 g:&v71 b:&v70];
          [(CIFilter *)v63 setValue:v72 forKey:@"inputRVector"];
          [(CIFilter *)v63 setValue:v71 forKey:@"inputGVector"];
          [(CIFilter *)v63 setValue:v70 forKey:@"inputBVector"];
          [v5 addObject:v63];
          goto LABEL_57;
        }
        goto LABEL_4;
      }
    }
    id v20 = [(CIRAWFilterImpl *)self whitePointArray];
    uint64_t v21 = v16;
    uint64_t v22 = @"inputNeutral";
LABEL_26:
    [v21 setValue:v20 forKey:v22];
    int v69 = 1;
    goto LABEL_19;
  }
  return result;
}

- (int)subsampling
{
  if ([(NSNumber *)[(CIRAWFilterImpl *)self sushiMode] intValue] == 3) {
    return 0;
  }
  [(NSNumber *)self->inputScaleFactor floatValue];
  float v5 = v4;
  BOOL v6 = [(NSNumber *)self->inputDraftMode BOOLValue];
  int result = 0;
  if (v6)
  {
    float v7 = 1.0 / v5;
    if ((float)(1.0 / v5) >= 0.5)
    {
      if (v7 >= 8.0) {
        return 3;
      }
      if (v7 >= 4.0) {
        return 2;
      }
      return v7 >= 2.0;
    }
  }
  return result;
}

- (void)invalidateFilters
{
  self->_rawDictionary = 0;
  self->_filters = 0;
}

- (void)invalidateInputImage
{
  self->_inputImage = 0;
}

- (id)rawOptions
{
  return [(CIRAWFilterImpl *)self rawOptionsWithSubsampling:1];
}

- (id)rawOptionsWithSubsampling:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  BOOL v6 = v5;
  inputDecoderVersion = self->inputDecoderVersion;
  if (inputDecoderVersion) {
    [v5 setObject:inputDecoderVersion forKeyedSubscript:*MEMORY[0x1E4F2FF38]];
  }
  inputEnableSharpening = self->inputEnableSharpening;
  if (inputEnableSharpening) {
    [v6 setObject:inputEnableSharpening forKeyedSubscript:*MEMORY[0x1E4F2FEF0]];
  }
  inputEnableNoiseTracking = self->inputEnableNoiseTracking;
  if (inputEnableNoiseTracking) {
    [v6 setObject:inputEnableNoiseTracking forKeyedSubscript:*MEMORY[0x1E4F2FEB8]];
  }
  inputNoiseReductionAmount = self->inputNoiseReductionAmount;
  if (inputNoiseReductionAmount)
  {
    [v6 setObject:inputNoiseReductionAmount forKeyedSubscript:@"kCGImageSourceNoiseReductionAmount"];
    [v6 setObject:self->inputNoiseReductionAmount forKeyedSubscript:@"kCGImageSourceLuminanceNoiseReductionAmount"];
  }
  inputLuminanceNoiseReductionAmount = self->inputLuminanceNoiseReductionAmount;
  if (inputLuminanceNoiseReductionAmount) {
    [v6 setObject:inputLuminanceNoiseReductionAmount forKeyedSubscript:@"kCGImageSourceLuminanceNoiseReductionAmount"];
  }
  inputColorNoiseReductionAmount = self->inputColorNoiseReductionAmount;
  if (inputColorNoiseReductionAmount) {
    [v6 setObject:inputColorNoiseReductionAmount forKeyedSubscript:@"kCGImageSourceColorNoiseReductionAmount"];
  }
  inputNoiseReductionSharpnessAmount = self->inputNoiseReductionSharpnessAmount;
  if (inputNoiseReductionSharpnessAmount) {
    [v6 setObject:inputNoiseReductionSharpnessAmount forKeyedSubscript:@"kCGImageSourceNoiseReductionSharpnessAmount"];
  }
  inputNoiseReductionContrastAmount = self->inputNoiseReductionContrastAmount;
  if (inputNoiseReductionContrastAmount) {
    [v6 setObject:inputNoiseReductionContrastAmount forKeyedSubscript:@"kCGImageSourceNoiseReductionContrastAmount"];
  }
  inputNoiseReductionDetailAmount = self->inputNoiseReductionDetailAmount;
  if (inputNoiseReductionDetailAmount) {
    [v6 setObject:inputNoiseReductionDetailAmount forKeyedSubscript:@"kCGImageSourceNoiseReductionDetailAmount"];
  }
  inputMoireAmount = self->inputMoireAmount;
  if (inputMoireAmount) {
    [v6 setObject:inputMoireAmount forKeyedSubscript:@"kCGImageSourceChromaBlurMoireAmount"];
  }
  inputEnableVendorLensCorrection = self->inputEnableVendorLensCorrection;
  if (inputEnableVendorLensCorrection) {
    [v6 setObject:inputEnableVendorLensCorrection forKeyedSubscript:@"kCGImageSourceDisableVendorLensDistortionCorrection"];
  }
  inputEnableEDRMode = self->inputEnableEDRMode;
  if (inputEnableEDRMode) {
    [v6 setObject:inputEnableEDRMode forKeyedSubscript:@"kCGImageSourceUseEDRMode"];
  }
  uint64_t v19 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v20 = *MEMORY[0x1E4F2FEC8];
  [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2FEC8]];
  if ([(CIRAWFilterImpl *)self sushiMode])
  {
    uint64_t v21 = [(CIRAWFilterImpl *)self sushiMode];
    [v19 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F2FF20]];
  }
  [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kCGImageSourceShouldUseRawDataForFullSize"];
  [v19 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2FED8]];
  [v19 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F2FF08]];
  [v19 setObject:&unk_1EE4AAD30 forKeyedSubscript:v20];
  typeIdentifierHint = self->_typeIdentifierHint;
  if (typeIdentifierHint) {
    [v19 setObject:typeIdentifierHint forKeyedSubscript:*MEMORY[0x1E4F2FF78]];
  }
  if (v3 && [(NSNumber *)[(CIRAWFilterImpl *)self sushiMode] intValue] <= 2)
  {
    int v23 = [(CIRAWFilterImpl *)self subsampling];
    if (v23 < 1) {
      uint64_t v24 = &unk_1EE4AAD30;
    }
    else {
      uint64_t v24 = (void *)[NSNumber numberWithInt:(1 << v23)];
    }
    [v19 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F2FF58]];
  }
  if (self->inputDecoderVersion)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v19 setObject:self->inputDecoderVersion forKeyedSubscript:*MEMORY[0x1E4F2FF38]];
    }
  }
  return v19;
}

- (void)setTempTintAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = [(CIRAWFilterImpl *)self transformedImageIgnoringOrientation:0 andIgnoringScaleFactor:0];
  float v7 = x;
  float v8 = roundf(v7);
  double v9 = v8;
  float v10 = y;
  float v11 = roundf(v10);
  double v12 = v11;
  [v6 extent];
  double v14 = v13;
  double v16 = v15;
  [v6 extent];
  float v52 = 0.0;
  float32x2_t v51 = 0;
  if (v8 >= 9.0 && v11 >= 9.0 && v17 + -9.0 >= v9 && v18 + -9.0 >= v12)
  {
    uint64_t v22 = malloc_type_malloc(0x288uLL, 0x1000040BDFB0063uLL);
    int v23 = (char *)malloc_type_malloc(0x510uLL, 0x100004052888210uLL);
    uint64_t v24 = v23;
    if (v23 && v22)
    {
      objc_msgSend(+[CIContext _singletonContext](CIContext, "_singletonContext"), "render:toBitmap:rowBytes:bounds:format:colorSpace:", v6, v22, 72, 2056, objc_msgSend(v6, "colorSpace"), v14 + v9 + -4.0, v16 + v12 + -4.0, 9.0, 9.0);
      *(_OWORD *)&src.height = xmmword_1939554C0;
      src.rowBytes = 72;
      dest.data = v24;
      *(_OWORD *)&dest.height = xmmword_1939554C0;
      dest.rowBytes = 144;
      src.data = v22;
      vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
      uint64_t v25 = 0;
      float32x2_t v26 = 0;
      float v27 = 0.0;
      do
      {
        float32x2_t v26 = vadd_f32(*(float32x2_t *)&v24[v25], v26);
        float v27 = *(float *)&v24[v25 + 8] + v27;
        v25 += 16;
      }
      while (v25 != 1296);
      free(v22);
      free(v24);
      float32x2_t v42 = vdiv_f32(v26, (float32x2_t)vdup_n_s32(0x42A20000u));
      float32x2_t v51 = v42;
      float v28 = v27 / 81.0;
      float v52 = v28;
      if ((int)objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](self, "valueForKey:", @"inputDecoderVersion"), "intValue") < 2)
      {
        src.data = 0;
        dest.data = 0;
        CI_GenericRGBLinear_to_TempTint((float *)&v51, (double *)&src, (double *)&dest);
        -[CIRAWFilterImpl setInputNeutralTemperature:](self, "setInputNeutralTemperature:", [NSNumber numberWithDouble:*(double *)&src.data]);
        -[CIRAWFilterImpl setInputNeutralTint:](self, "setInputNeutralTint:", [NSNumber numberWithDouble:*(double *)&dest.data]);
      }
      else
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        double v29 = [(CIRAWFilterImpl *)self filters];
        uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v43 objects:v50 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v44;
          float v33 = v28 / v42.f32[1];
          while (2)
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v44 != v32) {
                objc_enumerationMutation(v29);
              }
              double v35 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              double v36 = (objc_class *)objc_opt_class();
              if ([NSStringFromClass(v36) isEqualToString:@"RAWConvert"])
              {
                double v37 = (void *)[v35 copy];
                *(float *)&double v38 = v42.f32[0] / v42.f32[1];
                v49[0] = [NSNumber numberWithFloat:v38];
                *(float *)&double v39 = v42.f32[1] / v42.f32[1];
                v49[1] = [NSNumber numberWithFloat:v39];
                *(float *)&double v40 = v33;
                v49[2] = [NSNumber numberWithFloat:v40];
                objc_msgSend(v37, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v49, 3), @"inputNeutral");
                double v41 = (void *)[v37 performSelector:NSSelectorFromString(&cfstr_Inputneutralxy.isa)];
                -[CIRAWFilterImpl setInputNeutralChromaticityX:](self, "setInputNeutralChromaticityX:", [v41 objectAtIndexedSubscript:0]);
                -[CIRAWFilterImpl setInputNeutralChromaticityY:](self, "setInputNeutralChromaticityY:", [v41 objectAtIndexedSubscript:1]);

                return;
              }
            }
            uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v43 objects:v50 count:16];
            if (v31) {
              continue;
            }
            break;
          }
        }
      }
    }
    else
    {
      if (v22) {
        free(v22);
      }
      if (v24)
      {
        free(v24);
      }
    }
  }
}

- (CGSize)nativeSize
{
  p_nativeSize = &self->_nativeSize;
  if (self->_nativeSize.width < 0.0)
  {
    if (self->_inputImageSource)
    {
      CFDictionaryRef v3 = CGImageSourceCopyPropertiesAtIndex(self->_inputImageSource, 0, (CFDictionaryRef)[(CIRAWFilterImpl *)self rawOptionsWithSubsampling:0]);
      float v4 = (void *)[(__CFDictionary *)v3 objectForKeyedSubscript:@"PixelWidth"];
      float v5 = (void *)[(__CFDictionary *)v3 objectForKeyedSubscript:@"PixelHeight"];
      id v6 = objc_msgSend((id)-[__CFDictionary valueForKeyPath:](v3, "valueForKeyPath:", @"{Raw}.filters"), "objectAtIndexedSubscript:", 0);
      float v7 = (objc_class *)objc_opt_class();
      if ([NSStringFromClass(v7) isEqualToString:@"RAWDemosaicFilter"])
      {
        float v8 = (void *)[v6 valueForKey:@"inputCropRect"];
        if (v8)
        {
          double v9 = v8;
          float v10 = NSNumber;
          [v8 Z];
          float v4 = objc_msgSend(v10, "numberWithDouble:");
          float v11 = NSNumber;
          [v9 W];
          float v5 = objc_msgSend(v11, "numberWithDouble:");
        }
      }
      if (v4) {
        BOOL v12 = v5 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12)
      {
        [v4 doubleValue];
        CGFloat v14 = v13;
        [v5 doubleValue];
        p_nativeSize->double width = v14;
        p_nativeSize->double height = v15;
      }
      if (v3) {
        CFRelease(v3);
      }
    }
    else
    {
      inputImageAndProperties = self->_inputImageAndProperties;
      if (inputImageAndProperties)
      {
        id v17 = [(NSArray *)inputImageAndProperties objectAtIndexedSubscript:1];
        double v18 = (void *)[v17 objectForKeyedSubscript:@"PixelWidth"];
        uint64_t v19 = (void *)[v17 objectForKeyedSubscript:@"PixelHeight"];
        if (!v18) {
          double v18 = (void *)[v17 valueForKeyPath:@"{Exif}.PixelXDimension"];
        }
        if (!v19) {
          uint64_t v19 = (void *)[v17 valueForKeyPath:@"{Exif}.PixelYDimension"];
        }
        uint64_t v20 = objc_msgSend((id)objc_msgSend(v17, "valueForKeyPath:", @"{Raw}.filters"), "objectAtIndexedSubscript:", 0);
        uint64_t v21 = (objc_class *)objc_opt_class();
        if ([NSStringFromClass(v21) isEqualToString:@"RAWDemosaicFilter"])
        {
          uint64_t v22 = (void *)[v20 valueForKey:@"inputCropRect"];
          if (v22)
          {
            int v23 = v22;
            uint64_t v24 = NSNumber;
            [v22 Z];
            double v18 = objc_msgSend(v24, "numberWithDouble:");
            uint64_t v25 = NSNumber;
            [v23 W];
            uint64_t v19 = objc_msgSend(v25, "numberWithDouble:");
          }
        }
        if (v18) {
          BOOL v26 = v19 == 0;
        }
        else {
          BOOL v26 = 1;
        }
        if (!v26)
        {
          [v18 doubleValue];
          CGFloat v28 = v27;
          [v19 doubleValue];
          p_nativeSize->double width = v28;
          p_nativeSize->double height = v29;
        }
      }
    }
  }
  double width = p_nativeSize->width;
  double height = p_nativeSize->height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)getScaleTransform:(SEL)a3
{
  [(CIRAWFilterImpl *)self nativeSize];
  double v8 = v7;
  double v10 = v9;
  [a4 extent];
  double v12 = v11;
  [(NSNumber *)self->inputScaleFactor doubleValue];
  double v14 = v13;
  char v15 = [(CIRAWFilterImpl *)self subsampling];
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, v14 * (double)(1 << v15), v14 * (double)(1 << v15));
  return CGAffineTransformMakeScale(retstr, (v10 * v17.c + v17.a * v8) / v12, (v10 * v17.c + v17.a * v8) / v12);
}

- (CGAffineTransform)getOrientationTransform:(SEL)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  [a4 extent];
  double v8 = v7;
  [a4 extent];
  double v10 = v9;
  inputIgnoreOrientation = self->inputIgnoreOrientation;
  if (inputIgnoreOrientation
    && (CGSize result = (CGAffineTransform *)[(NSNumber *)inputIgnoreOrientation BOOLValue], result))
  {
    uint64_t v13 = MEMORY[0x1E4F1DAB8];
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v13 + 32);
  }
  else
  {
    float v15 = v8;
    float v16 = v10;
    CGSize result = (CGAffineTransform *)[(NSNumber *)self->inputImageOrientation intValue];
    v21[0] = 0x3FF0000000000000;
    v21[1] = 0;
    v21[2] = 0;
    void v21[3] = 0x3FF0000000000000;
    v21[4] = 0;
    v21[5] = 0;
    v21[6] = 0xBFF0000000000000;
    v21[7] = 0;
    v21[8] = 0;
    v21[9] = 0x3FF0000000000000;
    *(double *)&v21[10] = v15;
    long long v22 = xmmword_193953160;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    unint64_t v25 = 0xBFF0000000000000;
    double v26 = v15;
    double v27 = v16;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v28 = 0x3FF0000000000000;
    long long v31 = xmmword_193951E50;
    double v32 = v16;
    long long v33 = xmmword_193953160;
    long long v34 = xmmword_193951E50;
    double v35 = v16;
    double v36 = v15;
    long long v37 = xmmword_193953160;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v38 = 0x3FF0000000000000;
    double v41 = v15;
    long long v42 = xmmword_193953170;
    long long v45 = 0u;
    long long v44 = 0u;
    uint64_t v43 = 0x3FF0000000000000;
    uint64_t v46 = 0x3FF0000000000000;
    long long v47 = xmmword_193951E50;
    double v48 = v16;
    uint64_t v49 = 0;
    if ((result - 9) >= 0xFFFFFFF8) {
      int v17 = result - 1;
    }
    else {
      int v17 = 0;
    }
    double v18 = (long long *)&v21[6 * v17];
    long long v19 = v18[2];
    long long v20 = *v18;
    *(_OWORD *)&retstr->c = v18[1];
    *(_OWORD *)&retstr->tdouble x = v19;
    *(_OWORD *)&retstr->a = v20;
  }
  return result;
}

- (id)transformedImageIgnoringOrientation:(BOOL)a3 andIgnoringScaleFactor:(BOOL)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (self->_isRawSource && ![(NSArray *)self->_supportedDecoderVersions count]) {
    return 0;
  }
  BOOL v31 = a3;
  id v7 = [(CIRAWFilterImpl *)self inputImage];
  long long v45 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (a4)
  {
    double v8 = *MEMORY[0x1E4F1DAB8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DAB8] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
  }
  else
  {
    [(CIRAWFilterImpl *)self getScaleTransform:v7];
    double v9 = *((double *)&v42 + 1);
    double v8 = *(double *)&v42;
    double v11 = *((double *)&v43 + 1);
    double v10 = *(double *)&v43;
    long long v45 = v44;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  double v12 = fmax(fabs(v8), fmax(fabs(v9), fmax(fabs(v10), fabs(v11))));
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v13 = [(CIRAWFilterImpl *)self filters];
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    int v16 = 0;
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v13);
        }
        v16 |= objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "isEqualToString:", @"RAWCropFilter");
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v15);
    if (v16 & 1 | (v12 > 1.0)) {
      goto LABEL_15;
    }
  }
  else if (v12 > 1.0)
  {
    goto LABEL_15;
  }
  *(double *)&long long v42 = v8;
  *((double *)&v42 + 1) = v9;
  *(double *)&long long v43 = v10;
  *((double *)&v43 + 1) = v11;
  long long v44 = v45;
  id v7 = (id)scaleImageWithQuality(v7, &v42);
LABEL_15:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [(CIRAWFilterImpl *)self filters];
  uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        uint64_t v24 = (objc_class *)objc_opt_class();
        unint64_t v25 = NSStringFromClass(v24);
        if ([(NSString *)v25 isEqualToString:@"CIAffineTransform"]
          || [(NSString *)v25 isEqualToString:@"CILanczosScaleTransform"]
          || [(NSString *)v25 isEqualToString:@"RAWCropFilter"])
        {
          [v23 setValue:v7 forKey:@"inputImage"];
          id v7 = (id)[v23 outputImage];
        }
        if ([(NSString *)v25 isEqualToString:@"RAWCropFilter"]) {
          BOOL v26 = v12 <= 1.0;
        }
        else {
          BOOL v26 = 0;
        }
        if (v26)
        {
          *(double *)&long long v42 = v8;
          *((double *)&v42 + 1) = v9;
          *(double *)&long long v43 = v10;
          *((double *)&v43 + 1) = v11;
          long long v44 = v45;
          id v7 = (id)scaleImageWithQuality(v7, &v42);
        }
        [v23 setValue:0 forKey:@"inputImage"];
      }
      uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v20);
  }
  if (v12 <= 1.0)
  {
    double v27 = self;
  }
  else
  {
    double v27 = self;
    if (self)
    {
      [(CIRAWFilterImpl *)self getScaleTransform:v7];
      long long v28 = v42;
      long long v29 = v43;
    }
    else
    {
      long long v28 = 0uLL;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v42 = 0u;
      long long v29 = 0uLL;
    }
    long long v45 = v44;
    long long v42 = v28;
    long long v43 = v29;
    id v7 = (id)scaleImageWithQuality(v7, &v42);
  }
  if (!v31)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v42 = 0u;
    if (v27) {
      [(CIRAWFilterImpl *)v27 getOrientationTransform:v7];
    }
    v33[0] = v42;
    v33[1] = v43;
    void v33[2] = v44;
    return (id)[v7 imageByApplyingTransform:v33];
  }
  return v7;
}

- (id)outputImage
{
  v61[1] = *MEMORY[0x1E4F143B8];
  if (self->_matteOption)
  {
    inputImageSource = self->_inputImageSource;
    matteOption = self->_matteOption;
    v61[0] = MEMORY[0x1E4F1CC38];
    return +[CIImage imageWithCGImageSource:index:options:](CIImage, "imageWithCGImageSource:index:options:", inputImageSource, 0, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&matteOption count:1]);
  }
  if (self->_isRawSource && ![(NSArray *)self->_supportedDecoderVersions count]) {
    return 0;
  }
  id v5 = [(CIRAWFilterImpl *)self inputImage];
  int v7 = objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](self, "valueForKey:", @"inputReturnDemosaiced"), "BOOLValue");
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  [(CIRAWFilterImpl *)self getScaleTransform:v5];
  double v8 = fmax(fabs(*(double *)&v55), fmax(fabs(*((double *)&v55 + 1)), fmax(fabs(*(double *)&v56), fabs(*((double *)&v56 + 1)))));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  double v9 = [(CIRAWFilterImpl *)self filters];
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v52;
LABEL_9:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v52 != v12) {
        objc_enumerationMutation(v9);
      }
      if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "isEqualToString:", @"RAWCropFilter"))break; {
      if (v11 == ++v13)
      }
      {
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v11) {
          goto LABEL_9;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    if (v8 <= 1.0)
    {
      long long v48 = v55;
      long long v49 = v56;
      long long v50 = v57;
      id v5 = (id)scaleImageWithQuality(v5, &v48);
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = self;
  uint64_t v14 = [(CIRAWFilterImpl *)self filters];
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (!v15)
  {
LABEL_33:
    if (v8 > 1.0)
    {
      [(CIRAWFilterImpl *)v42 getScaleTransform:v5];
      long long v56 = v49;
      long long v57 = v50;
      long long v55 = v48;
      id v5 = (id)scaleImageWithQuality(v5, &v48);
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v48 = 0u;
    [(CIRAWFilterImpl *)v42 getOrientationTransform:v5];
    v43[0] = v48;
    v43[1] = v49;
    v43[2] = v50;
    uint64_t v21 = (void *)[v5 imageByApplyingTransform:v43];
    int v22 = [(NSString *)v42->inputDecoderVersion intValue];
    uint64_t v23 = (CFStringRef *)MEMORY[0x1E4F1DB90];
    if (v22 <= 6) {
      uint64_t v23 = (CFStringRef *)MEMORY[0x1E4F1DB78];
    }
    CGColorSpaceRef v24 = CGColorSpaceCreateWithName(*v23);
    if (v24)
    {
      CGColorSpaceRef v25 = v24;
      uint64_t v21 = (void *)[v21 imageByTaggingWithColorSpace:v24];
      CFRelease(v25);
    }
    id v26 = (id)[(NSDictionary *)v42->_baseImageProperties mutableCopy];
    uint64_t v27 = *MEMORY[0x1E4F2FD40];
    id v28 = (id)objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FD40]), "mutableCopy");
    uint64_t v29 = *MEMORY[0x1E4F2F800];
    id v30 = (id)objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E4F2F800]), "mutableCopy");
    if (v28) {
      [v26 setObject:v28 forKeyedSubscript:v27];
    }
    if (v30) {
      [v26 setObject:v30 forKeyedSubscript:v29];
    }
    inputIgnoreOrientation = v42->inputIgnoreOrientation;
    if (inputIgnoreOrientation && [(NSNumber *)inputIgnoreOrientation BOOLValue]) {
      defaultOrientation = v42->_defaultOrientation;
    }
    else {
      defaultOrientation = (NSNumber *)&unk_1EE4AAD30;
    }
    uint64_t v33 = *MEMORY[0x1E4F2FCA0];
    if ([v26 valueForKey:*MEMORY[0x1E4F2FCA0]]) {
      [v26 setValue:defaultOrientation forKey:v33];
    }
    if ([v28 objectForKeyedSubscript:v33]) {
      [v28 setValue:defaultOrientation forKey:v33];
    }
    [v21 extent];
    double v35 = v34;
    double v37 = v36;
    uint64_t v38 = [NSNumber numberWithDouble:v34];
    [v26 setValue:v38 forKey:*MEMORY[0x1E4F2FD00]];
    uint64_t v39 = [NSNumber numberWithDouble:v37];
    [v26 setValue:v39 forKey:*MEMORY[0x1E4F2FCE8]];
    uint64_t v40 = *MEMORY[0x1E4F2F8D8];
    if ([v30 valueForKey:*MEMORY[0x1E4F2F8D8]]) {
      objc_msgSend(v30, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v35), v40);
    }
    uint64_t v41 = *MEMORY[0x1E4F2F8E0];
    if ([v30 valueForKey:*MEMORY[0x1E4F2F8E0]]) {
      objc_msgSend(v30, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v37), v41);
    }
    return (id)[v21 imageBySettingProperties:v26];
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v45;
LABEL_19:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v45 != v17) {
      objc_enumerationMutation(v14);
    }
    uint64_t v19 = *(void **)(*((void *)&v44 + 1) + 8 * v18);
    if (objc_msgSend((id)objc_msgSend(v19, "inputKeys"), "containsObject:", @"inputScaleFactor")) {
      objc_msgSend(v19, "setValue:forKey:", -[CIRAWFilterImpl valueForKey:](v42, "valueForKey:", @"inputScaleFactor"), @"inputScaleFactor");
    }
    [v19 setValue:v5 forKey:@"inputImage"];
    id v5 = (id)[v19 outputImage];
    if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "isEqualToString:", @"RAWCropFilter"))BOOL v20 = v8 <= 1.0; {
    else
    }
      BOOL v20 = 0;
    if (v20)
    {
      long long v48 = v55;
      long long v49 = v56;
      long long v50 = v57;
      id v5 = (id)scaleImageWithQuality(v5, &v48);
    }
    [v19 setValue:0 forKey:@"inputImage"];
    if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "isEqualToString:", @"RAWReduceNoise") & v7)return v5; {
    if (v16 == ++v18)
    }
    {
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v44 objects:v58 count:16];
      if (v16) {
        goto LABEL_19;
      }
      goto LABEL_33;
    }
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if (([a3 isEqualToString:@"inputNeutralChromaticityX"] & 1) != 0
    || ([a3 isEqualToString:@"inputNeutralChromaticityY"] & 1) != 0
    || ([a3 isEqualToString:@"inputNeutralTemperature"] & 1) != 0
    || ([a3 isEqualToString:@"inputNeutralTint"] & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CIRAWFilterImpl;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (id)RAWFiltersValueForKeyPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSDictionary *)[(CIRAWFilterImpl *)self rawDictionary] objectForKeyedSubscript:@"filters"];
  id v5 = (void *)[a3 componentsSeparatedByString:@"."];
  if ((unint64_t)[v5 count] <= 2)
  {
    if (![v5 count]) {
      return v4;
    }
    objc_super v6 = (void *)[v5 objectAtIndexedSubscript:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      double v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v6, "isEqual:", objc_msgSend((id)objc_opt_class(), "description"))) {
            double v9 = v12;
          }
        }
        uint64_t v8 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    else
    {
      double v9 = 0;
    }
    if ([v5 count] == 1) {
      return v9;
    }
    uint64_t v13 = [v5 objectAtIndexedSubscript:1];
    if (objc_msgSend((id)objc_msgSend(v9, "inputKeys"), "containsObject:", v13)) {
      return (id)[v9 valueForKey:v13];
    }
  }
  return 0;
}

- (id)inputImage
{
  id result = self->_inputImage;
  if (result) {
    return result;
  }
  inputImageSource = self->_inputImageSource;
  if (inputImageSource)
  {
    ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(inputImageSource, 0, (CFDictionaryRef)[(CIRAWFilterImpl *)self rawOptions]);
    if (ImageAtIndex)
    {
      objc_super v6 = ImageAtIndex;
      id v7 = [(NSDictionary *)[(CIRAWFilterImpl *)self rawDictionary] objectForKeyedSubscript:@"filters"];
      uint64_t v8 = (void *)[v7 objectAtIndexedSubscript:0];
      if ([v7 count]
        && (double v9 = (objc_class *)objc_opt_class(),
            [NSStringFromClass(v9) isEqualToString:@"RAWDemosaicFilter"]))
      {
        objc_msgSend(v8, "setValue:forKey:", -[CIImage imageBySettingProperties:](+[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", v6), "imageBySettingProperties:", self->_baseImageProperties), @"inputImage");
        if (objc_msgSend((id)objc_msgSend(v8, "inputKeys"), "containsObject:", @"inputDraftMode")) {
          [v8 setValue:self->inputDraftMode forKey:@"inputDraftMode"];
        }
        if (objc_msgSend((id)objc_msgSend(v8, "inputKeys"), "containsObject:", @"inputScaleFactor")) {
          [v8 setValue:self->inputScaleFactor forKey:@"inputScaleFactor"];
        }
        self->_inputImage = (CIImage *)(id)[v8 outputImage];
        [v8 setValue:0 forKey:@"inputImage"];
      }
      else
      {
        self->_inputImage = [+[CIImage imageWithCGImage:v6] imageBySettingProperties:self->_baseImageProperties];
      }
      CGImageRelease(v6);
      id result = self->_inputImage;
      if (!result) {
        -[CIRAWFilterImpl(CustomAccessors) inputImage]();
      }
      return result;
    }
LABEL_21:
    id result = +[CIImage emptyImage];
    self->_inputImage = (CIImage *)result;
    return result;
  }
  if (!self->_inputImageAndProperties) {
    goto LABEL_21;
  }
  id v10 = [(NSDictionary *)[(CIRAWFilterImpl *)self rawDictionary] objectForKeyedSubscript:@"filters"];
  uint64_t v11 = (void *)[v10 objectAtIndexedSubscript:0];
  if (![v10 count]
    || (uint64_t v12 = (objc_class *)objc_opt_class(),
        ![NSStringFromClass(v12) isEqualToString:@"RAWDemosaicFilter"]))
  {
    id result = (id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inputImageAndProperties, "objectAtIndexedSubscript:", 0), "imageBySettingProperties:", self->_baseImageProperties);
    self->_inputImage = (CIImage *)result;
    if (result) {
      return result;
    }
LABEL_26:
    -[CIRAWFilterImpl(CustomAccessors) inputImage]();
  }
  objc_msgSend(v11, "setValue:forKey:", objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inputImageAndProperties, "objectAtIndexedSubscript:", 0), "imageBySettingProperties:", self->_baseImageProperties), @"inputImage");
  if (objc_msgSend((id)objc_msgSend(v11, "inputKeys"), "containsObject:", @"inputDraftMode")) {
    [v11 setValue:self->inputDraftMode forKey:@"inputDraftMode"];
  }
  if (objc_msgSend((id)objc_msgSend(v11, "inputKeys"), "containsObject:", @"inputScaleFactor")) {
    [v11 setValue:self->inputScaleFactor forKey:@"inputScaleFactor"];
  }
  self->_inputImage = (CIImage *)(id)[v11 outputImage];
  [v11 setValue:0 forKey:@"inputImage"];
  id result = self->_inputImage;
  if (!result) {
    goto LABEL_26;
  }
  return result;
}

- (id)defaultImageOrientation
{
  CFDictionaryRef v3 = NSNumber;
  if ([(NSNumber *)self->inputIgnoreOrientation BOOLValue]
    || [(NSNumber *)self->_defaultOrientation intValue] <= 8
    && [(NSNumber *)self->_defaultOrientation intValue] < 1)
  {
    uint64_t v4 = 1;
  }
  else if ([(NSNumber *)self->_defaultOrientation intValue] <= 8)
  {
    uint64_t v4 = [(NSNumber *)self->_defaultOrientation intValue];
  }
  else
  {
    uint64_t v4 = 8;
  }

  return (id)[v3 numberWithInt:v4];
}

- (id)inputNeutralLocation
{
  double v2 = objc_alloc_init(CIVector);

  return v2;
}

- (void)setInputNeutralLocation:(id)a3
{
  if (!self->_calledDealloc)
  {
    [a3 X];
    double v6 = v5;
    [a3 Y];
    -[CIRAWFilterImpl setTempTintAtPoint:](self, "setTempTintAtPoint:", v6, v7);
  }
}

- (void)setInputScaleFactor:(id)a3
{
  if (!self->_calledDealloc)
  {
    inputScaleFactor = self->inputScaleFactor;
    if (a3)
    {
      if (inputScaleFactor)
      {
        if ([a3 isEqualToValue:inputScaleFactor]) {
          return;
        }
        inputScaleFactor = self->inputScaleFactor;
      }
      int v6 = [(CIRAWFilterImpl *)self subsampling];
      [a3 doubleValue];
      uint64_t v8 = (NSNumber *)(id)objc_msgSend(NSNumber, "numberWithDouble:", fmax(fmin(v7, 1.0), 0.0));
    }
    else
    {
      int v6 = [(CIRAWFilterImpl *)self subsampling];
      uint64_t v8 = 0;
    }
    self->inputScaleFactor = v8;

    if ([(CIRAWFilterImpl *)self subsampling] != v6 || !self->_inputImage)
    {
      [(CIRAWFilterImpl *)self invalidateInputImage];
    }
  }
}

- (void)setInputDraftMode:(id)a3
{
  if (!self->_calledDealloc)
  {
    int v5 = [(NSNumber *)self->inputDraftMode BOOLValue];
    if (v5 != [a3 BOOLValue])
    {
      inputDraftMode = self->inputDraftMode;
      int v7 = [(CIRAWFilterImpl *)self subsampling];
      self->inputDraftMode = (NSNumber *)a3;

      if ([(CIRAWFilterImpl *)self subsampling] != v7 || !self->_inputImage)
      {
        [(CIRAWFilterImpl *)self invalidateInputImage];
      }
    }
  }
}

- (void)setInputEnableSharpening:(id)a3
{
  int v5 = [(NSNumber *)self->inputEnableSharpening BOOLValue];
  if (v5 != [a3 BOOLValue])
  {
    inputEnableSharpening = self->inputEnableSharpening;
    self->inputEnableSharpening = (NSNumber *)a3;

    [(CIRAWFilterImpl *)self invalidateInputImage];
  }
}

- (void)setInputEnableNoiseTracking:(id)a3
{
  int v5 = [(NSNumber *)self->inputEnableNoiseTracking BOOLValue];
  if (v5 != [a3 BOOLValue])
  {
    inputEnableNoiseTracking = self->inputEnableNoiseTracking;
    self->inputEnableNoiseTracking = (NSNumber *)a3;

    [(CIRAWFilterImpl *)self invalidateInputImage];
  }
}

- (void)setInputNoiseReductionAmount:(id)a3
{
  inputNoiseReductionAmount = self->inputNoiseReductionAmount;
  if (inputNoiseReductionAmount != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputNoiseReductionAmount isEqualToNumber:a3]) {
        return;
      }
      inputNoiseReductionAmount = self->inputNoiseReductionAmount;
    }
    self->inputNoiseReductionAmount = (NSNumber *)a3;

    [(CIRAWFilterImpl *)self invalidateInputImage];
  }
}

- (void)setInputEnableVendorLensCorrection:(id)a3
{
  inputEnableVendorLensCorrection = self->inputEnableVendorLensCorrection;
  if (inputEnableVendorLensCorrection != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputEnableVendorLensCorrection isEqualToNumber:a3]) {
        return;
      }
      inputEnableVendorLensCorrection = self->inputEnableVendorLensCorrection;
    }
    self->inputEnableVendorLensCorrection = (NSNumber *)[a3 copy];

    if ([(NSNumber *)[(CIRAWFilterImpl *)self sushiMode] intValue] < 2)
    {
      [(CIRAWFilterImpl *)self invalidateInputImage];
    }
    else
    {
      [(CIRAWFilterImpl *)self invalidateFilters];
    }
  }
}

- (void)setInputLuminanceNoiseReductionAmount:(id)a3
{
  inputLuminanceNoiseReductionAmount = self->inputLuminanceNoiseReductionAmount;
  if (inputLuminanceNoiseReductionAmount != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputLuminanceNoiseReductionAmount isEqualToNumber:a3]) {
        return;
      }
      inputLuminanceNoiseReductionAmount = self->inputLuminanceNoiseReductionAmount;
    }
    self->inputLuminanceNoiseReductionAmount = (NSNumber *)[a3 copy];

    if ([(NSNumber *)[(CIRAWFilterImpl *)self sushiMode] intValue] < 2)
    {
      [(CIRAWFilterImpl *)self invalidateInputImage];
    }
    else
    {
      [(CIRAWFilterImpl *)self invalidateFilters];
    }
  }
}

- (void)setInputColorNoiseReductionAmount:(id)a3
{
  inputColorNoiseReductionAmount = self->inputColorNoiseReductionAmount;
  if (inputColorNoiseReductionAmount != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputColorNoiseReductionAmount isEqualToNumber:a3]) {
        return;
      }
      inputColorNoiseReductionAmount = self->inputColorNoiseReductionAmount;
    }
    self->inputColorNoiseReductionAmount = (NSNumber *)[a3 copy];

    if ([(NSNumber *)[(CIRAWFilterImpl *)self sushiMode] intValue] < 2)
    {
      [(CIRAWFilterImpl *)self invalidateInputImage];
    }
    else
    {
      [(CIRAWFilterImpl *)self invalidateFilters];
    }
  }
}

- (void)setInputNoiseReductionSharpnessAmount:(id)a3
{
  inputNoiseReductionSharpnessAmount = self->inputNoiseReductionSharpnessAmount;
  if (inputNoiseReductionSharpnessAmount != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputNoiseReductionSharpnessAmount isEqualToNumber:a3]) {
        return;
      }
      inputNoiseReductionSharpnessAmount = self->inputNoiseReductionSharpnessAmount;
    }
    self->inputNoiseReductionSharpnessAmount = (NSNumber *)[a3 copy];

    if ([(NSNumber *)[(CIRAWFilterImpl *)self sushiMode] intValue] < 2)
    {
      [(CIRAWFilterImpl *)self invalidateInputImage];
    }
    else
    {
      [(CIRAWFilterImpl *)self invalidateFilters];
    }
  }
}

- (void)setInputNoiseReductionContrastAmount:(id)a3
{
  inputNoiseReductionContrastAmount = self->inputNoiseReductionContrastAmount;
  if (inputNoiseReductionContrastAmount != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputNoiseReductionContrastAmount isEqualToNumber:a3]) {
        return;
      }
      inputNoiseReductionContrastAmount = self->inputNoiseReductionContrastAmount;
    }
    self->inputNoiseReductionContrastAmount = (NSNumber *)[a3 copy];

    if ([(NSNumber *)[(CIRAWFilterImpl *)self sushiMode] intValue] < 2)
    {
      [(CIRAWFilterImpl *)self invalidateInputImage];
    }
    else
    {
      [(CIRAWFilterImpl *)self invalidateFilters];
    }
  }
}

- (void)setInputNoiseReductionDetailAmount:(id)a3
{
  inputNoiseReductionDetailAmount = self->inputNoiseReductionDetailAmount;
  if (inputNoiseReductionDetailAmount != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputNoiseReductionDetailAmount isEqualToNumber:a3]) {
        return;
      }
      inputNoiseReductionDetailAmount = self->inputNoiseReductionDetailAmount;
    }
    self->inputNoiseReductionDetailAmount = (NSNumber *)[a3 copy];

    if ([(NSNumber *)[(CIRAWFilterImpl *)self sushiMode] intValue] < 2)
    {
      [(CIRAWFilterImpl *)self invalidateInputImage];
    }
    else
    {
      [(CIRAWFilterImpl *)self invalidateFilters];
    }
  }
}

- (void)setInputMoireAmount:(id)a3
{
  inputMoireAmount = self->inputMoireAmount;
  if (inputMoireAmount != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputMoireAmount isEqualToNumber:a3]) {
        return;
      }
      inputMoireAmount = self->inputMoireAmount;
    }
    self->inputMoireAmount = (NSNumber *)[a3 copy];

    if ([(NSNumber *)[(CIRAWFilterImpl *)self sushiMode] intValue] < 2)
    {
      [(CIRAWFilterImpl *)self invalidateInputImage];
    }
    else
    {
      [(CIRAWFilterImpl *)self invalidateFilters];
    }
  }
}

- (void)setInputEV:(id)a3
{
  inputEV = self->inputEV;
  if (inputEV != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputEV isEqualToNumber:a3]) {
        return;
      }
      inputEV = self->inputEV;
    }
    self->inputEV = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (void)setInputBoost:(id)a3
{
  inputBoost = self->inputBoost;
  if (inputBoost != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputBoost isEqualToNumber:a3]) {
        return;
      }
      inputBoost = self->inputBoost;
    }
    self->inputBoost = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (void)setInputDecoderVersion:(id)a3
{
  int v5 = objc_opt_class();
  if ([v5 isSubclassOfClass:objc_opt_class()]) {
    a3 = (id)[a3 stringValue];
  }
  if (a3)
  {
    int v6 = objc_opt_class();
    if (([v6 isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      int v7 = ci_logger_api();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CIRAWFilterImpl(CustomAccessors) setInputDecoderVersion:](v7);
      }
    }
  }
  if ([(NSArray *)self->_supportedDecoderVersions containsObject:a3])
  {
    if (self->inputDecoderVersion != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
    {
      inputDecoderVersion = self->inputDecoderVersion;
      self->inputDecoderVersion = (NSString *)[a3 copy];

      self->_rawDictionardouble y = 0;
      self->_rawReconstructionDefaultsDictionardouble y = 0;
      [(CIRAWFilterImpl *)self invalidateInputImage];
    }
  }
  else if (self->_isRawSource)
  {
    if ([(NSArray *)self->_supportedDecoderVersions count])
    {
      double v9 = ci_logger_api();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(CIRAWFilterImpl(CustomAccessors) *)(uint64_t)a3 setInputDecoderVersion:v9];
      }
    }
  }
}

- (void)setInputImageOrientation:(id)a3
{
  int v5 = [a3 intValue];
  if (v5 != [(NSNumber *)self->inputImageOrientation intValue])
  {
    inputImageOrientation = self->inputImageOrientation;
    self->inputImageOrientation = (NSNumber *)[a3 copy];
  }
}

- (void)setInputIgnoreOrientation:(id)a3
{
  int v5 = [a3 BOOLValue];
  if (v5 != [(NSNumber *)self->inputIgnoreOrientation BOOLValue])
  {
    inputIgnoreOrientation = self->inputIgnoreOrientation;
    self->inputIgnoreOrientation = (NSNumber *)[a3 copy];

    id v7 = [(CIRAWFilterImpl *)self defaultImageOrientation];
    [(CIRAWFilterImpl *)self setInputImageOrientation:v7];
  }
}

- (void)setInputReturnDemosaiced:(id)a3
{
  int v5 = [a3 intValue];
  if (v5 != [(NSNumber *)self->inputReturnDemosaiced intValue])
  {
    inputReturnDemosaiced = self->inputReturnDemosaiced;
    self->inputReturnDemosaiced = (NSNumber *)[a3 copy];
  }
}

- (id)defaultInputReturnDemosaiced
{
  id result = self->inputReturnDemosaiced;
  if (!result)
  {
    [(CIRAWFilterImpl *)self setInputReturnDemosaiced:[(NSDictionary *)[(CIRAWFilterImpl *)self rawReconstructionDefaultsDictionary] valueForKey:@"kCGImageSourceReturnDemosaiced"]];
    return self->inputReturnDemosaiced;
  }
  return result;
}

- (void)setInputEnableEDRMode:(id)a3
{
  inputEnableEDRMode = self->inputEnableEDRMode;
  if (inputEnableEDRMode != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputEnableEDRMode isEqualToNumber:a3]) {
        return;
      }
      inputEnableEDRMode = self->inputEnableEDRMode;
    }
    self->inputEnableEDRMode = (NSNumber *)a3;

    [(CIRAWFilterImpl *)self invalidateInputImage];
  }
}

- (id)defaultInputLocalToneMapAmount
{
  return [(CIRAWFilterImpl *)self RAWFiltersValueForKeyPath:@"RAWProfileGainTableMap.inputStrength"];
}

- (void)setInputLocalToneMapAmount:(id)a3
{
  inputLocalToneMapAmount = self->inputLocalToneMapAmount;
  if (inputLocalToneMapAmount != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputLocalToneMapAmount isEqualToNumber:a3]) {
        return;
      }
      inputLocalToneMapAmount = self->inputLocalToneMapAmount;
    }
    self->inputLocalToneMapAmount = (NSNumber *)a3;

    [(CIRAWFilterImpl *)self invalidateInputImage];
  }
}

- (id)defaultInputLuminanceNoiseReductionAmount
{
  id result = self->inputLuminanceNoiseReductionAmount;
  if (!result)
  {
    [(CIRAWFilterImpl *)self setInputLuminanceNoiseReductionAmount:[(NSDictionary *)[(CIRAWFilterImpl *)self rawReconstructionDefaultsDictionary] valueForKey:@"kCGImageSourceLuminanceNoiseReductionAmount"]];
    return self->inputLuminanceNoiseReductionAmount;
  }
  return result;
}

- (id)defaultInputColorNoiseReductionAmount
{
  id result = self->inputColorNoiseReductionAmount;
  if (!result)
  {
    [(CIRAWFilterImpl *)self setInputColorNoiseReductionAmount:[(NSDictionary *)[(CIRAWFilterImpl *)self rawReconstructionDefaultsDictionary] valueForKey:@"kCGImageSourceColorNoiseReductionAmount"]];
    return self->inputColorNoiseReductionAmount;
  }
  return result;
}

- (id)defaultInputNoiseReductionContrastAmount
{
  id result = self->inputNoiseReductionContrastAmount;
  if (!result)
  {
    [(CIRAWFilterImpl *)self setInputNoiseReductionContrastAmount:[(NSDictionary *)[(CIRAWFilterImpl *)self rawReconstructionDefaultsDictionary] valueForKey:@"kCGImageSourceNoiseReductionContrastAmount"]];
    return self->inputNoiseReductionContrastAmount;
  }
  return result;
}

- (id)defaultInputNoiseReductionDetailAmount
{
  id result = self->inputNoiseReductionDetailAmount;
  if (!result)
  {
    [(CIRAWFilterImpl *)self setInputNoiseReductionDetailAmount:[(NSDictionary *)[(CIRAWFilterImpl *)self rawReconstructionDefaultsDictionary] valueForKey:@"kCGImageSourceNoiseReductionDetailAmount"]];
    return self->inputNoiseReductionDetailAmount;
  }
  return result;
}

- (id)defaultInputNoiseReductionSharpnessAmount
{
  id result = self->inputNoiseReductionSharpnessAmount;
  if (!result)
  {
    [(CIRAWFilterImpl *)self setInputNoiseReductionSharpnessAmount:[(NSDictionary *)[(CIRAWFilterImpl *)self rawReconstructionDefaultsDictionary] valueForKey:@"kCGImageSourceNoiseReductionSharpnessAmount"]];
    return self->inputNoiseReductionSharpnessAmount;
  }
  return result;
}

- (id)defaultInputMoireAmount
{
  id result = self->inputMoireAmount;
  if (!result)
  {
    [(CIRAWFilterImpl *)self setInputMoireAmount:[(NSDictionary *)[(CIRAWFilterImpl *)self rawReconstructionDefaultsDictionary] valueForKey:@"kCGImageSourceChromaBlurMoireAmount"]];
    return self->inputMoireAmount;
  }
  return result;
}

- (id)defaultInputEnableVendorLensCorrection
{
  if (!self->inputEnableVendorLensCorrection)
  {
    int v3 = objc_msgSend(-[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", @"kCGImageSourceDisableVendorLensDistortionCorrection"), "intValue");
    int v4 = objc_msgSend(-[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", @"kCGImageSourceVendorLensCorrectionFeatures"), "intValue") & 4;
    if (v3) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4 == 0;
    }
    if (v5) {
      int v6 = &unk_1EE4AAD78;
    }
    else {
      int v6 = &unk_1EE4AAD30;
    }
    [(CIRAWFilterImpl *)self setInputEnableVendorLensCorrection:v6];
  }
  return self->inputEnableVendorLensCorrection;
}

- (id)defaultDecoderVersion
{
  id v2 = [(CIRAWFilterImpl *)self supportedDecoderVersions];
  if (!v2) {
    return 0;
  }
  int v3 = v2;
  if (![v2 count]) {
    return 0;
  }

  return (id)[v3 lastObject];
}

- (id)defaultInputEnableEDRMode
{
  id result = self->inputEnableEDRMode;
  if (!result)
  {
    [(CIRAWFilterImpl *)self setInputEnableEDRMode:[(NSDictionary *)[(CIRAWFilterImpl *)self rawReconstructionDefaultsDictionary] valueForKey:@"kCGImageSourceUseEDRMode"]];
    return self->inputEnableEDRMode;
  }
  return result;
}

- (id)supportedSushiModes
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id result = self->_supportedSushiModes;
  if (!result)
  {
    inputImageSource = self->_inputImageSource;
    if (inputImageSource)
    {
      CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(inputImageSource, 0, (CFDictionaryRef)[(CIRAWFilterImpl *)self rawOptions]);
      int v6 = (void *)[(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];
      id v7 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v8 = (void *)[v6 objectForKeyedSubscript:@"kCGImageSourceSupportedSushiLevels"];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            [v7 addObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v10);
      }
      id result = (id)[v7 copy];
      self->_supportedSushiModes = (NSArray *)result;
      if (v5)
      {
        CFRelease(v5);
        return self->_supportedSushiModes;
      }
    }
    else
    {
      id result = self->_inputImageAndProperties;
      if (result)
      {
        uint64_t v13 = (void *)[result objectAtIndexedSubscript:1];
        uint64_t v14 = (void *)[v13 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];
        long long v15 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v16 = objc_msgSend(v14, "objectForKeyedSubscript:", @"kCGImageSourceSupportedSushiLevels", 0);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v22 != v19) {
                objc_enumerationMutation(v16);
              }
              [v15 addObject:*(void *)(*((void *)&v21 + 1) + 8 * j)];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v18);
        }
        id result = (id)[v15 copy];
        self->_supportedSushiModes = (NSArray *)result;
      }
    }
  }
  return result;
}

- (id)supportedDecoderVersions
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!self->_baseImageProperties) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  id result = self->_supportedDecoderVersions;
  if (!result)
  {
    inputImageSource = self->_inputImageSource;
    if (inputImageSource)
    {
      long long v27 = self;
      CFDictionaryRef cf = CGImageSourceCopyPropertiesAtIndex(inputImageSource, 0, (CFDictionaryRef)[(CIRAWFilterImpl *)self rawOptions]);
      CFDictionaryRef v5 = (void *)[(__CFDictionary *)cf objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];
      int v6 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v7 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F2FED0]];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v34 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              [v12 floatValue];
              if (v13 >= 1.0)
              {
                [v12 floatValue];
                if (v14 < 9.0) {
                  [v6 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v12)];
                }
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v9);
      }
      id result = (id)[v6 copy];
      v27->_supportedDecoderVersions = (NSArray *)result;
      if (cf)
      {
        CFRelease(cf);
        return v27->_supportedDecoderVersions;
      }
    }
    else
    {
      id result = self->_inputImageAndProperties;
      if (result)
      {
        long long v28 = self;
        long long v15 = (void *)[result objectAtIndexedSubscript:1];
        long long v16 = (void *)[v15 objectForKeyedSubscript:*MEMORY[0x1E4F2FED8]];
        uint64_t v17 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v18 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F2FED0]];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v30 != v21) {
                objc_enumerationMutation(v18);
              }
              long long v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
              if (objc_opt_respondsToSelector())
              {
                [v23 floatValue];
                if (v24 >= 1.0)
                {
                  [v23 floatValue];
                  if (v25 < 9.0) {
                    [v17 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v23)];
                  }
                }
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v20);
        }
        id result = (id)[v17 copy];
        v28->_supportedDecoderVersions = (NSArray *)result;
      }
    }
  }
  return result;
}

- (void)setInputBias:(id)a3
{
  inputBias = self->inputBias;
  if (inputBias != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputBias isEqualToNumber:a3]) {
        return;
      }
      inputBias = self->inputBias;
    }
    self->inputBias = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)defaultInputBiasAmount
{
  return [(CIRAWFilterImpl *)self RAWFiltersValueForKeyPath:@"RAWAdjustExposureAndBias.inputBias"];
}

- (id)inputBias
{
  return self->inputBias;
}

- (void)setInputBaselineExposure:(id)a3
{
  inputBaselineExposure = self->inputBaselineExposure;
  if (inputBaselineExposure != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputBaselineExposure isEqualToNumber:a3]) {
        return;
      }
      inputBaselineExposure = self->inputBaselineExposure;
    }
    self->inputBaselineExposure = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)defaultInputBaselineExposureAmount
{
  return [(CIRAWFilterImpl *)self RAWFiltersValueForKeyPath:@"RAWAdjustExposureAndBias.inputBaselineExposure"];
}

- (id)inputBaselineExposure
{
  return self->inputBaselineExposure;
}

- (void)setInputHueMagMR:(id)a3
{
  inputHueMagMR = self->inputHueMagMR;
  if (inputHueMagMR != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputHueMagMR isEqualToNumber:a3]) {
        return;
      }
      inputHueMagMR = self->inputHueMagMR;
    }
    self->inputHueMagMR = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)defaultInputHueMagMRAmount
{
  return [(CIRAWFilterImpl *)self RAWFiltersValueForKeyPath:@"RAWHueMagnet.inputHueMagMR"];
}

- (id)inputHueMagMR
{
  return self->inputHueMagMR;
}

- (void)setInputHueMagRY:(id)a3
{
  inputHueMagRY = self->inputHueMagRY;
  if (inputHueMagRY != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputHueMagRY isEqualToNumber:a3]) {
        return;
      }
      inputHueMagRY = self->inputHueMagRY;
    }
    self->inputHueMagRY = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)defaultInputHueMagRYAmount
{
  return [(CIRAWFilterImpl *)self RAWFiltersValueForKeyPath:@"RAWHueMagnet.inputHueMagRY"];
}

- (id)inputHueMagRY
{
  return self->inputHueMagRY;
}

- (void)setInputHueMagYG:(id)a3
{
  inputHueMagYG = self->inputHueMagYG;
  if (inputHueMagYG != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputHueMagYG isEqualToNumber:a3]) {
        return;
      }
      inputHueMagYG = self->inputHueMagYG;
    }
    self->inputHueMagYG = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)defaultInputHueMagYGAmount
{
  return [(CIRAWFilterImpl *)self RAWFiltersValueForKeyPath:@"RAWHueMagnet.inputHueMagYG"];
}

- (id)inputHueMagYG
{
  return self->inputHueMagYG;
}

- (void)setInputHueMagGC:(id)a3
{
  inputHueMagGC = self->inputHueMagGC;
  if (inputHueMagGC != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputHueMagGC isEqualToNumber:a3]) {
        return;
      }
      inputHueMagGC = self->inputHueMagGC;
    }
    self->inputHueMagGC = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)defaultInputHueMagGCAmount
{
  return [(CIRAWFilterImpl *)self RAWFiltersValueForKeyPath:@"RAWHueMagnet.inputHueMagGC"];
}

- (id)inputHueMagGC
{
  return self->inputHueMagGC;
}

- (void)setInputHueMagCB:(id)a3
{
  inputHueMagCB = self->inputHueMagCB;
  if (inputHueMagCB != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputHueMagCB isEqualToNumber:a3]) {
        return;
      }
      inputHueMagCB = self->inputHueMagCB;
    }
    self->inputHueMagCB = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)defaultInputHueMagCBAmount
{
  return [(CIRAWFilterImpl *)self RAWFiltersValueForKeyPath:@"RAWHueMagnet.inputHueMagCB"];
}

- (id)inputHueMagCB
{
  return self->inputHueMagCB;
}

- (void)setInputHueMagBM:(id)a3
{
  inputHueMagBM = self->inputHueMagBM;
  if (inputHueMagBM != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputHueMagBM isEqualToNumber:a3]) {
        return;
      }
      inputHueMagBM = self->inputHueMagBM;
    }
    self->inputHueMagBM = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)defaultInputHueMagBMAmount
{
  return [(CIRAWFilterImpl *)self RAWFiltersValueForKeyPath:@"RAWHueMagnet.inputHueMagBM"];
}

- (id)inputHueMagBM
{
  return self->inputHueMagBM;
}

- (void)setInputDisableGamutMap:(id)a3
{
  inputDisableGamutMap = self->inputDisableGamutMap;
  if (inputDisableGamutMap != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputDisableGamutMap isEqualToNumber:a3]) {
        return;
      }
      inputDisableGamutMap = self->inputDisableGamutMap;
    }
    self->inputDisableGamutMap = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)inputDisableGamutMap
{
  return self->inputDisableGamutMap;
}

- (void)setInputLinearSpaceFilter:(id)a3
{
  inputLinearSpaceFilter = self->inputLinearSpaceFilter;
  if (inputLinearSpaceFilter != a3)
  {
    self->inputLinearSpaceFilter = (CIFilter *)a3;

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)inputLinearSpaceFilter
{
  return self->inputLinearSpaceFilter;
}

- (void)setInputBoostShadowAmount:(id)a3
{
  inputBoostShadowAmount = self->inputBoostShadowAmount;
  if (inputBoostShadowAmount != a3)
  {
    if (a3)
    {
      if ([(NSNumber *)self->inputBoostShadowAmount isEqualToNumber:a3]) {
        return;
      }
      inputBoostShadowAmount = self->inputBoostShadowAmount;
    }
    self->inputBoostShadowAmount = (NSNumber *)[a3 copy];

    [(CIRAWFilterImpl *)self invalidateFilters];
  }
}

- (id)defaultBoostShadowAmount
{
  id v2 = [(CIRAWFilterImpl *)self rawDictionary];

  return [(NSDictionary *)v2 objectForKeyedSubscript:@"bsamt"];
}

- (id)activeKeys
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)[MEMORY[0x1E4F1CA80] setWithCapacity:30];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = [(NSDictionary *)[(CIRAWFilterImpl *)self rawDictionary] objectForKeyedSubscript:@"filters"];
  uint64_t v20 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v5 = (objc_class *)objc_opt_class();
        int v6 = NSStringFromClass(v5);
        id v7 = @"inputNeutralChromaticityX";
        uint64_t v8 = @"inputNeutralChromaticityY";
        uint64_t v10 = @"inputNeutralTemperature";
        uint64_t v9 = @"inputNeutralTint";
        uint64_t v11 = @"inputNeutralLocation";
        if ([(NSString *)v6 isEqualToString:@"RAWConvert"]) {
          goto LABEL_8;
        }
        id v7 = @"inputNeutralChromaticityX";
        uint64_t v8 = @"inputNeutralChromaticityY";
        uint64_t v10 = @"inputNeutralTemperature";
        uint64_t v9 = @"inputNeutralTint";
        uint64_t v11 = @"inputNeutralLocation";
        if ([(NSString *)v6 isEqualToString:@"RAWAdjustTempTint"]) {
          goto LABEL_8;
        }
        uint64_t v9 = @"inputBias";
        uint64_t v10 = @"inputBaselineExposure";
        uint64_t v11 = @"inputEV";
        if ([(NSString *)v6 isEqualToString:@"RAWAdjustExposureAndBias"]) {
          goto LABEL_9;
        }
        uint64_t v11 = @"inputBoostShadowAmount";
        uint64_t v9 = @"inputBoost";
        if ([(NSString *)v6 isEqualToString:@"RAWAdjustColorTRC"]) {
          goto LABEL_10;
        }
        uint64_t v11 = @"inputBoost";
        if ([(NSString *)v6 isEqualToString:@"RAWAdjustColors"]) {
          goto LABEL_11;
        }
        BOOL v12 = [(NSString *)v6 isEqualToString:@"RAWTemperatureAdjust"];
        float v13 = @"inputNeutralChromaticityX";
        id v7 = @"inputNeutralChromaticityY";
        uint64_t v8 = @"inputNeutralTemperature";
        uint64_t v10 = @"inputNeutralTint";
        uint64_t v9 = @"inputNeutralLocation";
        uint64_t v11 = @"inputEV";
        if (v12
          || (BOOL v14 = [(NSString *)v6 isEqualToString:@"RAWReduceNoise"],
              id v7 = @"inputColorNoiseReductionAmount",
              float v13 = @"inputLuminanceNoiseReductionAmount",
              uint64_t v10 = @"inputNoiseReductionContrastAmount",
              uint64_t v8 = @"inputNoiseReductionSharpnessAmount",
              uint64_t v11 = @"inputMoireAmount",
              uint64_t v9 = @"inputNoiseReductionDetailAmount",
              v14))
        {
          [v3 addObject:v13];
LABEL_8:
          [v3 addObject:v7];
          [v3 addObject:v8];
LABEL_9:
          [v3 addObject:v10];
LABEL_10:
          [v3 addObject:v9];
LABEL_11:
          [v3 addObject:v11];
          goto LABEL_12;
        }
        uint64_t v11 = @"inputEnableVendorLensCorrection";
        if ([(NSString *)v6 isEqualToString:@"RAWLensCorrectionDNG"]) {
          goto LABEL_11;
        }
        uint64_t v11 = @"inputEnableVendorLensCorrection";
        if ([(NSString *)v6 isEqualToString:@"RAWRadialLensCorrection"]) {
          goto LABEL_11;
        }
        uint64_t v11 = @"inputEnableVendorLensCorrection";
        if ([(NSString *)v6 isEqualToString:@"RAWRadialLensCorrectionRB"]) {
          goto LABEL_11;
        }
        uint64_t v11 = @"inputDisableGamutMap";
        if ([(NSString *)v6 isEqualToString:@"RAWGamutMap"]) {
          goto LABEL_11;
        }
        uint64_t v11 = @"inputLocalToneMapAmount";
        if ([(NSString *)v6 isEqualToString:@"RAWProfileGainTableMap"]) {
          goto LABEL_11;
        }
LABEL_12:
        ++v4;
      }
      while (v20 != v4);
      uint64_t v15 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v20 = v15;
    }
    while (v15);
  }
  [v3 addObject:@"inputEV"];
  [v3 addObject:@"inputEnableSharpening"];
  [v3 addObject:@"inputNeutralChromaticityX"];
  [v3 addObject:@"inputNeutralChromaticityY"];
  [v3 addObject:@"inputNeutralTemperature"];
  [v3 addObject:@"inputNeutralTint"];
  [v3 addObject:@"inputNeutralLocation"];
  if ([(CIRAWFilterImpl *)self rawMajorVersion] == 2)
  {
    long long v16 = &kCIInputEnableChromaticNoiseTrackingKey;
  }
  else
  {
    if ([(CIRAWFilterImpl *)self rawMajorVersion] < 6) {
      goto LABEL_32;
    }
    long long v16 = &kCIInputNoiseReductionAmountKey;
  }
  [v3 addObject:*v16];
LABEL_32:
  if ([(CIRAWFilterImpl *)self rawMajorVersion] > 6) {
    [v3 addObject:@"inputEnableEDRMode"];
  }
  return v3;
}

- (id)properties
{
  return self->_baseImageProperties;
}

- (id)outputNativeSize
{
  objc_msgSend(-[CIRAWFilterImpl transformedImageIgnoringOrientation:andIgnoringScaleFactor:](self, "transformedImageIgnoringOrientation:andIgnoringScaleFactor:", 1, 1), "extent");
  double v4 = v3;
  double v6 = v5;
  char v7 = [(CIRAWFilterImpl *)self subsampling];

  return +[CIVector vectorWithX:(double)((int)v4 << v7) Y:(double)((int)v6 << v7)];
}

+ (void)convertNeutralX:(id)a3 y:(id)a4 toTemperature:(id *)a5 tint:(id *)a6
{
  [a3 doubleValue];
  double v10 = v9;
  [a4 doubleValue];
  double v12 = 0.0;
  double v13 = 0.0;
  CI_xy_to_TempTint(&v13, &v12, v10, v11);
  if (a5) {
    *a5 = (id)[NSNumber numberWithDouble:v13];
  }
  if (a6) {
    *a6 = (id)[NSNumber numberWithDouble:v12];
  }
}

+ (void)convertNeutralTemperature:(id)a3 tint:(id)a4 toX:(id *)a5 y:(id *)a6
{
  [a3 doubleValue];
  double v10 = v9;
  [a4 doubleValue];
  double v12 = 0.0;
  double v13 = 0.0;
  CI_TempTint_to_xy(&v13, &v12, v10, v11);
  if (a5) {
    *a5 = (id)[NSNumber numberWithDouble:v13];
  }
  if (a6) {
    *a6 = (id)[NSNumber numberWithDouble:v12];
  }
}

- (void)updateTemperatureAndTint
{
  inputNeutralChromaticityX = self->inputNeutralChromaticityX;
  if (!inputNeutralChromaticityX || !self->inputNeutralChromaticityY)
  {

    self->inputNeutralChromaticityX = 0;
    self->inputNeutralChromaticityY = 0;
    self->inputNeutralChromaticityX = (NSNumber *)[(CIRAWFilterImpl *)self defaultNeutralChromaticityX];
    self->inputNeutralChromaticityY = (NSNumber *)[(CIRAWFilterImpl *)self defaultNeutralChromaticityY];
  }
  if (self->inputNeutralTemperature) {
    p_inputNeutralTemperature = 0;
  }
  else {
    p_inputNeutralTemperature = &self->inputNeutralTemperature;
  }
  if (self->inputNeutralTint) {
    p_inputNeutralTint = 0;
  }
  else {
    p_inputNeutralTint = &self->inputNeutralTint;
  }
  [(id)objc_opt_class() convertNeutralX:self->inputNeutralChromaticityX y:self->inputNeutralChromaticityY toTemperature:p_inputNeutralTemperature tint:p_inputNeutralTint];
  if (p_inputNeutralTemperature) {
    double v6 = *p_inputNeutralTemperature;
  }
  if (p_inputNeutralTint)
  {
    char v7 = *p_inputNeutralTint;
    uint64_t v8 = v7;
  }
}

- (void)updateChomaticityXAndY
{
  if (self->inputNeutralChromaticityX) {
    p_inputNeutralChromaticityX = 0;
  }
  else {
    p_inputNeutralChromaticityX = &self->inputNeutralChromaticityX;
  }
  if (self->inputNeutralChromaticityY) {
    p_inputNeutralChromaticityY = 0;
  }
  else {
    p_inputNeutralChromaticityY = &self->inputNeutralChromaticityY;
  }
  [(id)objc_opt_class() convertNeutralTemperature:self->inputNeutralTemperature tint:self->inputNeutralTint toX:p_inputNeutralChromaticityX y:p_inputNeutralChromaticityY];
  if (p_inputNeutralChromaticityX) {
    double v4 = *p_inputNeutralChromaticityX;
  }
  if (p_inputNeutralChromaticityY)
  {
    double v5 = *p_inputNeutralChromaticityY;
    double v6 = v5;
  }
}

- (id)defaultNeutralTemperature
{
  id v3 = [(NSDictionary *)[(CIRAWFilterImpl *)self rawDictionary] objectForKeyedSubscript:@"wx"];
  id v4 = [(NSDictionary *)[(CIRAWFilterImpl *)self rawDictionary] objectForKeyedSubscript:@"wy"];
  if (v3 && v4)
  {
    char v7 = 0;
    [(id)objc_opt_class() convertNeutralX:v3 y:v4 toTemperature:&v7 tint:0];
    return v7;
  }
  else
  {
    uint64_t v6 = 0;
    char v7 = 0;
    CI_xy_to_TempTint((double *)&v7, (double *)&v6, 0.34570291, 0.3585386);
    return (id)[NSNumber numberWithDouble:*(double *)&v7];
  }
}

- (id)inputNeutralTemperature
{
  id result = self->inputNeutralTemperature;
  if (!result)
  {
    [(CIRAWFilterImpl *)self updateTemperatureAndTint];
    return self->inputNeutralTemperature;
  }
  return result;
}

- (void)setInputNeutralTemperature:(id)a3
{
  if (!self->_calledDealloc)
  {
    inputNeutralTemperature = self->inputNeutralTemperature;
    if (inputNeutralTemperature != a3
      && (!a3 || ![(NSNumber *)inputNeutralTemperature isEqualToNumber:a3]))
    {
      if (!self->inputNeutralTint) {
        [(CIRAWFilterImpl *)self inputNeutralTint];
      }
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralTemperature"];
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralChromaticityX"];
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralChromaticityY"];
      uint64_t v6 = self->inputNeutralTemperature;
      self->inputNeutralTemperature = (NSNumber *)[a3 copy];

      self->inputNeutralChromaticityX = 0;
      self->inputNeutralChromaticityY = 0;
      [(CIRAWFilterImpl *)self invalidateFilters];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralChromaticityY"];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralChromaticityX"];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralTemperature"];
    }
  }
}

- (id)inputNeutralTint
{
  id result = self->inputNeutralTint;
  if (!result)
  {
    [(CIRAWFilterImpl *)self updateTemperatureAndTint];
    return self->inputNeutralTint;
  }
  return result;
}

- (id)defaultNeutralTint
{
  id v3 = [(NSDictionary *)[(CIRAWFilterImpl *)self rawDictionary] objectForKeyedSubscript:@"wx"];
  id v4 = [(NSDictionary *)[(CIRAWFilterImpl *)self rawDictionary] objectForKeyedSubscript:@"wy"];
  if (v3 && v4)
  {
    char v7 = 0;
    [(id)objc_opt_class() convertNeutralX:v3 y:v4 toTemperature:0 tint:&v7];
    return v7;
  }
  else
  {
    double v6 = 0.0;
    char v7 = 0;
    CI_xy_to_TempTint((double *)&v7, &v6, 0.34570291, 0.3585386);
    return (id)[NSNumber numberWithDouble:v6];
  }
}

- (void)setInputNeutralTint:(id)a3
{
  if (!self->_calledDealloc)
  {
    inputNeutralTint = self->inputNeutralTint;
    if (inputNeutralTint != a3 && (!a3 || ![(NSNumber *)inputNeutralTint isEqualToNumber:a3]))
    {
      if (!self->inputNeutralTemperature) {
        [(CIRAWFilterImpl *)self inputNeutralTemperature];
      }
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralTint"];
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralChromaticityX"];
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralChromaticityY"];
      double v6 = self->inputNeutralTint;
      self->inputNeutralTint = (NSNumber *)[a3 copy];

      self->inputNeutralChromaticityX = 0;
      self->inputNeutralChromaticityY = 0;
      [(CIRAWFilterImpl *)self invalidateFilters];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralChromaticityY"];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralChromaticityX"];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralTint"];
    }
  }
}

- (id)defaultNeutralChromaticityX
{
  id v3 = 0;
  objc_msgSend((id)objc_opt_class(), "convertNeutralTemperature:tint:toX:y:", -[CIRAWFilterImpl defaultNeutralTemperature](self, "defaultNeutralTemperature"), -[CIRAWFilterImpl defaultNeutralTint](self, "defaultNeutralTint"), &v3, 0);
  return v3;
}

- (id)inputNeutralChromaticityX
{
  id result = self->inputNeutralChromaticityX;
  if (!result)
  {
    [(CIRAWFilterImpl *)self updateChomaticityXAndY];
    return self->inputNeutralChromaticityX;
  }
  return result;
}

- (void)setInputNeutralChromaticityX:(id)a3
{
  if (!self->_calledDealloc)
  {
    inputNeutralChromaticityX = self->inputNeutralChromaticityX;
    if (inputNeutralChromaticityX != a3
      && (!a3 || ![(NSNumber *)inputNeutralChromaticityX isEqualToNumber:a3]))
    {
      if (!self->inputNeutralChromaticityY) {
        [(CIRAWFilterImpl *)self inputNeutralChromaticityY];
      }
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralChromaticityX"];
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralTint"];
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralTemperature"];
      double v6 = self->inputNeutralChromaticityX;
      self->inputNeutralChromaticityX = (NSNumber *)[a3 copy];

      self->inputNeutralTemperature = 0;
      self->inputNeutralTint = 0;
      [(CIRAWFilterImpl *)self invalidateFilters];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralTemperature"];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralTint"];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralChromaticityX"];
    }
  }
}

- (id)defaultNeutralChromaticityY
{
  id v3 = 0;
  objc_msgSend((id)objc_opt_class(), "convertNeutralTemperature:tint:toX:y:", -[CIRAWFilterImpl defaultNeutralTemperature](self, "defaultNeutralTemperature"), -[CIRAWFilterImpl defaultNeutralTint](self, "defaultNeutralTint"), 0, &v3);
  return v3;
}

- (id)inputNeutralChromaticityY
{
  id result = self->inputNeutralChromaticityY;
  if (!result)
  {
    [(CIRAWFilterImpl *)self updateChomaticityXAndY];
    return self->inputNeutralChromaticityY;
  }
  return result;
}

- (void)setInputNeutralChromaticityY:(id)a3
{
  if (!self->_calledDealloc)
  {
    inputNeutralChromaticityY = self->inputNeutralChromaticityY;
    if (inputNeutralChromaticityY != a3
      && (!a3 || ![(NSNumber *)inputNeutralChromaticityY isEqualToNumber:a3]))
    {
      if (!self->inputNeutralChromaticityX) {
        [(CIRAWFilterImpl *)self inputNeutralChromaticityX];
      }
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralChromaticityY"];
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralTint"];
      [(CIRAWFilterImpl *)self willChangeValueForKey:@"inputNeutralTemperature"];
      double v6 = self->inputNeutralChromaticityY;
      self->inputNeutralChromaticityY = (NSNumber *)[a3 copy];

      self->inputNeutralTemperature = 0;
      self->inputNeutralTint = 0;
      [(CIRAWFilterImpl *)self invalidateFilters];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralTemperature"];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralTint"];
      [(CIRAWFilterImpl *)self didChangeValueForKey:@"inputNeutralChromaticityY"];
    }
  }
}

- (void)setInputRequestedSushiMode:(id)a3
{
  if (!self->_calledDealloc)
  {
    inputRequestedSushiMode = self->inputRequestedSushiMode;
    if (inputRequestedSushiMode != a3)
    {
      if (a3)
      {
        if ([(NSString *)self->inputRequestedSushiMode isEqualToString:a3]) {
          return;
        }
        inputRequestedSushiMode = self->inputRequestedSushiMode;
      }
      self->inputRequestedSushiMode = (NSString *)[a3 copy];

      self->_rawDictionardouble y = 0;
    }
  }
}

- (id)whitePoint
{
  objc_msgSend(-[CIRAWFilterImpl inputNeutralChromaticityX](self, "inputNeutralChromaticityX"), "doubleValue");
  double v4 = v3;
  objc_msgSend(-[CIRAWFilterImpl inputNeutralChromaticityY](self, "inputNeutralChromaticityY"), "doubleValue");

  return +[CIVector vectorWithX:v4 Y:v5];
}

- (id)whitePointArray
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = [(CIRAWFilterImpl *)self inputNeutralChromaticityX];
  v4[1] = [(CIRAWFilterImpl *)self inputNeutralChromaticityY];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
}

- (void)getWhitePointVectorsR:(id *)a3 g:(id *)a4 b:(id *)a5
{
  v12[9] = *(double *)MEMORY[0x1E4F143B8];
  if (!a3 || !a4 || !a5) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CIRAWFilterImpl.m", 2956, @"Invalid parameter not satisfying: %@", @"(rVector != nil) && (gVector != nil) && (bVector != nil)");
  }
  objc_msgSend(-[CIRAWFilterImpl inputNeutralTemperature](self, "inputNeutralTemperature"), "doubleValue");
  double v10 = v9;
  objc_msgSend(-[CIRAWFilterImpl inputNeutralTint](self, "inputNeutralTint"), "doubleValue");
  tempTint_to_matrix((uint64_t)v12, v10, v11);
  *a3 = +[CIVector vectorWithX:v12[0] Y:v12[1] Z:v12[2]];
  *a4 = +[CIVector vectorWithX:v12[3] Y:v12[4] Z:v12[5]];
  *a5 = +[CIVector vectorWithX:v12[6] Y:v12[7] Z:v12[8]];
}

@end