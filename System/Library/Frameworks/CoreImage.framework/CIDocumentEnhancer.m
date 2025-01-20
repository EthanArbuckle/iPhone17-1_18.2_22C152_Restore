@interface CIDocumentEnhancer
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputAmount;
- (id)outputImage;
- (void)setInputAmount:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIDocumentEnhancer

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorEffect";
  v5[1] = @"CICategoryNonSquarePixels";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"13";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.15";
  v6[3] = @"inputAmount";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A85D0;
  v4[1] = &unk_1EE4A85D0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4A85E0;
  v4[3] = &unk_1EE4A85F0;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8600;
  v4[5] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)outputImage
{
  v181[1] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  inputAmount = self->inputAmount;
  if (!inputAmount) {
    return self->inputImage;
  }
  double v8 = v3;
  double v9 = v4;
  double v10 = v5;
  double v11 = v6;
  [(NSNumber *)inputAmount floatValue];
  if (v12 < 0.0001) {
    return self->inputImage;
  }
  v182.origin.x = v8;
  v182.origin.y = v9;
  v182.size.width = v10;
  v182.size.height = v11;
  if (CGRectIsNull(v182)) {
    return self->inputImage;
  }
  v183.origin.x = v8;
  v183.origin.y = v9;
  v183.size.width = v10;
  v183.size.height = v11;
  if (CGRectIsInfinite(v183)) {
    return self->inputImage;
  }
  inputImage = self->inputImage;
  CGAffineTransformMakeTranslation(&v158, -v8, -v9);
  v154 = -[CIImage imageByCroppingToRect:]([(CIImage *)inputImage imageByApplyingTransform:&v158], "imageByCroppingToRect:", 0.0, 0.0, v10, v11);
  [(NSNumber *)self->inputAmount floatValue];
  float v16 = fmax(v15, 0.0001) * 0.8;
  [(CIImage *)self->inputImage extent];
  double v18 = v17;
  [(CIImage *)self->inputImage extent];
  double v20 = v19;
  [(CIImage *)self->inputImage extent];
  if (v18 >= v20) {
    double v23 = v22;
  }
  else {
    double v23 = v21;
  }
  double v24 = 512.0;
  if (v23 <= 512.0)
  {
    [(CIImage *)self->inputImage extent];
    double v26 = v25;
    [(CIImage *)self->inputImage extent];
    double v28 = v27;
    [(CIImage *)self->inputImage extent];
    if (v26 >= v28) {
      double v24 = v29;
    }
  }
  int v30 = (int)v24;
  double v31 = (double)(int)v24;
  double v32 = floor(log2(v31) * 0.75);
  if (v32 <= 0.0) {
    double v32 = 0.0;
  }
  LODWORD(v144) = (int)v32;
  double v33 = (float)((float)v30 * 1.4142);
  if (v33 * 0.04 >= 1.0) {
    double v34 = v33 * 0.04;
  }
  else {
    double v34 = 1.0;
  }
  double v35 = v33 * 0.004;
  if (v35 < 1.0) {
    double v35 = 1.0;
  }
  double v151 = v35;
  double v36 = v16;
  if (v16 <= 1.0001)
  {
    if (v36 >= 0.9999)
    {
      float v149 = 0.25;
      float v147 = 3.0;
      float v148 = 0.15;
      float v37 = 0.054;
    }
    else
    {
      float v38 = log2(v36 * 10000.0 + 1.0) / -13.2878566 + 1.0;
      float v39 = v38 * 6.75 + 0.25;
      float v149 = v39;
      float v40 = v38 * 0.849999994 + 0.150000006;
      float v147 = 3.0 - (float)(v38 * 3.0);
      float v148 = v40;
      float v37 = 0.054 - (float)(v38 * 0.054);
    }
  }
  else
  {
    float v149 = 0.25 - (float)((float)(v16 + -1.0) * 0.25);
    float v147 = (float)((float)((float)(v16 + -1.0) * 3.0) * 3.0) + 3.0;
    float v148 = 0.15 - (float)((float)(v16 + -1.0) * 0.15);
    float v37 = (float)(v16 + -1.0) * 0.945999999 + 0.0540000014;
  }
  *((float *)&v144 + 1) = v37;
  float v41 = v34;
  float v150 = v41;
  v42 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CElumaToR, v144);
  [(CIImage *)v154 extent];
  v179 = v154;
  v47 = -[CIColorKernel applyWithExtent:arguments:](v42, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v179 count:1], v43, v44, v45, v46);
  v177 = @"inputExtent";
  [(CIImage *)v47 extent];
  v178 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  CGFloat v48 = COERCE_DOUBLE((uint64_t)-[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v47, "imageByApplyingFilter:withInputParameters:", @"CIAreaMinMaxRed", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v178 forKeys:&v177 count:1]), "imageByClampingToExtent"));
  v49 = +[CIKernel kernelWithInternalRepresentation:&CI::_DEcomputeInversionMask];
  double v50 = *MEMORY[0x1E4F1DB10];
  double v51 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
  double v52 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v53 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  *(void *)&v174.a = v154;
  v174.b = v48;
  LODWORD(v54) = 3.0;
  *(void *)&v174.c = [NSNumber numberWithFloat:v54];
  LODWORD(v55) = 1000593162;
  *(void *)&v174.d = [NSNumber numberWithFloat:v55];
  v56 = -[CIColorKernel applyWithExtent:arguments:](v49, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v174 count:4], v50, v51, v52, v53);
  v175 = @"inputExtent";
  [(CIImage *)v154 extent];
  v176 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v153 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v56, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1]), "imageByClampingToExtent");
  memset(&v174, 0, sizeof(v174));
  CGAffineTransformMakeScale(&v174, v31 / v10, v31 / v11);
  CGAffineTransform v157 = v174;
  v57 = [(CIImage *)v154 imageByApplyingTransform:&v157];
  v58 = +[CIKernel kernelWithInternalRepresentation:&CI::_DEmax4];
  v59 = v57;
  if (v145 >= 1)
  {
    v60 = v58;
    unsigned int v61 = v145 + 1;
    v59 = v57;
    do
    {
      [(CIImage *)v59 extent];
      double v63 = v62;
      double v65 = v64;
      double v67 = ceil(v66 * 0.5);
      double v69 = ceil(v68 * 0.5);
      *(void *)&v168.a = v59;
      [(CIImage *)v59 extent];
      double v71 = v70;
      [(CIImage *)v59 extent];
      *(void *)&v168.b = +[CIVector vectorWithX:v71 Y:v72];
      v59 = -[CIKernel applyWithExtent:roiCallback:arguments:](v60, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_19, [MEMORY[0x1E4F1C978] arrayWithObjects:&v168 count:2], v63, v65, v67, v69);
      --v61;
    }
    while (v61 > 1);
  }
  int v152 = (int)v151;
  v172 = @"inputExtent";
  [(CIImage *)v59 extent];
  v173 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  uint64_t v73 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v59, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1]), "imageByClampingToExtent");
  [(CIImage *)v57 extent];
  v74 = resample(v59, v184);
  v75 = +[CIVector vectorWithX:v149 Y:v147 Z:v148 W:v146];
  v76 = +[CIKernel kernelWithInternalRepresentation:&CI::_DEcreateForegroundMask];
  [(CIImage *)v57 extent];
  v171[0] = v57;
  v171[1] = v74;
  v171[2] = v73;
  v171[3] = v75;
  v81 = -[CIColorKernel applyWithExtent:arguments:](v76, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:4], v77, v78, v79, v80);
  [(CIImage *)v81 extent];
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  double v89 = v88;
  v90 = normalizedBlur(v81, 15.0);
  v91 = normalizedBlur(v81, 45.0);
  v92 = normalizedBlur(v81, 135.0);
  v93 = -[CIImage imageByCroppingToRect:]([(CIImage *)v90 imageByCompositingOverImage:[(CIImage *)v91 imageByCompositingOverImage:[(CIImage *)v92 imageByCompositingOverImage:[(CIImage *)normalizedBlur(v81, 200.0) imageByCompositingOverImage:+[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor whiteColor](CIColor, "whiteColor"))]]]], "imageByCroppingToRect:", v83, v85,
          v87,
          v89);
  *(float *)&double v94 = v150;
  if (v150 > 0.0)
  {
    v170[0] = v57;
    v169[0] = @"inputSource";
    v169[1] = @"inputSigmaSpace";
    uint64_t v95 = [NSNumber numberWithFloat:v94];
    v169[2] = @"inputSigmaRange";
    v170[1] = v95;
    v170[2] = &unk_1EE4AB550;
    v93 = -[CIImage imageByApplyingFilter:withInputParameters:](v93, "imageByApplyingFilter:withInputParameters:", @"CICheapBilateral", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v170 forKeys:v169 count:3]);
  }
  CGAffineTransformMakeScale(&v168, v10 / v31, v11 / v31);
  CGAffineTransform v174 = v168;
  CGAffineTransform v156 = v168;
  v96 = [(CIImage *)v93 imageByApplyingTransform:&v156];
  v97 = +[CIKernel kernelWithInternalRepresentation:&CI::_DEWash];
  v167[0] = v154;
  v167[1] = v96;
  v98 = -[CIColorKernel applyWithExtent:arguments:](v97, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v167 count:2], 0.0, 0.0, v10, v11);
  v99 = +[CIKernel kernelWithInternalRepresentation:&CI::_DE_compinv];
  [(CIImage *)v96 extent];
  *(void *)&v168.a = v96;
  v104 = -[CIColorKernel applyWithExtent:arguments:](v99, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v168 count:1], v100, v101, v102, v103);
  v180 = @"inputExtent";
  [(CIImage *)v96 extent];
  v181[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v105 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v104, "imageByApplyingFilter:withInputParameters:", @"CIAreaAverage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v181 forKeys:&v180 count:1]), "imageByClampingToExtent");
  v106 = self->inputImage;
  v165[0] = @"inputThreshold";
  v165[1] = @"inputSoftness";
  v166[0] = &unk_1EE4AB560;
  v166[1] = &unk_1EE4AB570;
  v165[2] = @"inputIntensity";
  v166[2] = &unk_1EE4AB580;
  v107 = -[CIImage imageByApplyingFilter:withInputParameters:](v106, "imageByApplyingFilter:withInputParameters:", @"CIDesaturateShadows", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v166 forKeys:v165 count:3]);
  [(CIImage *)v107 extent];
  CGFloat v109 = v108;
  [(CIImage *)v107 extent];
  CGAffineTransformMakeTranslation(&v155, v109, v110);
  v111 = [(CIImage *)v98 imageByApplyingTransform:&v155];
  [(CIImage *)v107 extent];
  v112 = conditionallyFilteredMaxThreshold(-[CIImage imageByCroppingToRect:](v111, "imageByCroppingToRect:"), v107, v105, 0.2);
  v163 = @"inputContrast";
  v164 = &unk_1EE4AB590;
  v113 = -[CIImage imageByApplyingFilter:withInputParameters:](v107, "imageByApplyingFilter:withInputParameters:", @"CIColorControls", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1]);
  v161[0] = @"inputContrast";
  v161[1] = @"inputBrightness";
  v162[0] = &unk_1EE4AB5A0;
  v162[1] = &unk_1EE4AB5B0;
  v161[2] = @"inputSaturation";
  v162[2] = &unk_1EE4AB5C0;
  v114 = -[CIImage imageByApplyingFilter:withInputParameters:](v107, "imageByApplyingFilter:withInputParameters:", @"CIColorControls", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v162 forKeys:v161 count:3]);
  v115 = conditionallyFilteredMaxThreshold(v112, v113, v105, 0.2);
  v116 = conditionallyFilteredMaxThreshold(v115, v114, v153, 0.18);
  v159[0] = @"inputThreshold";
  v159[1] = @"inputIntensity";
  v160[0] = &unk_1EE4AB560;
  v160[1] = &unk_1EE4AB580;
  v117 = -[CIImage imageByApplyingFilter:withInputParameters:](v116, "imageByApplyingFilter:withInputParameters:", @"CIDesaturateShadows", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v160 forKeys:v159 count:2]);
  v118 = [(CIImage *)v117 imageByApplyingGaussianBlurWithSigma:(double)v152];
  v119 = +[CIKernel kernelWithInternalRepresentation:&CI::_DE_sub];
  [(CIImage *)v117 extent];
  CGFloat v121 = v120;
  CGFloat v123 = v122;
  CGFloat v125 = v124;
  CGFloat v127 = v126;
  [(CIImage *)v118 extent];
  v188.origin.x = v128;
  v188.origin.y = v129;
  v188.size.width = v130;
  v188.size.height = v131;
  v185.origin.x = v121;
  v185.origin.y = v123;
  v185.size.width = v125;
  v185.size.height = v127;
  CGRect v186 = CGRectUnion(v185, v188);
  *(void *)&v168.a = v117;
  *(void *)&v168.b = v118;
  CGFloat v132 = COERCE_DOUBLE((uint64_t)-[CIColorKernel applyWithExtent:arguments:](v119, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v168 count:2], v186.origin.x, v186.origin.y, v186.size.width, v186.size.height));
  v133 = +[CIKernel kernelWithInternalRepresentation:&CI::_DE_scaleAdd];
  [(CIImage *)v117 extent];
  double v135 = v134;
  double v137 = v136;
  double v139 = v138;
  double v141 = v140;
  *(void *)&v168.a = v117;
  v168.b = v132;
  LODWORD(v134) = 1041865114;
  *(void *)&v168.c = [NSNumber numberWithFloat:v134];
  v142 = -[CIImage imageByApplyingFilter:withInputParameters:](-[CIColorKernel applyWithExtent:arguments:](v133, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v168 count:3], v135, v137, v139, v141), "imageByApplyingFilter:withInputParameters:", @"CIContrastEnhancer", &unk_1EE4AB130);
  [(CIImage *)v107 extent];
  v143 = -[CIImage imageByCroppingToRect:](v142, "imageByCroppingToRect:");
  [(CIImage *)v107 extent];
  return resample(v143, v187);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(id)a3
{
}

@end