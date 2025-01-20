@interface CIConvolution5X5
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

@implementation CIConvolution5X5

+ (id)customAttributes
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v2 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &+[CIConvolution5X5 customAttributes]::default_values, 25);
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
  for (uint64_t i = 0; i != 25; ++i)
  {
    if (i == 12)
    {
      if (v5[12] != 1.0) {
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
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  inputWeights = self->inputWeights;
  if (!inputWeights) {
    return 0;
  }
  if ([(CIVector *)inputWeights count] != 25) {
    [MEMORY[0x1E4F1CA00] raise:@"CIConvolutionWeights" format:@"CIConvolution5X5 expects inputWeights to be a length-25 CIVector"];
  }
  if (![(CIConvolution5X5 *)self _isIdentity])
  {
    v7 = [(CIVector *)self->inputWeights _values];
    LODWORD(v8) = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", @"RGB");
    uint64_t v9 = 0;
    double v10 = 0.0;
    LODWORD(v11) = -1;
    v12 = v7;
    int v13 = -1;
    do
    {
      for (uint64_t i = 0; i != 5; ++i)
      {
        double v15 = fabs(v12[i]);
        if (v15 <= v10)
        {
          uint64_t v11 = v11;
        }
        else
        {
          double v10 = v15;
          int v13 = i;
          uint64_t v11 = v9;
        }
      }
      ++v9;
      v12 += 5;
    }
    while (v9 != 5);
    uint64_t v16 = 0;
    v17 = &v7[5 * (int)v11];
    long long v18 = *((_OWORD *)v17 + 1);
    v54[0] = *(_OWORD *)v17;
    v54[1] = v18;
    uint64_t v55 = *((void *)v17 + 4);
    v19 = &v7[v13];
    do
    {
      double v20 = *v19;
      v19 += 5;
      v53[v16++] = v20;
    }
    while (v16 != 5);
    for (uint64_t j = 0; j != 40; j += 8)
      *(double *)((char *)v54 + j) = *(double *)((char *)v54 + j) / v10;
    unint64_t v22 = 0;
    BOOL v23 = 0;
    while (v22 == v11)
    {
LABEL_27:
      BOOL v23 = v22 > 3;
      v7 += 5;
      if (++v22 == 5)
      {
        BOOL v23 = 1;
        goto LABEL_29;
      }
    }
    uint64_t v24 = 0;
    while (fabs(v7[v24] - *(double *)((char *)v54 + v24 * 8) * v53[v22]) <= 0.000001)
    {
      if (++v24 == 5) {
        goto LABEL_27;
      }
    }
LABEL_29:
    convert_weights([(CIVector *)self->inputWeights _values], v49, 5u, 5u);
    [(NSNumber *)self->inputBias doubleValue];
    double v26 = v25;
    if (fabs(v25) >= 1.0e-10)
    {
      double x = *MEMORY[0x1E4F1DB10];
      double y = *(double *)(MEMORY[0x1E4F1DB10] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB10] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    }
    else
    {
      [(CIImage *)self->inputImage extent];
      CGRect v59 = CGRectInset(v58, -2.0, -2.0);
      double x = v59.origin.x;
      double y = v59.origin.y;
      double width = v59.size.width;
      double height = v59.size.height;
    }
    inputImage = self->inputImage;
    if (v23)
    {
      uint64_t v32 = 0;
      uint64_t v52 = 0;
      memset(v51, 0, sizeof(v51));
      double v33 = sqrt(v10);
      do
      {
        *(double *)&v51[v32 + 16] = v33 * *(double *)((char *)v54 + v32);
        v32 += 8;
      }
      while (v32 != 40);
      v34 = +[CIVector vectorWithValues:v51 count:9];
      for (uint64_t k = 0; k != 5; ++k)
        *(double *)&v51[k * 8 + 16] = v53[k] / v33;
      v36 = +[CIVector vectorWithValues:v51 count:9];
      v37 = apply1DConvolution(inputImage, v34, 0.0, 1u, 0);
      v38 = apply1DConvolution(v37, v36, v26, 0, 0);
    }
    else
    {
      if (v8) {
        v39 = &CI::_convolutionrgb5x5;
      }
      else {
        v39 = &CI::_convolution5x5;
      }
      v47 = +[CIKernel kernelWithInternalRepresentation:v39];
      v46 = +[CIVector vectorWithX:v49[0] Y:v49[1] Z:v49[2] W:v49[3]];
      v45 = +[CIVector vectorWithX:v49[4] Y:v49[5] Z:v49[6] W:v49[7]];
      char v48 = (char)v8;
      v8 = +[CIVector vectorWithX:v49[8] Y:v49[9] Z:v49[10] W:v49[11]];
      v40 = +[CIVector vectorWithX:v49[12] Y:v49[13] Z:v49[14] W:v49[15]];
      v41 = +[CIVector vectorWithX:v49[16] Y:v49[17] Z:v49[18] W:v49[19]];
      v42 = +[CIVector vectorWithX:v49[20] Y:v49[21] Z:v49[22] W:v49[23]];
      v43 = +[CIVector vectorWithX:v49[24] Y:v26 Z:1.0 W:1.0];
      v50[0] = inputImage;
      v50[1] = v46;
      v50[2] = v45;
      v50[3] = v8;
      LOBYTE(v8) = v48;
      v50[4] = v40;
      v50[5] = v41;
      v50[6] = v42;
      v50[7] = v43;
      v38 = -[CIKernel applyWithExtent:roiCallback:arguments:](v47, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_115, [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:8], x, y, width, height);
    }
    v6 = v38;
    if (CI_ENABLE_MPS()) {
      char v44 = (char)v8;
    }
    else {
      char v44 = 1;
    }
    if ((v44 & 1) == 0) {
      return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIConvolutionProcessor applyConToImage:self->inputImage width:5 height:5 bias:self->inputWeights weights:v26], v6);
    }
    return v6;
  }
  uint64_t v4 = self->inputImage;

  return v4;
}

double __31__CIConvolution5X5_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
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