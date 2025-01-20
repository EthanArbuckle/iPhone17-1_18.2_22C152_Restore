@interface CIMix
+ (id)customAttributes;
- (CIImage)inputBackgroundImage;
- (CIImage)inputImage;
- (NSNumber)inputAmount;
- (id)_kernel;
- (id)outputImage;
- (void)setInputAmount:(id)a3;
- (void)setInputBackgroundImage:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIMix

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
  v7[1] = @"12";
  v6[1] = @"CIAttributeFilterAvailable_iOS";
  v6[2] = @"CIAttributeFilterAvailable_Mac";
  v7[2] = @"10.14";
  v6[3] = @"inputAmount";
  v3[0] = @"CIAttributeSliderMin";
  v3[1] = @"CIAttributeSliderMax";
  v4[0] = &unk_1EE4A7CE0;
  v4[1] = &unk_1EE4A7CF0;
  v3[2] = @"CIAttributeDefault";
  v3[3] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4A7CF0;
  v4[3] = &unk_1EE4A7CF0;
  v3[4] = @"CIAttributeType";
  v4[4] = @"CIAttributeTypeScalar";
  v7[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_mix];
}

- (id)outputImage
{
  v28[3] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage && !self->inputBackgroundImage) {
    return 0;
  }
  [(CIImage *)inputImage extent];
  if (CGRectIsEmpty(v30) && ([(CIImage *)self->inputBackgroundImage extent], CGRectIsEmpty(v31)))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    [(NSNumber *)self->inputAmount floatValue];
    float v6 = fmaxf(v5, 0.0);
    v7 = self->inputImage;
    if (!v7) {
      v7 = +[CIImage emptyImage];
    }
    float v8 = fminf(v6, 1.0);
    inputBackgroundImage = self->inputBackgroundImage;
    if (!inputBackgroundImage) {
      inputBackgroundImage = +[CIImage emptyImage];
    }
    if (v8 == 0.0)
    {
      v10 = inputBackgroundImage;
    }
    else
    {
      if (v8 != 1.0)
      {
        id v11 = [(CIMix *)self _kernel];
        [(CIImage *)v7 extent];
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        [(CIImage *)inputBackgroundImage extent];
        v34.origin.double x = v20;
        v34.origin.double y = v21;
        v34.size.double width = v22;
        v34.size.double height = v23;
        v32.origin.double x = v13;
        v32.origin.double y = v15;
        v32.size.double width = v17;
        v32.size.double height = v19;
        CGRect v33 = CGRectUnion(v32, v34);
        double x = v33.origin.x;
        double y = v33.origin.y;
        double width = v33.size.width;
        double height = v33.size.height;
        *(float *)&v33.origin.double x = v8;
        v28[2] = objc_msgSend(NSNumber, "numberWithFloat:", v33.origin.x, v7, inputBackgroundImage);
        return (id)objc_msgSend(v11, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v28, 3), x, y, width, height);
      }
      v10 = v7;
    }
    return v10;
  }
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputBackgroundImage
{
  return self->inputBackgroundImage;
}

- (void)setInputBackgroundImage:(id)a3
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