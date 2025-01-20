@interface CIReductionFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputExtent;
- (id)_reduceCrop;
- (id)offsetAndCrop;
- (id)outputImage;
- (void)setInputExtent:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIReductionFilter

+ (id)customAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryReduction";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryHighDynamicRange";
  v3[4] = @"CICategoryBuiltIn";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  v5[1] = @"9";
  v4[1] = @"CIAttributeFilterAvailable_iOS";
  v4[2] = @"CIAttributeFilterAvailable_Mac";
  v5[2] = @"10.5";
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)_reduceCrop
{
  return +[CIKernel kernelWithInternalRepresentation:&CI::_reduceCrop];
}

- (id)offsetAndCrop
{
  [(CIImage *)self->inputImage extent];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CIVector *)self->inputExtent CGRectValue];
  v32.origin.double x = v11;
  v32.origin.double y = v12;
  v32.size.double width = v13;
  v32.size.double height = v14;
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  CGRect v26 = CGRectIntersection(v25, v32);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  if (!CGRectIsInfinite(v26))
  {
    v27.origin.double x = x;
    v27.origin.double y = y;
    v27.size.double width = width;
    v27.size.double height = height;
    if (!CGRectIsEmpty(v27))
    {
      v28.origin.double x = x;
      v28.origin.double y = y;
      v28.size.double width = width;
      v28.size.double height = height;
      CGRect v29 = CGRectStandardize(v28);
      double x = ceil(v29.origin.x);
      double y = ceil(v29.origin.y);
      double v19 = floor(v29.origin.x + v29.size.width);
      double v20 = floor(v29.origin.y + v29.size.height);
      if (v19 > x && v20 > y)
      {
        double width = v19 - x;
        double height = v20 - y;
      }
      else
      {
        double x = *MEMORY[0x1E4F1DB20];
        double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      }
    }
  }
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  if (CGRectIsEmpty(v30)) {
    return 0;
  }
  v31.origin.double x = x;
  v31.origin.double y = y;
  v31.size.double width = width;
  v31.size.double height = height;
  if (CGRectIsInfinite(v31)) {
    return 0;
  }
  inputImage = self->inputImage;
  CGAffineTransformMakeTranslation(&v24, -x, -y);
  return -[CIImage imageByCroppingToRect:]([(CIImage *)inputImage imageByApplyingTransform:&v24], "imageByCroppingToRect:", 0.0, 0.0, width, height);
}

- (id)outputImage
{
  return 0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
}

@end