@interface CIHexagonalPixellate
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputCenter;
- (NSNumber)inputScale;
- (id)_CIHexagonalPixellate;
- (id)outputImage;
- (void)setInputCenter:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CIHexagonalPixellate

- (id)_CIHexagonalPixellate
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_hexagonalPixellate];
}

- (id)outputImage
{
  v15[5] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputScale floatValue];
  float v4 = v3;
  double v5 = v3;
  double v6 = (float)(v3 * 1.7321) * 0.5;
  v7 = +[CIVector vectorWithX:1.0 / v3 Y:1.0 / v6];
  v8 = +[CIVector vectorWithX:v5 Y:v6];
  id v9 = [(CIHexagonalPixellate *)self _CIHexagonalPixellate];
  [(CIImage *)self->inputImage extent];
  CGRect v17 = CGRectInset(v16, (float)-v4, (float)-v4);
  double x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;
  LODWORD(v17.origin.x) = 1058262330;
  v15[4] = objc_msgSend(NSNumber, "numberWithFloat:", v17.origin.x, self->inputImage, self->inputCenter, v7, v8);
  return (id)objc_msgSend(v9, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_54, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 5), x, y, width, height);
}

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryStylize";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryHighDynamicRange";
  v5[4] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  v7[1] = @"9";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.5";
  v6[3] = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeDefault";
  v4[2] = &unk_1EE4A9780;
  v4[3] = &unk_1EE4A9790;
  v3[4] = @"CIAttributeIdentity";
  v3[5] = @"CIAttributeType";
  v4[0] = &unk_1EE4A9770;
  v4[1] = &unk_1EE4A9770;
  v4[4] = &unk_1EE4A9770;
  v4[5] = @"CIAttributeTypeDistance";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
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

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
}

@end