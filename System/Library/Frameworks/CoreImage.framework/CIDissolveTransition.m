@interface CIDissolveTransition
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputTargetImage;
- (NSNumber)inputTime;
- (id)_fadeKernel;
- (id)_kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputTargetImage:(id)a3;
- (void)setInputTime:(id)a3;
@end

@implementation CIDissolveTransition

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryTransition";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryInterlaced";
  v5[4] = @"CICategoryNonSquarePixels";
  v5[5] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  v7[1] = @"6";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.4";
  v6[3] = @"inputTime";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A85B0;
  v4[1] = &unk_1EE4A85B0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A85C0;
  v4[3] = &unk_1EE4A85B0;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeTime";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_disolve];
}

- (id)_fadeKernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_fadeDissolve];
}

- (id)outputImage
{
  v53[3] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputTime floatValue];
  float v4 = v3;
  if (v3 <= 0.01)
  {
    uint64_t v27 = 80;
LABEL_8:
    id v28 = *(id *)((char *)&self->super.super.isa + v27);
    return v28;
  }
  if (v3 >= 0.99)
  {
    uint64_t v27 = 88;
    goto LABEL_8;
  }
  inputTargetImage = self->inputTargetImage;
  if (self->inputImage)
  {
    if (inputTargetImage)
    {
      id v6 = [(CIDissolveTransition *)self _kernel];
      [(CIImage *)self->inputImage extent];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [(CIImage *)self->inputTargetImage extent];
      v57.origin.CGFloat x = v15;
      v57.origin.CGFloat y = v16;
      v57.size.CGFloat width = v17;
      v57.size.CGFloat height = v18;
      v55.origin.CGFloat x = v8;
      v55.origin.CGFloat y = v10;
      v55.size.CGFloat width = v12;
      v55.size.CGFloat height = v14;
      CGRect v56 = CGRectUnion(v55, v57);
      CGFloat x = v56.origin.x;
      CGFloat y = v56.origin.y;
      CGFloat width = v56.size.width;
      CGFloat height = v56.size.height;
      inputImage = self->inputImage;
      v53[0] = self->inputTargetImage;
      v53[1] = inputImage;
      v53[2] = self->inputTime;
      v24 = (void *)MEMORY[0x1E4F1C978];
      v25 = (CIImage **)v53;
      uint64_t v26 = 3;
    }
    else
    {
      id v6 = [(CIDissolveTransition *)self _fadeKernel];
      [(CIImage *)self->inputImage extent];
      CGFloat x = v45;
      CGFloat y = v46;
      CGFloat width = v47;
      CGFloat height = v48;
      inputTime = self->inputTime;
      v50 = self->inputImage;
      v51 = inputTime;
      v24 = (void *)MEMORY[0x1E4F1C978];
      v25 = &v50;
      uint64_t v26 = 2;
    }
    uint64_t v39 = objc_msgSend(v24, "arrayWithObjects:count:", v25, v26, v50, v51);
    v40 = v6;
    double v41 = x;
    double v42 = y;
    double v43 = width;
    double v44 = height;
    return (id)objc_msgSend(v40, "applyWithExtent:arguments:", v39, v41, v42, v43, v44);
  }
  if (inputTargetImage)
  {
    id v30 = [(CIDissolveTransition *)self _fadeKernel];
    [(CIImage *)self->inputTargetImage extent];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    v52[0] = self->inputTargetImage;
    v52[1] = [NSNumber numberWithDouble:1.0 - v4];
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
    v40 = v30;
    double v41 = v32;
    double v42 = v34;
    double v43 = v36;
    double v44 = v38;
    return (id)objc_msgSend(v40, "applyWithExtent:arguments:", v39, v41, v42, v43, v44);
  }
  return 0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
}

@end