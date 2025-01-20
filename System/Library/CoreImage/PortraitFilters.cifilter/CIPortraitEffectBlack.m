@interface CIPortraitEffectBlack
+ (id)customAttributes;
- (CIImage)inputDepthMap;
- (CIImage)inputDisparity;
- (CIImage)inputFullSizeImage;
- (CIImage)inputMatte;
- (CIVector)inputBandRange;
- (CIVector)inputFocusRect;
- (NSNumber)inputAdaptiveThresholdConstOffset;
- (NSNumber)inputAdaptiveThresholdDoDisparityError;
- (NSNumber)inputAdaptiveThresholdFaceErrorMargin;
- (NSNumber)inputAdaptiveThresholdFaceGroupRange;
- (NSNumber)inputAdaptiveThresholdLinearDepthOffset;
- (NSNumber)inputAdaptiveThresholdRange;
- (NSNumber)inputAdaptiveThresholdZRangeConst;
- (NSNumber)inputAdaptiveThresholdZRangeLinearDepth;
- (NSNumber)inputBackgroundSeparationLikehood;
- (NSNumber)inputContour;
- (NSNumber)inputDepthDataScore;
- (NSNumber)inputDepthThreshold;
- (NSNumber)inputFeatherBandRange;
- (NSNumber)inputFilterCut;
- (NSNumber)inputFocalLengthNormalized;
- (NSNumber)inputGrainAmount;
- (NSNumber)inputLambda;
- (NSNumber)inputMaxNumIterations;
- (NSNumber)inputMaxNumVertices;
- (NSNumber)inputMinimumEffectLevel;
- (NSNumber)inputSharpenRadius;
- (NSNumber)inputSigmaFallout;
- (NSNumber)inputSigmaRChroma;
- (NSNumber)inputSigmaRLuma;
- (NSNumber)inputSigmaS;
- (NSNumber)inputThresholdOffset;
- (NSNumber)inputUseAbsoluteDisparity;
- (id)_CIApplyBlackDepth;
- (id)_CIPrepareBlackDepth;
- (id)_CIPrepareBlackDisparity;
- (id)_CIRefineBlackDepth;
- (id)_applyVignette;
- (id)_faceAndBodyFill_orient1;
- (id)_faceAndBodyFill_orient6;
- (id)_faceProtect;
- (id)_faceVignette;
- (id)_getFocusRect:(id)a3;
- (id)_offsetImage:(id)a3 inputDisparity:(id)a4 thresholdImage:(id)a5;
- (id)adaptiveNormalization2;
- (id)adaptiveNormalizationAbsolute;
- (id)adaptiveNormalizationGPU;
- (id)backgroundPreviewCubeName;
- (id)blendDepth;
- (id)invertRed;
- (id)outputImage;
- (id)previewCubeName;
- (id)standbyCubeName;
- (id)thresholdAndApplyMatte;
- (id)thresholdMatte;
- (unint64_t)_maxNumVerticesForImage:(id)a3 sigmaLuma:(id)a4 sigmaSpace:(id)a5;
- (void)setDefaults;
- (void)setDefaultsAbsoluteDisparity;
- (void)setInputAdaptiveThresholdConstOffset:(id)a3;
- (void)setInputAdaptiveThresholdDoDisparityError:(id)a3;
- (void)setInputAdaptiveThresholdFaceErrorMargin:(id)a3;
- (void)setInputAdaptiveThresholdFaceGroupRange:(id)a3;
- (void)setInputAdaptiveThresholdLinearDepthOffset:(id)a3;
- (void)setInputAdaptiveThresholdRange:(id)a3;
- (void)setInputAdaptiveThresholdZRangeConst:(id)a3;
- (void)setInputAdaptiveThresholdZRangeLinearDepth:(id)a3;
- (void)setInputBackgroundSeparationLikehood:(id)a3;
- (void)setInputBandRange:(id)a3;
- (void)setInputContour:(id)a3;
- (void)setInputDepthDataScore:(id)a3;
- (void)setInputDepthMap:(id)a3;
- (void)setInputDepthThreshold:(id)a3;
- (void)setInputDisparity:(id)a3;
- (void)setInputFeatherBandRange:(id)a3;
- (void)setInputFilterCut:(id)a3;
- (void)setInputFocalLengthNormalized:(id)a3;
- (void)setInputFocusRect:(id)a3;
- (void)setInputFullSizeImage:(id)a3;
- (void)setInputGrainAmount:(id)a3;
- (void)setInputLambda:(id)a3;
- (void)setInputMatte:(id)a3;
- (void)setInputMaxNumIterations:(id)a3;
- (void)setInputMaxNumVertices:(id)a3;
- (void)setInputMinimumEffectLevel:(id)a3;
- (void)setInputSharpenRadius:(id)a3;
- (void)setInputSigmaFallout:(id)a3;
- (void)setInputSigmaRChroma:(id)a3;
- (void)setInputSigmaRLuma:(id)a3;
- (void)setInputSigmaS:(id)a3;
- (void)setInputThresholdOffset:(id)a3;
- (void)setInputUseAbsoluteDisparity:(id)a3;
@end

@implementation CIPortraitEffectBlack

- (id)previewCubeName
{
  return @"CIContourPreview";
}

- (id)standbyCubeName
{
  return @"CIStageStandby";
}

- (id)backgroundPreviewCubeName
{
  return 0;
}

- (void)setDefaults
{
  [(CIPortraitEffect *)self setInputSmooth:&off_7A6C0];
  [(CIPortraitEffect *)self setInputEnrich:&off_7A540];
  [(CIPortraitEffect *)self setInputEyes:&off_7A6C0];
  [(CIPortraitEffect *)self setInputLocalContrast:&off_7A6D0];
  [(CIPortraitEffect *)self setInputStrength:&off_7A580];
  [(CIPortraitEffectBlack *)self setInputDepthThreshold:&off_7A550];
  [(CIPortraitEffect *)self setInputScale:&off_7A580];
  [(CIPortraitEffectBlack *)self setInputUseAbsoluteDisparity:&__kCFBooleanFalse];
  [(CIPortraitEffectBlack *)self setInputMaxNumVertices:&off_7A950];
  [(CIPortraitEffectBlack *)self setInputSigmaS:&off_7A968];
  [(CIPortraitEffectBlack *)self setInputSigmaRLuma:&off_7A980];
  [(CIPortraitEffectBlack *)self setInputSigmaRChroma:&off_7A980];
  [(CIPortraitEffectBlack *)self setInputLambda:&off_7A6E0];
  [(CIPortraitEffectBlack *)self setInputMaxNumIterations:&off_7A998];
  [(CIPortraitEffectBlack *)self setInputBandRange:+[CIVector vectorWithX:0.00999999978 Y:0.200000003]];
  [(CIPortraitEffectBlack *)self setInputFeatherBandRange:&off_7AAC0];
  [(CIPortraitEffectBlack *)self setInputThresholdOffset:&off_7AAD0];
  [(CIPortraitEffectBlack *)self setInputFilterCut:&off_7AAE0];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdRange:&off_7A6F0];
  [(CIPortraitEffectBlack *)self setInputSigmaFallout:&off_7A700];
  [(CIPortraitEffectBlack *)self setInputFocalLengthNormalized:&off_7A540];
  [(CIPortraitEffectBlack *)self setInputDepthDataScore:&off_7A580];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdFaceGroupRange:&off_7A680];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdFaceErrorMargin:&off_7A710];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdZRangeConst:&off_7A720];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdZRangeLinearDepth:&off_7A540];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdConstOffset:&off_7A540];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdLinearDepthOffset:&off_7A730];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdDoDisparityError:&__kCFBooleanTrue];
  [(CIPortraitEffectBlack *)self setInputSharpenRadius:&off_7A740];

  [(CIPortraitEffectBlack *)self setInputGrainAmount:&off_7A750];
}

- (void)setDefaultsAbsoluteDisparity
{
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdFaceGroupRange:&off_7A680];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdFaceErrorMargin:&off_7A710];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdZRangeConst:&off_7A560];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdZRangeLinearDepth:&off_7A540];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdConstOffset:&off_7A550];
  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdLinearDepthOffset:&off_7A760];

  [(CIPortraitEffectBlack *)self setInputAdaptiveThresholdDoDisparityError:&__kCFBooleanFalse];
}

+ (id)customAttributes
{
  v64[0] = kCIAttributeFilterCategories;
  v63[0] = kCICategoryColorAdjustment;
  v63[1] = kCICategoryVideo;
  v63[2] = kCICategoryStillImage;
  v63[3] = kCICategoryBuiltIn;
  v63[4] = kCICategoryApplePrivate;
  v65[0] = +[NSArray arrayWithObjects:v63 count:5];
  v65[1] = @"11";
  v64[1] = kCIAttributeFilterAvailable_iOS;
  v64[2] = kCIAttributeFilterAvailable_Mac;
  v65[2] = @"10.13";
  v64[3] = @"inputSmooth";
  v61[0] = kCIAttributeDefault;
  v61[1] = kCIAttributeType;
  v62[0] = &off_7A6C0;
  v62[1] = kCIAttributeTypeScalar;
  v65[3] = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
  v64[4] = @"inputEnrich";
  v59[0] = kCIAttributeDefault;
  v59[1] = kCIAttributeType;
  v60[0] = &off_7A540;
  v60[1] = kCIAttributeTypeScalar;
  v65[4] = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
  v64[5] = @"inputEyes";
  v57[0] = kCIAttributeDefault;
  v57[1] = kCIAttributeType;
  v58[0] = &off_7A6C0;
  v58[1] = kCIAttributeTypeScalar;
  v65[5] = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
  v64[6] = @"inputLocalContrast";
  v55[0] = kCIAttributeDefault;
  v55[1] = kCIAttributeType;
  v56[0] = &off_7A6D0;
  v56[1] = kCIAttributeTypeScalar;
  v65[6] = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  v64[7] = @"inputDepthThreshold";
  v53[0] = kCIAttributeDefault;
  v53[1] = kCIAttributeType;
  v54[0] = &off_7A550;
  v54[1] = kCIAttributeTypeScalar;
  v65[7] = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
  v64[8] = @"inputScale";
  v51[0] = kCIAttributeDefault;
  v51[1] = kCIAttributeType;
  v52[0] = &off_7A580;
  v52[1] = kCIAttributeTypeScalar;
  v65[8] = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
  v64[9] = @"inputMaxNumVertices";
  v49[0] = kCIAttributeDefault;
  v49[1] = kCIAttributeType;
  v50[0] = &off_7A9B0;
  v50[1] = kCIAttributeTypeInteger;
  v65[9] = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
  v64[10] = @"inputSigmaS";
  v47[0] = kCIAttributeDefault;
  v47[1] = kCIAttributeType;
  v48[0] = &off_7A980;
  v48[1] = kCIAttributeTypeInteger;
  v65[10] = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  v64[11] = @"inputSigmaRLuma";
  v45[0] = kCIAttributeDefault;
  v45[1] = kCIAttributeType;
  v46[0] = &off_7A980;
  v46[1] = kCIAttributeTypeInteger;
  v65[11] = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  v64[12] = @"inputSigmaRChroma";
  v43[0] = kCIAttributeDefault;
  v43[1] = kCIAttributeType;
  v44[0] = &off_7A980;
  v44[1] = kCIAttributeTypeInteger;
  v65[12] = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  v64[13] = @"inputLambda";
  v41[0] = kCIAttributeDefault;
  v41[1] = kCIAttributeType;
  v42[0] = &off_7AAF0;
  v42[1] = kCIAttributeTypeScalar;
  v65[13] = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
  v64[14] = @"inputMaxNumIterations";
  v39[0] = kCIAttributeDefault;
  v39[1] = kCIAttributeType;
  v40[0] = &off_7A998;
  v40[1] = kCIAttributeTypeInteger;
  v65[14] = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  v64[15] = @"inputBandRange";
  v37[0] = kCIAttributeDefault;
  v37[1] = kCIAttributeType;
  v38[0] = +[CIVector vectorWithX:0.00999999978 Y:0.200000003];
  v38[1] = kCIAttributeTypePosition;
  v65[15] = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  v64[16] = @"inputThresholdOffset";
  v35[0] = kCIAttributeDefault;
  v35[1] = kCIAttributeType;
  v36[0] = &off_7AAD0;
  v36[1] = kCIAttributeTypeScalar;
  v65[16] = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  v64[17] = @"inputFilterCut";
  v33[0] = kCIAttributeDefault;
  v33[1] = kCIAttributeType;
  v34[0] = &off_7AAE0;
  v34[1] = kCIAttributeTypeScalar;
  v65[17] = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  v64[18] = @"inputFeatherBandRange";
  v31[0] = kCIAttributeDefault;
  v31[1] = kCIAttributeType;
  v32[0] = &off_7AAC0;
  v32[1] = kCIAttributeTypeScalar;
  v65[18] = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  v64[19] = @"inputAdaptiveThresholdRange";
  v29[0] = kCIAttributeDefault;
  v29[1] = kCIAttributeType;
  v30[0] = &off_7A6F0;
  v30[1] = kCIAttributeTypeScalar;
  v65[19] = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  v64[20] = @"inputSigmaFallout";
  v27[0] = kCIAttributeDefault;
  v27[1] = kCIAttributeType;
  v28[0] = &off_7A700;
  v28[1] = kCIAttributeTypeScalar;
  v65[20] = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  v64[21] = @"inputFocalLengthNormalized";
  v25[0] = kCIAttributeDefault;
  v25[1] = kCIAttributeType;
  v26[0] = &off_7A540;
  v26[1] = kCIAttributeTypeScalar;
  v65[21] = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  v64[22] = @"inputAdaptiveThresholdFaceGroupRange";
  v23[0] = kCIAttributeDefault;
  v23[1] = kCIAttributeType;
  v24[0] = &off_7A680;
  v24[1] = kCIAttributeTypeScalar;
  v65[22] = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v64[23] = @"inputAdaptiveThresholdFaceErrorMargin";
  v21[0] = kCIAttributeDefault;
  v21[1] = kCIAttributeType;
  v22[0] = &off_7A710;
  v22[1] = kCIAttributeTypeScalar;
  v65[23] = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v64[24] = @"inputAdaptiveThresholdZRangeConst";
  v19[0] = kCIAttributeDefault;
  v19[1] = kCIAttributeType;
  v20[0] = &off_7A720;
  v20[1] = kCIAttributeTypeScalar;
  v65[24] = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v64[25] = @"inputAdaptiveThresholdZRangeLinearDepth";
  v17[0] = kCIAttributeDefault;
  v17[1] = kCIAttributeType;
  v18[0] = &off_7A540;
  v18[1] = kCIAttributeTypeScalar;
  v65[25] = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v64[26] = @"inputAdaptiveThresholdConstOffset";
  v15[0] = kCIAttributeDefault;
  v15[1] = kCIAttributeType;
  v16[0] = &off_7A9C8;
  v16[1] = kCIAttributeTypeScalar;
  v65[26] = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v64[27] = @"inputAdaptiveThresholdLinearDepthOffset";
  v13[0] = kCIAttributeDefault;
  v13[1] = kCIAttributeType;
  v14[0] = &off_7A730;
  v14[1] = kCIAttributeTypeScalar;
  v65[27] = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v64[28] = @"inputAdaptiveThresholdDoDisparityError";
  v11[0] = kCIAttributeDefault;
  v11[1] = kCIAttributeType;
  v12[0] = &__kCFBooleanTrue;
  v12[1] = kCIAttributeTypeBoolean;
  v65[28] = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v64[29] = @"inputUseAbsoluteDisparity";
  v9[0] = kCIAttributeDefault;
  v9[1] = kCIAttributeType;
  v10[0] = &__kCFBooleanFalse;
  v10[1] = kCIAttributeTypeBoolean;
  v65[29] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  v64[30] = @"inputSharpenRadius";
  v7[0] = kCIAttributeDefault;
  v7[1] = kCIAttributeType;
  v8[0] = &off_7A740;
  v8[1] = kCIAttributeTypeScalar;
  v65[30] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  v64[31] = @"inputGrainAmount";
  v5[0] = kCIAttributeDefault;
  v5[1] = kCIAttributeType;
  v6[0] = &off_7A750;
  v6[1] = kCIAttributeTypeScalar;
  v65[31] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v64[32] = @"inputDepthDataScore";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeType;
  v4[0] = &off_7A580;
  v4[1] = kCIAttributeTypeScalar;
  v65[32] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:33];
}

- (id)_CIPrepareBlackDisparity
{
  if (qword_8D0A0 != -1) {
    dispatch_once(&qword_8D0A0, &stru_75A78);
  }
  return (id)qword_8D098;
}

- (id)_CIPrepareBlackDepth
{
  if (qword_8D0B0 != -1) {
    dispatch_once(&qword_8D0B0, &stru_75A98);
  }
  return (id)qword_8D0A8;
}

- (id)_CIApplyBlackDepth
{
  if (qword_8D0C0 != -1) {
    dispatch_once(&qword_8D0C0, &stru_75AB8);
  }
  return (id)qword_8D0B8;
}

- (id)_CIRefineBlackDepth
{
  if (qword_8D0D0 != -1) {
    dispatch_once(&qword_8D0D0, &stru_75AD8);
  }
  return (id)qword_8D0C8;
}

- (id)_faceVignette
{
  if (qword_8D0E0 != -1) {
    dispatch_once(&qword_8D0E0, &stru_75AF8);
  }
  return (id)qword_8D0D8;
}

- (id)_faceProtect
{
  if (qword_8D0F0 != -1) {
    dispatch_once(&qword_8D0F0, &stru_75B18);
  }
  return (id)qword_8D0E8;
}

- (id)_faceAndBodyFill_orient1
{
  if (qword_8D100 != -1) {
    dispatch_once(&qword_8D100, &stru_75B38);
  }
  return (id)qword_8D0F8;
}

- (id)_faceAndBodyFill_orient6
{
  if (qword_8D110 != -1) {
    dispatch_once(&qword_8D110, &stru_75B58);
  }
  return (id)qword_8D108;
}

- (id)_applyVignette
{
  if (qword_8D120 != -1) {
    dispatch_once(&qword_8D120, &stru_75B78);
  }
  return (id)qword_8D118;
}

- (id)adaptiveNormalization2
{
  if (qword_8D130 != -1) {
    dispatch_once(&qword_8D130, &stru_75B98);
  }
  return (id)qword_8D128;
}

- (id)adaptiveNormalizationGPU
{
  if (qword_8D140 != -1) {
    dispatch_once(&qword_8D140, &stru_75BB8);
  }
  return (id)qword_8D138;
}

- (id)adaptiveNormalizationAbsolute
{
  if (qword_8D150 != -1) {
    dispatch_once(&qword_8D150, &stru_75BD8);
  }
  return (id)qword_8D148;
}

- (id)invertRed
{
  if (qword_8D160 != -1) {
    dispatch_once(&qword_8D160, &stru_75BF8);
  }
  return (id)qword_8D158;
}

- (id)blendDepth
{
  if (qword_8D170 != -1) {
    dispatch_once(&qword_8D170, &stru_75C18);
  }
  return (id)qword_8D168;
}

- (id)thresholdMatte
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_8D180, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_8D180))
  {
    qword_8D178 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_thresholdMatte(__sample matte, __sample blurMatte, float low, float high) \n { \n float m = smoothstep(low, high, matte.r)*blurMatte.r; \n matte.rgb *= m; \n return matte; \n } \n"];
    __cxa_guard_release(&qword_8D180);
  }
  return (id)qword_8D178;
}

- (id)thresholdAndApplyMatte
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_8D190, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_8D190))
  {
    qword_8D188 = (uint64_t)+[CIColorKernel PFKernelWithString:@"kernel vec4 _pf_thresholdAndApplyMatte(__sample im, __sample matte, __sample m2, vec4 params, float edgeGamma) \n { \n float low = params.x; float high = params.y; float gamma = params.z; float gain = params.w; float m = smoothstep(low, high, pow(matte.r, gamma+edgeGamma*m2.r)); \n im.rgb *= m; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n im.rgb = pow(im.rgb, vec3(1.0+gain-gain*matte.r)); \n im.rgb = mix(.5*im.rgb*im.rgb, im.rgb, 1.0-m2.r); \n float r = im.r/(im.r+im.g+im.b+0.00001); \n float sat = max(min(1.0, (1.0-r)), 0.0); \n float y = dot(im.rgb, vec3(.3333333)); \n im.rgb = mix(sat*(im.rgb-y)+y, im.rgb, m); \n return im; \n } \n"];
    __cxa_guard_release(&qword_8D190);
  }
  return (id)qword_8D188;
}

- (id)_getFocusRect:(id)a3
{
  if (!a3) {
    return 0;
  }
  id result = [a3 objectForKey:kCGImagePropertyExifAuxDictionary];
  if (result)
  {
    id result = [result objectForKey:@"Regions"];
    if (result)
    {
      id v4 = [result objectForKey:@"RegionList"];
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id result = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (result)
      {
        id v5 = result;
        uint64_t v6 = *(void *)v12;
        while (2)
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v12 != v6) {
              objc_enumerationMutation(v4);
            }
            v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            id v9 = [v8 objectForKey:@"Type"];
            if (v9
              && [v9 isEqualToString:@"Focus"]
              && CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v8, &v10))
            {
              return +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v10.origin.x - v10.size.width * 0.5, 1.0 - v10.origin.y - v10.size.height * 0.5);
            }
          }
          id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
          id result = 0;
          if (v5) {
            continue;
          }
          break;
        }
      }
    }
  }
  return result;
}

- (id)_offsetImage:(id)a3 inputDisparity:(id)a4 thresholdImage:(id)a5
{
  *(void *)&long long v60 = +[CIImage emptyImage];
  *((void *)&v60 + 1) = v60;
  *(void *)&long long v61 = v60;
  *((void *)&v61 + 1) = v60;
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v53 = size;
  CGPoint v54 = origin;
  CGSize v55 = size;
  CGPoint v56 = origin;
  CGSize v57 = size;
  CGPoint v58 = origin;
  CGSize v59 = size;
  memset(&v38, 0, sizeof(v38));
  [a4 extent];
  CGFloat v9 = v8;
  [a4 extent];
  CGAffineTransformMakeScale(&v38, v9, v10);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = [a3 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v11)
  {
    id v12 = v11;
    unsigned int v13 = 0;
    uint64_t v14 = *(void *)v35;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(a3);
      }
      sub_461A8(*(void **)(*((void *)&v34 + 1) + 8 * v15));
      CGFloat x = v62.origin.x;
      CGFloat y = v62.origin.y;
      CGFloat width = v62.size.width;
      CGFloat height = v62.size.height;
      if (!CGRectIsNull(v62))
      {
        v20 = &origin.x + 4 * v13;
        CGFloat *v20 = x;
        v20[1] = y;
        void v20[2] = width;
        v20[3] = height;
        CGAffineTransform v33 = v38;
        v63.origin.CGFloat x = x;
        v63.origin.CGFloat y = y;
        v63.size.CGFloat width = width;
        v63.size.CGFloat height = height;
        CGRect v64 = CGRectApplyAffineTransform(v63, &v33);
        v49 = kCIInputExtentKey;
        v50 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v64.origin.x, v64.origin.y, v64.size.width, v64.size.height);
        *((void *)&v60 + v13++) = objc_msgSend(objc_msgSend(a4, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1)), "imageByClampingToExtent");
        if (v13 == 4) {
          break;
        }
      }
      if (v12 == (id)++v15)
      {
        id v12 = [a3 countByEnumeratingWithState:&v34 objects:v51 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    unsigned int v13 = 0;
  }
  if (qword_8D1B0 != -1) {
    dispatch_once(&qword_8D1B0, &stru_75C78);
  }
  v21 = (void *)qword_8D1A8;
  v41[0] = v60;
  v41[1] = v61;
  v42 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v53, v55);
  v43 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v57, v59);
  double v22 = 1.0;
  if (v13) {
    double v23 = 1.0;
  }
  else {
    double v23 = 0.0;
  }
  if (v13 <= 1) {
    double v24 = 0.0;
  }
  else {
    double v24 = 1.0;
  }
  if (v13 <= 2) {
    double v25 = 0.0;
  }
  else {
    double v25 = 1.0;
  }
  if (v13 <= 3) {
    double v22 = 0.0;
  }
  v44 = +[CIVector vectorWithX:v23 Y:v24 Z:v25 W:v22];
  [(NSNumber *)[(CIPortraitEffectBlack *)self inputAdaptiveThresholdFaceGroupRange] floatValue];
  v45 = +[CIVector vectorWithX:0.300000012 Y:4.0 Z:v26 W:sub_46318(a4)];
  v46 = [(CIPortraitEffectBlack *)self inputAdaptiveThresholdFaceErrorMargin];
  unsigned int v27 = [(NSNumber *)[(CIPortraitEffectBlack *)self inputAdaptiveThresholdDoDisparityError] BOOLValue];
  v28 = &off_7A540;
  if (v27) {
    v28 = &off_7A580;
  }
  v47 = v28;
  id v48 = [a5 imageByClampingToExtent];
  v29 = +[NSArray arrayWithObjects:v41 count:11];
  uint64_t v39 = kCIKernelOutputFormat;
  v40 = +[NSNumber numberWithInt:kCIFormatRGBAh];
  return objc_msgSend(objc_msgSend(v21, "applyWithExtent:arguments:options:", v29, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1), 0.0, 0.0, 1.0, 1.0), "imageByClampingToExtent");
}

- (unint64_t)_maxNumVerticesForImage:(id)a3 sigmaLuma:(id)a4 sigmaSpace:(id)a5
{
  unint64_t v5 = 221184;
  if (a3)
  {
    [a3 extent];
    if (!CGRectIsInfinite(v11))
    {
      [a3 extent];
      unint64_t v8 = (unint64_t)v7;
      [a3 extent];
      return (unint64_t)v9 * v8;
    }
  }
  return v5;
}

- (id)outputImage
{
  inputImage = self->super.inputImage;
  if (!inputImage) {
    return 0;
  }
  inputDisparitCGFloat y = self->inputDisparity;
  if (!inputDisparity)
  {
    unint64_t v5 = 0;
    goto LABEL_8;
  }
  id v4 = [(CIImage *)inputDisparity depthData];
  unint64_t v5 = v4;
  if (!v4)
  {
LABEL_8:
    char v6 = 1;
    goto LABEL_9;
  }
  char v6 = 0;
  if ((char *)[(AVDepthData *)v4 depthDataAccuracy] == (char *)&dword_0 + 1)
  {
    char v7 = 1;
LABEL_10:
    [(CIPortraitEffectBlack *)self setDefaultsAbsoluteDisparity];
    char v550 = v7;
    goto LABEL_11;
  }
LABEL_9:
  char v7 = 0;
  char v550 = 0;
  if ([(NSNumber *)self->inputUseAbsoluteDisparity BOOLValue]) {
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(-[CIPortraitEffectBlack valueForKey:](self, "valueForKey:", @"inputDepthDataScore"), "floatValue");
  if ((v6 & 1) == 0 && fabs(v8 + -1.0) <= 0.0001)
  {
    [(AVDepthData *)v5 portraitScore];
    if (v9 > 0.0) {
      [(CIPortraitEffectBlack *)self setValue:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:") forKey:@"inputDepthDataScore"];
    }
  }
  if (qword_8D198 != -1) {
    dispatch_once(&qword_8D198, &stru_75C38);
  }
  v574 = self;
  if (self->inputMatte)
  {
    CGFloat v10 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    CGRect v11 = +[CIImage imageWithColor:v10];
    [(CIImage *)inputImage extent];
    id v12 = -[CIImage imageByCroppingToRect:](v11, "imageByCroppingToRect:");
    unsigned int v13 = +[CIImage imageWithColor:v10];
    [(CIImage *)self->super.inputImage extent];
    v570 = -[CIImage imageByCroppingToRect:](v13, "imageByCroppingToRect:");
    inputFaceLandmarkArraCGFloat y = self->super.inputFaceLandmarkArray;
    if (inputFaceLandmarkArray && [(NSArray *)inputFaceLandmarkArray count])
    {
      v651[0] = @"inputFaceLandmarkArray";
      v651[1] = @"inputDepthMap";
      v652[0] = self->super.inputFaceLandmarkArray;
      v652[1] = v12;
      v651[2] = @"inputDepthThreshold";
      v651[3] = @"inputScale";
      inputScale = self->super.inputScale;
      v652[2] = &off_7A550;
      v652[3] = inputScale;
      inputImage = [(CIImage *)inputImage imageByApplyingFilter:@"CIPortraitEffectContour" withInputParameters:+[NSDictionary dictionaryWithObjects:v652 forKeys:v651 count:4]];
    }
    [(CIImage *)self->super.inputImage extent];
    double v548 = v16;
    [(CIImage *)self->inputMatte extent];
    double v546 = v17;
    [(CIImage *)self->super.inputImage extent];
    double v544 = v18;
    [(CIImage *)self->inputMatte extent];
    double v542 = v19;
    id v540 = [(CIPortraitEffectBlack *)self thresholdMatte];
    v20 = self->super.inputFaceLandmarkArray;
    if (v20
      && [(NSArray *)v20 count]
      && (long long v592 = 0u,
          long long v593 = 0u,
          long long v590 = 0u,
          long long v591 = 0u,
          obj = self->super.inputFaceLandmarkArray,
          (id v21 = [(NSArray *)obj countByEnumeratingWithState:&v590 objects:v650 count:16]) != 0))
    {
      unsigned int v22 = 0;
      int v572 = 0;
      uint64_t v23 = *(void *)v591;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v591 != v23) {
            objc_enumerationMutation(obj);
          }
          double v25 = *(void **)(*((void *)&v590 + 1) + 8 * i);
          if ([v25 objectForKeyedSubscript:@"faceJunkinessIndex"])
          {
            objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
            float v27 = v26;
          }
          else
          {
            float v27 = 0.0;
          }
          if ([v25 objectForKeyedSubscript:@"faceBoundingBox"])
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
            float v29 = v28;
          }
          else
          {
            float v29 = 0.0;
          }
          if ([v25 objectForKeyedSubscript:@"roll"])
          {
            objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"roll"), "floatValue");
            float v31 = fabsf(v30);
          }
          else
          {
            float v31 = 0.0;
          }
          if (v27 < -0.2 && v29 > 0.15 && v31 < 1.05)
          {
            v32 = [LightingFacePoints alloc];
            [(CIImage *)v574->super.inputImage extent];
            CGAffineTransform v33 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:](v32, "initWithFaceLandmarkDictionary:forImageRect:", v25);
            [(LightingFacePoints *)v33 faceWidth];
            float v35 = v34;
            [(CIImage *)v574->super.inputImage extent];
            double v37 = v36;
            unsigned int v38 = objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", @"orientation"), "intValue");
            unsigned int v22 = v38;
            if (v38 == 8 || v38 == 6) {
              float v40 = 1.5708;
            }
            else {
              float v40 = 0.0;
            }
            [(LightingFacePoints *)v33 centerChin];
            double v568 = v41;
            [(LightingFacePoints *)v33 centerChin];
            double v565 = v42;
            [(LightingFacePoints *)v33 faceWidth];
            float v44 = v43;
            [(LightingFacePoints *)v33 faceHeight];
            float v45 = v35 / v37;
            float v46 = fmin(v45 * 1.05, 1.0);
            float v47 = v44 * 0.5;
            float v49 = v48 * 4.5 * v46;
            __float2 v50 = __sincosf_stret(v40);
            long double v51 = sin(v40 + v40);
            v52 = +[CIVector vectorWithX:(float)(v50.__cosval * v50.__cosval) / ((v47 + v47) * v47)+ (float)(v50.__sinval * v50.__sinval) / ((v49 + v49) * v49) Y:(double)(v51 / (v49 * 4.0 * v49) - v51 / (v47 * 4.0 * v47)) Z:(float)(v50.__sinval * v50.__sinval) / ((v47 + v47) * v47)+ (float)(v50.__cosval * v50.__cosval) / ((v49 + v49) * v49) W:0.7];
            float v53 = v568;
            float v54 = v565;
            CGSize v55 = +[CIVector vectorWithX:v53 Y:v54];
            id v56 = [(CIPortraitEffectBlack *)v574 _faceVignette];
            [(CIImage *)v574->super.inputImage extent];
            v649[0] = inputImage;
            v649[1] = v570;
            v649[2] = v55;
            v649[3] = v52;
            v570 = (CIImage *)objc_msgSend(v56, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v649, 4), v57, v58, v59, v60);

            ++v572;
          }
        }
        id v21 = [(NSArray *)obj countByEnumeratingWithState:&v590 objects:v650 count:16];
      }
      while (v21);
    }
    else
    {
      unsigned int v22 = 0;
      int v572 = 0;
    }
    long long v61 = [(CIImage *)v574->inputMatte imageByClampingToExtent];
    CGAffineTransformMakeScale(&v589, 0.5, 0.5);
    CGRect v62 = [(CIImage *)v61 imageByApplyingTransform:&v589];
    if (v550)
    {
      double v64 = 1.25;
      LODWORD(v63) = 1096548352;
    }
    else
    {
      unsigned int v68 = [(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue];
      double v63 = 1.0;
      if (v68) {
        double v64 = 1.25;
      }
      else {
        double v64 = 1.0;
      }
      LODWORD(v63) = 1091305472;
      if (v68) {
        *(float *)&double v63 = 13.75;
      }
    }
    if (v22)
    {
      if (v22 == 8 || v22 == 6) {
        float v70 = 0.0;
      }
      else {
        float v70 = 1.5708;
      }
      v647[0] = @"inputRadius";
      v648[0] = +[NSNumber numberWithFloat:v63];
      v647[1] = @"inputAngle";
      *(float *)&double v71 = v70;
      v648[1] = +[NSNumber numberWithFloat:v71];
      v72 = [[(CIImage *)v62 imageByApplyingFilter:@"CIMotionBlur" withInputParameters:+[NSDictionary dictionaryWithObjects:v648 forKeys:v647 count:2]] imageByApplyingGaussianBlurWithSigma:v64];
    }
    else
    {
      [(NSNumber *)v574->super.inputScale floatValue];
      v72 = [(CIImage *)v62 imageByApplyingGaussianBlurWithSigma:v74 * 8.0];
    }
    v75 = v72;
    double v76 = 0.0;
    if (((v22 - 6) & 0xFFFFFFFD) != 0) {
      *(float *)&double v76 = 1.5708;
    }
    if (v22) {
      float v77 = *(float *)&v76;
    }
    else {
      float v77 = 1.5708;
    }
    v645[0] = @"inputRadius";
    LODWORD(v73) = 6.0;
    v646[0] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v73, v76);
    v645[1] = @"inputAngle";
    *(float *)&double v78 = v77;
    v646[1] = +[NSNumber numberWithFloat:v78];
    v79 = [(CIImage *)v62 imageByApplyingFilter:@"CIMotionBlur" withInputParameters:+[NSDictionary dictionaryWithObjects:v646 forKeys:v645 count:2]];
    v80 = [(CIImage *)v62 imageByApplyingFilter:@"CICheapMorphology" withInputParameters:&off_7DE78];
    CFStringRef v643 = @"inputBackgroundImage";
    v644 = v80;
    v81 = [(CIImage *)v79 imageByApplyingFilter:@"CIDifferenceBlendMode" withInputParameters:+[NSDictionary dictionaryWithObjects:&v644 forKeys:&v643 count:1]];
    CGAffineTransformMakeScale(&v588, 2.0, 2.0);
    v82 = [(CIImage *)v75 imageByApplyingTransform:&v588];
    CGAffineTransformMakeScale(&v587, 2.0, 2.0);
    v83 = [(CIImage *)v81 imageByApplyingTransform:&v587];
    [(CIImage *)v574->inputMatte extent];
    v642[0] = v61;
    v642[1] = v82;
    v642[2] = &off_7A540;
    v642[3] = &off_7A550;
    id v88 = objc_msgSend(v540, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v642, 4), v84, v85, v86, v87);
    float v89 = v548;
    float v90 = v546;
    float v91 = v89 / v90;
    float v92 = v544;
    float v93 = v542;
    CGFloat v94 = v91;
    CGFloat v95 = (float)(v92 / v93);
    CGAffineTransformMakeScale(&v586, v91, v95);
    id v96 = [v88 imageByApplyingTransform:&v586];
    [(CIImage *)inputImage extent];
    id v97 = objc_msgSend(v96, "imageByCroppingToRect:");
    CGAffineTransformMakeScale(&v585, v94, v95);
    v98 = [(CIImage *)v83 imageByApplyingTransform:&v585];
    [(CIImage *)inputImage extent];
    v99 = -[CIImage imageByCroppingToRect:](v98, "imageByCroppingToRect:");
    id v100 = [(CIPortraitEffectBlack *)v574 thresholdAndApplyMatte];
    double v101 = 0.5;
    double v102 = 0.100000001;
    int v103 = 1059481190;
    double v104 = 2.20000005;
    if ((v550 & 1) == 0 && ![(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue])
    {
      double v102 = 0.0;
      double v104 = 1.75;
      double v101 = 0.400000006;
      int v103 = 1036831949;
    }
    v105 = +[CIVector vectorWithX:v102 Y:1.0 Z:v101 W:v104];
    [(CIImage *)inputImage extent];
    double v107 = v106;
    double v109 = v108;
    double v111 = v110;
    double v113 = v112;
    v641[0] = inputImage;
    v641[1] = v97;
    v641[2] = v99;
    v641[3] = v105;
    LODWORD(v106) = v103;
    v641[4] = +[NSNumber numberWithFloat:v106];
    id v114 = objc_msgSend(v100, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v641, 5), v107, v109, v111, v113);
    [(NSNumber *)v574->inputSharpenRadius floatValue];
    float v116 = v115;
    [(NSNumber *)v574->super.inputScale floatValue];
    *(float *)&double v118 = v116 * v117;
    v640[0] = &off_7A5E0;
    v639[0] = @"inputSharpness";
    v639[1] = @"inputRadius";
    v640[1] = +[NSNumber numberWithFloat:v118];
    id v119 = objc_msgSend(v114, "imageByApplyingFilter:withInputParameters:", @"CISharpenLuminance", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v640, v639, 2));
    if (v572 >= 1)
    {
      id v120 = [(CIPortraitEffectBlack *)v574 _applyVignette];
      [(CIImage *)v574->super.inputImage extent];
      double v122 = v121;
      double v124 = v123;
      double v126 = v125;
      double v128 = v127;
      v638[0] = v119;
      v638[1] = v570;
      LODWORD(v121) = 1061997773;
      v638[2] = +[NSNumber numberWithFloat:v121];
      id v119 = objc_msgSend(v120, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v638, 3), v122, v124, v126, v128);
    }
    [(NSNumber *)v574->super.inputScale floatValue];
    float v130 = v129;
    [(NSNumber *)v574->inputGrainAmount floatValue];
    *(float *)&double v132 = v130 * v131;
    v636[0] = @"inputAmount";
    v133 = +[NSNumber numberWithFloat:v132];
    v636[1] = @"inputISO";
    v637[0] = v133;
    v637[1] = &off_7A938;
    return objc_msgSend(v119, "imageByApplyingFilter:withInputParameters:", @"CIPhotoGrain", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v637, v636, 2));
  }
  if (!self->inputDepthMap && !self->inputDisparity) {
    return inputImage;
  }
  inputFullSizeImage = self->inputFullSizeImage;
  if (!inputFullSizeImage) {
    inputFullSizeImage = self->super.inputImage;
  }
  if (self->inputDisparity) {
    inputDepthMap = self->inputDisparity;
  }
  else {
    inputDepthMap = self->inputDepthMap;
  }
  inputMinimumEffectLevel = self->inputMinimumEffectLevel;
  if (inputMinimumEffectLevel) {
    BOOL v67 = [(NSNumber *)inputMinimumEffectLevel intValue] == 2;
  }
  else {
    BOOL v67 = 1;
  }
  inputBackgroundSeparationLikehood = self->inputBackgroundSeparationLikehood;
  if (inputBackgroundSeparationLikehood) {
    [(NSNumber *)inputBackgroundSeparationLikehood floatValue];
  }
  else {
    float v135 = 0.0;
  }
  int v136 = v135 > 0.5 || v67;
  int v537 = v136;
  v137 = +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  v138 = +[CIImage imageWithColor:v137];
  [(CIImage *)self->super.inputImage extent];
  v564 = -[CIImage imageByCroppingToRect:](v138, "imageByCroppingToRect:");
  v139 = +[CIImage imageWithColor:v137];
  [(CIImage *)inputDepthMap extent];
  v140 = -[CIImage imageByCroppingToRect:](v139, "imageByCroppingToRect:");
  v141 = +[CIImage imageWithColor:v137];
  [(CIImage *)inputDepthMap extent];
  v142 = -[CIImage imageByCroppingToRect:](v141, "imageByCroppingToRect:");
  v143 = self->super.inputFaceLandmarkArray;
  if (!v143) {
    goto LABEL_151;
  }
  v551 = v142;
  if ([(NSArray *)v143 count])
  {
    v144 = self->super.inputFaceLandmarkArray;
    v634[0] = @"inputFaceLandmarkArray";
    v634[1] = @"inputDepthMap";
    v635[0] = v144;
    v635[1] = v140;
    v634[2] = @"inputDepthThreshold";
    v634[3] = @"inputScale";
    v145 = self->super.inputScale;
    v635[2] = &off_7A550;
    v635[3] = v145;
    inputImage = [(CIImage *)inputImage imageByApplyingFilter:@"CIPortraitEffectContour" withInputParameters:+[NSDictionary dictionaryWithObjects:v635 forKeys:v634 count:4]];
  }
  v146 = self->super.inputFaceLandmarkArray;
  if (!v146) {
    goto LABEL_151;
  }
  v573 = v140;
  NSUInteger v147 = [(NSArray *)v146 count];
  int v148 = v537;
  if (!v147) {
    int v148 = 0;
  }
  if (v148 != 1
    || (long long v583 = 0u,
        long long v584 = 0u,
        long long v581 = 0u,
        long long v582 = 0u,
        v539 = self->super.inputFaceLandmarkArray,
        (id v566 = [(NSArray *)v539 countByEnumeratingWithState:&v581 objects:v633 count:16]) == 0))
  {
LABEL_151:
    unsigned int v571 = 0;
LABEL_152:
    v300 = +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v301 = +[CIImage imageWithColor:v300];
    [(CIImage *)inputDepthMap extent];
    v573 = -[CIImage imageByCroppingToRect:](v301, "imageByCroppingToRect:");
    v302 = +[CIImage imageWithColor:v300];
    [(CIImage *)inputDepthMap extent];
    v551 = -[CIImage imageByCroppingToRect:](v302, "imageByCroppingToRect:");
    [(CIImage *)v574->super.inputImage extent];
    double v304 = v303;
    [(CIImage *)v574->super.inputImage extent];
    float v305 = v304 * 0.5;
    float v307 = v306 * 0.5;
    double v308 = v305;
    float v309 = v305 * 0.3;
    double v310 = v307;
    float v311 = v307 * 0.3;
    v312 = +[CIVector vectorWithX:1.0 / ((v309 + v309) * v309) + 0.0 / ((v311 + v311) * v311) Y:0.0 / (v311 * 4.0 * v311) - 0.0 / (v309 * 4.0 * v309) Z:0.0 / ((v309 + v309) * v309) + 1.0 / ((v311 + v311) * v311) W:0.7];
    v313 = +[CIVector vectorWithX:v308 Y:v310];
    id v314 = [(CIPortraitEffectBlack *)v574 _faceVignette];
    [(CIImage *)v574->super.inputImage extent];
    v624[0] = inputImage;
    v624[1] = v564;
    v624[2] = v313;
    v624[3] = v312;
    v564 = (CIImage *)objc_msgSend(v314, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v624, 4), v315, v316, v317, v318);
    int v299 = 0;
    goto LABEL_153;
  }
  unsigned int v571 = 0;
  int v562 = 0;
  id obja = *(id *)v582;
  uint64_t v547 = kCIKernelOutputFormat;
  unsigned int v545 = kCIFormatRh;
  do
  {
    for (j = 0; j != v566; j = (char *)j + 1)
    {
      if (*(id *)v582 != obja) {
        objc_enumerationMutation(v539);
      }
      v150 = *(void **)(*((void *)&v581 + 1) + 8 * (void)j);
      if ([v150 objectForKeyedSubscript:@"faceJunkinessIndex"])
      {
        objc_msgSend(objc_msgSend(v150, "objectForKeyedSubscript:", @"faceJunkinessIndex"), "floatValue");
        float v152 = v151;
      }
      else
      {
        float v152 = 0.0;
      }
      if ([v150 objectForKeyedSubscript:@"faceBoundingBox"])
      {
        objc_msgSend(objc_msgSend(objc_msgSend(v150, "objectForKeyedSubscript:", @"faceBoundingBox"), "objectForKeyedSubscript:", @"w"), "floatValue");
        float v154 = v153;
      }
      else
      {
        float v154 = 0.0;
      }
      if ([v150 objectForKeyedSubscript:@"roll"])
      {
        objc_msgSend(objc_msgSend(v150, "objectForKeyedSubscript:", @"roll"), "floatValue");
        float v156 = fabsf(v155);
      }
      else
      {
        float v156 = 0.0;
      }
      if (v152 < -0.2 && v154 > 0.15 && v156 < 1.05)
      {
        v157 = [LightingFacePoints alloc];
        [(CIImage *)v574->super.inputImage extent];
        v158 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:](v157, "initWithFaceLandmarkDictionary:forImageRect:", v150);
        [(LightingFacePoints *)v158 faceWidth];
        float v160 = v159;
        [(CIImage *)v574->super.inputImage extent];
        double v162 = v161;
        unsigned int v571 = objc_msgSend(objc_msgSend(v150, "objectForKeyedSubscript:", @"orientation"), "intValue");
        if (v571 == 8 || v571 == 6) {
          float v164 = 1.5708;
        }
        else {
          float v164 = 0.0;
        }
        [(LightingFacePoints *)v158 centerChin];
        double v166 = v165;
        [(LightingFacePoints *)v158 centerChin];
        double v168 = v167;
        [(LightingFacePoints *)v158 faceWidth];
        float v170 = v169;
        [(LightingFacePoints *)v158 faceHeight];
        float v172 = v171;
        float v173 = v170 * 0.5;
        if ((v550 & 1) != 0 || [(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue]) {
          float v173 = v173 * 0.9;
        }
        float v174 = v160 / v162;
        float v175 = fmin(v174 * 1.05, 1.0);
        float v176 = v172 * 4.5 * v175;
        __float2 v177 = __sincosf_stret(v164);
        long double v178 = sin(v164 + v164);
        v179 = +[CIVector vectorWithX:(float)(v177.__sinval * v177.__sinval) / ((v176 + v176) * v176)+ (float)(v177.__cosval * v177.__cosval) / ((v173 + v173) * v173) Y:(double)(v178 / (v176 * 4.0 * v176) - v178 / (v173 * 4.0 * v173)) Z:(float)(v177.__cosval * v177.__cosval) / ((v176 + v176) * v176)+ (float)(v177.__sinval * v177.__sinval) / ((v173 + v173) * v173) W:0.7];
        float v180 = v166;
        float v181 = v168;
        v182 = +[CIVector vectorWithX:v180 Y:v181];
        id v183 = [(CIPortraitEffectBlack *)v574 _faceVignette];
        [(CIImage *)v574->super.inputImage extent];
        v632[0] = inputImage;
        v632[1] = v564;
        v632[2] = v182;
        v632[3] = v179;
        v564 = (CIImage *)objc_msgSend(v183, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v632, 4), v184, v185, v186, v187);

        v188 = [LightingFacePoints alloc];
        [(CIImage *)inputDepthMap extent];
        v189 = -[LightingFacePoints initWithFaceLandmarkDictionary:forImageRect:](v188, "initWithFaceLandmarkDictionary:forImageRect:", v150);
        double v190 = *((double *)[(LightingFacePoints *)v189 rightKickLights] + 4);
        double v191 = *(double *)[(LightingFacePoints *)v189 leftKickLights];
        double v192 = *((double *)[(LightingFacePoints *)v189 rightKickLights] + 5);
        double v193 = *((double *)[(LightingFacePoints *)v189 leftKickLights] + 1);
        [(LightingFacePoints *)v189 faceWidth];
        float v195 = v194;
        [(LightingFacePoints *)v189 faceHeight];
        float v197 = v196;
        [(LightingFacePoints *)v189 centerChin];
        double v199 = v198;
        [(LightingFacePoints *)v189 centerChin];
        float v200 = (v190 + v191) * 0.5;
        float v201 = (v192 + v193) * 0.5;
        float v202 = v195 * 0.17;
        *(float *)&double v193 = v197 * 0.22;
        double v552 = v200;
        float v203 = v200 - v199;
        double v204 = v201;
        *(float *)&double v205 = v201 - v205;
        LODWORD(v199) = atan2f(v203, *(float *)&v205);
        __float2 v206 = __sincosf_stret(*(float *)&v199);
        long double v207 = sin(*(float *)&v199 + *(float *)&v199);
        double v541 = *(float *)&v193;
        double v543 = v202;
        v208 = +[CIVector vectorWithX:(float)(v206.__cosval * v206.__cosval) / ((v543 + v543) * v543)+ (float)(v206.__sinval * v206.__sinval) / ((v541 + v541) * v541) Y:(double)(v207 / (v541 * 4.0 * v541) - v207 / (v543 * 4.0 * v543)) Z:(float)(v206.__sinval * v206.__sinval) / ((v543 + v543) * v543)+ (float)(v206.__cosval * v206.__cosval) / ((v541 + v541) * v541) W:0.7];
        v209 = +[CIVector vectorWithX:v552 Y:v204];
        id v210 = [(CIPortraitEffectBlack *)v574 _faceProtect];
        uint64_t v630 = v547;
        v631 = +[NSNumber numberWithInt:v545];
        v211 = +[NSDictionary dictionaryWithObjects:&v631 forKeys:&v630 count:1];
        [(CIImage *)inputDepthMap extent];
        double v213 = v212;
        double v215 = v214;
        double v217 = v216;
        double v219 = v218;
        v629[0] = inputDepthMap;
        v629[1] = v573;
        v629[2] = v209;
        v629[3] = v208;
        LODWORD(v212) = 1028443341;
        v629[4] = +[NSNumber numberWithFloat:v212];
        v573 = (CIImage *)objc_msgSend(v210, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v629, 5), v211, v213, v215, v217, v219);
        if ((v550 & 1) != 0 || [(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue])
        {
          [(LightingFacePoints *)v189 centerChin];
          double v554 = v220;
          [(LightingFacePoints *)v189 centerChin];
          double v553 = v221;
          [(LightingFacePoints *)v189 centerNose];
          double v223 = v222;
          [(LightingFacePoints *)v189 centerChin];
          double v225 = v224;
          [(LightingFacePoints *)v189 centerNose];
          double v227 = v226;
          [(LightingFacePoints *)v189 centerChin];
          float v228 = v541 * 1.9;
          float v229 = v543 * 1.9;
          float v230 = v223 - v225;
          *(float *)&double v231 = v227 - v231;
          LODWORD(v223) = atan2f(v230, *(float *)&v231);
          __float2 v232 = __sincosf_stret(*(float *)&v223);
          long double v233 = sin(*(float *)&v223 + *(float *)&v223);
          v234 = +[CIVector vectorWithX:(float)(v232.__cosval * v232.__cosval) / ((v229 + v229) * v229)+ (float)(v232.__sinval * v232.__sinval) / ((v228 + v228) * v228) Y:(double)(v233 / (v228 * 4.0 * v228) - v233 / (v229 * 4.0 * v229)) Z:(float)(v232.__sinval * v232.__sinval) / ((v229 + v229) * v229)+ (float)(v232.__cosval * v232.__cosval) / ((v228 + v228) * v228) W:0.7];
          float v235 = v554;
          float v236 = v553;
          v237 = +[CIVector vectorWithX:v235 Y:v236];
          [(CIImage *)inputDepthMap extent];
          double v239 = v238;
          double v241 = v240;
          double v243 = v242;
          double v245 = v244;
          v628[0] = inputDepthMap;
          v628[1] = v573;
          v628[2] = v237;
          v628[3] = v234;
          LODWORD(v238) = 1045220557;
          v628[4] = +[NSNumber numberWithFloat:v238];
          v573 = (CIImage *)objc_msgSend(v210, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v628, 5), v211, v239, v241, v243, v245);
          double v246 = *((double *)[(LightingFacePoints *)v189 rightKickLights] + 4);
          double v247 = *(double *)[(LightingFacePoints *)v189 leftKickLights];
          [(LightingFacePoints *)v189 centerNose];
          double v249 = v248;
          [(LightingFacePoints *)v189 centerChin];
          double v251 = v250;
          [(LightingFacePoints *)v189 faceWidth];
          float v253 = v252;
          [(LightingFacePoints *)v189 faceHeight];
          float v255 = v254;
          [(LightingFacePoints *)v189 centerChin];
          double v257 = v256;
          [(LightingFacePoints *)v189 centerChin];
          float v258 = (v246 + v247) * 0.5;
          float v259 = (v249 + v251) * 0.5;
          float v260 = v259 - v257;
          float v262 = v258 - v261;
          *(float *)&double v263 = atan2f(v260, v262);
          if (v571 == 8 || v571 == 6)
          {
            double v264 = *((double *)[(LightingFacePoints *)v189 rightKickLights] + 5);
            double v265 = *((double *)[(LightingFacePoints *)v189 leftKickLights] + 1);
            [(LightingFacePoints *)v189 centerNose];
            double v267 = v266;
            [(LightingFacePoints *)v189 centerChin];
            double v269 = v268;
            [(LightingFacePoints *)v189 centerChin];
            float v259 = (v264 + v265) * 0.5;
            float v258 = v267;
            float v270 = v258 - v269;
            *(float *)&double v271 = v259 - v271;
            float v272 = atan2f(v270, *(float *)&v271);
          }
          else
          {
            float v272 = *(float *)&v263 + 1.57079633;
          }
          float v555 = v258;
          if ([v150 objectForKeyedSubscript:@"faceOrientationIndex"]) {
            objc_msgSend(objc_msgSend(v150, "objectForKeyedSubscript:", @"faceOrientationIndex"), "floatValue");
          }
          else {
            float v274 = 0.0;
          }
          float v275 = v253 * 0.22;
          float v277 = (fabs(v274 / 3.14159265) * 0.5 + 1.0) * v275;
          __float2 v278 = __sincosf_stret(v272);
          double v279 = v277;
          float v276 = v255 * 0.34;
          long double v280 = sin(v272 + v272);
          v281 = +[CIVector vectorWithX:(float)(v278.__sinval * v278.__sinval) / ((v276 + v276) * v276)+ (float)(v278.__cosval * v278.__cosval) / ((v279 + v279) * v279) Y:(double)(v280 / (v276 * 4.0 * v276) - v280 / (v279 * 4.0 * v279)) Z:(float)(v278.__cosval * v278.__cosval) / ((v276 + v276) * v276)+ (float)(v278.__sinval * v278.__sinval) / ((v279 + v279) * v279) W:0.7];
          float v282 = v555;
          float v283 = v259;
          v284 = v281;
          v285 = +[CIVector vectorWithX:v555 Y:v259];
          switch(v571)
          {
            case 1u:
              id v286 = [(CIPortraitEffectBlack *)v574 _faceAndBodyFill_orient1];
              [(LightingFacePoints *)v189 centerChin];
              float v283 = v287;
              goto LABEL_144;
            case 3u:
              id v286 = [(CIPortraitEffectBlack *)v574 _faceAndBodyFill_orient1];
              [(LightingFacePoints *)v189 centerChin];
              float v283 = v289;
              goto LABEL_142;
            case 6u:
              id v286 = [(CIPortraitEffectBlack *)v574 _faceAndBodyFill_orient6];
              [(LightingFacePoints *)v189 centerChin];
              float v282 = v288;
              goto LABEL_144;
            case 8u:
              id v286 = [(CIPortraitEffectBlack *)v574 _faceAndBodyFill_orient6];
              [(LightingFacePoints *)v189 centerChin];
              float v282 = v290;
LABEL_142:
              double v291 = -1.0;
              break;
            default:
              id v286 = [(CIPortraitEffectBlack *)v574 _faceAndBodyFill_orient6];
LABEL_144:
              double v291 = 1.0;
              break;
          }
          v292 = +[CIVector vectorWithX:v282 Y:v283];
          v293 = +[CIVector vectorWithX:v279 Y:v291];
          uint64_t v626 = v547;
          v627 = +[NSNumber numberWithInt:v545];
          v294 = +[NSDictionary dictionaryWithObjects:&v627 forKeys:&v626 count:1];
          [(CIImage *)inputDepthMap extent];
          v625[0] = v551;
          v625[1] = v285;
          v625[2] = v284;
          v625[3] = v293;
          v625[4] = v292;
          v551 = (CIImage *)objc_msgSend(v286, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v625, 5), v294, v295, v296, v297, v298);
        }
        else
        {
          v273 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]);
          [(CIImage *)inputDepthMap extent];
          v551 = -[CIImage imageByCroppingToRect:](v273, "imageByCroppingToRect:");
        }

        ++v562;
      }
    }
    id v566 = [(NSArray *)v539 countByEnumeratingWithState:&v581 objects:v633 count:16];
  }
  while (v566);
  int v299 = v562;
  if (!v562) {
    goto LABEL_152;
  }
LABEL_153:
  v319 = v574;
  if (v574->inputDisparity)
  {
    int v563 = v299;
    inputFocusRect = v574->inputFocusRect;
    if (!inputFocusRect)
    {
      inputFocusRect = [(CIPortraitEffectBlack *)v574 _getFocusRect:[(CIImage *)v574->super.inputImage properties]];
      v319 = v574;
      if (!inputFocusRect)
      {
        inputFocusRect = +[CIVector vectorWithX:0.45 Y:0.45 Z:0.1 W:0.1];
        v319 = v574;
      }
    }
    v321 = v319->inputDisparity;
    CFStringRef v622 = @"inputFocusRect";
    v623 = inputFocusRect;
    objb = [(CIImage *)v321 imageByApplyingFilter:@"CIConfidenceThreshold" withInputParameters:+[NSDictionary dictionaryWithObjects:&v623 forKeys:&v622 count:1]];
    float v322 = 0.0;
    float v557 = 0.0;
    if (byte_8C8D1) {
      goto LABEL_200;
    }
    v656.data = kCIContextWorkingFormat;
    unsigned int v556 = kCIFormatRGBAh;
    *(void *)&v663.a = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    v323 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", +[NSDictionary dictionaryWithObjects:&v663 forKeys:&v656 count:1]);
    v324 = CGColorSpaceCreateWithName(kCGColorSpaceLinearSRGB);
    v655.data = 0;
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v323, "render:toBitmap:rowBytes:bounds:format:colorSpace:", objb, &v655, 8, v556, v324, 0.0, 0.0, 1.0, 1.0);
    *(_OWORD *)&src.CGFloat height = xmmword_56000;
    src.data = &v655;
    src.rowBytes = 8;
    dest.data = &v664;
    *(_OWORD *)&dest.CGFloat height = xmmword_56000;
    dest.rowBytes = 16;
    vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
    CGColorSpaceRelease(v324);
    float v557 = *(float *)&v664.a;
    v325 = v574->inputDisparity;
    v326 = v574->super.inputFaceLandmarkArray;
    [(NSNumber *)[(CIPortraitEffectBlack *)v574 inputFocalLengthNormalized] floatValue];
    float v328 = v327;
    [(NSNumber *)[(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdFaceGroupRange] floatValue];
    float v549 = v329;
    [(NSNumber *)[(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdFaceErrorMargin] floatValue];
    float v569 = v330;
    unsigned int v331 = [(NSNumber *)[(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdDoDisparityError] BOOLValue];
    v654[1] = 0;
    v654[0] = 0;
    if (v328 <= 0.00000011921) {
      float v328 = sub_46318(v325);
    }
    if (v331)
    {
      long long v595 = 0u;
      long long v596 = 0u;
      memset(&dest, 0, sizeof(dest));
      id v332 = [(NSArray *)v326 countByEnumeratingWithState:&dest objects:&src count:16];
      if (v332)
      {
        int v333 = 0;
        int v334 = 0;
        uint64_t v335 = *(void *)dest.width;
        float v567 = v328 * 0.22;
        float v336 = 0.0;
LABEL_163:
        uint64_t v337 = 0;
        while (1)
        {
          if (*(void *)dest.width != v335) {
            objc_enumerationMutation(v326);
          }
          sub_461A8(*(void **)(dest.height + 8 * v337));
          CGFloat x = v665.origin.x;
          CGFloat y = v665.origin.y;
          CGFloat width = v665.size.width;
          CGFloat height = v665.size.height;
          if (!CGRectIsNull(v665))
          {
            float v342 = 0.0;
            if (v325)
            {
              v666.origin.CGFloat x = x;
              v666.origin.CGFloat y = y;
              v666.size.CGFloat width = width;
              v666.size.CGFloat height = height;
              if (!CGRectIsInfinite(v666))
              {
                memset(&v664, 0, sizeof(v664));
                [(CIImage *)v325 extent];
                CGFloat v344 = v343;
                [(CIImage *)v325 extent];
                CGAffineTransformMakeScale(&v664, v344, v345);
                CGAffineTransform v663 = v664;
                v667.origin.CGFloat x = x;
                v667.origin.CGFloat y = y;
                v667.size.CGFloat width = width;
                v667.size.CGFloat height = height;
                CGRect v668 = CGRectApplyAffineTransform(v667, &v663);
                v661 = kCIInputExtentKey;
                v662 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v668.origin.x, v668.origin.y, v668.size.width, v668.size.height);
                v346 = [(CIImage *)v325 imageByApplyingFilter:@"CIAreaAverage" withInputParameters:+[NSDictionary dictionaryWithObjects:&v662 forKeys:&v661 count:1]];
                if ((atomic_load_explicit((atomic_uchar *volatile)&qword_8D1C0, memory_order_acquire) & 1) == 0
                  && __cxa_guard_acquire(&qword_8D1C0))
                {
                  CIContextOption v659 = kCIContextWorkingFormat;
                  v660 = +[NSNumber numberWithInt:v556];
                  qword_8D1B8 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", +[NSDictionary dictionaryWithObjects:&v660 forKeys:&v659 count:1]);
                  __cxa_guard_release(&qword_8D1C0);
                }
                v658[1] = 0;
                v658[0] = 0;
                uint64_t v657 = 0;
                objc_msgSend((id)qword_8D1B8, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v346, &v657, 8, v556, objc_msgSend((id)qword_8D1B8, "workingColorSpace"), 0.0, 0.0, 1.0, 1.0);
                *(_OWORD *)&v656.CGFloat height = xmmword_56000;
                v656.data = &v657;
                v656.rowBytes = 8;
                *(_OWORD *)&v655.CGFloat height = xmmword_56000;
                v655.data = v658;
                v655.rowBytes = 16;
                vImageConvert_Planar16FtoPlanarF(&v656, &v655, 0);
                float v342 = *(float *)v658;
              }
            }
            *((float *)v654 + v334) = v342;
            v669.origin.CGFloat x = x;
            v669.origin.CGFloat y = y;
            v669.size.CGFloat width = width;
            v669.size.CGFloat height = height;
            double v347 = CGRectGetWidth(v669);
            v670.origin.CGFloat x = x;
            v670.origin.CGFloat y = y;
            v670.size.CGFloat width = width;
            v670.size.CGFloat height = height;
            CGFloat v348 = CGRectGetHeight(v670);
            float v349 = v347;
            *(float *)&CGFloat v348 = v348;
            float v350 = v567 / (float)(v569 * sqrtf((float)(*(float *)&v348 * *(float *)&v348) + (float)(v349 * v349)));
            BOOL v351 = v350 < 0.3 || v350 > 4.0;
            if (!v351)
            {
              float v336 = v336 + (float)(v342 + (float)(-1.0 / v350));
              ++v333;
            }
            int v352 = v334 + 1;
            BOOL v351 = v334++ <= 2;
            if (!v351) {
              break;
            }
          }
          if (v332 == (id)++v337)
          {
            id v353 = [(NSArray *)v326 countByEnumeratingWithState:&dest objects:&src count:16];
            id v332 = v353;
            int v352 = v334;
            if (v353) {
              goto LABEL_163;
            }
            break;
          }
        }
        if (v333 < 1) {
          float v322 = 0.0;
        }
        else {
          float v322 = v336 / (float)v333;
        }
        if (v352 >= 1)
        {
          double v354 = (float)(v557 - v322);
          double v355 = 1.0 / v354;
          if (v354 < 0.1) {
            double v355 = 10.0;
          }
          float v356 = v355;
          float v357 = v549 + v356;
          uint64_t v358 = v352;
          int v359 = -1;
          v360 = (float *)v654;
          float v361 = 3.4028e38;
          do
          {
            float v362 = *v360++;
            float v363 = v362;
            double v364 = (float)(v362 - v322);
            if (v364 >= 0.1) {
              double v365 = 1.0 / v364;
            }
            else {
              double v365 = 10.0;
            }
            float v366 = v365;
            if (v357 > v366 && v363 < v361)
            {
              float v361 = v363;
              int v359 = v352;
            }
            --v358;
          }
          while (v358);
          float v367 = v557;
          if (v359 != -1) {
            float v367 = v361;
          }
          float v557 = v367;
        }
      }
    }
    if (byte_8C8D1) {
LABEL_200:
    }
      id v368 = [(CIPortraitEffectBlack *)v574 _offsetImage:v574->super.inputFaceLandmarkArray inputDisparity:v574->inputDisparity thresholdImage:objb];
    else {
      id v368 = 0;
    }
    id v369 = [(CIPortraitEffectBlack *)v574 _maxNumVerticesForImage:v574->inputDisparity sigmaLuma:v574->inputSigmaRLuma sigmaSpace:v574->inputSigmaS];
    if (qword_8D1A0 != -1) {
      dispatch_once(&qword_8D1A0, &stru_75C58);
    }
    v370 = v574;
    if (!byte_8C8D2)
    {
      id v369 = [(NSNumber *)v574->inputMaxNumVertices integerValue];
      v370 = v574;
    }
    v621[0] = v370->inputDisparity;
    v620[0] = kCIInputDisparityImageKey;
    v620[1] = @"inputMaxNumVertices";
    v371 = +[NSNumber numberWithUnsignedLong:v369];
    inputSigmaS = v574->inputSigmaS;
    inputSigmaRLuma = v574->inputSigmaRLuma;
    v621[1] = v371;
    v620[2] = @"inputSigmaS";
    v620[3] = @"inputSigmaRLuma";
    inputSigmaRChroma = v574->inputSigmaRChroma;
    v621[2] = inputSigmaS;
    v621[3] = inputSigmaRLuma;
    v620[4] = @"inputSigmaRChroma";
    v620[5] = @"inputLambda";
    inputLambda = v574->inputLambda;
    inputMaxNumIterations = v574->inputMaxNumIterations;
    v621[4] = inputSigmaRChroma;
    v621[5] = inputLambda;
    inputThresholdOffset = v574->inputThresholdOffset;
    v620[6] = @"inputMaxNumIterations";
    v620[7] = @"inputThresholdOffset";
    v621[6] = inputMaxNumIterations;
    v621[7] = inputThresholdOffset;
    inputFilterCut = v574->inputFilterCut;
    inputBandRange = v574->inputBandRange;
    v620[8] = @"inputFilterCut";
    v620[9] = @"inputBandRange";
    inputFeatherBandRange = v574->inputFeatherBandRange;
    v621[8] = inputFilterCut;
    v621[9] = inputBandRange;
    v620[10] = @"inputFeatherBandRange";
    v620[11] = @"inputAdaptiveThresholdRange";
    inputAdaptiveThresholdRange = v574->inputAdaptiveThresholdRange;
    inputSigmaFallout = v574->inputSigmaFallout;
    v621[10] = inputFeatherBandRange;
    v621[11] = inputAdaptiveThresholdRange;
    v620[12] = @"inputSigmaFallout";
    v620[13] = @"inputThresholdImage";
    v621[12] = inputSigmaFallout;
    v621[13] = objb;
    v383 = [(CIImage *)inputFullSizeImage imageByApplyingFilter:@"CIPortraitPrepareStage" withInputParameters:+[NSDictionary dictionaryWithObjects:v621 forKeys:v620 count:14]];
    uint64_t v618 = kCIKernelOutputFormat;
    v619 = +[NSNumber numberWithInt:kCIFormatRh];
    v384 = +[NSDictionary dictionaryWithObjects:&v619 forKeys:&v618 count:1];
    if (byte_8C8D1)
    {
      if ((v550 & 1) == 0 && ![(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue])
      {
        id v405 = [(CIPortraitEffectBlack *)v574 adaptiveNormalizationGPU];
        [(CIImage *)v383 extent];
        double v407 = v406;
        double v409 = v408;
        double v411 = v410;
        double v413 = v412;
        v616[0] = v383;
        v616[1] = v368;
        v616[2] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeConst];
        v616[3] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeLinearDepth];
        v616[4] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdConstOffset];
        v616[5] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdLinearDepthOffset];
        inputDepthMap = (CIImage *)objc_msgSend(v405, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v616, 6), v384, v407, v409, v411, v413);
        if (v563 <= 0) {
          goto LABEL_222;
        }
LABEL_214:
        if (![(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue]) {
          goto LABEL_222;
        }
LABEL_215:
        [(NSNumber *)[(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeConst] floatValue];
        int v415 = v414;
        [(NSNumber *)[(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdConstOffset] floatValue];
        if (byte_8C8D1)
        {
          float v417 = v416;
          if ((v550 & 1) == 0 && ![(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue]) {
            goto LABEL_221;
          }
          id v418 = [(CIPortraitEffectBlack *)v574 adaptiveNormalizationAbsolute];
          [(CIImage *)v383 extent];
          double v420 = v419;
          double v422 = v421;
          double v424 = v423;
          double v426 = v425;
          v614[0] = v383;
          v614[1] = v368;
          LODWORD(v419) = v415;
          v614[2] = +[NSNumber numberWithFloat:v419];
          v427 = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeLinearDepth];
          double v428 = v417 + -0.01;
          *(float *)&double v428 = v428;
          v614[3] = v427;
          v614[4] = +[NSNumber numberWithFloat:v428];
          v614[5] = &off_7A730;
          v429 = (CIImage *)objc_msgSend(v418, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v614, 6), v384, v420, v422, v424, v426);
        }
        else
        {
          id v430 = [(CIPortraitEffectBlack *)v574 adaptiveNormalization2];
          [(CIImage *)v383 extent];
          double v432 = v431;
          double v434 = v433;
          double v436 = v435;
          double v438 = v437;
          v613[0] = v383;
          *(float *)&double v431 = v557;
          v613[1] = +[NSNumber numberWithFloat:v431];
          *(float *)&double v439 = v322;
          v613[2] = +[NSNumber numberWithFloat:v439];
          v613[3] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeConst];
          v613[4] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeLinearDepth];
          v613[5] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdConstOffset];
          v613[6] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdLinearDepthOffset];
          v429 = (CIImage *)objc_msgSend(v430, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v613, 7), v384, v432, v434, v436, v438);
        }
        v383 = v429;
LABEL_221:
        [(CIImage *)v383 extent];
        double v441 = v440;
        [(CIImage *)inputFullSizeImage extent];
        double v443 = v442;
        [(CIImage *)v383 extent];
        double v445 = v444;
        [(CIImage *)inputFullSizeImage extent];
        float v446 = v441;
        float v447 = v443;
        float v448 = v446 / v447;
        float v449 = v445;
        float v451 = v450;
        CGAffineTransformMakeScale(&v580, v448, (float)(v449 / v451));
        v452 = [(CIImage *)inputFullSizeImage imageByApplyingTransform:&v580];
        v453 = [[(CIImage *)v452 imageByClampingToExtent] imageByApplyingGaussianBlurWithSigma:2.5];
        [(CIImage *)v452 extent];
        v454 = -[CIImage imageByCroppingToRect:](v453, "imageByCroppingToRect:");
        id v455 = [(CIPortraitEffectBlack *)v574 blendDepth];
        [(CIImage *)inputDepthMap extent];
        v612[0] = inputDepthMap;
        v612[1] = v383;
        v612[2] = v452;
        v612[3] = v454;
        v612[4] = v551;
        inputDepthMap = (CIImage *)objc_msgSend(v455, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v612, 5), v384, v456, v457, v458, v459);
LABEL_222:
        v319 = v574;
        if (v574->inputDisparity)
        {
          id v460 = [(CIPortraitEffectBlack *)v574 invertRed];
          [(CIImage *)inputDepthMap extent];
          v611 = inputDepthMap;
          inputDepthMap = (CIImage *)objc_msgSend(v460, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v611, 1), v461, v462, v463, v464);
          v319 = v574;
        }
        goto LABEL_224;
      }
      id v385 = [(CIPortraitEffectBlack *)v574 adaptiveNormalizationAbsolute];
      [(CIImage *)v383 extent];
      double v387 = v386;
      double v389 = v388;
      double v391 = v390;
      double v393 = v392;
      v617[0] = v383;
      v617[1] = v368;
      v617[2] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeConst];
      v617[3] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeLinearDepth];
      v617[4] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdConstOffset];
      v617[5] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdLinearDepthOffset];
      v394 = (CIImage *)objc_msgSend(v385, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v617, 6), v384, v387, v389, v391, v393);
    }
    else
    {
      id v395 = [(CIPortraitEffectBlack *)v574 adaptiveNormalization2];
      [(CIImage *)v383 extent];
      double v397 = v396;
      double v399 = v398;
      double v401 = v400;
      double v403 = v402;
      v615[0] = v383;
      *(float *)&double v396 = v557;
      v615[1] = +[NSNumber numberWithFloat:v396];
      *(float *)&double v404 = v322;
      v615[2] = +[NSNumber numberWithFloat:v404];
      v615[3] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeConst];
      v615[4] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdZRangeLinearDepth];
      v615[5] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdConstOffset];
      v615[6] = [(CIPortraitEffectBlack *)v574 inputAdaptiveThresholdLinearDepthOffset];
      v394 = (CIImage *)objc_msgSend(v395, "applyWithExtent:arguments:options:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v615, 7), v384, v397, v399, v401, v403);
    }
    inputDepthMap = v394;
    if (v563 <= 0) {
      goto LABEL_222;
    }
    if (v550) {
      goto LABEL_215;
    }
    goto LABEL_214;
  }
LABEL_224:
  p_inputImage = (id *)&v319->super.inputImage;
  [(CIImage *)v319->super.inputImage extent];
  double v467 = v466;
  [(CIImage *)inputDepthMap extent];
  double v469 = v468;
  [*p_inputImage extent];
  double v471 = v470;
  [(CIImage *)inputDepthMap extent];
  double v474 = v473;
  if (!v574->inputDisparity)
  {
    CGAffineTransformMakeScale(&v579, 0.5, 0.5);
    inputDepthMap = [(CIImage *)inputDepthMap imageByApplyingTransform:&v579 highQualityDownsample:1];
  }
  if ((v550 & 1) != 0 || (v475 = [(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue], double v472 = 0.0, v475)) {
    LODWORD(v472) = 0.25;
  }
  CFStringRef v609 = @"inputBackgroundImage";
  CFStringRef v607 = @"inputEV";
  v608 = +[NSNumber numberWithFloat:v472];
  v610 = [(CIImage *)inputDepthMap imageByApplyingFilter:@"CIExposureAdjust" withInputParameters:+[NSDictionary dictionaryWithObjects:&v608 forKeys:&v607 count:1]];
  v476 = [(CIImage *)v573 imageByApplyingFilter:@"CIMultiplyBlendMode" withInputParameters:+[NSDictionary dictionaryWithObjects:&v610 forKeys:&v609 count:1]];
  v477 = [(CIImage *)inputDepthMap imageByClampingToExtent];
  if ((v550 & 1) != 0 || [(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue]) {
    float v479 = 0.5;
  }
  else {
    float v479 = 0.15;
  }
  CFStringRef v605 = @"inputRadius";
  *(float *)&double v478 = v479;
  v606 = +[NSNumber numberWithFloat:v478];
  v480 = [[(CIImage *)v477 imageByApplyingFilter:@"CICheapMorphology" withInputParameters:+[NSDictionary dictionaryWithObjects:&v606 forKeys:&v605 count:1]] imageByApplyingGaussianBlurWithSigma:v479];
  v482 = v480;
  if (v571)
  {
    BOOL v483 = v571 == 8 || v571 == 6;
    LODWORD(v481) = 1070141403;
    if (v483) {
      *(float *)&double v481 = 0.0;
    }
    v604[0] = &off_7A780;
    v603[0] = @"inputRadius";
    v603[1] = @"inputAngle";
    v604[1] = +[NSNumber numberWithFloat:v481];
    v484 = [(CIImage *)v482 imageByApplyingFilter:@"CIMotionBlur" withInputParameters:+[NSDictionary dictionaryWithObjects:v604 forKeys:v603 count:2]];
    if ((v550 & 1) != 0
      || (unsigned int v485 = [(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue], v486 = 4.0, v485))
    {
      double v486 = 8.0;
    }
    v487 = [(CIImage *)v484 imageByApplyingGaussianBlurWithSigma:v486];
  }
  else
  {
    v487 = [(CIImage *)v480 imageByApplyingGaussianBlurWithSigma:8.0];
  }
  v488 = v487;
  float v489 = v467;
  float v490 = v469;
  float v491 = v489 / v490;
  float v492 = v471;
  float v493 = v474;
  CGFloat v494 = v491;
  CGFloat v495 = (float)(v492 / v493);
  CGAffineTransformMakeScale(&v578, v491, v495);
  v496 = [(CIImage *)v488 imageByApplyingTransform:&v578];
  [(CIImage *)inputImage extent];
  v497 = -[CIImage imageByCroppingToRect:](v496, "imageByCroppingToRect:");
  CGAffineTransformMakeScale(&v577, v494, v495);
  v498 = [(CIImage *)v482 imageByApplyingTransform:&v577];
  [(CIImage *)inputImage extent];
  v499 = -[CIImage imageByCroppingToRect:](v498, "imageByCroppingToRect:");
  v500 = [(CIImage *)v476 imageByClampingToExtent];
  CGAffineTransformMakeScale(&v576, v494, v495);
  v501 = [(CIImage *)v500 imageByApplyingTransform:&v576];
  [(CIImage *)inputImage extent];
  v502 = -[CIImage imageByCroppingToRect:](v501, "imageByCroppingToRect:");
  v503 = [(CIImage *)v551 imageByClampingToExtent];
  CGAffineTransformMakeScale(&v575, v494, v495);
  v504 = [(CIImage *)v503 imageByApplyingTransform:&v575];
  [(CIImage *)inputImage extent];
  v505 = -[CIImage imageByCroppingToRect:](v504, "imageByCroppingToRect:");
  if (v537)
  {
    v506 = v505;
    id v507 = [(CIPortraitEffectBlack *)v574 _CIRefineBlackDepth];
    if ((v550 & 1) != 0 || [(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue])
    {
      double v508 = 1.0;
      double v509 = 1.14999998;
      double v510 = 1.45000005;
    }
    else
    {
      double v508 = 0.0;
      double v509 = 0.75;
      double v510 = 0.699999988;
    }
    v511 = +[CIVector vectorWithX:v510 Y:v509 Z:v508];
    [(CIImage *)v574->super.inputImage extent];
    v602[0] = inputImage;
    v602[1] = v497;
    v602[2] = v499;
    v602[3] = v502;
    v602[4] = v511;
    v602[5] = v506;
    inputImage = (CIImage *)objc_msgSend(v507, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v602, 6), v512, v513, v514, v515);
  }
  [(NSNumber *)v574->inputSharpenRadius floatValue];
  float v517 = v516;
  [(NSNumber *)v574->super.inputScale floatValue];
  *(float *)&double v519 = v517 * v518;
  v601[0] = &off_7A5E0;
  v600[0] = @"inputSharpness";
  v600[1] = @"inputRadius";
  v601[1] = +[NSNumber numberWithFloat:v519];
  v520 = [(CIImage *)inputImage imageByApplyingFilter:@"CISharpenLuminance" withInputParameters:+[NSDictionary dictionaryWithObjects:v601 forKeys:v600 count:2]];
  id v521 = [(CIPortraitEffectBlack *)v574 _applyVignette];
  if ((v550 & 1) != 0 || [(NSNumber *)v574->inputUseAbsoluteDisparity BOOLValue]) {
    int v522 = *(_DWORD *)"33s?";
  }
  else {
    int v522 = 1061997773;
  }
  [(CIImage *)v574->super.inputImage extent];
  double v524 = v523;
  double v526 = v525;
  double v528 = v527;
  double v530 = v529;
  v599[0] = v520;
  v599[1] = v564;
  LODWORD(v523) = v522;
  v599[2] = +[NSNumber numberWithFloat:v523];
  id v531 = objc_msgSend(v521, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v599, 3), v524, v526, v528, v530);
  [(NSNumber *)v574->super.inputScale floatValue];
  LODWORD(v524) = v532;
  [(NSNumber *)v574->inputGrainAmount floatValue];
  *(float *)&double v534 = *(float *)&v524 * v533;
  v597[0] = @"inputAmount";
  v535 = +[NSNumber numberWithFloat:v534];
  v597[1] = @"inputISO";
  v598[0] = v535;
  v598[1] = &off_7A938;
  return objc_msgSend(v531, "imageByApplyingFilter:withInputParameters:", @"CIPhotoGrain", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v598, v597, 2));
}

- (NSNumber)inputContour
{
  return self->inputContour;
}

- (void)setInputContour:(id)a3
{
}

- (NSNumber)inputDepthThreshold
{
  return self->inputDepthThreshold;
}

- (void)setInputDepthThreshold:(id)a3
{
}

- (CIImage)inputDepthMap
{
  return self->inputDepthMap;
}

- (void)setInputDepthMap:(id)a3
{
}

- (CIImage)inputDisparity
{
  return self->inputDisparity;
}

- (void)setInputDisparity:(id)a3
{
}

- (CIImage)inputFullSizeImage
{
  return self->inputFullSizeImage;
}

- (void)setInputFullSizeImage:(id)a3
{
}

- (CIImage)inputMatte
{
  return self->inputMatte;
}

- (void)setInputMatte:(id)a3
{
}

- (NSNumber)inputUseAbsoluteDisparity
{
  return self->inputUseAbsoluteDisparity;
}

- (void)setInputUseAbsoluteDisparity:(id)a3
{
}

- (NSNumber)inputSharpenRadius
{
  return self->inputSharpenRadius;
}

- (void)setInputSharpenRadius:(id)a3
{
}

- (NSNumber)inputGrainAmount
{
  return self->inputGrainAmount;
}

- (void)setInputGrainAmount:(id)a3
{
}

- (NSNumber)inputMaxNumVertices
{
  return self->inputMaxNumVertices;
}

- (void)setInputMaxNumVertices:(id)a3
{
}

- (NSNumber)inputSigmaS
{
  return self->inputSigmaS;
}

- (void)setInputSigmaS:(id)a3
{
}

- (NSNumber)inputSigmaRLuma
{
  return self->inputSigmaRLuma;
}

- (void)setInputSigmaRLuma:(id)a3
{
}

- (NSNumber)inputSigmaRChroma
{
  return self->inputSigmaRChroma;
}

- (void)setInputSigmaRChroma:(id)a3
{
}

- (NSNumber)inputLambda
{
  return self->inputLambda;
}

- (void)setInputLambda:(id)a3
{
}

- (NSNumber)inputMaxNumIterations
{
  return self->inputMaxNumIterations;
}

- (void)setInputMaxNumIterations:(id)a3
{
}

- (CIVector)inputBandRange
{
  return (CIVector *)objc_getProperty(self, a2, 264, 1);
}

- (void)setInputBandRange:(id)a3
{
}

- (NSNumber)inputThresholdOffset
{
  return self->inputThresholdOffset;
}

- (void)setInputThresholdOffset:(id)a3
{
}

- (NSNumber)inputFilterCut
{
  return self->inputFilterCut;
}

- (void)setInputFilterCut:(id)a3
{
}

- (NSNumber)inputFeatherBandRange
{
  return self->inputFeatherBandRange;
}

- (void)setInputFeatherBandRange:(id)a3
{
}

- (NSNumber)inputAdaptiveThresholdRange
{
  return self->inputAdaptiveThresholdRange;
}

- (void)setInputAdaptiveThresholdRange:(id)a3
{
}

- (NSNumber)inputSigmaFallout
{
  return self->inputSigmaFallout;
}

- (void)setInputSigmaFallout:(id)a3
{
}

- (NSNumber)inputFocalLengthNormalized
{
  return self->inputFocalLengthNormalized;
}

- (void)setInputFocalLengthNormalized:(id)a3
{
}

- (NSNumber)inputAdaptiveThresholdFaceGroupRange
{
  return self->inputAdaptiveThresholdFaceGroupRange;
}

- (void)setInputAdaptiveThresholdFaceGroupRange:(id)a3
{
}

- (NSNumber)inputAdaptiveThresholdFaceErrorMargin
{
  return self->inputAdaptiveThresholdFaceErrorMargin;
}

- (void)setInputAdaptiveThresholdFaceErrorMargin:(id)a3
{
}

- (NSNumber)inputAdaptiveThresholdZRangeConst
{
  return self->inputAdaptiveThresholdZRangeConst;
}

- (void)setInputAdaptiveThresholdZRangeConst:(id)a3
{
}

- (NSNumber)inputAdaptiveThresholdZRangeLinearDepth
{
  return self->inputAdaptiveThresholdZRangeLinearDepth;
}

- (void)setInputAdaptiveThresholdZRangeLinearDepth:(id)a3
{
}

- (NSNumber)inputAdaptiveThresholdConstOffset
{
  return self->inputAdaptiveThresholdConstOffset;
}

- (void)setInputAdaptiveThresholdConstOffset:(id)a3
{
}

- (NSNumber)inputAdaptiveThresholdLinearDepthOffset
{
  return self->inputAdaptiveThresholdLinearDepthOffset;
}

- (void)setInputAdaptiveThresholdLinearDepthOffset:(id)a3
{
}

- (NSNumber)inputAdaptiveThresholdDoDisparityError
{
  return self->inputAdaptiveThresholdDoDisparityError;
}

- (void)setInputAdaptiveThresholdDoDisparityError:(id)a3
{
}

- (NSNumber)inputMinimumEffectLevel
{
  return self->inputMinimumEffectLevel;
}

- (void)setInputMinimumEffectLevel:(id)a3
{
}

- (NSNumber)inputBackgroundSeparationLikehood
{
  return self->inputBackgroundSeparationLikehood;
}

- (void)setInputBackgroundSeparationLikehood:(id)a3
{
}

- (NSNumber)inputDepthDataScore
{
  return self->inputDepthDataScore;
}

- (void)setInputDepthDataScore:(id)a3
{
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
}

@end