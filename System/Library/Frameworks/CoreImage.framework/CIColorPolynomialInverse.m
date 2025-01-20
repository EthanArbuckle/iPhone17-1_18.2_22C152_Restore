@interface CIColorPolynomialInverse
+ (id)customAttributes;
- (BOOL)_isInvertible;
- (id)_kernel;
- (id)_kernelRGB;
- (id)outputImage;
- (void)outputImage;
@end

@implementation CIColorPolynomialInverse

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorPolynomialInverse];
}

- (id)_kernelRGB
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_colorPolynomialInverseRGB];
}

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryColorAdjustment";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryInterlaced";
  v11[3] = @"CICategoryNonSquarePixels";
  v11[4] = @"CICategoryStillImage";
  v11[5] = @"CICategoryHighDynamicRange";
  v11[6] = @"CICategoryBuiltIn";
  v11[7] = @"CICategoryApplePrivate";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:8];
  v13[1] = @"14";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"11.0";
  v12[3] = @"inputRedCoefficients";
  v9[0] = @"CIAttributeDefault";
  v10[0] = +[CIVector vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
  v9[1] = @"CIAttributeIdentity";
  v10[1] = +[CIVector vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v12[4] = @"inputGreenCoefficients";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeIdentity";
  v8[0] = +[CIVector vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
  v8[1] = +[CIVector vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v12[5] = @"inputBlueCoefficients";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeIdentity";
  v6[0] = +[CIVector vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
  v6[1] = +[CIVector vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v12[6] = @"inputAlphaCoefficients";
  v3[0] = @"CIAttributeDefault";
  v3[1] = @"CIAttributeIdentity";
  v4[0] = +[CIVector vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
  v4[1] = +[CIVector vectorWithX:0.0 Y:1.0 Z:0.0 W:0.0];
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (BOOL)_isInvertible
{
  v26[4] = *MEMORY[0x1E4F143B8];
  inputGreenCoefficients = self->super.inputGreenCoefficients;
  v26[0] = self->super.inputRedCoefficients;
  v26[1] = inputGreenCoefficients;
  inputAlphaCoefficients = self->super.inputAlphaCoefficients;
  v26[2] = self->super.inputBlueCoefficients;
  v26[3] = inputAlphaCoefficients;
  v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v9 W];
        double v11 = fabs(v10);
        [v9 Z];
        double v13 = v12;
        if (v11 >= 0.00001)
        {
          [v9 Z];
          double v16 = v13 * v15;
          [v9 W];
          double v18 = v17 * 3.0;
          [v9 Y];
          if (v16 > v18 * v19) {
            return 0;
          }
        }
        else if (fabs(v12) < 0.00001)
        {
          [v9 Y];
          if (fabs(v14) < 0.00001) {
            return 0;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (id)outputImage
{
  if ([(CIColorPolynomialInverse *)self _isInvertible])
  {
    v5.receiver = self;
    v5.super_class = (Class)CIColorPolynomialInverse;
    return [(CIColorPolynomial *)&v5 outputImage];
  }
  else
  {
    v4 = ci_logger_filter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(CIColorPolynomialInverse *)(uint64_t)self outputImage];
    }
    return +[CIImage emptyImage];
  }
}

- (void)outputImage
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = [(id)objc_opt_class() description];
  _os_log_error_impl(&dword_193671000, a2, OS_LOG_TYPE_ERROR, "%{public}@: input coefficients are not inverable.", (uint8_t *)&v3, 0xCu);
}

@end