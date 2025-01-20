@interface CIEdges
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputIntensity;
- (id)_CIEdges;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputIntensity:(id)a3;
@end

@implementation CIEdges

- (id)_CIEdges
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_edges];
}

- (id)outputImage
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(CIEdges *)self _CIEdges];
  [(CIImage *)self->inputImage extent];
  inputIntensity = self->inputIntensity;
  v10[0] = self->inputImage;
  v10[1] = inputIntensity;
  return (id)objc_msgSend(v3, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_23, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 2), v5, v6, v7, v8);
}

double __22__CIEdges_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
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
  v6[3] = @"inputIntensity";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeScalar";
  v4[1] = &unk_1EE4A8A60;
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[2] = &unk_1EE4A8A60;
  v4[3] = &unk_1EE4A8A70;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4A8A80;
  v4[5] = &unk_1EE4A8A60;
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
}

@end