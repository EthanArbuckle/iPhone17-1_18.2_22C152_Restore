@interface CIConvolution7X7
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

@implementation CIConvolution7X7

+ (id)customAttributes
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v2 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &+[CIConvolution7X7 customAttributes]::default_values, 49);
  int v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", @"RGB");
  v13[0] = @"CIAttributeFilterCategories";
  v12[0] = @"CICategoryStylize";
  v12[1] = @"CICategoryVideo";
  v12[2] = @"CICategoryStillImage";
  v12[3] = @"CICategoryHighDynamicRange";
  v12[4] = @"CICategoryBuiltIn";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
  v5 = @"9";
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
  for (uint64_t i = 0; i != 49; ++i)
  {
    if (i == 24)
    {
      if (v5[24] != 1.0) {
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
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  inputWeights = self->inputWeights;
  if (!inputWeights) {
    return 0;
  }
  if ([(CIVector *)inputWeights count] != 49) {
    [MEMORY[0x1E4F1CA00] raise:@"CIConvolutionWeights" format:@"CIConvolution7X7 expects inputWeights to be a length-49 CIVector"];
  }
  if (![(CIConvolution7X7 *)self _isIdentity])
  {
    LODWORD(v7) = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "containsString:", @"RGB");
    v8 = [(CIVector *)self->inputWeights _values];
    uint64_t v9 = 0;
    double v10 = 0.0;
    LODWORD(v11) = -1;
    v12 = v8;
    int v13 = -1;
    do
    {
      for (uint64_t i = 0; i != 7; ++i)
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
      v12 += 7;
    }
    while (v9 != 7);
    uint64_t v16 = 0;
    v17 = &v8[7 * (int)v11];
    long long v18 = *((_OWORD *)v17 + 1);
    v60[0] = *(_OWORD *)v17;
    v60[1] = v18;
    v60[2] = *((_OWORD *)v17 + 2);
    uint64_t v61 = *((void *)v17 + 6);
    v19 = &v8[v13];
    do
    {
      double v20 = *v19;
      v19 += 7;
      v59[v16++] = v20;
    }
    while (v16 != 7);
    for (uint64_t j = 0; j != 56; j += 8)
      *(double *)((char *)v60 + j) = *(double *)((char *)v60 + j) / v10;
    unint64_t v22 = 0;
    BOOL v23 = 0;
    while (v22 == v11)
    {
LABEL_27:
      BOOL v23 = v22 > 5;
      v8 += 7;
      if (++v22 == 7)
      {
        BOOL v23 = 1;
        goto LABEL_29;
      }
    }
    uint64_t v24 = 0;
    while (fabs(v8[v24] - *(double *)((char *)v60 + v24 * 8) * v59[v22]) <= 0.000001)
    {
      if (++v24 == 7) {
        goto LABEL_27;
      }
    }
LABEL_29:
    convert_weights([(CIVector *)self->inputWeights _values], v55, 7u, 7u);
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
      CGRect v65 = CGRectInset(v64, -3.0, -3.0);
      double x = v65.origin.x;
      double y = v65.origin.y;
      double width = v65.size.width;
      double height = v65.size.height;
    }
    inputImage = self->inputImage;
    if (v23)
    {
      uint64_t v32 = 0;
      uint64_t v58 = 0;
      memset(v57, 0, sizeof(v57));
      double v33 = sqrt(v10);
      do
      {
        *(double *)&v57[v32 + 8] = v33 * *(double *)((char *)v60 + v32);
        v32 += 8;
      }
      while (v32 != 56);
      v34 = +[CIVector vectorWithValues:v57 count:9];
      for (uint64_t k = 0; k != 7; ++k)
        *(double *)&v57[k * 8 + 8] = v59[k] / v33;
      v36 = +[CIVector vectorWithValues:v57 count:9];
      v37 = apply1DConvolution(inputImage, v34, 0.0, 1u, 0);
      v38 = apply1DConvolution(v37, v36, v26, 0, 0);
    }
    else
    {
      if (v7) {
        v39 = &CI::_convolutionrgb7x7;
      }
      else {
        v39 = &CI::_convolution7x7;
      }
      v54 = +[CIKernel kernelWithInternalRepresentation:v39];
      v53 = +[CIVector vectorWithX:v55[0] Y:v55[1] Z:v55[2] W:v55[3]];
      v52 = +[CIVector vectorWithX:v55[4] Y:v55[5] Z:v55[6] W:v55[7]];
      v51 = +[CIVector vectorWithX:v55[8] Y:v55[9] Z:v55[10] W:v55[11]];
      v50 = +[CIVector vectorWithX:v55[12] Y:v55[13] Z:v55[14] W:v55[15]];
      v49 = +[CIVector vectorWithX:v55[16] Y:v55[17] Z:v55[18] W:v55[19]];
      v48 = +[CIVector vectorWithX:v55[20] Y:v55[21] Z:v55[22] W:v55[23]];
      v47 = +[CIVector vectorWithX:v55[24] Y:v55[25] Z:v55[26] W:v55[27]];
      v46 = +[CIVector vectorWithX:v55[28] Y:v55[29] Z:v55[30] W:v55[31]];
      v45 = +[CIVector vectorWithX:v55[32] Y:v55[33] Z:v55[34] W:v55[35]];
      char v40 = (char)v7;
      v7 = +[CIVector vectorWithX:v55[36] Y:v55[37] Z:v55[38] W:v55[39]];
      v41 = +[CIVector vectorWithX:v55[40] Y:v55[41] Z:v55[42] W:v55[43]];
      v42 = +[CIVector vectorWithX:v55[44] Y:v55[45] Z:v55[46] W:v55[47]];
      v43 = +[CIVector vectorWithX:v55[48] Y:v26 Z:1.0 W:1.0];
      v56[0] = inputImage;
      v56[1] = v53;
      v56[2] = v52;
      v56[3] = v51;
      v56[4] = v50;
      v56[5] = v49;
      v56[6] = v48;
      v56[7] = v47;
      v56[8] = v46;
      v56[9] = v45;
      v56[10] = v7;
      v56[11] = v41;
      LOBYTE(v7) = v40;
      v56[12] = v42;
      v56[13] = v43;
      v38 = -[CIKernel applyWithExtent:roiCallback:arguments:](v54, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_131, [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:14], x, y, width, height);
    }
    v6 = v38;
    if (CI_ENABLE_MPS()) {
      char v44 = (char)v7;
    }
    else {
      char v44 = 1;
    }
    if ((v44 & 1) == 0) {
      return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIConvolutionProcessor applyConToImage:self->inputImage width:7 height:7 bias:self->inputWeights weights:v26], v6);
    }
    return v6;
  }
  uint64_t v4 = self->inputImage;

  return v4;
}

double __31__CIConvolution7X7_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a1, -3.0, -3.0);
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