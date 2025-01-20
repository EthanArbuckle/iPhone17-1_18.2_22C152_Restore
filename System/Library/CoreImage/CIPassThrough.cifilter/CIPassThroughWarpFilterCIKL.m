@interface CIPassThroughWarpFilterCIKL
- (id)outputImage;
@end

@implementation CIPassThroughWarpFilterCIKL

- (id)outputImage
{
  v3 = +[CIWarpKernel cachedKernelWithString:@"kernel vec2 CIPT_Warp () { return destCoord(); } \n"];
  [(CIImage *)self->super.inputImage extent];
  v4 = objc_msgSend(v3, "applyWithExtent:roiCallback:inputImage:arguments:", &stru_41B8, self->super.inputImage, &__NSArray0__struct);

  return v4;
}

@end