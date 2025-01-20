@interface CISmartToneFilter
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSData)inputLightMap;
- (NSNumber)inputBlack;
- (NSNumber)inputBrightness;
- (NSNumber)inputContrast;
- (NSNumber)inputExposure;
- (NSNumber)inputHighlights;
- (NSNumber)inputLocalLight;
- (NSNumber)inputRawHighlights;
- (NSNumber)inputShadows;
- (NSNumber)inputUseCube;
- (id)_kernelBneg;
- (id)_kernelBpos;
- (id)_kernelC;
- (id)_kernelH;
- (id)_kernelRH;
- (id)inputUseCubeColorSpace;
- (id)outputImage;
- (void)dealloc;
- (void)setInputBlack:(id)a3;
- (void)setInputBrightness:(id)a3;
- (void)setInputContrast:(id)a3;
- (void)setInputExposure:(id)a3;
- (void)setInputHighlights:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLightMap:(id)a3;
- (void)setInputLocalLight:(id)a3;
- (void)setInputRawHighlights:(id)a3;
- (void)setInputShadows:(id)a3;
- (void)setInputUseCube:(id)a3;
- (void)setInputUseCubeColorSpace:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation CISmartToneFilter

+ (id)customAttributes
{
  v24[11] = *MEMORY[0x1E4F143B8];
  v23[0] = @"CIAttributeFilterCategories";
  v22[0] = @"CICategoryStylize";
  v22[1] = @"CICategoryVideo";
  v22[2] = @"CICategoryStillImage";
  v22[3] = @"CICategoryBuiltIn";
  v22[4] = @"CICategoryApplePrivate";
  v24[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
  v23[1] = @"inputExposure";
  v20[0] = @"CIAttributeMin";
  v20[1] = @"CIAttributeSliderMin";
  v21[0] = &unk_1EE4A9C10;
  v21[1] = &unk_1EE4A9C20;
  v20[2] = @"CIAttributeSliderMax";
  v20[3] = @"CIAttributeMax";
  v21[2] = &unk_1EE4A9C30;
  v21[3] = &unk_1EE4A9C40;
  v20[4] = @"CIAttributeDefault";
  v20[5] = @"CIAttributeIdentity";
  v21[4] = &unk_1EE4A9C50;
  v21[5] = &unk_1EE4A9C50;
  v20[6] = @"CIAttributeType";
  v21[6] = @"CIAttributeTypeScalar";
  v24[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
  v23[2] = @"inputContrast";
  v18[0] = @"CIAttributeMin";
  v18[1] = @"CIAttributeSliderMin";
  v19[0] = &unk_1EE4A9C10;
  v19[1] = &unk_1EE4A9C20;
  v18[2] = @"CIAttributeSliderMax";
  v18[3] = @"CIAttributeMax";
  v19[2] = &unk_1EE4A9C30;
  v19[3] = &unk_1EE4A9C40;
  v18[4] = @"CIAttributeDefault";
  v18[5] = @"CIAttributeIdentity";
  v19[4] = &unk_1EE4A9C50;
  v19[5] = &unk_1EE4A9C50;
  v18[6] = @"CIAttributeType";
  v19[6] = @"CIAttributeTypeScalar";
  v24[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];
  v23[3] = @"inputBrightness";
  v16[0] = @"CIAttributeMin";
  v16[1] = @"CIAttributeSliderMin";
  v17[0] = &unk_1EE4A9C10;
  v17[1] = &unk_1EE4A9C20;
  v16[2] = @"CIAttributeSliderMax";
  v16[3] = @"CIAttributeMax";
  v17[2] = &unk_1EE4A9C30;
  v17[3] = &unk_1EE4A9C40;
  v16[4] = @"CIAttributeDefault";
  v16[5] = @"CIAttributeIdentity";
  v17[4] = &unk_1EE4A9C50;
  v17[5] = &unk_1EE4A9C50;
  v16[6] = @"CIAttributeType";
  v17[6] = @"CIAttributeTypeScalar";
  v24[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:7];
  v23[4] = @"inputShadows";
  v14[0] = @"CIAttributeMin";
  v14[1] = @"CIAttributeSliderMin";
  v15[0] = &unk_1EE4A9C10;
  v15[1] = &unk_1EE4A9C20;
  v14[2] = @"CIAttributeSliderMax";
  v14[3] = @"CIAttributeMax";
  v15[2] = &unk_1EE4A9C30;
  v15[3] = &unk_1EE4A9C40;
  v14[4] = @"CIAttributeDefault";
  v14[5] = @"CIAttributeIdentity";
  v15[4] = &unk_1EE4A9C50;
  v15[5] = &unk_1EE4A9C50;
  v14[6] = @"CIAttributeType";
  v15[6] = @"CIAttributeTypeScalar";
  v24[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:7];
  v23[5] = @"inputHighlights";
  v12[0] = @"CIAttributeMin";
  v12[1] = @"CIAttributeSliderMin";
  v13[0] = &unk_1EE4A9C10;
  v13[1] = &unk_1EE4A9C20;
  v12[2] = @"CIAttributeSliderMax";
  v12[3] = @"CIAttributeMax";
  v13[2] = &unk_1EE4A9C30;
  v13[3] = &unk_1EE4A9C40;
  v12[4] = @"CIAttributeDefault";
  v12[5] = @"CIAttributeIdentity";
  v13[4] = &unk_1EE4A9C50;
  v13[5] = &unk_1EE4A9C50;
  v12[6] = @"CIAttributeType";
  v13[6] = @"CIAttributeTypeScalar";
  v24[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
  v23[6] = @"inputBlack";
  v10[0] = @"CIAttributeMin";
  v10[1] = @"CIAttributeSliderMin";
  v11[0] = &unk_1EE4A9C10;
  v11[1] = &unk_1EE4A9C20;
  v10[2] = @"CIAttributeSliderMax";
  v10[3] = @"CIAttributeMax";
  v11[2] = &unk_1EE4A9C30;
  v11[3] = &unk_1EE4A9C40;
  v10[4] = @"CIAttributeDefault";
  v10[5] = @"CIAttributeIdentity";
  v11[4] = &unk_1EE4A9C50;
  v11[5] = &unk_1EE4A9C50;
  v10[6] = @"CIAttributeType";
  v11[6] = @"CIAttributeTypeScalar";
  v24[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:7];
  v23[7] = @"inputRawHighlights";
  v8[0] = @"CIAttributeMin";
  v8[1] = @"CIAttributeSliderMin";
  v9[0] = &unk_1EE4A9C50;
  v9[1] = &unk_1EE4A9C50;
  v8[2] = @"CIAttributeSliderMax";
  v8[3] = @"CIAttributeMax";
  v9[2] = &unk_1EE4A9C30;
  v9[3] = &unk_1EE4A9C30;
  v8[4] = @"CIAttributeDefault";
  v8[5] = @"CIAttributeIdentity";
  v9[4] = &unk_1EE4A9C50;
  v9[5] = &unk_1EE4A9C50;
  v8[6] = @"CIAttributeType";
  v9[6] = @"CIAttributeTypeScalar";
  v24[7] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:7];
  v23[8] = @"inputLocalLight";
  v6[0] = @"CIAttributeMin";
  v6[1] = @"CIAttributeSliderMin";
  v7[0] = &unk_1EE4A9C20;
  v7[1] = &unk_1EE4A9C20;
  v6[2] = @"CIAttributeSliderMax";
  v6[3] = @"CIAttributeMax";
  v7[2] = &unk_1EE4A9C30;
  v7[3] = &unk_1EE4A9C40;
  v6[4] = @"CIAttributeDefault";
  v6[5] = @"CIAttributeIdentity";
  v7[4] = &unk_1EE4A9C50;
  v7[5] = &unk_1EE4A9C50;
  v6[6] = @"CIAttributeType";
  v7[6] = @"CIAttributeTypeScalar";
  v24[8] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:7];
  v23[9] = @"inputUseCube";
  v4[0] = @"CIAttributeMin";
  v4[1] = @"CIAttributeMax";
  v5[0] = &unk_1EE4AAEF8;
  v5[1] = &unk_1EE4AAF10;
  v4[2] = @"CIAttributeDefault";
  v4[3] = @"CIAttributeType";
  v5[2] = &unk_1EE4AAEF8;
  v5[3] = @"CIAttributeTypeInteger";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  v23[10] = @"inputUseCubeColorSpace";
  v24[9] = v2;
  v24[10] = MEMORY[0x1E4F1CC08];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:11];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputExposure doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputContrast doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputBrightness doubleValue];
  double v8 = v7;
  [(NSNumber *)self->inputShadows doubleValue];
  double v10 = v9;
  [(NSNumber *)self->inputHighlights doubleValue];
  double v12 = v11;
  [(NSNumber *)self->inputBlack doubleValue];
  double v14 = v13;
  [(NSNumber *)self->inputRawHighlights doubleValue];
  BOOL result = 0;
  if (fabs(v4) < 1.0e-10
    && fabs(v6) < 1.0e-10
    && fabs(v8) < 1.0e-10
    && fabs(v10) < 1.0e-10
    && fabs(v12) < 1.0e-10
    && fabs(v14) < 1.0e-10)
  {
    return fabs(v15) < 1.0e-10;
  }
  return result;
}

- (void)dealloc
{
  self->_cubeImage = 0;
  self->_cubeData = 0;
  v3.receiver = self;
  v3.super_class = (Class)CISmartToneFilter;
  [(CIFilter *)&v3 dealloc];
}

- (id)_kernelBneg
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smarttone_brightness_neg];
}

- (id)_kernelBpos
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smarttone_brightness_pos];
}

- (id)_kernelC
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smarttone_contrast];
}

- (id)_kernelH
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smarttone_highlightcontrast];
}

- (id)_kernelRH
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_rawHighlights];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  char v7 = [a4 isEqualToString:@"inputImage"];

  self->_cubeImage = 0;
  if ((v7 & 1) == 0)
  {

    self->_cubeData = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CISmartToneFilter;
  [(CISmartToneFilter *)&v8 setValue:a3 forKey:a4];
}

- (id)outputImage
{
  v120[1] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if (![(CISmartToneFilter *)self _isIdentity])
  {
    LODWORD(v6) = [(NSNumber *)[(CISmartToneFilter *)self inputUseCube] intValue];
    if (CI_SMART_TONE_USE_CUBE(void)::didCheck != -1) {
      dispatch_once(&CI_SMART_TONE_USE_CUBE(void)::didCheck, &__block_literal_global_63);
    }
    if ((CI_SMART_TONE_USE_CUBE(void)::v & 0x80000000) == 0 && (v6 & 0x80000000) == 0) {
      LODWORD(v6) = CI_SMART_TONE_USE_CUBE(void)::v;
    }
    if ((int)v6 < 1)
    {
      [(NSNumber *)self->inputExposure doubleValue];
      double v10 = 2.0;
      double v11 = fmin(fmax(v9, -2.0), 2.0);
      [(NSNumber *)self->inputContrast doubleValue];
      double v101 = v12;
      [(NSNumber *)self->inputBrightness doubleValue];
      double v14 = fmax(v13, -2.0);
      [(NSNumber *)self->inputShadows doubleValue];
      double v16 = v15;
      [(NSNumber *)self->inputHighlights doubleValue];
      double v18 = v17;
      [(NSNumber *)self->inputBlack doubleValue];
      double v20 = fmax(v19, -2.0);
      [(NSNumber *)self->inputRawHighlights doubleValue];
      double v22 = fmax(v21, 0.0);
      inputImage = self->inputImage;
      double v99 = fmin(v22, 2.0);
      double v103 = v22;
      double v104 = fabs(v99);
      if (v104 >= 1.0e-10)
      {
        float v23 = fmin(v22, 0.8);
        float v24 = 1.0 - v23;
        float v25 = (1.0 - v24) * 0.333333343;
        v116[0] = @"inputRVector";
        double v26 = (float)(v24 + v25);
        double v27 = v25;
        v117[0] = +[CIVector vectorWithX:v26 Y:v27 Z:v27 W:0.0];
        v116[1] = @"inputGVector";
        v117[1] = +[CIVector vectorWithX:v27 Y:v26 Z:v27 W:0.0];
        v116[2] = @"inputBVector";
        double v28 = v26;
        double v10 = 2.0;
        v117[2] = +[CIVector vectorWithX:v27 Y:v27 Z:v28 W:0.0];
        v116[3] = @"inputAVector";
        v117[3] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
        v116[4] = @"inputBiasVector";
        v117[4] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
        inputImage = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:5]);
      }
      double v29 = fmax(v16, -2.0);
      double v30 = fmin(v20, v10);
      double v31 = fmin(v14, v10);
      if (fabs(v11) >= 1.0e-10 || fabs(v30) >= 1.0e-10)
      {
        long double v36 = 1.0 / (1.0 / exp2(v11 + v11) - v30 / 20.0);
        v114[0] = @"inputRVector";
        v115[0] = +[CIVector vectorWithX:(double)v36 Y:0.0 Z:0.0 W:0.0];
        v114[1] = @"inputGVector";
        v115[1] = +[CIVector vectorWithX:0.0 Y:(double)v36 Z:0.0 W:0.0];
        v114[2] = @"inputBVector";
        v115[2] = +[CIVector vectorWithX:0.0 Y:0.0 Z:(double)v36 W:0.0];
        v114[3] = @"inputAVector";
        v115[3] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
        v114[4] = @"inputBiasVector";
        double v10 = 2.0;
        v115[4] = +[CIVector vectorWithX:(double)-(v30 / 20.0 * v36) Y:(double)-(v30 / 20.0 * v36) Z:(double)-(v30 / 20.0 * v36) W:0.0];
        inputImage = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:5]);
      }
      double v37 = fmax(v18, -2.0);
      double v38 = fmin(v29, v10);
      if (fabs(v31) >= 1.0e-10)
      {
        v39 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
        if (v31 >= 0.0)
        {
          id v40 = [(CISmartToneFilter *)self _kernelBpos];
          [(CIImage *)v39 extent];
          double v42 = v50;
          double v44 = v51;
          double v46 = v52;
          double v48 = v53;
          v112[0] = v39;
          v112[1] = [NSNumber numberWithDouble:v31 * 2.0 + 1.0];
          v49 = v112;
        }
        else
        {
          id v40 = [(CISmartToneFilter *)self _kernelBneg];
          [(CIImage *)v39 extent];
          double v42 = v41;
          double v44 = v43;
          double v46 = v45;
          double v48 = v47;
          v113[0] = v39;
          v113[1] = [NSNumber numberWithDouble:v31 * -1.5 + 1.0];
          v49 = v113;
        }
        inputImage = (CIImage *)objc_msgSend((id)objc_msgSend(v40, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v49, 2), v42, v44, v46, v48), "imageByPremultiplyingAlpha");
        double v10 = 2.0;
      }
      double v54 = fmax(v101, -2.0);
      double v55 = fmin(v37, v10);
      if (fabs(v38) >= 1.0e-10)
      {
        v110[0] = @"inputShadowAmount";
        v111[0] = [NSNumber numberWithDouble:v38];
        v111[1] = &unk_1EE4A9C30;
        v110[1] = @"inputHighlightAmount";
        v110[2] = @"inputRadius";
        v111[2] = &unk_1EE4A9C50;
        inputImage = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIHighlightShadowAdjust", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v110 count:3]);
      }
      double v56 = fmin(v54, v10);
      double v57 = fabs(v55);
      if (v57 >= 1.0e-10)
      {
        long double v58 = exp(v55 * v55 / -0.75);
        double v59 = v58 * -0.45 + 1.45;
        double v60 = v58 * 0.45 + 0.55;
        if (v55 <= 0.0) {
          double v61 = v60;
        }
        else {
          double v61 = v59;
        }
        double v62 = (v57 + -0.6) * 2.0 + 0.2;
        if (v57 < 0.6) {
          double v62 = 0.2;
        }
        double v102 = v62;
        v63 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
        double v64 = v104;
        if (v104 >= 1.0e-10)
        {
          if (v61 < v99) {
            double v61 = v99;
          }
          id v65 = [(CISmartToneFilter *)self _kernelRH];
          [(CIImage *)v63 extent];
          double v100 = v66;
          double v98 = v67;
          double v69 = v68;
          double v71 = v70;
          v109[0] = v63;
          v109[1] = [NSNumber numberWithDouble:v61];
          v63 = (CIImage *)objc_msgSend(v65, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v109, 2), v100, v98, v69, v71);
          if (v55 <= 0.0)
          {
            double v64 = exp(v55 * (v55 * -0.4245) / 0.75);
            double v61 = v64 * 0.45 + 0.55;
          }
          else
          {
            double v64 = exp(v55 * (v55 * -0.4225) / 0.75);
            double v61 = v64 * -0.45 + 1.45;
          }
        }
        id v74 = [(CISmartToneFilter *)self _kernelH];
        [(CIImage *)v63 extent];
        double v76 = v75;
        double v78 = v77;
        double v80 = v79;
        double v82 = v81;
        v108[0] = v63;
        v108[1] = [NSNumber numberWithDouble:v61];
        v108[2] = [NSNumber numberWithDouble:v102];
        inputImage = (CIImage *)objc_msgSend((id)objc_msgSend(v74, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v108, 3), v76, v78, v80, v82), "imageByPremultiplyingAlpha");
      }
      if (fabs(v56) >= 1.0e-10)
      {
        v83 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
        id v84 = [(CISmartToneFilter *)self _kernelC];
        [(CIImage *)v83 extent];
        double v86 = v85;
        double v88 = v87;
        double v90 = v89;
        double v92 = v91;
        v107[0] = v83;
        v107[1] = [NSNumber numberWithDouble:v56 * 3.4];
        inputImage = (CIImage *)objc_msgSend((id)objc_msgSend(v84, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v107, 2), v86, v88, v90, v92), "imageByPremultiplyingAlpha");
      }
      if (v104 >= 1.0e-10)
      {
        float v93 = fmin(v103, 0.8);
        float v94 = 1.0 / (1.0 - v93);
        float v95 = (1.0 - v94) * 0.333333343;
        v105[0] = @"inputRVector";
        double v96 = (float)(v94 + v95);
        double v97 = v95;
        v106[0] = +[CIVector vectorWithX:v96 Y:v97 Z:v97 W:0.0];
        v105[1] = @"inputGVector";
        v106[1] = +[CIVector vectorWithX:v97 Y:v96 Z:v97 W:0.0];
        v105[2] = @"inputBVector";
        v106[2] = +[CIVector vectorWithX:v97 Y:v97 Z:v96 W:0.0];
        v105[3] = @"inputAVector";
        v106[3] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
        v105[4] = @"inputBiasVector";
        v106[4] = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
        return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIColorMatrix", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:5]);
      }
    }
    else
    {
      if (v6 > 0x20 || v6 == 1) {
        uint64_t v6 = 32;
      }
      else {
        uint64_t v6 = v6;
      }
      cubeImage = self->_cubeImage;
      if (cubeImage) {
        goto LABEL_19;
      }
      if (!self->_cubeData)
      {
        v32 = (void *)[(CISmartToneFilter *)self copy];
        [v32 setValue:&unk_1EE4AAF28 forKey:@"inputUseCube"];
        v119 = @"working_format";
        v120[0] = [NSNumber numberWithInt:2056];
        id v33 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", @"CISmartToneFilter-cubeContext", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:&v119 count:1]);
        v118 = v32;
        self->_cubeData = (NSData *)(id)objc_msgSend(v33, "createColorCubeDataForFilters:dimension:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v118, 1), v6);
      }
      v34 = [(CISmartToneFilter *)self inputUseCubeColorSpace];
      if (v34) {
        CGColorSpaceRef DeviceRGB = CGColorSpaceRetain(v34);
      }
      else {
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      }
      v72 = DeviceRGB;
      v73 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIColorCubeWithColorSpace", @"inputImage", self->inputImage, @"inputCubeData", self->_cubeData, @"inputColorSpace", DeviceRGB, @"inputCubeDimension", [NSNumber numberWithInt:v6], 0);
      CGColorSpaceRelease(v72);
      inputImage = [(CIFilter *)v73 outputImage];
      self->_cubeImage = inputImage;
    }
    return inputImage;
  }
  cubeImage = self->inputImage;
LABEL_19:
  objc_super v8 = cubeImage;

  return v8;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputExposure
{
  return self->inputExposure;
}

- (void)setInputExposure:(id)a3
{
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
}

- (NSNumber)inputBrightness
{
  return self->inputBrightness;
}

- (void)setInputBrightness:(id)a3
{
}

- (NSNumber)inputShadows
{
  return self->inputShadows;
}

- (void)setInputShadows:(id)a3
{
}

- (NSNumber)inputHighlights
{
  return self->inputHighlights;
}

- (void)setInputHighlights:(id)a3
{
}

- (NSNumber)inputBlack
{
  return self->inputBlack;
}

- (void)setInputBlack:(id)a3
{
}

- (NSNumber)inputRawHighlights
{
  return self->inputRawHighlights;
}

- (void)setInputRawHighlights:(id)a3
{
}

- (NSNumber)inputLocalLight
{
  return self->inputLocalLight;
}

- (void)setInputLocalLight:(id)a3
{
}

- (NSData)inputLightMap
{
  return self->_inputLightMap;
}

- (void)setInputLightMap:(id)a3
{
}

- (NSNumber)inputUseCube
{
  return self->inputUseCube;
}

- (void)setInputUseCube:(id)a3
{
}

- (id)inputUseCubeColorSpace
{
  return self->inputUseCubeColorSpace;
}

- (void)setInputUseCubeColorSpace:(id)a3
{
}

@end