@interface CISRGBtoIPT
+ (id)customAttributes;
- (id)_rectToHueChroma;
- (id)_srgbToIPT;
- (id)outputImage;
@end

@implementation CISRGBtoIPT

+ (id)customAttributes
{
  v6[0] = kCIAttributeFilterCategories;
  v5[0] = kCICategoryColorAdjustment;
  v5[1] = kCICategoryVideo;
  v5[2] = kCICategoryStillImage;
  v7[0] = +[NSArray arrayWithObjects:v5 count:3];
  v6[1] = @"inputReturnHueChroma";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeType;
  v4[0] = &__kCFBooleanFalse;
  v4[1] = kCIAttributeTypeBoolean;
  v7[1] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
}

- (id)_srgbToIPT
{
  if (qword_8CB80 != -1) {
    dispatch_once(&qword_8CB80, &stru_74F80);
  }
  return (id)qword_8CB78;
}

- (id)_rectToHueChroma
{
  if (qword_8CB90 != -1) {
    dispatch_once(&qword_8CB90, &stru_74FA0);
  }
  return (id)qword_8CB88;
}

- (id)outputImage
{
  if (!self->inputImage) {
    return 0;
  }
  id v3 = [(CISRGBtoIPT *)self _srgbToIPT];
  [(CIImage *)self->inputImage extent];
  inputImage = self->inputImage;
  id v8 = objc_msgSend(v3, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &inputImage, 1), v4, v5, v6, v7);
  if ([(NSNumber *)self->inputReturnHueChroma BOOLValue])
  {
    id v9 = [(CISRGBtoIPT *)self _rectToHueChroma];
    [(CIImage *)self->inputImage extent];
    id v15 = v8;
    return objc_msgSend(v9, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1), v10, v11, v12, v13);
  }
  return v8;
}

@end