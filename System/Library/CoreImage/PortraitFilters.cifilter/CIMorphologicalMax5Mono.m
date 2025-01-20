@interface CIMorphologicalMax5Mono
- (CIImage)inputImage;
- (id)outputImage;
- (void)setInputImage:(id)a3;
@end

@implementation CIMorphologicalMax5Mono

- (id)outputImage
{
  inputImage = self->inputImage;
  if (inputImage)
  {
    [(CIImage *)inputImage extent];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(CIImage *)self->inputImage imageByClampingToExtent];
    if (qword_8C9F0 != -1) {
      dispatch_once(&qword_8C9F0, &stru_74C08);
    }
    v13 = (void *)qword_8C9E8;
    v36 = v12;
    v14 = +[NSArray arrayWithObjects:&v36 count:1];
    uint64_t v15 = kCIKernelOutputFormat;
    uint64_t v34 = kCIKernelOutputFormat;
    uint64_t v16 = kCIFormatRh;
    v35 = +[NSNumber numberWithInt:kCIFormatRh];
    v17 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    double y = CGRectInfinite.origin.y;
    double width = CGRectInfinite.size.width;
    double height = CGRectInfinite.size.height;
    id v21 = objc_msgSend(objc_msgSend(objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:options:", &stru_74900, v14, v17, CGRectInfinite.origin.x, y, width, height), "imageByCroppingToRect:", v5, v7, v9, v11), "imageByClampingToExtent");
    if (qword_8CA00 != -1) {
      dispatch_once(&qword_8CA00, &stru_74C28);
    }
    v22 = (void *)qword_8C9F8;
    id v33 = v21;
    v23 = +[NSArray arrayWithObjects:&v33 count:1];
    uint64_t v31 = v15;
    v32 = +[NSNumber numberWithInt:v16];
    id v24 = objc_msgSend(objc_msgSend(objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:options:", &stru_74920, v23, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1), CGRectInfinite.origin.x, y, width, height), "imageByCroppingToRect:", v5, v7,
              v9,
              v11),
            "imageByClampingToExtent");
    if (qword_8CA10 != -1) {
      dispatch_once(&qword_8CA10, &stru_74C48);
    }
    v25 = (void *)qword_8CA08;
    v30[0] = v24;
    v30[1] = v12;
    v26 = +[NSArray arrayWithObjects:v30 count:2];
    uint64_t v28 = v15;
    v29 = +[NSNumber numberWithInt:v16];
    return objc_msgSend(objc_msgSend(v25, "applyWithExtent:roiCallback:arguments:options:", &stru_74940, v26, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1), CGRectInfinite.origin.x, y, width, height), "imageByCroppingToRect:", v5, v7, v9,
             v11);
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