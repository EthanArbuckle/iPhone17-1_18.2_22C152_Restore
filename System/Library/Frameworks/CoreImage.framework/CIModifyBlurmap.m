@interface CIModifyBlurmap
+ (id)customAttributes;
- (CIImage)inputFaceMaskDeltaImage;
- (CIImage)inputHairAlpha;
- (CIImage)inputImage;
- (CIImage)inputPersonAlpha;
- (CIVector)inputFaceMidPointX;
- (CIVector)inputFaceMidPointY;
- (CIVector)inputHairAdditive;
- (CIVector)inputHairSubtractive;
- (CIVector)inputLeftEyeX;
- (CIVector)inputLeftEyeY;
- (CIVector)inputPersonAdditive;
- (CIVector)inputPersonSubtractive;
- (CIVector)inputRightEyeX;
- (CIVector)inputRightEyeY;
- (NSNumber)inputApertureScaling;
- (NSNumber)inputDistanceAdd;
- (NSNumber)inputEyeProtectionFaceWeightsSmoothStepMax;
- (NSNumber)inputEyeProtectionFaceWeightsSmoothStepMin;
- (NSNumber)inputEyeProtectionMaxFaces;
- (NSNumber)inputEyeProtectionOvalDimsDistanceOffset;
- (NSNumber)inputEyeProtectionOvalDimsDistanceScale;
- (NSNumber)inputEyeProtectionOvalDimsRadiusHorizontal;
- (NSNumber)inputEyeProtectionOvalDimsRadiusVertical;
- (NSNumber)inputEyeProtectionOvalFallOffSmoothStepMax;
- (NSNumber)inputEyeProtectionOvalFallOffSmoothStepMin;
- (NSNumber)inputEyeProtectionPersonMaskSmoothStepMax;
- (NSNumber)inputEyeProtectionPersonMaskSmoothStepMin;
- (NSNumber)inputEyeProtectionPreventStrength;
- (NSNumber)inputEyeProtectionSubtractiveApertureScaling;
- (NSNumber)inputEyeProtectionSubtractiveMaxBlur;
- (NSNumber)inputHairDistance;
- (NSNumber)inputHairMaxBlur;
- (NSNumber)inputHairThreshold;
- (NSNumber)inputMaxBlur;
- (NSNumber)inputPersonDistance;
- (NSNumber)inputPersonMaxBlur;
- (NSNumber)inputPersonThreshold;
- (NSNumber)inputProtectBodyStrength;
- (NSNumber)inputRelativeApertureScalingStrength;
- (NSNumber)inputScale;
- (NSNumber)inputSmoothstepMax;
- (NSNumber)inputSmoothstepMin;
- (id)outputImage;
- (void)outputImage;
- (void)setInputApertureScaling:(id)a3;
- (void)setInputDistanceAdd:(id)a3;
- (void)setInputEyeProtectionFaceWeightsSmoothStepMax:(id)a3;
- (void)setInputEyeProtectionFaceWeightsSmoothStepMin:(id)a3;
- (void)setInputEyeProtectionMaxFaces:(id)a3;
- (void)setInputEyeProtectionOvalDimsDistanceOffset:(id)a3;
- (void)setInputEyeProtectionOvalDimsDistanceScale:(id)a3;
- (void)setInputEyeProtectionOvalDimsRadiusHorizontal:(id)a3;
- (void)setInputEyeProtectionOvalDimsRadiusVertical:(id)a3;
- (void)setInputEyeProtectionOvalFallOffSmoothStepMax:(id)a3;
- (void)setInputEyeProtectionOvalFallOffSmoothStepMin:(id)a3;
- (void)setInputEyeProtectionPersonMaskSmoothStepMax:(id)a3;
- (void)setInputEyeProtectionPersonMaskSmoothStepMin:(id)a3;
- (void)setInputEyeProtectionPreventStrength:(id)a3;
- (void)setInputEyeProtectionSubtractiveApertureScaling:(id)a3;
- (void)setInputEyeProtectionSubtractiveMaxBlur:(id)a3;
- (void)setInputFaceMaskDeltaImage:(id)a3;
- (void)setInputFaceMidPointX:(id)a3;
- (void)setInputFaceMidPointY:(id)a3;
- (void)setInputHairAdditive:(id)a3;
- (void)setInputHairAlpha:(id)a3;
- (void)setInputHairDistance:(id)a3;
- (void)setInputHairMaxBlur:(id)a3;
- (void)setInputHairSubtractive:(id)a3;
- (void)setInputHairThreshold:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLeftEyeX:(id)a3;
- (void)setInputLeftEyeY:(id)a3;
- (void)setInputMaxBlur:(id)a3;
- (void)setInputPersonAdditive:(id)a3;
- (void)setInputPersonAlpha:(id)a3;
- (void)setInputPersonDistance:(id)a3;
- (void)setInputPersonMaxBlur:(id)a3;
- (void)setInputPersonSubtractive:(id)a3;
- (void)setInputPersonThreshold:(id)a3;
- (void)setInputProtectBodyStrength:(id)a3;
- (void)setInputRelativeApertureScalingStrength:(id)a3;
- (void)setInputRightEyeX:(id)a3;
- (void)setInputRightEyeY:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputSmoothstepMax:(id)a3;
- (void)setInputSmoothstepMin:(id)a3;
@end

@implementation CIModifyBlurmap

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorAdjustment";
  v3[1] = @"CICategoryStillImage";
  v3[2] = @"CICategoryBuiltIn";
  v3[3] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  v5[1] = @"13";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.15";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  v4 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]);
  [(CIImage *)inputImage extent];
  uint64_t v5 = -[CIImage imageByCroppingToRect:](v4, "imageByCroppingToRect:");
  if (inputImage)
  {
    uint64_t v6 = v5;
    if (self->inputPersonAlpha)
    {
      CGAffineTransform v178 = *(CGAffineTransform *)byte_19394D1E0;
      long long v179 = unk_19394D210;
      uint64_t v180 = 0x3FB0000000000000;
      v7 = +[CIVector vectorWithValues:&v178 count:9];
      [(CIImage *)self->inputPersonAlpha extent];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      v16 = [(CIImage *)self->inputPersonAlpha imageByClampingToExtent];
      v176 = @"inputWeights";
      v177 = v7;
      v17 = -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingFilter:withInputParameters:](v16, "imageByApplyingFilter:withInputParameters:", @"CIConvolution3X3", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1]), "imageByCroppingToRect:", v9, v11, v13, v15);
    }
    else
    {
      v17 = 0;
    }
    [(NSNumber *)self->inputScale floatValue];
    float v20 = v19;
    memset(&v178, 0, sizeof(v178));
    CGAffineTransformMakeScale(&v178, v19, v19);
    BOOL v21 = v20 == 1.0 || v17 == 0;
    v22 = v17;
    if (!v21)
    {
      CGAffineTransform v158 = v178;
      v22 = [(CIImage *)v17 imageByApplyingTransform:&v158];
    }
    inputHairAlpha = self->inputHairAlpha;
    if (v20 != 1.0 && inputHairAlpha)
    {
      CGAffineTransform v158 = v178;
      inputHairAlpha = [(CIImage *)inputHairAlpha imageByApplyingTransform:&v158];
    }
    unint64_t v24 = 0x1E9329000;
    uint64_t v25 = v6;
    uint64_t v26 = v6;
    if (v22)
    {
      [(NSNumber *)self->inputPersonMaxBlur floatValue];
      uint64_t v25 = v6;
      uint64_t v26 = v6;
      if (v27 > 0.0)
      {
        [(NSNumber *)self->inputPersonMaxBlur floatValue];
        float v29 = v28;
        [(NSNumber *)self->inputDistanceAdd floatValue];
        float v31 = v29 * v30;
        [(NSNumber *)self->inputApertureScaling floatValue];
        *(float *)&double v33 = v31 * v32;
        inputPersonDistance = self->inputPersonDistance;
        v174[0] = @"inputDistance";
        v174[1] = @"inputThreshold";
        inputPersonThreshold = self->inputPersonThreshold;
        v175[0] = inputPersonDistance;
        v175[1] = inputPersonThreshold;
        v174[2] = @"inputScalingFactor";
        v175[2] = [NSNumber numberWithFloat:v33];
        uint64_t v26 = -[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", @"CIBlurmapRefinementDistanceDelta", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:v174 count:3]);
        inputPersonAdditive = self->inputPersonAdditive;
        v172[0] = @"inputAddBlur";
        v172[1] = @"inputRemoveBlur";
        inputPersonSubtractive = self->inputPersonSubtractive;
        v173[0] = inputPersonAdditive;
        v173[1] = inputPersonSubtractive;
        inputApertureScaling = self->inputApertureScaling;
        unint64_t v24 = 0x1E9329000uLL;
        v172[2] = @"inputApertureScaling";
        v172[3] = @"inputMaxBlur";
        inputPersonMaxBlur = self->inputPersonMaxBlur;
        v173[2] = inputApertureScaling;
        v173[3] = inputPersonMaxBlur;
        uint64_t v25 = -[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", @"CIFusionDelta", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v173 forKeys:v172 count:4]);
      }
    }
    uint64_t v154 = v25;
    uint64_t v155 = v26;
    if (inputHairAlpha && ([(NSNumber *)self->inputHairMaxBlur floatValue], v40 > 0.0))
    {
      [(NSNumber *)self->inputHairMaxBlur floatValue];
      float v42 = v41;
      [(NSNumber *)self->inputDistanceAdd floatValue];
      float v44 = v42 * v43;
      uint64_t v45 = *(int *)(v24 + 780);
      [*(id *)((char *)&self->super.super.isa + v45) floatValue];
      *(float *)&double v47 = v44 * v46;
      inputHairDistance = self->inputHairDistance;
      v170[0] = @"inputDistance";
      v170[1] = @"inputThreshold";
      inputHairThreshold = self->inputHairThreshold;
      v171[0] = inputHairDistance;
      v171[1] = inputHairThreshold;
      v170[2] = @"inputScalingFactor";
      v171[2] = [NSNumber numberWithFloat:v47];
      uint64_t v153 = -[CIImage imageByApplyingFilter:withInputParameters:](inputHairAlpha, "imageByApplyingFilter:withInputParameters:", @"CIBlurmapRefinementDistanceDelta", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v171 forKeys:v170 count:3]);
      if (v22)
      {
        inputHairAdditive = self->inputHairAdditive;
        v168[0] = @"inputSecondaryImage";
        v168[1] = @"inputAdditive";
        inputHairSubtractive = self->inputHairSubtractive;
        v169[0] = v22;
        v169[1] = inputHairAdditive;
        uint64_t v52 = *(uint64_t *)((char *)&self->super.super.isa + v45);
        v168[2] = @"inputSubtractive";
        v168[3] = @"inputApertureScaling";
        inputHairMaxBlur = self->inputHairMaxBlur;
        v169[2] = inputHairSubtractive;
        v169[3] = v52;
        v168[4] = @"inputMaxBlur";
        v168[5] = @"inputProtectStrength";
        inputProtectBodyStrength = self->inputProtectBodyStrength;
        v169[4] = inputHairMaxBlur;
        v169[5] = inputProtectBodyStrength;
        uint64_t v55 = -[CIImage imageByApplyingFilter:withInputParameters:](inputHairAlpha, "imageByApplyingFilter:withInputParameters:", @"CIFusionTwoImagesDelta", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:v168 count:6]);
      }
      else
      {
        uint64_t v55 = v6;
      }
    }
    else
    {
      uint64_t v55 = v6;
      uint64_t v153 = v6;
    }
    if (outputImage_onceToken != -1) {
      dispatch_once(&outputImage_onceToken, &__block_literal_global_2);
    }
    if (!outputImage_calculatorKernel) {
      -[CIModifyBlurmap outputImage]();
    }
    if (!outputImage_modifyBlurmapKernel) {
      -[CIModifyBlurmap outputImage]();
    }
    if (!outputImage_combineAllDeltasKernel) {
      -[CIModifyBlurmap outputImage]();
    }
    v152 = inputImage;
    [(NSNumber *)self->inputEyeProtectionOvalDimsDistanceScale floatValue];
    double v57 = v56;
    [(NSNumber *)self->inputEyeProtectionOvalDimsDistanceOffset floatValue];
    double v59 = v58;
    [(NSNumber *)self->inputEyeProtectionOvalDimsRadiusHorizontal floatValue];
    double v61 = v60;
    [(NSNumber *)self->inputEyeProtectionOvalDimsRadiusVertical floatValue];
    v63 = +[CIVector vectorWithX:v57 Y:v59 Z:v61 W:v62];
    if ([(NSNumber *)self->inputEyeProtectionMaxFaces intValue] >= 5) {
      -[CIModifyBlurmap outputImage].cold.4();
    }
    uint64_t v150 = v55;
    v151 = v17;
    [(NSNumber *)self->inputEyeProtectionFaceWeightsSmoothStepMin floatValue];
    double v65 = v64;
    [(NSNumber *)self->inputEyeProtectionFaceWeightsSmoothStepMax floatValue];
    double v67 = v66;
    double v68 = (double)[(NSNumber *)self->inputEyeProtectionMaxFaces intValue];
    [(NSNumber *)self->inputEyeProtectionSubtractiveMaxBlur floatValue];
    v70 = +[CIVector vectorWithX:v65 Y:v67 Z:v68 W:v69];
    double v71 = addPoints(self->inputLeftEyeX, self->inputLeftEyeY, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    double v75 = addPoints(self->inputRightEyeX, self->inputRightEyeY, v71, v72, v73, v74);
    v183.origin.CGFloat x = addPoints(self->inputFaceMidPointX, self->inputFaceMidPointY, v75, v76, v77, v78);
    CGRect v184 = CGRectIntegral(v183);
    CGRect v185 = CGRectInset(v184, -1.0, -1.0);
    CGFloat height = v185.size.height;
    CGFloat x = v185.origin.x;
    CGFloat y = v185.origin.y;
    CGFloat width = v185.size.width;
    inputLeftEyeX = self->inputLeftEyeX;
    inputLeftEyeY = self->inputLeftEyeY;
    v167[0] = v152;
    v167[1] = inputLeftEyeX;
    inputRightEyeX = self->inputRightEyeX;
    inputRightEyeY = self->inputRightEyeY;
    v167[2] = inputLeftEyeY;
    v167[3] = inputRightEyeX;
    inputFaceMidPointX = self->inputFaceMidPointX;
    inputFaceMidPointY = self->inputFaceMidPointY;
    v167[4] = inputRightEyeY;
    v167[5] = inputFaceMidPointX;
    v167[6] = inputFaceMidPointY;
    v167[7] = v63;
    v167[8] = v70;
    uint64_t v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v167 count:9];
    v90 = (void *)outputImage_calculatorKernel;
    v157[0] = MEMORY[0x1E4F143A8];
    v157[1] = 3221225472;
    v157[2] = __30__CIModifyBlurmap_outputImage__block_invoke_2;
    v157[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    *(CGFloat *)&v157[4] = x;
    *(CGFloat *)&v157[5] = y;
    *(CGFloat *)&v157[6] = width;
    *(CGFloat *)&v157[7] = height;
    v165 = @"kCIKernelOutputFormat";
    uint64_t v166 = [NSNumber numberWithInt:2056];
    v91 = objc_msgSend(v90, "applyWithExtent:roiCallback:arguments:options:", v157, v89, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1), 0.0, 0.0, 7.0, 1.0);
    if (!v91) {
      -[CIModifyBlurmap outputImage].cold.5();
    }
    v92 = (void *)[v91 _imageByRenderingToIntermediate];
    [(NSNumber *)self->inputSmoothstepMin floatValue];
    double v94 = v93;
    [(NSNumber *)self->inputSmoothstepMax floatValue];
    double v96 = v95;
    [(NSNumber *)self->inputMaxBlur floatValue];
    double v98 = v97;
    [(NSNumber *)self->inputRelativeApertureScalingStrength floatValue];
    v149 = +[CIVector vectorWithX:v94 Y:v96 Z:v98 W:v99];
    [(NSNumber *)self->inputEyeProtectionPersonMaskSmoothStepMin floatValue];
    double v101 = v100;
    [(NSNumber *)self->inputEyeProtectionPersonMaskSmoothStepMax floatValue];
    double v103 = v102;
    [(NSNumber *)self->inputEyeProtectionPreventStrength floatValue];
    double v105 = v104;
    [(NSNumber *)self->inputRelativeApertureScalingStrength floatValue];
    v107 = +[CIVector vectorWithX:v101 Y:v103 Z:v105 W:v106];
    [(NSNumber *)self->inputEyeProtectionSubtractiveApertureScaling floatValue];
    double v109 = v108;
    [(NSNumber *)self->inputEyeProtectionSubtractiveMaxBlur floatValue];
    double v111 = v110;
    [(NSNumber *)self->inputEyeProtectionOvalFallOffSmoothStepMin floatValue];
    double v113 = v112;
    [(NSNumber *)self->inputEyeProtectionOvalFallOffSmoothStepMax floatValue];
    v115 = +[CIVector vectorWithX:v109 Y:v111 Z:v113 W:v114];
    v164[0] = v150;
    v164[1] = v154;
    v164[2] = v153;
    v164[3] = v155;
    inputRelativeApertureScalingStrength = self->inputRelativeApertureScalingStrength;
    v164[4] = self->inputFaceMaskDeltaImage;
    v164[5] = inputRelativeApertureScalingStrength;
    v164[6] = self->inputApertureScaling;
    uint64_t v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:7];
    v118 = (void *)outputImage_combineAllDeltasKernel;
    [(CIImage *)v152 extent];
    double v120 = v119;
    double v122 = v121;
    double v124 = v123;
    double v126 = v125;
    v162[0] = @"kCIKernelOutputFormat";
    uint64_t v127 = [NSNumber numberWithInt:2053];
    v162[1] = @"kCIImageAlphaOne";
    v163[0] = v127;
    v163[1] = MEMORY[0x1E4F1CC38];
    uint64_t v128 = objc_msgSend(v118, "applyWithExtent:arguments:options:", v117, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v163, v162, 2), v120, v122, v124, v126);
    v161[0] = self->inputImage;
    v161[1] = v92;
    uint64_t v129 = v6;
    if (v151) {
      uint64_t v129 = (uint64_t)v151;
    }
    v161[2] = v128;
    v161[3] = v129;
    v161[4] = v149;
    v161[5] = v107;
    v161[6] = v115;
    uint64_t v130 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:7];
    [v92 extent];
    uint64_t v132 = v131;
    uint64_t v134 = v133;
    uint64_t v136 = v135;
    uint64_t v138 = v137;
    v139 = (void *)outputImage_modifyBlurmapKernel;
    [(CIImage *)self->inputImage extent];
    double v141 = v140;
    double v143 = v142;
    double v145 = v144;
    double v147 = v146;
    v156[0] = MEMORY[0x1E4F143A8];
    v156[1] = 3221225472;
    v156[2] = __30__CIModifyBlurmap_outputImage__block_invoke_3;
    v156[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    v156[4] = v132;
    v156[5] = v134;
    v156[6] = v136;
    v156[7] = v138;
    v159[0] = @"kCIKernelOutputFormat";
    uint64_t v148 = [NSNumber numberWithInt:2053];
    v159[1] = @"kCIImageAlphaOne";
    v160[0] = v148;
    v160[1] = MEMORY[0x1E4F1CC38];
    return (id)objc_msgSend(v139, "applyWithExtent:roiCallback:arguments:options:", v156, v130, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v160, v159, 2), v141, v143, v145, v147);
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

id __30__CIModifyBlurmap_outputImage__block_invoke()
{
  outputImage_calculatorKernel = (uint64_t)+[CIKernel SDOFV2MetalKernelNamed:@"_eyeProtectionFaceCalculator"];
  outputImage_modifyBlurmapKernel = (uint64_t)+[CIKernel SDOFV2MetalKernelNamed:@"_modifyBlurmap"];
  id result = +[CIColorKernel SDOFV2MetalKernelNamed:@"_combineAllDeltas"];
  outputImage_combineAllDeltasKernel = (uint64_t)result;
  return result;
}

double __30__CIModifyBlurmap_outputImage__block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __30__CIModifyBlurmap_outputImage__block_invoke_3(uint64_t a1, int a2)
{
  if (a2 == 1) {
    return *(double *)(a1 + 32);
  }
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputPersonAlpha
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputPersonAlpha:(id)a3
{
}

- (CIImage)inputHairAlpha
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputHairAlpha:(id)a3
{
}

- (CIImage)inputFaceMaskDeltaImage
{
  return (CIImage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputFaceMaskDeltaImage:(id)a3
{
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputDistanceAdd
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputDistanceAdd:(id)a3
{
}

- (NSNumber)inputSmoothstepMin
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputSmoothstepMin:(id)a3
{
}

- (NSNumber)inputSmoothstepMax
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputSmoothstepMax:(id)a3
{
}

- (NSNumber)inputMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputMaxBlur:(id)a3
{
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputApertureScaling:(id)a3
{
}

- (NSNumber)inputRelativeApertureScalingStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInputRelativeApertureScalingStrength:(id)a3
{
}

- (NSNumber)inputPersonDistance
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setInputPersonDistance:(id)a3
{
}

- (NSNumber)inputPersonThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setInputPersonThreshold:(id)a3
{
}

- (CIVector)inputPersonAdditive
{
  return (CIVector *)objc_getProperty(self, a2, 184, 1);
}

- (void)setInputPersonAdditive:(id)a3
{
}

- (CIVector)inputPersonSubtractive
{
  return (CIVector *)objc_getProperty(self, a2, 192, 1);
}

- (void)setInputPersonSubtractive:(id)a3
{
}

- (NSNumber)inputPersonMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setInputPersonMaxBlur:(id)a3
{
}

- (NSNumber)inputHairDistance
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setInputHairDistance:(id)a3
{
}

- (NSNumber)inputHairThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setInputHairThreshold:(id)a3
{
}

- (CIVector)inputHairAdditive
{
  return (CIVector *)objc_getProperty(self, a2, 224, 1);
}

- (void)setInputHairAdditive:(id)a3
{
}

- (CIVector)inputHairSubtractive
{
  return (CIVector *)objc_getProperty(self, a2, 232, 1);
}

- (void)setInputHairSubtractive:(id)a3
{
}

- (NSNumber)inputHairMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setInputHairMaxBlur:(id)a3
{
}

- (NSNumber)inputProtectBodyStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setInputProtectBodyStrength:(id)a3
{
}

- (CIVector)inputLeftEyeX
{
  return (CIVector *)objc_getProperty(self, a2, 256, 1);
}

- (void)setInputLeftEyeX:(id)a3
{
}

- (CIVector)inputLeftEyeY
{
  return (CIVector *)objc_getProperty(self, a2, 264, 1);
}

- (void)setInputLeftEyeY:(id)a3
{
}

- (CIVector)inputRightEyeX
{
  return (CIVector *)objc_getProperty(self, a2, 272, 1);
}

- (void)setInputRightEyeX:(id)a3
{
}

- (CIVector)inputRightEyeY
{
  return (CIVector *)objc_getProperty(self, a2, 280, 1);
}

- (void)setInputRightEyeY:(id)a3
{
}

- (CIVector)inputFaceMidPointX
{
  return (CIVector *)objc_getProperty(self, a2, 288, 1);
}

- (void)setInputFaceMidPointX:(id)a3
{
}

- (CIVector)inputFaceMidPointY
{
  return (CIVector *)objc_getProperty(self, a2, 296, 1);
}

- (void)setInputFaceMidPointY:(id)a3
{
}

- (NSNumber)inputEyeProtectionMaxFaces
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setInputEyeProtectionMaxFaces:(id)a3
{
}

- (NSNumber)inputEyeProtectionFaceWeightsSmoothStepMin
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setInputEyeProtectionFaceWeightsSmoothStepMin:(id)a3
{
}

- (NSNumber)inputEyeProtectionFaceWeightsSmoothStepMax
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setInputEyeProtectionFaceWeightsSmoothStepMax:(id)a3
{
}

- (NSNumber)inputEyeProtectionOvalDimsDistanceScale
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setInputEyeProtectionOvalDimsDistanceScale:(id)a3
{
}

- (NSNumber)inputEyeProtectionOvalDimsDistanceOffset
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setInputEyeProtectionOvalDimsDistanceOffset:(id)a3
{
}

- (NSNumber)inputEyeProtectionOvalDimsRadiusHorizontal
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setInputEyeProtectionOvalDimsRadiusHorizontal:(id)a3
{
}

- (NSNumber)inputEyeProtectionOvalDimsRadiusVertical
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setInputEyeProtectionOvalDimsRadiusVertical:(id)a3
{
}

- (NSNumber)inputEyeProtectionOvalFallOffSmoothStepMin
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setInputEyeProtectionOvalFallOffSmoothStepMin:(id)a3
{
}

- (NSNumber)inputEyeProtectionOvalFallOffSmoothStepMax
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setInputEyeProtectionOvalFallOffSmoothStepMax:(id)a3
{
}

- (NSNumber)inputEyeProtectionPersonMaskSmoothStepMin
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setInputEyeProtectionPersonMaskSmoothStepMin:(id)a3
{
}

- (NSNumber)inputEyeProtectionPersonMaskSmoothStepMax
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setInputEyeProtectionPersonMaskSmoothStepMax:(id)a3
{
}

- (NSNumber)inputEyeProtectionPreventStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setInputEyeProtectionPreventStrength:(id)a3
{
}

- (NSNumber)inputEyeProtectionSubtractiveMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setInputEyeProtectionSubtractiveMaxBlur:(id)a3
{
}

- (NSNumber)inputEyeProtectionSubtractiveApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setInputEyeProtectionSubtractiveApertureScaling:(id)a3
{
}

- (void)outputImage
{
}

@end