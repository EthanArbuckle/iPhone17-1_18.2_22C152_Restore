@interface CIRowAverage
- (id)outputImage;
@end

@implementation CIRowAverage

- (id)outputImage
{
  inputImage = self->super.super.inputImage;
  long long v15 = xmmword_193953160;
  uint64_t v16 = 0x3FF0000000000000;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  v4 = [(CIImage *)inputImage imageByApplyingTransform:&v15];
  [(CIVector *)self->super.super.inputExtent Y];
  double v6 = v5;
  [(CIVector *)self->super.super.inputExtent X];
  double v8 = -v7;
  [(CIVector *)self->super.super.inputExtent Z];
  double v10 = v8 - v9;
  [(CIVector *)self->super.super.inputExtent W];
  double v12 = v11;
  [(CIVector *)self->super.super.inputExtent Z];
  return [(CIImage *)v4 filteredImage:@"CIColumnAverage", @"inputExtent", +[CIVector vectorWithX:v6 Y:v10 Z:v12 W:v13], 0 keysAndValues];
}

@end