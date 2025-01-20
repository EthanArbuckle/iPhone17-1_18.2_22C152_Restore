@interface PFSobelHV
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation PFSobelHV

- (id)outputImage
{
  inputImage = self->inputImage;
  if (inputImage)
  {
    [(CIImage *)self->inputImage extent];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    if (qword_8C9E0 != -1) {
      dispatch_once(&qword_8C9E0, &stru_74BE8);
    }
    v11 = (void *)qword_8C9D8;
    v16 = [(CIImage *)inputImage imageByClampingToExtent];
    v12 = +[NSArray arrayWithObjects:&v16 count:1];
    v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", kCIFormatRh, kCIKernelOutputFormat);
    return objc_msgSend(objc_msgSend(v11, "applyWithExtent:roiCallback:arguments:options:", &stru_748E0, v12, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1), CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height), "imageByCroppingToRect:", v4, v6, v8,
             v10);
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputImage:(id)a3
{
}

@end