@interface CIColorAbsoluteDifference
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIImage)inputImage2;
- (id)outputImage;
- (void)setInputImage2:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIColorAbsoluteDifference

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryColorAdjustment";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryInterlaced";
  v3[3] = @"CICategoryNonSquarePixels";
  v3[4] = @"CICategoryStillImage";
  v3[5] = @"CICategoryHighDynamicRange";
  v3[6] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:7];
  v5[1] = @"14";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"11.0";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)outputImage
{
  v24[2] = *MEMORY[0x1E4F143B8];
  inputImage = self->inputImage;
  if (!inputImage) {
    goto LABEL_4;
  }
  if (!self->inputImage2) {
    goto LABEL_4;
  }
  [(CIImage *)inputImage extent];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(CIImage *)self->inputImage2 extent];
  v28.origin.double x = v12;
  v28.origin.double y = v13;
  v28.size.double width = v14;
  v28.size.double height = v15;
  v26.origin.double x = v5;
  v26.origin.double y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  CGRect v27 = CGRectIntersection(v26, v28);
  double x = v27.origin.x;
  double y = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  if (!CGRectIsEmpty(v27))
  {
    v21 = +[CIKernel kernelWithInternalRepresentation:&CI::_colorAbsDiff];
    v22 = [(CIImage *)self->inputImage imageByUnpremultiplyingAlpha];
    v23 = [(CIImage *)self->inputImage2 imageByUnpremultiplyingAlpha];
    v24[0] = v22;
    v24[1] = v23;
    return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v21, "applyWithExtent:arguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2], x, y, width, height), "imageByPremultiplyingAlpha");
  }
  else
  {
LABEL_4:
    return +[CIImage emptyImage];
  }
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