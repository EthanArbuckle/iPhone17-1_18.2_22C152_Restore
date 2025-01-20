@interface CICode128BarcodeGenerator
+ (id)customAttributes;
- (CGImage)outputCGImage;
- (NSNumber)inputBarcodeHeight;
- (NSNumber)inputQuietSpace;
- (void)setInputBarcodeHeight:(id)a3;
- (void)setInputQuietSpace:(id)a3;
@end

@implementation CICode128BarcodeGenerator

+ (id)customAttributes
{
  v14[0] = kCIAttributeFilterCategories;
  v13[0] = kCICategoryGenerator;
  v13[1] = kCICategoryStillImage;
  v13[2] = kCICategoryBuiltIn;
  v2 = +[NSArray arrayWithObjects:v13 count:3];
  v15[0] = v2;
  v15[1] = @"8";
  v14[1] = kCIAttributeFilterAvailable_iOS;
  v14[2] = kCIAttributeFilterAvailable_Mac;
  v15[2] = @"10.10";
  v15[3] = &__NSDictionary0__struct;
  v14[3] = @"inputMessage";
  v14[4] = @"inputQuietSpace";
  v11[0] = kCIAttributeMin;
  v11[1] = kCIAttributeMax;
  v12[0] = &off_1DB98;
  v12[1] = &off_1DBE0;
  v11[2] = kCIAttributeSliderMin;
  v11[3] = kCIAttributeSliderMax;
  v12[2] = &off_1DB98;
  v12[3] = &off_1DBF8;
  v11[4] = kCIAttributeDefault;
  int v3 = dyld_program_sdk_at_least();
  v4 = &off_1DC28;
  if (v3) {
    v4 = &off_1DC10;
  }
  v11[5] = kCIAttributeType;
  v12[4] = v4;
  v12[5] = kCIAttributeTypeInteger;
  v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];
  v15[4] = v5;
  v14[5] = @"inputBarcodeHeight";
  v9[0] = kCIAttributeMin;
  v9[1] = kCIAttributeMax;
  v10[0] = &off_1DAC0;
  v10[1] = &off_1DC40;
  v9[2] = kCIAttributeSliderMin;
  v9[3] = kCIAttributeSliderMax;
  v10[2] = &off_1DAC0;
  v10[3] = &off_1DC58;
  v9[4] = kCIAttributeDefault;
  v9[5] = kCIAttributeType;
  v10[4] = &off_1DAD8;
  v10[5] = kCIAttributeTypeInteger;
  v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  v15[5] = v6;
  v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:6];

  return v7;
}

- (CGImage)outputCGImage
{
  if (!self->super.inputMessage) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[NSException raise:@"CICode128BarcodeGenerator" format:@"CICode128BarcodeGenerator filter requires NSData for inputMessage"];
    return 0;
  }
  inputQuietSpace = self->inputQuietSpace;
  if (inputQuietSpace)
  {
    [(NSNumber *)inputQuietSpace doubleValue];
    unint64_t v5 = (int)llround(fmin(fmax(v4, 0.0), 100.0));
  }
  else
  {
    unint64_t v5 = 7;
  }
  inputBarcodeHeight = self->inputBarcodeHeight;
  if (inputBarcodeHeight)
  {
    [(NSNumber *)inputBarcodeHeight doubleValue];
    uint64_t v9 = (int)llround(fmin(fmax(v8, 1.0), 500.0));
  }
  else
  {
    uint64_t v9 = 32;
  }
  CGImageRef v6 = sub_FAF4(self->super.inputMessage, v5, v9);
  id v10 = 0;
  v11 = v10;
  if (v6)
  {
    CFAutorelease(v6);
  }
  else if (v10)
  {
    v12 = [v10 localizedDescription];
    NSLog(@"%@", v12);
  }
  else
  {
    NSLog(@"CICode128BarcodeGenerator could not generate an image");
  }

  return v6;
}

- (NSNumber)inputQuietSpace
{
  return self->inputQuietSpace;
}

- (void)setInputQuietSpace:(id)a3
{
}

- (NSNumber)inputBarcodeHeight
{
  return self->inputBarcodeHeight;
}

- (void)setInputBarcodeHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputBarcodeHeight, 0);
  objc_storeStrong((id *)&self->inputQuietSpace, 0);
}

@end