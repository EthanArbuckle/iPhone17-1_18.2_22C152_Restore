@interface CIGlassDistortion
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputTexture;
- (CIVector)inputCenter;
- (NSNumber)inputScale;
- (id)_kernel;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputTexture:(id)a3;
@end

@implementation CIGlassDistortion

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryDistortionEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v11[1] = @"8";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.4";
  v10[3] = @"inputTexture";
  v7 = @"CIAttributeType";
  v8 = @"CIAttributeTypeImage";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[4] = @"inputCenter";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v6[1] = @"CIAttributeTypePosition";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v10[5] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A8CE0;
  v4[1] = &unk_1EE4A8CF0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A8D00;
  v4[3] = &unk_1EE4A8D10;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A8CE0;
  v4[5] = @"CIAttributeTypeDistance";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_glassDistort];
}

- (id)outputImage
{
  v29[6] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputScale floatValue];
  if (v3 >= 0.001 && self->inputTexture)
  {
    [(CIVector *)self->inputCenter X];
    float v5 = v4;
    [(CIVector *)self->inputCenter Y];
    float v7 = v6;
    [(CIImage *)self->inputTexture extent];
    float v9 = v8 + -1.0;
    float v11 = v10 + -1.0;
    v12 = +[CIVector vectorWithX:(float)(1.0 / v9) Y:(float)(1.0 / v9)];
    v13 = +[CIVector vectorWithX:v9 Y:v11];
    v14 = +[CIVector vectorWithX:(float)((float)(0.0 - v5) / v9) Y:(float)((float)(0.0 - v7) / v11)];
    v15 = +[CIVector vectorWithX:(float)((float)(1.0 - v5) / v9) Y:(float)((float)(0.0 - v7) / v11)];
    v16 = +[CIVector vectorWithX:(float)((float)(0.0 - v5) / v9) Y:(float)((float)(1.0 - v7) / v11)];
    v29[0] = self->inputScale;
    v29[1] = v12;
    v29[2] = v14;
    v29[3] = v15;
    v29[4] = v16;
    v29[5] = v13;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];
    id v26 = [(CIGlassDistortion *)self _kernel];
    [(CIImage *)self->inputImage extent];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __32__CIGlassDistortion_outputImage__block_invoke;
    v27[3] = &unk_1E57716D0;
    inputImage = self->inputImage;
    inputTexture = self->inputTexture;
    v27[4] = v17;
    v28[0] = inputImage;
    v28[1] = inputTexture;
    v28[2] = v12;
    v28[3] = v14;
    v28[4] = v15;
    v28[5] = v16;
    v28[6] = v13;
    v28[7] = self->inputScale;
    return (id)objc_msgSend(v26, "applyWithExtent:roiCallback:arguments:", v27, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 8), v20, v21, v22, v23);
  }
  else
  {
    v25 = self->inputImage;
    return v25;
  }
}

void __32__CIGlassDistortion_outputImage__block_invoke(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  float v11 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "floatValue");
  if (a2)
  {
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 1), "X");
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 1), "Y");
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 5), "X");
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 5), "Y");
    v14.origin.x = a3;
    v14.origin.y = a4;
    v14.size.width = a5;
    v14.size.height = a6;
    CGRectGetMinX(v14);
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 2), "X");
    v15.origin.x = a3;
    v15.origin.y = a4;
    v15.size.width = a5;
    v15.size.height = a6;
    CGRectGetMinY(v15);
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 2), "Y");
    v16.origin.x = a3;
    v16.origin.y = a4;
    v16.size.width = a5;
    v16.size.height = a6;
    CGRectGetMaxX(v16);
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 3), "X");
    v17.origin.x = a3;
    v17.origin.y = a4;
    v17.size.width = a5;
    v17.size.height = a6;
    CGRectGetMaxY(v17);
    objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 4), "Y");
  }
  else
  {
    CGFloat v13 = (float)(v12 * -0.5);
    v18.origin.x = a3;
    v18.origin.y = a4;
    v18.size.width = a5;
    v18.size.height = a6;
    CGRectInset(v18, v13, v13);
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputTexture
{
  return self->inputTexture;
}

- (void)setInputTexture:(id)a3
{
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end