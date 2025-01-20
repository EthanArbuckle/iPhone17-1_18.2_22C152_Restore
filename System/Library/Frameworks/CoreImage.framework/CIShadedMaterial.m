@interface CIShadedMaterial
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputShadingImage;
- (NSNumber)inputScale;
- (id)_CIShadedmaterial;
- (id)_CIShadedmaterial_0;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputShadingImage:(id)a3;
@end

@implementation CIShadedMaterial

- (id)_CIShadedmaterial
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_shadedmaterial];
}

- (id)_CIShadedmaterial_0
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_shadedmaterial_0];
}

- (id)outputImage
{
  v47[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  id result = self->inputShadingImage;
  if (result)
  {
    [result extent];
    double v5 = v4;
    [(CIImage *)self->inputShadingImage extent];
    v7 = +[CIVector vectorWithX:v5 Y:v6];
    [(NSNumber *)self->inputScale floatValue];
    float v9 = fabsf(v8);
    [(CIImage *)self->inputShadingImage extent];
    uint64_t v14 = v13;
    if (v9 >= 0.001)
    {
      uint64_t v32 = v10;
      uint64_t v33 = v11;
      uint64_t v34 = v12;
      id v35 = [(CIShadedMaterial *)self _CIShadedmaterial];
      [(CIImage *)self->inputImage extent];
      double v44 = v36;
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __31__CIShadedMaterial_outputImage__block_invoke_2;
      v45[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      v45[4] = v14;
      v45[5] = v32;
      v45[6] = v33;
      v45[7] = v34;
      inputShadingImage = self->inputShadingImage;
      v46[0] = self->inputImage;
      v46[1] = inputShadingImage;
      v46[2] = [NSNumber numberWithFloat:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0 / v9))];
      v46[3] = v7;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
      v26 = v45;
      v27 = v35;
      double v28 = v44;
      double v29 = v38;
      double v30 = v40;
      double v31 = v42;
    }
    else
    {
      id v15 = [(CIShadedMaterial *)self _CIShadedmaterial];
      [(CIImage *)self->inputImage extent];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      v24 = self->inputShadingImage;
      v47[0] = self->inputImage;
      v47[1] = v24;
      v47[2] = v7;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
      v26 = &__block_literal_global_60;
      v27 = v15;
      double v28 = v17;
      double v29 = v19;
      double v30 = v21;
      double v31 = v23;
    }
    return (id)objc_msgSend(v27, "applyWithExtent:roiCallback:arguments:", v26, v25, v28, v29, v30, v31);
  }
  return result;
}

double __31__CIShadedMaterial_outputImage__block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a2) {
    return *(double *)(a1 + 32);
  }
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a3, -1.0, -1.0);
  return result;
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryStylize";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryHighDynamicRange";
  v5[4] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A9A60;
  v4[1] = &unk_1EE4A9A70;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9A80;
  v4[3] = &unk_1EE4A9A90;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeDistance";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputShadingImage
{
  return self->inputShadingImage;
}

- (void)setInputShadingImage:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end