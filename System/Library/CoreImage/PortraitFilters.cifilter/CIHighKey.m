@interface CIHighKey
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputStrength;
- (id)_highKey;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputStrength:(id)a3;
@end

@implementation CIHighKey

+ (id)customAttributes
{
  v6[0] = kCIAttributeFilterCategories;
  v5[0] = kCICategoryColorAdjustment;
  v5[1] = kCICategoryVideo;
  v5[2] = kCICategoryStillImage;
  v5[3] = kCICategoryApplePrivate;
  v7[0] = +[NSArray arrayWithObjects:v5 count:4];
  v6[1] = @"inputStrength";
  v3[0] = kCIAttributeDefault;
  v3[1] = kCIAttributeMax;
  v4[0] = &off_7A480;
  v4[1] = &off_7A490;
  v3[2] = kCIAttributeMin;
  v3[3] = kCIAttributeType;
  v4[2] = &off_7A4A0;
  v4[3] = kCIAttributeTypeScalar;
  v7[1] = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
}

- (id)_highKey
{
  if (qword_8CF98 != -1) {
    dispatch_once(&qword_8CF98, &stru_75858);
  }
  return (id)qword_8CF90;
}

- (id)outputImage
{
  inputImage = self->inputImage;
  if (!inputImage) {
    return 0;
  }
  id v4 = [(CIHighKey *)self _highKey];
  [(CIImage *)self->inputImage extent];
  inputStrength = self->inputStrength;
  v11[0] = inputImage;
  v11[1] = inputStrength;
  return objc_msgSend(v4, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2), v6, v7, v8, v9);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
}

@end