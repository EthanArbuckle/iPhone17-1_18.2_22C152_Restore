@interface CITextImageGenerator
+ (id)customAttributes;
- (NSNumber)inputFontSize;
- (NSNumber)inputPadding;
- (NSNumber)inputScaleFactor;
- (NSString)inputFontName;
- (NSString)inputText;
- (id)outputImage;
- (void)outputImage;
- (void)setInputFontName:(id)a3;
- (void)setInputFontSize:(id)a3;
- (void)setInputPadding:(id)a3;
- (void)setInputScaleFactor:(id)a3;
- (void)setInputText:(id)a3;
@end

@implementation CITextImageGenerator

+ (id)customAttributes
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"CIAttributeFilterCategories";
  v11[0] = @"CICategoryGenerator";
  v11[1] = @"CICategoryVideo";
  v11[2] = @"CICategoryStillImage";
  v11[3] = @"CICategoryBuiltIn";
  v13[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v13[1] = @"11";
  v12[1] = @"CIAttributeFilterAvailable_iOS";
  v12[2] = @"CIAttributeFilterAvailable_Mac";
  v13[2] = @"10.13";
  v12[3] = @"inputFontName";
  v9 = @"CIAttributeDefault";
  v10 = @"HelveticaNeue";
  v13[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v12[4] = @"inputFontSize";
  v7[0] = @"CIAttributeMin";
  v7[1] = @"CIAttributeSliderMin";
  v8[0] = &unk_1EE4A9FB0;
  v8[1] = &unk_1EE4A9FC0;
  v7[2] = @"CIAttributeSliderMax";
  v7[3] = @"CIAttributeDefault";
  v8[2] = &unk_1EE4A9FD0;
  v8[3] = &unk_1EE4AAF40;
  v7[4] = @"CIAttributeType";
  v8[4] = @"CIAttributeTypeScalar";
  v13[4] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:5];
  v12[5] = @"inputScaleFactor";
  v5[0] = @"CIAttributeMin";
  v5[1] = @"CIAttributeSliderMin";
  v6[0] = &unk_1EE4A9FB0;
  v6[1] = &unk_1EE4A9FE0;
  v5[2] = @"CIAttributeSliderMax";
  v5[3] = @"CIAttributeDefault";
  v6[2] = &unk_1EE4A9FF0;
  v6[3] = &unk_1EE4AAF58;
  v5[4] = @"CIAttributeType";
  v6[4] = @"CIAttributeTypeScalar";
  v13[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
  v12[6] = @"inputPadding";
  v3[0] = @"CIAttributeMin";
  v3[1] = @"CIAttributeSliderMin";
  v4[0] = &unk_1EE4AAF70;
  v4[1] = &unk_1EE4AAF70;
  v3[2] = @"CIAttributeSliderMax";
  v3[3] = @"CIAttributeMax";
  v4[2] = &unk_1EE4AAF88;
  v4[3] = &unk_1EE4AAFA0;
  v3[4] = @"CIAttributeDefault";
  v3[5] = @"CIAttributeType";
  v4[4] = &unk_1EE4AAF70;
  v4[5] = @"CIAttributeTypeInteger";
  v13[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:6];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];
}

- (id)outputImage
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (self->inputText)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = ci_logger_api();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CITextImageGenerator outputImage](v15);
      }
      return 0;
    }
    inputText = self->inputText;
  }
  else
  {
    inputText = 0;
  }
  if (![(NSString *)inputText length]) {
    return 0;
  }
  [(NSNumber *)self->inputScaleFactor floatValue];
  if (v4 <= 0.0) {
    return 0;
  }
  float v5 = v4;
  [(NSNumber *)self->inputPadding floatValue];
  int v7 = v6;
  CFStringRef inputFontName = (const __CFString *)self->inputFontName;
  [(NSNumber *)self->inputFontSize floatValue];
  CTFontRef v10 = CTFontCreateWithName(inputFontName, v9, 0);
  uint64_t v19 = *MEMORY[0x1E4F243F0];
  v20[0] = v10;
  CFAttributedStringRef v11 = CFAttributedStringCreate(0, (CFStringRef)self->inputText, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1]);
  v17[0] = @"kCIImageTextScaleFactor";
  *(float *)&double v12 = v5;
  v17[1] = @"kCIImageTextPadding";
  v18[0] = [NSNumber numberWithFloat:v12];
  LODWORD(v13) = v7;
  v18[1] = [NSNumber numberWithFloat:v13];
  v14 = +[CIImage imageWithAttributedString:format:options:](CIImage, "imageWithAttributedString:format:options:", v11, 260, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2]);
  CFRelease(v11);
  CFRelease(v10);
  return v14;
}

- (NSString)inputText
{
  return self->inputText;
}

- (void)setInputText:(id)a3
{
}

- (NSString)inputFontName
{
  return self->inputFontName;
}

- (void)setInputFontName:(id)a3
{
}

- (NSNumber)inputFontSize
{
  return self->inputFontSize;
}

- (void)setInputFontSize:(id)a3
{
}

- (NSNumber)inputScaleFactor
{
  return self->inputScaleFactor;
}

- (void)setInputScaleFactor:(id)a3
{
}

- (NSNumber)inputPadding
{
  return self->inputPadding;
}

- (void)setInputPadding:(id)a3
{
}

- (void)outputImage
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136446210;
  v2 = "-[CITextImageGenerator outputImage]";
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "%{public}s inputText must be a NSString.", (uint8_t *)&v1, 0xCu);
}

@end