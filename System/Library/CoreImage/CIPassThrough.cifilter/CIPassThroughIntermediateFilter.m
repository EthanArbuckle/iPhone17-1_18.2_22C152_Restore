@interface CIPassThroughIntermediateFilter
- (id)outputImage;
@end

@implementation CIPassThroughIntermediateFilter

- (id)outputImage
{
  return [(CIImage *)self->super.inputImage _imageByRenderingToIntermediate];
}

@end