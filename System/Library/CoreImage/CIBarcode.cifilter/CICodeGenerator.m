@interface CICodeGenerator
- (CGImage)outputCGImage;
- (NSData)inputMessage;
- (id)outputImage;
- (void)setInputMessage:(id)a3;
@end

@implementation CICodeGenerator

- (void)setInputMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

- (CGImage)outputCGImage
{
  return 0;
}

- (id)outputImage
{
  v2 = [(CICodeGenerator *)self outputCGImage];
  if (v2)
  {
    v5[0] = kCIImageNearestSampling;
    v5[1] = kCIImageAlphaOne;
    v6[0] = &__kCFBooleanTrue;
    v6[1] = &__kCFBooleanTrue;
    v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
    v2 = +[CIImage imageWithCGImage:v2 options:v3];
  }
  return v2;
}

- (NSData)inputMessage
{
  return self->inputMessage;
}

@end