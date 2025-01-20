@interface CIBoxBlur
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputRadius;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIBoxBlur

- (id)outputImage
{
  v14[1] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  if (CGRectIsEmpty(v16))
  {
    return +[CIImage emptyImage];
  }
  [(NSNumber *)self->inputRadius doubleValue];
  double v5 = fmax(floor(v4 * 0.5 + -0.25) * 2.0 + 1.0, 1.0);
  uint64_t v6 = (int)v5;
  if ((int)v6 <= 1)
  {
    v7 = self->inputImage;
    return v7;
  }
  if (v6 == 3)
  {
    v8 = +[CIKernel kernelWithInternalRepresentation:&CI::_boxBlur3x3];
    [(CIImage *)self->inputImage extent];
    CGRect v18 = CGRectInset(v17, -1.0, -1.0);
    v14[0] = self->inputImage;
    return -[CIKernel applyWithExtent:roiCallback:arguments:](v8, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_3, [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1], v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  }
  v10 = boxBlurImage(self->inputImage, (int)v5, 1, 0);
  v9 = boxBlurImage(v10, v6, 0, 1);
  if (!CI_ENABLE_MPS()) {
    return v9;
  }
  inputImage = self->inputImage;
  uint64_t v12 = v6;
  if (v6 > 9)
  {
    inputImage = +[CIConvolutionProcessor applyBoxToImage:inputImage width:v6 height:1];
    uint64_t v12 = 1;
  }
  id v13 = +[CIConvolutionProcessor applyBoxToImage:inputImage width:v12 height:v6];

  return +[CIImage imageForRenderingWithMPS:v13 orNonMPS:v9];
}

double __24__CIBoxBlur_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryBlur";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.5";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v3[2] = @"CIAttributeSliderMin";
  v3[3] = @"CIAttributeSliderMax";
  v4[0] = @"CIAttributeTypeDistance";
  v4[1] = &unk_1EE4A7D50;
  v4[2] = &unk_1EE4A7D50;
  v4[3] = &unk_1EE4A7D60;
  v3[4] = @"CIAttributeDefault";
  v4[4] = &unk_1EE4A7D70;
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

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
}

@end