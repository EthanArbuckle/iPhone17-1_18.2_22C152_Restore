@interface CIVibrance
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputAmount;
- (id)_initFromProperties:(id)a3;
- (id)_kernelNeg;
- (id)_kernelPos;
- (id)_outputProperties;
- (id)outputImage;
- (void)setInputAmount:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIVibrance

+ (id)customAttributes
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CIAttributeFilterCategories";
  v5[0] = @"CICategoryColorAdjustment";
  v5[1] = @"CICategoryVideo";
  v5[2] = @"CICategoryStillImage";
  v5[3] = @"CICategoryHighDynamicRange";
  v5[4] = @"CICategoryInterlaced";
  v5[5] = @"CICategoryNonSquarePixels";
  v5[6] = @"CICategoryBuiltIn";
  v7[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:7];
  v7[1] = @"5";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.7";
  v6[3] = @"inputAmount";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4AA170;
  v4[1] = &unk_1EE4AA180;
  v3[2] = @"CIAttributeMin";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4AA170;
  v4[3] = &unk_1EE4AA180;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeIdentity";
  v4[4] = &unk_1EE4AA190;
  v4[5] = &unk_1EE4AA190;
  v3[6] = @"CIAttributeType";
  v4[6] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputAmount doubleValue];
  return fabs(v2) <= 0.001;
}

- (id)_kernelNeg
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_vibrance_neg];
}

- (id)_kernelPos
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_vibrance_pos];
}

- (id)outputImage
{
  v26[2] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  [(NSNumber *)self->inputAmount doubleValue];
  double v4 = fmin(fmax(v3, -1.0), 1.0);
  inputImage = self->inputImage;
  if (fabs(v4) <= 0.001)
  {
    v19 = inputImage;
    return v19;
  }
  else
  {
    v6 = [(CIImage *)inputImage imageByUnpremultiplyingAlpha];
    if (v4 >= 0.0)
    {
      id v7 = [(CIVibrance *)self _kernelPos];
      v20 = +[CIVector vectorWithX:v4 * 3.0 Y:v4 * -1.5 + v4 * -4.5 * v4 Z:v4 * -0.5 + v4 * (v4 * 4.5) * v4 W:v4 * (v4 * 4.5) + v4 * (v4 * -4.5) * v4 - v4];
      [(CIImage *)v6 extent];
      double v9 = v21;
      double v11 = v22;
      double v13 = v23;
      double v15 = v24;
      v25[0] = v6;
      v25[1] = v20;
      v17 = v25;
    }
    else
    {
      id v7 = [(CIVibrance *)self _kernelNeg];
      [(CIImage *)v6 extent];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      inputAmount = self->inputAmount;
      v26[0] = v6;
      v26[1] = inputAmount;
      v17 = v26;
    }
    return (id)objc_msgSend((id)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 2), v9, v11, v13, v15), "imageByPremultiplyingAlpha");
  }
}

- (id)_outputProperties
{
  v5[3] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputAmount doubleValue];
  double v3 = fmin(fmax(v2, -1.0), 1.0);
  if (fabs(v3) <= 0.001) {
    return 0;
  }
  v5[0] = metadataPropertyWithBool();
  v5[1] = metadataPropertyWithDouble(v3 * 50.0);
  v5[2] = metadataPropertyWithDouble(v3);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
}

- (id)_initFromProperties:(id)a3
{
  double v5 = 0.0;
  if (metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"Vibrance", &v5))
  {
    -[CIVibrance setInputAmount:](self, "setInputAmount:", [NSNumber numberWithDouble:v5]);
  }
  else
  {

    return 0;
  }
  return self;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(id)a3
{
}

@end