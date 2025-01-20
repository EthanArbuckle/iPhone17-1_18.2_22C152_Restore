@interface CIIPTtoSRGB
+ (id)customAttributes;
- (id)_hueChromaToRect;
- (id)_iptToSRGB;
- (id)outputImage;
@end

@implementation CIIPTtoSRGB

+ (id)customAttributes
{
  v6[0] = kCIAttributeFilterCategories;
  v5[0] = kCICategoryColorAdjustment;
  v5[1] = kCICategoryVideo;
  v5[2] = kCICategoryStillImage;
  v7[0] = +[NSArray arrayWithObjects:v5 count:3];
  v6[1] = @"inputIsHueChroma";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeType;
  v4[0] = &__kCFBooleanFalse;
  v4[1] = kCIAttributeTypeBoolean;
  v7[1] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
}

- (id)_iptToSRGB
{
  if (qword_8CBA0 != -1) {
    dispatch_once(&qword_8CBA0, &stru_74FC0);
  }
  return (id)qword_8CB98;
}

- (id)_hueChromaToRect
{
  if (qword_8CBB0 != -1) {
    dispatch_once(&qword_8CBB0, &stru_74FE0);
  }
  return (id)qword_8CBA8;
}

- (id)outputImage
{
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  if ([(NSNumber *)self->inputIsHueChroma BOOLValue])
  {
    id v4 = [(CIIPTtoSRGB *)self _hueChromaToRect];
    [(CIImage *)self->inputImage extent];
    v16 = inputImage;
    inputImage = (CIImage *)objc_msgSend(v4, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1), v5, v6, v7, v8);
  }
  id v9 = [(CIIPTtoSRGB *)self _iptToSRGB];
  [(CIImage *)self->inputImage extent];
  v15 = inputImage;
  return objc_msgSend(v9, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1), v10, v11, v12, v13);
}

@end