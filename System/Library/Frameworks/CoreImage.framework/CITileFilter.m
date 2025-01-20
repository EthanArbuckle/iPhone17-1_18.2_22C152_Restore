@interface CITileFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputAngle;
- (NSNumber)inputWidth;
- (id)_croppedCenterPixelImage;
- (id)_kernel;
- (void)setInputAngle:(id)a3;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputWidth:(id)a3;
@end

@implementation CITileFilter

+ (id)customAttributes
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"CIAttributeFilterCategories";
  v9[0] = @"CICategoryTileEffect";
  v9[1] = @"CICategoryVideo";
  v9[2] = @"CICategoryStillImage";
  v9[3] = @"CICategoryBuiltIn";
  v11[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v11[1] = @"6";
  v10[1] = @"CIAttributeFilterAvailable_iOS";
  v10[2] = @"CIAttributeFilterAvailable_Mac";
  v11[2] = @"10.5";
  v10[3] = @"inputCenter";
  v7[0] = @"CIAttributeDefault";
  v7[1] = @"CIAttributeType";
  v8[0] = +[CIVector vectorWithX:150.0 Y:150.0];
  v8[1] = @"CIAttributeTypePosition";
  v11[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v10[4] = @"inputAngle";
  v5[0] = @"CIAttributeSliderMin";
  v5[1] = @"CIAttributeSliderMax";
  v6[0] = &unk_1EE4A9990;
  v6[1] = &unk_1EE4A99A0;
  v5[2] = @"CIAttributeDefault";
  v5[3] = @"CIAttributeIdentity";
  v6[2] = &unk_1EE4A99B0;
  v6[3] = &unk_1EE4A99B0;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeAngle";
  v11[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v10[5] = @"inputWidth";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4A99B0;
  v4[1] = &unk_1EE4A99C0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A99D0;
  v4[3] = &unk_1EE4A99E0;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4A99E0;
  v4[5] = @"CIAttributeTypeDistance";
  v11[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
}

- (id)_kernel
{
  return 0;
}

- (id)_croppedCenterPixelImage
{
  [(CIVector *)self->inputCenter X];
  float64_t v8 = v3;
  [(CIVector *)self->inputCenter Y];
  v4.f64[0] = v8;
  v4.f64[1] = v5;
  *(float32x2_t *)&v4.f64[0] = vrndm_f32(vcvt_f32_f64(v4));
  v6 = -[CIImage imageByCroppingToRect:](self->inputImage, "imageByCroppingToRect:", *(float *)v4.f64, *((float *)v4.f64 + 1), 1.0, 1.0);

  return [(CIImage *)v6 imageByClampingToExtent];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
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

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
}

@end