@interface CIQRCodeGenerator
+ (id)customAttributes;
- (CGImage)outputCGImage;
- (NSString)inputCorrectionLevel;
- (int)_defaultVersion;
- (int)_maxVersion;
- (void)setDefaults;
- (void)setInputCorrectionLevel:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CIQRCodeGenerator

- (void)setDefaults
{
  v4.receiver = self;
  v4.super_class = (Class)CIQRCodeGenerator;
  [(CIQRCodeGenerator *)&v4 setDefaults];
  v3 = +[NSNumber numberWithInt:[(CIQRCodeGenerator *)self _defaultVersion]];
  [(CIQRCodeGenerator *)self setValue:v3 forKey:kCIInputVersionKey];
}

- (int)_defaultVersion
{
  return dyld_program_sdk_at_least();
}

+ (id)customAttributes
{
  v9[0] = kCIAttributeFilterCategories;
  v8[0] = kCICategoryGenerator;
  v8[1] = kCICategoryStillImage;
  v8[2] = kCICategoryBuiltIn;
  v2 = +[NSArray arrayWithObjects:v8 count:3];
  v10[0] = v2;
  v10[1] = @"7";
  v9[1] = kCIAttributeFilterAvailable_iOS;
  v9[2] = kCIAttributeFilterAvailable_Mac;
  v10[2] = @"10.9";
  v10[3] = &__NSDictionary0__struct;
  v9[3] = @"inputMessage";
  v9[4] = @"inputCorrectionLevel";
  v6 = kCIAttributeDefault;
  CFStringRef v7 = @"M";
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v10[4] = v3;
  objc_super v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v4;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"inputOptions"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v6 objectForKey:@"QRCodeOptionErrorCorrectionLevel"];

      if (v8)
      {
        v9 = [v6 objectForKey:@"QRCodeOptionErrorCorrectionLevel"];
        [(CIQRCodeGenerator *)self setInputCorrectionLevel:v9];
      }
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CIQRCodeGenerator;
    [(CIQRCodeGenerator *)&v10 setValue:v6 forUndefinedKey:v7];
  }
}

- (CGImage)outputCGImage
{
  if (!self->super.inputMessage) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFStringRef v8 = @"CIQRCodeGenerator filter requires NSData for inputMessage";
LABEL_11:
    +[NSException raise:@"CIQRCodeGenerator" format:v8];
    return 0;
  }
  inputCorrectionLevel = self->inputCorrectionLevel;
  if (inputCorrectionLevel
    && ![(NSString *)inputCorrectionLevel isEqualToString:@"L"]
    && ![(NSString *)self->inputCorrectionLevel isEqualToString:@"M"]
    && ![(NSString *)self->inputCorrectionLevel isEqualToString:@"Q"]
    && ![(NSString *)self->inputCorrectionLevel isEqualToString:@"H"])
  {
    CFStringRef v8 = @"CIQRCodeGenerator filter requires L, M, Q, or H for inputCorrectionLevel";
    goto LABEL_11;
  }
  objc_super v4 = [(CIQRCodeGenerator *)self valueForKey:kCIInputVersionKey];
  signed int v5 = [v4 intValue];

  CGImageRef v6 = sub_3C98(self->super.inputMessage, self->inputCorrectionLevel, 0, v5 > 0);
  id v7 = v6;
  if (v6) {
    CFAutorelease(v6);
  }
  return v7;
}

- (void)setInputCorrectionLevel:(id)a3
{
}

- (void).cxx_destruct
{
}

- (int)_maxVersion
{
  return 1;
}

- (NSString)inputCorrectionLevel
{
  return self->inputCorrectionLevel;
}

@end