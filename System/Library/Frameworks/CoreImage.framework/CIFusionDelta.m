@interface CIFusionDelta
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (id)kernel;
- (id)outputImage;
@end

@implementation CIFusionDelta

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_fusionDelta];
}

+ (id)customAttributes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"inputApertureScaling";
  v3[0] = @"CIAttributeType";
  v3[1] = @"CIAttributeDefault";
  v4[0] = @"CIAttributeTypeScalar";
  v4[1] = &unk_1EE4A8C70;
  v3[2] = @"CIAttributeIdentity";
  v4[2] = &unk_1EE4A8C70;
  v6[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
}

- (BOOL)_isIdentity
{
  [(CIVector *)self->inputAddBlur Z];
  BOOL result = 0;
  if (v3 == 0.0)
  {
    [(CIVector *)self->inputRemoveBlur Z];
    if (v4 == 0.0) {
      return 1;
    }
  }
  return result;
}

- (id)outputImage
{
  v39[4] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage) {
    return 0;
  }
  if ([(CIFusionDelta *)self _isIdentity])
  {
    return +[CIImage emptyImage];
  }
  else
  {
    [(CIVector *)self->inputRemoveBlur Z];
    float v5 = v4;
    [(CIVector *)self->inputRemoveBlur X];
    float v7 = v6;
    [(CIVector *)self->inputRemoveBlur Y];
    *(float *)&double v8 = v8;
    float v9 = 1.0 / (float)(*(float *)&v8 - v7);
    [(CIVector *)self->inputRemoveBlur X];
    float v11 = v10;
    [(CIVector *)self->inputRemoveBlur Y];
    *(float *)&double v12 = v12;
    float v13 = (float)((float)(-1.0 / (float)(*(float *)&v12 - v11)) * v11) + 0.0;
    [(CIVector *)self->inputAddBlur Z];
    float v15 = v14;
    [(CIVector *)self->inputAddBlur X];
    float v17 = v16;
    [(CIVector *)self->inputAddBlur Y];
    *(float *)&double v18 = v18;
    float v19 = -1.0 / (float)(*(float *)&v18 - v17);
    [(CIVector *)self->inputAddBlur X];
    float v21 = v20;
    [(CIVector *)self->inputAddBlur Y];
    *(float *)&double v22 = v22;
    float v23 = (float)((float)(1.0 / (float)(*(float *)&v22 - v21)) * v21) + 1.0;
    v24 = +[CIVector vectorWithX:v9 Y:v13 Z:v5];
    v25 = +[CIVector vectorWithX:v19 Y:v23 Z:v15];
    id v26 = [(CIFusionDelta *)self kernel];
    [(CIImage *)self->inputImage extent];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    v39[0] = self->inputImage;
    v39[1] = v25;
    inputApertureScaling = self->inputApertureScaling;
    v39[2] = v24;
    v39[3] = inputApertureScaling;
    uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
    v37[0] = @"kCIKernelOutputFormat";
    v37[1] = @"kCIImageAlphaOne";
    v38[0] = [NSNumber numberWithInt:2053];
    v38[1] = MEMORY[0x1E4F1CC38];
    return (id)objc_msgSend(v26, "applyWithExtent:arguments:options:", v36, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v38, v37, 2), v28, v30, v32, v34);
  }
}

@end