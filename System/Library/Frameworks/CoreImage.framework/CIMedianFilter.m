@interface CIMedianFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (id)_kernel3x3;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIMedianFilter

- (id)_kernel3x3
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_median3x3];
}

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryBlur";
  v3[1] = @"CICategoryStillImage";
  v3[2] = @"CICategoryVideo";
  v3[3] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  v5[1] = @"9";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.4";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v12[1] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  if (CGRectIsEmpty(v14))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    id v4 = [(CIMedianFilter *)self _kernel3x3];
    [(CIImage *)self->inputImage extent];
    v12[0] = self->inputImage;
    v9 = objc_msgSend(v4, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_46, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 1), v5, v6, v7, v8);
    if (CI_ENABLE_MPS())
    {
      id v10 = +[CIMedianProcessor applyMedianToImage:self->inputImage width:3];
      if (v10)
      {
        id v11 = v10;
        [v10 extent];
        if (!CGRectIsEmpty(v15)) {
          return +[CIImage imageForRenderingWithMPS:v11 orNonMPS:v9];
        }
      }
    }
    return v9;
  }
}

double __29__CIMedianFilter_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

@end