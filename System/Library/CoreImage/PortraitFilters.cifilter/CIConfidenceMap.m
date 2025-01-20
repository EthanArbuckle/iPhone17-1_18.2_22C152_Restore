@interface CIConfidenceMap
+ (id)customAttributes;
- (CIImage)inputDisparityImage;
- (CIImage)inputImage;
- (id)_confidenceExtractRed;
- (id)extractLuminance:(id)a3;
- (id)outputImage;
- (void)setInputDisparityImage:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation CIConfidenceMap

+ (id)customAttributes
{
  v4[0] = kCIAttributeFilterCategories;
  v3[0] = kCICategoryColorAdjustment;
  v3[1] = kCICategoryVideo;
  v3[2] = kCICategoryStillImage;
  v3[3] = kCICategoryBuiltIn;
  v3[4] = kCICategoryApplePrivate;
  v5[0] = +[NSArray arrayWithObjects:v3 count:5];
  v5[1] = @"11";
  v4[1] = kCIAttributeFilterAvailable_iOS;
  v4[2] = kCIAttributeFilterAvailable_Mac;
  v5[2] = @"10.13";
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)_confidenceExtractRed
{
  if (qword_8C9B0 != -1) {
    dispatch_once(&qword_8C9B0, &stru_74B48);
  }
  return (id)qword_8C9A8;
}

- (id)extractLuminance:(id)a3
{
  if (!a3) {
    return 0;
  }
  v5 = (CGColorSpace *)[a3 colorSpace];
  v6 = v5;
  if (!v5) {
    v6 = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
  }
  id v7 = objc_msgSend(+[CIImage imageYCC444:matrix:fullRange:colorSpace:](CIImage, "imageYCC444:matrix:fullRange:colorSpace:", objc_msgSend(a3, "imageByApplyingFilter:", @"CILinearToSRGBToneCurve"), 709, 1, 0), "imageByApplyingFilter:", @"CISRGBToneCurveToLinear");
  id v8 = [(CIConfidenceMap *)self _confidenceExtractRed];
  [v7 extent];
  id v15 = v7;
  id v13 = objc_msgSend(v8, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1), v9, v10, v11, v12);
  if (!v5) {
    CGColorSpaceRelease(v6);
  }
  return v13;
}

- (id)outputImage
{
  id result = self->inputImage;
  if (result)
  {
    if (self->inputDisparityImage)
    {
      v4 = +[NSNumber numberWithInt:kCIFormatRh];
      inputImage = self->inputImage;
      inputDisparityImage = self->inputDisparityImage;
      [(CIImage *)inputDisparityImage extent];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [(CIImage *)inputDisparityImage extent];
      BOOL IsInfinite = CGRectIsInfinite(v57);
      double v16 = 1.0;
      double v17 = 1.0;
      if (!IsInfinite)
      {
        [(CIImage *)inputImage extent];
        BOOL v18 = CGRectIsInfinite(v58);
        double v16 = 1.0;
        double v17 = 1.0;
        if (!v18)
        {
          [(CIImage *)inputDisparityImage extent];
          double v20 = v19;
          [(CIImage *)inputImage extent];
          float v22 = v20 / v21;
          [(CIImage *)inputDisparityImage extent];
          double v24 = v23;
          [(CIImage *)inputImage extent];
          float v26 = v24 / v25;
          double v17 = v22;
          double v16 = v26;
        }
      }
      if (v17 != 1.0 || v16 != 1.0)
      {
        CGAffineTransformMakeScale(&v46, v17, v16);
        inputImage = [(CIImage *)inputImage imageByApplyingTransform:&v46];
      }
      id v27 = [(CIConfidenceMap *)self extractLuminance:inputImage];
      if (v27)
      {
        id v28 = [v27 imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
        if (qword_8CA20 != -1) {
          dispatch_once(&qword_8CA20, &stru_74C68);
        }
        v29 = (void *)qword_8CA18;
        if (qword_8CA30 != -1) {
          dispatch_once(&qword_8CA30, &stru_74C88);
        }
        v30 = (void *)qword_8CA28;
        [(CIImage *)inputDisparityImage extent];
        CGRect v60 = CGRectInset(v59, -1.0, -1.0);
        double x = v60.origin.x;
        double y = v60.origin.y;
        double width = v60.size.width;
        double height = v60.size.height;
        v55 = [(CIImage *)inputDisparityImage imageByClampingToExtent];
        v35 = +[NSArray arrayWithObjects:&v55 count:1];
        uint64_t v36 = kCIKernelOutputFormat;
        uint64_t v53 = kCIKernelOutputFormat;
        v54 = v4;
        id v37 = objc_msgSend(objc_msgSend(v29, "applyWithExtent:roiCallback:arguments:options:", &stru_74B68, v35, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1), x, y, width, height), "imageByCroppingToRect:", v8, v10, v12,
                v14);
        if (qword_8CA40 != -1) {
          dispatch_once(&qword_8CA40, &stru_74CA8);
        }
        v38 = (void *)qword_8CA38;
        v52[0] = [v37 imageByClampingToExtent];
        v52[1] = +[CIVector vectorWithX:1.0 Y:7.0];
        v52[2] = [v28 imageByClampingToExtent];
        v39 = +[NSArray arrayWithObjects:v52 count:3];
        uint64_t v50 = v36;
        v51 = v4;
        id v40 = objc_msgSend(objc_msgSend(objc_msgSend(v38, "applyWithExtent:roiCallback:arguments:options:", &stru_74B88, v39, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1), CGRectInfinite.origin.x, CGRectInfinite.origin.y, CGRectInfinite.size.width, CGRectInfinite.size.height), "imageByCroppingToRect:", v8, v10,
                  v12,
                  v14),
                "imageByClampingToExtent");
        v48 = kCIInputRadiusKey;
        v49 = &off_79A00;
        id v41 = objc_msgSend(objc_msgSend(v40, "imageByApplyingFilter:withInputParameters:", @"CIGaussianBlur", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1)), "imageByCroppingToRect:", v8, v10, v12, v14);
        [v41 extent];
        id v47 = v41;
        return objc_msgSend(objc_msgSend(v30, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1), v42, v43, v44, v45), "imageByCroppingToRect:", v8, v10, v12, v14);
      }
      else
      {
        return +[CIImage emptyImage];
      }
    }
  }
  else
  {
    return +[CIImage emptyImage];
  }
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputDisparityImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputDisparityImage:(id)a3
{
}

@end