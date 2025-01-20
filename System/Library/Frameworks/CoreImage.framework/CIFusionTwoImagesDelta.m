@interface CIFusionTwoImagesDelta
- (CIImage)inputImage;
- (CIImage)inputSecondaryImage;
- (CIVector)inputAdditive;
- (CIVector)inputSubtractive;
- (NSNumber)inputApertureScaling;
- (NSNumber)inputMaxBlur;
- (NSNumber)inputProtectStrength;
- (id)kernel;
- (id)outputImage;
- (void)setInputAdditive:(id)a3;
- (void)setInputApertureScaling:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMaxBlur:(id)a3;
- (void)setInputProtectStrength:(id)a3;
- (void)setInputSecondaryImage:(id)a3;
- (void)setInputSubtractive:(id)a3;
@end

@implementation CIFusionTwoImagesDelta

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_fusionTwoImages];
}

- (id)outputImage
{
  v43[6] = *MEMORY[0x1E4F143B8];
  v3 = +[CIImage emptyImage];
  if (self->inputImage && self->inputSecondaryImage)
  {
    id v4 = [(CIFusionTwoImagesDelta *)self kernel];
    [(NSNumber *)self->inputApertureScaling floatValue];
    double v6 = v5;
    [(CIVector *)self->inputSubtractive Z];
    *(float *)&double v6 = v7 * v6;
    [(CIVector *)self->inputSubtractive X];
    float v9 = v8;
    [(CIVector *)self->inputSubtractive Y];
    *(float *)&double v10 = v10;
    float v11 = *(float *)&v6 / (float)(*(float *)&v10 - v9);
    [(CIVector *)self->inputSubtractive X];
    float v13 = v12;
    [(CIVector *)self->inputSubtractive Y];
    *(float *)&double v14 = v14;
    float v15 = (float)((float)((float)-*(float *)&v6 / (float)(*(float *)&v14 - v13)) * v13) + 0.0;
    [(NSNumber *)self->inputApertureScaling floatValue];
    double v17 = v16;
    [(CIVector *)self->inputAdditive Z];
    *(float *)&double v17 = v18 * v17;
    [(CIVector *)self->inputAdditive X];
    float v20 = v19;
    [(CIVector *)self->inputAdditive Y];
    *(float *)&double v21 = v21;
    float v22 = (float)(0.0 - *(float *)&v17) / (float)(*(float *)&v21 - v20);
    [(CIVector *)self->inputAdditive X];
    float v24 = v23;
    [(CIVector *)self->inputAdditive Y];
    *(float *)&double v25 = v25;
    float v26 = *(float *)&v17 + (float)((float)((float)-(float)(0.0 - *(float *)&v17) / (float)(*(float *)&v25 - v24)) * v24);
    v27 = +[CIVector vectorWithX:v11 Y:v15 Z:*(float *)&v6];
    v28 = +[CIVector vectorWithX:v22 Y:v26 Z:*(float *)&v17];
    [(CIImage *)v3 extent];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    inputSecondaryImage = self->inputSecondaryImage;
    v43[0] = self->inputImage;
    v43[1] = inputSecondaryImage;
    v43[2] = v28;
    v43[3] = v27;
    inputApertureScaling = self->inputApertureScaling;
    v43[4] = self->inputProtectStrength;
    v43[5] = inputApertureScaling;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:6];
    v41[0] = @"kCIKernelOutputFormat";
    v41[1] = @"kCIImageAlphaOne";
    v42[0] = [NSNumber numberWithInt:2053];
    v42[1] = MEMORY[0x1E4F1CC38];
    return (id)objc_msgSend(v4, "applyWithExtent:arguments:options:", v39, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v42, v41, 2), v30, v32, v34, v36);
  }
  return v3;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputSecondaryImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputSecondaryImage:(id)a3
{
}

- (NSNumber)inputProtectStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputProtectStrength:(id)a3
{
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputApertureScaling:(id)a3
{
}

- (CIVector)inputAdditive
{
  return (CIVector *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputAdditive:(id)a3
{
}

- (CIVector)inputSubtractive
{
  return (CIVector *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputSubtractive:(id)a3
{
}

- (NSNumber)inputMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputMaxBlur:(id)a3
{
}

@end