@interface CIPassThroughGeneralFilter
- (id)outputImage;
@end

@implementation CIPassThroughGeneralFilter

- (id)outputImage
{
  v3 = +[CIKernel cachedKernelWithString:@"kernel vec4 CIPT_General (sampler s, float v) { return sample(s, samplerCoord(s)+v); } \n"];
  [(CIImage *)self->super.inputImage extent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v15[0] = self->super.inputImage;
  v15[1] = &off_43A0;
  v12 = +[NSArray arrayWithObjects:v15 count:2];
  v13 = objc_msgSend(v3, "applyWithExtent:roiCallback:arguments:", &stru_41D8, v12, v5, v7, v9, v11);

  return v13;
}

@end