@interface PFBoxBlur3_7
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation PFBoxBlur3_7

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
    uint64_t v23 = kCIKernelOutputFormat;
    v24 = +[NSNumber numberWithInt:kCIFormatRh];
    v11 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v12 = [(CIImage *)inputImage imageByClampingToExtent];
    if (qword_8C9C0 != -1) {
      dispatch_once(&qword_8C9C0, &stru_74BA8);
    }
    v13 = (void *)qword_8C9B8;
    v22 = v12;
    v14 = +[NSArray arrayWithObjects:&v22 count:1];
    double y = CGRectInfinite.origin.y;
    double width = CGRectInfinite.size.width;
    double height = CGRectInfinite.size.height;
    id v18 = objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:options:", &stru_748A0, v14, v11, CGRectInfinite.origin.x, y, width, height);
    if (qword_8C9D0 != -1) {
      dispatch_once(&qword_8C9D0, &stru_74BC8);
    }
    id v21 = v18;
    id v19 = objc_msgSend((id)qword_8C9C8, "applyWithExtent:roiCallback:arguments:options:", &stru_748C0, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1), v11, CGRectInfinite.origin.x, y, width, height);
    v26.origin.x = v4;
    v26.origin.double y = v6;
    v26.size.double width = v8;
    v26.size.double height = v10;
    if (!CGRectIsInfinite(v26)) {
      return objc_msgSend(v19, "imageByCroppingToRect:", v4, v6, v8, v10);
    }
    return v19;
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