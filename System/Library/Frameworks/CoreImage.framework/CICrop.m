@interface CICrop
+ (id)customAttributes;
- (CIImage)inputImage;
- (CIVector)inputRectangle;
- (id)_initFromProperties:(id)a3;
- (id)_outputProperties;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputRectangle:(id)a3;
@end

@implementation CICrop

+ (id)customAttributes
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"CIAttributeFilterCategories";
  v6[0] = @"CICategoryGeometryAdjustment";
  v6[1] = @"CICategoryVideo";
  v6[2] = @"CICategoryStillImage";
  v6[3] = @"CICategoryBuiltIn";
  v8[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v8[1] = @"5";
  v7[1] = @"CIAttributeFilterAvailable_iOS";
  v7[2] = @"CIAttributeFilterAvailable_Mac";
  v8[2] = @"10.4";
  v7[3] = @"inputRectangle";
  v5[0] = @"CIAttributeTypeRectangle";
  v4[0] = @"CIAttributeType";
  v4[1] = @"CIAttributeDefault";
  v2 = (double *)MEMORY[0x1E4F1DB10];
  v5[1] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  v4[2] = @"CIAttributeIdentity";
  v5[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *v2, v2[1], v2[2], v2[3]);
  v8[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
}

- (id)outputImage
{
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  inputRectangle = self->inputRectangle;
  if (inputRectangle)
  {
    [(CIVector *)inputRectangle CGRectValue];
    v5 = self->inputImage;
    return -[CIImage imageByCroppingToRect:](v5, "imageByCroppingToRect:");
  }
  else
  {
    v7 = inputImage;
    return v7;
  }
}

- (id)_outputProperties
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  [(CIVector *)self->inputRectangle CGRectValue];
  CGRect v8 = CGRectStandardize(v7);
  double y = v8.origin.y;
  double width = v8.size.width;
  double height = v8.size.height;
  v6[0] = metadataPropertyWithDouble(v8.origin.x);
  v6[1] = metadataPropertyWithDouble(y);
  v6[2] = metadataPropertyWithDouble(width);
  v6[3] = metadataPropertyWithDouble(height);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
}

- (id)_initFromProperties:(id)a3
{
  double v8 = 0.0;
  double v9 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"CropX", &v9)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"CropY", &v8)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"CropW", &v7)&& metadataPropertyArrayGetDouble((uint64_t)a3, @"http://ns.apple.com/adjustment-settings/1.0/", @"CropH", &v6))
  {
    [(CICrop *)self setInputRectangle:+[CIVector vectorWithX:v9 Y:v8 Z:v7 W:v6]];
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

- (CIVector)inputRectangle
{
  return self->inputRectangle;
}

- (void)setInputRectangle:(id)a3
{
}

@end