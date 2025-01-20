@interface CICheapMorphology
+ (id)customAttributes;
- (CGRect)regionOf:(id)a3 destRect:(CGRect)a4 Offset:(float)a5;
- (id)outputImage;
@end

@implementation CICheapMorphology

- (CGRect)regionOf:(id)a3 destRect:(CGRect)a4 Offset:(float)a5
{
  return CGRectInset(a4, (float)-a5, (float)-a5);
}

- (id)outputImage
{
  v33[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->super.inputImage;
  if (!inputImage) {
    return 0;
  }
  [(CIImage *)inputImage extent];
  if (CGRectIsEmpty(v35)) {
    return 0;
  }
  int v6 = [(NSNumber *)self->super.inputRadius intValue];
  float v7 = fabsf((float)v6);
  if (v7 >= 1.0)
  {
    int v9 = v6;
    if (v7 >= 5.0)
    {
      if (v6 >= 0) {
        v18 = &CI::_min3x3;
      }
      else {
        v18 = &CI::_max3x3;
      }
      v19 = +[CIKernel kernelWithInternalRepresentation:v18];
      v4 = self->super.inputImage;
      float v20 = 1.0;
      float v21 = (float)(floorf(v7) * 2.0) + 1.0;
      if (v21 > 1.0)
      {
        v22 = v19;
        do
        {
          float v23 = v20 * 3.0;
          float v24 = (float)((float)(v20 * 3.0) - v21) * 0.5;
          if ((float)(v20 * 3.0) < v21) {
            float v24 = 0.0;
          }
          float v25 = v20 - v24;
          v26 = +[CIVector vectorWithX:(float)(v20 - v24) Y:(float)(v20 - v24) * 0.707106781 Z:(float)-(float)(v20 - v24) * 0.707106781 W:0.0];
          v27 = [(CIImage *)v4 imageBySamplingNearest];
          [(CIImage *)v27 extent];
          CGRect v39 = CGRectInset(v38, (float)-v25, (float)-v25);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __32__CICheapMorphology_outputImage__block_invoke_2;
          v28[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          float v29 = v25;
          v32[0] = v27;
          v32[1] = v26;
          v4 = -[CIKernel applyWithExtent:roiCallback:arguments:](v22, "applyWithExtent:roiCallback:arguments:", v28, [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2], v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
          float v20 = v23;
        }
        while (v23 < v21);
      }
    }
    else
    {
      v10 = [(CIImage *)self->super.inputImage imageBySamplingNearest];
      if (v9 >= 0) {
        v11 = &CI::_minDisk;
      }
      else {
        v11 = &CI::_maxDisk;
      }
      v12 = +[CIKernel kernelWithInternalRepresentation:v11];
      float v13 = floorf(v7);
      [(CIImage *)v10 extent];
      CGRect v37 = CGRectInset(v36, (float)-v13, (float)-v13);
      double x = v37.origin.x;
      double y = v37.origin.y;
      double width = v37.size.width;
      double height = v37.size.height;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __32__CICheapMorphology_outputImage__block_invoke;
      v30[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
      float v31 = v13;
      v33[0] = v10;
      v33[1] = [NSNumber numberWithFloat:COERCE_DOUBLE((unint64_t)LODWORD(v7))];
      return -[CIKernel applyWithExtent:roiCallback:arguments:](v12, "applyWithExtent:roiCallback:arguments:", v30, [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2], x, y, width, height);
    }
    return v4;
  }
  v8 = self->super.inputImage;

  return v8;
}

double __32__CICheapMorphology_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

double __32__CICheapMorphology_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
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
  v5[4] = @"CICategoryApplePrivate";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"10";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.11";
  v6[3] = @"inputRadius";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = @"CIAttributeTypeDistance";
  v4[1] = &unk_1EE4A9430;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9440;
  v4[3] = &unk_1EE4A9450;
  v3[4] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4A9460;
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

@end