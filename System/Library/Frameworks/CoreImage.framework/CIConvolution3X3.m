@interface CIConvolution3X3
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (CIVector)inputWeights;
- (NSNumber)inputBias;
- (id)outputImage;
- (void)setInputBias:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputWeights:(id)a3;
@end

@implementation CIConvolution3X3

+ (id)customAttributes
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v2 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &+[CIConvolution3X3 customAttributes]::default_values, 9);
  int v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", @"RGB");
  v13[0] = @"CIAttributeFilterCategories";
  v12[0] = @"CICategoryStylize";
  v12[1] = @"CICategoryVideo";
  v12[2] = @"CICategoryStillImage";
  v12[3] = @"CICategoryHighDynamicRange";
  v12[4] = @"CICategoryBuiltIn";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
  v5 = @"7";
  if (v3) {
    v5 = @"15";
  }
  v14[0] = v4;
  v14[1] = v5;
  v13[1] = @"CIAttributeFilterAvailable_iOS";
  v13[2] = @"CIAttributeFilterAvailable_Mac";
  if (v3) {
    v6 = @"12.0";
  }
  else {
    v6 = @"10.9";
  }
  v14[2] = v6;
  v13[3] = @"inputWeights";
  v10[0] = @"CIAttributeIdentity";
  v10[1] = @"CIAttributeDefault";
  v11[0] = v2;
  v11[1] = v2;
  v14[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v13[4] = @"inputBias";
  v8[0] = @"CIAttributeType";
  v8[1] = @"CIAttributeIdentity";
  v9[0] = @"CIAttributeTypeScalar";
  v9[1] = &unk_1EE4A82B0;
  v8[2] = @"CIAttributeDefault";
  v9[2] = &unk_1EE4A82B0;
  v14[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputBias floatValue];
  if (v3 != 0.0) {
    return 0;
  }
  v5 = [(CIVector *)self->inputWeights _values];
  for (uint64_t i = 0; i != 9; ++i)
  {
    if (i == 4)
    {
      if (v5[4] != 1.0) {
        return 0;
      }
    }
    else if (v5[i] != 0.0)
    {
      return 0;
    }
  }
  return 1;
}

- (id)outputImage
{
  v52[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  inputWeights = self->inputWeights;
  if (!inputWeights) {
    return 0;
  }
  if ([(CIVector *)inputWeights count] != 9) {
    [MEMORY[0x1E4F1CA00] raise:@"CIConvolutionWeights" format:@"CIConvolution3X3 expects inputWeights to be a length-9 CIVector"];
  }
  if (![(CIConvolution3X3 *)self _isIdentity])
  {
    [(NSNumber *)self->inputBias doubleValue];
    double v8 = v7;
    int v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", @"RGB");
    if (fabs(v8) >= 1.0e-10)
    {
      double x = *MEMORY[0x1E4F1DB10];
      double y = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    else
    {
      [(CIImage *)self->inputImage extent];
      CGRect v55 = CGRectInset(v54, -1.0, -1.0);
      double x = v55.origin.x;
      double y = v55.origin.y;
      double width = v55.size.width;
      double height = v55.size.height;
    }
    v14 = [(CIVector *)self->inputWeights _values];
    v17 = v14;
    double v18 = *v14;
    if (*v14 != v14[2]) {
      goto LABEL_34;
    }
    if (v18 != v14[6]) {
      goto LABEL_34;
    }
    if (v18 != v14[8]) {
      goto LABEL_34;
    }
    double v19 = v14[1];
    if (v19 != v14[3]) {
      goto LABEL_34;
    }
    if (v19 != v14[5]) {
      goto LABEL_34;
    }
    v15.i64[0] = (uint64_t)v14[7];
    if (v19 != *(double *)v15.i64) {
      goto LABEL_34;
    }
    *(float *)v16.i32 = v18;
    v15.i32[0] = 1.0;
    v20.i64[0] = 0x8000000080000000;
    v20.i64[1] = 0x8000000080000000;
    int8x16_t v21 = vbslq_s8(v20, v15, v16);
    float v22 = *(float *)v16.i32 == 0.0 ? 0.0 : *(float *)v21.i32;
    *(float *)v21.i32 = v19;
    int8x16_t v23 = vbslq_s8(v20, v15, v21);
    float v24 = *(float *)v21.i32 == 0.0 ? 0.0 : *(float *)v23.i32;
    if (v22 != v24) {
      goto LABEL_34;
    }
    double v25 = v14[4];
    *(float *)v23.i32 = v25;
    LODWORD(v26) = vbslq_s8(v20, v15, v23).u32[0];
    if (*(float *)v23.i32 == 0.0) {
      float v26 = 0.0;
    }
    if (v24 == v26
      && (double v27 = v25 + v18 * 4.0 + v19 * 4.0, fabs(v27) > 0.00001)
      && ((double v28 = v19 * v19 - v25 * v18, v28 < 0.0) && (v29 = 0.0, v27 * (v27 * 0.000001) > -v28)
       || (double v29 = v28, v28 >= 0.0)))
    {
      double v42 = v27 * 0.25;
      double v43 = v19 + v18 * 2.0;
      double v44 = sqrt(v29);
      double v45 = (v43 + v44 + v43 + v44) / v27;
      double v46 = (v43 - v44 + v43 - v44) / v27;
      if (v9) {
        v47 = &CI::_convrgb3x3sym;
      }
      else {
        v47 = &CI::_conv3x3sym;
      }
      v48 = +[CIKernel kernelWithInternalRepresentation:v47];
      v49 = +[CIVector vectorWithX:v45 Y:v46 Z:v42 W:v8];
      v52[0] = self->inputImage;
      v52[1] = v49;
      return -[CIKernel applyWithExtent:roiCallback:arguments:](v48, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_13, [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2], x, y, width, height);
    }
    else
    {
LABEL_34:
      if (v9) {
        v30 = &CI::_convrgb3x3;
      }
      else {
        v30 = &CI::_conv3x3;
      }
      v31 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", v30, v18);
      int v32 = 0;
      v33 = v17 + 6;
      v34 = v50;
      do
      {
        for (uint64_t i = 0; i != 3; ++i)
        {
          float v36 = v33[i];
          v34[i] = v36;
        }
        ++v32;
        v34 += 3;
        v33 -= 3;
      }
      while (v32 != 3);
      v37 = +[CIVector vectorWithX:v50[0] Y:v50[1] Z:v50[2] W:v50[3]];
      v38 = +[CIVector vectorWithX:v50[4] Y:v50[5] Z:v50[6] W:v50[7]];
      v39 = +[CIVector vectorWithX:v50[8] Y:v8 Z:1.0 W:1.0];
      v51[0] = self->inputImage;
      v51[1] = v37;
      v51[2] = v38;
      v51[3] = v39;
      v6 = -[CIKernel applyWithExtent:roiCallback:arguments:](v31, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_84, [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4], x, y, width, height);
      if (CI_ENABLE_MPS()) {
        char v40 = v9;
      }
      else {
        char v40 = 1;
      }
      if (v40) {
        return v6;
      }
      return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIConvolutionProcessor applyConToImage:self->inputImage width:3 height:3 bias:self->inputWeights weights:v8], v6);
    }
  }
  uint64_t v4 = self->inputImage;

  return v4;
}

double __31__CIConvolution3X3_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __31__CIConvolution3X3_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
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

- (CIVector)inputWeights
{
  return self->inputWeights;
}

- (void)setInputWeights:(id)a3
{
}

- (NSNumber)inputBias
{
  return self->inputBias;
}

- (void)setInputBias:(id)a3
{
}

@end