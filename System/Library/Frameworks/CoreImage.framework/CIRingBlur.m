@interface CIRingBlur
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputPointCount;
- (NSNumber)inputRadius;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputPointCount:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation CIRingBlur

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryBlur";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryStillImage";
  v7[3] = @"CICategoryBuiltIn";
  v7[4] = @"CICategoryApplePrivate";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  v9[1] = @"11";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.13";
  v8[3] = @"inputRadius";
  v5[0] = @"CIAttributeType";
  v5[1] = @"CIAttributeMin";
  v6[0] = @"CIAttributeTypeDistance";
  v6[1] = &unk_1EE4A83F0;
  v5[2] = @"CIAttributeSliderMin";
  v5[3] = @"CIAttributeSliderMax";
  v6[2] = &unk_1EE4A83F0;
  v6[3] = &unk_1EE4A8400;
  v5[4] = @"CIAttributeDefault";
  v6[4] = &unk_1EE4A8480;
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v8[4] = @"inputPointCount";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeMin";
  v4[0] = @"CIAttributeTypeCount";
  v4[1] = &unk_1EE4A8480;
  v3[2] = @"CIAttributeMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8490;
  v4[3] = &unk_1EE4A84A0;
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (id)outputImage
{
  v58[2] = *MEMORY[0x1E4F143B8];
  [(CIImage *)self->inputImage extent];
  if (CGRectIsEmpty(v60))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    [(NSNumber *)self->inputRadius floatValue];
    float v5 = v4;
    if (v4 <= 0.5)
    {
      v19 = self->inputImage;
      return v19;
    }
    else
    {
      double v6 = v4;
      [(NSNumber *)self->inputPointCount floatValue];
      unsigned int v8 = (int)v7;
      inputImage = self->inputImage;
      if ((int)v7 > 8)
      {
        if (v8 > 0x10)
        {
          if (v8 > 0x18)
          {
            float v30 = v6 * 0.995184727;
            float v46 = v30;
            float v31 = v6 * 0.0980171403;
            float v41 = v31;
            float v32 = v6 * 0.956940336;
            float v38 = v32;
            float v33 = v6 * 0.290284677;
            float v34 = v6 * 0.881921264;
            float v43 = v34;
            float v35 = v6 * 0.471396737;
            float v39 = v35;
            float v36 = v6 * 0.773010453;
            float v37 = v6 * 0.634393284;
            v12 = +[CIKernel kernelWithInternalRepresentation:&CI::_ringAvg32];
            [(CIImage *)inputImage extent];
            CGRect v68 = CGRectInset(v67, (float)-v5, (float)-v5);
            double x = v68.origin.x;
            double y = v68.origin.y;
            double width = v68.size.width;
            double height = v68.size.height;
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __25__CIRingBlur_outputImage__block_invoke_4;
            v47[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
            float v48 = v5;
            v55[0] = inputImage;
            v55[1] = +[CIVector vectorWithX:v46 Y:v41 Z:v38 W:v33];
            v55[2] = +[CIVector vectorWithX:v43 Y:v39 Z:v36 W:v37];
            uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:3];
            v18 = v47;
          }
          else
          {
            float v24 = v6 * 0.991444861;
            float v45 = v24;
            float v25 = v6 * 0.130526192;
            float v40 = v25;
            float v26 = v6 * 0.923879533;
            float v27 = v6 * 0.382683432;
            float v28 = v6 * 0.79335334;
            float v42 = v28;
            float v29 = v6 * 0.608761429;
            v12 = +[CIKernel kernelWithInternalRepresentation:&CI::_ringAvg24];
            [(CIImage *)inputImage extent];
            CGRect v66 = CGRectInset(v65, (float)-v5, (float)-v5);
            double x = v66.origin.x;
            double y = v66.origin.y;
            double width = v66.size.width;
            double height = v66.size.height;
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __25__CIRingBlur_outputImage__block_invoke_3;
            v49[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
            float v50 = v5;
            v56[0] = inputImage;
            v56[1] = +[CIVector vectorWithX:v45 Y:v40 Z:v26 W:v27];
            v56[2] = +[CIVector vectorWithX:v42 Y:v29];
            uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
            v18 = v49;
          }
        }
        else
        {
          float v20 = v6 * 0.98078528;
          float v44 = v20;
          float v21 = v6 * 0.195090322;
          float v22 = v6 * 0.831469612;
          float v23 = v6 * 0.555570233;
          v12 = +[CIKernel kernelWithInternalRepresentation:&CI::_ringAvg16];
          [(CIImage *)inputImage extent];
          CGRect v64 = CGRectInset(v63, (float)-v5, (float)-v5);
          double x = v64.origin.x;
          double y = v64.origin.y;
          double width = v64.size.width;
          double height = v64.size.height;
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __25__CIRingBlur_outputImage__block_invoke_2;
          v51[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
          float v52 = v5;
          v57[0] = inputImage;
          v57[1] = +[CIVector vectorWithX:v44 Y:v21 Z:v22 W:v23];
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
          v18 = v51;
        }
      }
      else
      {
        float v10 = v6 * 0.923879533;
        float v11 = v6 * 0.382683432;
        v12 = +[CIKernel kernelWithInternalRepresentation:&CI::_ringAvg8];
        [(CIImage *)inputImage extent];
        CGRect v62 = CGRectInset(v61, (float)-v5, (float)-v5);
        double x = v62.origin.x;
        double y = v62.origin.y;
        double width = v62.size.width;
        double height = v62.size.height;
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __25__CIRingBlur_outputImage__block_invoke;
        v53[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
        float v54 = v5;
        v58[0] = inputImage;
        v58[1] = +[CIVector vectorWithX:v10 Y:v11];
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
        v18 = v53;
      }
      return -[CIKernel applyWithExtent:roiCallback:arguments:](v12, "applyWithExtent:roiCallback:arguments:", v18, v17, x, y, width, height);
    }
  }
}

double __25__CIRingBlur_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

double __25__CIRingBlur_outputImage__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

double __25__CIRingBlur_outputImage__block_invoke_3(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
}

double __25__CIRingBlur_outputImage__block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
  return result;
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

- (NSNumber)inputPointCount
{
  return self->inputPointCount;
}

- (void)setInputPointCount:(id)a3
{
}

@end