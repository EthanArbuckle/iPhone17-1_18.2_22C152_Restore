@interface CIBlendWithMask
+ (id)customAttributes;
- (CIImage)inputBackgroundImage;
- (CIImage)inputImage;
- (CIImage)inputMaskImage;
- (float)_maskFillColorValue;
- (id)_kernel;
- (id)_kernelB0;
- (id)outputImage;
- (void)setInputBackgroundImage:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMaskImage:(id)a3;
@end

@implementation CIBlendWithMask

- (void)setInputMaskImage:(id)a3
{
}

- (void)setInputImage:(id)a3
{
}

- (void)setInputBackgroundImage:(id)a3
{
}

- (id)outputImage
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage && !self->inputBackgroundImage) {
    return 0;
  }
  [(CIImage *)inputImage extent];
  if (CGRectIsEmpty(v43))
  {
    [(CIImage *)self->inputBackgroundImage extent];
    if (CGRectIsEmpty(v44))
    {
      return +[CIImage emptyImage];
    }
  }
  inputMaskImage = self->inputMaskImage;
  if (!inputMaskImage
    || ([(CIImage *)inputMaskImage extent], CGRectIsEmpty(v45))
    || ([(CIBlendWithMask *)self _maskFillColorValue], fabs(v6) < 1.0e-10))
  {
    v7 = self->inputBackgroundImage;
LABEL_12:
    return v7;
  }
  v8 = self->inputImage;
  if (fabs(v6 + -1.0) < 1.0e-10)
  {
    v7 = v8;
    goto LABEL_12;
  }
  [(CIImage *)self->inputMaskImage extent];
  v9 = -[CIImage imageByCroppingToRect:](v8, "imageByCroppingToRect:");
  if (!v9) {
    v9 = +[CIImage emptyImage];
  }
  inputBackgroundImage = self->inputBackgroundImage;
  if (!inputBackgroundImage) {
    inputBackgroundImage = +[CIImage emptyImage];
  }
  v11 = self->inputMaskImage;
  [(CIImage *)inputBackgroundImage extent];
  if (CGRectIsEmpty(v46))
  {
    id v12 = [(CIBlendWithMask *)self _kernelB0];
    [(CIImage *)v9 extent];
    double x = v13;
    double y = v15;
    double width = v17;
    double height = v19;
    v39 = v9;
    v40 = v11;
    v21 = (void *)MEMORY[0x1E4F1C978];
    v22 = &v39;
    uint64_t v23 = 2;
  }
  else
  {
    [(CIImage *)v9 extent];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    [(CIImage *)inputBackgroundImage extent];
    v49.origin.double x = v32;
    v49.origin.double y = v33;
    v49.size.double width = v34;
    v49.size.double height = v35;
    v47.origin.double x = v25;
    v47.origin.double y = v27;
    v47.size.double width = v29;
    v47.size.double height = v31;
    CGRect v48 = CGRectUnion(v47, v49);
    double x = v48.origin.x;
    double y = v48.origin.y;
    double width = v48.size.width;
    double height = v48.size.height;
    id v12 = [(CIBlendWithMask *)self _kernel];
    v36 = v9;
    v37 = inputBackgroundImage;
    v38 = v11;
    v21 = (void *)MEMORY[0x1E4F1C978];
    v22 = &v36;
    uint64_t v23 = 3;
  }
  return (id)objc_msgSend(v12, "applyWithExtent:arguments:", objc_msgSend(v21, "arrayWithObjects:count:", v22, v23, v36, v37, v38, v39, v40), x, y, width, height);
}

- (float)_maskFillColorValue
{
  LODWORD(result) = _fillColor((CIImage *)self[96]).n64_u32[1];
  return result;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_blendWithMask];
}

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryStylize";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryHighDynamicRange";
  v3[4] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"6";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.4";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)_kernelB0
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_blendWithMaskB0];
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (CIImage)inputBackgroundImage
{
  return self->inputBackgroundImage;
}

- (CIImage)inputMaskImage
{
  return self->inputMaskImage;
}

@end