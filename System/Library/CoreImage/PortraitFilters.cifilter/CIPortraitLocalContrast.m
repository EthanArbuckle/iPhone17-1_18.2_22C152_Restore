@interface CIPortraitLocalContrast
+ (id)customAttributes;
- (id)_convertToGrayscale;
- (id)_kernelLocalContrast;
- (id)outputImage;
@end

@implementation CIPortraitLocalContrast

+ (id)customAttributes
{
  v12[0] = kCIAttributeFilterCategories;
  v11[0] = kCICategoryColorAdjustment;
  v11[1] = kCICategoryStillImage;
  v11[2] = kCICategoryApplePrivate;
  v13[0] = +[NSArray arrayWithObjects:v11 count:3];
  v12[1] = @"inputStrength";
  v9[0] = kCIAttributeClass;
  v2 = (objc_class *)objc_opt_class();
  v10[0] = NSStringFromClass(v2);
  v10[1] = &off_7A4B0;
  v9[1] = kCIAttributeDefault;
  v9[2] = kCIAttributeMin;
  v10[2] = &off_7A4C0;
  v10[3] = &off_7A4D0;
  v9[3] = kCIAttributeMax;
  v9[4] = kCIAttributeType;
  v10[4] = kCIAttributeTypeScalar;
  v13[1] = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];
  v12[2] = @"inputBlur";
  v7[0] = kCIAttributeClass;
  v3 = (objc_class *)objc_opt_class();
  v8[0] = NSStringFromClass(v3);
  v8[1] = &off_7A4B0;
  v7[1] = kCIAttributeDefault;
  v7[2] = kCIAttributeMin;
  v8[2] = &off_7A4B0;
  v8[3] = &off_7A4E0;
  v7[3] = kCIAttributeMax;
  v7[4] = kCIAttributeType;
  v8[4] = kCIAttributeTypeScalar;
  v13[2] = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  v12[3] = @"inputScale";
  v6[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0, 1.0, kCIAttributeDefault);
  v6[1] = &off_7A4F0;
  v5[1] = kCIAttributeMin;
  v5[2] = kCIAttributeMax;
  v5[3] = kCIAttributeType;
  v6[2] = &off_7A500;
  v6[3] = kCIAttributeTypePosition;
  v13[3] = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  return +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
}

- (id)_convertToGrayscale
{
  if (qword_8CFA8 != -1) {
    dispatch_once(&qword_8CFA8, &stru_75878);
  }
  return (id)qword_8CFA0;
}

- (id)_kernelLocalContrast
{
  if (qword_8CFB8 != -1) {
    dispatch_once(&qword_8CFB8, &stru_75898);
  }
  return (id)qword_8CFB0;
}

- (id)outputImage
{
  id v3 = [(CIPortraitLocalContrast *)self _convertToGrayscale];
  [(CIImage *)self->inputImage extent];
  inputImage = self->inputImage;
  id v8 = objc_msgSend(v3, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &inputImage, 1), v4, v5, v6, v7);
  [(CIVector *)self->inputScale X];
  double v10 = v9;
  [(CIVector *)self->inputScale Y];
  double v12 = v11;
  [(NSNumber *)self->inputBlur floatValue];
  if (v13 > 0.0)
  {
    id v14 = [v8 imageByClampingToExtent];
    [(NSNumber *)self->inputBlur doubleValue];
    id v15 = objc_msgSend(v14, "imageByApplyingGaussianBlurWithSigma:");
LABEL_5:
    v22 = v15;
    [(CIImage *)self->inputImage extent];
    id v8 = objc_msgSend(v22, "imageByCroppingToRect:");
    goto LABEL_6;
  }
  float v16 = v10;
  float v17 = v12;
  float v18 = fminf(v16, v17);
  if (v18 < 1.0)
  {
    CGFloat v19 = v18;
    id v20 = [v8 imageByClampingToExtent];
    CGAffineTransformMakeScale(&v29, v19, v19);
    id v21 = [v20 imageByApplyingTransform:&v29 highQualityDownsample:1];
    CFStringRef v31 = @"inputScale";
    v32 = +[NSNumber numberWithDouble:1.0 / v19];
    id v15 = objc_msgSend(v21, "imageByApplyingFilter:withInputParameters:", @"CISoftCubicUpsample", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    goto LABEL_5;
  }
LABEL_6:
  id v23 = [(CIPortraitLocalContrast *)self _kernelLocalContrast];
  [(CIImage *)self->inputImage extent];
  v30[0] = self->inputImage;
  v30[1] = v8;
  v30[2] = self->inputStrength;
  return objc_msgSend(v23, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 3), v24, v25, v26, v27);
}

@end