@interface CIAdditionCompositing
+ (id)_kernel;
- (id)outputImage;
@end

@implementation CIAdditionCompositing

+ (id)_kernel
{
  return +[CIBlendKernel componentAdd];
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
      v8.super_class = (Class)CIAdditionCompositing;
      return [(_CICompositeFilter *)&v8 outputImage];
    }
    v7 = self->super.inputImage;
  }

  return v7;
}

@end