@interface CIPlusLighterCompositing
+ (id)_kernel;
+ (id)customAttributes;
- (id)outputImage;
@end

@implementation CIPlusLighterCompositing

+ (id)_kernel
{
  return +[CIBlendKernel plusLighter];
}

+ (id)customAttributes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"CIAttributeFilterCategories";
  v3[0] = @"CICategoryCompositeOperation";
  v3[1] = @"CICategoryVideo";
  v3[2] = @"CICategoryStillImage";
  v3[3] = @"CICategoryInterlaced";
  v3[4] = @"CICategoryNonSquarePixels";
  v3[5] = @"CICategoryBuiltIn";
  v3[6] = @"CICategoryApplePrivate";
  v5[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:7];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

- (id)outputImage
{
  inputImage = self->super.inputImage;
  v4 = +[CIImage emptyImage];
  inputBackgroundImage = self->super.inputBackgroundImage;
  if (inputImage == v4)
  {
    v7 = inputBackgroundImage;
  }
  else
  {
    if (inputBackgroundImage != +[CIImage emptyImage])
    {
      v8.receiver = self;
      v8.super_class = (Class)CIPlusLighterCompositing;
      return [(_CICompositeFilter *)&v8 outputImage];
    }
    v7 = self->super.inputImage;
  }

  return v7;
}

@end