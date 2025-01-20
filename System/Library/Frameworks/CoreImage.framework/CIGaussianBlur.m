@interface CIGaussianBlur
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputRadius;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIGaussianBlur

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryBlur";
  v5[1] = @"CICategoryStillImage";
  v5[2] = @"CICategoryVideo";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"6";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8CC0;
  v4[3] = &unk_1EE4A8CD0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[0] = &unk_1EE4A8CB0;
  v4[1] = &unk_1EE4A8CB0;
  v4[4] = &unk_1EE4A8CB0;
  v4[5] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputRadius doubleValue];
  return v2 < 0.16;
}

- (id)outputImage
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if (![(CIGaussianBlur *)self _isIdentity])
  {
    [(NSNumber *)self->inputRadius doubleValue];
    double v6 = v5;
    if (v5 > 1.12) {
      return blurImage(self->inputImage, v6, v6);
    }
    uint64_t v7 = 0;
    if (v5 <= 0.7) {
      unsigned int v8 = 3;
    }
    else {
      unsigned int v8 = 4;
    }
    double v9 = 0.707106781 / v5;
    do
    {
      double v10 = v9 * (double)(int)v7;
      double v11 = v10 + v9 * 0.5;
      double v12 = v10 + v9 * -0.5;
      if (v10 <= 2.0)
      {
        double v15 = erf(v11);
        double v14 = (v15 - erf(v12)) * 0.5;
      }
      else
      {
        double v13 = erfc(v11);
        double v14 = (v13 - erfc(v12)) * -0.5;
      }
      *(&v41 + v7++) = v14;
    }
    while (v7 != 4);
    if (v6 <= 0.4) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = v8;
    }
    long long v39 = 0u;
    *(_OWORD *)v40 = 0u;
    if (v16 == 2)
    {
      double v17 = 0.333333333;
      *(double *)&long long v39 = (v42 * -2.0 + v41 * 2.0 + 1.0) * 0.333333333;
      double v18 = v42 - v41;
      uint64_t v19 = 1;
    }
    else if (v16 == 3)
    {
      double v17 = 0.2;
      *(double *)&long long v39 = (v42 * -2.0 + v41 * 4.0 + v43 * -2.0 + 1.0) * 0.2;
      *((double *)&v39 + 1) = (v43 * -2.0 - (v41 - v42 * 3.0) + 1.0) * 0.2;
      double v18 = v43 * 3.0 - (v41 - v42 * -2.0);
      uint64_t v19 = 2;
    }
    else
    {
      double v17 = 0.142857143;
      *(double *)&long long v39 = (v42 * -2.0 + v41 * 6.0 + v43 * -2.0 + v44 * -2.0 + 1.0) * 0.142857143;
      *((double *)&v39 + 1) = (v43 * -2.0 - (v41 - v42 * 5.0) + v44 * -2.0 + 1.0) * 0.142857143;
      v40[0] = (v43 * 5.0 - (v41 - v42 * -2.0) + v44 * -2.0 + 1.0) * 0.142857143;
      double v18 = v43 * -2.0 - (v41 - v42 * -2.0) + v44 * 5.0;
      uint64_t v19 = 3;
    }
    v40[v19 - 2] = (v18 + 1.0) * v17;
    uint64_t v20 = 0;
    int v21 = 2 * v16;
    int v22 = 2 * v16 - 1;
    if (v22 <= 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v22;
    }
    v24 = (double *)v38;
    do
    {
      if (v20 - v16 >= -1) {
        int v25 = v20 - v16 + 1;
      }
      else {
        int v25 = v16 + ~v20;
      }
      double v26 = v40[v25 - 2];
      uint64_t v27 = v23;
      uint64_t v28 = -(uint64_t)v16;
      int v29 = 1 - v16;
      v30 = v24;
      LODWORD(v31) = v16 - 1;
      do
      {
        if (v28 >= -1) {
          int v32 = v29;
        }
        else {
          int v32 = v31;
        }
        *v30++ = v40[v32 - 2] * v26;
        uint64_t v31 = (v31 - 1);
        ++v29;
        ++v28;
        --v27;
      }
      while (v27);
      ++v20;
      v24 = (double *)((char *)v24 + ((16 * (((unint64_t)(v21 - 2) >> 1) & 0x7FFFFFFF)) | 8));
    }
    while (v20 != v23);
    v33 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v38, (v22 * v22), v31);
    switch(v21)
    {
      case 4:
        v34 = @"CIConvolution3X3";
        break;
      case 6:
        v34 = @"CIConvolution5X5";
        break;
      case 8:
        v34 = @"CIConvolution7X7";
        break;
      default:
        return blurImage(self->inputImage, v6, v6);
    }
    inputImage = self->inputImage;
    v36[0] = @"inputWeights";
    v36[1] = @"inputBias";
    v37[0] = v33;
    v37[1] = &unk_1EE4A8CB0;
    return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", v34, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2]);
  }
  v3 = self->inputImage;

  return v3;
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