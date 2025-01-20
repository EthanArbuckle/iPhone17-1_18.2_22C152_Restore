@interface CIKaleidoscope
+ (id)customAttributes;
- (CGRect)_outputExtent;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputAngle;
- (NSNumber)inputCount;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAngle:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputCount:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIKaleidoscope

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_kaleida];
}

- (CGRect)_outputExtent
{
  [(NSNumber *)self->inputAngle floatValue];
  float v4 = v3;
  float v5 = cosf(v3);
  int v6 = 2 * [(NSNumber *)self->inputCount intValue];
  if (v6 <= 2) {
    int v6 = 2;
  }
  float v7 = 6.28318531 / (float)v6;
  float v8 = v4 + v7;
  float v9 = sinf(v4 + v7);
  [(CIImage *)self->inputImage extent];
  double x = v56.origin.x;
  double y = v56.origin.y;
  double width = v56.size.width;
  double height = v56.size.height;
  v14 = (double *)MEMORY[0x1E4F1DB10];
  if (CGRectEqualToRect(v56, *MEMORY[0x1E4F1DB10]))
  {
    double v15 = *v14;
    double v16 = v14[1];
    double v17 = v14[2];
    double v18 = v14[3];
  }
  else
  {
    float v50 = v9;
    float v19 = cosf(v8);
    float v20 = sinf(v4);
    float v21 = v5;
    float v22 = v20;
    [(CIVector *)self->inputCenter X];
    float v24 = v23;
    [(CIVector *)self->inputCenter Y];
    float v26 = v25;
    float v27 = -v19;
    double v48 = y;
    double v28 = y + height;
    float v29 = v24;
    float v30 = v26;
    double v31 = x + width;
    float v32 = x;
    float v33 = v28;
    float v54 = v33;
    float v55 = v32;
    float v34 = v31;
    float v52 = v33;
    float v53 = v34;
    float v35 = -v22;
    float v51 = v21;
    float v49 = v27;
    if (ClipSegmentToHalfplane(v32, v33, v34, v33, v29, v30, v35, v21, &v55, &v54, &v53, &v52))
    {
      BOOL v36 = ClipSegmentToHalfplane(v55, v54, v53, v52, v29, v30, v50, v27, &v55, &v54, &v53, &v52);
      float v37 = 0.0;
      float v38 = v29;
      double v39 = v48;
      if (v36)
      {
        float v37 = fmaxf(sqrtf((float)((float)(v54 - v30) * (float)(v54 - v30)) + (float)((float)(v55 - v29) * (float)(v55 - v29))), 0.0);
        float v40 = sqrtf((float)((float)(v52 - v30) * (float)(v52 - v30)) + (float)((float)(v53 - v29) * (float)(v53 - v29)));
        if (v40 > v37) {
          float v37 = v40;
        }
      }
    }
    else
    {
      float v37 = 0.0;
      float v38 = v29;
      double v39 = v48;
    }
    float v54 = v33;
    float v55 = v34;
    float v41 = v39;
    float v52 = v41;
    float v53 = v34;
    if (ClipSegmentToHalfplane(v34, v33, v34, v41, v38, v30, v35, v51, &v55, &v54, &v53, &v52)
      && ClipSegmentToHalfplane(v55, v54, v53, v52, v38, v30, v50, v49, &v55, &v54, &v53, &v52))
    {
      float v42 = sqrtf((float)((float)(v54 - v30) * (float)(v54 - v30)) + (float)((float)(v55 - v38) * (float)(v55 - v38)));
      if (v42 > v37) {
        float v37 = v42;
      }
      float v43 = sqrtf((float)((float)(v52 - v30) * (float)(v52 - v30)) + (float)((float)(v53 - v38) * (float)(v53 - v38)));
      if (v43 > v37) {
        float v37 = v43;
      }
    }
    float v54 = v41;
    float v55 = v34;
    float v52 = v41;
    float v53 = v32;
    if (ClipSegmentToHalfplane(v34, v41, v32, v41, v38, v30, v35, v51, &v55, &v54, &v53, &v52)
      && ClipSegmentToHalfplane(v55, v54, v53, v52, v38, v30, v50, v49, &v55, &v54, &v53, &v52))
    {
      float v44 = sqrtf((float)((float)(v54 - v30) * (float)(v54 - v30)) + (float)((float)(v55 - v38) * (float)(v55 - v38)));
      if (v44 > v37) {
        float v37 = v44;
      }
      float v45 = sqrtf((float)((float)(v52 - v30) * (float)(v52 - v30)) + (float)((float)(v53 - v38) * (float)(v53 - v38)));
      if (v45 > v37) {
        float v37 = v45;
      }
    }
    float v54 = v41;
    float v55 = v32;
    float v52 = v33;
    float v53 = v32;
    if (ClipSegmentToHalfplane(v32, v41, v32, v33, v38, v30, v35, v51, &v55, &v54, &v53, &v52)
      && ClipSegmentToHalfplane(v55, v54, v53, v52, v38, v30, v50, v49, &v55, &v54, &v53, &v52))
    {
      float v46 = sqrtf((float)((float)(v54 - v30) * (float)(v54 - v30)) + (float)((float)(v55 - v38) * (float)(v55 - v38)));
      if (v46 > v37) {
        float v37 = v46;
      }
      float v47 = sqrtf((float)((float)(v52 - v30) * (float)(v52 - v30)) + (float)((float)(v53 - v38) * (float)(v53 - v38)));
      if (v47 > v37) {
        float v37 = v47;
      }
    }
    double v15 = (float)(v38 - v37);
    double v16 = (float)(v30 - v37);
    double v17 = v37 + v37;
    double v18 = v17;
  }
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)outputImage
{
  v36[3] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(CIVector *)self->inputCenter X];
  float v4 = v3;
  [(CIVector *)self->inputCenter Y];
  float v6 = v5;
  [(NSNumber *)self->inputAngle floatValue];
  float v8 = v7;
  __float2 v9 = __sincosf_stret(v7);
  [(CIImage *)self->inputImage extent];
  if (!CGRectIsInfinite(v37))
  {
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
    [(CIImage *)self->inputImage extent];
  }
  double cosval = v9.__cosval;
  double v11 = (float)-v9.__sinval;
  v12 = +[CIVector vectorWithX:cosval Y:v9.__sinval Z:v11 W:cosval];
  v13 = +[CIVector vectorWithX:cosval Y:v11 Z:v9.__sinval W:cosval];
  [(NSNumber *)self->inputCount floatValue];
  float v15 = fmax(floorf(v14), 1.0);
  double v16 = v15;
  *(float *)&double cosval = 6.28318531 / v16;
  float v17 = v16 / 6.28318531;
  [(CIVector *)self->inputCenter X];
  double v19 = v18;
  [(CIVector *)self->inputCenter Y];
  float v21 = +[CIVector vectorWithX:v19 Y:v20 Z:*(float *)&cosval W:v17];
  int v22 = 2 * [(NSNumber *)self->inputCount intValue];
  if (v22 <= 2) {
    int v23 = 2;
  }
  else {
    int v23 = v22;
  }
  [(CIKaleidoscope *)self _outputExtent];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  id v32 = [(CIKaleidoscope *)self _kernel];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __29__CIKaleidoscope_outputImage__block_invoke;
  v35[3] = &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v35[4] = __PAIR64__(LODWORD(v4), v23);
  v35[5] = __PAIR64__(LODWORD(v8), LODWORD(v6));
  inputImage = self->inputImage;
  v36[0] = v21;
  v36[1] = v12;
  v36[2] = v13;
  return (id)objc_msgSend(v32, "applyWithExtent:roiCallback:inputImage:arguments:", v35, inputImage, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v36, 3, MEMORY[0x1E4F143A8], 3221225472, __29__CIKaleidoscope_outputImage__block_invoke, &__block_descriptor_48_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, __PAIR64__(LODWORD(v4), v23), __PAIR64__(LODWORD(v8), LODWORD(v6))), v25, v27, v29, v31);
}

double __29__CIKaleidoscope_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v11 = *(float *)(a1 + 36);
  float v10 = *(float *)(a1 + 40);
  float v12 = *(float *)(a1 + 44);
  __float2 v13 = __sincosf_stret(v12);
  float v14 = 6.28318531 / (float)*(int *)(a1 + 32);
  float v43 = v12;
  float v15 = v12 + v14;
  __float2 v16 = __sincosf_stret(v15);
  float v17 = a2 - v11;
  float v18 = a3 + a5 - v10;
  float v19 = v18 * v18;
  float v20 = sqrtf(v19 + (float)(v17 * v17));
  float v21 = a2 + a4 - v11;
  float v22 = sqrtf(v19 + (float)(v21 * v21));
  if (v22 <= v20) {
    float v22 = v20;
  }
  float v23 = a3 - v10;
  float v24 = v23 * v23;
  float v25 = sqrtf(v24 + (float)(v17 * v17));
  if (v25 > v22) {
    float v22 = v25;
  }
  float v26 = sqrtf(v24 + (float)(v21 * v21));
  if (v26 <= v22) {
    float v27 = v22;
  }
  else {
    float v27 = v26;
  }
  float v28 = v11 + (float)(v13.__cosval * v27);
  float v29 = v10 + (float)(v13.__sinval * v27);
  if (v28 >= v11)
  {
    float v30 = v11;
    float v31 = v11;
    if (v28 > v11)
    {
      float v30 = v11;
      float v31 = v11 + (float)(v13.__cosval * v27);
    }
  }
  else
  {
    float v30 = v11 + (float)(v13.__cosval * v27);
    float v31 = v11;
  }
  if (v29 >= v10)
  {
    float v32 = v10;
    float v33 = v10;
    if (v29 > v10)
    {
      float v32 = v10;
      float v33 = v10 + (float)(v13.__sinval * v27);
    }
  }
  else
  {
    float v32 = v10 + (float)(v13.__sinval * v27);
    float v33 = v10;
  }
  float v34 = v11 + (float)(v16.__cosval * v27);
  float v35 = v10 + (float)(v16.__sinval * v27);
  if (v34 >= v30)
  {
    if (v34 > v31) {
      goto LABEL_20;
    }
  }
  else
  {
    float v30 = v11 + (float)(v16.__cosval * v27);
  }
  float v34 = v31;
LABEL_20:
  if (v35 >= v32)
  {
    if (v35 > v33) {
      goto LABEL_24;
    }
  }
  else
  {
    float v32 = v10 + (float)(v16.__sinval * v27);
  }
  float v35 = v33;
LABEL_24:
  signed int v36 = vcvtmd_s64_f64(v43 / 1.57079633);
  signed int v37 = vcvtmd_s64_f64(v15 / 1.57079633);
  if (v36 < v37)
  {
    float v38 = v10 - v27;
    float v39 = v11 - v27;
    float v40 = v10 + v27;
    float v41 = v11 + v27;
    do
    {
      switch(++v36 & 3)
      {
        case 1:
          if (v40 > v35) {
            float v35 = v40;
          }
          break;
        case 2:
          if (v39 < v30) {
            float v30 = v39;
          }
          break;
        case 3:
          if (v38 < v32) {
            float v32 = v38;
          }
          break;
        default:
          if (v41 > v34) {
            float v34 = v41;
          }
          break;
      }
    }
    while (v37 != v36);
  }
  return v30 + -1.0;
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryTileEffect";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputCount";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A8F70;
  v4[1] = &unk_1EE4A8F70;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8F80;
  v4[3] = &unk_1EE4A8F90;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeScalar";
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

- (NSNumber)inputCount
{
  return self->inputCount;
}

- (void)setInputCount:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
}

@end