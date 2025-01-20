@interface CUIScaleClampFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputScale;
- (id)_kernel;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
@end

@implementation CUIScaleClampFilter

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_scaleClamp];
}

+ (id)customAttributes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"inputScale";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4AA2F0;
  v4[1] = &unk_1EE4AA2F0;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4AA300;
  v4[3] = &unk_1EE4AA310;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4AA320;
  v4[5] = @"CIAttributeTypeScalar";
  v6[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
}

- (id)outputImage
{
  v15[2] = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->inputScale doubleValue];
  id result = 0;
  if (self->inputImage)
  {
    double v5 = fmin(fmax(v3, 0.01), 100.0);
    if (v5 != 0.0)
    {
      id v6 = [(CUIScaleClampFilter *)self _kernel];
      [(CIImage *)self->inputImage extent];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      v15[0] = self->inputImage;
      v15[1] = [NSNumber numberWithDouble:v5];
      return (id)objc_msgSend(v6, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 2), v8, v10, v12, v14);
    }
  }
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
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