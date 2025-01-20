@interface CILabDeltaE
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputImage2;
- (id)outputImage;
- (void)setInputImage2:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CILabDeltaE

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorEffect";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryInterlaced";
  v3[3] = @"CICategoryNonSquarePixels";
  v3[4] = @"CICategoryStillImage";
  v3[5] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  v5[1] = @"11";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.13";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v3 = +[CIImage emptyImage];
  inputImage = self->inputImage;
  if (!inputImage)
  {
    p_inputImage2 = &self->inputImage2;
    inputImage2 = self->inputImage2;
    if (!inputImage2) {
      return v3;
    }
    CGFloat v6 = *MEMORY[0x1E4F1DB20];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_6;
  }
  [(CIImage *)inputImage extent];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  p_inputImage2 = &self->inputImage2;
  inputImage2 = self->inputImage2;
  if (inputImage2)
  {
LABEL_6:
    [(CIImage *)inputImage2 extent];
    uint64_t v15 = v19;
    uint64_t v16 = v20;
    uint64_t v17 = v21;
    uint64_t v18 = v22;
    goto LABEL_7;
  }
  uint64_t v15 = *MEMORY[0x1E4F1DB20];
  uint64_t v16 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v17 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  uint64_t v18 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_7:
  v32.origin.double x = v6;
  v32.origin.double y = v8;
  v32.size.double width = v10;
  v32.size.double height = v12;
  CGRect v33 = CGRectUnion(v32, *(CGRect *)&v15);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  v27 = +[CIKernel kernelWithInternalRepresentation:&CI::_LabDeltaE];
  v28 = self->inputImage;
  if (!v28) {
    v28 = v3;
  }
  v31[0] = v28;
  v29 = *p_inputImage2;
  if (!*p_inputImage2) {
    v29 = v3;
  }
  v31[1] = v29;
  return -[CIImage imageByTaggingWithColorSpace:](-[CIColorKernel applyWithExtent:arguments:](v27, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2], x, y, width, height), "imageByTaggingWithColorSpace:", 0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage2
{
  return self->inputImage2;
}

- (void)setInputImage2:(id)a3
{
}

@end