@interface CIPortraitBlurV2
+ (id)customAttributes;
- (CIImage)inputBlurmapImage;
- (CIImage)inputImage;
- (CIImage)inputMatteImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputAperture;
- (NSNumber)inputDraftMode;
- (NSNumber)inputLumaNoiseScale;
- (NSNumber)inputScale;
- (NSString)inputShape;
- (double)effectiveScale;
- (id)outputImage;
- (id)sensorSize;
- (void)setInputAperture:(id)a3;
- (void)setInputBlurmapImage:(id)a3;
- (void)setInputDraftMode:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputLumaNoiseScale:(id)a3;
- (void)setInputMatteImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputShape:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CIPortraitBlurV2

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryColorAdjustment";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v11[4] = @"CICategoryApplePrivate";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v13[1] = @"12";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.14";
  v12[3] = @"inputLumaNoiseScale";
  v9[0] = @"CIAttributeSliderMin";
  v9[1] = @"CIAttributeSliderMax";
  v10[0] = &unk_1EE4A9860;
  v10[1] = &unk_1EE4A9880;
  v9[2] = @"CIAttributeMin";
  v9[3] = @"CIAttributeMax";
  v10[2] = &unk_1EE4A9860;
  v10[3] = &unk_1EE4A9880;
  v9[4] = @"CIAttributeDefault";
  v9[5] = @"CIAttributeType";
  v10[4] = &unk_1EE4A9890;
  v10[5] = @"CIAttributeTypeScalar";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v12[4] = @"inputAperture";
  v7[0] = @"CIAttributeSliderMin";
  v7[1] = @"CIAttributeSliderMax";
  v8[0] = &unk_1EE4A9830;
  v8[1] = &unk_1EE4A98A0;
  v7[2] = @"CIAttributeMin";
  v7[3] = @"CIAttributeMax";
  v8[2] = &unk_1EE4A9860;
  v8[3] = &unk_1EE4A98A0;
  v7[4] = @"CIAttributeDefault";
  v7[5] = @"CIAttributeType";
  v8[4] = &unk_1EE4A9860;
  v8[5] = @"CIAttributeTypeScalar";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  v12[5] = @"inputShape";
  v5 = @"CIAttributeClass";
  v6 = @"NSString";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v12[6] = @"inputDraftMode";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = @"CIAttributeTypeInteger";
  v4[1] = &unk_1EE4AACB8;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4AAD00;
  v4[3] = &unk_1EE4AACB8;
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)sensorSize
{
  if ([(NSDictionary *)self->inputTuningParameters objectForKeyedSubscript:@"SensorWidth"])
  {
    double v3 = (double)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->inputTuningParameters, "objectForKeyedSubscript:", @"SensorWidth"), "integerValue");
  }
  else
  {
    double v3 = 4032.0;
  }
  id v4 = [(NSDictionary *)self->inputTuningParameters objectForKeyedSubscript:@"SensorHeight"];
  double v5 = 3024.0;
  if (v4) {
    double v5 = (double)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->inputTuningParameters, "objectForKeyedSubscript:", @"SensorHeight"), "integerValue");
  }
  double v6 = 4032.0;
  if (v3 != 4224.0) {
    double v6 = v3;
  }
  if (v5 == 3168.0) {
    double v5 = 3024.0;
  }

  return +[CIVector vectorWithX:v6 Y:v5];
}

- (double)effectiveScale
{
  id v3 = [(CIPortraitBlurV2 *)self sensorSize];
  [(CIImage *)self->inputBlurmapImage extent];
  double v5 = v4;
  [v3 X];
  *(float *)&double v6 = v5 / (v6 * 0.5);
  return *(float *)&v6;
}

- (id)outputImage
{
  v95[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  inputBlurmapImage = self->inputBlurmapImage;
  [(NSNumber *)self->inputScale floatValue];
  float v6 = v5;
  [(CIImage *)self->inputBlurmapImage extent];
  double v8 = v7;
  [(CIImage *)self->inputImage extent];
  if (vabdd_f64(v8, v9) > 0.001)
  {
    [(CIImage *)self->inputBlurmapImage extent];
    double v11 = v10;
    [(CIImage *)self->inputImage extent];
    float v13 = v11 / v12;
    [(CIImage *)self->inputBlurmapImage extent];
    double v15 = v14;
    [(CIImage *)self->inputImage extent];
    float v17 = v15 / v16;
    [(CIImage *)self->inputImage extent];
    double v19 = v18;
    [(CIImage *)self->inputBlurmapImage extent];
    if (v19 <= v20)
    {
      v21 = self->inputBlurmapImage;
      CGAffineTransformMakeScale(&v82, 1.0 / v13, 1.0 / v17);
      inputBlurmapImage = [(CIImage *)v21 imageByApplyingTransform:&v82];
    }
    else
    {
      CGAffineTransformMakeScale(&v83, v13, v17);
      inputImage = [(CIImage *)inputImage imageByApplyingTransform:&v83];
    }
  }
  v94[0] = @"inputBlurmapImage";
  v94[1] = @"inputUseMetal";
  v95[0] = inputBlurmapImage;
  v95[1] = &unk_1EE4AAD18;
  v22 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", @"CIPortraitBlurPreProcess", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2]);
  uint64_t v23 = +[CIDepthBlurEffect getDraftMode:[(CIPortraitBlurV2 *)self inputDraftMode]];
  [(CIImage *)v22 extent];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  [(NSNumber *)self->inputAperture floatValue];
  float v33 = v32;
  SDOFSimpleLensModelValue(@"defaultSimulatedAperture", self->inputTuningParameters);
  double v35 = 1.0;
  if (v33 > 0.0 && v34 > 0.0) {
    double v35 = v34 / v33;
  }
  SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
  float v37 = v36;
  if (v29 <= v31) {
    double v38 = v31;
  }
  else {
    double v38 = v29;
  }
  double v79 = v38;
  v92[0] = @"inputScale";
  *(float *)&double v38 = v6;
  v93[0] = [NSNumber numberWithFloat:v38];
  v92[1] = @"inputApertureScaling";
  v93[1] = [NSNumber numberWithDouble:v35];
  v92[2] = @"inputDraftMode";
  uint64_t v39 = [NSNumber numberWithUnsignedInt:v23];
  v92[3] = @"inputTuningParameters";
  inputTuningParameters = self->inputTuningParameters;
  v93[2] = v39;
  v93[3] = inputTuningParameters;
  v41 = -[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", @"CIHighlightRecovery", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:4]);
  SDOFRenderingValue(&cfstr_Prefilterradiu.isa, self->inputTuningParameters);
  if (v42 > 0.0)
  {
    SDOFRenderingValue(&cfstr_Prefilterblurs.isa, self->inputTuningParameters);
    if (v43 > 0.0 && v23 != 1)
    {
      v90[0] = @"inputApertureScaling";
      uint64_t v44 = [NSNumber numberWithDouble:v35];
      v45 = self->inputTuningParameters;
      v91[0] = v44;
      v91[1] = v45;
      v90[1] = @"inputTuningParameters";
      v90[2] = @"inputScale";
      *(float *)&double v46 = v6;
      v91[2] = [NSNumber numberWithFloat:v46];
      v41 = -[CIImage imageByApplyingFilter:withInputParameters:](v41, "imageByApplyingFilter:withInputParameters:", @"CISparseRendererPreFiltering", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:3]);
    }
  }
  SDOFRenderingValue(&cfstr_Alphaepsilon.isa, self->inputTuningParameters);
  if (*(float *)&v47 == 1.0
    || (SDOFRenderingValue(&cfstr_Alphagain.isa, self->inputTuningParameters), *(float *)&v47 == 0.0)
    || (v74 = self->inputMatteImage) == 0
    || ([(CIImage *)v74 extent], v75 <= 1.0)
    || ([(CIImage *)self->inputImage extent], v76 <= 1.0))
  {
    inputMatteImage = 0;
  }
  else
  {
    inputMatteImage = self->inputMatteImage;
    [(CIImage *)inputMatteImage extent];
    v97.origin.x = v25;
    v97.origin.y = v27;
    v97.size.width = v29;
    v97.size.height = v31;
    if (!CGRectEqualToRect(v96, v97))
    {
      [(CIImage *)inputMatteImage extent];
      memset(&v81, 0, sizeof(v81));
      CGAffineTransformMakeScale(&v81, v29 / v77, v31 / v78);
      CGAffineTransform v80 = v81;
      inputMatteImage = [(CIImage *)inputMatteImage imageByApplyingTransform:&v80];
    }
  }
  v89[0] = v41;
  v88[0] = @"inputImage";
  v88[1] = @"inputScale";
  *(float *)&double v47 = v6;
  v89[1] = [NSNumber numberWithFloat:v47];
  v88[2] = @"inputApertureScaling";
  uint64_t v49 = [NSNumber numberWithDouble:v35];
  v50 = self->inputTuningParameters;
  v89[2] = v49;
  v89[3] = v50;
  v88[3] = @"inputTuningParameters";
  v88[4] = @"inputDraftMode";
  uint64_t v51 = [NSNumber numberWithUnsignedInt:v23];
  v88[5] = @"inputAperture";
  inputAperture = self->inputAperture;
  v89[4] = v51;
  v89[5] = inputAperture;
  v53 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CISparseRenderer", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:6]);
  v54 = v53;
  if (inputMatteImage) {
    [(CIFilter *)v53 setValue:inputMatteImage forKey:@"inputMatteImage"];
  }
  v55 = [(CIFilter *)v54 outputImage];
  SDOFRenderingValue(&cfstr_Antialiasblurs.isa, self->inputTuningParameters);
  float v57 = v56;
  [(NSNumber *)self->inputLumaNoiseScale floatValue];
  int v59 = v58;
  int v60 = nRingsFromTuningParameters(self->inputTuningParameters, v6, v23, self->inputAperture);
  if (v23 != 1)
  {
    int v61 = v60;
    float v62 = v79 * v37;
    [(CIPortraitBlurV2 *)self effectiveScale];
    float v64 = v63;
    v86[0] = @"inputMaxBlurInPixels";
    *(float *)&double v63 = (float)(v57 * v62) / (float)v61;
    v87[0] = [NSNumber numberWithFloat:v63];
    v86[1] = @"inputAntiAliasRadius";
    v65 = NSNumber;
    SDOFRenderingValue(&cfstr_Antialiasradiu.isa, self->inputTuningParameters);
    v87[1] = objc_msgSend(v65, "numberWithFloat:");
    v86[2] = @"inputLumaNoiseAmpl";
    LODWORD(v66) = v59;
    v87[2] = [NSNumber numberWithFloat:v66];
    v86[3] = @"inputLumaNoiseModelCoeff";
    v67 = NSNumber;
    SDOFRenderingValue(&cfstr_Lumanoisemodel.isa, self->inputTuningParameters);
    v87[3] = objc_msgSend(v67, "numberWithFloat:");
    v86[4] = @"inputScale";
    *(float *)&double v68 = v64;
    v87[4] = [NSNumber numberWithFloat:v68];
    v86[5] = @"inputRect";
    v87[5] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v25, v27, v29, v31);
    v86[6] = @"inputSensorSize";
    v87[6] = [(CIPortraitBlurV2 *)self sensorSize];
    v55 = -[CIImage imageByApplyingFilter:withInputParameters:](v55, "imageByApplyingFilter:withInputParameters:", @"CIPortraitAntialias", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:7]);
  }
  uint64_t v69 = -[CIImage imageByCroppingToRect:](v55, "imageByCroppingToRect:", v25, v27, v29, v31);
  v70 = self->inputImage;
  v84[0] = @"inputImage";
  v84[1] = @"inputBlurImage";
  v85[0] = v70;
  v85[1] = v69;
  v84[2] = @"inputTuningParameters";
  v85[2] = self->inputTuningParameters;
  v71 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", @"CIPortraitBlurCombiner", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:3]);
  v72 = v71;
  if (inputMatteImage) {
    [(CIFilter *)v71 setValue:inputMatteImage forKey:@"inputMatteImage"];
  }
  return [(CIFilter *)v72 outputImage];
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
{
}

- (CIImage)inputBlurmapImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurmapImage:(id)a3
{
}

- (NSNumber)inputLumaNoiseScale
{
  return self->inputLumaNoiseScale;
}

- (void)setInputLumaNoiseScale:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSString)inputShape
{
  return self->inputShape;
}

- (void)setInputShape:(id)a3
{
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
}

@end