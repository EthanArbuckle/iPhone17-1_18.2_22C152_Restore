@interface CIFalseColor
+ (id)customAttributes;
- (CIColor)inputColor0;
- (CIColor)inputColor1;
- (CIImage)inputImage;
- (id)_kernel;
- (id)outputImage;
- (void)setInputColor0:(id)a3;
- (void)setInputColor1:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIFalseColor

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_falseColor];
}

- (id)outputImage
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->inputImage || !self->inputColor0 && !self->inputColor1) {
    return 0;
  }
  v3 = +[CIColor clearColor];
  v4 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
  id v5 = [(CIFalseColor *)self _kernel];
  [(CIImage *)v4 extent];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  inputColor0 = self->inputColor0;
  if (!inputColor0) {
    inputColor0 = v3;
  }
  inputColor1 = self->inputColor1;
  v19 = v4;
  v20 = inputColor0;
  if (inputColor1) {
    v16 = inputColor1;
  }
  else {
    v16 = v3;
  }
  v21 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:3];
  return (id)objc_msgSend(v5, "applyWithExtent:arguments:", v17, v7, v9, v11, v13, v19, v20);
}

+ (id)customAttributes
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"CIAttributeFilterCategories";
  v7[0] = @"CICategoryColorEffect";
  v7[1] = @"CICategoryVideo";
  v7[2] = @"CICategoryInterlaced";
  v7[3] = @"CICategoryNonSquarePixels";
  v7[4] = @"CICategoryStillImage";
  v7[5] = @"CICategoryHighDynamicRange";
  v7[6] = @"CICategoryBuiltIn";
  v9[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
  v9[1] = @"5";
  v8[1] = @"CIAttributeFilterAvailable_iOS";
  v8[2] = @"CIAttributeFilterAvailable_Mac";
  v9[2] = @"10.4";
  v8[3] = @"inputColor0";
  v5[0] = @"CIAttributeDefault";
  v5[1] = @"CIAttributeType";
  v6[0] = +[CIColor colorWithRed:0.3 green:0.0 blue:0.0];
  v6[1] = @"CIAttributeTypeColor";
  v9[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v8[4] = @"inputColor1";
  v3[1] = @"CIAttributeType";
  v4[0] = +[CIColor colorWithRed:1.0, 0.9, 0.8, @"CIAttributeDefault" green blue];
  v4[1] = @"CIAttributeTypeColor";
  v9[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIColor)inputColor0
{
  return self->inputColor0;
}

- (void)setInputColor0:(id)a3
{
}

- (CIColor)inputColor1
{
  return self->inputColor1;
}

- (void)setInputColor1:(id)a3
{
}

@end