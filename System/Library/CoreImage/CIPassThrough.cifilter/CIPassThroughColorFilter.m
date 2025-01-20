@interface CIPassThroughColorFilter
- (id)outputImage;
@end

@implementation CIPassThroughColorFilter

- (id)outputImage
{
  v3 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIPT_Color (__sample s) { return s; } \n"];
  [(CIImage *)self->super.inputImage extent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  inputImage = self->super.inputImage;
  v12 = +[NSArray arrayWithObjects:&inputImage count:1];
  v13 = objc_msgSend(v3, "applyWithExtent:arguments:", v12, v5, v7, v9, v11);

  return v13;
}

@end