@interface CISmartColorFilter
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputCast;
- (NSNumber)inputContrast;
- (NSNumber)inputUseCube;
- (NSNumber)inputVibrancy;
- (id)_kernelCNeg;
- (id)_kernelCPos;
- (id)_kernelCast;
- (id)_kernelV_gt1;
- (id)_kernelV_lt1;
- (id)inputUseCubeColorSpace;
- (id)outputImage;
- (void)dealloc;
- (void)setInputCast:(id)a3;
- (void)setInputContrast:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputUseCube:(id)a3;
- (void)setInputUseCubeColorSpace:(id)a3;
- (void)setInputVibrancy:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation CISmartColorFilter

+ (id)customAttributes
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"CIAttributeFilterCategories";
  v12[0] = @"CICategoryStylize";
  v12[1] = @"CICategoryVideo";
  v12[2] = @"CICategoryStillImage";
  v12[3] = @"CICategoryBuiltIn";
  v12[4] = @"CICategoryApplePrivate";
  v14[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
  v13[1] = @"inputVibrancy";
  v10[0] = @"CIAttributeMin";
  v10[1] = @"CIAttributeSliderMin";
  v11[0] = &unk_1EE4A9C20;
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
  v14[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:7];
  v13[2] = @"inputContrast";
  v8[0] = @"CIAttributeMin";
  v8[1] = @"CIAttributeSliderMin";
  v9[0] = &unk_1EE4A9C20;
  v9[1] = &unk_1EE4A9C20;
  v8[2] = @"CIAttributeSliderMax";
  v8[3] = @"CIAttributeMax";
  v9[2] = &unk_1EE4A9C30;
  v9[3] = &unk_1EE4A9C40;
  v8[4] = @"CIAttributeDefault";
  v8[5] = @"CIAttributeIdentity";
  v9[4] = &unk_1EE4A9C50;
  v9[5] = &unk_1EE4A9C50;
  v8[6] = @"CIAttributeType";
  v9[6] = @"CIAttributeTypeScalar";
  v14[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:7];
  v13[3] = @"inputCast";
  v6[0] = @"CIAttributeMin";
  v6[1] = @"CIAttributeSliderMin";
  v7[0] = &unk_1EE4A9C20;
  v7[1] = &unk_1EE4A9C20;
  v6[2] = @"CIAttributeSliderMax";
  v6[3] = @"CIAttributeMax";
  v7[2] = &unk_1EE4A9C30;
  v7[3] = &unk_1EE4A9C30;
  v6[4] = @"CIAttributeDefault";
  v6[5] = @"CIAttributeIdentity";
  v7[4] = &unk_1EE4A9C50;
  v7[5] = &unk_1EE4A9C50;
  v6[6] = @"CIAttributeType";
  v7[6] = @"CIAttributeTypeScalar";
  v14[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:7];
  v13[4] = @"inputUseCube";
  v4[0] = @"CIAttributeMin";
  v4[1] = @"CIAttributeMax";
  v5[0] = &unk_1EE4AAEF8;
  v5[1] = &unk_1EE4AAF10;
  v4[2] = @"CIAttributeDefault";
  v4[3] = @"CIAttributeType";
  v5[2] = &unk_1EE4AAEF8;
  v5[3] = @"CIAttributeTypeInteger";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  v13[5] = @"inputUseCubeColorSpace";
  v14[4] = v2;
  v14[5] = MEMORY[0x1E4F1CC08];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputVibrancy doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputContrast doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputCast doubleValue];
  BOOL result = 0;
  if (fabs(v4) < 1.0e-10 && fabs(v6) < 1.0e-10) {
    return fabs(v7) < 1.0e-10;
  }
  return result;
}

- (void)dealloc
{
  self->_cubeImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)CISmartColorFilter;
  [(CIFilter *)&v3 dealloc];
}

- (id)_kernelCPos
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smartcolor_contrast];
}

- (id)_kernelCNeg
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smartcolor_contrast_darken];
}

- (id)_kernelV_gt1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smartcolor_vibrancy_gt1];
}

- (id)_kernelV_lt1
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smartcolor_vibrancy_lt1];
}

- (id)_kernelCast
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_smartcolor_cast];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (([a4 isEqualToString:@"inputImage"] & 1) == 0)
  {

    self->_cubeImage = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CISmartColorFilter;
  [(CISmartColorFilter *)&v7 setValue:a3 forKey:a4];
}

- (id)outputImage
{
  v86[1] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(CISmartColorFilter *)self _isIdentity])
  {
    inputImage = self->inputImage;
LABEL_19:
    objc_super v7 = inputImage;
    return v7;
  }
  LODWORD(v5) = [(NSNumber *)[(CISmartColorFilter *)self inputUseCube] intValue];
  if (CI_SMART_COLOR_USE_CUBE(void)::didCheck != -1) {
    dispatch_once(&CI_SMART_COLOR_USE_CUBE(void)::didCheck, &__block_literal_global_309);
  }
  if ((CI_SMART_COLOR_USE_CUBE(void)::v & 0x80000000) == 0 && (v5 & 0x80000000) == 0) {
    LODWORD(v5) = CI_SMART_COLOR_USE_CUBE(void)::v;
  }
  if ((int)v5 < 1)
  {
    [(NSNumber *)self->inputVibrancy doubleValue];
    double v9 = fmin(fmax(v8, -1.0), 2.0);
    [(NSNumber *)self->inputContrast doubleValue];
    double v11 = fmin(fmax(v10, -1.0), 2.0);
    [(NSNumber *)self->inputCast doubleValue];
    double v13 = fmax(v12, -1.0);
    id result = self->inputImage;
    if (fabs(v9) >= 1.0e-10)
    {
      if (v9 <= 0.0) {
        double v14 = v9 + 1.0;
      }
      else {
        double v14 = v9 * 3.0 + 1.0;
      }
      v15 = (void *)[result imageByUnpremultiplyingAlpha];
      if (v14 >= 1.0) {
        id v16 = [(CISmartColorFilter *)self _kernelV_gt1];
      }
      else {
        id v16 = [(CISmartColorFilter *)self _kernelV_lt1];
      }
      v22 = v16;
      [v15 extent];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      v83[0] = v15;
      v83[1] = [NSNumber numberWithDouble:v14];
      id result = (id)objc_msgSend((id)objc_msgSend(v22, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v83, 2), v24, v26, v28, v30), "imageByPremultiplyingAlpha");
    }
    double v31 = fmin(v13, 1.0);
    if (fabs(v11) >= 1.0e-10)
    {
      double v32 = v11 + v11;
      v33 = (void *)[result imageByUnpremultiplyingAlpha];
      if (v11 + v11 <= 0.0)
      {
        v80 = @"inputAmount";
        uint64_t v81 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(v32 / 6.0, -0.4));
        v44 = objc_msgSend(v33, "imageByApplyingFilter:withInputParameters:", @"CIVibrance", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1));
        id v34 = [(CISmartColorFilter *)self _kernelCNeg];
        [v44 extent];
        double v36 = v45;
        double v38 = v46;
        double v40 = v47;
        double v42 = v48;
        v79[0] = v44;
        v79[1] = [NSNumber numberWithDouble:-v32];
        v43 = v79;
      }
      else
      {
        id v34 = [(CISmartColorFilter *)self _kernelCPos];
        [v33 extent];
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        double v42 = v41;
        v82[0] = v33;
        v82[1] = [NSNumber numberWithDouble:v11 + v11];
        v43 = v82;
      }
      id result = (id)objc_msgSend((id)objc_msgSend(v34, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v43, 2), v36, v38, v40, v42), "imageByPremultiplyingAlpha");
    }
    if (fabs(v31) < 1.0e-10) {
      return result;
    }
    if (v31 <= 0.0)
    {
      if (v31 > -0.5)
      {
        float v52 = v31 * -2.0;
        double v50 = v52;
        float64x2_t v51 = (float64x2_t)xmmword_1939566F0;
        goto LABEL_43;
      }
      float v63 = (v31 + 0.5) * -2.0;
      double v58 = v63;
      double v59 = 1.0;
      double v60 = 1.0 - v63;
      float64x2_t v61 = vmulq_n_f64((float64x2_t)xmmword_1939566E0, v63);
      float64x2_t v62 = (float64x2_t)xmmword_1939566F0;
    }
    else
    {
      if (v31 < 0.5)
      {
        float v49 = v31 + v31;
        double v50 = v49;
        float64x2_t v51 = (float64x2_t)xmmword_193956710;
LABEL_43:
        float64x2_t v53 = vmulq_n_f64(v51, v50);
        float v54 = 0.3;
LABEL_49:
        float v64 = v53.f64[1];
        float v65 = v53.f64[0];
        v66 = (void *)[result imageByUnpremultiplyingAlpha];
        id v67 = [(CISmartColorFilter *)self _kernelCast];
        [v66 extent];
        double v69 = v68;
        double v71 = v70;
        double v73 = v72;
        double v75 = v74;
        v78[0] = v66;
        v78[1] = &unk_1EE4A9C40;
        *(float *)&double v68 = v65;
        v78[2] = [NSNumber numberWithFloat:v68];
        *(float *)&double v76 = v64;
        v78[3] = [NSNumber numberWithFloat:v76];
        *(float *)&double v77 = v54;
        v78[4] = [NSNumber numberWithFloat:v77];
        return (id)objc_msgSend((id)objc_msgSend(v67, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v78, 5), v69, v71, v73, v75), "imageByPremultiplyingAlpha");
      }
      float v57 = v31 + -0.5 + v31 + -0.5;
      double v58 = v57;
      double v59 = 1.0;
      double v60 = 1.0 - v57;
      float64x2_t v61 = vmulq_n_f64((float64x2_t)xmmword_193956700, v57);
      float64x2_t v62 = (float64x2_t)xmmword_193956710;
    }
    float64x2_t v53 = vmlaq_n_f64(v61, v62, v60);
    float v54 = (v59 + v58 * -0.6) * 0.300000012;
    goto LABEL_49;
  }
  if (v5 > 0x20 || v5 == 1) {
    uint64_t v5 = 32;
  }
  else {
    uint64_t v5 = v5;
  }
  inputImage = self->_cubeImage;
  if (inputImage) {
    goto LABEL_19;
  }
  v17 = (void *)[(CISmartColorFilter *)self copy];
  [v17 setValue:&unk_1EE4AAF28 forKey:@"inputUseCube"];
  v85 = @"working_format";
  v86[0] = [NSNumber numberWithInt:2056];
  id v18 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", @"CISmartColorFilter-cubeContext", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:&v85 count:1]);
  v84 = v17;
  uint64_t v19 = objc_msgSend(v18, "createColorCubeDataForFilters:dimension:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v84, 1), v5);

  v20 = [(CISmartColorFilter *)self inputUseCubeColorSpace];
  if (v20) {
    CGColorSpaceRef DeviceRGB = CGColorSpaceRetain(v20);
  }
  else {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  v55 = DeviceRGB;
  v56 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIColorCubeWithColorSpace", @"inputImage", self->inputImage, @"inputCubeData", v19, @"inputColorSpace", DeviceRGB, @"inputCubeDimension", [NSNumber numberWithInt:v5], 0);
  CGColorSpaceRelease(v55);
  id result = [(CIFilter *)v56 outputImage];
  self->_cubeImage = (CIImage *)result;
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputVibrancy
{
  return self->inputVibrancy;
}

- (void)setInputVibrancy:(id)a3
{
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
}

- (NSNumber)inputCast
{
  return self->inputCast;
}

- (void)setInputCast:(id)a3
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