@interface CIRedEyeRaw
- (CIImage)inputIrisMask;
- (CIImage)inputPrimary;
- (CIImage)inputScleraMask;
- (CIImage)inputSecondary;
- (CIImage)inputSkinMask;
- (CIVector)inputAxisLongLeft;
- (CIVector)inputAxisLongRight;
- (CIVector)inputAxisShortLeft;
- (CIVector)inputAxisShortRight;
- (CIVector)inputOriginLeft;
- (CIVector)inputOriginRight;
- (CIVector)inputPupilCenterLeft;
- (CIVector)inputPupilCenterRight;
- (CIVector)inputSize;
- (NSNumber)inputAbortDensityDiff;
- (NSNumber)inputAbortDensityLo;
- (NSNumber)inputCenterSpecRad;
- (NSNumber)inputCentroidGamma;
- (NSNumber)inputCentroidIterations;
- (NSNumber)inputCentroidRadius;
- (NSNumber)inputCentroidRadiusSmall;
- (NSNumber)inputCircularity;
- (NSNumber)inputClipMin;
- (NSNumber)inputClosingDilation;
- (NSNumber)inputClosingErosion;
- (NSNumber)inputCutoff;
- (NSNumber)inputDetectRed;
- (NSNumber)inputDetectWhite;
- (NSNumber)inputDetectionThresholdIrisLarge;
- (NSNumber)inputDetectionThresholdIrisMedium;
- (NSNumber)inputDetectionThresholdIrisSmall;
- (NSNumber)inputDetectionThresholdScleraLarge;
- (NSNumber)inputDetectionThresholdScleraMedium;
- (NSNumber)inputDetectionThresholdScleraSmall;
- (NSNumber)inputDetectionThresholdSkinLarge;
- (NSNumber)inputDetectionThresholdSkinMedium;
- (NSNumber)inputDetectionThresholdSkinSmall;
- (NSNumber)inputFSmooth;
- (NSNumber)inputFalloffDensity;
- (NSNumber)inputFalloffRepair;
- (NSNumber)inputFalloffSpecular;
- (NSNumber)inputFeathering;
- (NSNumber)inputFlooding;
- (NSNumber)inputGamma;
- (NSNumber)inputGlintThreshold;
- (NSNumber)inputInterPeakMin;
- (NSNumber)inputIntersect;
- (NSNumber)inputMaxInterDispersion;
- (NSNumber)inputMidSpectrumWhiteOffsetsX;
- (NSNumber)inputMidSpectrumWhiteOffsetsY;
- (NSNumber)inputMinInterDispersion;
- (NSNumber)inputMinMaskDiff;
- (NSNumber)inputOrientationHint;
- (NSNumber)inputOrientationScale;
- (NSNumber)inputParam;
- (NSNumber)inputParam2;
- (NSNumber)inputParam3;
- (NSNumber)inputParam4;
- (NSNumber)inputRadiusDensity;
- (NSNumber)inputRadiusRepair;
- (NSNumber)inputRadiusSpecular;
- (NSNumber)inputRecover;
- (NSNumber)inputRefilterRange;
- (NSNumber)inputRefilterSpace;
- (NSNumber)inputRepairChroma;
- (NSNumber)inputRepairDarken;
- (NSNumber)inputRepairDither;
- (NSNumber)inputRepairPercent;
- (NSNumber)inputRepairPercentile;
- (NSNumber)inputRepairSource;
- (NSNumber)inputScale;
- (NSNumber)inputScleraProtectionThresholdIrisLarge;
- (NSNumber)inputScleraProtectionThresholdIrisMedium;
- (NSNumber)inputScleraProtectionThresholdIrisSmall;
- (NSNumber)inputScleraProtectionThresholdScleraLarge;
- (NSNumber)inputScleraProtectionThresholdScleraMedium;
- (NSNumber)inputScleraProtectionThresholdScleraSmall;
- (NSNumber)inputScleraProtectionThresholdSkinLarge;
- (NSNumber)inputScleraProtectionThresholdSkinMedium;
- (NSNumber)inputScleraProtectionThresholdSkinSmall;
- (NSNumber)inputScleraThreshold;
- (NSNumber)inputSearchLong;
- (NSNumber)inputSearchShort;
- (NSNumber)inputShowMask;
- (NSNumber)inputSkinProtectionThresholdLarge;
- (NSNumber)inputSkinProtectionThresholdMedium;
- (NSNumber)inputSkinProtectionThresholdSmall;
- (NSNumber)inputSkinThreshold;
- (NSNumber)inputSkinThresholdMed;
- (NSNumber)inputSpecArea;
- (NSNumber)inputSpecAreaScale;
- (NSNumber)inputSpecIntensity;
- (NSNumber)inputSpecMax;
- (NSNumber)inputSpecMin;
- (NSNumber)inputSpecular;
- (NSNumber)inputSpecularCutoff;
- (NSNumber)inputSplat;
- (NSNumber)inputTargetClosing;
- (NSNumber)inputUseFaceSegmentationMask;
- (NSNumber)inputWhiteCutoff;
- (id)irisProtectionMaskWithThresholdIris:(float)a3 thresholdSclera:(float)a4 thresholdSkin:(float)a5;
- (id)outputImage;
- (id)skinProtectionMaskWithThreshold:(float)a3;
- (void)outputImage;
- (void)setInputAbortDensityDiff:(id)a3;
- (void)setInputAbortDensityLo:(id)a3;
- (void)setInputAxisLongLeft:(id)a3;
- (void)setInputAxisLongRight:(id)a3;
- (void)setInputAxisShortLeft:(id)a3;
- (void)setInputAxisShortRight:(id)a3;
- (void)setInputCenterSpecRad:(id)a3;
- (void)setInputCentroidGamma:(id)a3;
- (void)setInputCentroidIterations:(id)a3;
- (void)setInputCentroidRadius:(id)a3;
- (void)setInputCentroidRadiusSmall:(id)a3;
- (void)setInputCircularity:(id)a3;
- (void)setInputClipMin:(id)a3;
- (void)setInputClosingDilation:(id)a3;
- (void)setInputClosingErosion:(id)a3;
- (void)setInputCutoff:(id)a3;
- (void)setInputDetectRed:(id)a3;
- (void)setInputDetectWhite:(id)a3;
- (void)setInputDetectionThresholdIrisLarge:(id)a3;
- (void)setInputDetectionThresholdIrisMedium:(id)a3;
- (void)setInputDetectionThresholdIrisSmall:(id)a3;
- (void)setInputDetectionThresholdScleraLarge:(id)a3;
- (void)setInputDetectionThresholdScleraMedium:(id)a3;
- (void)setInputDetectionThresholdScleraSmall:(id)a3;
- (void)setInputDetectionThresholdSkinLarge:(id)a3;
- (void)setInputDetectionThresholdSkinMedium:(id)a3;
- (void)setInputDetectionThresholdSkinSmall:(id)a3;
- (void)setInputFSmooth:(id)a3;
- (void)setInputFalloffDensity:(id)a3;
- (void)setInputFalloffRepair:(id)a3;
- (void)setInputFalloffSpecular:(id)a3;
- (void)setInputFeathering:(id)a3;
- (void)setInputFlooding:(id)a3;
- (void)setInputGamma:(id)a3;
- (void)setInputGlintThreshold:(id)a3;
- (void)setInputInterPeakMin:(id)a3;
- (void)setInputIntersect:(id)a3;
- (void)setInputIrisMask:(id)a3;
- (void)setInputMaxInterDispersion:(id)a3;
- (void)setInputMidSpectrumWhiteOffsetsX:(id)a3;
- (void)setInputMidSpectrumWhiteOffsetsY:(id)a3;
- (void)setInputMinInterDispersion:(id)a3;
- (void)setInputMinMaskDiff:(id)a3;
- (void)setInputOrientationHint:(id)a3;
- (void)setInputOrientationScale:(id)a3;
- (void)setInputOriginLeft:(id)a3;
- (void)setInputOriginRight:(id)a3;
- (void)setInputParam2:(id)a3;
- (void)setInputParam3:(id)a3;
- (void)setInputParam4:(id)a3;
- (void)setInputParam:(id)a3;
- (void)setInputPrimary:(id)a3;
- (void)setInputPupilCenterLeft:(id)a3;
- (void)setInputPupilCenterRight:(id)a3;
- (void)setInputRadiusDensity:(id)a3;
- (void)setInputRadiusRepair:(id)a3;
- (void)setInputRadiusSpecular:(id)a3;
- (void)setInputRecover:(id)a3;
- (void)setInputRefilterRange:(id)a3;
- (void)setInputRefilterSpace:(id)a3;
- (void)setInputRepairChroma:(id)a3;
- (void)setInputRepairDarken:(id)a3;
- (void)setInputRepairDither:(id)a3;
- (void)setInputRepairPercent:(id)a3;
- (void)setInputRepairPercentile:(id)a3;
- (void)setInputRepairSource:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputScleraMask:(id)a3;
- (void)setInputScleraProtectionThresholdIrisLarge:(id)a3;
- (void)setInputScleraProtectionThresholdIrisMedium:(id)a3;
- (void)setInputScleraProtectionThresholdIrisSmall:(id)a3;
- (void)setInputScleraProtectionThresholdScleraLarge:(id)a3;
- (void)setInputScleraProtectionThresholdScleraMedium:(id)a3;
- (void)setInputScleraProtectionThresholdScleraSmall:(id)a3;
- (void)setInputScleraProtectionThresholdSkinLarge:(id)a3;
- (void)setInputScleraProtectionThresholdSkinMedium:(id)a3;
- (void)setInputScleraProtectionThresholdSkinSmall:(id)a3;
- (void)setInputScleraThreshold:(id)a3;
- (void)setInputSearchLong:(id)a3;
- (void)setInputSearchShort:(id)a3;
- (void)setInputSecondary:(id)a3;
- (void)setInputShowMask:(id)a3;
- (void)setInputSize:(id)a3;
- (void)setInputSkinMask:(id)a3;
- (void)setInputSkinProtectionThresholdLarge:(id)a3;
- (void)setInputSkinProtectionThresholdMedium:(id)a3;
- (void)setInputSkinProtectionThresholdSmall:(id)a3;
- (void)setInputSkinThreshold:(id)a3;
- (void)setInputSkinThresholdMed:(id)a3;
- (void)setInputSpecArea:(id)a3;
- (void)setInputSpecAreaScale:(id)a3;
- (void)setInputSpecIntensity:(id)a3;
- (void)setInputSpecMax:(id)a3;
- (void)setInputSpecMin:(id)a3;
- (void)setInputSpecular:(id)a3;
- (void)setInputSpecularCutoff:(id)a3;
- (void)setInputSplat:(id)a3;
- (void)setInputTargetClosing:(id)a3;
- (void)setInputUseFaceSegmentationMask:(id)a3;
- (void)setInputWhiteCutoff:(id)a3;
@end

@implementation CIRedEyeRaw

- (id)irisProtectionMaskWithThresholdIris:(float)a3 thresholdSclera:(float)a4 thresholdSkin:(float)a5
{
  v22[6] = *MEMORY[0x1E4F143B8];
  v9 = +[CIKernel kernelWithInternalRepresentation:&CI::_drr_extract_iris];
  [(CIImage *)[(CIRedEyeRaw *)self inputIrisMask] extent];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v22[0] = [(CIRedEyeRaw *)self inputIrisMask];
  v22[1] = [(CIRedEyeRaw *)self inputScleraMask];
  v22[2] = [(CIRedEyeRaw *)self inputSkinMask];
  *(float *)&double v18 = a3;
  v22[3] = [NSNumber numberWithFloat:v18];
  *(float *)&double v19 = a4;
  v22[4] = [NSNumber numberWithFloat:v19];
  *(float *)&double v20 = a5;
  v22[5] = [NSNumber numberWithFloat:v20];
  return -[CIColorKernel applyWithExtent:arguments:](v9, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:6], v11, v13, v15, v17);
}

- (id)skinProtectionMaskWithThreshold:(float)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v5 = +[CIKernel kernelWithInternalRepresentation:&CI::_drr_extract_skin];
  [(CIImage *)[(CIRedEyeRaw *)self inputSkinMask] extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v16[0] = [(CIRedEyeRaw *)self inputSkinMask];
  *(float *)&double v14 = a3;
  v16[1] = [NSNumber numberWithFloat:v14];
  return -[CIColorKernel applyWithExtent:arguments:](v5, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2], v7, v9, v11, v13);
}

- (id)outputImage
{
  v2 = self;
  v647[2] = *MEMORY[0x1E4F143B8];
  [(CIVector *)self->inputOriginLeft X];
  CGFloat v569 = v3;
  [(CIVector *)v2->inputOriginLeft Y];
  double v566 = v4;
  [(CIVector *)v2->inputSize X];
  double v567 = v5;
  [(CIVector *)v2->inputSize Y];
  double v568 = v6;
  [(CIVector *)v2->inputOriginRight X];
  double v563 = v7;
  [(CIVector *)v2->inputOriginRight Y];
  double v565 = v8;
  [(CIVector *)v2->inputSize X];
  double v564 = v9;
  [(CIVector *)v2->inputSize Y];
  double v542 = v10;
  [(CIVector *)v2->inputAxisLongLeft _norm];
  float v12 = v11;
  [(CIVector *)v2->inputAxisLongRight _norm];
  float v14 = v13;
  [(CIVector *)v2->inputAxisShortLeft _norm];
  float v531 = v15;
  [(CIVector *)v2->inputAxisShortRight _norm];
  float v571 = v16;
  if (v12 > v14) {
    float v14 = v12;
  }
  [(NSNumber *)v2->inputScale floatValue];
  uint64_t v18 = CIRedEyeUtilsSizeFromScale(v14 * v17);
  double v19 = tagForEye(v18);
  if (CI_LOG_DUALRED())
  {
    double v20 = ci_logger_api();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      [(CIRedEyeRaw *)(uint64_t)v19 outputImage];
    }
  }
  [(NSNumber *)v2->inputAbortDensityDiff floatValue];
  int v512 = v21;
  [(NSNumber *)v2->inputAbortDensityLo floatValue];
  float v541 = v22;
  [(NSNumber *)v2->inputSpecMax floatValue];
  float v503 = v23;
  [(NSNumber *)v2->inputSpecular floatValue];
  float v534 = v24;
  [(NSNumber *)v2->inputSpecMin floatValue];
  float v535 = v25;
  [(NSNumber *)v2->inputClosingErosion floatValue];
  float v508 = v26;
  [(NSNumber *)v2->inputClosingDilation floatValue];
  float v553 = v27;
  [(NSNumber *)v2->inputSplat floatValue];
  float v529 = v28;
  [(CIVector *)v2->inputSize X];
  double v540 = v29;
  [(CIVector *)v2->inputSize Y];
  double v528 = v30;
  [(NSNumber *)v2->inputRepairDarken floatValue];
  float v32 = v31;
  [(NSNumber *)v2->inputRepairDither floatValue];
  float v34 = v33;
  [(NSNumber *)v2->inputRepairChroma floatValue];
  float v536 = v35;
  [(NSNumber *)v2->inputRadiusRepair floatValue];
  float v544 = v36;
  [(NSNumber *)v2->inputRepairPercentile floatValue];
  float v539 = v37;
  [(NSNumber *)v2->inputRepairPercent floatValue];
  float v39 = v38;
  [(NSNumber *)v2->inputClipMin floatValue];
  float v538 = v40;
  [(NSNumber *)v2->inputCircularity floatValue];
  float v537 = v41;
  [(NSNumber *)v2->inputFalloffRepair floatValue];
  float v543 = v42;
  [(NSNumber *)v2->inputWhiteCutoff floatValue];
  float v44 = v43;
  [(NSNumber *)v2->inputSpecArea floatValue];
  float v527 = v45;
  [(NSNumber *)v2->inputSpecularCutoff floatValue];
  float v546 = v46;
  [(NSNumber *)v2->inputCentroidGamma floatValue];
  float v48 = v47;
  [(NSNumber *)v2->inputCentroidRadius floatValue];
  int v50 = v49;
  [(NSNumber *)v2->inputSpecIntensity floatValue];
  float v533 = v51;
  [(NSNumber *)v2->inputScleraThreshold floatValue];
  float v505 = v52;
  [(NSNumber *)v2->inputMinInterDispersion floatValue];
  int v509 = v53;
  [(NSNumber *)v2->inputMaxInterDispersion floatValue];
  int v510 = v54;
  [(NSNumber *)v2->inputMinMaskDiff floatValue];
  int v511 = v55;
  [(NSNumber *)v2->inputGlintThreshold floatValue];
  float v502 = v56;
  double v501 = v56;
  if (v56 <= 0.00001) {
    float v57 = v44;
  }
  else {
    float v57 = 4.0;
  }
  [(NSNumber *)v2->inputTargetClosing floatValue];
  float v506 = v58;
  if (v18 == 90)
  {
    double v525 = v34 * 0.5;
    double v523 = v39 + -0.02;
    float v553 = v553 * 10.0;
    float v57 = v57 * 0.5;
    float v513 = 0.0;
    double v514 = 1.0;
    float v517 = 1.0;
    int v64 = 1028443341;
    float v546 = 0.0;
LABEL_16:
    float v504 = 0.0;
    goto LABEL_18;
  }
  if (v18 == 35)
  {
    double v525 = v34 * 0.3;
    float v59 = v537 * 0.4;
    float v517 = (float)(v14 + -35.0) / 55.0;
    float v537 = interpolate(v59, v537 * 0.75, v517);
    float v60 = v538 * 0.55;
    float v538 = v60;
    float v48 = v48 * 0.75;
    double v523 = v39 * 0.95;
    float v61 = v539 * 0.9;
    float v539 = v61;
    float v62 = v544 * 0.9;
    float v544 = v62;
    float v536 = v536 * 0.75;
    if ((float)(v32 + v32) <= 1.0) {
      float v32 = v32 + v32;
    }
    else {
      float v32 = 1.0;
    }
    float v63 = v543 + 0.3;
    float v543 = v63;
    float v535 = 0.0;
    double v514 = 2.0;
    int v64 = 1036831949;
    float v513 = 0.8;
    goto LABEL_16;
  }
  float v517 = v14 / 35.0;
  [(NSNumber *)v2->inputCentroidRadiusSmall floatValue];
  int v50 = v65;
  double v525 = v34 * 0.3;
  float v537 = v537 * 0.25;
  double v523 = v39 * 0.2;
  float v66 = v539 * 0.9;
  float v539 = v66;
  float v67 = v534 * 0.2;
  float v504 = v67;
  float v544 = v544 * 0.75;
  float v538 = v538 * 0.75;
  float v32 = v32 * 0.75;
  float v533 = v533 * 0.75;
  float v68 = v543 + 0.2;
  float v543 = v68;
  float v536 = 0.0;
  double v514 = 2.0;
  int v64 = 1036831949;
  float v513 = 0.8;
  float v535 = 0.0;
  float v534 = 0.0;
LABEL_18:
  if (v57 <= 1.0) {
    float v69 = v57;
  }
  else {
    float v69 = 1.0;
  }
  BOOL v70 = [(NSNumber *)v2->inputUseFaceSegmentationMask BOOLValue];
  p_inputAxisShortRight = (CIImage *)&v2->inputAxisShortRight;
  p_inputAxisShortLeft = (CIImage *)&v2->inputAxisShortLeft;
  float v507 = v32;
  float v532 = v14;
  p_inputAxisLongLeft = &v2->inputAxisLongLeft;
  p_inputAxisLongRight = &v2->inputAxisLongRight;
  int v520 = v50;
  float v521 = v48;
  int v519 = v64;
  LODWORD(v71) = 1.0;
  if (v70)
  {
    if (v18 == 90)
    {
      float v550 = 1.0;
      v72 = &OBJC_IVAR___CIRedEyeRaw_inputSkinProtectionThresholdLarge;
      v73 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdSkinLarge;
      v74 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdScleraLarge;
      v75 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdIrisLarge;
      v76 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdSkinLarge;
      v77 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdScleraLarge;
      v78 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdIrisLarge;
    }
    else
    {
      float v550 = 1.0;
      if (v18 == 35)
      {
        v72 = &OBJC_IVAR___CIRedEyeRaw_inputSkinProtectionThresholdMedium;
        v73 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdSkinMedium;
        v74 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdScleraMedium;
        v75 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdIrisMedium;
        v76 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdSkinMedium;
        v77 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdScleraMedium;
        v78 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdIrisMedium;
      }
      else
      {
        v72 = &OBJC_IVAR___CIRedEyeRaw_inputSkinProtectionThresholdSmall;
        v73 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdSkinSmall;
        v74 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdScleraSmall;
        v75 = &OBJC_IVAR___CIRedEyeRaw_inputScleraProtectionThresholdIrisSmall;
        v76 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdSkinSmall;
        v77 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdScleraSmall;
        v78 = &OBJC_IVAR___CIRedEyeRaw_inputDetectionThresholdIrisSmall;
      }
    }
    objc_msgSend(*(id *)((char *)&v2->super.super.isa + *v78), "floatValue", v71);
    int v169 = v168;
    [*(id *)((char *)&v2->super.super.isa + *v77) floatValue];
    int v171 = v170;
    [*(id *)((char *)&v2->super.super.isa + *v76) floatValue];
    int v173 = v172;
    [*(id *)((char *)&v2->super.super.isa + *v75) floatValue];
    int v175 = v174;
    [*(id *)((char *)&v2->super.super.isa + *v74) floatValue];
    int v177 = v176;
    [*(id *)((char *)&v2->super.super.isa + *v73) floatValue];
    int v179 = v178;
    [*(id *)((char *)&v2->super.super.isa + *v72) floatValue];
    int v181 = v180;
    LODWORD(v182) = v169;
    LODWORD(v183) = v171;
    LODWORD(v184) = v173;
    v81 = [(CIRedEyeRaw *)v2 irisProtectionMaskWithThresholdIris:v182 thresholdSclera:v183 thresholdSkin:v184];
    LODWORD(v185) = v175;
    LODWORD(v186) = v177;
    LODWORD(v187) = v179;
    v80 = [(CIRedEyeRaw *)v2 irisProtectionMaskWithThresholdIris:v185 thresholdSclera:v186 thresholdSkin:v187];
    LODWORD(v188) = v181;
    v79 = [(CIRedEyeRaw *)v2 skinProtectionMaskWithThreshold:v188];
    if ([(NSNumber *)v2->inputShowMask intValue] == 14)
    {
      uint64_t v134 = -[CIImage imageByCroppingToRect:](v81, "imageByCroppingToRect:", v569, v566, v567, v568);
      v135 = v81;
      double v164 = v563;
LABEL_111:
      double v166 = v564;
      double v165 = v565;
      double v167 = v542;
      goto LABEL_149;
    }
    if ([(NSNumber *)v2->inputShowMask intValue] == 15)
    {
      uint64_t v134 = -[CIImage imageByCroppingToRect:](v80, "imageByCroppingToRect:", v569, v566, v567, v568);
      v135 = v80;
LABEL_114:
      double v164 = v563;
      double v166 = v564;
      double v165 = v565;
      double v167 = v542;
      goto LABEL_149;
    }
    if ([(NSNumber *)v2->inputShowMask intValue] == 16)
    {
      uint64_t v134 = -[CIImage imageByCroppingToRect:](v79, "imageByCroppingToRect:", v569, v566, v567, v568);
      v135 = v79;
      goto LABEL_114;
    }
  }
  else
  {
    float v550 = 1.0;
    v79 = 0;
    v80 = 0;
    v81 = 0;
  }
  v516 = v79;
  double v82 = dbl_193952DF0[v18 == 35] * v541;
  double v83 = v529 * 0.015 * v540 * v528;
  uint64_t v84 = [(NSNumber *)v2->inputRepairSource integerValue];
  v85 = &OBJC_IVAR___CIRedEyeRaw_inputSecondary;
  if (!v84) {
    v85 = &OBJC_IVAR___CIRedEyeRaw_inputPrimary;
  }
  v86 = *(Class *)((char *)&v2->super.super.isa + *v85);
  v87 = +[CIKernel kernelWithInternalRepresentation:&CI::_drr_boost];
  [v86 extent];
  v647[0] = v86;
  v647[1] = &unk_1EE4AB600;
  inputPrimardouble y = -[CIColorKernel applyWithExtent:arguments:](v87, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v647 count:2], v88, v89, v90, v91);
  [(NSNumber *)v2->inputMidSpectrumWhiteOffsetsX floatValue];
  float v94 = v93;
  [(NSNumber *)v2->inputMidSpectrumWhiteOffsetsY floatValue];
  uint64_t v530 = v18;
  float v494 = v69;
  v498 = inputPrimary;
  v496 = v80;
  v499 = v81;
  if (v18 == 90)
  {
    inputPrimardouble y = v2->inputPrimary;
    [(NSNumber *)v2->inputDetectWhite floatValue];
    float v97 = v98;
    [(NSNumber *)v2->inputDetectRed floatValue];
    float v550 = v99;
  }
  else if (v18 == 35)
  {
    float v96 = v94 + 0.3;
    float v550 = interpolate(v96, v95 + 0.0, v517);
    float v97 = interpolate(0.3, 0.7, v517);
  }
  else
  {
    float v97 = 0.6272;
  }
  double v100 = v523;
  uint64_t v101 = 0;
  float v102 = v82;
  float v524 = v102;
  float v103 = v83;
  float v495 = v103;
  float v104 = v527 * 0.1;
  float v497 = v104;
  float v105 = v525;
  float v493 = v105;
  float v106 = v100;
  float v518 = v106;
  char v107 = 1;
  v570 = v2;
  do
  {
    char v108 = v107;
    if (v107) {
      float v109 = v531;
    }
    else {
      float v109 = v571;
    }
    float v110 = v109 * 0.0;
    [(NSNumber *)v2->inputFlooding floatValue];
    float v112 = (v111 + v111) * 0.5 * v109;
    float v113 = v110 * 3.14159265 * v110;
    int v114 = llroundf(v113);
    float v115 = v112 * 3.14159265 * v112;
    int v116 = llroundf(v115);
    v646[v101] = +[CIVector vectorWithX:(double)v114 Y:(double)v116];
    if (CI_LOG_DUALRED())
    {
      v117 = ci_logger_api();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&buf[4] = "-[CIRedEyeRaw outputImage]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (int)v112;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v114;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v116;
        _os_log_error_impl(&dword_193671000, v117, OS_LOG_TYPE_ERROR, "%{public}s Convex area threshold range for radius %d = [%d, %d]", buf, 0x1Eu);
      }
    }
    char v107 = 0;
    uint64_t v101 = 1;
    v2 = v570;
  }
  while ((v108 & 1) != 0);
  v118 = (CIImage *)v646[0];
  v119 = (CIImage *)v646[1];
  double v120 = v532 * 0.1;
  if (v18 == 90) {
    v121 = RRrawRedWhiteResponseLarge(inputPrimary, v97, v550);
  }
  else {
    v121 = RRrawRedWhiteResponseSmallMedium(inputPrimary, v97, v550);
  }
  v123 = v121;
  double v124 = v563;
  *(float *)&double v122 = v553;
  if (v553 > 0.0)
  {
    float v125 = v120;
    v123 = RRcloseByDilation(v121, roundf(v553 * v125));
  }
  if (v79)
  {
    if (CI_LOG_DUALRED())
    {
      v126 = ci_logger_api();
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
        [(CIRedEyeRaw *)v126 outputImage];
      }
    }
    v123 = RRmultiplyRh(v123, v499);
  }
  if ([(NSNumber *)v570->inputShowMask intValue] == 1)
  {
    uint64_t v134 = -[CIImage imageByCroppingToRect:](v123, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v123;
LABEL_79:
    double v164 = v124;
    double v166 = v564;
    double v165 = v565;
    double v167 = v542;
LABEL_149:
    uint64_t v292 = objc_msgSend(v135, "imageByCroppingToRect:", v164, v165, v166, v167);
    v293 = (void *)v134;
    return (id)[v293 imageByCompositingOverImage:v292];
  }
  v500 = v118;
  [(NSNumber *)v570->inputCentroidIterations floatValue];
  uint64_t v136 = (int)(float)(*(float *)&v137 * 5.0);
  *(float *)&double v137 = v546;
  v526 = v123;
  if (v546 > 0.0)
  {
    v138 = RRspecularMask(v570->inputPrimary, v570->inputSecondary, v546, v513);
    v139 = v138;
    if (fabs(v514 + -1.0) > 0.01) {
      v139 = -[CIImage _imageByApplyingGamma:](v138, "_imageByApplyingGamma:");
    }
    v123 = RRmultiplyRh(v123, v139);
  }
  float v515 = v120;
  [(NSNumber *)v570->inputSearchLong floatValue];
  int v551 = v140;
  [(NSNumber *)v570->inputSearchShort floatValue];
  uint64_t v141 = 0;
  int v547 = v142;
  char v143 = 1;
  do
  {
    int v144 = v143 & 1;
    if (v143) {
      double v145 = v569;
    }
    else {
      double v145 = v124;
    }
    if (v143) {
      double v146 = v566;
    }
    else {
      double v146 = v565;
    }
    if (v143) {
      double v147 = v567;
    }
    else {
      double v147 = v564;
    }
    if (v143) {
      double v148 = v568;
    }
    else {
      double v148 = v542;
    }
    v149 = &OBJC_IVAR___CIRedEyeRaw_inputPupilCenterRight;
    if (v144) {
      v149 = &OBJC_IVAR___CIRedEyeRaw_inputPupilCenterLeft;
    }
    uint64_t v150 = *(uint64_t *)((char *)&v570->super.super.isa + *v149);
    v151 = p_inputAxisLongLeft;
    if (!v144) {
      v151 = p_inputAxisLongRight;
    }
    v152 = *v151;
    v153 = p_inputAxisShortLeft;
    if (!v144) {
      v153 = p_inputAxisShortRight;
    }
    Class isa = v153->super.isa;
    v643[0] = @"inputIterations";
    v644[0] = [NSNumber numberWithInt:v136];
    v644[1] = &unk_1EE4AB610;
    v643[1] = @"inputScale";
    v643[2] = @"inputDecay";
    v644[2] = &unk_1EE4AB620;
    v643[3] = @"inputGamma";
    *(float *)&double v155 = v521;
    v644[3] = [NSNumber numberWithFloat:v155];
    v643[4] = @"inputClip";
    LODWORD(v156) = v519;
    v644[4] = [NSNumber numberWithFloat:v156];
    v643[5] = @"inputLocalizationRadius";
    LODWORD(v157) = v520;
    v644[5] = [NSNumber numberWithFloat:v157];
    v643[6] = @"inputExtent";
    double v158 = v146;
    double v124 = v563;
    v644[6] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v145, v158, v147, v148);
    v643[7] = @"inputDebug";
    v644[7] = objc_msgSend(NSNumber, "numberWithBool:", -[NSNumber intValue](v570->inputShowMask, "intValue") == 2);
    v644[8] = v152;
    v643[8] = @"inputAxisLong";
    v643[9] = @"inputAxisShort";
    v644[9] = isa;
    v644[10] = v150;
    v643[10] = @"inputPupilCenter";
    v643[11] = @"inputSearchAxisLong";
    LODWORD(v159) = v551;
    v644[11] = [NSNumber numberWithFloat:v159];
    v643[12] = @"inputSearchAxisShort";
    LODWORD(v160) = v547;
    v644[12] = [NSNumber numberWithFloat:v160];
    uint64_t v161 = -[CIImage imageByApplyingFilter:withInputParameters:](v123, "imageByApplyingFilter:withInputParameters:", @"RedPupilLocalizer", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v644 forKeys:v643 count:13]);
    char v143 = 0;
    v645[v141] = v161;
    uint64_t v141 = 1;
  }
  while (v144);
  v163 = (objc_object *)v645[0];
  v162 = (CIImage *)v645[1];
  if ([(NSNumber *)v570->inputShowMask intValue] == 2)
  {
    uint64_t v134 = -[objc_object imageByCroppingToRect:](v163, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v162;
    goto LABEL_79;
  }
  uint64_t v189 = 0;
  char v190 = 1;
  double v192 = v566;
  double v191 = v567;
  v548 = (CIImage *)v163;
  v552 = v162;
  do
  {
    char v193 = v190;
    BOOL v194 = (v190 & 1) == 0;
    if (v190)
    {
      double v195 = v569;
    }
    else
    {
      v163 = (objc_object *)v162;
      double v195 = v124;
    }
    if (v190) {
      CGFloat v196 = v192;
    }
    else {
      CGFloat v196 = v565;
    }
    if (v190) {
      CGFloat v197 = v191;
    }
    else {
      CGFloat v197 = v564;
    }
    if (v190) {
      CGFloat v198 = v568;
    }
    else {
      CGFloat v198 = v542;
    }
    if (v190) {
      v199 = p_inputAxisLongLeft;
    }
    else {
      v199 = p_inputAxisLongRight;
    }
    v200 = *v199;
    p_Class isa = (void **)&p_inputAxisShortLeft->super.isa;
    if (v194) {
      p_Class isa = (void **)&p_inputAxisShortRight->super.isa;
    }
    v202 = *p_isa;
    [(CIVector *)v200 _norm];
    float v204 = v203;
    [v202 _norm];
    float v206 = v205;
    float v207 = v205 / v204;
    float v208 = stretch(v205 / v204, 0.0, 0.4, 0.25, 0.8);
    if (CI_LOG_DUALRED())
    {
      v209 = ci_logger_api();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136447234;
        *(void *)&buf[4] = "-[CIRedEyeRaw outputImage]";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v204;
        *(_WORD *)&buf[22] = 2048;
        *(double *)&buf[24] = v206;
        *(_WORD *)v641 = 2048;
        *(double *)&v641[2] = (float)(v207 * 100.0);
        *(_WORD *)&v641[10] = 2048;
        *(double *)&v641[12] = v208;
        _os_log_error_impl(&dword_193671000, v209, OS_LOG_TYPE_ERROR, "%{public}s Long %.2f | Short %.2f | Ratio %.0f | Conf %.2f", buf, 0x34u);
      }
    }
    v648.origin.double x = v195;
    v648.origin.double y = v196;
    v648.size.double width = v197;
    v648.size.double height = v198;
    v210 = RRradialEllipticalMask(v648, v200, v163, v544, v544 * v208, v543, 1.0);
    v211 = RRmultiplyRh(v526, v210);
    char v190 = 0;
    v642[v189] = v211;
    uint64_t v189 = 1;
    double v124 = v563;
    double v192 = v566;
    double v191 = v567;
    v163 = (objc_object *)v548;
    v162 = v552;
  }
  while ((v193 & 1) != 0);
  v212 = (CIImage *)v642[0];
  v213 = (void *)v642[1];
  if ([(NSNumber *)v570->inputShowMask intValue] == 3)
  {
    uint64_t v134 = -[CIImage imageByCroppingToRect:](v212, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v213;
    double v164 = v563;
    goto LABEL_111;
  }
  v557 = v212;
  [(NSNumber *)v570->inputRadiusSpecular floatValue];
  int v215 = v214;
  uint64_t v216 = [(NSNumber *)v570->inputRepairSource integerValue];
  v217 = v498;
  if (!v216) {
    v217 = v570->inputPrimary;
  }
  v561 = RRspecularResponse(v217);
  uint64_t v218 = 0;
  char v219 = 1;
  do
  {
    int v220 = v219 & 1;
    if (v219) {
      v221 = v548;
    }
    else {
      v221 = v552;
    }
    double v222 = v569;
    if (v220)
    {
      double v223 = v566;
    }
    else
    {
      double v222 = v563;
      double v223 = v565;
    }
    if (v220) {
      double v224 = v567;
    }
    else {
      double v224 = v564;
    }
    if (v220) {
      double v225 = v568;
    }
    else {
      double v225 = v542;
    }
    v638[0] = v221;
    v637[0] = @"inputCenter";
    v637[1] = @"inputExtent";
    v226 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v222, v223, v224, v225);
    inputFalloffSpecular = v570->inputFalloffSpecular;
    v638[1] = v226;
    v638[2] = inputFalloffSpecular;
    v637[2] = @"inputFalloff";
    v637[3] = @"inputRadius";
    LODWORD(v228) = v215;
    uint64_t v229 = [NSNumber numberWithFloat:v228];
    v637[4] = @"inputAnisotropic";
    v638[3] = v229;
    v638[4] = MEMORY[0x1E4F1CC28];
    v230 = -[CIFilter outputImage](+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"RadialFalloffFilter", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v638 forKeys:v637 count:5]), "outputImage");
    char v219 = 0;
    v639[v218] = v230;
    uint64_t v218 = 1;
  }
  while (v220);
  v231 = v639[1];
  v232 = RRmultiplyRh(v561, v639[0]);
  v233 = RRmultiplyRh(v561, v231);
  v234 = RRmaxRhScalar(v232, 0.001);
  v235 = RRmaxRhScalar(v233, 0.001);
  [(NSNumber *)v570->inputCenterSpecRad floatValue];
  if (v236 <= 0.0)
  {
    double v239 = v564;
    double v240 = v565;
    float v243 = v535;
    double v241 = v542;
  }
  else
  {
    float v237 = v236;
    v649.size.double height = v568;
    v649.origin.double x = v569;
    v649.origin.double y = v566;
    v649.size.double width = v567;
    v238 = RRradialMask(v570->inputPupilCenterLeft, v649, v237, -0.8, 1);
    v234 = RRmultiplyRh(v234, v238);
    v650.origin.double x = v563;
    double v239 = v564;
    double v240 = v565;
    v650.origin.double y = v565;
    v650.size.double width = v564;
    double v241 = v542;
    v650.size.double height = v542;
    v242 = RRradialMask(v570->inputPupilCenterRight, v650, v237, -0.8, 1);
    v235 = RRmultiplyRh(v235, v242);
    float v243 = v535;
  }
  if ([(NSNumber *)v570->inputShowMask intValue] == 6)
  {
    uint64_t v134 = -[CIImage imageByCroppingToRect:](v234, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v235;
    double v164 = v563;
    double v165 = v240;
    double v166 = v239;
LABEL_148:
    double v167 = v241;
    goto LABEL_149;
  }
  v244 = +[CIVector vectorWithX:v538 Y:v243 Z:v538 W:v243];
  [(CIVector *)v570->inputSize X];
  double v246 = v245;
  [(CIVector *)v570->inputSize Y];
  *(float *)&double v247 = v246 * v247;
  v248 = +[CIVector vectorWithX:0.0 Y:(double)(unint64_t)(float)(v497 * *(float *)&v247) Z:0.0 W:(double)(unint64_t)(float)(v497 * *(float *)&v247)];
  *(_OWORD *)v641 = 0u;
  memset(buf, 0, sizeof(buf));
  CGAffineTransformMakeTranslation((CGAffineTransform *)buf, -(v563 - v569), -(v240 - v566));
  *(_OWORD *)&v579.a = *(_OWORD *)buf;
  *(_OWORD *)&v579.c = *(_OWORD *)&buf[16];
  *(_OWORD *)&v579.tdouble x = *(_OWORD *)v641;
  memset(&v580, 0, sizeof(v580));
  CGAffineTransformInvert(&v580, &v579);
  v578[0] = *(_OWORD *)buf;
  v578[1] = *(_OWORD *)&buf[16];
  v578[2] = *(_OWORD *)v641;
  v249 = (CIImage *)[v213 imageByApplyingTransform:v578];
  v577[0] = *(_OWORD *)buf;
  v577[1] = *(_OWORD *)&buf[16];
  v577[2] = *(_OWORD *)v641;
  uint64_t v250 = [(CIImage *)v235 imageByApplyingTransform:v577];
  v576[0] = *(_OWORD *)buf;
  v576[1] = *(_OWORD *)&buf[16];
  v576[2] = *(_OWORD *)v641;
  uint64_t v251 = [(CIImage *)v526 imageByApplyingTransform:v576];
  v252 = (CIImage *)v250;
  v253 = v570;
  double v254 = v567;
  v255 = -[CIImage imageByCroppingToRect:](RRcombineRGBA(v557, v234, v249, v252), "imageByCroppingToRect:", v569, v566, v567, v568);
  v635[0] = @"inputPercentileRepair";
  *(float *)&double v256 = v539;
  v636[0] = [NSNumber numberWithFloat:v256];
  v635[1] = @"inputPercentileSpecular";
  *(float *)&double v257 = v534;
  v636[1] = [NSNumber numberWithFloat:v257];
  v635[2] = @"inputPercentRepair";
  *(float *)&double v258 = v518;
  v636[2] = [NSNumber numberWithFloat:v258];
  v636[3] = &unk_1EE4AA7A8;
  inputInterPeakMin = v570->inputInterPeakMin;
  v635[3] = @"inputPercentSpecular";
  v635[4] = @"inputInterPeakMinRepair";
  v636[4] = inputInterPeakMin;
  v636[5] = v244;
  v635[5] = @"inputMinimum";
  v635[6] = @"inputMaxArea";
  inputSpecAreaScale = v570->inputSpecAreaScale;
  v636[6] = v248;
  v636[7] = inputSpecAreaScale;
  v635[7] = @"inputMaxAreaRatio";
  v635[8] = @"inputCenterLeft";
  v636[8] = v548;
  v636[9] = v552;
  v635[9] = @"inputCenterRight";
  v635[10] = @"inputCenterExtentLeft";
  double v261 = v564;
  double v241 = v542;
  v636[10] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v569, v566, v567, v568);
  v635[11] = @"inputCenterExtentRight";
  v636[11] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v563, v240, v564, v542);
  v635[12] = @"inputCenterOffsetLeft";
  v636[12] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  v635[13] = @"inputCenterOffsetRight";
  v636[13] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", v563 - v569, v240 - v566);
  v636[14] = &unk_1EE4AB630;
  v635[14] = @"inputAbortMaxCenterDist";
  v635[15] = @"inputMinDensity";
  *(float *)&double v262 = v524;
  v636[15] = [NSNumber numberWithFloat:v262];
  v635[16] = @"inputMaxRelDensity";
  LODWORD(v263) = v512;
  uint64_t v264 = [NSNumber numberWithFloat:v263];
  inputFalloffDensitdouble y = v570->inputFalloffDensity;
  v636[16] = v264;
  v636[17] = inputFalloffDensity;
  v635[17] = @"inputDensityRadius";
  v635[18] = @"inputDetectionLeft";
  v636[18] = v526;
  v636[19] = v251;
  v635[19] = @"inputDetectionRight";
  v635[20] = @"inputMinInterDispersion";
  LODWORD(v266) = v509;
  v636[20] = [NSNumber numberWithFloat:v266];
  v635[21] = @"inputMaxInterDispersion";
  LODWORD(v267) = v510;
  v636[21] = [NSNumber numberWithFloat:v267];
  v635[22] = @"inputMinGobalLocalMeanDiff";
  LODWORD(v268) = v511;
  uint64_t v269 = [NSNumber numberWithFloat:v268];
  v635[23] = @"inputTuning";
  inputParam2 = v570->inputParam2;
  v636[22] = v269;
  v636[23] = inputParam2;
  v271 = -[CIImage imageByApplyingFilter:withInputParameters:](v255, "imageByApplyingFilter:withInputParameters:", @"HistoClip_RGBA8_CPU", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v636 forKeys:v635 count:24]);
  v272 = RRextractR8(v271);
  v273 = RRextractG8(v271);
  v274 = RRextractB8(v271);
  CGAffineTransform v575 = v580;
  v275 = [(CIImage *)v274 imageByApplyingTransform:&v575];
  v276 = RRextractA8(v271);
  CGAffineTransform v574 = v580;
  uint64_t v277 = [(CIImage *)v276 imageByApplyingTransform:&v574];
  if (v516)
  {
    if (CI_LOG_DUALRED())
    {
      v278 = ci_logger_api();
      if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR)) {
        [(CIRedEyeRaw *)v278 outputImage];
      }
    }
    v272 = RRminimumRh(v272, v496);
    v275 = RRminimumRh(v275, v496);
  }
  if ([(NSNumber *)v570->inputShowMask intValue] == 7)
  {
    uint64_t v134 = -[CIImage imageByCroppingToRect:](v273, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = (void *)v277;
LABEL_147:
    double v164 = v563;
    double v165 = v565;
    double v166 = v564;
    goto LABEL_148;
  }
  *(float *)&double v286 = v508;
  if (v508 > 0.0)
  {
    float v287 = roundf(v508 * v515);
    v288 = RRcloseByErosion(v272, v287);
    float v289 = v287;
    double v254 = v567;
    v290 = RRcloseByErosion(v275, v289);
    v272 = RRmaxIfGreaterThanZeroRh(v288, v272);
    v291 = v290;
    v253 = v570;
    v275 = RRmaxIfGreaterThanZeroRh(v291, v275);
  }
  if ([(NSNumber *)v253->inputShowMask intValue] == 4)
  {
    uint64_t v134 = -[CIImage imageByCroppingToRect:](v272, "imageByCroppingToRect:", v569, v566, v254, v568);
    v135 = v275;
    goto LABEL_147;
  }
  if ([(NSNumber *)v253->inputShowMask intValue] == 10)
  {
    double v295 = v568;
    double v296 = v254;
    v297 = RRbinarizeAlphaInverse(v253->inputPrimary, [(CIImage *)v272 imageByClampingToExtent], 0.2);
    v298 = RRbinarizeAlphaInverse(v253->inputPrimary, [(CIImage *)v275 imageByClampingToExtent], 0.2);
    v633 = @"inputExtent";
    double v299 = v569;
    v634 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v569, v566, v296, v568);
    v300 = -[CIImage imageByApplyingFilter:withInputParameters:](v297, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v634 forKeys:&v633 count:1]);
    v631 = @"inputExtent";
    double v301 = v565;
    v632 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v563, v565, v564, v542);
    v302 = (void *)MEMORY[0x1E4F1C9E8];
    v303 = &v632;
    v304 = &v631;
LABEL_155:
    v306 = -[CIImage imageByApplyingFilter:withInputParameters:](v298, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [v302 dictionaryWithObjects:v303 forKeys:v304 count:1]);
    v307 = [(CIImage *)v300 imageByUnpremultiplyingAlpha];
    v308 = [(CIImage *)v306 imageByUnpremultiplyingAlpha];
    [(CIImage *)v307 extent];
    v309 = -[CIImage imageBySettingAlphaOneInExtent:](v307, "imageBySettingAlphaOneInExtent:");
    [(CIImage *)v308 extent];
    v310 = -[CIImage imageBySettingAlphaOneInExtent:](v308, "imageBySettingAlphaOneInExtent:");
    v311 = [(CIImage *)v309 imageByClampingToExtent];
    uint64_t v312 = [(CIImage *)v310 imageByClampingToExtent];
    uint64_t v313 = -[CIImage imageByCroppingToRect:](v311, "imageByCroppingToRect:", v299, v566, v296, v295);
    v314 = (void *)v312;
    double v315 = v563;
    double v316 = v301;
LABEL_161:
    uint64_t v292 = objc_msgSend(v314, "imageByCroppingToRect:", v315, v316, v564, v542);
    v293 = (void *)v313;
    return (id)[v293 imageByCompositingOverImage:v292];
  }
  if ([(NSNumber *)v253->inputShowMask intValue] == 11)
  {
    double v295 = v568;
    double v296 = v254;
    v305 = RRbinarizeAlpha(v253->inputPrimary, [(CIImage *)v272 imageByClampingToExtent], 0.2);
    v298 = RRbinarizeAlpha(v253->inputPrimary, [(CIImage *)v275 imageByClampingToExtent], 0.2);
    v629 = @"inputExtent";
    double v299 = v569;
    v630 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v569, v566, v296, v568);
    v300 = -[CIImage imageByApplyingFilter:withInputParameters:](v305, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v630 forKeys:&v629 count:1]);
    v627 = @"inputExtent";
    double v301 = v565;
    v628 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v563, v565, v564, v542);
    v302 = (void *)MEMORY[0x1E4F1C9E8];
    v303 = &v628;
    v304 = &v627;
    goto LABEL_155;
  }
  if ([(NSNumber *)v253->inputShowMask intValue] == 12)
  {
    v317 = RRbinarize(v272);
    v318 = RRbinarize(v275);
    v319 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor blackColor]);
    v320 = v253;
    v321 = v253->inputPrimary;
    v625[0] = @"inputBackgroundImage";
    v625[1] = @"inputMaskImage";
    v626[0] = v319;
    v626[1] = v317;
    v322 = -[CIImage imageByApplyingFilter:withInputParameters:](v321, "imageByApplyingFilter:withInputParameters:", @"CIBlendWithRedMask", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v626 forKeys:v625 count:2]);
    v323 = v320->inputPrimary;
    v623[0] = @"inputBackgroundImage";
    v623[1] = @"inputMaskImage";
    v624[0] = v319;
    v624[1] = v318;
    v324 = (void *)MEMORY[0x1E4F1C9E8];
    v325 = v624;
    v326 = v623;
LABEL_160:
    uint64_t v333 = -[CIImage imageByApplyingFilter:withInputParameters:](v323, "imageByApplyingFilter:withInputParameters:", @"CIBlendWithRedMask", [v324 dictionaryWithObjects:v325 forKeys:v326 count:2]);
    uint64_t v313 = -[CIImage imageByCroppingToRect:](v322, "imageByCroppingToRect:", v569, v566, v254, v568);
    v314 = (void *)v333;
    double v315 = v563;
    double v316 = v565;
    goto LABEL_161;
  }
  if ([(NSNumber *)v253->inputShowMask intValue] == 13)
  {
    v328 = RRbinarizeInverse(v272);
    v329 = RRbinarizeInverse(v275);
    v330 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor blackColor]);
    v331 = v253;
    v332 = v253->inputPrimary;
    v621[0] = @"inputBackgroundImage";
    v621[1] = @"inputMaskImage";
    v622[0] = v330;
    v622[1] = v328;
    v322 = -[CIImage imageByApplyingFilter:withInputParameters:](v332, "imageByApplyingFilter:withInputParameters:", @"CIBlendWithRedMask", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v622 forKeys:v621 count:2]);
    v323 = v331->inputPrimary;
    v619[0] = @"inputBackgroundImage";
    v619[1] = @"inputMaskImage";
    v620[0] = v330;
    v620[1] = v329;
    v324 = (void *)MEMORY[0x1E4F1C9E8];
    v325 = v620;
    v326 = v619;
    goto LABEL_160;
  }
  if (v530 == 35)
  {
    v335 = &OBJC_IVAR___CIRedEyeRaw_inputSkinThresholdMed;
    double v334 = v565;
    goto LABEL_166;
  }
  LODWORD(v327) = 1.0;
  double v334 = v565;
  if (v530 == 90)
  {
    v335 = &OBJC_IVAR___CIRedEyeRaw_inputSkinThreshold;
LABEL_166:
    objc_msgSend(*(id *)((char *)&v253->super.super.isa + *v335), "floatValue", v327);
  }
  float v545 = *(float *)&v327;
  v558 = v273;
  v562 = v275;
  v555 = (void *)v277;
  uint64_t v336 = 0;
  char v337 = 1;
  do
  {
    char v338 = v337;
    if (v337) {
      double v339 = v569;
    }
    else {
      double v339 = v563;
    }
    if (v337) {
      double v340 = v566;
    }
    else {
      double v340 = v334;
    }
    if (v337) {
      double v341 = v567;
    }
    else {
      double v341 = v261;
    }
    if (v337) {
      double v342 = v568;
    }
    else {
      double v342 = v542;
    }
    if (v337) {
      v343 = v500;
    }
    else {
      v343 = v119;
    }
    if (v337) {
      v344 = v272;
    }
    else {
      v344 = v275;
    }
    if (v337) {
      v345 = v548;
    }
    else {
      v345 = v552;
    }
    v616[0] = @"inputExtent";
    [(CIImage *)v344 extent];
    v346 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v616[1] = @"inputCentroid";
    v617[0] = v346;
    v617[1] = v345;
    v347 = RRconditionalZero(v344, -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v344, "imageByApplyingFilter:withInputParameters:", @"CICircularityDescriptor", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v617 forKeys:v616 count:2]), "imageByClampingToExtent"), v537);
    v614[0] = @"inputCenter";
    v614[1] = @"inputThreshold";
    v615[0] = v345;
    v615[1] = &unk_1EE4AA7C0;
    v615[2] = v343;
    v614[2] = @"inputAreaThresholdLoHi";
    v614[3] = @"inputSplat";
    *(float *)&double v348 = v495;
    v615[3] = [NSNumber numberWithFloat:v348];
    v349 = -[CIImage imageByApplyingFilter:withInputParameters:](v347, "imageByApplyingFilter:withInputParameters:", @"CIConvexFill", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v615 forKeys:v614 count:4]);
    [(NSNumber *)v570->inputGamma floatValue];
    if (v350 > 0.0 && fabs(v350 + -1.0) > 0.001)
    {
      v351 = -[CIImage _imageByApplyingGamma:](v349, "_imageByApplyingGamma:");
      [(NSNumber *)v570->inputCutoff floatValue];
      v349 = RRsmoothstep(v351, v352);
    }
    uint64_t v353 = -[CIImage imageByCroppingToRect:](v349, "imageByCroppingToRect:", v339, v340, v341, v342);
    char v337 = 0;
    v618[v336] = v353;
    uint64_t v336 = 1;
    double v261 = v564;
    double v334 = v565;
  }
  while ((v338 & 1) != 0);
  v354 = (CIImage *)v618[0];
  v355 = (CIImage *)v618[1];
  if (v516)
  {
    double v356 = v542;
    double v357 = v567;
    v359 = v555;
    v358 = v558;
    if (CI_LOG_DUALRED())
    {
      v360 = ci_logger_api();
      if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR)) {
        [(CIRedEyeRaw *)v360 outputImage];
      }
    }
    v354 = RRminimumRh(v354, v516);
    v355 = RRminimumRh(v355, v516);
  }
  else
  {
    double v356 = v542;
    double v357 = v567;
    v359 = v555;
    v358 = v558;
  }
  if (v357 >= v568) {
    double v368 = v568;
  }
  else {
    double v368 = v357;
  }
  float v369 = v368;
  if (v564 >= v356) {
    double v370 = v356;
  }
  else {
    double v370 = v564;
  }
  float v371 = v370;
  [(NSNumber *)v570->inputFeathering floatValue];
  v651.size.double width = v357;
  float v373 = v372;
  v651.origin.double x = v569;
  v651.origin.double y = v566;
  v651.size.double height = v568;
  v374 = feather(v354, v651, v369, v373, 0.5);
  v652.origin.double x = v563;
  v652.origin.double y = v565;
  v652.size.double width = v564;
  v652.size.double height = v356;
  v375 = feather(v355, v652, v371, v373, 0.5);
  [(NSNumber *)v570->inputRefilterSpace floatValue];
  float v377 = 50.0;
  if ((float)(v532 * v376) <= 50.0)
  {
    [(NSNumber *)v570->inputRefilterSpace floatValue];
    float v377 = v532 * v378;
  }
  [(NSNumber *)v570->inputRefilterRange floatValue];
  float v380 = v379 * 0.1;
  if (v530 == 90)
  {
    float v380 = v380 * 1.5;
    double v381 = 2.5;
    CGFloat v382 = v563;
  }
  else
  {
    double v381 = 1.0;
    CGFloat v382 = v563;
    if (v530 == 35)
    {
      float v380 = v380 * 5.0;
      float v377 = v377 * 1.5;
      v383 = [(CIImage *)refilterChannel(v570->inputPrimary) _imageByApplyingGamma:0.400000006];
      goto LABEL_212;
    }
  }
  v383 = [(CIImage *)v526 _imageByApplyingGamma:v381];
LABEL_212:
  v384 = v383;
  v385 = refilter(v374, v383, v377, v380);
  v386 = refilter(v375, v384, v377, v380);
  v387 = v570;
  [(NSNumber *)v570->inputFSmooth floatValue];
  float v389 = v388;
  v653.origin.double x = v569;
  v653.origin.double y = v566;
  v653.size.double width = v567;
  v653.size.double height = v568;
  v390 = feather(v385, v653, v369, 0.0, v389);
  v654.origin.double x = v382;
  v654.origin.double y = v565;
  v654.size.double width = v564;
  double v391 = v542;
  v654.size.double height = v542;
  v392 = feather(v386, v654, v371, 0.0, v389);
  if (v545 >= 1.0)
  {
    unint64_t v396 = 0x1E4F1C000uLL;
  }
  else
  {
    v655.origin.double x = v569;
    v655.origin.double y = v566;
    v655.size.double width = v567;
    v655.size.double height = v568;
    v393 = chromaExclusion(v570->inputPrimary, v272, v655, v545, 0.2, v505, 0.35);
    v656.origin.double x = v382;
    v656.origin.double y = v565;
    v656.size.double width = v564;
    v656.size.double height = v542;
    v394 = v392;
    v395 = chromaExclusion(v570->inputPrimary, v562, v656, v545, 0.2, v505, 0.35);
    v390 = RRmultiplyRh(v390, v393);
    v387 = v570;
    v392 = RRmultiplyRh(v394, v395);
    unint64_t v396 = 0x1E4F1C000;
  }
  double v397 = v565;
  if ([(NSNumber *)v387->inputShowMask intValue] == 5)
  {
    uint64_t v134 = -[CIImage imageByCroppingToRect:](v390, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v392;
LABEL_230:
    double v164 = v563;
LABEL_231:
    double v165 = v397;
    double v166 = v564;
    double v167 = v391;
    goto LABEL_149;
  }
  double v398 = v566;
  CGFloat v399 = v569;
  v559 = v392;
  if (v504 <= 0.0)
  {
    *(float *)&CGFloat v399 = v503;
    if (v503 > 0.0)
    {
      double v409 = v532 * 0.5 * v503;
      float v410 = v409;
      v612 = @"inputRadius";
      *(float *)&double v409 = v410;
      uint64_t v613 = [NSNumber numberWithFloat:v409];
      v411 = -[CIImage imageByApplyingFilter:withInputParameters:](v358, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyMaximum", [*(id *)(v396 + 2536) dictionaryWithObjects:&v613 forKeys:&v612 count:1]);
      v610 = @"inputRadius";
      *(float *)&double v412 = v410;
      uint64_t v611 = [NSNumber numberWithFloat:v412];
      v358 = -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingFilter:withInputParameters:](v411, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyMinimum", [*(id *)(v396 + 2536) dictionaryWithObjects:&v611 forKeys:&v610 count:1]), "imageByCroppingToRect:", v569, v566, v567, v568);
      v608 = @"inputRadius";
      *(float *)&double v413 = v410;
      uint64_t v609 = [NSNumber numberWithFloat:v413];
      v414 = objc_msgSend(v359, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyMaximum", objc_msgSend(*(id *)(v396 + 2536), "dictionaryWithObjects:forKeys:count:", &v609, &v608, 1));
      v606 = @"inputRadius";
      *(float *)&double v415 = v410;
      uint64_t v607 = [NSNumber numberWithFloat:v415];
      v359 = objc_msgSend((id)objc_msgSend(v414, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyMinimum", objc_msgSend(*(id *)(v396 + 2536), "dictionaryWithObjects:forKeys:count:", &v607, &v606, 1)), "imageByCroppingToRect:", v563, v565, v564, v542);
    }
    v604 = @"inputRadius";
    v605 = &unk_1EE4AB600;
    v407 = -[CIImage imageByApplyingFilter:withInputParameters:](v358, "imageByApplyingFilter:withInputParameters:", @"CIBoxBlur", objc_msgSend(*(id *)(v396 + 2536), "dictionaryWithObjects:forKeys:count:", &v605, &v604, 1, v399));
    v602 = @"inputRadius";
    v603 = &unk_1EE4AB600;
    v408 = (CIImage *)objc_msgSend(v359, "imageByApplyingFilter:withInputParameters:", @"CIBoxBlur", objc_msgSend(*(id *)(v396 + 2536), "dictionaryWithObjects:forKeys:count:", &v603, &v602, 1));
    v387 = v570;
  }
  else
  {
    if (v531 <= v571) {
      float v400 = v571;
    }
    else {
      float v400 = v531;
    }
    double v401 = 2.0 / v400;
    if (v401 >= v504)
    {
      float v402 = v401;
      float v403 = v402;
    }
    else
    {
      float v403 = v504;
    }
    double v404 = v566;
    double v405 = v567;
    double v406 = v568;
    v407 = RRradialCenterMask(v548, *(CGRect *)&v399, v400, v403, -0.5);
    v657.origin.double x = v563;
    v657.origin.double y = v565;
    v657.size.double width = v564;
    v657.size.double height = v542;
    v408 = RRradialCenterMask(v552, v657, v400, v403, -0.5);
  }
  v416 = RRmultiplyRh(v407, v390);
  v417 = RRmultiplyRh(v408, v392);
  if ([(NSNumber *)v387->inputShowMask intValue] == 8)
  {
    uint64_t v134 = -[CIImage imageByCroppingToRect:](v416, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v417;
    goto LABEL_230;
  }
  v549 = v416;
  uint64_t v418 = 0;
  char v419 = 1;
  double v420 = v563;
  do
  {
    LOBYTE(v571) = v419;
    if (v419) {
      v421 = v390;
    }
    else {
      v421 = v559;
    }
    if (v419) {
      double v420 = v569;
    }
    double v422 = v397;
    if (v419) {
      double v423 = v398;
    }
    else {
      double v423 = v397;
    }
    if (v419) {
      double v424 = v567;
    }
    else {
      double v424 = v564;
    }
    double v425 = v391;
    if (v419) {
      double v391 = v568;
    }
    v426 = v387->inputPrimary;
    if (v506 > 0.0)
    {
      v599 = @"inputRadius";
      v600 = &unk_1EE4AB600;
      v427 = -[CIImage imageByApplyingFilter:withInputParameters:](v426, "imageByApplyingFilter:withInputParameters:", @"CIBoxBlur", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v600 forKeys:&v599 count:1]);
      v597 = @"inputRadius";
      v598 = &unk_1EE4AB600;
      v428 = -[CIImage imageByApplyingFilter:withInputParameters:](v427, "imageByApplyingFilter:withInputParameters:", @"CIBoxBlur", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v598 forKeys:&v597 count:1]);
      v595 = @"inputRadius";
      *(float *)&double v429 = v506;
      uint64_t v596 = [NSNumber numberWithFloat:v429];
      v426 = -[CIImage imageByApplyingFilter:withInputParameters:](v428, "imageByApplyingFilter:withInputParameters:", @"CIMorphologyMinimum", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v596 forKeys:&v595 count:1]);
    }
    v593 = @"inputRadius";
    v594 = &unk_1EE4AB600;
    v430 = -[CIImage imageByApplyingFilter:withInputParameters:](v426, "imageByApplyingFilter:withInputParameters:", @"CIBoxBlur", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v594 forKeys:&v593 count:1]);
    v591 = @"inputRadius";
    v592 = &unk_1EE4AB600;
    v431 = -[CIImage imageByApplyingFilter:withInputParameters:](v430, "imageByApplyingFilter:withInputParameters:", @"CIBoxBlur", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v592 forKeys:&v591 count:1]);
    v387 = v570;
    v432 = v570->inputPrimary;
    v589[0] = @"inputSource";
    v589[1] = @"inputMask";
    v590[0] = v432;
    v590[1] = v421;
    v589[2] = @"inputNoiseAmount";
    *(float *)&double v433 = v493;
    v590[2] = [NSNumber numberWithFloat:v433];
    v589[3] = @"inputBrightness";
    *(float *)&double v434 = v507;
    uint64_t v435 = [NSNumber numberWithFloat:v434];
    inputRecover = v570->inputRecover;
    v590[3] = v435;
    v590[4] = inputRecover;
    v589[4] = @"inputRecovery";
    v589[5] = @"inputExtent";
    v590[5] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v420, v423, v424, v391);
    v589[6] = @"inputWhiteCutoff";
    *(float *)&double v437 = v494;
    v590[6] = [NSNumber numberWithFloat:v437];
    v589[7] = @"inputChroma";
    *(float *)&double v438 = v536;
    v590[7] = [NSNumber numberWithFloat:v438];
    uint64_t v439 = -[CIImage imageByApplyingFilter:withInputParameters:](v431, "imageByApplyingFilter:withInputParameters:", @"RedEyeRecolor", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v590 forKeys:v589 count:8]);
    char v419 = 0;
    v601[v418] = v439;
    uint64_t v418 = 1;
    double v420 = v563;
    double v398 = v566;
    double v391 = v425;
    double v397 = v422;
  }
  while ((LOBYTE(v571) & 1) != 0);
  v440 = (void *)v601[0];
  v441 = (void *)v601[1];
  if ([(NSNumber *)v570->inputShowMask intValue] == 9)
  {
    uint64_t v134 = objc_msgSend(v440, "imageByCroppingToRect:", v569, v566, v567, v568);
    v135 = v441;
    double v164 = v563;
    goto LABEL_231;
  }
  uint64_t v443 = 0;
  char v444 = 1;
  do
  {
    char v445 = v444;
    if (v444) {
      v446 = v440;
    }
    else {
      v446 = v441;
    }
    if (v501 <= 0.00001)
    {
      v465 = v417;
      if (v445) {
        v465 = v549;
      }
      inputSecondardouble y = v570->inputSecondary;
      v585[0] = @"inputSource";
      v585[1] = @"inputSpecularMask";
      v586[0] = inputSecondary;
      v586[1] = v465;
      v586[2] = &unk_1EE4AB640;
      v585[2] = @"inputSpecularThreshold";
      v585[3] = @"inputSpecIntensity";
      *(float *)&double v442 = v533;
      uint64_t v467 = [NSNumber numberWithFloat:v442];
      v585[4] = @"inputDebugFlag";
      v586[3] = v467;
      v586[4] = &unk_1EE4AA7D8;
      uint64_t v464 = objc_msgSend(v446, "imageByApplyingFilter:withInputParameters:", @"RedEyeSpecular", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v586, v585, 5));
    }
    else
    {
      v447 = +[CIKernel kernelWithInternalRepresentation:&CI::_rer_glint];
      [(CIImage *)v570->inputPrimary extent];
      CGFloat v449 = v448;
      CGFloat v451 = v450;
      CGFloat v453 = v452;
      CGFloat v455 = v454;
      [v446 extent];
      v660.origin.double x = v456;
      v660.origin.double y = v457;
      v660.size.double width = v458;
      v660.size.double height = v459;
      v658.origin.double x = v449;
      v658.origin.double y = v451;
      v658.size.double width = v453;
      v658.size.double height = v455;
      CGRect v659 = CGRectUnion(v658, v660);
      double x = v659.origin.x;
      double y = v659.origin.y;
      double width = v659.size.width;
      double height = v659.size.height;
      v587[0] = v570->inputPrimary;
      v587[1] = v446;
      *(float *)&v659.origin.double x = v502;
      v587[2] = [NSNumber numberWithFloat:v659.origin.x];
      uint64_t v464 = -[CIColorKernel applyWithExtent:arguments:](v447, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v587 count:3], x, y, width, height);
    }
    char v444 = 0;
    v588[v443] = v464;
    uint64_t v443 = 1;
  }
  while ((v445 & 1) != 0);
  v468 = (CIImage *)v588[0];
  v469 = (CIImage *)v588[1];
  [(NSNumber *)v570->inputIntersect floatValue];
  if (v470 > 0.0)
  {
    [(NSNumber *)v570->inputIntersect floatValue];
    int v472 = v471;
    memset(&v573, 0, sizeof(v573));
    CGAffineTransformMakeTranslation(&v573, v569 - v563, v566 - v565);
    CGAffineTransform v572 = v573;
    v473 = RRmultiplyRh(v390, [(CIImage *)v559 imageByApplyingTransform:&v572]);
    v583 = @"inputExtent";
    v584 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v569, v566, v567, v568);
    uint64_t v474 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v473, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v584 forKeys:&v583 count:1]), "imageByClampingToExtent");
    v475 = +[CIKernel kernelWithInternalRepresentation:&CI::_drr_threshold];
    [(CIImage *)v468 extent];
    double v477 = v476;
    double v479 = v478;
    double v481 = v480;
    double v483 = v482;
    v582[0] = v468;
    v582[1] = v474;
    LODWORD(v476) = v472;
    v582[2] = [NSNumber numberWithFloat:v476];
    v468 = -[CIColorKernel applyWithExtent:arguments:](v475, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v582 count:3], v477, v479, v481, v483);
    [(CIImage *)v469 extent];
    double v485 = v484;
    double v487 = v486;
    double v489 = v488;
    double v491 = v490;
    v581[0] = v469;
    v581[1] = v474;
    LODWORD(v484) = v472;
    v581[2] = [NSNumber numberWithFloat:v484];
    v469 = -[CIColorKernel applyWithExtent:arguments:](v475, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v581 count:3], v485, v487, v489, v491);
  }
  v492 = objc_msgSend((id)objc_msgSend(-[CIImage _imageByRenderingToIntermediate](v468, "_imageByRenderingToIntermediate"), "imageByCroppingToRect:", v569, v566, v567, v568), "imageByCompositingOverImage:", objc_msgSend(-[CIImage _imageByRenderingToIntermediate](v469, "_imageByRenderingToIntermediate"), "imageByCroppingToRect:", v563, v565, v564, v542));
  [(CIImage *)v570->inputPrimary extent];
  return (id)objc_msgSend(v492, "imageByCroppingToRect:");
}

- (CIImage)inputPrimary
{
  return self->inputPrimary;
}

- (void)setInputPrimary:(id)a3
{
}

- (CIImage)inputSecondary
{
  return self->inputSecondary;
}

- (void)setInputSecondary:(id)a3
{
}

- (CIVector)inputSize
{
  return self->inputSize;
}

- (void)setInputSize:(id)a3
{
}

- (CIVector)inputOriginLeft
{
  return self->inputOriginLeft;
}

- (void)setInputOriginLeft:(id)a3
{
}

- (CIVector)inputOriginRight
{
  return self->inputOriginRight;
}

- (void)setInputOriginRight:(id)a3
{
}

- (CIVector)inputAxisShortLeft
{
  return self->inputAxisShortLeft;
}

- (void)setInputAxisShortLeft:(id)a3
{
}

- (CIVector)inputAxisShortRight
{
  return self->inputAxisShortRight;
}

- (void)setInputAxisShortRight:(id)a3
{
}

- (CIVector)inputAxisLongLeft
{
  return self->inputAxisLongLeft;
}

- (void)setInputAxisLongLeft:(id)a3
{
}

- (CIVector)inputAxisLongRight
{
  return self->inputAxisLongRight;
}

- (void)setInputAxisLongRight:(id)a3
{
}

- (CIVector)inputPupilCenterLeft
{
  return self->inputPupilCenterLeft;
}

- (void)setInputPupilCenterLeft:(id)a3
{
}

- (CIVector)inputPupilCenterRight
{
  return self->inputPupilCenterRight;
}

- (void)setInputPupilCenterRight:(id)a3
{
}

- (NSNumber)inputOrientationHint
{
  return self->inputOrientationHint;
}

- (void)setInputOrientationHint:(id)a3
{
}

- (NSNumber)inputOrientationScale
{
  return self->inputOrientationScale;
}

- (void)setInputOrientationScale:(id)a3
{
}

- (NSNumber)inputRepairSource
{
  return self->inputRepairSource;
}

- (void)setInputRepairSource:(id)a3
{
}

- (NSNumber)inputRepairDarken
{
  return self->inputRepairDarken;
}

- (void)setInputRepairDarken:(id)a3
{
}

- (NSNumber)inputRepairChroma
{
  return self->inputRepairChroma;
}

- (void)setInputRepairChroma:(id)a3
{
}

- (NSNumber)inputCutoff
{
  return self->inputCutoff;
}

- (void)setInputCutoff:(id)a3
{
}

- (NSNumber)inputSpecMin
{
  return self->inputSpecMin;
}

- (void)setInputSpecMin:(id)a3
{
}

- (NSNumber)inputSpecMax
{
  return self->inputSpecMax;
}

- (void)setInputSpecMax:(id)a3
{
}

- (NSNumber)inputSpecular
{
  return self->inputSpecular;
}

- (void)setInputSpecular:(id)a3
{
}

- (NSNumber)inputSpecIntensity
{
  return self->inputSpecIntensity;
}

- (void)setInputSpecIntensity:(id)a3
{
}

- (NSNumber)inputShowMask
{
  return self->inputShowMask;
}

- (void)setInputShowMask:(id)a3
{
}

- (NSNumber)inputRepairPercent
{
  return self->inputRepairPercent;
}

- (void)setInputRepairPercent:(id)a3
{
}

- (NSNumber)inputInterPeakMin
{
  return self->inputInterPeakMin;
}

- (void)setInputInterPeakMin:(id)a3
{
}

- (NSNumber)inputRepairPercentile
{
  return self->inputRepairPercentile;
}

- (void)setInputRepairPercentile:(id)a3
{
}

- (NSNumber)inputClipMin
{
  return self->inputClipMin;
}

- (void)setInputClipMin:(id)a3
{
}

- (NSNumber)inputMidSpectrumWhiteOffsetsX
{
  return self->inputMidSpectrumWhiteOffsetsX;
}

- (void)setInputMidSpectrumWhiteOffsetsX:(id)a3
{
}

- (NSNumber)inputMidSpectrumWhiteOffsetsY
{
  return self->inputMidSpectrumWhiteOffsetsY;
}

- (void)setInputMidSpectrumWhiteOffsetsY:(id)a3
{
}

- (NSNumber)inputClosingErosion
{
  return self->inputClosingErosion;
}

- (void)setInputClosingErosion:(id)a3
{
}

- (NSNumber)inputClosingDilation
{
  return self->inputClosingDilation;
}

- (void)setInputClosingDilation:(id)a3
{
}

- (NSNumber)inputSplat
{
  return self->inputSplat;
}

- (void)setInputSplat:(id)a3
{
}

- (NSNumber)inputFlooding
{
  return self->inputFlooding;
}

- (void)setInputFlooding:(id)a3
{
}

- (NSNumber)inputGamma
{
  return self->inputGamma;
}

- (void)setInputGamma:(id)a3
{
}

- (NSNumber)inputFeathering
{
  return self->inputFeathering;
}

- (void)setInputFeathering:(id)a3
{
}

- (NSNumber)inputFSmooth
{
  return self->inputFSmooth;
}

- (void)setInputFSmooth:(id)a3
{
}

- (NSNumber)inputRepairDither
{
  return self->inputRepairDither;
}

- (void)setInputRepairDither:(id)a3
{
}

- (NSNumber)inputRecover
{
  return self->inputRecover;
}

- (void)setInputRecover:(id)a3
{
}

- (NSNumber)inputSpecArea
{
  return self->inputSpecArea;
}

- (void)setInputSpecArea:(id)a3
{
}

- (NSNumber)inputSpecAreaScale
{
  return self->inputSpecAreaScale;
}

- (void)setInputSpecAreaScale:(id)a3
{
}

- (NSNumber)inputWhiteCutoff
{
  return self->inputWhiteCutoff;
}

- (void)setInputWhiteCutoff:(id)a3
{
}

- (NSNumber)inputSpecularCutoff
{
  return self->inputSpecularCutoff;
}

- (void)setInputSpecularCutoff:(id)a3
{
}

- (NSNumber)inputAbortDensityLo
{
  return self->inputAbortDensityLo;
}

- (void)setInputAbortDensityLo:(id)a3
{
}

- (NSNumber)inputAbortDensityDiff
{
  return self->inputAbortDensityDiff;
}

- (void)setInputAbortDensityDiff:(id)a3
{
}

- (NSNumber)inputCircularity
{
  return self->inputCircularity;
}

- (void)setInputCircularity:(id)a3
{
}

- (NSNumber)inputIntersect
{
  return self->inputIntersect;
}

- (void)setInputIntersect:(id)a3
{
}

- (NSNumber)inputSkinThreshold
{
  return self->inputSkinThreshold;
}

- (void)setInputSkinThreshold:(id)a3
{
}

- (NSNumber)inputSkinThresholdMed
{
  return self->inputSkinThresholdMed;
}

- (void)setInputSkinThresholdMed:(id)a3
{
}

- (NSNumber)inputScleraThreshold
{
  return self->inputScleraThreshold;
}

- (void)setInputScleraThreshold:(id)a3
{
}

- (NSNumber)inputCenterSpecRad
{
  return self->inputCenterSpecRad;
}

- (void)setInputCenterSpecRad:(id)a3
{
}

- (NSNumber)inputFalloffDensity
{
  return self->inputFalloffDensity;
}

- (void)setInputFalloffDensity:(id)a3
{
}

- (NSNumber)inputFalloffRepair
{
  return self->inputFalloffRepair;
}

- (void)setInputFalloffRepair:(id)a3
{
}

- (NSNumber)inputFalloffSpecular
{
  return self->inputFalloffSpecular;
}

- (void)setInputFalloffSpecular:(id)a3
{
}

- (NSNumber)inputRadiusRepair
{
  return self->inputRadiusRepair;
}

- (void)setInputRadiusRepair:(id)a3
{
}

- (NSNumber)inputRadiusDensity
{
  return self->inputRadiusDensity;
}

- (void)setInputRadiusDensity:(id)a3
{
}

- (NSNumber)inputRadiusSpecular
{
  return self->inputRadiusSpecular;
}

- (void)setInputRadiusSpecular:(id)a3
{
}

- (NSNumber)inputCentroidIterations
{
  return self->inputCentroidIterations;
}

- (void)setInputCentroidIterations:(id)a3
{
}

- (NSNumber)inputCentroidGamma
{
  return self->inputCentroidGamma;
}

- (void)setInputCentroidGamma:(id)a3
{
}

- (NSNumber)inputCentroidRadius
{
  return self->inputCentroidRadius;
}

- (void)setInputCentroidRadius:(id)a3
{
}

- (NSNumber)inputCentroidRadiusSmall
{
  return self->inputCentroidRadiusSmall;
}

- (void)setInputCentroidRadiusSmall:(id)a3
{
}

- (NSNumber)inputSearchLong
{
  return self->inputSearchLong;
}

- (void)setInputSearchLong:(id)a3
{
}

- (NSNumber)inputSearchShort
{
  return self->inputSearchShort;
}

- (void)setInputSearchShort:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputParam
{
  return self->inputParam;
}

- (void)setInputParam:(id)a3
{
}

- (NSNumber)inputParam2
{
  return self->inputParam2;
}

- (void)setInputParam2:(id)a3
{
}

- (NSNumber)inputParam3
{
  return self->inputParam3;
}

- (void)setInputParam3:(id)a3
{
}

- (NSNumber)inputParam4
{
  return self->inputParam4;
}

- (void)setInputParam4:(id)a3
{
}

- (NSNumber)inputRefilterSpace
{
  return self->inputRefilterSpace;
}

- (void)setInputRefilterSpace:(id)a3
{
}

- (NSNumber)inputRefilterRange
{
  return self->inputRefilterRange;
}

- (void)setInputRefilterRange:(id)a3
{
}

- (NSNumber)inputDetectWhite
{
  return self->inputDetectWhite;
}

- (void)setInputDetectWhite:(id)a3
{
}

- (NSNumber)inputDetectRed
{
  return self->inputDetectRed;
}

- (void)setInputDetectRed:(id)a3
{
}

- (NSNumber)inputMinInterDispersion
{
  return self->inputMinInterDispersion;
}

- (void)setInputMinInterDispersion:(id)a3
{
}

- (NSNumber)inputMaxInterDispersion
{
  return self->inputMaxInterDispersion;
}

- (void)setInputMaxInterDispersion:(id)a3
{
}

- (NSNumber)inputMinMaskDiff
{
  return self->inputMinMaskDiff;
}

- (void)setInputMinMaskDiff:(id)a3
{
}

- (NSNumber)inputGlintThreshold
{
  return self->inputGlintThreshold;
}

- (void)setInputGlintThreshold:(id)a3
{
}

- (NSNumber)inputTargetClosing
{
  return self->inputTargetClosing;
}

- (void)setInputTargetClosing:(id)a3
{
}

- (NSNumber)inputUseFaceSegmentationMask
{
  return self->inputUseFaceSegmentationMask;
}

- (void)setInputUseFaceSegmentationMask:(id)a3
{
}

- (NSNumber)inputDetectionThresholdIrisSmall
{
  return self->inputDetectionThresholdIrisSmall;
}

- (void)setInputDetectionThresholdIrisSmall:(id)a3
{
}

- (NSNumber)inputDetectionThresholdScleraSmall
{
  return self->inputDetectionThresholdScleraSmall;
}

- (void)setInputDetectionThresholdScleraSmall:(id)a3
{
}

- (NSNumber)inputDetectionThresholdSkinSmall
{
  return self->inputDetectionThresholdSkinSmall;
}

- (void)setInputDetectionThresholdSkinSmall:(id)a3
{
}

- (NSNumber)inputScleraProtectionThresholdIrisSmall
{
  return self->inputScleraProtectionThresholdIrisSmall;
}

- (void)setInputScleraProtectionThresholdIrisSmall:(id)a3
{
}

- (NSNumber)inputScleraProtectionThresholdScleraSmall
{
  return self->inputScleraProtectionThresholdScleraSmall;
}

- (void)setInputScleraProtectionThresholdScleraSmall:(id)a3
{
}

- (NSNumber)inputScleraProtectionThresholdSkinSmall
{
  return self->inputScleraProtectionThresholdSkinSmall;
}

- (void)setInputScleraProtectionThresholdSkinSmall:(id)a3
{
}

- (NSNumber)inputSkinProtectionThresholdSmall
{
  return self->inputSkinProtectionThresholdSmall;
}

- (void)setInputSkinProtectionThresholdSmall:(id)a3
{
}

- (NSNumber)inputDetectionThresholdIrisMedium
{
  return self->inputDetectionThresholdIrisMedium;
}

- (void)setInputDetectionThresholdIrisMedium:(id)a3
{
}

- (NSNumber)inputDetectionThresholdScleraMedium
{
  return self->inputDetectionThresholdScleraMedium;
}

- (void)setInputDetectionThresholdScleraMedium:(id)a3
{
}

- (NSNumber)inputDetectionThresholdSkinMedium
{
  return self->inputDetectionThresholdSkinMedium;
}

- (void)setInputDetectionThresholdSkinMedium:(id)a3
{
}

- (NSNumber)inputScleraProtectionThresholdIrisMedium
{
  return self->inputScleraProtectionThresholdIrisMedium;
}

- (void)setInputScleraProtectionThresholdIrisMedium:(id)a3
{
}

- (NSNumber)inputScleraProtectionThresholdScleraMedium
{
  return self->inputScleraProtectionThresholdScleraMedium;
}

- (void)setInputScleraProtectionThresholdScleraMedium:(id)a3
{
}

- (NSNumber)inputScleraProtectionThresholdSkinMedium
{
  return self->inputScleraProtectionThresholdSkinMedium;
}

- (void)setInputScleraProtectionThresholdSkinMedium:(id)a3
{
}

- (NSNumber)inputSkinProtectionThresholdMedium
{
  return self->inputSkinProtectionThresholdMedium;
}

- (void)setInputSkinProtectionThresholdMedium:(id)a3
{
}

- (NSNumber)inputDetectionThresholdIrisLarge
{
  return self->inputDetectionThresholdIrisLarge;
}

- (void)setInputDetectionThresholdIrisLarge:(id)a3
{
}

- (NSNumber)inputDetectionThresholdScleraLarge
{
  return self->inputDetectionThresholdScleraLarge;
}

- (void)setInputDetectionThresholdScleraLarge:(id)a3
{
}

- (NSNumber)inputDetectionThresholdSkinLarge
{
  return self->inputDetectionThresholdSkinLarge;
}

- (void)setInputDetectionThresholdSkinLarge:(id)a3
{
}

- (NSNumber)inputScleraProtectionThresholdIrisLarge
{
  return self->inputScleraProtectionThresholdIrisLarge;
}

- (void)setInputScleraProtectionThresholdIrisLarge:(id)a3
{
}

- (NSNumber)inputScleraProtectionThresholdScleraLarge
{
  return self->inputScleraProtectionThresholdScleraLarge;
}

- (void)setInputScleraProtectionThresholdScleraLarge:(id)a3
{
}

- (NSNumber)inputScleraProtectionThresholdSkinLarge
{
  return self->inputScleraProtectionThresholdSkinLarge;
}

- (void)setInputScleraProtectionThresholdSkinLarge:(id)a3
{
}

- (NSNumber)inputSkinProtectionThresholdLarge
{
  return self->inputSkinProtectionThresholdLarge;
}

- (void)setInputSkinProtectionThresholdLarge:(id)a3
{
}

- (CIImage)inputIrisMask
{
  return self->inputIrisMask;
}

- (void)setInputIrisMask:(id)a3
{
}

- (CIImage)inputScleraMask
{
  return self->inputScleraMask;
}

- (void)setInputScleraMask:(id)a3
{
}

- (CIImage)inputSkinMask
{
  return self->inputSkinMask;
}

- (void)setInputSkinMask:(id)a3
{
}

- (void)outputImage
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136446722;
  double v4 = "-[CIRedEyeRaw outputImage]";
  __int16 v5 = 2048;
  double v6 = a3;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}s Eye size: major axis %.0f -> %@", (uint8_t *)&v3, 0x20u);
}

@end